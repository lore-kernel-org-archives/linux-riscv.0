From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 02 Oct 2018 07:56:40 -0700 (PDT)
Subject: [PATCH] RISC-V: Implement built-in command line feature
In-Reply-To: <20181002140449.24147-1-mick@ics.forth.gr>
Message-ID: <mhng-d047a199-9994-4150-95b0-72ad6c1ec96a@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 02 Oct 2018 07:04:49 PDT (-0700), mick at ics.forth.gr wrote:
> This patch enables the use of a built-in kernel command line, which can
> optionaly also override the command line provided by the boot loader.
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>

Christoph's comments are valid, but I have a bigger one: our original plan was 
to fix the generic support for CONFIG_CMDLINE, and while I'd still prefer to do 
that our original attempt got hung up.  A working implementation trumps a clean 
one, but I'd still prefer the clean one if you have time to take a look.

The offending function is early_init_dt_scan_chosen() in drivers/of/fdt.c.  The 
issue is that this is only called when a chosen node is present, which doesn't 
get called (and therefor doesn't set boot_command_line) when there is no 
/chosen node.  The fix might be as simple as checking for a /chosen node in 
early_init_dt_scan_nodes(), and calling the CONFIG_CMDLINE handling if there's 
no /chosen node.

If that's too much work I can add it to my TODO list, but that never gets 
shorter :).  Given that last time we tried messing with this we broke things 
multiple times, I'd prefer to have this on for-next for a bit first either way, 
so there's no big rush on my end.

Thanks for the patch!

> ---
>  arch/riscv/kernel/setup.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index aee603123..fd171ca7f 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -30,6 +30,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/sched/task.h>
>  #include <linux/swiotlb.h>
> +#include <linux/string.h>
>
>  #include <asm/setup.h>
>  #include <asm/sections.h>
> @@ -39,6 +40,14 @@
>  #include <asm/tlbflush.h>
>  #include <asm/thread_info.h>
>
> +#ifdef CONFIG_CMDLINE_BOOL
> +#ifdef CONFIG_CMDLINE_FORCE
> +	static const char fixed_cmdline[] __initconst = CONFIG_CMDLINE;
> +#else
> +	static char builtin_cmdline[] __initdata = CONFIG_CMDLINE;
> +#endif
> +#endif
> +
>  #ifdef CONFIG_EARLY_PRINTK
>  static void sbi_console_write(struct console *co, const char *buf,
>  			      unsigned int n)
> @@ -215,6 +224,46 @@ void __init setup_arch(char **cmdline_p)
>                 register_console(early_console);
>         }
>  #endif
> +
> +	/* When we return, cmdline_p should point to a temporary
> +	 * buffer on the kernel's init section (that gets cleaned up
> +	 * later on) to be saved on static_command_line and parsed for
> +	 * parameters.
> +	 *
> +	 * That string may get tweaked during parameter parsing so we
> +	 * also want to keep an untouched version of the command line
> +	 * to display on dmesg, /proc/cmdline etc.
> +	 *
> +	 * At this point boot_command_line is a temporary buffer
> +	 * (also on the init section) that contains the command line
> +	 * string passed from the boot loader. After we return,
> +	 * it will be saved to saved_command_line that holds the
> +	 * untouched version of the command line.
> +	 *
> +	 * Since we won't be doing any parameter parsing here, we'll
> +	 * hold the initial/untouched command line string on
> +	 * boot_command_line and make cmdline_p point to it as well.
> +	 * This way boot_command_line will be copied to both
> +	 * saved_command_line and static_command_line.
> +	 */
> +#ifdef CONFIG_CMDLINE_BOOL
> +#ifdef CONFIG_CMDLINE_FORCE
> +	/* Built-in args override boot loader args and
> +	 * boot loader args are being ignored.
> +	 */
> +	strlcpy(boot_command_line, fixed_cmdline, COMMAND_LINE_SIZE);
> +#else
> +	/* Boot loader args override built-in args so we
> +	 * need to put built-in args before boot loader args.
> +	 */
> +	if (builtin_cmdline[0]) {
> +		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
> +		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> +		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> +	}
> +#endif
> +#endif
> +
>  	*cmdline_p = boot_command_line;
>
>  	parse_early_param();
