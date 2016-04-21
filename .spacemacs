;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     ;; better-defaults
     ;; (git :variables
     ;;      git-gutter-use-fringe t)
     ;; markdown
     ;; org
     ;; syntax-checking
     osx
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     python
     common-lisp
     latex
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence "jk"
                      auto-completion-private-snippets-directory nil)
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(smartparens)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight light
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.1
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  )

(defun list-tags-current-file ()
  (interactive)
  (let ((project-root (projectile-project-root))
        (filename (buffer-file-name (current-buffer))))
    (list-tags (replace-regexp-in-string project-root "" filename))))

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (setq inferior-lisp-program "~/lw-console")

  (setq-default
   vc-follow-symlinks t
   slime-complete-symbol*-fancy nil
   slime-complete-symbol-function 'slime-simple-complete-symbol
   ;; Evil
   evil-shift-around t
   ;;; Neotree
   neo-hidden-regexp-list '("^\\." "\\.cs\\.meta$" "\\.pyc$" "~$" "^#.*#$"
                            "\\.elc$" "\\.xfasl$")
   )

  ;; Setting and showing the 80-character column width
  (set-fill-column 80)
  (auto-fill-mode t)
  ;; Show 80 column marker, fci->fill-column-indicator, SPC t f
  (fci-mode 1)

  ;; no search highlight
  (global-evil-search-highlight-persist nil)

  ;; Sycn with my VIM setup where F6=NerdTree Toggle
  ;; and F8=Tagbar Toggle
  (global-set-key (kbd "<f6>") 'neotree-find-project-root)
  (global-set-key (kbd "<f8>") 'list-tags-current-file)
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/33/LISPcapi-examples/RCS/graphics:highlight-rectangle-pinboard.lisp,v 1.1 2012/03/20 18:47:29 martin Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/33/LISPcapi-examples/RCS/graphics:pinboard-movement.lisp,v 1.11 2011/11/08 09:54:38 yeh Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/9/LISPopengl-examples/RCS/icosahedron.lisp,v 1.20 2009/06/25 12:48:02 davef Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/61/LISPopengl/RCS/vectors.lisp,v 1.7.12.1 2011/08/24 13:27:20 davef Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/33/LISPcapi-examples/RCS/elements:help.lisp,v 1.7 2012/03/14 14:22:56 martin Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/33/LISPcapi-examples/RCS/choice:tree-view.lisp,v 1.8 2011/07/06 14:05:01 yeh Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/33/LISPcapi-examples/RCS/choice:list-panel-drag-images.lisp,v 1.6 2012/05/22 08:56:48 yeh Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/33/LISPcapi-examples/RCS/buttons:buttons.lisp,v 1.17 2012/11/25 15:01:53 yeh Exp $")
     (Package . CL-USER)
     (Base . 10)
     (Package . LW-ADD-ONS)
     (Syntax . COMMON-LISP)
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/61/LISPopengl/RCS/doc.txt,v 1.9.2.1 2011/08/24 13:27:19 davef Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/61/LISPopengl/RCS/defsys.lisp,v 1.17.2.1 2011/08/24 13:27:20 davef Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/61/LISPopengl/RCS/load.lisp,v 1.11.12.1 2011/08/24 13:27:20 davef Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/61/LISPopengl/RCS/constants.lisp,v 1.5.8.1 2011/08/24 13:27:19 davef Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/33/LISPcapi-examples/RCS/choice:list-panel-pane-menu.lisp,v 1.4 2012/01/09 14:20:53 martin Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/33/LISPcapi-examples/RCS/choice:option-pane.lisp,v 1.7 2010/08/13 09:09:51 yeh Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/61/LISPopengl/RCS/fns.lisp,v 1.11.8.1 2011/08/24 13:27:20 davef Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/61/LISPopengl/RCS/pkg.lisp,v 1.14.2.1 2011/08/24 13:27:20 davef Exp $")
     (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/61/LISPopengl/RCS/capi.lisp,v 1.28.2.1 2011/08/24 13:27:20 davef Exp $")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
