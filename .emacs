;; ELPA
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ))

;; Yasippet
(require 'yasnippet)
(setq yas-snippet-dirs (append yas-snippet-dirs
			  '("~/.emacs.d/emacs-config/snippets")))
(yas/global-mode 1)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

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

;; (add-to-list 'exec-path "/usr/local/bin")
;; ctags

;; customized 
(setq css-indent-offset 2)

;; ac-etags  
(custom-set-variables
 '(ac-etags-requires 1))
(eval-after-load "etags"
  '(progn
    (ac-etags-setup)))

(add-hook 'c-mode-common-hook 'ac-etags-ac-setup)

;; python 
;; 
(require 'python-mode)
(require 'ipython)
;; ipython 
(defvar server-buffer-clients)
(when (and (fboundp 'server-start) (string-equal (getenv "TERM") 'xterm))
  (server-start)
  (defun fp-kill-server-with-buffer-routine ()
    (and server-buffer-clients (server-done)))
  (add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))

;; magit
;; ediff
(load-library "ediff")
(add-hook 'ediff-quit-hook 'kill-buffer)
(setq-default c-basic-offset 4)

;; http://web-mode.org
;; indent
(defun my-web-mode-hook ()
  "Hooks for web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook 'my-web-mode-hook)
