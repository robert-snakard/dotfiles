;; imports
(require 'package)
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives )
(package-initialize)

(require 'evil)
(evil-mode 1)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "SPC")
(setq evil-leader/in-all-states 1)

(require 'evil-snipe)
(evil-snipe-mode 1)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(add-hook 'prog-mode-hook #'electric-pair-mode)

;;Emacs Settings
(server-start)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

;;Major Modes
;;C Major Mode
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
(lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/src/linux-trees")
                                       filename))
          (setq indent-tabs-mode t)
          (setq show-trailing-whitespace t)
          (c-set-style "linux-tabs-only")))))

;;Evil Keybindings
(define-key evil-normal-state-map (kbd "<return>") 'evil-ex)
(define-key evil-normal-state-map (kbd "<tab>") 'evil-jump-forward)
(define-key evil-normal-state-map (kbd "<backspace>") 'evil-jump-backward)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-d") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "g r") 'evil-use-register)

(define-key evil-normal-state-map (kbd "g c") 'comment-dwim)

(define-key evil-normal-state-map (kbd "g t") 'magit-status)

;;Evil Settings
(setq-default tab-width 4 indent-tabs-mode nil)
(setq evil-shit-width 4)
(setq evil-want-C-u-scroll t)

(setq evil-default-cursor 'box)
(setq evil-insert-cursor 'bar)
(setq evil-replace-cursor 'hbar)

;;Plugins
(load-theme 'darktooth t)


;;Escape quits everything
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)
