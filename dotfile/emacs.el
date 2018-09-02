(load "~/Configurations/dotfile/package-sync")
(initialize-my-packages)

;; ========= E n v i r o n m e n t =========

(global-linum-mode 1)

;; package manager

;; better UI
(if (display-graphic-p)
    (progn (menu-bar-mode -1)
	   (tool-bar-mode -1)
	   (scroll-bar-mode -1)
	   (horizontal-scroll-bar-mode -1)))

;; tab settings
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

;; ========= M o d e s =========
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; evil mode configs
(require 'evil)
(evil-mode 1)

;; save
(desktop-save-mode 1)
(savehist-mode 1)

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

;; ========= K e y  B i n d i n g s =========
;; For evil mode
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "M-.") nil)

;; ========= L A N G U A G E S =========
;; python
(package-initialize)
(elpy-enable)
(setq elpy-rpc-backend "jedi")

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

;; golang
(setq gofmt-command "goimports")
(add-hook 'before-save-hook #'gofmt-before-save)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;; ========= G e n e r a t e d =========
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 140 :family "Source Code Pro for Powerline")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" default))))


;; ========= A p p e a r a n c e =========
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(if (display-graphic-p)
	(load-theme 'spolsky))
