From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 11 Jun 2018 13:53:29 -0700 (PDT)
Subject: [PATCH] RISC-V: Handle R_RISCV_32 in modules
In-Reply-To: <mvm8t7liwrr.fsf@suse.de>
Message-ID: <mhng-5cb86075-42ca-4d7a-906b-599072a6484c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 11 Jun 2018 00:54:00 PDT (-0700), schwab at suse.de wrote:
> On Jun 08 2018, Palmer Dabbelt <palmer@sifive.com> wrote:
>
>> On Thu, 07 Jun 2018 03:27:27 PDT (-0700), schwab at suse.de wrote:
>>> With CONFIG_MODVERSIONS=y the R_RISCV_32 relocation is used by the
>>> __kcrctab section.
>>>
>>> Signed-off-by: Andreas Schwab <schwab@suse.de>
>>> ---
>>>  arch/riscv/kernel/module.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
>>> index 5dddba301d..1d5e9b934b 100644
>>> --- a/arch/riscv/kernel/module.c
>>> +++ b/arch/riscv/kernel/module.c
>>> @@ -17,6 +17,17 @@
>>>  #include <linux/errno.h>
>>>  #include <linux/moduleloader.h>
>>>
>>> +static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
>>> +{
>>> +	if (v != (u32)v) {
>>
>> My worry with this kind of check is that it relies on some sort of
>> undefined behavior in C and that at some point in the future GCC will just
>> go decide the check can never fail.  I checked and GCC doesn't elide these
>> checks now, so I might be wrong.
>>
>> Is this defined to do what it looks like it's doing?
>
> This is unsigned arithmetic, thus fully defined.

Great, thanks!  I guess I'm just a bit paranoid :)
