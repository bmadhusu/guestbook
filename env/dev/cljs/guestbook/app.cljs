(ns ^:dev/once guestbook.app
    (:require
     [devtools.core :as devtools]
     [guestbook.core :as core]))

(enable-console-print!)

(println "loading env/dev/cljs/guesbook/app.cljs...")

(devtools/install!)

(core/init!)