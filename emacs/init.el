;; init.el --- Emacs configuration file -*- lexical-binding: t -*-

;; Optimization
;;; Garbage collection & File name handler
(defvar default-file-name-handler-alist file-name-handler-alist)
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6
      file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold 16777216
          gc-cons-percentage 0.1
          file-name-handler-alist default-file-name-handler-alist)))

;;; Inhibit resize frame
(setq frame-inhibit-implied-resize t)



;; Setting
;;; Frame title
(setq frame-title-format "%b [%m]")

;;; Startup screen
(setq inhibit-startup-screen t
      initial-scratch-message nil
      initial-major-mode 'fundamental-mode)
(fset 'display-startup-echo-area-message #'ignore)

;;; Graphical elements 
;;(menu-bar-mode -1)
(when (display-graphic-p)
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
  (tool-bar-mode -1))

;;; Dialog box
(setq use-file-dialog nil
      use-dialog-box nil)

;;; Background color
(set-background-color "AntiqueWhite")

;;; Font


;;; Indentation
(setq-default indent-tabs-mode nil
              tab-width 4)

;;; Directory
(defconst history-dir (concat user-emacs-directory "history/"))
(defconst etc-dir (concat user-emacs-directory "etc/"))
(defconst lisp-dir (concat user-emacs-directory "lisp/"))

;;; Line and column number
(column-number-mode 1)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(defun linum-cycle ()
  (interactive)
  (cond ((not display-line-numbers)
         (setq display-line-numbers t))
        ((equal display-line-numbers t)
         (setq display-line-numbers 'relative))
        ((equal display-line-numbers 'relative)
         (setq display-line-numbers nil))))

(global-set-key (kbd "C-c C-l") #'linum-cycle)