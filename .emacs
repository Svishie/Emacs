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
		  ido-vertical-mode
		  monokai-theme
		  undo-tree
		  ;;if you want more packages, add them here
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



;; auto-indent etter newline
(define-key global-map (kbd "RET") 'newline-and-indent)

