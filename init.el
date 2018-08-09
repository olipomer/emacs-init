(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;HTTPS Only
(setq network-security-level 'high)

;disable backup
(setq backup-inhibited t)

;disable auto save
(setq auto-save-default nil)

;disable menu bar
(menu-bar-mode -1)

;disable toolbar
(tool-bar-mode -1)

;disable scroll bar
(scroll-bar-mode -1)

;;tab completion when opening files
(ido-mode t)

;show column number in mode bar
(column-number-mode)
(line-number-mode)

;highlight parenthesis
(show-paren-mode)

;use shift+arrow keys to change windows
(windmove-default-keybindings)

;; Turn off tabs (Spaces Only)
(setq c-basic-indent 2)
(setq tab-width 2)
(setq-default indent-tabs-mode nil)

; Add web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq auto-mode-alist (cons '("\\.php$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.js$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.css$" . web-mode) auto-mode-alist))

; Kill region with C+k instead of C+w, disable C+w
(defun kill-line-or-region ()
  "kill region if active only or kill line normally"
  (interactive)
  (if (region-active-p)
      (call-interactively 'kill-region)
    (call-interactively 'kill-line)))

(global-set-key (kbd "C-k") 'kill-line-or-region)

(dolist (key '("\C-w"))
    (global-unset-key key))

; Turn on Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes
   (quote
    ("59171e7f5270c0f8c28721bb96ae56d35f38a0d86da35eab4001aebbd99271a8" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
