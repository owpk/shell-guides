#!/bin/bash
// 2>/dev/null; SCRIPT_DIR=`pwd`
// 2>/dev/null; OPTS="-cp $SCRIPT_DIR/ANSI-java.jar:$SCRIPT_DIR/file-utils-1.0.jar"
// 2>/dev/null; OPTS="$OPTS -d"
// 2>/dev/null; OPTS="$OPTS -Dlog4j.configuration=file:/etc/myapp/log4j.xml"
// 2>/dev/null; exec groovy $OPTS "$0" "$@"; exit $?

import ansi.ANSIJava
import ansi.Color

println(ANSIJava.colorize("ABOBA", Color.YELLOW))

