USE [master]
GO
/****** Object:  Database [BackendExamHub]    Script Date: 2024/9/30 下午 05:56:22 ******/
CREATE DATABASE [BackendExamHub]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BackendExamHub', FILENAME = N'E:\Code_Learning\MSSQL16.MSSQLSERVER\MSSQL\DATA\BackendExamHub.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BackendExamHub_log', FILENAME = N'E:\Code_Learning\MSSQL16.MSSQLSERVER\MSSQL\DATA\BackendExamHub_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BackendExamHub] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BackendExamHub].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BackendExamHub] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BackendExamHub] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BackendExamHub] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BackendExamHub] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BackendExamHub] SET ARITHABORT OFF 
GO
ALTER DATABASE [BackendExamHub] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BackendExamHub] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BackendExamHub] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BackendExamHub] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BackendExamHub] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BackendExamHub] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BackendExamHub] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BackendExamHub] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BackendExamHub] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BackendExamHub] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BackendExamHub] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BackendExamHub] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BackendExamHub] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BackendExamHub] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BackendExamHub] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BackendExamHub] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BackendExamHub] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BackendExamHub] SET RECOVERY FULL 
GO
ALTER DATABASE [BackendExamHub] SET  MULTI_USER 
GO
ALTER DATABASE [BackendExamHub] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BackendExamHub] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BackendExamHub] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BackendExamHub] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BackendExamHub] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BackendExamHub] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BackendExamHub', N'ON'
GO
ALTER DATABASE [BackendExamHub] SET QUERY_STORE = ON
GO
ALTER DATABASE [BackendExamHub] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BackendExamHub]
GO
/****** Object:  Table [dbo].[Myoffice_ACPD]    Script Date: 2024/9/30 下午 05:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Myoffice_ACPD](
	[Acpd_SID] [char](20) NOT NULL,
	[Acpd_CName] [nvarchar](60) NULL,
	[Acpd_EName] [nvarchar](40) NULL,
	[Acpd_SName] [nvarchar](40) NULL,
	[Acpd_Email] [nvarchar](60) NULL,
	[Acpd_Status] [tinyint] NULL,
	[Acpd_Stop] [bit] NULL,
	[Acpd_StopMemo] [nvarchar](600) NULL,
	[Acpd_LoginID] [nvarchar](30) NULL,
	[Acpd_LoginPW] [nvarchar](60) NULL,
	[Acpd_Memo] [nvarchar](120) NULL,
	[Acpd_NowDateTime] [datetime] NULL,
	[Acpd_NowID] [nvarchar](20) NULL,
	[Acpd_UpdDateTime] [datetime] NULL,
	[Acpd_UpdID] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Acpd_SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyOffice_ExcuteionLog]    Script Date: 2024/9/30 下午 05:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyOffice_ExcuteionLog](
	[DeLog_AutoID] [int] IDENTITY(1,1) NOT NULL,
	[DeLog_StoredPrograms] [nvarchar](120) NULL,
	[DeLog_GroupID] [uniqueidentifier] NULL,
	[DeLog_ExecutionProgram] [nvarchar](120) NULL,
	[DeLog_ExecutionInfo] [nvarchar](max) NULL,
	[DeLog_ExDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeLog_AutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MyOffice_ExcuteionLog] ADD  DEFAULT (getdate()) FOR [DeLog_ExDateTime]
GO
/****** Object:  StoredProcedure [dbo].[NEWSID]    Script Date: 2024/9/30 下午 05:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NEWSID]
(
    @TableName nvarchar(128),
    @ReturnSID nvarchar(20) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON

	
	DECLARE
	@SIDRowName NVARCHAR(20)


    DECLARE 
        @currentYear int,
        @dayOfYear int,
        @secondOfDay int,
        @alphabets char(36),
        @firstDigit char(1),
        @secondDigit char(1),
        @prefix char(2),
        @dayCode char(3),
        @secondCode char(5),
        @sql nvarchar(MAX),
        @randomValue char(10),
        @ParmDefinition nvarchar(500)

    DECLARE @tempTable TABLE
    (
        SID CHAR(20)
    );

    SET @currentYear = YEAR(GETDATE()) - 2000;
    SET @dayOfYear = DATEPART(DAYOFYEAR, GETDATE());
    SET @secondOfDay = DATEPART(SECOND, GETDATE()) + (60 * DATEPART(MINUTE, GETDATE())) + (3600 * DATEPART(HOUR, GETDATE()));
    IF (@currentYear > 1295)
    BEGIN
        SET @currentYear = 1295;
    END;
    SET @alphabets = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    SET @firstDigit = SUBSTRING(@alphabets, (@currentYear / 36) % 36 + 1, 1);
    SET @secondDigit = SUBSTRING(@alphabets, @currentYear % 36 + 1, 1);
    SET @prefix = @firstDigit + @secondDigit;
    SET @dayCode = RIGHT('000' + CONVERT(VARCHAR, @dayOfYear), 3);
    SET @secondCode = RIGHT('00000' + CONVERT(VARCHAR, @secondOfDay), 5);

    -- 尋找 Table 的欄位
    SELECT 
        TOP 1 
        @SIDRowName = STUFF((
            SELECT ', ' + c.name 
            FROM sys.index_columns ic
            JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
            WHERE ic.object_id = i.object_id AND ic.index_id = i.index_id
            ORDER BY ic.key_ordinal
            FOR XML PATH('')
        ), 1, 2, '') 
    FROM sys.indexes i 
    WHERE i.object_id = OBJECT_ID(@TableName) AND i.index_id > 0  -- 排除堆

    -- 尋找預設的
    WHILE 1 = 1
    BEGIN

        SET @randomValue = RIGHT('0000000000' + CAST(ABS(CAST(CAST(NEWID() AS BINARY(5)) AS BIGINT)) % 10000000000 AS VARCHAR(10)), 10);
        SET @ReturnSID = @prefix + @dayCode + @secondCode + @randomValue;
        SET @sql = N'SELECT @SIDRowNameOUT = ' + QUOTENAME(@SIDRowName) + ' FROM ' + QUOTENAME(@TableName) + ' WHERE ' + QUOTENAME(@SIDRowName) + ' = @ReturnSIDIN';
        SET @ParmDefinition = N'@ReturnSIDIN nvarchar(20), @SIDRowNameOUT nvarchar(20) OUTPUT';

        DELETE FROM @tempTable;
        
        DECLARE @SIDRowNameOUT nvarchar(20)
        EXEC sp_executesql @sql, @ParmDefinition, @ReturnSIDIN = @ReturnSID, @SIDRowNameOUT = @SIDRowNameOUT OUTPUT;
        
        IF @SIDRowNameOUT IS NULL
            BREAK;
    END;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddLog]    Script Date: 2024/9/30 下午 05:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[usp_AddLog]
	(
		@_InBox_ReadID					tinyint					,		-- 執行 Log 時是使用第幾版
		@_InBox_SPNAME					nvarchar(120)		,		-- 執行的預存程序名稱
		@_InBox_GroupID					uniqueidentifier	,		-- 執行群組代碼
		@_InBox_ExProgram				nvarchar(40)			,		-- 執行的動作是什麼
		@_InBox_ActionJSON			nvarchar(Max)		,		-- 執行的過程是什麼
		@_OutBox_ReturnValues		nvarchar(Max)		output -- 回傳執行的項目
	) 
	AS
	
	-- ========================= 新增與維護注意事項(必須遵守規定) =====================
	-- 相關注解說明請寫在這裡，以免從 Visual Studio 轉至 SQL 說明內容沒有一起上去
	-- 如果要修改請以這檔案為主，並以 SSMS 19.0 版以上來修改以便有完整的編輯模式
	-- 編輯時請交由「專案人員」來進行相關的修正，修改前也請確定在 C# Class 內，
	-- 有那些程序有〔參考〕到並再加以確定修改後不會有任何影響，再行修正以下 TSQL 的語法，以免
	-- 你修改後，會使得其他程序也有引用到以下的資料而有所影響。
	-- ==========================================================================
	-- 指定檔案　：usp_AddLog 記錄執行的動作.sql
	-- 專案項目　：
	-- 專案用途　：記錄 sp 執行的動作為何
	-- 專案資料庫：
	-- 專案資料表：
	-- 專案人員　：
	-- 專案日期　：
	-- 專案說明　：@_InBox_ReadID				最主要是拿來做記錄版本使用，因為 Log 記錄往後會以不同的內容或是執行的程序不一定會有不同的記錄內容
	-- 　　　　　：@_InBox_ActionJSON		是記錄執行的項目與內容以利有往後擴充的保留
	-- 　　　　　：@_InBox_GroupID				最主要在執行過程會有一整段的過程，可以透過這 GUID 可以了解到整個執行過程，不然其他項目也記錄時
	--																			都不知道執行到那一個項目了??
	-- =========================================================================

	--======= 宣告預設的變數	================
	DECLARE @_StoredProgramsNAME nvarchar(100) = 'usp_AddLog' -- 執行項目
	
	--======= 宣告要儲存的表格	================
	DECLARE @_ReturnTable Table 
	(
		[RT_Status]					bit							,		--執行結果
		[RT_ActionValues]		nvarchar(2000)			--回傳結果為何
	) 
	
	--======= 執行行為與動作	================
	-- @_InBox_ServiceID				=	0
	-- 單純記錄一筆執行內容
	--=====================================

	if(@_InBox_ReadID = 0) 
		Begin

		INSERT INTO MyOffice_ExcuteionLog 
		(
			DeLog_StoredPrograms,
			DeLog_GroupID,
			DeLog_ExecutionProgram,
			DeLog_ExecutionInfo
		)
		Values
		(
			@_InBox_SPNAME,
			@_InBox_GroupID,
			@_InBox_ExProgram,
			@_InBox_ActionJSON
		)

		SET	@_OutBox_ReturnValues =
		(
				SELECT
						Top 100 
						DeLog_AutoID											AS 'AutoID',
						DeLog_ExecutionProgram					AS 'NAME',
						DeLog_ExecutionInfo							AS 'Action',
						DeLog_ExDateTime								AS 'DateTime'
				FROM
						MyOffice_ExcuteionLog						WITH(NOLOCK)
				WHERE
					DeLog_GroupID = @_InBox_GroupID
		
				ORDER BY
					DeLog_AutoID FOR json PATH,
					ROOT('ProgramLog'),
					INCLUDE_NULL_VALUES
		) 
	
		RETURN

End
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteUser]    Script Date: 2024/9/30 下午 05:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteUser]
(
    @SID CHAR(20), -- 要刪除的使用者SID
    @OutputMessage NVARCHAR(MAX) OUTPUT -- 返回刪除狀態
)
AS
BEGIN
    SET NOCOUNT ON;

    -- 宣告變數
    DECLARE @GroupID UNIQUEIDENTIFIER, @LogMessage NVARCHAR(MAX);

    -- 刪除使用者
    DELETE FROM Myoffice_ACPD
    WHERE Acpd_SID = @SID;

    -- 設定返回訊息
    SET @OutputMessage = N'使用者刪除成功, SID: ' + @SID;

    -- 記錄刪除操作
    SET @GroupID = NEWID();
    SET @LogMessage = N'{"Action": "Delete", "SID": "' + @SID + '"}';

    EXEC [dbo].[usp_AddLog] 
        0, 
        'usp_DeleteUser', 
        @GroupID, 
        'Delete', 
        @LogMessage, 
        @OutputMessage OUTPUT;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserBySID]    Script Date: 2024/9/30 下午 05:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetUserBySID]
(
    @SID CHAR(20),					 -- 接收SID
    @OutputData NVARCHAR(MAX) OUTPUT -- 輸出
)
AS
BEGIN
    SET NOCOUNT ON;

    -- 宣告變數
    DECLARE @GroupID UNIQUEIDENTIFIER, @LogMessage NVARCHAR(MAX);

    -- 查詢使用者資料並返回 JSON 格式
    SELECT * 
    FROM Myoffice_ACPD
    WHERE Acpd_SID = @SID
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;

    -- 設置 GroupID 和日誌訊息
    SET @GroupID = NEWID();
    SET @LogMessage = N'{"Action": "Read", "SID": "' + @SID + '"}';

    -- 記錄操作
    EXEC [dbo].[usp_AddLog] 
        0, 
        'usp_GetUserBySID', 
        @GroupID, 
        'Read', 
        @LogMessage, 
        @OutputData OUTPUT;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUser]    Script Date: 2024/9/30 下午 05:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertUser]
(
	@UserData NVARCHAR(MAX), -- 接收JSON
	@OutputMessage NVARCHAR(MAX) OUTPUT --輸出
)
AS
BEGIN
	SET NOCOUNT ON

	--宣告資料
	DECLARE 
		 @SID CHAR(20),
		 @CName NVARCHAR(60),
		 @EName NVARCHAR(40), 
		 @SName NVARCHAR(40),
         @Email NVARCHAR(60), 
		 @Status TINYINT,
		 @Stop BIT,
		 @StopMemo NVARCHAR(600),
         @LoginID NVARCHAR(30),
		 @LoginPW NVARCHAR(60), 
		 @Memo NVARCHAR(120),
         @NowID NVARCHAR(20),
		 @LogMessage NVARCHAR(MAX),
		 @GroupID UNIQUEIDENTIFIER
	
	--呼叫NEWSID來產生SID
	EXEC [dbo].[NEWSID] 'Myoffice_ACPD', @SID OUTPUT;

	
	SELECT
	@CName = JSON_VALUE(@UserData, '$.Acpd_CName'),
    @EName = JSON_VALUE(@UserData, '$.Acpd_EName'),
    @SName = JSON_VALUE(@UserData, '$.Acpd_SName'),
    @Email = JSON_VALUE(@UserData, '$.Acpd_Email'),
    @Status = TRY_CAST(JSON_VALUE(@UserData, '$.Acpd_Status') AS TINYINT),
    @Stop = TRY_CAST(JSON_VALUE(@UserData, '$.Acpd_Stop') AS BIT),
    @StopMemo = JSON_VALUE(@UserData, '$.Acpd_StopMemo'),
    @LoginID = JSON_VALUE(@UserData, '$.Acpd_LoginID'),
    @LoginPW = JSON_VALUE(@UserData, '$.Acpd_LoginPW'),
    @Memo = JSON_VALUE(@UserData, '$.Acpd_Memo'),
    @NowID = JSON_VALUE(@UserData, '$.Acpd_NowID');


	INSERT INTO 
		Myoffice_ACPD (
		Acpd_SID, 
		Acpd_CName, 
		Acpd_EName, 
		Acpd_SName, 
		Acpd_Email, 
		Acpd_Status, 
		Acpd_Stop, 
		Acpd_StopMemo, 
		Acpd_LoginID, 
		Acpd_LoginPW, 
		Acpd_Memo, 
		Acpd_NowDateTime, 
		Acpd_NowID)
    VALUES (
		@SID, 
		@CName, 
		@EName, 
		@SName, 
		@Email, 
		@Status, 
		@Stop, 
		@StopMemo, 
		@LoginID, 
		@LoginPW, 
		@Memo, 
		GETDATE(), 
		@NowID);

	SET @OutputMessage = N'使用者新增成功, SID: ' + @SID; 
	
	SET @LogMessage = N'{"Action": "Insert", "SID": "' + @SID + '", "Details": ' + @UserData + '}';
    
	SET @GroupID = NEWID();

	EXEC [dbo].[usp_AddLog] 
	0, 
	'usp_InsertUser', 
	@GroupID,
	'Create', 
	@LogMessage, 
	@OutputMessage OUTPUT;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateUser]    Script Date: 2024/9/30 下午 05:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateUser]
(
    @SID CHAR(20), -- 要更新的SID
    @UpdatedData NVARCHAR(MAX), -- 接收 JSON 格式的更新資料
    @OutputMessage NVARCHAR(MAX) OUTPUT -- 輸出
)
AS
BEGIN
    SET NOCOUNT ON;

    -- 宣告變數
    DECLARE 
        @CName NVARCHAR(60),
        @EName NVARCHAR(40),
        @SName NVARCHAR(40),
        @Email NVARCHAR(60),
        @Status TINYINT,
        @Stop BIT,
        @StopMemo NVARCHAR(600),
        @LoginID NVARCHAR(30),
        @LoginPW NVARCHAR(60),
        @Memo NVARCHAR(120),
        @NowID NVARCHAR(20),
        @GroupID UNIQUEIDENTIFIER,
        @LogMessage NVARCHAR(MAX);

    -- 從 JSON 解析資料
    SELECT 
        @CName = JSON_VALUE(@UpdatedData, '$.Acpd_CName'),
        @EName = JSON_VALUE(@UpdatedData, '$.Acpd_EName'),
        @SName = JSON_VALUE(@UpdatedData, '$.Acpd_SName'),
        @Email = JSON_VALUE(@UpdatedData, '$.Acpd_Email'),
        @Status = TRY_CAST(JSON_VALUE(@UpdatedData, '$.Acpd_Status') AS TINYINT),
        @Stop = TRY_CAST(JSON_VALUE(@UpdatedData, '$.Acpd_Stop') AS BIT),
        @StopMemo = JSON_VALUE(@UpdatedData, '$.Acpd_StopMemo'),
        @LoginID = JSON_VALUE(@UpdatedData, '$.Acpd_LoginID'),
        @LoginPW = JSON_VALUE(@UpdatedData, '$.Acpd_LoginPW'),
        @Memo = JSON_VALUE(@UpdatedData, '$.Acpd_Memo'),
        @NowID = JSON_VALUE(@UpdatedData, '$.Acpd_NowID');
    
    -- 更新資料
    UPDATE Myoffice_ACPD
    SET 
        Acpd_CName = @CName,
        Acpd_EName = @EName,
        Acpd_SName = @SName,
        Acpd_Email = @Email,
        Acpd_Status = @Status,
        Acpd_Stop = @Stop,
        Acpd_StopMemo = @StopMemo,
        Acpd_LoginID = @LoginID,
        Acpd_LoginPW = @LoginPW,
        Acpd_Memo = @Memo,
        Acpd_UpdDateTime = GETDATE(),
        Acpd_UpdID = @NowID
    WHERE Acpd_SID = @SID;

    -- 設定返回訊息
    SET @OutputMessage = N'使用者更新成功, SID: ' + @SID;

    -- 記錄更新操作
    SET @GroupID = NEWID();
    SET @LogMessage = N'{"Action": "Update", "SID": "' + @SID + '", "Details": ' + @UpdatedData + '}';

    EXEC [dbo].[usp_AddLog] 
        0, 
        'usp_UpdateUser', 
        @GroupID, 
        'Update', 
        @LogMessage, 
        @OutputMessage OUTPUT;
END;
GO
USE [master]
GO
ALTER DATABASE [BackendExamHub] SET  READ_WRITE 
GO
