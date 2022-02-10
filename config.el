;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq projectile-project-search-path '("~/projects/"))
(setq projectile-enable-caching nil)
;; (exec-path-from-shell-initialize)
;; (exec-path-from-shell-copy-envs
;; '("PATH"))
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
;;(add-hook 'after-save-hook 'magit-after-save-refresh-status t)
(setq magit-save-repository-buffers 'dontask)
(setq magit-list-refs-sortby "creeatordate")

(global-evil-surround-mode 1)
(setq-default evil-escape-key-sequence "jj")
(global-evil-quickscope-always-mode 1)
(evil-snipe-override-mode 1)
(setq evil-snipe-override-evil-repeat-keys t)
(setq evil-snipe-repeat-keys t)
;;(setq global-display-line-nu
(setq-default display-line-numbers-type 'relative)
(map! :leader
      :desc "Format buffer" "c f" #'format-all-buffer)
;; (define-key evil-normal-state-map (kbd "v") #'er/expand-region)
(setq-default fill-column 100)
(setq-default scroll-margin 7)
;; disable json-jsonlist checking for json files
(add-hook 'es-result-mode-hook 'hs-minor-mode)
(add-to-list 'auto-mode-alist '("\\.es$" . es-mode))
(setq es-always-pretty-print t)

(map! :nv "C-:" #'er/contract-region
      :nv "C-;" #'er/expand-region)

(defun js-to-json ()
  (interactive)
  (shell-command-on-region (region-beginning)
                           (region-end)
                           "node -e 'console.log(JSON.stringify(eval(\"(\" + require(\"fs\").readFileSync(0, \"utf-8\") + \")\"),null,2))'"
                           (current-buffer)
                           t))
(map! :leader
      :desc "convert js to json" "c j" #'js-to-json)
(setq split-height-threshold nil)
(setq split-width-threshold 160)
;;; :ui doom-dashboard
(setq fancy-splash-image (concat doom-private-dir "splash.png"))
;; Hide the menu for as minimalistic a startup screen as possible.
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;; Seems to make rjsx mode faster but not sure..
(setq js-jsx-detect-syntax nil)

;; otherwise emacs wont stick to its virtual window
(menu-bar-mode t)
(global-unset-key (kbd "C-e"))
(use-package doom-themes
  :custom-face ; for solarized dark
                                        ; (font-lock-constant-face      ((t (:foreground "#2aa198"))))                       ; solarized cyanI
                                        ;(highlight-numbers-number     ((t (:foreground "#2aa198"))))                       ; solarized cyan
                                        ; (diff-hl-change               ((t (:background "#2aa198" :foreground "#2aa198")))) ; solarized cyan
                                        ; (show-paren-match             ((t (:foreground "white" :background "#174652"))))
  (highlight-symbol-face        ((t (:background "#073642")))) ; region (base0)
  (highlight        ((t (:background "#073642")))) ; region (base0)
  :config
  (setq doom-themes-enable-bold nil)
  (load-theme 'doom-one t))

(setq format-all-debug 'true)
(set-formatter! 'eslint  "eslint_d --fix-to-stdout --stdin")
(set-formatter! 'prettier-js  "npx prettier --stdin-filepath foo.js")
(setq-hook! 'rjsx-mode-hook +format-with (choose-formatter))
(defun choose-formatter ()
  (add-hook! 'before-save-hook #'+format/buffer)
  (if (file-exists-p (concat projectile-project-root ".prettierrc"))
      'prettier-js 'eslint))
;; Rjxs mode keeps resizing this to show tooltips which is really annoing
(setq max-mini-window-height 1)
