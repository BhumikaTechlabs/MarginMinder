package com.example.shara.marginminder;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by shara on 31/03/2018.
 */

public class Card {

    JSONObject result;
    public Card(JSONObject result)
    {
        String data = null;
        try {
            data = result.get("data").toString();
            this.result = new JSONObject(data);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public String getSales()
    {
        try {
            return result.get("sales").toString();
        } catch (JSONException e) {
            e.printStackTrace();
            return  null;
        }
    }

    public String getpurchases()
    {
        try {
            return result.get("purchase").toString();
        } catch (JSONException e) {
            e.printStackTrace();
            return  null;
        }
    }

    public String getTradeMargin()
    {
        try {
            return result.get("trade_margin").toString();
        } catch (JSONException e) {
            e.printStackTrace();
            return  null;
        }
    }

    public String getHsnCode()
    {
        try {
            return result.get("hsn_code").toString();
        } catch (JSONException e) {
            e.printStackTrace();
            return  null;
        }
    }

}
