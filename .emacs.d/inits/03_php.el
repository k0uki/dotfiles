;;;  -*- coding: utf-8; mode: emacs-lisp; -*-
;;; 03_php.el
;;; php関連

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

;;;  Setting for CakePHP
;;================================

;; Cake1系
(when (require 'cake nil t)
  (cake-set-default-keymap)
  (global-cake t))

;; Cake2系
(when (require 'cake2 nil t)
  (cake2-set-default-keymap)
  (global-cake2 -1))

;; emacs-cakeを切り替えるコマンドを定義
(defun toggle-emacs-cake ()
  "emacs-cakeとemacs-cake2を切り替える"
  (interactive)
  (cond ((eq cake2 t) ; cake2がonなら
	 (cake2 -1) ; cake2をoffにして
	 (cake t))
	((eq cake t) ; cakeがonなら
	 (cake -1) ; cakeをoffにして
	 (cake2 t))
	(t nil))) ; どちらもoffならなにもしない

;; C-c tにtoggle-emacs-cakeを割り当て
(define-key cake-key-map (kbd "C-c t") 'toggle-emacs-cake)
(define-key cake2-key-map (kbd "C-c t") 'toggle-emacs-cake)

;; auto-complete, ac-cake, ac-cake2の読み込みをチェック
(when (and (require 'auto-complete nil t)
	   (require 'ac-cake nil t)
	   (require 'ac-cake2 nil t))
  ;; ac-cake用の関数定義
  (defun ac-cake-hook()
    (make-variable-buffer-local 'ac-sources)
    (add-to-list 'ac-source 'ac-source-cake)
    (add-to-list 'ac-source 'ac-source-cake2))
  ;; php-mode-hookにac-cake用の関数を追加
  (add-hook 'php-mode-hook 'ac-cake-hook))