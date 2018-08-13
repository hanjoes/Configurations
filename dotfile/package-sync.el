(message "hello")

(defun initialize-my-packages ()
  (setq package-list '(evil company yaml-mode hlinum elpy ac-octave sublime-themes))
  (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                           ("marmalade" . "https://marmalade-repo.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  (unless package-archive-contents
	(package-refresh-contents))
  (dolist (package package-list)
	(unless (package-installed-p package)
      (package-install package))))
