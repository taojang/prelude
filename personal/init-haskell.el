(prelude-require-packages '(use-package haskell-mode dante))
;(prelude-require-packages '(haskell-mode))

(let ((my-cabal-path (expand-file-name "~/.local/bin")))
      (setenv "PATH" (concat my-cabal-path
                             path-separator
                             (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path)
  ;; nix
  (add-to-list 'exec-path "/run/current-system/sw/bin"))

(use-package dante
             :ensure t
             :after haskell-mode
             :commands 'dante-mode
             :bind (("C-c h" . haskell-hoogle))
             :init
             (add-hook 'haskell-mode-hook 'dante-mode)
             (add-hook 'haskell-mode-hook 'flycheck-mode)
             (add-hook 'haskell-mode-hook 'company-mode))

;; stack , move to dir-locals latter
(custom-set-variables '(haskell-process-type 'cabal-repl))
(custom-set-variables '(haskell-process-args-stack-ghci '("--nix" "--system-ghc" "--ghc-options=-ferror-spans")))

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(setq-default flycheck-disabled-checkers '(haskell-stack-ghc))

(define-key interactive-haskell-mode-map (kbd "M-.") 'haskell-mode-goto-loc)
(define-key interactive-haskell-mode-map (kbd "C-c C-t") 'haskell-mode-show-type-at)
