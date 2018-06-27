#include <wx/wx.h>
#include <wx/menu.h>

class SubMenu : public wxFrame
{
public:
  SubMenu(const wxString& title);

  void OnQuit(wxCommandEvent & event);

  wxMenuBar *menubar;
  wxMenu *file;
  wxMenu *imp;
  wxMenuItem *quit;

private:
    void OnRadioBoxChange(wxCommandEvent& evt);
    void OnEncrypt(wxCommandEvent& evt);
    void OnDecrypt(wxCommandEvent& evt);
    void OnDecryptThread(wxCommandEvent& evt);
private:
    wxRadioBox* m_radioBox;
    wxTextCtrl* m_textctrl;
    wxStaticText *st1;
    wxTextCtrl *textctrl1;
    wxButton *btnEncrypt;
    wxStaticText *st2;
    wxTextCtrl *textctrl2;
    wxButton *btnDecrypt;
    wxButton *btnDecryptUsingThread;
    wxDECLARE_EVENT_TABLE();
    
};