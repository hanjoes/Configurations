(message "hello")

(defun initialize-my-packages ()
  (setq package-list '(evil))
  (setq package-archives '(("melpa" . "http://melpa.org/packages/")))
  (package-initialize)
  (unless package-archive-contents
	(package-refresh-contents))
  (dolist (package package-list)
	(unless (package-installed-p package)
      (package-install package))))
