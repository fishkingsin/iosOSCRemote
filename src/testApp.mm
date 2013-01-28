#include "testApp.h"
#define GLOBAL_WIDTH 255
//--------------------------------------------------------------
void testApp::setup(){
	// initialize the accelerometer
	ofxAccelerometer.setup();
	ofSetLogLevel(OF_LOG_VERBOSE);
	//If you want a landscape oreintation
	iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	sender.setup(HOST, PORT);
	
	ofEnableSmoothing();
	ofBackground(0);
	
	setGUI1();
	setGUI2();
    setGUI3();
    setGUI4();
	
    gui1->setDrawBack(false);
    gui2->setDrawBack(false);
    gui3->setDrawBack(false);
    gui4->setDrawBack(false);
	
	//    gui1->setDrawBack(true);
	//    gui2->setDrawBack(true);
	//    gui3->setDrawBack(true);
	//    gui4->setDrawBack(true);
    
	//    gui1->setDrawPadding(false);
	//    gui2->setDrawPadding(false);
	//    gui3->setDrawPadding(false);
	//
    ofBackground(red, green, blue);
}

//--------------------------------------------------------------
void testApp::update(){
	//	mg->addPoint(ofGetFrameRate());
}

//--------------------------------------------------------------
void testApp::draw(){
	ofBackground(red, green, blue, 255);
	
	ofPushStyle();
	ofEnableBlendMode(OF_BLENDMODE_ALPHA);
	
	
	//	if(bdrawGrid)
	//	{
	//		ofSetColor(255, 255, 255, 25);
	//		drawGrid(8,8);
	//	}
    
	ofPopStyle();
    
    ofSetRectMode(OF_RECTMODE_CENTER);
}
//--------------------------------------------------------------
void testApp::gui1Event(ofxUIEventArgs &e)
{
	ofxOscBundle bundle;
	
	ofxOscMessage m;
	if(sendInfo)
	{
		sendInfo = false;
		m.setAddress("/PANEL1");
		bundle.addMessage(m);
		m.clear();
		
	}
	//	m.setAddress("/sine");
	//	m.addFloatArg(currentSineValue);
	//	bundle.addMessage(m);
	//	m.clear();
	//
	//	m.setAddress("/noise");
	//	m.addFloatArg(currentNoiseValue);
	//	bundle.addMessage(m);
	//	m.clear();
	//
	//	m.setAddress("/freedraw/x");
	//	m.addFloatArg(currentFreeDrawCursor.x);
	//	bundle.addMessage(m);
	//	m.clear();
	//
	//	m.setAddress("/freedraw/y");
	//	m.addFloatArg(currentFreeDrawCursor.y);
	//	bundle.addMessage(m);
	//	m.clear();
	//
	//	if(sendBang){
	//		m.setAddress("/bang");
	//		bundle.addMessage(m);
	//		m.clear();
	//		sendBang = false;
	//	}
	//
	
	string name = e.widget->getName();
//	int kind = e.widget->getKind();
//	ofLogVerbose() << "got event from: " << name << endl << "got event kind: " << kind;
	if(name == "IP")
	{
		ofxUIDropDownList* list = (ofxUIDropDownList*)e.widget;
		vector <ofxUIWidget*>widgets =  list->getSelected();
		for(int i = 0 ; i < widgets.size() ; i++)
		{
			ofLogVerbose("IP") << widgets[i]->getName();
			sender.setup(widgets[i]->getName(), PORT);
		}
	}
	else if(name == "RED")
	{
		ofxUISlider *slider = (ofxUISlider *) e.widget;
		ofLogVerbose() << "RED " << slider->getScaledValue() << endl;
		red = slider->getScaledValue();
			
		m.setAddress("/RED");
		m.addFloatArg(red);
		bundle.addMessage(m);
		m.clear();
		m.setAddress("/GREEN");
		m.addFloatArg(green);
		bundle.addMessage(m);
		m.clear();
		m.setAddress("/BLUE");
		m.addFloatArg(blue);
		bundle.addMessage(m);
		m.clear();
	}
	else if(name == "GREEN")
	{
		ofxUISlider *slider = (ofxUISlider *) e.widget;
		ofLogVerbose() << "GREEN " << slider->getScaledValue() << endl;
		green = slider->getScaledValue();
		
		m.setAddress("/RED");
		m.addFloatArg(red);
		bundle.addMessage(m);
		m.clear();
		m.setAddress("/GREEN");
		m.addFloatArg(green);
		bundle.addMessage(m);
		m.clear();
		m.setAddress("/BLUE");
		m.addFloatArg(blue);
		bundle.addMessage(m);
		m.clear();
	}
	
	else if(name == "BLUE")
	{
		ofxUISlider *slider = (ofxUISlider *) e.widget;
		ofLogVerbose() << "BLUE " << slider->getScaledValue() << endl;
		blue = slider->getScaledValue();
		
		m.setAddress("/RED");
		m.addFloatArg(red);
		bundle.addMessage(m);
		m.clear();
		m.setAddress("/GREEN");
		m.addFloatArg(green);
		bundle.addMessage(m);
		m.clear();
		m.setAddress("/BLUE");
		m.addFloatArg(blue);
		bundle.addMessage(m);
		m.clear();
	}
	else if(name == "FRAME")
	{
		ofxUISlider *slider = (ofxUISlider *) e.widget;
		ofLogVerbose() << "FRAME " << slider->getScaledValue() << endl;
		float frame = slider->getScaledValue();
		
		m.setAddress("/FRAME");
		m.addFloatArg(frame);
		bundle.addMessage(m);
		m.clear();
		
	}
	
	
	
	//	else if(name == "DRAW GRID")
	//	{
	//		ofxUIButton *button = (ofxUIButton *) e.widget;
	//		bdrawGrid = button->getValue();
	//	}
	//	else if(name == "D_GRID")
	//	{
	//		ofxUIToggle *toggle = (ofxUIToggle *) e.widget;
	//		bdrawGrid = toggle->getValue();
	//	}
	//    else if(name == "TEXT INPUT")
	//    {
	//        ofxUITextInput *textinput = (ofxUITextInput *) e.widget;
	//        if(textinput->getTriggerType() == OFX_UI_TEXTINPUT_ON_ENTER)
	//        {
	//            ofLogVerbose() << "ON ENTER: ";
	//			//            ofUnregisterKeyEvents((testApp*)this);
	//        }
	//        else if(textinput->getTriggerType() == OFX_UI_TEXTINPUT_ON_FOCUS)
	//        {
	//            ofLogVerbose() << "ON FOCUS: ";
	//        }
	//        else if(textinput->getTriggerType() == OFX_UI_TEXTINPUT_ON_UNFOCUS)
	//        {
	//            ofLogVerbose() << "ON BLUR: ";
	//			//            ofRegisterKeyEvents(this);
	//        }
	//        string output = textinput->getTextString();
	//        ofLogVerbose() << output << endl;
	//    }
	sender.sendBundle(bundle);
	
	
}
void testApp::gui2Event(ofxUIEventArgs &e)
{
	ofxOscBundle bundle;
	ofxOscMessage m;
	if(sendInfo)
	{
		sendInfo = false;
		m.setAddress("/PANEL2");
		bundle.addMessage(m);
		m.clear();
		
	}
	string name = e.widget->getName();
	if(name == "LABEL BUTTON")
	{
		ofxUILabelButton *widget = (ofxUILabelButton *) e.widget;
		m.setAddress("/"+name);
		m.addIntArg(widget->getValue());
		bundle.addMessage(m);
		m.clear();
	}
	else if(name == "ENABLE_SCREENSAVER")
	{
		ofxUIToggle *widget = (ofxUIToggle *) e.widget;
		m.setAddress("/"+name);
		m.addIntArg(widget->getValue());
		bundle.addMessage(m);
		m.clear();
	}else if(name == "ACCELERATION")
	{
		ofxUISlider *widget = (ofxUISlider *) e.widget;
		m.setAddress("/"+name);
		m.addFloatArg(widget->getScaledValue());
		bundle.addMessage(m);
		m.clear();
	}
	

	
	else if(name == "SPINNER")
	{
		ofxUIRotarySlider *widget = (ofxUIRotarySlider *) e.widget;
		m.setAddress("/"+name);
		m.addFloatArg(widget->getScaledValue());
		bundle.addMessage(m);
		m.clear();
	}
	
	sender.sendBundle(bundle);
}
void testApp::gui3Event(ofxUIEventArgs &e)
{
	ofxOscBundle bundle;
	ofxOscMessage m;
	if(sendInfo)
	{
		sendInfo = false;
		m.setAddress("/PANEL3");
		bundle.addMessage(m);
		m.clear();
		
	}
	
	string name = e.widget->getName();
	int kind = e.widget->getKind();
	ofLogVerbose() << "got event from: " << name << endl;
	ofLogVerbose() << "got kind from: " << kind << endl;
	if(name.find("MATRIX3")!=string::npos){
		m.setAddress("/MATRIX3");
		
//		ofxUIToggleMatrix *matrix = (ofxUIToggleMatrix *)e.widget;
		vector<ofxUIToggle *> toggles = matrix->getToggles();
		for(int i = 0 ; i < toggles.size() ; i++)
		{
			m.addIntArg(toggles[i]->getValue());
		}
		bundle.addMessage(m);
		m.clear();
	}
	else if(name == "R2SLIDER"){
		m.setAddress("/"+name);
		
		ofxUIRotarySlider *slider = (ofxUIRotarySlider *)e.widget;
		m.addFloatArg(slider->getScaledValue() );
		bundle.addMessage(m);
		m.clear();
	}
	else if(name == "NORTH SOUTH"){
		m.setAddress("/"+name);
		
		ofxUICircleSlider *slider = (ofxUICircleSlider *)e.widget;
		m.addFloatArg(slider->getScaledValue() );
		bundle.addMessage(m);
		m.clear();
	}
	else if(name == "DROP DOWN LIST"){
		m.setAddress("/"+name);
		
//		ofxUIDropDownList *list = (ofxUIDropDownList *)e.widget;
		vector<ofxUIWidget *> toggle =  dropDownList->getSelected();
		for(int i = 0 ; i < toggle.size() ; i++)
		{
			m.addStringArg(toggle[i]->getName());
		}
		
		bundle.addMessage(m);
		m.clear();
	}
	
	sender.sendBundle(bundle);
}
void testApp::gui4Event(ofxUIEventArgs &e)
{
	ofxOscBundle bundle;
	ofxOscMessage m;
	if(sendInfo)
	{
		sendInfo = false;
		m.setAddress("/PANEL4");
		bundle.addMessage(m);
		m.clear();
		
	}
	string name = e.widget->getName();
//	ofLogVerbose("gui4Event") << name << " x: " << e.widget->getRect()->getPosition().y;
	
	if(name == "SCROLLABLE"){
		m.setAddress("/"+name+"/Y");
		
//		ofxUIScrollableCanvas *list = (ofxUIScrollableCanvas *)e.widget;
		m.addFloatArg(e.widget->getRect()->getPosition().y);
		
		bundle.addMessage(m);
		m.clear();
	}
	else if (name.find("LABEL_BUTTON_")!=string::npos)
	{
		ofxUILabelButton *widget = (ofxUILabelButton *) e.widget;
		m.setAddress("/"+name);
		m.addIntArg(widget->getValue());
		bundle.addMessage(m);
		m.clear();
	}
	
	sender.sendBundle(bundle);
}
//--------------------------------------------------------------
void testApp::exit(){
	delete gui1;
	delete gui2;
    delete gui3;
    delete gui4;
	//	delete[] buffer;
	//    delete img;
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
	sendInfo = true;
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
	
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){
	
}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){
	
}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){
	
}

