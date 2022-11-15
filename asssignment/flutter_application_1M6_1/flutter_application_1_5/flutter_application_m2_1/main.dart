<?xml version = "1.0" encoding = "utf-8"?>
<LinearLayout xmlns:android = "http://schemas.android.com/apk/res/android"
   xmlns:tools = "http://schemas.android.com/tools"
   android:layout_width = "match_parent"
   android:layout_height = "match_parent"
   tools:context = ".MainActivity"
   android:orientation = "vertical">
   <EditText
      android:id = "@+id/name"
      android:layout_width = "match_parent"
      android:hint = "Enter Name"
      android:layout_height = "wrap_content" />
   <LinearLayout
      android:layout_width = "wrap_content"
      android:layout_height = "wrap_content">
      <Button
         android:id = "@+id/save"
         android:text = "Save"
         android:layout_width = "wrap_content"
         android:layout_height = "wrap_content" />
   </LinearLayout>
   <TextView
      android:id = "@+id/textview"
      android:layout_width = "match_parent"
      android:layout_height = "match_parent" />
</LinearLayout>
