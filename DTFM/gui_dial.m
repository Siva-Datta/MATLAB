function varargout = gui_dial(varargin)
% GUI_DIAL MATLAB code for gui_dial.fig
%      GUI_DIAL, by itself, creates a new GUI_DIAL or raises the existing
%      singleton*.
%
%      H = GUI_DIAL returns the handle to a new GUI_DIAL or the handle to
%      the existing singleton*.
%
%      GUI_DIAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_DIAL.M with the given input arguments.
%
%      GUI_DIAL('Property','Value',...) creates a new GUI_DIAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_dial_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_dial_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_dial

% Last Modified by GUIDE v2.5 11-Feb-2020 14:54:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_dial_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_dial_OutputFcn, ...
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



% --- Executes just before gui_dial is made visible.
function gui_dial_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_dial (see VARARGIN)

% Choose default command line output for gui_dial
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes gui_dial wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = gui_dial_OutputFcn(hObject, eventdata, handles) 
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
[n,signal]=phone_pad(1);
dailed=subdecode(signal);
set(handles.out,'string',dailed);
%update_gui_bank


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad(2);
dailed=subdecode(signal);
set(handles.out,'string',dailed);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad(3);
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in A.
function A_Callback(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad('A');
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad(5);
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad(6);
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in B.
function B_Callback(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad('B');
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad(4);
dailed=subdecode(signal);
set(handles.out,'string',dailed);% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad(7);
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad(8);
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad(9);
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in C.
function C_Callback(hObject, eventdata, handles)
% hObject    handle to C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad('C');
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in Star.
function Star_Callback(hObject, eventdata, handles)
% hObject    handle to Star (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad('*');
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in pushbutton0.
function pushbutton0_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad(0);
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in hash.
function hash_Callback(hObject, eventdata, handles)
% hObject    handle to hash (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad('#');
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in D.
function D_Callback(hObject, eventdata, handles)
% hObject    handle to D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[n,signal]=phone_pad('D');
dailed=subdecode(signal);
set(handles.out,'string',dailed);
% --- Executes on button press in Decode.



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
