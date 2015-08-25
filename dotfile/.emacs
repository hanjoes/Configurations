; package initialize
(package-initialize)

; org-mode auto closing with date
(setq org-log-done 'time)

; tab
(setq-default indent-tabs-mode nil)

; irony-mode
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'company-mode)

; replace the 'completion-at-point-' and 'complete-symbol' bindings in
; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

; tabs
(setq-default c-basic-offset 4)

; gdb multiple window & PATH
(setq gdb-many-windows t gdb-show-main t)
; (setq gud-gdb-command-name "/usr/local/bin/gdb")

; flymake
; (add-hook 'find-file-hook 'flymake-find-file-hook)
; global company-mode
; (add-hook 'after-init-hook 'global-company-mode)

; start yasnippet when emacs starts
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20150415.244")
(require 'yasnippet)
(yas-global-mode 1)

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

; initialize auto-complete-c-headers and gets called for c/c++ files
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
; call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

; start flymake-google-cpplint-load
;(defun my:flymake-google-init ()
;  (require 'flymake-google-cpplint)
;  (custom-set-variables
;   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
;  (flymake-google-cpplint-load)
;  )
;(add-hook 'c++-mode-hook 'my:flymake-google-init)
;(add-hook 'c-mode-hook 'my:flymake-google-init)

; start google-c-style with emacs
;(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

; turn on semantic mode-name
(semantic-mode 1)

; add semantic as a suggestion 
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

; turn scheduler mode on
(global-semantic-idle-scheduler-mode 1)

; auto-fill minor mode for text files
(add-hook 'text-mode-hook 'turn-on-auto-fill)

; theme
; (load-theme 'solarized-light' t)
;(add-hook 'after-make-frame-functions
;          (lambda (frame)
;            (let ((mode (if (display-graphic-p frame) 'light 'dark)))
;              (set-frame-parameter frame 'background-mode mode)
;              (set-terminal-parameter frame 'background-mode mode))
;            (enable-theme 'solarized))

; start-server
(server-start)