//--------------------------------------------------------------
void testApp::gotFocus(){
	
}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){
	
}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){
	
}

//void testApp::drawGrid(float x, float y)
//{
//    float w = ofGetWidth();
//    float h = ofGetHeight();
//
//    for(int i = 0; i < h; i+=y)
//    {
//        ofLine(0,i,w,i);
//    }
//
//    for(int j = 0; j < w; j+=x)
//    {
//        ofLine(j,0,j,h);
//    }
//}

void testApp::setGUI1()
{
	red = 233; blue = 52; green = 27;
	ofxOscBundle bundle;
	ofxOscMessage m;
	m.setAddress("/RED");
	m.addFloatArg(red);
	bundle.addMessage(m);
	m.clear();
	m.setAddress("/GREEN");
	m.addFloatArg(green);
	bundle.addMessage(m);
	m.clear();
	m.setAddress("/BLUE");
	m.addFloatArg(blue);
	bundle.addMessage(m);
	m.clear();
	
	m.setAddress("/FRAME");
	m.addFloatArg(0);
	bundle.addMessage(m);
	m.clear();
	float dim = 16;
	float xInit = OFX_UI_GLOBAL_WIDGET_SPACING;
    float length = GLOBAL_WIDTH-xInit;
	//	hideGUI = false;
	
	//    vector<string> names;
	//	names.push_back("RAD1");
	//	names.push_back("RAD2");
	//	names.push_back("RAD3");
	gui1 = new ofxUICanvas(0, 0, length+xInit, ofGetHeight());
	gui1->addWidgetDown(new ofxUILabel("PANEL 1: BASICS", OFX_UI_FONT_LARGE));
	//    gui1->addWidgetDown(new ofxUILabel("Press 'h' to Hide GUIs", OFX_UI_FONT_LARGE));
	
    gui1->addSpacer(length-xInit, 2);
	gui1->addWidgetDown(new ofxUILabel("H SLIDERS", OFX_UI_FONT_MEDIUM));
	gui1->addSlider("RED", 0.0, 255.0, red, length-xInit, dim);
	gui1->addSlider("GREEN", 0.0, 255.0, green, length-xInit,dim);
	gui1->addSlider("BLUE", 0.0, 255.0, blue, length-xInit,dim);
	gui1->addWidgetDown(new ofxUIRotarySlider(length-xInit, 0.0, 1.0, 0.0, "FRAME"));
//	gui1->addSlider();
	
	//    gui1->addSpacer(length-xInit, 2);
	//    gui1->addWidgetDown(new ofxUILabel("V SLIDERS", OFX_UI_FONT_MEDIUM));
	//	gui1->addSlider("0", 0.0, 255.0, 150, dim, 160);
	//	gui1->setWidgetPosition(OFX_UI_WIDGET_POSITION_RIGHT);
	//	gui1->addSlider("1", 0.0, 255.0, 150, dim, 160);
	//	gui1->addSlider("2", 0.0, 255.0, 150, dim, 160);
	//	gui1->addSlider("3", 0.0, 255.0, 150, dim, 160);
	//	gui1->addSlider("4", 0.0, 255.0, 150, dim, 160);
	//	gui1->addSlider("5", 0.0, 255.0, 150, dim, 160);
	//	gui1->addSlider("6", 0.0, 255.0, 150, dim, 160);
	//	gui1->addSlider("7", 0.0, 255.0, 150, dim, 160);
	//	gui1->addSlider("8", 0.0, 255.0, 150, dim, 160);
	//	gui1->setWidgetPosition(OFX_UI_WIDGET_POSITION_DOWN);
	//
	//    gui1->addSpacer(length-xInit, 2);
	//	gui1->addRadio("RADIO HORIZONTAL", names, OFX_UI_ORIENTATION_HORIZONTAL, dim, dim);
	//	gui1->addRadio("RADIO VERTICAL", names, OFX_UI_ORIENTATION_VERTICAL, dim, dim);
	//
	//    gui1->addSpacer(length-xInit, 2);
	//	gui1->addWidgetDown(new ofxUILabel("BUTTONS", OFX_UI_FONT_MEDIUM));
	//	gui1->addButton("DRAW GRID", false, dim, dim);
	//	gui1->addWidgetDown(new ofxUILabel("TOGGLES", OFX_UI_FONT_MEDIUM));
	//	gui1->addToggle( "D_GRID", false, dim, dim);
	//
	//    gui1->addSpacer(length-xInit, 2);
	//    gui1->addWidgetDown(new ofxUILabel("RANGE SLIDER", OFX_UI_FONT_MEDIUM));
	//	gui1->addRangeSlider("RSLIDER", 0.0, 255.0, 50.0, 100.0, length-xInit,dim);
	//
	//    gui1->addSpacer(length-xInit, 2);
	//	gui1->addWidgetDown(new ofxUILabel("2D PAD", OFX_UI_FONT_MEDIUM));
	//	gui1->add2DPad("PAD", ofPoint(0,length-xInit), ofPoint(0,120), ofPoint((length-xInit)*.5,120*.5), length-xInit,120);
	//
	//
	//
	//    bdrawGrid = false;
	//	bdrawPadding = false;
	vector<string> items;
    items.push_back("192.168.6.113");
    items.push_back("raspberrypi.local");
    
    gui1->addDropDownList("IP", items, 200);
	
	ofAddListener(gui1->newGUIEvent,this,&testApp::gui1Event);
}

