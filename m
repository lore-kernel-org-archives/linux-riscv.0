From: shea@shealevy.com (Shea Levy)
Date: Thu, 01 Mar 2018 06:22:27 -0500
Subject: [PATCH 8/9] RISC-V: Support RISCV_ALIGN relocations in modules.
In-Reply-To: <mhng-670177e0-14df-457d-9dd1-dbdea0aea587@palmer-si-x1c4>
References: <mhng-670177e0-14df-457d-9dd1-dbdea0aea587@palmer-si-x1c4>
Message-ID: <87inag2g7g.fsf@xps13.shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Palmer,

Palmer Dabbelt <palmer@sifive.com> writes:

> On Thu, 22 Feb 2018 19:12:17 PST (-0800), shea at shealevy.com wrote:
>> While legal, this noop implementation may be inefficient.
>>
>> Signed-off-by: Shea Levy <shea@shealevy.com>
>> ---
>>  arch/riscv/kernel/module.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
>> index 4f3e15e7995b..827cf1211360 100644
>> --- a/arch/riscv/kernel/module.c
>> +++ b/arch/riscv/kernel/module.c
>> @@ -150,8 +150,8 @@ static int apply_r_riscv_call_rela(struct module *me, u32 *location,
>>  	return 0;
>>  }
>>
>> -static int apply_r_riscv_relax_rela(struct module *me, u32 *location,
>> -				    Elf_Addr v)
>> +static int apply_r_riscv_noop_rela(struct module *me, u32 *location,
>> +				   Elf_Addr v)
>>  {
>>  	return 0;
>>  }
>> @@ -181,7 +181,8 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
>>  	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
>>  	[R_RISCV_PCREL_LO12_S]		= apply_r_riscv_pcrel_lo12_s_rela,
>>  	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
>> -	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
>> +	[R_RISCV_RELAX]			= apply_r_riscv_noop_rela,
>> +	[R_RISCV_ALIGN]			= apply_r_riscv_noop_rela,
>>  	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
>>  	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
>>  };
>
> The output of most RISC-V toolchains requires a relaxation pass for alignment 
> for correctness.  Even if you're enforcing this somewhere in your module build 
> flow you should at least check for alignment when loading modules so there 
> aren't silent breakages, if R_RISCV_ALIGN is escaping to the kernel's loader 
> then it probably needs to be handled.
>

Well, I guess the question is: Do we want to do relaxations at all at
load time? If so, I'll work on that and include RISCV_ALIGN. If not, is
there any way to configure gcc and/or ld not to emit any relaxations? In
the latter case we can just explicitly not list RISCV_ALIGN here and the
module loader will fail with an unsupported relocation.

>
> For example, I did this (not the best example, but there should be some way to 
> generate this from C I was lazy):
>
>     diff --git a/crypto/authenc.c b/crypto/authenc.c
>     index d3d6d72fe649..4715d7f63f3e 100644
>     --- a/crypto/authenc.c
>     +++ b/crypto/authenc.c
>     @@ -42,6 +42,17 @@ struct authenc_request_ctx {
>             char tail[];
>      };
>     
>     +__asm__ (
>     +".align 2"
>     +"\n\t.global align2"
>     +"\n\talign2:"
>     +"\n\tret"
>     +"\n\t.align 3"
>     +"\n\t.global align3"
>     +"\n\talign3:"
>     +"\n\tret"
>     +);
>     +
>      static void authenc_request_complete(struct aead_request *req, int err)
>      {
>             if (err != -EINPROGRESS)
>
> and ended up with some misaligned stuff:
>
>     $ riscv64-unknown-elf-objdump -d -r crypto/authenc.ko | head -n25
>     
>     crypto/authenc.ko:     file format elf64-littleriscv
>     
>     
>     Disassembly of section .text:
>     
>     0000000000000000 <align2-0x2>:
>        0:	0001                	nop
>     			0: R_RISCV_ALIGN	*ABS*+0x2
>     
>     0000000000000002 <align2>:
>        2:	8082                	ret
>        4:	0001                	nop
>     			4: R_RISCV_ALIGN	*ABS*+0x6
>        6:	00000013          	nop
>     
>     000000000000000a <align3>:
>        a:	8082                	ret
>     
>     000000000000000c <crypto_authenc_extractkeys>:
>        c:	1141                	addi	sp,sp,-16
>        e:	e422                	sd	s0,8(sp)
>       10:	0800                	addi	s0,sp,16
>       12:	470d                	li	a4,3
>       14:	08c77063          	bleu	a2,a4,94 <.L4>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180301/8416b6ce/attachment.sig>
