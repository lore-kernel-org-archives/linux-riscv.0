From: shea@shealevy.com (Shea Levy)
Date: Thu, 01 Mar 2018 18:53:12 -0500
Subject: [PATCH 8/9] RISC-V: Support RISCV_ALIGN relocations in modules.
In-Reply-To: <mhng-53539693-f51f-4ff0-836b-e795a03a841c@palmer-si-x1c4>
References: <mhng-53539693-f51f-4ff0-836b-e795a03a841c@palmer-si-x1c4>
Message-ID: <87zi3r8iaf.fsf@xps13.shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Palmer Dabbelt <palmer@sifive.com> writes:

> On Thu, 01 Mar 2018 03:22:27 PST (-0800), shea at shealevy.com wrote:
>> Hi Palmer,
>>
>> Palmer Dabbelt <palmer@sifive.com> writes:
>>
>>> On Thu, 22 Feb 2018 19:12:17 PST (-0800), shea at shealevy.com wrote:
>>>> While legal, this noop implementation may be inefficient.
>>>>
>>>> Signed-off-by: Shea Levy <shea@shealevy.com>
>>>> ---
>>>>  arch/riscv/kernel/module.c | 7 ++++---
>>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
>>>> index 4f3e15e7995b..827cf1211360 100644
>>>> --- a/arch/riscv/kernel/module.c
>>>> +++ b/arch/riscv/kernel/module.c
>>>> @@ -150,8 +150,8 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
>>>>  	return 0;
>>>>  }
>>>>
>>>> -static int apply_r_riscv_relax_rela(struct module *me, u32 *location,
>>>> -				    Elf_Addr v)
>>>> +static int apply_r_riscv_noop_rela(struct module *me, u32 *location,
>>>> +				   Elf_Addr v)
>>>>  {
>>>>  	return 0;
>>>>  }
>>>> @@ -181,7 +181,8 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
>>>>  	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
>>>>  	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
>>>>  	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
>>>> -	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
>>>> +	[R_RISCV_RELAX]			= apply_r_riscv_noop_rela,
>>>> +	[R_RISCV_ALIGN]			= apply_r_riscv_noop_rela,
>>>>  	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
>>>>  	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
>>>>  };
>>>
>>> The output of most RISC-V toolchains requires a relaxation pass for alignment 
>>> for correctness.  Even if you're enforcing this somewhere in your module build 
>>> flow you should at least check for alignment when loading modules so there 
>>> aren't silent breakages, if R_RISCV_ALIGN is escaping to the kernel's loader 
>>> then it probably needs to be handled.
>>>
>>
>> Well, I guess the question is: Do we want to do relaxations at all at
>> load time? If so, I'll work on that and include RISCV_ALIGN. If not, is
>> there any way to configure gcc and/or ld not to emit any relaxations? In
>> the latter case we can just explicitly not list RISCV_ALIGN here and the
>> module loader will fail with an unsupported relocation.
>
> Well, this is awkward: I remembered doing this (and telling people about 
> "-mno-relax"), but apparently that was all just in my head.  Here's a patch to 
> add "-mno-relax" to GCC in the real world :) 
> https://gcc.gnu.org/ml/gcc-patches/2018-03/msg00062.html
>
> I think the best thing to do is:
>
> * Check if the complier supports "-mno-relax" and add it to the module build 
>   command-line.
> * Change R_RISCV_ALIGN support in the kernel to check if the address happens to 
>   already be aligned (which happens sometimes), and if it's not then provide a 
>   helpful error message along the lines of "upgrade to GCC 8".
>
> I guess we eventually want to support relaxation in the kernel, but only if 
> there's a real performance problem that someone can point out.

OK, thanks! I'll look into that.

Actually, other than the initial implementation cost, is there any
potential *problem* with implementing relaxations? If I have time I
might want to look into that just for my own education.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180301/9c5d9289/attachment.sig>
