;; PATH
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/go/bin/")

;; custom key bindings
(global-set-key (kbd "C-c C-n C-t") 'neotree-toggle) ; toggle neotree

;; save
(desktop-save-mode 1)
(savehist-mode 1)

;; package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; initialization stuff
(global-linum-mode 1)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; display stuff
(set-face-attribute 'default (selected-frame) :height 140)
(setq-default tab-width 4)

;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; highlight the current line
(require 'hlinum)
(hlinum-activate)

;; company mode
(require 'company)
(eval-after-load 'company
  '(add-to-list 'company-backends '(company-ghc :with company-tern)))

;; show paren mode (display parentheses)
(show-paren-mode t)

;; octave
(require 'ac-octave)
(add-hook 'octave-mode-hook
          '(lambda () (ac-octave-setup)))

(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))

;; evil mode configs
(require 'evil)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(evil-mode 1)

;; golang
(add-hook 'before-save-hook #'gofmt-before-save)

;; ========= T H E M E S =========
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'brin t)
