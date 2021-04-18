INCLUDEPATH *= $$PWD/src/hunspell

DEPENDPATH *= $$PWD/src/hunspell
DEPENDPATH *= $$PWD/src/parsers

OUT_FOLDER = $$absolute_path($$relative_path($$PWD, $$_PRO_FILE_PWD_), $$OUT_PWD)
win32:CONFIG(release, debug|release) {
    LIBS += $$OUT_FOLDER/release/Hunspell.lib
    # For static library, we need to add this depends to let Qt re-build the target
    # when there is a change in the library.
    PRE_TARGETDEPS += $$OUT_FOLDER/release/Hunspell.lib
} else:win32:CONFIG(debug, debug|release) {
    LIBS += $$OUT_FOLDER/debug/Hunspell.lib
    PRE_TARGETDEPS += $$OUT_FOLDER/debug/Hunspell.lib
} else:unix {
    LIBS += $$OUT_FOLDER/libHunspell.a
    PRE_TARGETDEPS += $$OUT_FOLDER/libHunspell.a
}
