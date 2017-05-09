(prelude-require-packages '(haskell-mode dante))

(let ((my-cabal-path (expand-file-name "~/.local/bin")))
  (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path)
  ;; nix
  (add-to-list 'exec-path "/run/current-system/sw/bin")
  (add-hook 'haskell-mode-hook 'dante-mode)
  (add-hook 'haskell-mode-hook 'flycheck-mode))

;; stack
;; (custom-set-variables '(haskell-process-type 'stack-ghci))
;; (custom-set-variables '(haskell-process-args-stack-ghci '("--ghc-options=-ferror-spans" "--nix")))

(setq-default flycheck-disabled-checkers '(haskell-stack-ghc))