void testApp::setGUI2()
{
	float dim = 16;
	float xInit = OFX_UI_GLOBAL_WIDGET_SPACING;
    float length = GLOBAL_WIDTH-xInit;
    
	//    img = new ofImage();
	//    img->loadImage("nerd_me.png");
	//    buffer = new float[256];
	//    for(int i = 0; i < 256; i++) { buffer[i] = ofNoise(i/100.0); }
//	gui2 = new ofxUIScrollableCanvas(length+xInit+2, 0, length+xInit, ofGetHeight());
	gui2 = new ofxUICanvas(length+xInit+2, 0, length+xInit, ofGetHeight());
	gui2->addWidgetDown(new ofxUILabel("PANEL 2: ADVANCED", OFX_UI_FONT_LARGE));
	//
	//    gui2->addSpacer(length-xInit, 2);
	//	gui2->addWidgetDown(new ofxUILabel("TEXT INPUT", OFX_UI_FONT_MEDIUM));
	//	gui2->setWidgetFontSize(OFX_UI_FONT_LARGE);
	//	gui2->addTextInput("TEXT INPUT", "Input Text", length-xInit);
	//    gui2->addWidgetDown(new ofxUILabel("AUTO CLEAR DISABLED", OFX_UI_FONT_MEDIUM));
	//    gui2->addTextInput("TEXT INPUT2", "Input Text", length-xInit)->setAutoClear(false);
	//	gui2->setWidgetFontSize(OFX_UI_FONT_MEDIUM);
	//
	//    gui2->addSpacer(length-xInit, 2);
	//    gui2->addWidgetDown(new ofxUILabel("WAVEFORM DISPLAY", OFX_UI_FONT_MEDIUM));
	//	gui2->addWidgetDown(new ofxUIWaveform(length-xInit, 64, buffer, 256, 0.0, 1.0, "WAVEFORM"));
	//    gui2->addWidgetDown(new ofxUILabel("SPECTRUM DISPLAY", OFX_UI_FONT_MEDIUM));
	//    gui2->addWidgetDown(new ofxUISpectrum(length-xInit, 64, buffer, 256, 0.0, 1.0, "SPECTRUM"));
	//
	//    gui2->addSpacer(length-xInit, 2);
	//    gui2->addWidgetDown(new ofxUILabel("IMAGE DISPLAY", OFX_UI_FONT_MEDIUM));
	//	gui2->addWidgetDown(new ofxUIImage(img->width*.5, img->height*.5, img, "IMAGE CAPTION"));
	//
	//    gui2->addSpacer(length-xInit, 2);
	//    gui2->addWidgetDown(new ofxUILabel("FPS LABEL", OFX_UI_FONT_MEDIUM));
	//    gui2->addWidgetDown(new ofxUIFPS(OFX_UI_FONT_MEDIUM));
	//
	//    gui2->addSpacer(length-xInit, 2);
	//    gui2->addWidgetDown(new ofxUILabel("NUMBER DIALER", OFX_UI_FONT_MEDIUM));
	//    gui2->addWidgetDown(new ofxUINumberDialer(-10000, 10000, 5000, 1, "NUMBER DIALER", OFX_UI_FONT_MEDIUM));
	//
    gui2->addSpacer(length-xInit, 2);
    gui2->addWidgetDown(new ofxUILabel("LABEL BUTTON", OFX_UI_FONT_MEDIUM));
    gui2->addLabelToggle("ENABLE_SCREENSAVER", false, length-xInit);
	gui2->addWidgetDown(new ofxUIBiLabelSlider(length-xInit, 0.0, 1.0, 0.5, "ACCELERATION", "SLOW", "FAST", OFX_UI_FONT_MEDIUM));
	gui2->addWidgetDown(new ofxUIRotarySlider(length-xInit, 0.0, 1.0f, .0, "SPINNER"));
	
	
//	gui2->addSpacer(length-xInit, 2);
	
//    gui2->addWidgetDown(new ofxUILabel("CIRCLE SLIDER", OFX_UI_FONT_MEDIUM));

	
	//    gui2->addLabelButton("AUTOSIZE BUTTON", false);
	//    gui2->addLabelButton("MEDIUM BUTTON", false);
	//
	//    gui2->addSpacer(length-xInit, 2);
	//    gui2->addWidgetDown(new ofxUILabel("LABEL TOGGLES", OFX_UI_FONT_MEDIUM));
	//    gui2->addLabelToggle("LABEL TOGGLE", false, length-xInit);
	//    gui2->addLabelToggle("AUTOSIZE TOGGLE", false);
	//    gui2->addLabelToggle("MEDIUM TOGGLE", false);
    
	ofAddListener(gui2->newGUIEvent,this,&testApp::gui2Event);
}

