package com.example.shara.marginminder;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class Start extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_start);
    }

    public void loginChange(View view) {
        Intent i = new Intent(Start.this, Login.class);
        startActivity(i);
    }

    public void registerChange(View view) {
        Intent i = new Intent(Start.this, Register.class);
        startActivity(i);
    }
}
