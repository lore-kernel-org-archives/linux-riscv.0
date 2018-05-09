From: shea@shealevy.com (Shea Levy)
Date: Wed, 09 May 2018 07:20:00 -0400
Subject: [PATCH] RISC-V: Load modules within relative jump range of the
 kernel text.
In-Reply-To: <87d0yoizv9.fsf@xps13.shealevy.com>
References: <mhng-0a2f9574-9b23-4f26-ae76-18ed7f2c8533@palmer-si-x1c4>
 <87d0yoizv9.fsf@xps13.shealevy.com>
Message-ID: <87zi19gjof.fsf@xps13.shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Palmer,

Shea Levy <shea@shealevy.com> writes:

> Hi Palmer,
>
> Palmer Dabbelt <palmer@sifive.com> writes:
>
>> On Sun, 22 Apr 2018 05:53:56 PDT (-0700), shea at shealevy.com wrote:
>>> Hi Palmer,
>>>
>>> Shea Levy <shea@shealevy.com> writes:
>>>
>>>> Signed-off-by: Shea Levy <shea@shealevy.com>
>>>> ---
>>>>
>>>> Note that this patch worked in my old modules patchset and seems to be
>>>> working now, but my kernel boot locks up on top of
>>>> riscv-for-linus-4.17-mw0 and I don't know if it's due to this patch or
>>>> something else that's changed in the mean time.
>>>>
>>>> ---
>>>>  arch/riscv/include/asm/pgtable.h |  9 +++++++++
>>>>  arch/riscv/kernel/module.c       | 11 +++++++++++
>>>>  2 files changed, 20 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>>>> index 16301966d65b..b08ded13364a 100644
>>>> --- a/arch/riscv/include/asm/pgtable.h
>>>> +++ b/arch/riscv/include/asm/pgtable.h
>>>> @@ -25,6 +25,7 @@
>>>>  #include <asm/page.h>
>>>>  #include <asm/tlbflush.h>
>>>>  #include <linux/mm_types.h>
>>>> +#include <linux/sizes.h>
>>>>  
>>>>  #ifdef CONFIG_64BIT
>>>>  #include <asm/pgtable-64.h>
>>>> @@ -425,6 +426,14 @@ static inline void pgtable_cache_init(void)
>>>>  #define TASK_SIZE VMALLOC_START
>>>>  #endif
>>>>  
>>>> +/*
>>>> + * The module space lives between the addresses given by TASK_SIZE
>>>> + * and PAGE_OFFSET - it must be within 2G of the kernel text.
>>>> + */
>>>> +#define MODULES_SIZE		(SZ_128M)
>>>> +#define MODULES_VADDR		(PAGE_OFFSET - MODULES_SIZE)
>>>> +#define MODULES_END		(VMALLOC_END)
>>>> +
>>>>  #include <asm-generic/pgtable.h>
>>>>  
>>>>  #endif /* !__ASSEMBLY__ */
>>>> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
>>>> index 5dddba301d0a..1b382c7de095 100644
>>>> --- a/arch/riscv/kernel/module.c
>>>> +++ b/arch/riscv/kernel/module.c
>>>> @@ -16,6 +16,8 @@
>>>>  #include <linux/err.h>
>>>>  #include <linux/errno.h>
>>>>  #include <linux/moduleloader.h>
>>>> +#include <linux/vmalloc.h>
>>>> +#include <asm/pgtable.h>
>>>>  
>>>>  static int apply_r_riscv_64_rela(struct module *me, u32 *location, Elf_Addr v)
>>>>  {
>>>> @@ -382,3 +384,12 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>>>>  
>>>>  	return 0;
>>>>  }
>>>> +
>>>> +void *module_alloc(unsigned long size)
>>>> +{
>>>> +	return __vmalloc_node_range(size, 1, MODULES_VADDR,
>>>> +				    MODULES_END, GFP_KERNEL,
>>>> +				    PAGE_KERNEL_EXEC, 0,
>>>> +				    NUMA_NO_NODE,
>>>> +				    __builtin_return_address(0));
>>>> +}
>>>> -- 
>>>> 2.16.2
>>>
>>> Any thoughts on this?
>>
>> The concept looks good, but does this actually keep the modules within 2GiB of 
>> the text if PAGE_OFFSET is large?
>
> It's been some time since I wrote this, but I thought PAGE_OFFSET was
> where the kernel text *started*? So unless the text itself is bigger
> than 2G - 128 M, in which case we're SOL anyway, it seems like this
> should work. Is there something better we can do, without a large memory
> model?
>
> Thanks,
> Shea

Any further thoughts on this?

Thanks,
Shea
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180509/1a390a03/attachment.sig>
