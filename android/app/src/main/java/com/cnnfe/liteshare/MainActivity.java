package com.cnnfe.liteshare;

import android.os.Bundle;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity
{
    //for connecting Android and Flutter
    private static final String CHANNEL = "com.cnnfe.liteshare/liteshare";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine)
    {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("send"))
                            {
                                result.success("sent");
                                //Toast.makeText(this, "Sent", Toast.LENGTH_LONG);
                                //TODO: Define send
                            }

                            if (call.method.equals("receive"))
                            {
                                result.success("received");
                                //Toast.makeText(this, "Received", Toast.LENGTH_LONG);
                                //TODO: Define send
                            }
                        }
                );
    }


}
