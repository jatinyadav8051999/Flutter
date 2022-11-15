package com.example.andy.myapplication;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import java.util.HashMap;
public class MainActivity extends AppCompatActivity {
   EditText name;
   HashMap<Character, Integer> charCountMap;
   TextView textview;
   @Override
   protected void onCreate(Bundle readdInstanceState) {
      super.onCreate(readdInstanceState);
      setContentView(R.layout.activity_main);
      name = findViewById(R.id.name);
      textview = findViewById(R.id.textview);
      charCountMap = new HashMap<>();
      findViewById(R.id.save).setOnClickListener(new View.OnClickListener() {
         @Override
         public void onClick(View v) {
            if (!name.getText().toString().isEmpty()) {
               StringBuffer c = new StringBuffer(name.getText().toString());
               textview.setText(c.reverse());
               Toast.makeText(MainActivity.this, "Inserted", Toast.LENGTH_LONG).show();
            } else {
               name.setError("Enter NAME");
            }
         }
      });
   }
}