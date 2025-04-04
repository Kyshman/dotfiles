function read-qr --wraps='scrot -o -f -d b8 -s -b -l style=dash,width=3,color=red $TMPDIR/screencapture.bmp && zbarimg -q --raw $TMPDIR/screencapture.bmp; shred -u $TMPDIR/screencapture.bmp' --wraps='scrot -o -f -d b8 -s -b -l style=dash,width=3,color=red $TMPDIR/screencapture.png && zbarimg -q --raw $TMPDIR/screencapture.png; shred -u $TMPDIR/screencapture.png' --description 'Capture a QR Code on-screen and output its contents to the terminal'
  scrot -o -f -d b8 -s -b -l style=dash,width=3,color=red $TEMP_DIR/screencapture.png
  zbarimg -q --raw $TEMP_DIR/screencapture.png
  shred -u $TEMP_DIR/screencapture.png
end
