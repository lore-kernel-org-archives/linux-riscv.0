From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 16 Nov 2018 09:27:00 -0800 (PST)
Subject: [PATCH] RISC-V: Update Kconfig to better handle CMDLINE
In-Reply-To: <c5493cd7f7f3df0269c8a7d6d33ba199@mailhost.ics.forth.gr>
Message-ID: <mhng-c4cd5cdc-bffb-48f9-9594-0eca3acfe36c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 16 Nov 2018 09:14:04 PST (-0800), mick at ics.forth.gr wrote:
> ???? 2018-11-16 19:08, Nick Kossifidis ??????:
>> ???? 2018-11-16 18:52, Palmer Dabbelt ??????:
>>> On Fri, 09 Nov 2018 17:02:44 PST (-0800), mick at ics.forth.gr wrote:
>>>> Add a menu to chose how the built-in command line will be
>>>> used and add CMDLINE_EXTEND for compatibility with FDT code.
>>>>
>>>> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
>>>> ---
>>>>  arch/riscv/Kconfig | 45
>>>> ++++++++++++++++++++++++---------------------
>>>>  1 file changed, 24 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>>> index 55da93f4e818..81f884164b52 100644
>>>> --- a/arch/riscv/Kconfig
>>>> +++ b/arch/riscv/Kconfig
>>>> @@ -227,39 +227,42 @@ endmenu
>>>>
>>>>  menu "Boot options"
>>>>
>>>> -config CMDLINE_BOOL
>>>> -	bool "Built-in kernel command line"
>>>> +config CMDLINE
>>>> +	string "Built-in kernel command line"
>>>>  	help
>>>>  	  For most platforms, it is firmware or second stage bootloader
>>>>  	  that by default specifies the kernel command line options.
>>>>  	  However, it might be necessary or advantageous to either override
>>>> -	  the default kernel command line or add a few extra options to it.
>>>> -	  For such cases, this option allows hardcoding command line
>>>> options
>>>> -	  directly into the kernel.
>>>> +	  the provided kernel command line or add a few extra options to
>>>> it.
>>>> +	  For such cases, it is possible to define a built-in command line
>>>> +	  here and chose how the kernel should use it later on.
>>>>
>>>> -	  For that, choose 'Y' here and fill in the extra boot parameters
>>>> -	  in CONFIG_CMDLINE.
>>>> +choice
>>>> +	prompt "Built-in command line usage" if CMDLINE != ""
>>>> +	default CMDLINE_FALLBACK
>>>> +	help
>>>> +	  Chose how the kernel will handle the provided built-in command
>>>> +	  line.
>>>>
>>>> -	  The built-in options will be concatenated to the default command
>>>> -	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
>>>> -	  command line will be ignored and replaced by the built-in string.
>>>> +config CMDLINE_FALLBACK
>>>> +	bool "Fallback"
>>>> +	help
>>>> +	  Use the built-in command line as fallback in case we get nothing
>>>> +	  from the boot loader.
>>>>
>>>> -config CMDLINE
>>>> -	string "Built-in kernel command string"
>>>> -	depends on CMDLINE_BOOL
>>>> -	default ""
>>>> +config CMDLINE_EXTEND
>>>> +	bool "Extension"
>>>>  	help
>>>> -	  Supply command-line options at build time by entering them here.
>>>> +	  Use the built-in command line as an extension of the command line
>>>> +	  provided by the boot loader.
>>>>
>>>>  config CMDLINE_FORCE
>>>> -	bool "Built-in command line overrides bootloader arguments"
>>>> -	depends on CMDLINE_BOOL
>>>> +	bool "Forced"
>>>>  	help
>>>> -	  Set this option to 'Y' to have the kernel ignore the bootloader
>>>> -	  or firmware command line.  Instead, the built-in command line
>>>> -	  will be used exclusively.
>>>> +	  Use the built-in command line in place of the command line
>>>> +	  provided by the boot loader.
>>>>
>>>> -	  If you don't know what to do here, say N.
>>>> +endchoice
>>>>
>>>>  endmenu
>>>
>>> It looks like this is functionally equivalent to what ARM has, but the
>>> polarity is a bit different and the help strings aren't as easy to
>>> read.  Is there a reason we can't just copy what they do?
>>>
>>>    config CMDLINE
>>>            string "Default kernel command string"
>>>            default ""
>>>            help
>>>              On some architectures (EBSA110 and CATS), there is
>>> currently no way
>>>              for the boot loader to pass arguments to the kernel. For
>>> these
>>>              architectures, you should supply some command-line
>>> options at build
>>>              time by entering them here. As a minimum, you should
>>> specify the
>>>              memory size and the root device (e.g., mem=64M
>>> root=/dev/nfs).
>>>       choice
>>>            prompt "Kernel command line type" if CMDLINE != ""
>>>            default CMDLINE_FROM_BOOTLOADER
>>>            depends on ATAGS
>>>       config CMDLINE_FROM_BOOTLOADER
>>>            bool "Use bootloader kernel arguments if available"
>>>            help
>>>              Uses the command-line options passed by the boot loader.
>>> If
>>>              the boot loader doesn't provide any, the default kernel
>>> command
>>>              string provided in CMDLINE will be used.
>>>       config CMDLINE_EXTEND
>>>            bool "Extend bootloader kernel arguments"
>>>            help
>>>              The command-line arguments provided by the boot loader
>>> will be
>>>              appended to the default kernel command string.
>>>       config CMDLINE_FORCE
>>>            bool "Always use the default kernel command string"
>>>            help
>>>              Always use the default kernel command string, even if the
>>> boot
>>>              loader passes other arguments to the kernel.
>>>              This is useful if you cannot or don't want to change the
>>>              command-line options your boot loader passes to the
>>> kernel.
>>>    endchoice
>>>    I'm not really opposed to your solution, I'm just trying to avoid
>>> being different without a reason.
>>
>> ATAGS and references to ARM platforms such as EBSA110 are not related
>> to RISC-V
>> and I think CMDLINE_FALLBACK is more descriptive than
>> CMDLINE_FROM_BOOTLOADER.

OK.

> Now that you mention it the text could be better. I just wanted to
> keep them short and consistent. Do you want me to use ARM's text for
> CMDLINE_EXTEND and CMDLINE_FORCE ?

That's pretty much the only part I looked at.  "Extension" and "Forced" looked 
a bit too brief, so I grepped around and found the ARM one.  I only looked at 
the strings, I agree much of the help text makes no sense for RISC-V -- what 
was there is fine.

Can you re-spin the patch?
