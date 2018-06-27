#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include "vigenere.h"
#include "affine.h"
#include "atbash.h"
#include "dvorak.h"
#include "keyword.h"
#include "xor1.h"
#include "menu.h"
#include "cipherthread.h"


const int wxID_RADIOBOX = 100;
const int wxID_ENCRYPTTEXTBOX = 101;
const int wxID_ENCRYPTBTN = 102;
const int wxID_DECRYPTTESTBOX = 103;
const int wxID_DECRYPTBTN = 104;
const int wxID_DECRYPTTHREADBTN = 105;

void *thr_func(void *arg);

int ciphers[NUM_THREADS] = { Affine, XOR, Vigenere, Atbash, Keyword, Dvorak};

SubMenu::SubMenu(const wxString& title)
       : wxFrame(NULL, wxID_ANY, title, wxDefaultPosition, wxSize(600, 500))
{

  menubar = new wxMenuBar;
  file = new wxMenu;

  file->Append(wxID_ANY, wxT("&New"));
  file->Append(wxID_ANY, wxT("&Open"));
  file->Append(wxID_ANY, wxT("&Save"));
  file->AppendSeparator();

  imp = new wxMenu;
  imp->Append(wxID_ANY, wxT("Import newsfeed list..."));
  imp->Append(wxID_ANY, wxT("Import bookmarks..."));
  imp->Append(wxID_ANY, wxT("Import mail..."));

  file->AppendSubMenu(imp, wxT("I&mport"));

  quit = new wxMenuItem(file, wxID_EXIT, wxT("&Quit\tCtrl+W"));
  file->Append(quit);

  menubar->Append(file, wxT("&File"));
  SetMenuBar(menubar);

  Connect(wxID_EXIT, wxEVT_COMMAND_MENU_SELECTED, 
      wxCommandEventHandler(SubMenu::OnQuit));
    
    wxPanel* panel = new wxPanel(this, wxID_ANY);
  
   //Create the wxRadioBox control
    wxArrayString choices;
    choices.Add("Affine");
    choices.Add("XOR");
    choices.Add("Vigenere");
    choices.Add("Atbash");
    choices.Add("Keyword");
    choices.Add("Dvorak");
    choices.Add("RSA");
    // using wxPoint instead of wxdefaultposition
    m_radioBox = new wxRadioBox(panel, wxID_RADIOBOX, 
        "Select one of the options", wxPoint(15, 15) , 
        wxSize(500, 60), choices, 1, wxRA_VERTICAL);

    st1 = new wxStaticText(panel, wxID_ANY, wxT("Enter string to Encrypt:"), wxPoint(15, 100));
        
    textctrl1 = new wxTextCtrl(panel, wxID_ENCRYPTTEXTBOX, wxT(""), wxPoint(15, 120),
    wxSize(450, 50), wxTE_MULTILINE);   

    btnEncrypt = new wxButton(panel, wxID_ENCRYPTBTN, wxT("Encrypt"), wxPoint(15, 175), wxDefaultSize, 0);

    st2 = new wxStaticText(panel, wxID_ANY, wxT("Enter string to Decrypt:"), wxPoint(15, 230));

    textctrl2 = new wxTextCtrl(panel, wxID_DECRYPTTESTBOX, wxT(""), wxPoint(15, 250),
    wxSize(450, 50), wxTE_MULTILINE);   
    
    btnDecrypt = new wxButton(panel, wxID_DECRYPTBTN, wxT("Decrypt"), wxPoint(15, 305), wxDefaultSize, 0);

    btnDecryptUsingThread = new wxButton(panel, wxID_DECRYPTTHREADBTN, wxT("Decrypt Using Threads"), wxPoint(15, 345), wxDefaultSize, 0);
       
    Centre();

}


void SubMenu::OnRadioBoxChange(wxCommandEvent& evt)
{
    wxString text = m_radioBox->GetString(evt.GetSelection());   
}

void SubMenu::OnEncrypt(wxCommandEvent& evt)
{
    int selCipher =  m_radioBox->GetSelection();
    wxString text = textctrl1->GetValue();
    std::string s;
    
    if ( selCipher == 0 )
    {
        s = affine(std::string(text.mb_str()),3,8,true);
    }
    
      switch(selCipher){
        case 0: //Affine :
            s = affine(std::string(text.mb_str()),3,8,true);
            break;
        case 1: //XOR :
            s = xor1(std::string(text.mb_str()),"test");
            break;
        case 2: //Vigenere :
            s = vigenere(std::string(text.mb_str()), "secret", true);
            break;
        case 3: //Atbash:
            s = atbash(std::string(text.mb_str()));
            break;
        case 4: //Keyword:
            s = keyword(std::string(text.mb_str()), "secret", true);
            break;
        case 5: //Dvorak:
            s = dvorak(std::string(text.mb_str()), true);
            break;       
        default :
            cout << "Invalid cipher" << endl;
    }

    textctrl2->SetValue("");
    textctrl2->SetValue(s.c_str());
    textctrl1->SetValue("");

}

