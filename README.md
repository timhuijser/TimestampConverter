# Todo
- Prefill current timestamp
- Timestamp textfield wider
- Add timezone support

# Add
- (BOOL) applicationShouldOpenUntitledFile:(NSApplication *)sender
{
    [window makeKeyAndOrderFront:self];
    return NO;
}
