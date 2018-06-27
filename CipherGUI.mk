##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=CipherGUI
ConfigurationName      :=Debug
WorkspacePath          :=C:/Anika/AVLTree1
ProjectPath            :=C:/Anika/CipherGUI
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=20759651
Date                   :=23/05/2018
CodeLitePath           :="C:/Program Files/CodeLite"
LinkerName             :=C:/MinGW/mingw64/bin/g++.exe
SharedObjectLinkerName :=C:/MinGW/mingw64/bin/g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="CipherGUI.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := $(shell wx-config --rcflags)
RcCompilerName         :=C:/MinGW/mingw64/bin/windres.exe
LinkOptions            :=  $(shell wx-config   --libs --unicode=yes)
IncludePath            :=  $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)C:/wxWidgets/lib/gcc_dll 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := C:/MinGW/mingw64/bin/ar.exe rcu
CXX      := C:/MinGW/mingw64/bin/g++.exe
CC       := C:/MinGW/mingw64/bin/gcc.exe
CXXFLAGS :=  -g -O0 -Wall $(shell wx-config --cxxflags --unicode=yes  ) $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(shell wx-config --cxxflags --unicode=yes  ) $(Preprocessors)
ASFLAGS  := 
AS       := C:/MinGW/mingw64/bin/as.exe


##
## User defined environment variables
##
CodeLiteDir:=C:\Program Files\CodeLite
WXWIN:=c:/wxWidgets
Objects0=$(IntermediateDirectory)/menu.cpp$(ObjectSuffix) $(IntermediateDirectory)/main.cpp$(ObjectSuffix) $(IntermediateDirectory)/affine.cpp$(ObjectSuffix) $(IntermediateDirectory)/atbash.cpp$(ObjectSuffix) $(IntermediateDirectory)/keyword.cpp$(ObjectSuffix) $(IntermediateDirectory)/vigenere.cpp$(ObjectSuffix) $(IntermediateDirectory)/xor1.cpp$(ObjectSuffix) $(IntermediateDirectory)/dvorak.cpp$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/menu.cpp$(ObjectSuffix): menu.cpp $(IntermediateDirectory)/menu.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Anika/CipherGUI/menu.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/menu.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/menu.cpp$(DependSuffix): menu.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/menu.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/menu.cpp$(DependSuffix) -MM menu.cpp

$(IntermediateDirectory)/menu.cpp$(PreprocessSuffix): menu.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/menu.cpp$(PreprocessSuffix) menu.cpp

$(IntermediateDirectory)/main.cpp$(ObjectSuffix): main.cpp $(IntermediateDirectory)/main.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Anika/CipherGUI/main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.cpp$(DependSuffix): main.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/main.cpp$(DependSuffix) -MM main.cpp

$(IntermediateDirectory)/main.cpp$(PreprocessSuffix): main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.cpp$(PreprocessSuffix) main.cpp

$(IntermediateDirectory)/affine.cpp$(ObjectSuffix): affine.cpp $(IntermediateDirectory)/affine.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Anika/CipherGUI/affine.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/affine.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/affine.cpp$(DependSuffix): affine.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/affine.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/affine.cpp$(DependSuffix) -MM affine.cpp

$(IntermediateDirectory)/affine.cpp$(PreprocessSuffix): affine.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/affine.cpp$(PreprocessSuffix) affine.cpp

$(IntermediateDirectory)/atbash.cpp$(ObjectSuffix): atbash.cpp $(IntermediateDirectory)/atbash.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Anika/CipherGUI/atbash.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/atbash.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/atbash.cpp$(DependSuffix): atbash.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/atbash.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/atbash.cpp$(DependSuffix) -MM atbash.cpp

$(IntermediateDirectory)/atbash.cpp$(PreprocessSuffix): atbash.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/atbash.cpp$(PreprocessSuffix) atbash.cpp

$(IntermediateDirectory)/keyword.cpp$(ObjectSuffix): keyword.cpp $(IntermediateDirectory)/keyword.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Anika/CipherGUI/keyword.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/keyword.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/keyword.cpp$(DependSuffix): keyword.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/keyword.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/keyword.cpp$(DependSuffix) -MM keyword.cpp

$(IntermediateDirectory)/keyword.cpp$(PreprocessSuffix): keyword.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/keyword.cpp$(PreprocessSuffix) keyword.cpp

$(IntermediateDirectory)/vigenere.cpp$(ObjectSuffix): vigenere.cpp $(IntermediateDirectory)/vigenere.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Anika/CipherGUI/vigenere.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/vigenere.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/vigenere.cpp$(DependSuffix): vigenere.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/vigenere.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/vigenere.cpp$(DependSuffix) -MM vigenere.cpp

$(IntermediateDirectory)/vigenere.cpp$(PreprocessSuffix): vigenere.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/vigenere.cpp$(PreprocessSuffix) vigenere.cpp

$(IntermediateDirectory)/xor1.cpp$(ObjectSuffix): xor1.cpp $(IntermediateDirectory)/xor1.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Anika/CipherGUI/xor1.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/xor1.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/xor1.cpp$(DependSuffix): xor1.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/xor1.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/xor1.cpp$(DependSuffix) -MM xor1.cpp

$(IntermediateDirectory)/xor1.cpp$(PreprocessSuffix): xor1.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/xor1.cpp$(PreprocessSuffix) xor1.cpp

$(IntermediateDirectory)/dvorak.cpp$(ObjectSuffix): dvorak.cpp $(IntermediateDirectory)/dvorak.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Anika/CipherGUI/dvorak.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/dvorak.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/dvorak.cpp$(DependSuffix): dvorak.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/dvorak.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/dvorak.cpp$(DependSuffix) -MM dvorak.cpp

$(IntermediateDirectory)/dvorak.cpp$(PreprocessSuffix): dvorak.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/dvorak.cpp$(PreprocessSuffix) dvorak.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


