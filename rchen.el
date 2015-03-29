;; font
;; (set-face-attribute 'default nil :height 150)                     
(eval-when-compile (require 'cl))

(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                           (format "%s:pixelsize=%d" english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
     (set-fontset-font (frame-parameter nil 'font) charset
                           (font-spec :family chinese :size chinese-size))))
(set-font "Monaco" "LiHei Pro" 16 20)

;; ctag
(setq path-to-ctags "./TAGS");;

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "Directory:")
  (shell-command
   (format "/usr/local/bin/ctags -f %s -e -R %s" path-to-ctags (directory-file-name dir-name))))

;; blog setting 
(require 'org-publish)
(setq org-publish-project-alist
      '(

        ("blog-notes"
         :base-directory "/Users/rchen/org/blog/"
         :base-extension "org"
         :publishing-directory "~/org/gh-page/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :section-numbers nil
         :auto-preamble t
         :auto-sitemap t                ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         :author "Grant Chen"
         :email "chen.paladin@gmail.com"
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/stylesheet.css\" /><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"
         )

        ("blog-static"
         :base-directory "~/org/blog/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/org/gh-page/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-notes" "blog-static"))
        ;;
        ))
