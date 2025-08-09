{ pkgs, ... }:

{
  home.file.".config/quickshell/default/shell.qml" = {
    text = ''
      // Import the necessary Quickshell components
      import QtQuick 2.15
      import Quickshell 1.0

      // The root item of your shell
      Shell {
          // An ID to reference this item later
          id: root

          // Set the window dimensions
          width: 600
          height: 400

          // Add a simple text label
          Label {
              // Center the label in the parent window
              anchors.centerIn: parent

              // Set the text content
              text: "Hello from a declarative Nix config! ❄️"

              // Set the font size
              font.pixelSize: 24
          }
      }
    '';
  };
}
