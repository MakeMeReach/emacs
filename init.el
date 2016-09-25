(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(add-to-list 'auto-mode-alist '("cron\\(tab\\)?\\."    . crontab-mode))
(add-to-list 'auto-mode-alist '("/nginx/sites-\\(?:available\\|enabled\\)/" . nginx-mode))
(add-to-list 'auto-mode-alist '("\\(?:\\.php\\|\\.dist\\)$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; Remove startup message
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(menu-bar-mode -1)

;; Display column number
(column-number-mode t)

;; Highlight current line
;;(global-hl-line-mode 1)

;; Remove the 'yes or no' prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable ido-mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(load-theme 'badger t)
(setq default-tab-width 4)

;;(global-set-key [(control b)] 'comment-or-uncomment-region)

;; Do not search files in other directories
;;(setq ido-auto-merge-work-directories-length -1)

;; Shortcuts to move between windows
;; (global-set-key [(meta left)] 'windmove-left)
;; (global-set-key [(meta right)] 'windmove-right)
;; (global-set-key [(meta up)] 'windmove-up)
;; (global-set-key [(meta down)] 'windmove-down)

;; Shortcuts to resize windows
;;(global-set-key [(shift left)] 'shrink-window-horizontally)
;;(global-set-key [(shift right)] 'enlarge-window-horizontally)
;;(global-set-key [(shift up)] 'shrink-window)
;;(global-set-key [(shift down)] 'enlarge-window)

;; skip annying buffers
;;------------------------------------------------------------------------------
(setq skippable-buffers '("*Messages*" "*scratch*" "*Help*" "*Completions*"
			  "*compilation*" "*Disabled Command*" "*Irony*"))
(defun my-next-buffer ()
  "next-buffer that skips certain buffers"
  (interactive)
  (next-buffer)
  (while (member (buffer-name) skippable-buffers)
    (next-buffer)))

(defun my-previous-buffer ()
  "previous-buffer that skips certain buffers"
  (interactive)
  (previous-buffer)
  (while (member (buffer-name) skippable-buffers)
    (previous-buffer)))

(global-set-key [remap next-buffer] 'my-next-buffer)
(global-set-key [remap previous-buffer] 'my-previous-buffer)
;;------------------------------------------------------------------------------


;; Mac OSX
;;(setq mac-option-modifier 'super)
;;(setq mac-command-modifier 'meta)

;; Backup files
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Make text mode the default for new buffers
(setq default-major-mode 'text-mode)

;; pending delete
(pending-delete-mode t)


