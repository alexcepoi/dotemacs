;; PERSONAL
(setq user-full-name "Alexandru Cepoi")
(setq user-mail-address "alex.cepoi@gmail.com")

;; LOOK and FEEL
(add-to-list 'default-frame-alist '(font . "Monospace-10"))
(add-to-list 'default-frame-alist '(top . 70))
(add-to-list 'default-frame-alist '(left . 30))
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 150))

(tool-bar-mode -1)
(set-scroll-bar-mode 'right)

(show-paren-mode t)
(setq-default truncate-lines t)
;(setq visual-line-mode t)

;; IDO MODE
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; COMPANY MODE
(add-to-list 'load-path "~/.emacs.d/company")
(autoload 'company-mode "company" nil t)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.5)

;; SEMANTIC
(global-ede-mode 1)
(semantic-mode)

(setq semantic-default-submodes
'(global-semanticdb-minor-mode
global-semantic-idle-scheduler-mode
global-semantic-idle-summary-mode
global-semantic-idle-completions-mode
global-semantic-decoration-mode
global-semantic-highlight-func-mode
global-semantic-stickyfunc-mode))

(defun my-c-mode-cedet-hook ()
 (local-set-key "." 'semantic-complete-self-insert)
 (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; BACKUP OPTIONS
(setq inhibit-splash-screen t)
(setq backup-inhibited t)
(setq auto-save-default nil)

;; COLOR THEME
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-arjen)

;; LINE NUMBERS
;(global-linum-mode 1)
;(setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) (concat " %" (number-to-string w) "d  ")) line) 'face 'linum)))

;; YASNIPPET
;(yas/initialize)
;(yas/load-directory "/usr/share/emacs/etc/yasnippet/snippets")

;; INDENTATION OPTIONS
;(setq-default intent-tabs-mode t)
;(setq-default tab-width 4)
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t)
(setq-default backward-delete-char-untabify-method 'nill)
(global-set-key (kbd "RET") 'newline-and-indent)

(setq-default c-basic-offset 4)
(setq-default c-default-style "bsd")
(add-hook 'c-mode-common-hook '(lambda() (setq tab-width 4)))

;(setq ruby-indent-tabs-mode t)
;(require 'ruby-electric)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(mode-line ((((class color) (min-colors 88)) (:background "grey80" :foreground "black" :box (:line-width -1 :color "blue")))))
 '(mode-line-buffer-id ((t (:foreground "red3"))))
 '(mode-line-highlight ((((class color) (min-colors 88)) nil)))
 '(mode-line-inactive ((default (:inherit mode-line)) (((class color) (min-colors 88) (background light)) (:background "grey90" :foreground "grey20" :box (:line-width -1 :color "grey75") :weight light)))))
