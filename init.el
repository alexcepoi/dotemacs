;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;; (_)___|_| |_| |_|\__,_|\___|___/
;;
;;     "While any text editor can save your files, only Emacs can save your
;;     soul."
;;                                                         [Per Abrahamsen]

;; PERSONAL
(setq user-full-name "Alexandru Cepoi")
(setq user-mail-address "alex.cepoi@gmail.com")

;; LOOK and FEEL
(add-to-list 'default-frame-alist '(font . "Monospace-10"))
;;(add-to-list 'default-frame-alist '(top . 70))
;;(add-to-list 'default-frame-alist '(left . 30))
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 140))

(tool-bar-mode -1)
(set-scroll-bar-mode 'right)

(show-paren-mode t)
(setq-default truncate-lines t)
(setq visual-line-mode t)

(setq max-mini-window-height 1)
(setq enable-local-variables :safe)

(add-to-list 'load-path "~/.emacs.d/plugins")

;; COLOR THEME
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
(require 'color-theme)
(color-theme-initialize)

(add-to-list 'load-path "~/.emacs.d/themes")
;;(require 'railscasts)
;;(color-theme-railscasts)

(set-cursor-color "gray30")
(set-face-attribute 'mode-line nil
		    :box '(:line-width -1 :color "grey40")
		    :background "grey80"
		    :foreground "grey20")

(set-face-attribute 'mode-line-highlight nil
		    :box 'nil
		    :background "grey60")

(set-face-attribute 'mode-line-buffer-id nil
		    :weight 'light
		    :background "grey80"
		    :foreground "red3")

(setq ansi-term-color-vector
[unspecified "#000000" "#963F3C" "#5FFB65" "#FFFD65"
"#0082FF" "#FF2180" "#57DCDB" "#FFFFFF"])

;;(setq ansi-term-color-vector
;;[unspecified "#2E3436" "#CC0000" "#4E9A06" "#C4A000"
;;"#3465A4" "#75507B" "#06989A" "#D3D7CF"
;;"#555753" "#EF2929" "#8AE234" "#FCE94F"
;;"#729FCF" "#AD7FA8" "#34E2E2" "#EEEEEC"])

;; BACKUP OPTIONS
(setq inhibit-splash-screen t)
(setq backup-inhibited t)
(setq auto-save-default nil)

;; BUFFERS
;;(global-set-key (kbd "C-x C-b") 'ibuffer)
(defalias 'list-buffers 'ibuffer)
(setq ibuffer-expert t)
;;(setq ibuffer-default-sorting-mode 'major-mode)

(add-hook 'ibuffer-mode-hook
  '(lambda () (ibuffer-auto-mode 1)))

;; SCROLLING
(require 'smooth-scrolling)
(setq smooth-scroll-margin 5)

;; LINE NUMBERS
(setq linum-format "%4d")
(setq column-number-mode t)
(setq fill-column 100)

;; IDO MODE
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

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

;; YASNIPPET
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;; MODE COMPILE
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key [f9] 'mode-compile)

(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key [C-f9] 'mode-compile-kill)

;; INDENTATION OPTIONS
;;(setq-default intent-tabs-mode t)
;;(setq-default tab-width 4)
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t)
(setq-default backward-delete-char-untabify-method 'nill)
(global-set-key (kbd "RET") 'newline-and-indent)

;;(setq-default c-basic-offset 4)
(setq-default c-default-style "bsd")
;;(add-hook 'c-mode-common-hook '(lambda() (setq tab-width 4)))

;; SHEBANG
(add-to-list 'interpreter-mode-alist '("ruby1.9" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("python2.6" . python-mode))

;; LATEX
(add-hook 'LaTeX-mode-hook (lambda()
 (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
 (setq TeX-command-default "XeLaTeX")
 (setq TeX-save-query nil)
 (setq TeX-show-compilation t)))
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'company-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

(setq TeX-PDF-mode t)
(defun pdfevince ()
     (add-to-list 'TeX-output-view-style (quote ("^pdf$" "." "evince %o %(outpage)"))))
(add-hook  'LaTeX-mode-hook  'pdfevince  t)

;; PYTHON OPTIONS
;; (requires pymacs to be installed)
(require 'pymacs)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

(setq pymacs-load-path '( "~/.emacs.d/python/rope"
                          "~/.emacs.d/python/ropemode"
                          "~/.emacs.d/python/ropemacs"))

(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport 't)

(defun my-python-mode-hook ()
 (setq indent-tabs-mode t)
 (setq python-indent 4)
 (setq tab-width 4))
(add-hook 'python-mode-hook 'my-python-mode-hook)

;; RUBY OPTIONS
(add-to-list 'load-path "~/.emacs.d/ruby/rinari")
(require 'rinari)
(require 'haml-mode)
(require 'sass-mode)

(define-key ruby-mode-map (kbd "TAB") nil)
(defun my-ruby-mode-hook ()
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

;; ECB
(add-to-list 'load-path "~/.emacs.d/plugins/ecb")

;; This doesn't work unless set as a custom variable
;;(setq ecb-options-version "2.40")

(setq ecb-auto-activate t)
(setq ecb-tip-of-the-day nil)

(setq ecb-create-layout-file "~/.emacs.d/ecb-user-layouts.el")
;;(setq ecb-layout-name "leftright-custom")
(setq ecb-layout-name "left13")
(setq ecb-fix-window-size (quote width))
(setq ecb-windows-width 30)
(setq ecb-show-sources-in-directories-buffer (quote ("left7" "left13" "left14" "left15" "leftright-custom")))

;; This is better set as a custom variable
;;(setq ecb-source-path (quote (("~/work" "work") ("~/.emacs.d" ".emacs.d"))))

(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
(setq ecb-basic-buffer-sync-delay 0.5)
(setq ecb-analyse-buffer-sync-delay 0.5)

(require 'ecb)
(set-face-attribute 'ecb-default-highlight-face nil
		    :background "sienna")

;; COMPANY MODE
(add-to-list 'load-path "~/.emacs.d/plugins/company")
(autoload 'company-mode "company" nil t)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.5)

;; COMMON HOOKS
(dolist (hook (list
	       'emacs-lisp-mode-hook
	       'lisp-mode-hook
	       'lisp-interaction-mode-hook
	       'scheme-mode-hook
	       'c-mode-hook
	       'c++-mode-hook
	       'java-mode-hook
	       'python-mode-hook
	       'ruby-mode-hook
	       'haskell-mode-hook
	       'asm-mode-hook
	       'emms-tag-editor-mode-hook
	       'sh-mode-hook
	       ))
  ;;(add-hook hook 'linum-mode)
  ;;(add-hook hook 'hl-line-mode)
  (add-hook hook 'company-mode))

;; GUI OPTIONS
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("~/work" "work") ("~/.emacs.d" ".emacs.d")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)
