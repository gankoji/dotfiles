;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Set fonts
(setq doom-font "-*-Hack Nerd Font Mono-regular-normal-normal-*-23-*-*-*-m-0-iso10646-1")
(setq doom-variable-pitch-font "-*-Hack Nerd Font-regular-normal-normal-*-23-*-*-*-p-0-iso10646-1")


;; Auto-fill mode is a must for me when writing
(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'markdown-mode-hook 'auto-fill-mode)

;; Use Consult more places!
(define-key global-map [remap +vertico/switch-workspace-buffer] #'consult-buffer)
;; GPTel config - LLMs in Emacs!
(use-package! gptel
  :config
  (setq! gptel-api-key "")
  (map! :leader
        :prefix ("l" . "LLMs") ; Leader + g
        :desc "Add to context"                 "a" #'gptel-add
        :desc "Complete at point"              "c" #'gptel-complete-at-point
        :desc "Edit at point"                  "e" #'gptel-edit-at-point
        :desc "Add file to context"            "f" #'gptel-add-file
        :desc "Minor mode for LLM interaction" "m" #'gptel-mode
        :desc "Choose configuration"           "o" #'gptel-menu
        :desc "Rewrite selection"              "r" #'gptel-rewrite
        :desc "Send to LLM"                    "s" #'gptel-send
        :desc "Abort the current prompt"       "x" #'gptel-abort
        ))

(gptel-make-anthropic "Claude"
  :stream t
  :key "")

(setq!
 gptel-model 'gemini-2.0-flash
 gptel-backend (gptel-make-gemini "Gemini"
                 :key ""
                 :stream t))

;; Necessary for now, because gpt-4.5-preview isn't on their model-list API response yet
(gptel-make-openai "OpenAI-Preview"
  :stream t
  :key ""
  :models '(gpt-4.5-preview))

(use-package! exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(with-eval-after-load 'lsp-mode
  (setq lsp-headerline-breadcrumb-enable t)
  (setq lsp-modeline-diagnostics-scope :workspace)
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-enhanced-markdown t))

(use-package! request)
(use-package! tika)

(setq sql-connection-alist
      '((sprocket-main (sql-product 'postgres)
         (sql-database (concat "postgresql://"
                               "developer_main-github-gankoji-1741459464"
                               ":GMcKywGuczVxTd-20WjT"
                               "@spr.ocket.cloud"
                               ":30000"
                               "/sprocket_main"
                               )))))

(setq sqlformat-command 'pgformatter)
(setq sqlformat-args '("-s2" "-g"))

(use-package! poet-theme)
(add-hook 'text-mode-hook
          (lambda ()
            (variable-pitch-mode 1)))

(add-to-list
 'default-frame-alist'(ns-transparent-titlebar . t))
(add-to-list
 'default-frame-alist'(ns-appearance . light))

(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(use-package exec-path-from-shell)
(exec-path-from-shell-initialize)
(use-package whisper
  :load-path "/Users/jacbaile/Workspace/whisper.el/"
  :bind ("C-M-r" . whisper-run)
  :config
  (setq whisper-install-directory "/tmp/"
        whisper-model "large-v3"
        whisper-language "en"
        whisper-translate nil
        whisper-use-threads (/ (num-processors) 2)
        whisper--ffmpeg-input-device ":1"))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "HackNerdFontMono-Regular" :size 24 :weight 'regular))
;;      doom-variable-pitch-font (font-spec :family "HackNerdFont" :size 25))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
