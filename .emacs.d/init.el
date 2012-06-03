;; ****************
;; init.el
;; ****************

;; ===============
;; load-path
;; ===============

;; Emacs 22 以下用に user-emacs-directory を定義
;; Emacs 23.1 以上では用意されている
;;
(unless (boundp 'user-emacs-directory)
  (defvar user-emacs-directory (expand-file-name "~/.emacs.d/")))

;; load-pathを追加する関数を定義(add-to-load-path)
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; elispとconfディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "elisp" "public_repos" "inits" "auto-install")

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")