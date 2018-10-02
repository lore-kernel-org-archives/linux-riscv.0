From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 2 Oct 2018 07:34:55 -0700
Subject: [PATCH] RISC-V: Implement built-in command line feature
In-Reply-To: <20181002140449.24147-1-mick@ics.forth.gr>
References: <20181002140449.24147-1-mick@ics.forth.gr>
Message-ID: <20181002143455.GA1476@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> +#ifdef CONFIG_CMDLINE_BOOL
> +#ifdef CONFIG_CMDLINE_FORCE
> +	static const char fixed_cmdline[] __initconst = CONFIG_CMDLINE;
> +#else
> +	static char builtin_cmdline[] __initdata = CONFIG_CMDLINE;
> +#endif
> +#endif

Why do you need two variables here?  x86, where this same logic is used
seems to get away with just a builtin_cmdline command line one.

Also please don't indent code inside cpp conditionals.

> +	/* When we return, cmdline_p should point to a temporary

This is not the normal kernel comment style.  Please keep the
/* on a line of its own.

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

Even if this seems mostly copied - it probably should be #if/#elif
instead of this convoluted magic:

#if defined(CONFIG_CMDLINE_FORCE)
	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
#elif defined(CONFIG_CMDLINE_BOOL)
	if (builtin_cmdline[0]) {
		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
	}
#endif
