function varargout = periodic(varargin)
% PERIODIC MATLAB code for periodic.fig
%      PERIODIC, by itself, creates a new PERIODIC or raises the existing
%      singleton*.
%
%      H = PERIODIC returns the handle to a new PERIODIC or the handle to
%      the existing singleton*.
%
%      PERIODIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PERIODIC.M with the given input arguments.
%
%      PERIODIC('Property','Value',...) creates a new PERIODIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before periodic_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to periodic_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help periodic

% Last Modified by GUIDE v2.5 09-Jan-2022 18:02:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @periodic_OpeningFcn, ...
                   'gui_OutputFcn',  @periodic_OutputFcn, ...
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


% --- Executes just before periodic is made visible.
function periodic_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to periodic (see VARARGIN)

% Choose default command line output for periodic
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes periodic wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = periodic_OutputFcn(hObject, eventdata, handles) 
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
% handles    structure with handles and user data (see GUIDATA)a=uigetfile('*.*');
a=uigetfile('*.*');
a=imread(a);
axes(handles.axes2);
imshow(a);
setappdata(0,'a',a);



 

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
 

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 a=getappdata(0,'a');
 %Determine good padding for Fourier transform
PQ = paddedsize(size(a));
%Create Notch filters corresponding to extra peaks in the Fourier transform
H1 = notch('btw', PQ(1), PQ(2), 10, 50, 100);
H2 = notch('btw', PQ(1), PQ(2), 10, 1, 400);
H3 = notch('btw', PQ(1), PQ(2), 10, 620, 100);
H4 = notch('btw', PQ(1), PQ(2), 10, 22, 414);
H5 = notch('btw', PQ(1), PQ(2), 10, 592, 414);
H6 = notch('btw', PQ(1), PQ(2), 10, 1, 114);
% Calculate the discrete Fourier transform of the image
F=fft2(double(a),PQ(1),PQ(2));
 
% Apply the notch filters to the Fourier spectrum of the image
FS_football = F.*H1.*H2.*H3.*H4.*H5.*H6;
% convert the result to the spacial domain.
F_football=real(ifft2(FS_football)); 
% Crop the image to undo padding
F_football=F_football(1:size(a,1), 1:size(a,2));
axes(handles.axes3);
imshow(F_football,[])


 



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
assignment
closereq


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile('*.*');
a=imread(a);
axes(handles.axes5);
imshow(a);
setappdata(0,'a',a);
