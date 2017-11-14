;;; spacegray-theme.el --- inspired by Atom One Dark
(require 'doom-themes)

;;
(defgroup spacegray-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom spacegray-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'spacegray-theme
  :type 'boolean)

(defcustom spacegray-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'spacegray-theme
  :type 'boolean)

(defcustom spacegray-comment-bg spacegray-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'spacegray-theme
  :type 'boolean)

(defcustom spacegray-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'spacegray-theme
  :type '(or integer boolean))

;;
(def-doom-theme spacegray
  "A dark theme inspired by Atom One Dark"

  ;; name        default   256       16
  ((bg         '("#4f5b66" nil       nil            ))
   (bg-alt     '("#4f5b66" nil       nil            ))
   (base0      '("#1c1f26" "black"   "black"        ))
   (base1      '("#232830" "black" "brightblack"  ))
   (base2      '("#222830" "black" "brightblack"  ))
   (base3      '("#2b303b" "black" "brightblack"  ))
   (base4      '("#343d46" "black" "brightblack"  ))
   (base5      '("#333d46" "black" "brightblack"  ))
   (base6      '("#a7adba" "black" "brightblack"  ))
   (base7      '("#c0c5ce" "black" "brightblack"  ))
   (base8      '("#dfe1e8" "white" "white"        ))
   (fg         '("#eff1f5" "white" "brightwhite"  ))
   (fg-alt     '("#eff1f5" "white" "white"        ))

   (grey            base4)
   (red             '("#bf616a" "black" "red"      ))
   (orange          '("#fecc66" "black" "brightred"))
   (yellow          '("#fecc66" "black" "yellow"   ))
   (green           '("#96b5b4" "black" "green"    ))
   (steel-blue      '("#8da0b3" "black" "black"    ))
   (steel-blue-dark '("#65737e" "black" "black"    ))

   ;; face categories -- required for all themes
   (highlight      red)
   (vertical-bar   base1)
   (selection      yellow)
   (builtin        steel-blue)
   (comments       (if spacegray-brighter-comments steel-blue-dark base5))
   (doc-comments   (doom-lighten (if spacegray-brighter-comments steel-blue-dark base5) 0.25))
   (constants      steel-blue)
   (functions      steel-blue)
   (keywords       red)
   (methods        steel-blue)
   (operators      red)
   (type           yellow)
   (strings        green)
   (variables      (doom-lighten steel-blue 0.4))
   (numbers        orange)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base0) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright spacegray-brighter-modeline)
   (-modeline-pad
    (when spacegray-padded-modeline
      (if (integerp spacegray-padded-modeline) spacegray-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt (doom-blend steel-blue base4 (if -modeline-bright 0.5 0.2)))

   (modeline-bg
    (if -modeline-bright
        (doom-darken red 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken red 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg-alt 0.1))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (font-lock-comment-face
    :foreground comments
    :background (if spacegray-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   ;; Line number faces must explicitly disable its text style attributes
   ;; because nearby faces may "bleed" into the line numbers otherwise.
   (line-number
    :foreground base4 :distant-foreground nil
    :bold nil :italic nil :underline nil :strike-through nil)
   (line-number-current-line
    :foreground base7 :distant-foreground nil
    :bold nil :italic nil :underline nil :strike-through nil)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground red)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden)))

;;; spacegray-theme.el ends here
