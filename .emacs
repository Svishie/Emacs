;; require features
(require 'cl)
(require 'package)

;; add mirrors for list-packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; needed to use things downloaded with the package manager
(package-initialize)

;; install some packages if missing
(let* ((packages '(auto-complete
		   autopair
		   ido-vertical-mode
		   monokai-theme
		   undo-tree
		   ;;if you want more packages, add them here
		   php-mode
		   ))
       (packages (remove-if 'package-installed-p packages)))
  (when packages
    (package-refresh-contents)
	 (mapc 'package-install packages)))

;; no splash screen
(setq inhibit-splash-screen t)

;; show matching parenthesis
(show-paren-mode 1)

;; show column number in mode-line
(column-number-mode 1)

;; overwrite marked text
(delete-selection-mode 1)

;; enable ido-mode, changes the way files are selected in the minibuffer
(ido-mode 1)

;; use ido everywhere
(ido-everywhere 1)

;; show vertically
(ido-vertical-mode 1)

;; use undo-tree-mode globally
(global-undo-tree-mode 1)

;; stop blinking cursor
(blink-cursor-mode 0)

;; no menubar
(menu-bar-mode 0)

;; no toolbar
(tool-bar-mode 0)

;; no scrollbar
(scroll-bar-mode 0)

;;global-linum-mode shows line numbers in all buffers
(global-linum-mode 1)

;; answer with y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; choose a color-theme
(load-theme 'monokai t)

;; get default config for auto-complete
(require 'auto-complete-config)

;; load the default config of auto-complete
(ac-config-default)

;; kills active buffer, not asking which one to kill
(global-set-key (kbd"C-x k") 'kill-this-buffer)

;; auto parentes
(electric-pair-mode 1)

;; auto-indent etter newline
(define-key global-map (kbd "RET") 'newline-and-indent)

;; defining a function that sets the right indentation to the marked
;; text, or the entire buffer if no text is selected.
(defun tidy ()
  "Ident, untabify and unwhitespacify current buffer, or region if active."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end)       (point-max))))
    (whitespace-cleanup)
    (indent-region beg end nil)
    (untabify beg end)))

;; binds the tidy-function to C-TAB
(global-set-key (kbd "<C-tab>") 'tidy)

;; emacs starts in full-screen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Use package and download from Melpa!
(require 'package)
(add-to-list 'package-archives
             '("MELPA" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(unless (file-exists-p (expand-file-name
                        (concat package-user-dir
                                "/archives/MELPA/")))
  (package-refresh-contents))

;; Declare a list of packages to install.
(dolist (package '(ac-geiser         ; Auto-complete backend for geiser
                   auto-complete     ; auto completion
                   geiser            ; GNU Emacs and Scheme talk to each other
                   paredit           ; minor mode for editing parentheses
                   pretty-lambdada)) ; `lambda' as the Greek letter.
  (unless (package-installed-p package)
    (package-install package)))

;; We use racket.
(setq geiser-active-implementations '(racket))

;; Visualize matching parentheses.
(show-paren-mode 1)

;; Make sure these features are loaded.
(require 'auto-complete-config)
(require 'ac-geiser)

;; Standard auto-complete setup.
(ac-config-default)

;; ac-geiser recommended setup.
(add-hook 'geiser-mode-hook 'ac-geiser-setup)
(add-hook 'geiser-repl-mode-hook 'ac-geiser-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'geiser-repl-mode))

;; pretty-lambdada setup.
(add-to-list 'pretty-lambda-auto-modes 'geiser-repl-mode)
(pretty-lambda-for-modes)

;; Loop the pretty-lambda-auto-modes list.
(dolist (mode pretty-lambda-auto-modes)
;; add paredit-mode to all mode-hooks
(add-hook (intern (concat (symbol-name mode) "-hook")) 'paredit-mode))
