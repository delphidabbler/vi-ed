{
 * FmIdEd.pas
 *
 * Identifier editor dialog box. Allows user to enter a valid version
 * information resource identifier.
 *
 * Original unit name was EdID.pas. Changed to FmIdEd.pas at v2.0.
 *
 * v1.0 of 25 May 1998  - Original version. Named EdID.pas.
 * v1.1 of 13 Apr 1999  - Removed glyphs from buttons in form. Removed code from
 *                        form creation event that turns glyphs off. This was
 *                        incompatible with Delphi 2.
 * v2.0 of 18 Mar 2002  - Re-wrote dialog box to descend from TGenericOKDlg.
 *                        Removed all code for functionality that is now
 *                        provided in base class. This change also means that
 *                        button style and font face conforms to Window 95+
 *                        standards.
 * v2.1 of 17 Mar 2003  - Replaced reference to VInfoExp.inc help topic include
 *                        file with reference to UHelp unit.
 * v2.2 of 20 Apr 2008  - Changed to use renamed UMsgDlgs unit.
 *
 *
 * ***** BEGIN LICENSE BLOCK *****
 *
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with the
 * License. You may obtain a copy of the License at http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
 * the specific language governing rights and limitations under the License.
 *
 * The Original Code is FmIdEd.pas.
 *
 * The Initial Developer of the Original Code is Peter Johnson
 * (http://www.delphidabbler.com/).
 *
 * Portions created by the Initial Developer are Copyright (C) 1998-2008 Peter
 * Johnson. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK *****
}


unit FmIdEd;


interface


uses
  // Delphi
  StdCtrls, Controls, ExtCtrls, Classes,
  // Project
  FmGenericOKDlg;

type

  {
  TIdEditor:
    Class that implements a dialog box that allows user to enter a valid version
    information resource identifier.
  }
  TIdEditor = class(TGenericOKDlg)
    lblID: TLabel;
    edId: TEdit;
    procedure edIdKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    fIdentifier: string;
      {Value of Identifier property}
  public
    property Identifier: string read fIdentifier write fIdentifier;
      {Holds default identifier provided by caller and edited identifier if user
      clicks OK}
  end;


implementation


uses
  // Project
  UHelp, UMsgDlgs;


{$R *.DFM}

{ TIdEditor }

procedure TIdEditor.btnOKClick(Sender: TObject);
  {Click event handler for OK button: validates entered identifier and stores
  in Identifier property if valid.
    @param Sender [in] Not used.
  }
begin
  inherited;
  {Check that entered text doesn't start with digit}
  if (edId.Text <> '') and (edId.Text[1] in ['0'..'9']) then
  begin
     // Identifier did start with digit - error
    MsgInvalidIdentifier(HELP_MSGDLG_BADIDENTIFIER);
    ModalResult := 0;
    edId.SetFocus;
  end
  else
    // Identifier is OK - record it in property
    fIdentifier := edID.Text;
end;

procedure TIdEditor.edIdKeyPress(Sender: TObject; var Key: Char);
  {Key press event handler for identifier edit box: only accepts valid ID
  characters or backspace.
    @param Sender [in] Not used.
  }
begin
  inherited;
  if not (Key in ['a'..'z', 'A'..'Z', '_', '0'..'9', #8]) then
    Key := #0
end;

procedure TIdEditor.FormShow(Sender: TObject);
  {Event handler called when form is shown: intialises controls.
    @param Sender [in] Not used.
  }
begin
  inherited;
  // Display indentifier in edit box and move focus to it
  edID.Text := fIdentifier;
  edId.SetFocus;
end;

end.

