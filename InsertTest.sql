DECLARE @UserData NVARCHAR(MAX), @OutputMessage NVARCHAR(MAX);

-- JSON 格式的使用者資料
SET @UserData = N'{
  "Acpd_CName": "黃",
  "Acpd_EName": "Jin",
  "Acpd_SName": "HJ",
  "Acpd_Email": "jin@example.com",
  "Acpd_Status": 1,
  "Acpd_Stop": 0,
  "Acpd_StopMemo": "",
  "Acpd_LoginID": "jin1111",
  "Acpd_LoginPW": "password1111",
  "Acpd_Memo": "測試更新",
  "Acpd_NowID": "admin"
}';

-- 執行新增使用者的存儲過程
EXEC usp_InsertUser @UserData, @OutputMessage OUTPUT;

-- 查看結果
SELECT @OutputMessage;
