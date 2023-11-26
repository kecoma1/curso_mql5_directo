void OnInit() {
    Print("OnInit");
    EventSetTimer(10);
}

void OnDeinit() {
    Print("OnDeinit");
}

void OnTick() {
    Print("OnTick");
}

void OnTimer() {
    Print("OnTimer");
}