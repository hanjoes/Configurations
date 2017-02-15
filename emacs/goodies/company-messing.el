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
    (prefix (and (eq major-mode 'swift-mode)
                 (company-grab-symbol)))
    (candidates (when (equal arg "bar")
                  (list "bara" "barb")))))

;; (length (shell-command-to-string "sourcekitten complete --spm-module SmalltalkSwiftFramework --file ~/Documents/github/hanjoes/smalltalk-swift/smalltalk-swift/Sources/SmalltalkSwiftFramework/vm/Bytecode.swift --offset 6913"))

(provide 'company-messing)
