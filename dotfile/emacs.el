;; PATH
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

;; package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; initialization stuff
(global-linum-mode 1)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'neotree)

;; highlight the current line
(require 'hlinum)
(hlinum-activate)

;; company mode
(require 'company)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-tern))

;; evil mode configs
(require 'evil)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(evil-mode 1)

;; tern setup
(add-to-list 'load-path "/usr/local/lib/node_modules/tern/emacs/")
(add-hook 'js-mode-hook (lambda () (tern-mode t)))

;; enable js2-mode by default (or it will be js-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(neo-click-changes-root nil)
 '(neo-create-file-auto-open t)
 '(neo-theme (quote classic))
 '(neo-window-fixed-size t)
 '(neo-window-width 35)
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Menlo")))))