void testApp::setGUI3()
{
	float dim = 16;
	float xInit = OFX_UI_GLOBAL_WIDGET_SPACING;
    float length = GLOBAL_WIDTH-xInit;
//	gui3 = new ofxUIScrollableCanvas(length*2+xInit*2+4, 0, length+xInit, ofGetHeight());
	gui3 = new ofxUICanvas(length*2+xInit*2+4, 0, length+xInit, ofGetHeight());
    gui3->addWidgetDown(new ofxUILabel("PANEL 3: ADVANCED", OFX_UI_FONT_LARGE));
	//
    gui3->addSpacer(length-xInit, 2);
	//    gui3->addWidgetDown(new ofxUILabel("MATRIX", OFX_UI_FONT_MEDIUM));
	//    gui3->addWidgetDown(new ofxUIToggleMatrix(dim, dim, 4, 4, "MATRIX1"));
	//    gui3->addWidgetDown(new ofxUIToggleMatrix(dim*2.0, dim*2.0, 3, 6, "MATRIX2"));
	matrix = new ofxUIToggleMatrix(dim*3.0, dim*3.0, 1, 4, "MATRIX3");
    gui3->addWidgetDown(matrix);
	//
	//    gui3->addSpacer(length-xInit, 2);
	//    gui3->addWidgetDown(new ofxUILabel("IMAGE BUTTON", OFX_UI_FONT_MEDIUM));
	//    gui3->addWidgetDown(new ofxUIImageButton(dim*4.0, dim*4.0, false, "GUI/images/App.png","IMAGEBTN"));
	//    gui3->addWidgetDown(new ofxUILabel("IMAGE TOGGLE", OFX_UI_FONT_MEDIUM));
	//    gui3->addWidgetDown(new ofxUIImageToggle(dim*4.0, dim*4.0, false, "GUI/images/Preview.png","IMAGETGL"));
	//
    gui3->addSpacer(length-xInit, 2);
    gui3->addWidgetDown(new ofxUILabel("ROTARY SLIDER", OFX_UI_FONT_MEDIUM));
	gui3->addWidgetDown(new ofxUICircleSlider(dim*4.0, 0.0f, 2.0f, 0.5f, "NORTH SOUTH", OFX_UI_FONT_MEDIUM));

    gui3->addWidgetDown(new ofxUIRotarySlider(length-xInit, 0, 360, 180, "R2SLIDER"));
	//    gui3->addSpacer(length-xInit, 2);
    gui3->addWidgetDown(new ofxUILabel("DROP DOWN", OFX_UI_FONT_MEDIUM));
	
    vector<string> items;
    items.push_back("FIRST ITEM");
    items.push_back("SECOND ITEM");
    items.push_back("THIRD ITEM WHATS UP DOG");
    items.push_back("FOURTH ITEM");
    items.push_back("FIFTH ITEM");
    items.push_back("SIXTH ITEM");
    
    dropDownList = gui3->addDropDownList("DROP DOWN LIST", items, 200);
	
	ofAddListener(gui3->newGUIEvent,this,&testApp::gui3Event);
}

