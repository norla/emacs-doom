;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq projectile-project-search-path '("~/projects/"))
(setq projectile-enable-caching nil)
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-envs
 '("PATH"))
;; (add-to-list 'exec-path "~/.nvm/versions/node/v10.13.0/bin")
                                        ;(setq exec-path (prepend exec-path '("~/.nvm/versions/node/v10.13.0/bin")))
                                        ;(add-hook 'focus-out-hook 'projectile-save-project-buffers)
(focus-autosave-mode)
(setq doom-modeline-evil-insert-state t)
(setq doom-modeline-indent-info nil)
(setq doom-modeline-enable-word-count nil)
                                        ;(setq doom-modeline-height 5)
(unless (display-graphic-p)
  (terminal-focus-reporting-mode))
;; This variable is borken outside the terminal if you have different
;; keyboard layout and input language which causes problems with projectile.
(setenv "LANG" "sv_SE.UTF-8")

;; Refresh magit after save
(add-hook 'after-save-hook 'magit-after-save-refresh-status t)
(setq magit-save-repository-buffers t)
(setq magit-list-refs-sortby "creeatordate")

(global-evil-surround-mode 1)
(setq-default evil-escape-key-sequence "kj")
(global-evil-quickscope-always-mode 1)
(evil-snipe-override-mode 1)
(setq evil-snipe-override-evil-repeat-keys t)
(setq evil-snipe-repeat-keys t)
;;(setq global-display-line-numbers-mode t)
(setq-default display-line-numbers-type 'relative)
(map! :leader
      :desc "Format buffer" "c f" #'format-all-buffer)
(define-key evil-normal-state-map (kbd "v") #'er/expand-region)
