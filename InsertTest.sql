DECLARE @UserData NVARCHAR(MAX), @OutputMessage NVARCHAR(MAX);

-- JSON �榡���ϥΪ̸��
SET @UserData = N'{
  "Acpd_CName": "��",
  "Acpd_EName": "Jin",
  "Acpd_SName": "HJ",
  "Acpd_Email": "jin@example.com",
  "Acpd_Status": 1,
  "Acpd_Stop": 0,
  "Acpd_StopMemo": "",
  "Acpd_LoginID": "jin1111",
  "Acpd_LoginPW": "password1111",
  "Acpd_Memo": "���է�s",
  "Acpd_NowID": "admin"
}';

-- ����s�W�ϥΪ̪��s�x�L�{
EXEC usp_InsertUser @UserData, @OutputMessage OUTPUT;

-- �d�ݵ��G
SELECT @OutputMessage;
