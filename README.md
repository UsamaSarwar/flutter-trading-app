# Flutter Trading App `v1.0.0`

🔗 Visit [Live Web App](https://usamasarwar.github.io/flutter-trading-app)

## Screenshoots

<img src="https://i.imgur.com/Y2hKD2v.png"/>

> Tip: You can switch currencies by tapping on the currency Symbols.

<img src="https://i.imgur.com/mRLWt2M.png"/>

> Tip: You can change your desired duration. i.e. 1m, 3m or 1d etc.

<img src="https://i.imgur.com/luI9ah8.png"/>

> Tip: You can scroll up and down to zoom-in and zoom-out.

## Documentation

### Establishing Connection with Binance via Web Sockets
```dart
  WebSocketChannel establishConnection(String symbol, String interval) {
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws'),
    );
    channel.sink.add(
      jsonEncode(
        {
          "method": "SUBSCRIBE",
          "params": ["$symbol@kline_$interval"],
          "id": 1
        },
      ),
    );
    return channel;
  }
```

### API Call for fetching Candles
```dart
  Future<List<Candle>> fetchCandles(
      {required String symbol, required String interval, int? endTime}) async {
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=$symbol&interval=$interval${endTime != null ? "&endTime=$endTime" : ""}");
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }
```

### API Calls for fetching Symbols
```dart
  Future<List<String>> fetchSymbols() async {
    final uri = Uri.parse("https://api.binance.com/api/v3/ticker/price");
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => e["symbol"] as String)
        .toList();
  }
```

### Dependencies
```yaml
dependencies:
  # Flutter SDK
  flutter:
    sdk: flutter
  # Dependency for Icons
  cupertino_icons: ^1.0.2
  # Dependency for HTTP Calls
  http: ^0.13.3
  # Dependency for Web Socket Channels
  web_socket_channel: ^2.1.0
```

## Developer
[Usama Sarwar](https://github.com/UsamaSarwar)