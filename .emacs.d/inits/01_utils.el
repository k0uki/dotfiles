;;;  -*- coding: utf-8; mode: emacs-lisp; -*-
;;; 01_utils.el

;; auto-install
(when (require 'auto-install nil t)
  ;; インストールディレクトリを設定
  (setq auto-install-directory "~/.emacs.d/auto-install/")
  ;; EmacsWikiに登録されているelispの名前を取得
  (auto-install-update-emacswiki-package-name t)
  ;; 関数を利用可能にする
  (auto-install-compatibility-setup))

;; eldoc
(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     (when (require 'eldoc nil t)
	       (setq eldoc-idle-delay 0.2)
	       (setq eldoc-echo-area-use-multiline-p t)
	       (turn-on-eldoc-mode))))

;; undo-tree
;;(install-elisp "http://www.dr-qubit.org/undo-tree/undo-tree.el")
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))


;; linum-mode
;;(install-elisp "http://stud4.tuwien.ac.at/~e0225855/linum/linum.el")
(when (require 'linum nil t)
  (global-linum-mode))

;; anything
;; M-x auto-install-batch  extension_name:anything
(when (require 'anything nil t)
  (setq
   ;; 候補を表示するまでの時間。デフォルトは0.5
   anything-idle-delay 0.3
   ;; タイプ後再描画するまでの時間。デフォルトは0.1
   anything-input-idle-delay 0.2
   ;; 候補が多い場合に体感速度を上げる
   anything-quick-update t
   )
)
(global-set-key (kbd "C-x b") 'anything)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start t)

;; multi-term
;;  (install-elisp "http://www.emacswiki.org/emacs/download/multi-term.el") 
(when (require 'multi-term nil t)
  (setq multi-term-program "/bin/bash")
(global-set-key (kbd "C-c t") '(lambda ()
                                (interactive)
                                (multi-term))))