void SubMenu::OnDecrypt(wxCommandEvent& evt)
{
    int selCipher =  m_radioBox->GetSelection();
    wxString text = textctrl2->GetValue();
    std::string s;
    
    if ( selCipher == 0 )
    {
        s = affine(std::string(text.mb_str()),3,8,false);
    }
    
      switch(selCipher){
        case 0: //Affine :
            s = affine(std::string(text.mb_str()),3,8,false);
            break;
        case 1: //XOR :
            s = xor1(std::string(text.mb_str()),"test");
            break;
        case 2: //Vigenere :
            s = vigenere(std::string(text.mb_str()), "secret", false);
            break;
        case 3: //Atbash:
            s = atbash(std::string(text.mb_str()));
            break;
        case 4: //Keyword:
            s = keyword(std::string(text.mb_str()), "secret", false);
            break;
        case 5: //Dvorak:
            s = dvorak(std::string(text.mb_str()), false);
            break;       
        default :
            cout << "Invalid cipher" << endl;
    }

    textctrl1->SetValue("");
    textctrl1->SetValue(s.c_str());
    textctrl2->SetValue("");
    //wxMessageDialog *dial = new wxMessageDialog(NULL, wxT("Decrypted text Decrypted text Decrypted text Decrypted text Decrypted text Decrypted text"), wxT("Info"), wxOK);
    //dial->ShowModal();

}

void SubMenu::OnDecryptThread(wxCommandEvent& evt)
{
    pthread_t thr[NUM_THREADS];
    int i, rc;
    //create a thread_data_t argument array 
    thread_data_t thr_data[NUM_THREADS];
    //string s = "Ndgk gk iv Ixxgvu Ogbduh";
    string s;
    //cout << "Please enter the string which you want to decrypt: ";
    //std::getline(std::cin, s);
    wxString text = textctrl2->GetValue();
    s = std::string(text.mb_str());
    
    for (i=0; i<NUM_THREADS; i++)
    {
        thr_data[i].tid = i;
        thr_data[i].cipherText = s;
        thr_data[i].cipherType = ciphers[i];
        if ((rc = pthread_create(&thr[i], NULL, thr_func, &thr_data[i]))) {
          fprintf(stderr, "error: pthread_create, rc: %d\n", rc);
          return;
        }
    }
    

    //block until all threads complete 
    for (i = 0; i < NUM_THREADS; ++i) {
        pthread_join(thr[i], NULL);
    }
    
}

wxBEGIN_EVENT_TABLE(SubMenu, wxFrame)
    EVT_RADIOBOX(wxID_RADIOBOX, SubMenu::OnRadioBoxChange)
    EVT_BUTTON(wxID_ENCRYPTBTN,  SubMenu::OnEncrypt)
    EVT_BUTTON(wxID_DECRYPTBTN,  SubMenu::OnDecrypt)
    EVT_BUTTON(wxID_DECRYPTTHREADBTN,  SubMenu::OnDecryptThread)
    
    
wxEND_EVENT_TABLE()


void SubMenu::OnQuit(wxCommandEvent& WXUNUSED(event))
{
  Close(true);
}


 
/* thread function */
void *thr_func(void *arg) {
  thread_data_t *data = (thread_data_t *)arg;
  string s;
 
  switch(data->cipherType){
        case Affine :
            s = affine(data->cipherText,3,8,false);
            printf("thread id: %d, Dcrypted text using Affine: %s\n", data->tid,  s.c_str() );
            break;
        case XOR :
            s = xor1(data->cipherText,"test");
            printf("thread id: %d, Dcrypted text using XOR: %s\n", data->tid,  s.c_str() );
            break;
        case Vigenere :
            s = vigenere(data->cipherText, "secret", false);
            printf("thread id: %d, Dcrypted text using Vigenere: %s\n", data->tid,  s.c_str() );
            break;
        case Atbash:
            s = atbash(data->cipherText);
            printf("thread id: %d, Dcrypted text using Atbash: %s\n", data->tid,  s.c_str() );
            break;
        case Keyword:
              s = keyword(data->cipherText, "secret", false);
              //s = keyword("Qdfp fp s htywlor cfmdto.", "secret", false) ;
             printf("thread id: %d, Dcrypted text using Keyword: %s\n", data->tid,  s.c_str() );
            break;
        case Dvorak:
            s = dvorak(data->cipherText, false);
            printf("thread id: %d, Dcrypted text using Dvorak: %s\n", data->tid,  s.c_str() );
            break;       
        default :
            cout << "Invalid cipher" << endl;
    }
        

 
  pthread_exit(NULL);
}