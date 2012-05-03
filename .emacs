;; turn off welcome screen
(setq inhibit-startup-message t)

;; add google style files to path
(add-to-list 'load-path "~/.emacs.d/google-style/")

;; autoload for google style library
(autoload 'google-set-c-style "google-c-style" "Google C Style")

;; add google style mode to c mode
(add-hook 'c-mode-common-hook 'google-set-c-style)

;; add rosemacs to path
(add-to-list 'load-path "/opt/ros/diamondback/ros/tools/rosemacs")

;; autoload for rosemacs
(autoload 'invoke-rosemacs "rosemacs" "ROS Emacs Extensions")

;; load rosemacs
(invoke-rosemacs)

;; set ROS key 
(global-set-key "\C-x\C-r" ros-keymap)

;; force backup files into their own directory
(setq backup-directory-alist `((".*" . "~/.emacs.d/backups")))

;; set list of tag files to look in 
(setq tags-table-list '("~/rdr"))

;; force header files to be c++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))