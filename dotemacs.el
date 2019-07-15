;; Theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages (quote (omnisharp rust-mode forth-mode smex slime geiser))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; calc-func
(require 'calc)

;; MELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize))

;; ido
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


;; default-tweaks
(tool-bar-mode 0)
(electric-pair-mode 1)
(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)
;(setq inhibit-startup-echo-area-message t)
;(global-set-key (kbd "C-z") 'undo)

;; C-Style
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)
;(setq tab-stop-list (number-sequence 4 200 4))
(setq c-default-style '((java-mode . "java")
                        (awk-mode . "awk")
                        (other . "user")))

;; Python3 interpreter
(setq python-shell-interpreter "/usr/bin/python3")

;; Common Lisp
(setq inferior-lisp-program (executable-find "sbcl"))
(setq slime-contribs '(slime-fancy))

;; Scheme/Geiser
(setq geiser-active-implementations '(guile))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; TidalCycles
(add-to-list 'load-path "~/.emacs.d/tidal/")
(require 'haskell-mode)
(require 'tidal)

;; Lua
;;(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;;(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
;;(add-to-list 'interpreter-mode-alist '("lua5.3" . lua-mode))
(setq lua-default-application (executable-find "lua5.3"))
(defun my-lua-hook ()
  (progn
    (local-set-key (kbd "C-;") 'lua-send-current-line)
    (local-set-key (kbd "C-:") 'lua-send-region)
    (local-set-key (kbd "C-,") 'lua-send-defun)
  )
)
(add-hook 'lua-mode-hook 'my-lua-hook)
(put 'dired-find-alternate-file 'disabled nil)

;; w3m
(setq w3m-search-default-engine "duckduckgo")
;(require 'w3m-load)
;(require 'mime-w3m)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'flycheck-mode)

;; C# (https://joshwolfe.ca/post/emacs-for-csharp/)
(setq omnisharp-server-executable-path "~/.emacs.d/omnisharp-linux-x64/run")
(use-package omnisharp
  :after company
  :config
  (add-hook 'csharp-mode-hook 'omnisharp-mode)
  (add-to-list 'company-backends 'company-omnisharp))
(define-key omnisharp-mode-map (kbd ".") 'omnisharp-add-dot-and-auto-complete)
(define-key omnisharp-mode-map (kbd "<C-SPC>") 'omnisharp-auto-complete)

;;; .emacs ends here
