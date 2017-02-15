;; PATH
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

;; custom key bindings
(global-set-key (kbd "C-c C-n C-t") 'neotree-toggle) ; toggle neotree

;; package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; initialization stuff
(global-linum-mode 1)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; font size
(set-face-attribute 'default (selected-frame) :height 140)

;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; blank mode
(require 'blank-mode)
(global-blank-mode 1)

;; highlight the current line
(require 'hlinum)
(hlinum-activate)

;; company mode
(require 'company)
(eval-after-load 'company
  '(add-to-list 'company-backends '(company-ghc :with company-tern)))

;; show paren mode (display parentheses)
(show-paren-mode t)

;; swift mode
(add-hook 'swift-mode-hook (lambda() (setq indent-tabs-mode t)))

;; company sourcekit (for swift)
;; (require 'company-sourcekit)
;; (add-to-list 'company-backends 'company-sourcekit)
;; (setq sourcekit-sourcekittendaemon-executable "/usr/local/bin/sourcekittendaemon"
;;       sourcekit-verbose nil)

;; solarized theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

;; yasnippet
;; (add-to-list 'load-path
;;              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; evil mode configs
(require 'evil)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(evil-mode 1)

;; Tern setup
(add-to-list 'load-path "/usr/local/lib/node_modules/tern/emacs/")
(add-hook 'js-mode-hook (lambda () (tern-mode t)))

;; NeoTree
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; enable js2-mode by default (or it will be js-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blank-chars
   (quote
    (tabs space-before-tab indentation space-after-tab spaces)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(indent-tabs-mode nil)
 '(magit-diff-use-overlays nil)
 '(markdown-command "/usr/local/bin/markdown")
 '(neo-click-changes-root nil)
 '(neo-create-file-auto-open t)
 '(neo-theme (quote classic))
 '(neo-window-fixed-size t)
 '(neo-window-width 35)
 '(shell-file-name "/bin/bash")
 '(solarized-scale-org-headlines nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blank-empty ((t (:foreground "gray20"))))
 '(blank-hspace ((t (:foreground "gray20"))))
 '(blank-indentation ((t (:foreground "gray20"))))
 '(blank-space ((t (:foreground "gray20"))))
 '(blank-space-after-tab ((t (:foreground "gray20"))))
 '(blank-tab ((t (:foreground "gray20")))))

;; add my goodies.
;; putting at the end so it can override everything (possibily?)
(add-to-list 'load-path "~/Configurations/emacs/goodies/")
(require 'company-messing)
(add-to-list 'company-backends 'company-messing)
