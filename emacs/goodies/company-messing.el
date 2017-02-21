;;; company-messing.el --- company-mode completion backend for SourceKit  -*- lexical-binding: t; -*-

;; mainly serve as a playground for messing-around.

;;; Code:

(defun mess ()
  "Help me mess around."
  (interactive)
  (message "I'm messing around"))

(defconst sample-completions
  '("alan" "john" "ada" "don"))

;;;###autoload
(defun company-messing (command &optional arg &rest ignored)
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-messing))
    (prefix (company-sourcekit--prefix))
    (candidates (company-messing-completion arg))))

(defun company-messing-completion (arg)
  (let ((cmd (list "/tmp/Swifty"
                  (buffer-file-name)
                  (number-to-string (point)))))
    (with-temp-buffer
      (message (mapconcat 'identity cmd " "))
      (call-process-shell-command (mapconcat 'identity cmd " ") nil t)
      (list (buffer-substring (point-min) (point-max))))))

;; shamelessly stealing from @sellout on github
(defun company-sourcekit--prefix ()
  "In our case, the prefix acts as a cache key for company-mode.
It never actually gets sent to the completion engine."
  (and
    (eq major-mode 'swift-mode)
    (not (company-in-string-or-comment))
    (or
      ;; Fetch prefix during import statements:
      ;;
      ;; Given: "import |"
      ;; Prefix: ""
      ;; Offset: 7
      ;;
      ;; Given: "import Found|"
      ;; Prefix: "Found"
      ;; Offset: 7
      (-when-let* ((x (company-grab-symbol-cons "import ")) (_ (listp x))) x)

      ;; Fetch prefix for method calls:
      ;;
      ;; Given: "self.|"
      ;; Prefix: ""
      ;; Offset: 5
      ;;
      ;; Given: "self.hel|"
      ;; Prefix: "hel"
      ;; Offset: 5
      (let ((r (company-grab-symbol-cons "\\.")))
        (when (consp r) r))

      ;; Fetch prefix for function calls:
      ;;
      ;; Given: "CGRect(|)"
      ;; Prefix: ""
      ;; Offset: 7
      ;;
      ;; Given: "CGRect(x:|)"
      ;; Prefix: "x:"
      ;; Offset: 7
      (-if-let (x (company-grab "\_*(\\([\w\_:]*?\\)" 1 (line-beginning-position)))
        (cons x t))

      ;; Fetch prefix for symbols:
      ;;
      ;; Given: "let r = CGRe|"
      ;; Prefix: ""
      ;; Offset: 12
      ;;
      ;; Given: "let r = CGRec|"
      ;; Prefix: ""
      ;; Offset: 13
      (-if-let (x (company-grab-symbol))
        (when (> (length x) 0) (cons "" t))))))

(provide 'company-messing)
