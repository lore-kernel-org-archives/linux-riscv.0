From: mick@ics.forth.gr (Nick Kossifidis)
Date: Tue, 02 Oct 2018 19:43:48 +0300
Subject: [PATCH] RISC-V: Implement built-in command line feature
In-Reply-To: <mhng-d047a199-9994-4150-95b0-72ad6c1ec96a@palmer-si-x1c4>
References: <mhng-d047a199-9994-4150-95b0-72ad6c1ec96a@palmer-si-x1c4>
Message-ID: <41abac95c55e46047e37ee77439bc4c9@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-10-02 17:56, Palmer Dabbelt ??????:
> On Tue, 02 Oct 2018 07:04:49 PDT (-0700), mick at ics.forth.gr wrote:
>> This patch enables the use of a built-in kernel command line, which 
>> can
>> optionaly also override the command line provided by the boot loader.
>> 
>> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> 
> Christoph's comments are valid, but I have a bigger one: our original
> plan was to fix the generic support for CONFIG_CMDLINE, and while I'd
> still prefer to do that our original attempt got hung up.  A working
> implementation trumps a clean one, but I'd still prefer the clean one
> if you have time to take a look.
> 
> The offending function is early_init_dt_scan_chosen() in
> drivers/of/fdt.c.  The issue is that this is only called when a chosen
> node is present, which doesn't get called (and therefor doesn't set
> boot_command_line) when there is no /chosen node.  The fix might be as
> simple as checking for a /chosen node in early_init_dt_scan_nodes(),
> and calling the CONFIG_CMDLINE handling if there's no /chosen node.
> 
> If that's too much work I can add it to my TODO list, but that never
> gets shorter :).  Given that last time we tried messing with this we
> broke things multiple times, I'd prefer to have this on for-next for a
> bit first either way, so there's no big rush on my end.
> 
> Thanks for the patch!
> 

ACK I'll work on that instead, it makes more sense if we only get the
boot arguments through the device tree. We'll also need to define
CONFIG_CMDLINE_EXTEND for this to work as expected so I guess I'll send
a series to also tweak Kconfig again. Do you want me to work on top of
my previous Kconfig patch or should I send a new series from scratch ?
