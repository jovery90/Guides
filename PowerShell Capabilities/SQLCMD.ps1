# SQLCMD is a powerful cmdlet to execute SQL scripts

# Dependencies: (Check if installed via cmd: where sqlcmd.exe), 1.  Visual C++ 2017 Redistributable, 2. Microsoft ODBC Driver 17 for SQL Server, 3. Microsoft Command Line Utiliies 15 for SQL Server (x86)
# https://learn.microsoft.com/en-us/sql/tools/sqlcmd/sqlcmd-utility?view=sql-server-ver16
# -b = Terminate job if error
# -E = Use trusted connection
# -S = Specify server
# -i = Specify file
# -I = Enable quoted identifiers


sqlcmd -b -E -S SomeServer -i SomeScript.sql -I
