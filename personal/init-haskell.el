;(prelude-require-packages '(use-package haskell-mode dante))
(prelude-require-packages '(haskell-mode))

(let ((my-cabal-path (expand-file-name "~/.local/bin")))
  (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path)
  ;; nix
  (add-to-list 'exec-path "/run/current-system/sw/bin"))

;; (use-package dante
;;              :ensure t
;;              :after haskell-mode
;;              :commands 'dante-mode
;;              :init
;;              (add-hook 'haskell-mode-hook 'dante-mode)
;;              (add-hook 'haskell-mode-hook 'flycheck-mode))

;; stack , move to dir-locals latter
(custom-set-variables '(haskell-process-type 'stack-ghci))
(custom-set-variables '(haskell-process-args-stack-ghci '("--ghc-options=-ferror-spans")))
(custom-set-variables '(haskell-process-args-ghci '("--nix" "--system-ghc")))

(setq-default flycheck-disabled-checkers '(haskell-stack-ghc))
