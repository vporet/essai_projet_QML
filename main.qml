import QtQuick 2.3
import QtQuick.Window 2.2
import QtMultimedia 5.5
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

     Camera{
         id:camera
         position:Camera.BackFace
         imageCapture{
             onImageCaptured: {
                 previewImage.source=preview;
                 previewImage.visible=true;
             }
             onImageSaved: console.log("picture saved to :"+path)
         }

     }
     VideoOutput{
         id:viewfinder
         source:camera
         anchors.fill:parent
     }

     Overlay{
         id:overlay
         //our control panel as custom type
         anchors.bottom: parent.bottom
         anchors.horizontalCenter: parent.horizontalCenter
         width : 100; height:50
         onTakePhoto: camera.imageCapture.capture();
         onFlashModeChanged: console.log("FlashMode:"+flashMode)
     }
     Image{
         id:previewImage
         anchors.fill: parent
         fillMode: Image.PreserveAspectFit
         visible: false
         MouseArea{
             anchors.fill: parent;
             onClicked:parent.visible = false
         }
     }

    /* QZXingFilter {
         id: zxingFilter
         decoder {
             onTagFound: {
                 console.log(tag);
             }
         }
     }*/
}
