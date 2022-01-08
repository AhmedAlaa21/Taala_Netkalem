class Message {
  final String? text;
  final String? sender;
  final bool? isRead;

  const Message({
    this.text, // message content
    this.sender, //email
    this.isRead,// will help to handle the tab screens
  });
}
