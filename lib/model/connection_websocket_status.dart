// import 'package:dg_front/missionFailed.dart';
// import 'package:dg_front/missionSuccess.dart';
// import 'package:dg_front/gameClear.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class ConnectionWebsocketStatus {
  WebSocketChannel? channel;
  String? _client_id;

  //websocketの接続状態を監視するための関数
  void onConnectionWebsocketStatus(WebSocketChannel channel, String _client_id , BuildContext context) {
    // WebSocketの状態を監視し、接続が切れた場合に再接続を試みる
    this.channel = channel;
    this._client_id = _client_id;
    channel.stream.listen(
      (message) {
        // メッセージを受信したときの処理
        print('WebSocket message: $message');

        // 受信したメッセージを元に画面遷移の処理を行う
        // if (message == "成功") {
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (context) => const MissionSuccess(),
        //   ));
        // }else if(message == "失敗"){
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (context) => const MissionFailed(),
        //   ));
        // }else if(message == "ゲームクリア") {
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (context) => const GameClear(),
        //   ));
        // }else if(message == "ミッション作成") {
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (context) => const Detail(),
        //   ));
        // }
      },
      onDone: () {
        // 接続が切れたときの処理
        print('再接続を試みます');
        _reconnect();
      },
      onError: (error) {
        // エラーが発生したときの処理
        print('WebSocket error: $error');
        _reconnect();
      },
    );
  }
  // WebSocketの再接続を試みる関数
  void _reconnect() {
    channel = IOWebSocketChannel.connect(Uri.parse("ws://IP:PORT:8000/ws/$_client_id"));
  }
}