#!/bin/sh
APP_HOME=$(cd "$(dirname "$0")" && pwd)
APP_BASE_NAME=$(basename "$0")
DEFAULT_JVM_OPTS="-Xmx2048m"

warn() { echo "$*"; }
die() { echo "$*"; exit 1; }

cygwin=false
msys=false
case "$(uname)" in
  CYGWIN*) cygwin=true ;;
  MINGW*) msys=true ;;
esac

if [ -n "$JAVA_HOME" ]; then
    JAVACMD="$JAVA_HOME/bin/java"
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME not set"
fi

set -- $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS \
    "-Dorg.gradle.appname=$APP_BASE_NAME" \
    -classpath "\"$APP_HOME/gradle/wrapper/gradle-wrapper.jar\"" \
    org.gradle.wrapper.GradleWrapperMain "$@"

exec "$JAVACMD" "$@"
