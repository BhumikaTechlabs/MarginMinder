package com.example.shara.marginminder;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.design.widget.TextInputEditText;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONObject;

import java.io.UnsupportedEncodingException;

public class Login extends AppCompatActivity {

    TextInputEditText email, password;
    String token;
    Boolean isAdmin = true;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        email = findViewById(R.id.emailet);
        password = findViewById(R.id.passwordet);

    }

    public void mainChange(View view) {

        try {
            setToken();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    public  void  setToken()  throws UnsupportedEncodingException
    {
        // Get user defined values
        final String Email   = email.getText().toString();
        final String Pass   = password.getText().toString();

        RequestQueue queue = Volley.newRequestQueue(getApplicationContext());

        //build auth token uri
        Uri.Builder builder = new Uri.Builder();
        String host = "10.2.0.167:8081";
        builder.scheme("http")
                .encodedAuthority(host)
                .appendPath("api")
                .appendPath("auth")
                .appendQueryParameter("email", Email)
                .appendQueryParameter("password", Pass);
        final String authUrl = builder.build().toString();

        StringRequest postRequest = new StringRequest( Request.Method.GET, authUrl,
                new Response.Listener<String>()
                {
                    @Override
                    public void onResponse(String response) {

                        try {
                            //converting response to json
                            JSONObject obj = new JSONObject(response);
                            String data = obj.get("data").toString();
                            obj = new JSONObject(data);
                            //setting our token
                            token = obj.get("token").toString();
                            Toast.makeText(Login.this, token, Toast.LENGTH_LONG).show();
                        } catch (Throwable t) {
                            Log.e("My App", "Could not parse malformed JSON: \"" + response + "\"");
                            token = "invalid";
                        }
                        finally {
                            if(isAdmin && !token.equals("invalid")) {
                                Intent i = new Intent(Login.this, MainActivity.class);
                                i.putExtra("token", token);
                                startActivity(i);
                                finish();
                            }else{
                                Toast.makeText(Login.this, "invalid credentials, try again", Toast.LENGTH_SHORT).show();
                            }
                        }
                    }
                },
                new Response.ErrorListener()
                {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        // error
                        Log.d("Error.Response", error.toString());
                    }
                }
        ) {

        };
        queue.add(postRequest);
    }

}
