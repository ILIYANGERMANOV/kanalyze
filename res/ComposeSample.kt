@Composable
fun MainScreen() {
    Column {
        var counter by remember { mutableStateOf(0) }

        Button(text = "Click me") {
            counter++
        }
    }
}