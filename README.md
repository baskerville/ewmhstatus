## Description

The output of `ewmhstatus` shall be fed to `dzen2`.

Provide the current desktop name and window title.

Read external informations from the fifo defined by the `EWMHSTATUS_FIFO` environment variable.

## Usage

    ewmhstatus [FONT_FAMILY [FONT_SIZE [HORIZONTAL_PADDING]]]

## Layout

    Current Desktop Name        Current Window Title         Fifo Informations

## Example Panel

    [ -e "$EWMHSTATUS_FIFO" ] && rm "$EWMHSTATUS_FIFO"
    mkfifo "$EWMHSTATUS_FIFO"
    ewmhstatus | dzen2 -ta l &
    i3status > "$EWMHSTATUS_FIFO" &

## Requirements

XCB, Cairo.
