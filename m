From: atish.patra@wdc.com (Atish Patra)
Date: Thu, 4 Oct 2018 13:42:47 -0700
Subject: [PATCH] OF: Handle CMDLINE when /chosen node is not present
In-Reply-To: <b57f9b47d5c8227c3170d3d54d22919e@mailhost.ics.forth.gr>
References: <20181004123110.8487-1-mick@ics.forth.gr>
 <fdd03e2e-4c1e-e89d-a336-ab4a716e7abc@wdc.com>
 <b57f9b47d5c8227c3170d3d54d22919e@mailhost.ics.forth.gr>
Message-ID: <3e42d09e-8e49-2766-596c-37200f395097@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 10/4/18 1:15 PM, Nick Kossifidis wrote:
> ???? 2018-10-04 21:54, Atish Patra ??????:
>> On 10/4/18 5:46 AM, Nick Kossifidis wrote:
>>> The /chosen node is optional so we should handle CMDLINE regardless
>>> the presence of /chosen/bootargs. Move handling of CMDLINE in
>>> early_init_dt_scan() instead.
>>>
>>> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
>>>
>>> ---
>>>    drivers/of/fdt.c | 69
>>> +++++++++++++++++++++++++++++++++++++++-----------------
>>>    1 file changed, 48 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>>> index 800ad252c..868464b0b 100644
>>> --- a/drivers/of/fdt.c
>>> +++ b/drivers/of/fdt.c
>>> @@ -31,6 +31,14 @@
>>>      #include "of_private.h"
>>>    +#ifdef CONFIG_CMDLINE
>>> +#ifdef CONFIG_CMDLINE_FORCE
>>> +static const char fixed_cmdline[] __initconst = CONFIG_CMDLINE;
>>> +#else
>>> +static char builtin_cmdline[] __initdata = CONFIG_CMDLINE;
>>> +#endif
>>> +#endif
>>> +
>>>    /*
>>>     * of_fdt_limit_memory - limit the number of regions in the /memory
>>> node
>>>     * @limit: maximum entries
>>> @@ -1088,28 +1096,10 @@ int __init early_init_dt_scan_chosen(unsigned
>>> long node, const char *uname,
>>>      	/* Retrieve command line */
>>>    	p = of_get_flat_dt_prop(node, "bootargs", &l);
>>> -	if (p != NULL && l > 0)
>>> +	if (p != NULL && l > 0) {
>>>    		strlcpy(data, p, min((int)l, COMMAND_LINE_SIZE));
>>> -
>>> -	/*
>>> -	 * CONFIG_CMDLINE is meant to be a default in case nothing else
>>> -	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
>>> -	 * is set in which case we override whatever was found earlier.
>>> -	 */
>>> -#ifdef CONFIG_CMDLINE
>>> -#if defined(CONFIG_CMDLINE_EXTEND)
>>> -	strlcat(data, " ", COMMAND_LINE_SIZE);
>>> -	strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>>> -#elif defined(CONFIG_CMDLINE_FORCE)
>>> -	strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>>> -#else
>>> -	/* No arguments from boot loader, use kernel's  cmdl*/
>>> -	if (!((char *)data)[0])
>>> -		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>>> -#endif
>>> -#endif /* CONFIG_CMDLINE */
>>> -
>>> -	pr_debug("Command line is: %s\n", (char*)data);
>>> +		pr_debug("Got bootargs: %s\n", (char *) data);
>>> +	}
>>>      	/* break now */
>>>    	return 1;
>>> @@ -1240,6 +1230,43 @@ bool __init early_init_dt_scan(void *params)
>>>    		return false;
>>>      	early_init_dt_scan_nodes();
>>> +
>>> +	/*
>>> +	 * The /chosen node normaly contains the bootargs element
>>
>> /s/normaly/normally
>>
> 
> ACK
> 
>>> +	 * that includes the kernel's command line parameters.
>>> +	 * However the presence of /chosen is not mandatory so
>>> +	 * in case we didn't get a command line when scanning
>>> +	 * nodes above, we should provide one here before we
>>> +	 * return, if possible.
>>> +	 *
>>> +	 * The built-in command line can be used as a default
>>> +	 * command line in case we received nothing from the
>>> +	 * device tree/bootloader. It can also be used for
>>> +	 * extending or replacing the received command line.
>>> +	 */
>>> +#ifdef CONFIG_CMDLINE
>>> +#if defined(CONFIG_CMDLINE_EXTEND)
>>> +	/*
>>> +	 * Order of parameters shouldn't matter for most cases,
>>> +	 * so prepending or appending the built-in command line
>>> +	 * shouldn't make a difference. In cases where it does
>>> +	 * it's up to the user to configure the kernel and/or
>>> +	 * the bootloader properly.
>>> +	 */
>>> +	if (builtin_cmdline[0]) {
>>> +		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
>>> +		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE)
>>> +	}
>>> +#elif defined(CONFIG_CMDLINE_FORCE)
>>> +	if (fixed_cmdline[0])
>>> +		strlcpy(boot_command_line, fixed_cmdline, COMMAND_LINE_SIZE);
>>> +#else
>>> +	/* No arguments from boot loader, use kernel's cmdline */
>>> +	if (!boot_command_line[0] && builtin_cmdline[0])
>>> +		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
>>> +#endif
>>> +#endif /* CONFIG_CMDLINE */
>>> +
>>
>> Any specific reason for doing this in early_init_dt_scan instead of
>> early_init_dt_scan_chosen?
>> I think keeping all boot command line modifications at one place makes
>> more sense.
>>
>> Regards,
>> Atish
> 
> When parsing the device tree through early_init_dt_scan, after verifying
> the fdt file's
> integrity, the code will start traversing through the various nodes of
> the tree using
> of_scan_flat_dt (on the same file I patched). That function gets a
> pointer to a search
> function as its first argument and the second argument is an auxiliary
> buffer. The
> search function will run for all nodes on the tree until it reaches the
> expected node
> in which case it returns 1 and the search will end.
> 
> If we do the tweaking of the command line inside
> early_init_dt_scan_chosen before the
> check is done, we'll mess up the command line badly since we'll be
> tweaking it
> for every node on the tree (until we reach the /chosen node, if we reach
> it). If we do
> it after the check -which is what's happening now- we might not reach
> the code since
> the /chosen node is optional so the check may never succeed. So we need
> to do the check
> after the search finishes. I chose to do it on early_init_dt_scan since
> it's something
> that IMHO should be checked before that function returns.
> 

It makes sense. Thanks.

Regards,
Atish
> Regards,
> Nick
> 
