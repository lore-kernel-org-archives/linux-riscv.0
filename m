From: atish.patra@wdc.com (Atish Patra)
Date: Mon, 19 Nov 2018 14:37:40 -0800
Subject: [PATCH v5] RISC-V: Update Kconfig to better handle CMDLINE
In-Reply-To: <20181119210907.12040-1-palmer@sifive.com>
References: <20181119210907.12040-1-palmer@sifive.com>
Message-ID: <95449dce-5bca-1034-e6ed-947055a37abd@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 11/19/18 1:10 PM, Palmer Dabbelt wrote:
> From: Nick Kossifidis <mick@ics.forth.gr>
> 
> Added a menu to choose how the built-in command line will be
> used and CMDLINE_EXTEND for compatibility with FDT code.
> 
> v2: Improved help messages, removed references to bootloader
> and made them more descriptive. I also asked help from a
> friend who's a language expert just in case.
> 
> v3: This time used the corrected text
> 
> v4: Copy the config strings from the arm32 port.
> 
> v5: Actually copy the config strings from the arm32 port.

Why not use CMDLINE_FROM_BOOTLOADER instead of CMDLINE_FALLBACK in that 
case? To my ears, CMDLINE_FROM_BOOTLOADER made more sense given the 
description. If CMDLINE_FALLBACK is retained intentionally, then it's ok.

Regards,
Atish
> 
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> Signed-off-by: Debbie Maliotaki <dmaliotaki@gmail.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>   arch/riscv/Kconfig | 57 +++++++++++++++++++++++++++-------------------
>   1 file changed, 33 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 55da93f4e818..23ac6d6f9ab2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -227,39 +227,48 @@ endmenu
>   
>   menu "Boot options"
>   
> -config CMDLINE_BOOL
> -	bool "Built-in kernel command line"
> +config CMDLINE
> +	string "Built-in kernel command line"
>   	help
> -	  For most platforms, it is firmware or second stage bootloader
> -	  that by default specifies the kernel command line options.
> -	  However, it might be necessary or advantageous to either override
> -	  the default kernel command line or add a few extra options to it.
> -	  For such cases, this option allows hardcoding command line options
> -	  directly into the kernel.
> +	  For most platforms, the arguments for the kernel's command line
> +	  are provided at run-time, during boot. However, there are cases
> +	  where either no arguments are being provided or the provided
> +	  arguments are insufficient or even invalid.
>   
> -	  For that, choose 'Y' here and fill in the extra boot parameters
> -	  in CONFIG_CMDLINE.
> +	  When that occurs, it is possible to define a built-in command
> +	  line here and choose how the kernel should use it later on.
>   
> -	  The built-in options will be concatenated to the default command
> -	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
> -	  command line will be ignored and replaced by the built-in string.
> +choice
> +	prompt "Built-in command line usage" if CMDLINE != ""
> +	default CMDLINE_FALLBACK
> +	help
> +	  Choose how the kernel will handle the provided built-in command
> +	  line.
>   
> -config CMDLINE
> -	string "Built-in kernel command string"
> -	depends on CMDLINE_BOOL
> -	default ""
> +config CMDLINE_FALLBACK
> +	bool "Use bootloader kernel arguments if available"
>   	help
> -	  Supply command-line options at build time by entering them here.
> +	  Use the built-in command line as fallback in case we get nothing
> +	  during boot. This is the default behaviour.
> 
> +config CMDLINE_EXTEND
> +	bool "Extend bootloader kernel arguments"
> +	help
> +	  The command-line arguments provided during boot will be
> +	  appended to the built-in command line. This is useful in
> +	  cases where the provided arguments are insufficient and
> +	  you don't want to or cannot modify them.
> +
>   
>   config CMDLINE_FORCE
> -	bool "Built-in command line overrides bootloader arguments"
> -	depends on CMDLINE_BOOL
> +	bool "Always use the default kernel command string"
>   	help
> -	  Set this option to 'Y' to have the kernel ignore the bootloader
> -	  or firmware command line.  Instead, the built-in command line
> -	  will be used exclusively.
> +	  Always use the built-in command line, even if we get one during
> +	  boot. This is useful in case you need to override the provided
> +	  command line on systems where you don't have or want control
> +	  over it.
>   
> -	  If you don't know what to do here, say N.
> +endchoice
>   
>   endmenu
>   
> 
