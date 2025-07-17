;;; hercules-theme.el --- A minimalist theme with amber accents -*- lexical-binding: t -*-

;; Copyright (C) 2025 Tamas Zsar

;; Author: Tamas Zsar
;; Version: 1.0
;; Package-Requires: ((emacs "24.3"))
;; Keywords: faces, theme

;;; Commentary:

;; Hercules is a minimalist theme with warm amber/orange accents, inspired by the old Hercules monitors. Theme is based on the gruber darker theme.
;; Use `hercules-select-theme' to choose between dark and light variants. `hercules-toggle-theme' toggles between them.

;;; Code:

(defgroup hercules nil
  "Hercules theme options."
  :group 'faces)

(defcustom hercules-current-variant 'dark
  "Current Hercules theme variant."
  :type '(choice (const :tag "Dark" dark)
                 (const :tag "Light" light))
  :group 'hercules)

(defun hercules-apply-theme (variant)
  "Apply Hercules theme colors for VARIANT (dark or light)."
  (let* ((is-dark (eq variant 'dark))
         ;; Colors that change between variants
         (bg          (if is-dark "#282828" "#fbfbf8"))
         (bg-1        (if is-dark "#181818" "#ffffff"))
         (bg+1        (if is-dark "#453d41" "#e8e8e5"))
         (bg+2        (if is-dark "#484848" "#e0e0dc"))
         (bg+3        (if is-dark "#52494e" "#d0d0cc"))
         
         (fg-1        (if is-dark "#b8a19f" "#6a6a6a"))
         (fg          (if is-dark "#e4e4ef" "#3a3a3a"))
         (fg+1        (if is-dark "#f4f4ff" "#2a2a2a"))
         
         ;; Amber/orange colors
         (rust        (if is-dark "#cc7833" "#aa6500"))
         (orange      (if is-dark "#ff9f40" "#e67e00"))
         (amber       (if is-dark "#ffa726" "#d47100"))
         (peach       (if is-dark "#ffb366" "#c77430"))
         
         ;; Other colors
         (red         (if is-dark "#f43841" "#cc1f1f")) 
         (green       (if is-dark "#73c936" "#448c27"))
         (magenta     (if is-dark "#cc8cc3" "#aa6ebb"))
         (quartz      (if is-dark "#b8a5a0" "#7a6a60"))
         (niagara     (if is-dark "#7f6a5f" "#5f4a3f"))
         
         ;; Light-specific
         (highlight   (if is-dark bg+1 "#f9f0e8"))
         (selection   (if is-dark bg+2 "#ffe8cc"))
         
         ;; Mode line box (only for light theme)
         (mode-line-box (if is-dark nil `(:line-width 1 :color ,bg+2))))
    
    ;; Apply faces
    (custom-set-faces
     ;; Basic faces
     `(default ((t (:foreground ,fg :background ,bg))))
     `(cursor ((t (:foreground ,bg :background ,fg))))
     `(fringe ((t (:foreground ,fg-1 :background ,bg))))
     `(highlight ((t (:background ,highlight))))
     `(region ((t (:background ,selection))))
     `(secondary-selection ((t (:background ,bg+1))))
     `(isearch ((t (:foreground ,(if is-dark bg fg+1) :background ,amber))))
     `(lazy-highlight ((t (:foreground ,(if is-dark bg fg+1) :background ,(if is-dark orange selection)))))
     `(minibuffer-prompt ((t (:foreground ,amber :weight bold))))
     `(hl-line ((t (:background ,(if is-dark bg-1 bg+1)))))
     
     ;; Font lock faces
     `(font-lock-builtin-face ((t (:foreground ,orange))))
     `(font-lock-comment-face ((t (:foreground ,rust :slant italic))))
     `(font-lock-comment-delimiter-face ((t (:foreground ,rust))))
     `(font-lock-constant-face ((t (:foreground ,quartz))))
     `(font-lock-doc-face ((t (:foreground ,green))))
     `(font-lock-function-name-face ((t (:foreground ,niagara))))
     `(font-lock-keyword-face ((t (:foreground ,amber :weight bold))))
     `(font-lock-string-face ((t (:foreground ,green))))
     `(font-lock-type-face ((t (:foreground ,peach))))
     `(font-lock-variable-name-face ((t (:foreground ,fg+1))))
     `(font-lock-warning-face ((t (:foreground ,red :weight bold))))
     
     ;; Mode line
     `(mode-line ((t (:foreground ,fg+1 :background ,bg+1 :box ,mode-line-box))))
     `(mode-line-inactive ((t (:foreground ,fg-1 :background ,bg+1 :box ,mode-line-box))))
     `(mode-line-buffer-id ((t (:foreground ,amber :weight bold))))
     
     ;; Search
     `(isearch-fail ((t (:foreground ,red :background ,bg))))
     `(match ((t (:background ,(if is-dark orange selection)))))
     
     ;; Parens
     `(show-paren-match ((t (:foreground ,bg :background ,(if is-dark peach amber)))))
     `(show-paren-mismatch ((t (:foreground ,bg :background ,red))))
     
     ;; Links
     `(link ((t (:foreground ,orange :underline t))))
     `(link-visited ((t (:foreground ,rust :underline t))))
     
     ;; Org mode
     `(org-level-1 ((t (:foreground ,amber :weight bold))))
     `(org-level-2 ((t (:foreground ,peach))))
     `(org-level-3 ((t (:foreground ,orange))))
     `(org-link ((t (:foreground ,orange :underline t))))
     `(org-todo ((t (:foreground ,red :weight bold))))
     `(org-done ((t (:foreground ,green :weight bold))))
     
     ;; Line numbers
     `(line-number ((t (:foreground ,bg+3 :background ,bg))))
     `(line-number-current-line ((t (:foreground ,amber :background ,bg :weight bold)))))
  
  ;; Set frame parameters
  (setq default-frame-alist
        (assq-delete-all 'border-color default-frame-alist))
  (add-to-list 'default-frame-alist 
               `(border-color . ,(if is-dark "#3d3532" "#d0d0cc")))))

;;;###autoload
(defun hercules-select-theme (&optional variant)
  "Select Hercules theme VARIANT (dark or light).
If VARIANT is not provided, prompt for selection."
  (interactive)
  (let ((choice (or variant
                    (intern (completing-read "Hercules variant: " 
                                             '("dark" "light") 
                                             nil t)))))
    (setq hercules-current-variant choice)
    (hercules-apply-theme choice)
    (message "Hercules %s theme applied" choice)))

;;;###autoload
(defun hercules-toggle-theme ()
  "Toggle between dark and light Hercules variants."
  (interactive)
  (let ((new-variant (if (eq hercules-current-variant 'dark) 'light 'dark)))
    (hercules-select-theme new-variant)))

(provide 'hercules-theme)

;;; hercules-theme.el ends here
