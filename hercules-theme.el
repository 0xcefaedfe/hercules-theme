;;; hercules-theme.el --- A minimalist dark theme with amber accents -*- lexical-binding: t -*-

;; Copyright (C) 2025 Tamas Zsar

;; Author: Tamas Zsar <t@nxtsqr.com>
;; URL: https://github.com/0xcefaedfe/hercules-theme
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.3"))
;; Keywords: faces themes

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Hercules is a minimalist dark theme with warm amber/orange accents,
;; inspired by the old Hercules monitors.  The basis for this theme is
;; gruber-darker.
;;
;; Installation:
;;
;;   M-x package-install-file RET hercules-theme.el
;;   M-x load-theme RET hercules
;;
;; Or add to your init file:
;;
;;   (load-theme 'hercules t)

;;; Code:

(deftheme hercules
  "A minimalist dark theme with warm amber/orange accents.")

(let ((class '((class color) (min-colors 89)))
      ;; Dark theme colors
      (bg          "#282828")
      (bg-1        "#181818")
      (bg+1        "#453d41")
      (bg+2        "#484848")
      (bg+3        "#52494e")
      
      (fg-1        "#b8a19f")
      (fg          "#e4e4ef")
      (fg+1        "#f4f4ff")
      
      ;; Amber/orange colors
      (rust        "#cc7833")
      (orange      "#ff9f40")
      (amber       "#ffa726")
      (peach       "#ffb366")
      
      ;; Other colors
      (red         "#f43841")
      (green       "#73c936")
      (magenta     "#cc8cc3")
      (quartz      "#b8a5a0")
      (niagara     "#7f6a5f"))
  
  (custom-theme-set-faces
   'hercules
   
   ;; Basic faces
   `(default ((,class (:foreground ,fg :background ,bg))))
   `(cursor ((,class (:foreground ,bg :background ,fg))))
   `(fringe ((,class (:foreground ,fg-1 :background ,bg))))
   `(highlight ((,class (:background ,bg+1))))
   `(region ((,class (:background ,bg+2))))
   `(secondary-selection ((,class (:background ,bg+1))))
   `(isearch ((,class (:foreground ,bg :background ,amber))))
   `(lazy-highlight ((,class (:foreground ,bg :background ,orange))))
   `(minibuffer-prompt ((,class (:foreground ,amber :weight bold))))
   `(hl-line ((,class (:background ,bg-1))))
   
   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground ,orange))))
   `(font-lock-comment-face ((,class (:foreground ,rust :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,rust))))
   `(font-lock-constant-face ((,class (:foreground ,quartz))))
   `(font-lock-doc-face ((,class (:foreground ,green))))
   `(font-lock-function-name-face ((,class (:foreground ,niagara))))
   `(font-lock-keyword-face ((,class (:foreground ,amber :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,green))))
   `(font-lock-type-face ((,class (:foreground ,peach))))
   `(font-lock-variable-name-face ((,class (:foreground ,fg+1))))
   `(font-lock-warning-face ((,class (:foreground ,red :weight bold))))
   
   ;; Mode line
   `(mode-line ((,class (:foreground ,fg+1 :background ,bg+1))))
   `(mode-line-inactive ((,class (:foreground ,fg-1 :background ,bg+1))))
   `(mode-line-buffer-id ((,class (:foreground ,amber :weight bold))))
   
   ;; Search
   `(isearch-fail ((,class (:foreground ,red :background ,bg))))
   `(match ((,class (:background ,orange))))
   
   ;; Parens
   `(show-paren-match ((,class (:foreground ,bg :background ,peach))))
   `(show-paren-mismatch ((,class (:foreground ,bg :background ,red))))
   
   ;; Links
   `(link ((,class (:foreground ,orange :underline t))))
   `(link-visited ((,class (:foreground ,rust :underline t))))
   
   ;; Org mode
   `(org-level-1 ((,class (:foreground ,amber :weight bold))))
   `(org-level-2 ((,class (:foreground ,peach))))
   `(org-level-3 ((,class (:foreground ,orange))))
   `(org-level-4 ((,class (:foreground ,rust))))
   `(org-level-5 ((,class (:foreground ,niagara))))
   `(org-link ((,class (:foreground ,orange :underline t))))
   `(org-todo ((,class (:foreground ,red :weight bold))))
   `(org-done ((,class (:foreground ,green :weight bold))))
   `(org-date ((,class (:foreground ,rust))))
   `(org-table ((,class (:foreground ,fg))))
   `(org-block ((,class (:foreground ,fg))))
   `(org-block-begin-line ((,class (:foreground ,rust))))
   `(org-block-end-line ((,class (:foreground ,rust))))
   
   ;; Line numbers
   `(line-number ((,class (:foreground ,bg+3 :background ,bg))))
   `(line-number-current-line ((,class (:foreground ,amber :background ,bg :weight bold))))
   
   ;; Additional faces for better coverage
   `(vertical-border ((,class (:foreground ,bg+2))))
   `(window-divider ((,class (:foreground ,bg+2))))
   `(window-divider-first-pixel ((,class (:foreground ,bg+2))))
   `(window-divider-last-pixel ((,class (:foreground ,bg+2))))))

(custom-theme-set-variables
 'hercules
 '(frame-background-mode 'dark))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'hercules)

;;; Utility functions for theme switching

(defgroup hercules nil
  "Hercules theme options."
  :group 'faces)

(defcustom hercules-current-variant 'dark
  "Current Hercules theme variant."
  :type '(choice (const :tag "Dark" dark)
                 (const :tag "Light" light))
  :group 'hercules)

;;;###autoload
(defun hercules-select-theme (&optional variant)
  "Select Hercules theme VARIANT (dark or light).
If VARIANT is not provided, prompt for selection.
Note: You need to have hercules-light-theme.el installed for the light variant."
  (interactive)
  (let ((choice (or variant
                    (intern (completing-read "Hercules variant: " 
                                             '("dark" "light") 
                                             nil t)))))
    (setq hercules-current-variant choice)
    (condition-case err
        (progn
          (load-theme (if (eq choice 'dark) 'hercules 'hercules-light) t)
          (message "Hercules %s theme applied" choice))
      (error 
       (if (eq choice 'light)
           (message "Hercules light theme not found. Please install hercules-light-theme.el")
         (message "Error loading theme: %s" err))))))

;;;###autoload
(defun hercules-toggle-theme ()
  "Toggle between dark and light Hercules variants.
Note: You need to have hercules-light-theme.el installed for the light variant."
  (interactive)
  (let ((new-variant (if (eq hercules-current-variant 'dark) 'light 'dark)))
    (hercules-select-theme new-variant)))

(provide 'hercules-theme)

;;; hercules-theme.el ends here
