From: mick@ics.forth.gr (Nick Kossifidis)
Date: Tue, 02 Oct 2018 18:21:26 +0300
Subject: [PATCH] RISC-V: Implement built-in command line feature
In-Reply-To: <20181002143455.GA1476@infradead.org>
References: <20181002140449.24147-1-mick@ics.forth.gr>
 <20181002143455.GA1476@infradead.org>
Message-ID: <a425c3cc9507782d305f802232704077@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-10-02 17:34, Christoph Hellwig ??????:
>> +#ifdef CONFIG_CMDLINE_BOOL
>> +#ifdef CONFIG_CMDLINE_FORCE
>> +	static const char fixed_cmdline[] __initconst = CONFIG_CMDLINE;
>> +#else
>> +	static char builtin_cmdline[] __initdata = CONFIG_CMDLINE;
>> +#endif
>> +#endif
> 
> Why do you need two variables here?  x86, where this same logic is used
> seems to get away with just a builtin_cmdline command line one.
> 

x86 actually uses an extra buffer named command_line, copies 
boot_command_line
there and returns a pointer to command_line (instead of just returning a 
pointer
to boot_command_line). What I do here is in case we have a forced 
command line,
I prefer having it as const (since the buffer won't get modified) 
instead of
having it as rw. I believe it's cleaner and the name is more 
representative.

> Also please don't indent code inside cpp conditionals.
> 

ACK (although there is nothing against it on the kernel coding 
guidelines)

>> +	/* When we return, cmdline_p should point to a temporary
> 
> This is not the normal kernel comment style.  Please keep the
> /* on a line of its own.
> 

It is for drivers/net where I've mostly worked (drivers/net/wireless) 
but you are
right, I'll fix it and re-send.

>> +#ifdef CONFIG_CMDLINE_BOOL
>> +#ifdef CONFIG_CMDLINE_FORCE
>> +	/* Built-in args override boot loader args and
>> +	 * boot loader args are being ignored.
>> +	 */
>> +	strlcpy(boot_command_line, fixed_cmdline, COMMAND_LINE_SIZE);
>> +#else
>> +	/* Boot loader args override built-in args so we
>> +	 * need to put built-in args before boot loader args.
>> +	 */
>> +	if (builtin_cmdline[0]) {
>> +		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
>> +		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
>> +		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
>> +	}
>> +#endif
>> +#endif
> 
> Even if this seems mostly copied - it probably should be #if/#elif
> instead of this convoluted magic:
> 
> #if defined(CONFIG_CMDLINE_FORCE)
> 	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> #elif defined(CONFIG_CMDLINE_BOOL)
> 	if (builtin_cmdline[0]) {
> 		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
> 		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> 		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> 	}
> #endif

There is a reason behind this "magic" IMHO, in your approach the reader 
doesn't realize
that CONFIG_CMDLINE_FORCE depends on CONFIG_CMDLINE_BOOL.
