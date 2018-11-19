From: mick@ics.forth.gr (Nick Kossifidis)
Date: Tue, 20 Nov 2018 00:50:18 +0200
Subject: [PATCH v3] RISC-V: Update Kconfig to better handle CMDLINE
In-Reply-To: <mhng-236f884c-259b-4653-8aa0-5af7ffc205f7@palmer-si-x1c4>
References: <mhng-236f884c-259b-4653-8aa0-5af7ffc205f7@palmer-si-x1c4>
Message-ID: <0a4077db535beddb2fcb251cad9380ac@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-11-19 23:05, Palmer Dabbelt ??????:
> On Sat, 17 Nov 2018 16:06:56 PST (-0800), mick at ics.forth.gr wrote:
>> Added a menu to choose how the built-in command line will be
>> used and CMDLINE_EXTEND for compatibility with FDT code.
>> 
>> v2: Improved help messages, removed references to bootloader
>> and made them more descriptive. I also asked help from a
>> friend who's a language expert just in case.
>> 
>> v3: This time used the corrected text
>> 
>> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
>> Signed-off-by: Debbie Maliotaki <dmaliotaki@gmail.com>
>> ---
>>  arch/riscv/Kconfig | 57 
>> +++++++++++++++++++++++++++++++-----------------------
>>  1 file changed, 33 insertions(+), 24 deletions(-)
>> 
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 55da93f4e..808624f6b 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -227,39 +227,48 @@ endmenu
>> 
>>  menu "Boot options"
>> 
>> -config CMDLINE_BOOL
>> -	bool "Built-in kernel command line"
>> +config CMDLINE
>> +	string "Built-in kernel command line"
>>  	help
>> -	  For most platforms, it is firmware or second stage bootloader
>> -	  that by default specifies the kernel command line options.
>> -	  However, it might be necessary or advantageous to either override
>> -	  the default kernel command line or add a few extra options to it.
>> -	  For such cases, this option allows hardcoding command line options
>> -	  directly into the kernel.
>> +	  For most platforms, the arguments for the kernel's command line
>> +	  are provided at run-time, during boot. However, there are cases
>> +	  where either no arguments are being provided or the provided
>> +	  arguments are insufficient or even invalid.
>> 
>> -	  For that, choose 'Y' here and fill in the extra boot parameters
>> -	  in CONFIG_CMDLINE.
>> +	  When that occurs, it is possible to define a built-in command
>> +	  line here and choose how the kernel should use it later on.
>> 
>> -	  The built-in options will be concatenated to the default command
>> -	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
>> -	  command line will be ignored and replaced by the built-in string.
>> +choice
>> +	prompt "Built-in command line usage" if CMDLINE != ""
>> +	default CMDLINE_FALLBACK
>> +	help
>> +	  Choose how the kernel will handle the provided built-in command
>> +	  line.
>> 
>> -config CMDLINE
>> -	string "Built-in kernel command string"
>> -	depends on CMDLINE_BOOL
>> -	default ""
>> +config CMDLINE_FALLBACK
>> +	bool "Fallback"
>>  	help
>> -	  Supply command-line options at build time by entering them here.
>> +	  Use the built-in command line as fallback in case we get nothing
>> +	  during boot. This is the default behaviour.
>> +
>> +config CMDLINE_EXTEND
>> +	bool "Extension"
>> +	help
>> +	  The command-line arguments provided during boot will be
>> +	  appended to the built-in command line. This is useful in
>> +	  cases where the provided arguments are insufficient and
>> +	  you don't want to or cannot modify them.
>> +
>> 
>>  config CMDLINE_FORCE
>> -	bool "Built-in command line overrides bootloader arguments"
>> -	depends on CMDLINE_BOOL
>> +	bool "Forced"
>>  	help
>> -	  Set this option to 'Y' to have the kernel ignore the bootloader
>> -	  or firmware command line.  Instead, the built-in command line
>> -	  will be used exclusively.
>> +	  Always use the built-in command line, even if we get one during
>> +	  boot. This is useful in case you need to override the provided
>> +	  command line on systems where you don't have or want control
>> +	  over it.
>> 
>> -	  If you don't know what to do here, say N.
>> +endchoice
>> 
>>  endmenu
> 
> Thanks, but I still don't like the names of the options.  I've just
> gone ahead and sent a v4, let me know if that looks OK to you --
> that's what I was trying to say the first time.

ACK, much better indeed, sorry for the mess...
