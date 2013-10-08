;;;  -*- coding: utf-8; mode: emacs-lisp; -*-
;;; 00_env.el

;; Windowサイズ、カラーの調整
(if window-system (progn
		    (setq initial-frame-alist '((top . 0)(left . 10)(width . 150) (height . 45)))
		    (set-foreground-color "black")
		    (set-background-color "azure1")
		    (set-cursor-color "RoyalBlue4")
))

;; Macのキーバインドを使う。optionをメタキーにする。
;(mac-key-mode 1)
(setq mac-option-modifier 'meta)

;; シフト + 矢印で範囲選択
(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)

;; フォント設定
(create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
(set-fontset-font "fontset-menlokakugo" 'unicode (font-spec :family "Hiragino Kaku Gothic ProN" ) nil 'append)
(add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
(setq face-font-rescale-alist '((".*Hiragino.*" . 1.2) (".*Menlo.*" . 1.0)))

;; スタートアップ非表示
(setq inhibit-startup-screen t)

;; ツールバー非表示
;;(tool-bar-mode 0)

;; ファイルのフルパスをタイトルバーに表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; バックアップファイルは作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;; 折り返ししない
(setq-default truncate-lines t)

;; "m-k"でカレントバッファを閉じる。初期値はkill sentence
(define-key global-map(kbd "M-k") 'kill-this-buffer)

;; 矩形編集(cua-mode)
(cua-mode t)
(setq cua-enable-cua-keys nil) ; cuaキーバインドを無効