;;; hercules-light-theme.el --- A minimalist light theme with amber accents -*- lexical-binding: t -*-

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

;; Hercules Light is a minimalist light theme with warm amber/orange accents,
;; inspired by the old Hercules monitors.  The basis for this theme is
;; gruber-darker.
;;
;; Installation:
;;
;;   M-x package-install-file RET hercules-light-theme.el
;;   M-x load-theme RET hercules-light
;;
;; Or add to your init file:
;;
;;   (load-theme 'hercules-light t)

;;; Code:

(deftheme hercules-light
  "A minimalist light theme with warm amber/orange accents.")

(let ((class '((class color) (min-colors 89)))
      ;; Light theme colors
      (bg          "#fbfbf8")
      (bg-1        "#ffffff")
      (bg+1        "#e8e8e5")
      (bg+2        "#e0e0dc")
      (bg+3        "#d0d0cc")
      
      (fg-1        "#6a6a6a")
      (fg          "#3a3a3a")
      (fg+1        "#2a2a2a")
      
      ;; Amber/orange colors
      (rust        "#aa6500")
      (orange      "#e67e00")
      (amber       "#d47100")
      (peach       "#c77430")
      
      ;; Other colors
      (red         "#cc1f1f")
      (green       "#448c27")
      (magenta     "#aa6ebb")
      (quartz      "#7a6a60")
      (niagara     "#5f4a3f")
      
      ;; Light-specific
      (highlight   "#f9f0e8")
      (selection   "#ffe8cc"))
  
  (custom-theme-set-faces
   'hercules-light
   
   ;; Basic faces
   `(default ((,class (:foreground ,fg :background ,bg))))
   `(cursor ((,class (:foreground ,bg :background ,fg))))
   `(fringe ((,class (:foreground ,fg-1 :background ,bg))))
   `(highlight ((,class (:background ,highlight))))
   `(region ((,class (:background ,selection))))
   `(secondary-selection ((,class (:background ,bg+1))))
   `(isearch ((,class (:foreground ,fg+1 :background ,amber))))
   `(lazy-highlight ((,class (:foreground ,fg+1 :background ,selection))))
   `(minibuffer-prompt ((,class (:foreground ,amber :weight bold))))
   `(hl-line ((,class (:background ,bg+1))))
   
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
   `(mode-line ((,class (:foreground ,fg+1 :background ,bg+1 :box (:line-width 1 :color ,bg+2)))))
   `(mode-line-inactive ((,class (:foreground ,fg-1 :background ,bg+1 :box (:line-width 1 :color ,bg+2)))))
   `(mode-line-buffer-id ((,class (:foreground ,amber :weight bold))))
   
   ;; Search
   `(isearch-fail ((,class (:foreground ,red :background ,bg))))
   `(match ((,class (:background ,selection))))
   
   ;; Parens
   `(show-paren-match ((,class (:foreground ,bg :background ,amber))))
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
 'hercules-light
 '(frame-background-mode 'light))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'hercules-light)

;;; hercules-light-theme.el ends here
