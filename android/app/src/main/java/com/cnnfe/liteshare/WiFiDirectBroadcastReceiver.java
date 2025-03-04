package com.cnnfe.liteshare;


import android.annotation.TargetApi;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.NetworkInfo;
import android.net.wifi.p2p.WifiP2pDevice;
import android.net.wifi.p2p.WifiP2pManager;
import android.net.wifi.p2p.WifiP2pManager.Channel;
import android.net.wifi.p2p.WifiP2pManager.PeerListListener;
import android.os.Build;
import android.util.Log;

@TargetApi(Build.VERSION_CODES.ICE_CREAM_SANDWICH)  //new
public class WiFiDirectBroadcastReceiver<action> extends BroadcastReceiver {


    private WifiP2pManager manager;
    private Channel channel;
    private WiFiDirectActivity activity;


    public WiFiDirectBroadcastReceiver(WifiP2pManager manager, Channel channel,
                                       WiFiDirectActivity activity) {
        super();
        this.manager = manager;
        this.channel = channel;
        this.activity = activity;
    }
    @Override
    public void onReceive(Context context, Intent intent) {


        // UI update to indicate wifi p2p status.
        int state = intent.getIntExtra(WifiP2pManager.EXTRA_WIFI_STATE, -1);
        if (state == WifiP2pManager.WIFI_P2P_STATE_ENABLED) {
            // Wifi Direct mode is enabled
            activity.setIsWifiP2pEnabled(true);
        } else {
            activity.setIsWifiP2pEnabled(false);
            activity.resetData();

        }
        Log.d(WiFiDirectActivity.TAG, "P2P state changed - " + state);
    } else if (WifiP2pManager.WIFI_P2P_PEERS_CHANGED_ACTION.equals(action)) {

        // request available peers from the wifi p2p manager. This is an
        // asynchronous call and the calling activity is notified with a
        // callback on PeerListListener.onPeersAvailable()


        if (manager != null)
        {
            manager.requestPeers(channel, (PeerListListener) activity.getFragmentManager()
                    .findFragmentById(R.id.frag_list));
        } //added permission ACCESS_FINE_LOCATION in mainfest file still showing error
        Log.d(WiFiDirectActivity.TAG, "P2P peers changed");
    }
    else if (WifiP2pManager.WIFI_P2P_CONNECTION_CHANGED_ACTION.equals(action)) {

        if (manager == null) {
            return;
        }

        NetworkInfo networkInfo = (NetworkInfo) intent
                .getParcelableExtra(WifiP2pManager.EXTRA_NETWORK_INFO);

        if (networkInfo.isConnected()) {

            // we are connected with the other device, request connection
            // info to find group owner IP

            DeviceDetailFragment fragment = (DeviceDetailFragment) activity
                    .getFragmentManager().findFragmentById(R.id.frag_detail);
            manager.requestConnectionInfo(channel, fragment);
        } else {
            // It's a disconnect
            activity.resetData();
        }
    } else if (WifiP2pManager.WIFI_P2P_THIS_DEVICE_CHANGED_ACTION.equals(action))

    {
        DeviceListFragment fragment = (DeviceListFragment) activity.getFragmentManager()
                .findFragmentById(R.id.frag_list);
        fragment.updateThisDevice((WifiP2pDevice) intent.getParcelableExtra(
                WifiP2pManager.EXTRA_WIFI_P2P_DEVICE));
    }
    }
}
