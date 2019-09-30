package com.example.flutter_app;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.text.TextUtils;
import android.widget.Toast;

import java.text.SimpleDateFormat;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.flyou.test/android";
    private static final String NET_CHANGE_CHANNEL = "com.flyou.test/netChanged";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                if (call.method.equals("showToast")) {
                    if (call.hasArgument("msg") && !TextUtils.isEmpty(call.argument("msg").toString())) {
                        Toast.makeText(MainActivity.this, call.argument("msg").toString(), Toast.LENGTH_SHORT).show();
                    } else {
                        Toast.makeText(MainActivity.this, "toast text must not null", Toast.LENGTH_SHORT).show();
                    }
                } else if (call.method.equals("getAndroidTime")) {

                    result.success(getCurrentTime());
                } else if (call.method.equals("StartActivity")) {
                    startActivity(new Intent(MainActivity.this, DemoActivity.class));

                }
            }
        });


        new EventChannel(getFlutterView(), NET_CHANGE_CHANNEL).setStreamHandler(
                new EventChannel.StreamHandler() {
                    private BroadcastReceiver netStateChangeReceiver;

                    @Override
                    public void onListen(Object arguments, EventChannel.EventSink events) {

                        netStateChangeReceiver = createNetStateChangeReceiver(events);
                        registerReceiver(netStateChangeReceiver, new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION));
                    }

                    @Override
                    public void onCancel(Object arguments) {
                        unregisterReceiver(netStateChangeReceiver);
                        netStateChangeReceiver = null;
                    }
                }
        );

    }

    private String getCurrentTime() {
        return new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis());
    }

    private BroadcastReceiver createNetStateChangeReceiver(final EventChannel.EventSink events) {
        return new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                boolean networkConnected = isNetworkConnected(context);
                events.success(networkConnected ? "网络可用" : "网络不可用");
            }
        };
    }

    public boolean isNetworkConnected(Context context) {
        if (context != null) {
            ConnectivityManager mConnectivityManager = (ConnectivityManager) context
                    .getSystemService(Context.CONNECTIVITY_SERVICE);
            NetworkInfo mNetworkInfo = mConnectivityManager.getActiveNetworkInfo();
            if (mNetworkInfo != null) {
                return mNetworkInfo.isAvailable();
            }
        }
        return false;
    }
}


