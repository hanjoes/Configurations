;; ========= E n v i r o n m e n t =========
;; PATH
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setenv "GOPATH" (concat "/Users/hanzhos/workspace/HanjoesPlayground/build/HanjoesTestGoPackage/HanjoesTestGoPackage-1.0/RHEL5_64/DEV.STD.PTHREAD/build/private/tmp/brazil-path/testrun.runtimefarm/gopath/:/Users/hanzhos/workspace/HanjoesPlayground/src/HanjoesTestGoPackage/" (getenv "OPATH")))

(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/go/bin/")

(global-linum-mode 1)

;; package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; better UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)

;; tab is always 4 character-long
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
(add-hook 'before-save-hook #'gofmt-before-save)

;; ========= T H E M E S =========
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (brin)))
 '(custom-safe-themes
   (quote
	("9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2b303b" :foreground "#c0c5ce" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Source Code Pro for Powerline")))))