void testApp::setGUI4()
{
	float dim = 16;
	float xInit = OFX_UI_GLOBAL_WIDGET_SPACING;
    float length = GLOBAL_WIDTH-xInit;

	gui4 = new ofxUIScrollableCanvas(length*3+xInit*3+6, 0, length+xInit, ofGetHeight()*2);
	gui4->setName("SCROLLABLE");
	gui4->setScrollAreaToScreenHeight();
//	gui4->setSnapping(false);
    gui4->addWidgetDown(new ofxUILabel("PANEL 4: SCROLLABLE", OFX_UI_FONT_LARGE));
    for (int i = 0 ; i < 20 ; i++) {
		gui4->addWidgetDown(new ofxUILabel("LABEL_BUTTON_"+ofToString(i), OFX_UI_FONT_MEDIUM));
		gui4->addLabelButton("LABEL_BUTTON_"+ofToString(i), false, length-xInit);
	}
	//    gui4->addSpacer(length-xInit, 2);
	//
	//    gui4->addWidgetDown(new ofxUILabel("BILABEL SLIDER", OFX_UI_FONT_MEDIUM));
	//    gui4->addWidgetDown(new ofxUIBiLabelSlider(length-xInit, 0, 100, 50, "BILABEL", "HOT", "COLD", OFX_UI_FONT_MEDIUM));
	//
	//    gui4->addWidgetDown(new ofxUILabel("MINIMAL SLIDER", OFX_UI_FONT_MEDIUM));
	//    gui4->addWidgetDown(new ofxUIMinimalSlider(length-xInit, dim, 0, 100, 50.0, "MINIMAL",OFX_UI_FONT_MEDIUM));
	//

	//
	//    gui4->addSpacer(length-xInit, 2);
	//    gui4->addWidgetDown(new ofxUILabel("FPS SLIDER", OFX_UI_FONT_MEDIUM));
	//    gui4->addFPSSlider("FPS SLIDER", length-xInit, dim);
	//
	//    vector<float> buffer;
	//    for(int i = 0; i < 256; i++)
	//    {
	//        buffer.push_back(0.0);
	//    }
	//
	//    gui4->addWidgetDown(new ofxUILabel("MOVING GRAPH", OFX_UI_FONT_MEDIUM));
	//    mg = (ofxUIMovingGraph *) gui4->addWidgetDown(new ofxUIMovingGraph(length-xInit, 120, buffer, 256,/ 0, 400, "MOVING GRAPH"));
	//
	//    gui4->addSpacer(length-xInit, 2);
	//    gui4->addWidgetDown(new ofxUILabel("IMAGE SAMPLER", OFX_UI_FONT_MEDIUM));
	//    gui4->addWidgetDown(new ofxUIImageSampler(img->getWidth(), img->getHeight(), img, "SAMPLER"));
	//    gui4->addWidgetDown(new ofxUIMultiImageButton(dim*2, dim*2, false, "GUI/toggle.png", "IMAGE BUTTON"));
	//    gui4->addWidgetDown(new ofxUIMultiImageToggle(dim*2, dim*2, false, "GUI/toggle.png", "IMAGE BUTTON"));
    
    
	ofAddListener(gui4->newGUIEvent,this,&testApp::gui4Event);
}