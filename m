From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 01 Oct 2018 09:56:18 -0700 (PDT)
Subject: [PATCH] RISC-V: Cosmetic menuconfig changes
In-Reply-To: <904aad36ec736345fc715b3f13c268f1@mailhost.ics.forth.gr>
Message-ID: <mhng-4401a1da-ed84-4aa3-b44a-c7475cd45aaa@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sat, 29 Sep 2018 13:45:05 PDT (-0700), mick at ics.forth.gr wrote:
> ???? 2018-09-29 04:44, Palmer Dabbelt ??????:
>> On Wed, 19 Sep 2018 15:48:15 PDT (-0700), mick at ics.forth.gr wrote:
>>> * Move the built-in cmdline configuration on a new menu entry "Boot
>>>   options", it doesn't make much sense to be part of the debuging
>>> menu.
>>>
>>> * Rename "Kernel Type" menu to "Kernel features" to be more consistent
>>> with
>>>   what other architectures are using, plus "type" is a bit misleading
>>> here.
>>>
>>> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
>>
>> This seems reasonable to me.  I've added it to our for-next branch,
>> we'll see if anyone else has comments.  Thanks!
>>
>> Did you, by any chance, go and check to see if these boot options
>> actually work?  We've got a bunch of subtly different boot methods and
>> they've been broken in various ones at various times, so I always like
>> to try and catalog what actually works now so at least I know where to
>> look when testing things.
>>
>
> I assumed that since it was already there it worked but you are right,
> cmdline when passed from the bootloader through the generated device
> tree
> (https://github.com/riscv/riscv-qemu/blob/riscv-all/hw/riscv/virt.c)
> works but when passed through the config option doesn't. Do you want me
> to send a separate patch for that or re-send this one as well as a
> series ?

I think it's better to send that out as a separate patch.  There's really no 
reason to couple the two, it's just that this reminded me that we probably had 
some bugs here.
