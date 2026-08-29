# macOS standalone

Copyright (c) Dmitrii Shchukin 2026

This directory is the macOS build lane for **Computational Modeling of Webern's
Op. 10**. The final user receives one visible application bundle inside
`WebernCompositionalModel-macOS-universal.zip`; Max and bach do not need to be
installed on the user's computer.

## Build once in Max 8

1. Open `build-source/WebernCompositionalModel.maxpat` in Max on macOS.
2. Save the patch once and confirm that no red errors appear in the Max Console.
3. Choose **File → Build Collective / Application…**.
4. In the Collective Editor choose **Include Folder…** and select this complete
   `build-source` folder.
5. Choose **Build → Application** and save as
   `WebernCompositionalModel.app`.
6. Quit Max. Launch the new app and test **Build Score**, **Play**, **Stop** and
   **Export XML**.
7. In Terminal, from the repository root, run:

   ```sh
   sh standalone/packaging/macos/package_macos.sh \
     "/absolute/path/WebernCompositionalModel.app" \
     "standalone/macos/release/WebernCompositionalModel-macOS-universal.zip"
   ```

Upload the ZIP together with the Max Console build log or a screenshot. The
release is final only after the archive has been opened and launched on a Mac
without Max.
