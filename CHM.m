function varargout = CHM(varargin)
% CHM MATLAB code for CHM.fig
%      CHM, by itself, creates a new CHM or raises the existing
%      singleton*.
%
%      H = CHM returns the handle to a new CHM or the handle to
%      the existing singleton*.
%
%      CHM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHM.M with the given input arguments.
%
%      CHM('Property','Value',...) creates a new CHM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CHM_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CHM_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CHM

% Last Modified by GUIDE v2.5 12-Jan-2022 00:55:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CHM_OpeningFcn, ...
                   'gui_OutputFcn',  @CHM_OutputFcn, ...
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


% --- Executes just before CHM is made visible.
function CHM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CHM (see VARARGIN)

% Choose default command line output for CHM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CHM wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CHM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile('*.*');
a=imread(a);
axes(handles.axes7);
imshow(a);
setappdata(0,'a',a);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 a=getappdata(0,'a');
        %salt=imnoise(a,'salt & pepper',0.02);
        %axes(handles.axes9);
        %imshow(salt);
      %  setGlobalx(salt);
       nn=imresize(a,0.3,'nearest');
        axes(handles.axes9);
        imshow(nn)
     % setappdata(0,'salt',nn);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 a=getappdata(0,'a');
        gau=imnoise(a,'gaussian',0.02);
        axes(handles.axes8);
        imshow(gau);
      %  setGlobalx(salt);
      
      setappdata(0,'gau',gau);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignment
closereq


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 a=getappdata(0,'a');
        bc=imresize(a,0.3,'bicubic');
        axes(handles.axes11);
        imshow(bc)
% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
si=getappdata(0,'gau');
sg=im2double(si);
or=1;
kr=3;
kc=3;
sf=imfilter(sg.^(or+1),ones(kr,kc),'replicate')./(imfilter(sg.^(or),ones(kr,kc),'replicate')+eps);

axes(handles.axes12);
 imshow(sf);










% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
        bl=imresize(a,0.3,'bilinear');
        axes(handles.axes10);
        imshow(bl)
