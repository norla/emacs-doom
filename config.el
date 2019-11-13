;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq projectile-project-search-path '("~/projects/"))
(exec-path-from-shell-initialize)
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
