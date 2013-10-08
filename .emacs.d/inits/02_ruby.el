;;;  -*- coding: utf-8; mode: emacs-lisp; -*-
;;; 02_ruby.el
;;; ruby関連

(add-to-list 'auto-mode-alist '("[Rr]akefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("[Gg]emfile" . ruby-mode))
 


;;;  Setting for rails 
;;================================
;; http://d.hatena.ne.jp/willnet/20090110/1231595231

;; Interactively Do Things (highly recommended, bu not strictly required)
;; なんか気持ち悪かったので封印 
;;(when (require 'ido nil t)
;;  (ido-mode t))

;; Rinari
(when (require 'rinari nil t)
  ;;何かあればここ
  )

;; rhtml-mode
(when (require 'rhtml-mode nil t))

;; coffee-mode
(when (require 'coffee-mode nil t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

;; cucumber
(require 'feature-mode)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$\\|\\.yaml$" . yaml-mode))

(require 'slim-mode)

