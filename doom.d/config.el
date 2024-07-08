;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Holger Berndt"
      user-mail-address "hberndt@bidcore.de")

;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;     doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq gc-cons-threshold 134217738
      gc-cons-percentage 0.1
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      vc-follow-symlinks t
      native-comp-async-report-warnings-errors nil
      load-prefer-newer t)
(global-set-key (kbd "C-<wheel-up>") 'text-scale-increase)
(global-set-key (kbd "C-<wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(delete-selection-mode t)
(setq ranger-show-hidden t)
(setq scroll-conservatively 101
      battery-update-interval 2
      focus-follows-mouse t
      mouse-wheel-scroll-amount '(2 ((shift) . 2))
      mouse-wheel-progressive-speed t
      mouse-wheel-follow-mouse 't
      display-line-numbers-type t
      scroll-step 1
      scroll-margin 2
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      hscroll-step 1
      hscroll-margin 1
      writeroom-width 100
      writeroom-mode-line t
      writeroom-extra-line-spacing 0.1
      writeroom-maximize-window t
      +zen-text-scale 1)
(setq fancy-battery-show-percentage t)
(setq evil-vsplit-window-right t
      evil-split-window-below t)

(add-hook! 'minibuffer-setup-hook 'garbage-collect)
(add-hook! '+popup-mode-hook (hide-mode-line-mode 1))
(add-hook! '+popup-mode-hook 'garbage-collect)

(add-hook! 'doom-switch-buffer-hook 'garbage-collect)


(setq doom-font (font-spec :family "Mononoki Nerd Font" :size 14 :height 1.0)
      doom-big-font (font-spec :family "Mononoki Nerd Font" :size 16 :height 1.0)
      doom-unicode-font (font-spec :family "Mononoki Nerd Font" :size 14 :height 1.0)
      doom-variable-pitch-font (font-spec :family "Noto Serif" :size 14 :height 1.1))
(set-frame-font "Mononoki Nerd Font 14" nil t)

(custom-set-faces
  '(mode-line ((t (:family "Mononoki Nerd Font" :size 14))))
  '(mode-line-active ((t (:family "Mononoki Nerd Font" :size 14))))
  '(mode-line-inactive ((t (:family "Mononoki Nerd Font" :size 14)))))

(setq-default ls-lisp-format-time-list '("%d.%m.%Y %I:%M:%S" "%d.%m.%Y %I:%M:%S"))
(setq ls-lisp-use-localized-time-format t
      display-time-format "%I:%M"
      display-time-default-load-average nil
      confirm-kill-emacs t
      confirm-kill-processes nil
      tab-width 4
      indent-tabs-mode t
      indent-line-function 'insert-tab
      require-final-newline t
      next-line-add-newlines nil
      inhibit-startup-message t
      initial-scratch-message nil
      large-file-warning-threshold nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq-default shell-file-name "/bin/zsh")

(setq projectile-project-search-path '("~/work"))

(add-hook 'window-setup-hook #'toggle-frame-maximized)
(set-frame-parameter (selected-frame) 'alpha 90)
(add-to-list 'default-frame-alist '(alpha 90 90))
(add-hook! 'dired-mode-hook 'nerd-icons-dired-mode)
(add-hook! 'dired-mode-hook 'garbage-collect)

(setq warning-minimum-level :emergency)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(after! doom-themes
    (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
    (doom-themes-org-config)
    (doom-themes-visual-bell-config))

(custom-set-faces!
    '(font-lock-comment-face :slant italic)
    '(font-lock-keyword-face :slant italic))

(setq fancy-splash-image (concat doom-private-dir "/splash/emacsapple.png"))

(add-hook! 'doom-dashboard-mode-hook 'garbage-collect)
(add-hook! 'doom-dashboard-mode-hook (hide-mode-line-mode 1))
(add-hook! 'doom-load-theme-hook 'garbage-collect)
(add-hook! 'doom-first-file-hook 'garbage-collect)
(add-hook! 'kill-emacs-hook 'garbage-collect)
(add-hook! 'after-init-hook 'garbage-collect)
(add-hook! 'after-init-hook 'beacon-mode)
(add-hook! 'doom-init-ui-hook 'garbage-collect)
(add-hook! 'doom-after-init-modules-hook 'garbage-collect)
(add-hook! 'eww-mode-hook 'garbage-collect)

(setq config-org-file-name "config.org"
      config-org-directory "~/.doom.d/"
      agenda-org-file-name "agenda.org"
      agenda-org-directory "~/org/"
)

(defun hb/open-config-org ()
    "Open your private Config.org file."
    (interactive)
    (find-file (expand-file-name config-org-file-name config-org-directory)))

(defun hb/open-agenda-org ()
    "Open your agenda.org file."
    (interactive)
    (find-file (expand-file-name agenda-org-file-name agenda-org-directory)))

(defun hb/open-dotfiles ()
    "Opens Dotfiles repository"
    (interactive)
    (dired "~/work/dotfiles"))

(require 'elfeed-goodies)
(require 'elfeed-org)

(after! elfeed
    (defun elfeed-search-format-date (date) (format-time-string "%d.%m.%Y %I:%M:%S" (seconds-to-time date)))
    (setq elfeed-search-filter "@1-weeks-ago +unread"
          elfeed-show-entry-switch #'pop-to-buffer
          elfeed-use-curl t
          elfeed-curl-max-connections 20
          elfeed-curl-timeout 8
          elfeed-curl-extra-arguments '("--insecure" "--fail-early" "--tcp-fastopen" "--ssl-allow-beast"))
	(defface git-entry
        '((t :foreground "#d04b4e"))
        "Entry for Git")
    (defface reddit-entry
        '((t :foreground "#f28735"))
        "Entry for Reddit")
    (defface youtube-entry
        '((t :foreground "#f74e8b"))
        "Entry for YouTube")
    (defface stack-entry
        '((t :foreground "#25c192"))
        "Entry for Stack")
    (defface news-entry
        '((t :foreground "#49a6d0"))
        "Entry for News")


	(push '(git git-entry) elfeed-search-face-alist)
	(push '(reddit reddit-entry) elfeed-search-face-alist)
	(push '(youtube youtube-entry) elfeed-search-face-alist)
	(push '(stack stack-entry) elfeed-search-face-alist)
	(push '(news news-entry) elfeed-search-face-alist)
	(push '(tech tech-entry) elfeed-search-face-alist)

	(add-hook! 'elfeed-search-update-hook (hide-mode-line-mode 1))
	(add-hook! 'elfeed-search-mode-hook (hide-mode-line-mode 1))
	(add-hook! 'elfeed-show-mode-hook (hide-mode-line-mode 1) (hl-line-mode -1))
	(add-hook! 'elfeed-search-mode-hook #'elfeed-update)
	(add-hook! 'elfeed-show-mode-hook 'visual-line-mode)
	(add-hook! 'elfeed-show-mode-hook (mixed-pitch-mode))
	(add-hook! 'elfeed-show-mode-hook 'garbage-collect)
	(add-hook! 'elfeed-show-mode-hook 'mixed-pitch-mode)
	(add-hook! 'elfeed-search-mode-hook (setq header-line-format nil))
	(add-hook! 'elfeed-show-mode-hook (setq header-line-format nil)))

(after! elfeed-goodies
    (elfeed-goodies/setup)
    (setq elfeed-goodies/entry-pane-size 0.5
          elfeed-goodies/wide-threshold 0.2
          elfeed-goodies/show-mode-padding 1
          elfeed-goodies/feed-source-column-width 20
          elfeed-goodies/tag-column-width 20))

(after! elfeed-goodies
    (evil-define-key 'normal elfeed-show-mode-map
        (kbd "J") 'elfeed-goodies/split-show-next
        (kbd "K") 'elfeed-goodies/split-show-prev)
    (evil-define-key 'normal elfeed-search-mode-map
        (kbd "J") 'elfeed-goodies/split-show-next
        (kbd "K") 'elfeed-goodies/split-show-prev
        (kbd "e") (lambda () (interactive) (elfeed-search-set-filter "@2-weeks-ago +reddit +unread"))
        (kbd "p") (lambda () (interactive) (elfeed-search-set-filter "@2-weeks-ago +stack +unread"))
        (kbd "o") (lambda () (interactive) (elfeed-search-set-filter "@2-weeks-ago +news +unread"))
        (kbd "i") (lambda () (interactive) (elfeed-search-set-filter "@2-weeks-ago +git +unread"))
        (kbd "x") (lambda () (interactive) (elfeed-search-set-filter "@2-weeks-ago +youtube +unread"))
        (kbd "g") (lambda () (interactive) (elfeed-search-browse-url)))
    (map! :map +elfeed-search-mode-map
        :desc "Show selected entry" :ne "RET" #'elfeed-search-show-entry
        :desc "Kill buffer" :ne "q" #'elfeed-kill-buffer
        :desc "Set filter" :ne "S" #'elfeed-search-set-filter
        :desc "Clear filter" :ne "c" #'elfeed-search-clear-filter)
    (map! :map +elfeed-show-mode-map
        :desc "Show selected entry" :ne "RET" #'elfeed-search-show-entry
        :desc "Set filter" :ne "S" #'elfeed-search-set-filter
        :desc "Clear filter" :ne "c" #'elfeed-search-clear-filter))

(after! helm
    (setq helm-show-completion-min-window-height 9))

(after! helm-org-rifle
    (setq helm-org-rifle-show-path t
          helm-org-rifle-show-level-stars t)
    (add-hook! 'helm-org-rifle-after-init-hook 'mixed-pitch-mode))

(after! magit
	(custom-set-faces!
        '(magit-log-author :foreground "#d04b4e")
        '(magit-log-date :foreground "#f28735")
        '(magit-hash :foreground "#25c192")
        '(magit-filename :foreground "#49a6d0")
        '(magit-branch-current :foreground "#f74e8b"))
    (add-hook! 'magit-status-mode-hook (hide-mode-line-mode 1))
    (add-hook! 'magit-log-mode-hook (hide-mode-line-mode 1))
    (add-hook! 'magit-mode-hook 'garbage-collect)
    (add-hook! 'magit-log-mode-hook 'garbage-collect)
    (add-hook! 'magit-status-mode-hook 'garbage-collect)
    (add-hook! 'magit-popup-mode-hook 'garbage-collect))

(after! diff-hl
    (global-diff-hl-mode)
    (diff-hl-margin-mode)
    (diff-hl-flydiff-mode)
    (diff-hl-dired-mode)
    (diff-hl-show-hunk-mouse-mode))

(add-hook! 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook! 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(after! org
    (add-hook! 'org-mode-hook 'garbage-collect)
    (add-hook! 'org-mode-hook #'org-modern-mode)
    (add-hook! 'org-agenda-finalize-hook #'org-modern-agenda)
    (add-hook! 'org-mode-hook 'org-fancy-priorities-mode)
    (setq org-directory "~/org/"
          org-agenda-files '("~/org/todo.org" "~/org/agenda.org")
          org-agenda-block-separator 8411
          org-tags-column 0
          org-pretty-entities t
          org-default-notes-file (expand-file-name "notes.org" org-directory)
          org-superstar-headline-bullets-list '("◉" "● " "○ " "◆" "●" "○" "◆")
          org-superstar-item-bullet-alist '((?+ . ?➤) (?- . ?✦))
          org-ellipsis "  "
          org-catch-invisible-edits 'smart
          org-log-done 'time
          org-journal-dir "~/org/journal/"
          org-hide-emphasis-markers t
          org-support-shift-select t
          org-src-preserve-indentation nil
          org-src-tab-acts-natively t
          org-edit-src-content-indentation 0)
    (setq org-todo-keywords
          '((sequence "TODO(t)" "NEXT(n)" "VIDEO(v)" "IDEA(i)" "DONE(d)" "EVENT(e)"))
          org-todo-keyword-faces
          '(("TODO" . 'nerd-icons-red)
            ("NEXT" . 'nerd-icons-blue)
            ("VIDEO" . 'nerd-icons-yellow)
            ("IDEA" . 'nerd-icons-green)
            ("DONE" . 'nerd-icons-orange)
            ("EVENT" . 'nerd-icons-cyan)))
    (custom-set-faces!
        '(org-agenda-calendar-event :inherit variable-pitch)
        '(org-agenda-calendar-sexp :inherit variable-pitch)
        '(org-agenda-filter-category :inherit variable-pitch)
        '(org-agenda-filter-tags :inherit variable-pitch)
        '(org-agenda-date :inherit variable-pitch :weight bold :height 1.09)
        '(org-agenda-date-weekend :inherit variable-pitch :weight bold :height 1.06)
        '(org-agenda-done :inherit variable-pitch :weight bold)
        '(org-agenda-date-today :inherit variable-pitch :weight bold :slant italic :height 1.12)
        '(org-agenda-date-weekend-today :inherit variable-pitch :weight bold :height 1.09)
        '(org-agenda-dimmed-todo-face :inherit variable-pitch :weight bold)
        '(org-agenda-current-time :inherit variable-pitch :weight bold)
        '(org-agenda-clocking :inherit variable-pitch :weight bold))
    (add-hook! 'org-agenda-mode-hook 'mixed-pitch-mode)
    (add-hook! 'org-agenda-mode-hook (hide-mode-line-mode 1))
    (custom-set-faces!
        '(org-document-title :height 1.3)
        '(org-level-1 :inherit outline-1 :weight extra-bold :height 1.35)
        '(org-level-2 :inherit outline-2 :weight bold :height 1.15)
        '(org-level-3 :inherit outline-3 :weight bold :height 1.12)
        '(org-level-4 :inherit outline-4 :weight bold :height 1.09)
        '(org-level-5 :inherit outline-5 :weight bold :height 1.06)
        '(org-level-6 :inherit outline-6 :weight semi-bold :height 1.03)
        '(org-level-7 :inherit outline-7 :weight semi-bold)
        '(org-level-8 :inherit outline-8 :weight semi-bold)))

(after! treemacs
    (setq doom-themes-treemacs-theme "doom-colors")
    (setq doom-themes-treemacs-enable-variable-pitch t))
