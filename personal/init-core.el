(prelude-require-package 'xclip)
(xclip-mode 1)
(prelude-require-package 'edit-server)
(setq edit-server-new-frame nil)
(edit-server-start)
(if (display-graphic-p)
  (progn
    (setq frame-resize-pixelwise t)))

;; magit
(setq magit-last-seen-setup-instructions "1.4.0")
