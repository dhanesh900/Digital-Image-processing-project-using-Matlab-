function varargout = Salt_pepper(varargin)
% SALT_PEPPER MATLAB code for Salt_pepper.fig
%      SALT_PEPPER, by itself, creates a new SALT_PEPPER or raises the existing
%      singleton*.
%
%      H = SALT_PEPPER returns the handle to a new SALT_PEPPER or the handle to
%      the existing singleton*.
%
%      SALT_PEPPER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SALT_PEPPER.M with the given input arguments.
%
%      SALT_PEPPER('Property','Value',...) creates a new SALT_PEPPER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Salt_pepper_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Salt_pepper_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Salt_pepper

% Last Modified by GUIDE v2.5 09-Jan-2022 17:00:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Salt_pepper_OpeningFcn, ...
                   'gui_OutputFcn',  @Salt_pepper_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Salt_pepper is made visible.
function Salt_pepper_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Salt_pepper (see VARARGIN)

% Choose default command line output for Salt_pepper
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Salt_pepper wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Salt_pepper_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile('*.*');
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 a=getappdata(0,'a');
        salt=imnoise(a,'salt & pepper',0.02);
        axes(handles.axes2);
        imshow(salt);
      %  setGlobalx(salt);
      
      setappdata(0,'salt',salt);
      axis('on', 'image');
      impixelinfo;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
J=getappdata(0,'salt'); 
Kmedian = medfilt2(J);
 axes(handles.axes4);
imshow(Kmedian)
axis('on', 'image');
impixelinfo;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
J=getappdata(0,'salt'); 
Kaverage = filter2(fspecial('average',3),J)/255;
 axes(handles.axes3);
imshow(Kaverage)
axis('on', 'image');
impixelinfo;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignment
closereq
