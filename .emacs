(setq user-full-name "Trumae da Ilha")
(setq user-mail-address "trumae@gmail.com")

(require 'cl)
(setq gc-cons-threshold (* 20 1024 1024))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
(setq package-archives ())
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package)
        (package-install 'org-bullets)
        (package-install 'ox-gfm)
        (package-install 'htmlize)
        (package-install 'org)
        (package-install 'magit)
        (package-install 'company)
        (package-install 'go-mode)
        (package-install 'lua-mode)
        (package-install 'dot-mode))

; UTF-8 all the things!
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(setq inhibit-splash-screen t)
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq ring-bell-function 'ignore)
(setq create-lockfiles t)
(setq vc-follow-symlinks t)
(setq message-log-max 10000)
(fset 'yes-or-no-p 'y-or-n-p)

(use-package org-bullets
   :init   (add-hook 'org-mode-hook #'org-bullets-mode))
(use-package ox-gfm)
(use-package htmlize)
(require 'org-mouse)

(use-package org)
(org-babel-do-load-languages
  'org-babel-load-languages
  '(
    (ditaa . t)
    (dot . t)
    (lisp . t)
;    (tcl . t)
;    (emacs-lisp . t)
    (gnuplot . t)
;    (latex . t)
;    (ocaml . nil)
    (python . t)
;    (ruby . t)
;    (sh . t)
    (sqlite . t)))


(use-package magit
     :bind (("C-x g" . magit-status)))

(use-package company
	     :delight
	     :init   (global-company-mode)
	     :config
	     (define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
	     (define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
	     (add-hook 'after-init-hook 'global-company-mode)
	     ;; put most often used completions at stop of list
	     (setq company-transformers '(company-sort-by-occurrence))
	     (setq company-tooltip-limit 30)
	     (setq company-idle-delay .3)
	     (setq company-echo-delay 0))


;(use-package go-mode
;	     :init
;	     :config
;	     (defun my-go-mode-hook ()
;	       (setq gofmt-command "goimports")
;	       (setq godoc-and-godef-command "go doc")
;	       (add-hook 'before-save-hook 'gofmt-before-save)
;	       (if (not (string-match "go" compile-command))
;		 (set (make-local-variable 'compile-command)
;		      "go build -v"))
;	       (company-mode)
;	       (setq tab-width 4)
;	       (message "go-mode: Ya gone and did it now!"))
;	     (add-hook 'go-mode-hook 'my-go-mode-hook)
;	     (add-hook 'before-save-hook 'delete-trailing-whitespace))

(use-package lua-mode
	     :config  (setq lua-indent-level 4))

(use-package dot-mode)

;;;;;;;;;;;;;;;;;;;; SLIME ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(load (expand-file-name "~/quicklisp/slime-helper.el"))
;;;(setq inferior-lisp-program "ccl")
;(setq inferior-lisp-program "sbcl")
;;;(setq inferior-lisp-program "/home/trumae/lisp/ccl/lx86cl64")

;;;;;;;;;;;;;;;;;;;; Org mode - Babel ;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dot-mode lua-mode go-mode company magit org htmlize ox-gfm org-bullets use-package haskell-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
