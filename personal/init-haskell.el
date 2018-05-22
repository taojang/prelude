;(prelude-require-packages '(use-package haskell-mode dante))
(prelude-require-packages '(haskell-mode w3m))



(eval-after-load 'haskell-mode
  '(progn
     (require 'w3m-haddock)
     (let ((my-cabal-path (expand-file-name "~/.local/bin")))
       (setenv "PATH" (concat my-cabal-path
                              path-separator
                              (getenv "PATH")))
       (add-to-list 'exec-path my-cabal-path)
       ;; nix
       (add-to-list 'exec-path "/run/current-system/sw/bin"))

     ;; (use-package dante
     ;;              :ensure t
     ;;              :after haskell-mode
     ;;              :commands 'dante-mode
     ;;              :bind (("C-c h" . haskell-hoogle))
     ;;              :init
     ;;              (add-hook 'haskell-mode-hook 'dante-mode)
     ;;              (add-hook 'haskell-mode-hook 'flycheck-mode)
     ;;              (add-hook 'haskell-mode-hook 'company-mode)
     ;;              (setq haskell-stylish-on-save t))

     (custom-set-variables '(haskell-process-type 'auto))

     (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
     (add-hook 'w3m-display-hook 'w3m-haddock-display)

     (setq-default flycheck-disabled-checkers '(haskell-stack-ghc))

     (setq haskell-stylish-on-save t)

     (setq w3m-mode-map (make-sparse-keymap))

     (define-key w3m-mode-map (kbd "RET") 'w3m-view-this-url)
     (define-key w3m-mode-map (kbd "q") 'bury-buffer)
     (define-key w3m-mode-map (kbd "<mouse-1>") 'w3m-maybe-url)
     (define-key w3m-mode-map [f5] 'w3m-reload-this-page)
     (define-key w3m-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)
     (define-key w3m-mode-map (kbd "M-<left>") 'w3m-view-previous-page)
     (define-key w3m-mode-map (kbd "M-<right>") 'w3m-view-next-page)
     (define-key w3m-mode-map (kbd "M-.") 'w3m-haddock-find-tag)

     (defun w3m-maybe-url ()
       (interactive)
       (if (or (equal '(w3m-anchor) (get-text-property (point) 'face))
               (equal '(w3m-arrived-anchor) (get-text-property (point) 'face)))
           (w3m-view-this-url)))

     (define-key haskell-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)

     )
  )
