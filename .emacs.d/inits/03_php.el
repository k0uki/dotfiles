;;;  -*- coding: utf-8; mode: emacs-lisp; -*-
;;; 03_php.el
;;; php関連

;;;  Setting for CakePHP
;;================================
;cake.el動かず。。
;(add-to-list 'load-path "~/.emacs.d/elisp/cake")
;(when (require 'cake nil t)
;  ;;何かあればここ
;)
;;(add-to-list 'auto-mode-alist '("\\.ctp$" . php-mode))
(require 'php-mode)
;; php-completion
;; auto-install-from-emacswiki php-completion
(add-hook 'php-mode-hook
         (lambda ()
             (require 'php-completion)
             (php-completion-mode t)
             (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
	     (define-key php-mode-map [(C -)] [(-)(>)])
             (when (require 'auto-complete nil t)
             (make-variable-buffer-local 'ac-sources)
             (add-to-list 'ac-sources 'ac-source-php-completion)
             (auto-complete-mode t)
	     ;; インデントはcake標準に合わせる
	     (setq tab-width 8)
	     (setq indent-tabs-mode t)
	     (setq c-basic-offset 8)
	     (setq c-hanging-comment-ender-p nil)
	     )))

;; mmm-mode(php-html)
;;;; mmm-mode
;(require 'mmm-mode)
;(require 'mmm-sample)
(when (require 'mmm-auto nil t)
  (setq mmm-submode-decoration-level 2)
  (invert-face 'mmm-default-submode-face t)
  (setq mmm-font-lock-available-p t)
  (setq mmm-global-mode 'maybe)
					; (set-face-bold-p 'mmm-default-submode-face t)
  (set-face-background 'mmm-default-submode-face nil)
  (mmm-add-mode-ext-class nil "\\.ctp?\\'" 'html-php)
  (mmm-add-classes
   '((html-php
      :submode php-mode
      :front "<\\?\\(php\\)?"
      :back "\\?>")))
  (add-to-list 'auto-mode-alist '("\\.ctp?\\'" . html-mode))
  (defun save-mmm-c-locals ()
    (with-temp-buffer
      (php-mode)
      (dolist (v (buffer-local-variables))
	(when (string-match "\\`c-" (symbol-name (car v)))
	  (add-to-list 'mmm-save-local-variables `(,(car v) nil, mmm-c-derived-modes))))))
  (save-mmm-c-locals)
  )