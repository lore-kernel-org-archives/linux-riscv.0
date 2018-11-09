From: mick@ics.forth.gr (Nick Kossifidis)
Date: Fri, 09 Nov 2018 20:34:00 +0200
Subject: [PATCH] RISC-V: Update Kconfig to better handle CMDLINE
In-Reply-To: <20181004113230.7995-1-mick@ics.forth.gr>
References: <20181004113230.7995-1-mick@ics.forth.gr>
Message-ID: <ebe1db4d71a42711acb212013fd0fc2b@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hello Palmer,

???? 2018-10-04 14:32, Nick Kossifidis ??????:
> Add a menu to chose how the built-in command line will be used and
> add CMDLINE_EXTEND for compatibility with FDT code.
> 
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  arch/riscv/Kconfig | 45 ++++++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 82172bf85..cce141552 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -218,39 +218,42 @@ endmenu
> 
>  menu "Boot options"
> 
> -config CMDLINE_BOOL
> -	bool "Built-in kernel command line"
> +config CMDLINE
> +	string "Built-in kernel command line"
>  	help
>  	  For most platforms, it is firmware or second stage bootloader
>  	  that by default specifies the kernel command line options.
>  	  However, it might be necessary or advantageous to either override
> -	  the default kernel command line or add a few extra options to it.
> -	  For such cases, this option allows hardcoding command line options
> -	  directly into the kernel.
> +	  the provided kernel command line or add a few extra options to it.
> +	  For such cases, it is possible to define a built-in command line
> +	  here and chose how the kernel should use it later on.
> 
> -	  For that, choose 'Y' here and fill in the extra boot parameters
> -	  in CONFIG_CMDLINE.
> +choice
> +	prompt "Built-in command line usage" if CMDLINE != ""
> +	default CMDLINE_FALLBACK
> +	help
> +	  Chose how the kernel will handle the provided built-in command
> +	  line.
> 
> -	  The built-in options will be concatenated to the default command
> -	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
> -	  command line will be ignored and replaced by the built-in string.
> +config CMDLINE_FALLBACK
> +	bool "Fallback"
> +	help
> +	  Use the built-in command line as fallback in case we get nothing
> +	  from the boot loader.
> 
> -config CMDLINE
> -	string "Built-in kernel command string"
> -	depends on CMDLINE_BOOL
> -	default ""
> +config CMDLINE_EXTEND
> +	bool "Extension"
>  	help
> -	  Supply command-line options at build time by entering them here.
> +	  Use the built-in command line as an extension of the command line
> +	  provided by the boot loader.
> 
>  config CMDLINE_FORCE
> -	bool "Built-in command line overrides bootloader arguments"
> -	depends on CMDLINE_BOOL
> +	bool "Forced"
>  	help
> -	  Set this option to 'Y' to have the kernel ignore the bootloader
> -	  or firmware command line.  Instead, the built-in command line
> -	  will be used exclusively.
> +	  Use the built-in command line in place of the command line
> +	  provided by the boot loader.
> 
> -	  If you don't know what to do here, say N.
> +endchoice
> 
>  endmenu

Since we'll be using FDT only for handling cmdline, this one is still 
needed
because FDT code uses CMDLINE_EXTEND / FALLBACK instead. Do you want me 
to
re-send ?
