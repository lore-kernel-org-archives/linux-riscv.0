From: mick@ics.forth.gr (Nick Kossifidis)
Date: Sat, 29 Sep 2018 23:45:05 +0300
Subject: [PATCH] RISC-V: Cosmetic menuconfig changes
In-Reply-To: <mhng-4c7f23e6-3111-4b77-9cb9-87da815f14d7@palmer-si-x1c4>
References: <mhng-4c7f23e6-3111-4b77-9cb9-87da815f14d7@palmer-si-x1c4>
Message-ID: <904aad36ec736345fc715b3f13c268f1@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-09-29 04:44, Palmer Dabbelt ??????:
> On Wed, 19 Sep 2018 15:48:15 PDT (-0700), mick at ics.forth.gr wrote:
>> * Move the built-in cmdline configuration on a new menu entry "Boot
>>   options", it doesn't make much sense to be part of the debuging 
>> menu.
>> 
>> * Rename "Kernel Type" menu to "Kernel features" to be more consistent 
>> with
>>   what other architectures are using, plus "type" is a bit misleading 
>> here.
>> 
>> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> 
> This seems reasonable to me.  I've added it to our for-next branch,
> we'll see if anyone else has comments.  Thanks!
> 
> Did you, by any chance, go and check to see if these boot options
> actually work?  We've got a bunch of subtly different boot methods and
> they've been broken in various ones at various times, so I always like
> to try and catalog what actually works now so at least I know where to
> look when testing things.
> 

I assumed that since it was already there it worked but you are right, 
cmdline when passed from the bootloader through the generated device 
tree 
(https://github.com/riscv/riscv-qemu/blob/riscv-all/hw/riscv/virt.c) 
works but when passed through the config option doesn't. Do you want me 
to send a separate patch for that or re-send this one as well as a 
series ?
