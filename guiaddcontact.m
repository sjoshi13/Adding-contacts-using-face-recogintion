function varargout = guiaddcontact(varargin)
% GUIADDCONTACT MATLAB code for guiaddcontact.fig
%      GUIADDCONTACT, by itself, creates a new GUIADDCONTACT or raises the existing
%      singleton*.
%
%      H = GUIADDCONTACT returns the handle to a new GUIADDCONTACT or the handle to
%      the existing singleton*.
%
%      GUIADDCONTACT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIADDCONTACT.M with the given input arguments.
%
%      GUIADDCONTACT('Property','Value',...) creates a new GUIADDCONTACT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiaddcontact_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiaddcontact_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiaddcontact

% Last Modified by GUIDE v2.5 21-Jul-2017 19:53:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiaddcontact_OpeningFcn, ...
                   'gui_OutputFcn',  @guiaddcontact_OutputFcn, ...
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


% --- Executes just before guiaddcontact is made visible.
function guiaddcontact_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiaddcontact (see VARARGIN)

% Choose default command line output for guiaddcontact
handles.output = hObject;
axes(handles.axes1);
a=imread('D:\back1.jpg');
imshow(a)
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiaddcontact wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiaddcontact_OutputFcn(hObject, eventdata, handles) 
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
global v

% im=snapshot(webcam(1));
% FaceDetector=vision.CascadeObjectDetector();
% bbox=step(FaceDetector,im);
% im=imcrop(im,bbox);
% axes(handles.axes2);
[fname path]=uigetfile('.pgm','provide a face for testing');
 fname=strcat(path,fname);
 im=imread(fname);
imshow(im)

ftest=cell2mat(FeatureStatistical(im));
load db.mat
ftrain=db(:,1);

ctrain=db(:,2);
p=size(db);
arr=zeros(p(1),1);
for i=1:p(1)
 
 a=  ftrain(i);
a= cell2mat(a);
   arr(i)=corr2(ftest,a);
end
[c h]=max(arr);
v=h;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global v;
load db;

ctrain=db(:,2);
f=ctrain(v);
msgbox(f);
pause(1);
msgbox('Contact added.');
