;; ELPA
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ))

;; Yasippet
(require 'yasnippet)
;; (setq yas-snippet-dirs (append yas-snippet-dirs
;; 			  '("~/.emacs.d/emacs-config/snippets")))
(yas/global-mode 1)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; magit

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.ctp?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))

;; my config
(load-file "~/.emacs.d/emacs-config/rchen.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(menu-bar-mode t)
 '(ns-pop-up-frames nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; global key
(global-set-key (kbd "M-g") 'magit-status) ;; magit
(global-set-key [C-f7] 'toggle-frame-fullscreen) ;; fullscreen
(global-set-key (kbd "M-SPC") 'set-mark-command) ;; mark command
;; '(c-basic-offset 4)

;; virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/.virtualenvs")

(add-to-list 'exec-path "/usr/local/bin")
(setq css-indent-offset 2)
