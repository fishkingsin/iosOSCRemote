#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "ofxUI.h"
#include "ofxOsc.h"
#define HOST "raspberrypi.local"
#define PORT 12345
class testApp : public ofxiPhoneApp{
	
public:
	void setup();
	void update();
	void draw();
	void exit();
	
	void touchDown(ofTouchEventArgs & touch);
	void touchMoved(ofTouchEventArgs & touch);
	void touchUp(ofTouchEventArgs & touch);
	void touchDoubleTap(ofTouchEventArgs & touch);
	void touchCancelled(ofTouchEventArgs & touch);
	
	void lostFocus();
	void gotFocus();
	void gotMemoryWarning();
	void deviceOrientationChanged(int newOrientation);
	//	void drawGrid(float x, float y);
    
	void setGUI1();
	void setGUI2();
	void setGUI3();
	void setGUI4();
	
	ofxUICanvas *gui1;
	ofxUICanvas *gui2;
	ofxUICanvas *gui3;
    ofxUIScrollableCanvas *gui4;
	
    
	//	bool hideGUI;
	//
	float red, green, blue;
	//	bool bdrawGrid;
	//	bool bdrawPadding;
	
	void gui1Event(ofxUIEventArgs &e);
	void gui2Event(ofxUIEventArgs &e);
	void gui3Event(ofxUIEventArgs &e);
	void gui4Event(ofxUIEventArgs &e);
    
	ofxUIDropDownList *dropDownList;
	ofxUIToggleMatrix *matrix;
	//    ofxUIMovingGraph *mg;
	//    float *buffer;
	//    ofImage *img;
	
	ofxOscSender sender;
	bool sendInfo;
	
};


