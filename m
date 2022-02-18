Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D115C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 10:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0uSZ1uMNP5zxzGp5wvPXRShL6O7cQfH9eDL/hApt38=; b=lANT4YCGZnjGRt
	TvdyCgnCAElynUZ2yrp4/o7JqT6M8GF3CuBD1VHV+xhUKqm0gwncYGD7IzYenJ69VvZKbxc7DJU5q
	92W/Y9do1w6x4HDxWstcKUF9y6FB2u8gD6Z783TMOCK8oH3Lf6bOnOSJft7uHkBgO0Dyqitw45ftr
	R0BTtRQZhv6Fv01MFVPTudlx5lV+91DDAl3QUsX8TMAfLipYttAGlRkE6wp17lv6HjjGtbXrVp4Ai
	qzJ2vW0DK/Q/sZj7PtNSkbZ28uJjoj28XYpS5ahZO0yV+8EKAXGqHHWu0VLvSpYyV8bW7zlc5OXcg
	Di/atejiqbN4h20YBE0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL0nJ-00DtlC-AB; Fri, 18 Feb 2022 10:47:21 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL0nF-00Dtjq-2h
 for linux-riscv@lists.infradead.org; Fri, 18 Feb 2022 10:47:19 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 138F04004C
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645181235;
 bh=m68SKHYVMkKLCgGuzXph2sMvJL2KX6jKnMiXWjiPty0=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=X7abcIW0qAicWvr/rM//PPpyRJOYYXd1FG7sVXZGjbx/fN78c2//bzZGrnApvBOSm
 jR+LxjDIR+VyXeawLa53BdcS9ob7jOptnhFcv0qeZKmO1Yc8HNxIgiA6zRPP04IFu0
 UQhiHqGHiFermrGxvkyCLy/PN6O5fZNKSz8Q9Dl42Vm5ltpI+UJjS0RtofcmaWVRHD
 WfX8rGBQWdBzyHKRqUYS0TMVBsPLKU3I3jZkK5uy63GCX1lHMMWCOmIYUjolfuOOZL
 JHmHWUoNxrKvtJ7bypbqH6L8Kdab7IMN4VmhRdV3dFPlbQLJuRuzfwbc4Jz6GAzHBT
 90x/wPUqRtAKw==
Received: by mail-ed1-f70.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so5317510eda.5
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 02:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m68SKHYVMkKLCgGuzXph2sMvJL2KX6jKnMiXWjiPty0=;
 b=7OUFkCnNjewdYXFdhJavfGs5h875EfER2dH4Y+QhuMQPU7a1aoRoFI2R6pHfNzZSPA
 0iXQR3LMzDlmV7skXujoZL/fz9JJ2Bg94zmEPhNfuuOFACCbDYceHB747twxZlgHLfr9
 QWiENsEa/bo9UioVrZFl2a8AWtk2hQvPUw/k0h0fa2+0yOfXR1FB18H1i4zcyRnCnodU
 rCrh88e4MAAoTTb2HyeFFGXvoi5Iojp+or2zW7nFLWPXXhemyBPbV4GWouUbijTtbNEo
 3NVPxdlFWzs4rmjIjrcMEiah3vrRLEdUIDlIWt3xW08DEEa32F1acyo5lOnwEHIs3e+N
 RNqA==
X-Gm-Message-State: AOAM532tqeUXiv9AICVM1Hxzm3fe06VP7gAeMvOo738NnlL0LiBXeodA
 t8CP1p+s6ZlAfy/Frulyt3+sfw1efQ7iAzRnf+KM8k4XEy1/ra0+j3yDBHz8MRoZHb9SJfyJ5jO
 YRbEKtYgtXUqxntMeUEthhr3+I5+pKvEUYTun1V96eaAb78LNm0R/YCbOop7Kdg==
X-Received: by 2002:a05:6402:3591:b0:412:95d3:4aed with SMTP id
 y17-20020a056402359100b0041295d34aedmr7657684edc.450.1645181231898; 
 Fri, 18 Feb 2022 02:47:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZakqcqW/WkAeatJRwTX0nv59DdaEoUz6vOXj4o9GihRBs5oIctYAUQPJEUwQR+VW8I32/k6d2oLi0k9y2OXw=
X-Received: by 2002:a05:6402:3591:b0:412:95d3:4aed with SMTP id
 y17-20020a056402359100b0041295d34aedmr7657668edc.450.1645181231665; Fri, 18
 Feb 2022 02:47:11 -0800 (PST)
MIME-Version: 1.0
References: <mhng-4d503326-d18d-4155-a595-91dc15cfb4f1@palmerdabbelt-glaptop>
 <5846825d-cd7e-5085-569e-17cfaf36630f@ghiti.fr>
 <c6da1d52-380a-715a-8432-87e6a79bf7be@ghiti.fr>
 <b67e091d-7be0-7f8b-4ef2-0a97936a1d34@ghiti.fr>
In-Reply-To: <b67e091d-7be0-7f8b-4ef2-0a97936a1d34@ghiti.fr>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Fri, 18 Feb 2022 11:47:00 +0100
Message-ID: <CA+zEjCurCYeOdPdfJ23MwhJXE4ApQ+m3oHvs_ge8Jz5PYM45OA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] riscv: Introduce CONFIG_RELOCATABLE
To: Alexandre ghiti <alex@ghiti.fr>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, 
 paulus@samba.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_024717_289631_F2FAAFDC 
X-CRM114-Status: GOOD (  45.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

Do you intend to pull that in for-next or not yet? Can I do something to help?

Thanks,

Alex

On Mon, Jan 10, 2022 at 9:05 AM Alexandre ghiti <alex@ghiti.fr> wrote:
>
> Hi Palmer,
>
> Do you think this could go in for-next?
>
> Thanks,
>
> Alex
>
> On 12/6/21 10:44, Alexandre ghiti wrote:
> > @Palmer, can I do anything for that to be pulled in 5.17?
> >
> > Thanks,
> >
> > Alex
> >
> > On 10/27/21 07:04, Alexandre ghiti wrote:
> >> Hi Palmer,
> >>
> >> On 10/26/21 11:29 PM, Palmer Dabbelt wrote:
> >>> On Sat, 09 Oct 2021 10:20:20 PDT (-0700), alex@ghiti.fr wrote:
> >>>> Arf, I have sent this patchset with the wrong email address. @Palmer
> >>>> tell me if you want me to resend it correctly.
> >>> Sorry for being kind of slow here.  It's fine: there's a "From:" in
> >>> the patch, and git picks those up so it'll match the signed-off-by
> >>> line.  I send pretty much all my patches that way, as I never managed
> >>> to get my Google address working correctly.
> >>>
> >>>> Thanks,
> >>>>
> >>>> Alex
> >>>>
> >>>> On 10/9/21 7:12 PM, Alexandre Ghiti wrote:
> >>>>> From: Alexandre Ghiti <alex@ghiti.fr>
> >>>>>
> >>>>> This config allows to compile 64b kernel as PIE and to relocate it at
> >>>>> any virtual address at runtime: this paves the way to KASLR.
> >>>>> Runtime relocation is possible since relocation metadata are
> >>>>> embedded into
> >>>>> the kernel.
> >>> IMO this should really be user selectable, at a bare minimum so it's
> >>> testable.
> >>> I just sent along a patch to do that (my power's off at home, so email
> >>> is a bit
> >>> wacky right now).
> >>>
> >>> I haven't put this on for-next yet as I'm not sure if you had a fix
> >>> for the
> >>> kasan issue (which IIUC would conflict with this).
> >>
> >> The kasan issue only revealed that I need to move the kasan shadow
> >> memory around with sv48 support, that's not related to the relocatable
> >> kernel.
> >>
> >> Thanks,
> >>
> >> Alex
> >>
> >>
> >>>>> Note that relocating at runtime introduces an overhead even if the
> >>>>> kernel is loaded at the same address it was linked at and that the
> >>>>> compiler
> >>>>> options are those used in arm64 which uses the same RELA relocation
> >>>>> format.
> >>>>>
> >>>>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> >>>>> ---
> >>>>>   arch/riscv/Kconfig              | 12 ++++++++
> >>>>>   arch/riscv/Makefile             |  7 +++--
> >>>>>   arch/riscv/kernel/vmlinux.lds.S |  6 ++++
> >>>>>   arch/riscv/mm/Makefile          |  4 +++
> >>>>>   arch/riscv/mm/init.c            | 54
> >>>>> ++++++++++++++++++++++++++++++++-
> >>>>>   5 files changed, 80 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >>>>> index ea16fa2dd768..043ba92559fa 100644
> >>>>> --- a/arch/riscv/Kconfig
> >>>>> +++ b/arch/riscv/Kconfig
> >>>>> @@ -213,6 +213,18 @@ config PGTABLE_LEVELS
> >>>>>   config LOCKDEP_SUPPORT
> >>>>>       def_bool y
> >>>>>
> >>>>> +config RELOCATABLE
> >>>>> +    bool
> >>>>> +    depends on MMU && 64BIT && !XIP_KERNEL
> >>>>> +    help
> >>>>> +          This builds a kernel as a Position Independent Executable
> >>>>> (PIE),
> >>>>> +          which retains all relocation metadata required to
> >>>>> relocate the
> >>>>> +          kernel binary at runtime to a different virtual address
> >>>>> than the
> >>>>> +          address it was linked at.
> >>>>> +          Since RISCV uses the RELA relocation format, this
> >>>>> requires a
> >>>>> +          relocation pass at runtime even if the kernel is loaded
> >>>>> at the
> >>>>> +          same address it was linked at.
> >>>>> +
> >>>>>   source "arch/riscv/Kconfig.socs"
> >>>>>   source "arch/riscv/Kconfig.erratas"
> >>>>>
> >>>>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> >>>>> index 0eb4568fbd29..2f509915f246 100644
> >>>>> --- a/arch/riscv/Makefile
> >>>>> +++ b/arch/riscv/Makefile
> >>>>> @@ -9,9 +9,12 @@
> >>>>>   #
> >>>>>
> >>>>>   OBJCOPYFLAGS    := -O binary
> >>>>> -LDFLAGS_vmlinux :=
> >>>>> +ifeq ($(CONFIG_RELOCATABLE),y)
> >>>>> +    LDFLAGS_vmlinux += -shared -Bsymbolic -z notext -z norelro
> >>>>> +    KBUILD_CFLAGS += -fPIE
> >>>>> +endif
> >>>>>   ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
> >>>>> -    LDFLAGS_vmlinux := --no-relax
> >>>>> +    LDFLAGS_vmlinux += --no-relax
> >>>>>       KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
> >>>>>       CC_FLAGS_FTRACE := -fpatchable-function-entry=8
> >>>>>   endif
> >>>>> diff --git a/arch/riscv/kernel/vmlinux.lds.S
> >>>>> b/arch/riscv/kernel/vmlinux.lds.S
> >>>>> index 5104f3a871e3..862a8c09723c 100644
> >>>>> --- a/arch/riscv/kernel/vmlinux.lds.S
> >>>>> +++ b/arch/riscv/kernel/vmlinux.lds.S
> >>>>> @@ -133,6 +133,12 @@ SECTIONS
> >>>>>
> >>>>>       BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
> >>>>>
> >>>>> +    .rela.dyn : ALIGN(8) {
> >>>>> +        __rela_dyn_start = .;
> >>>>> +        *(.rela .rela*)
> >>>>> +        __rela_dyn_end = .;
> >>>>> +    }
> >>>>> +
> >>>>>   #ifdef CONFIG_EFI
> >>>>>       . = ALIGN(PECOFF_SECTION_ALIGNMENT);
> >>>>>       __pecoff_data_virt_size = ABSOLUTE(. - __pecoff_text_end);
> >>>>> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> >>>>> index 7ebaef10ea1b..2d33ec574bbb 100644
> >>>>> --- a/arch/riscv/mm/Makefile
> >>>>> +++ b/arch/riscv/mm/Makefile
> >>>>> @@ -1,6 +1,10 @@
> >>>>>   # SPDX-License-Identifier: GPL-2.0-only
> >>>>>
> >>>>>   CFLAGS_init.o := -mcmodel=medany
> >>>>> +ifdef CONFIG_RELOCATABLE
> >>>>> +CFLAGS_init.o += -fno-pie
> >>>>> +endif
> >>>>> +
> >>>>>   ifdef CONFIG_FTRACE
> >>>>>   CFLAGS_REMOVE_init.o = $(CC_FLAGS_FTRACE)
> >>>>>   CFLAGS_REMOVE_cacheflush.o = $(CC_FLAGS_FTRACE)
> >>>>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> >>>>> index c0cddf0fc22d..42041c12d496 100644
> >>>>> --- a/arch/riscv/mm/init.c
> >>>>> +++ b/arch/riscv/mm/init.c
> >>>>> @@ -20,6 +20,9 @@
> >>>>>   #include <linux/dma-map-ops.h>
> >>>>>   #include <linux/crash_dump.h>
> >>>>>   #include <linux/hugetlb.h>
> >>>>> +#ifdef CONFIG_RELOCATABLE
> >>>>> +#include <linux/elf.h>
> >>>>> +#endif
> >>>>>
> >>>>>   #include <asm/fixmap.h>
> >>>>>   #include <asm/tlbflush.h>
> >>>>> @@ -103,7 +106,7 @@ static void __init print_vm_layout(void)
> >>>>>       print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
> >>>>>             (unsigned long)high_memory);
> >>>>>   #ifdef CONFIG_64BIT
> >>>>> -    print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
> >>>>> +    print_mlm("kernel", (unsigned long)kernel_map.virt_addr,
> >>>>>             (unsigned long)ADDRESS_SPACE_END);
> >>>>>   #endif
> >>>>>   }
> >>>>> @@ -518,6 +521,44 @@ static __init pgprot_t pgprot_from_va(uintptr_t
> >>>>> va)
> >>>>>   #error "setup_vm() is called from head.S before relocate so it
> >>>>> should not use absolute addressing."
> >>>>>   #endif
> >>>>>
> >>>>> +#ifdef CONFIG_RELOCATABLE
> >>>>> +extern unsigned long __rela_dyn_start, __rela_dyn_end;
> >>>>> +
> >>>>> +static void __init relocate_kernel(void)
> >>>>> +{
> >>>>> +    Elf64_Rela *rela = (Elf64_Rela *)&__rela_dyn_start;
> >>>>> +    /*
> >>>>> +     * This holds the offset between the linked virtual address and
> >>>>> the
> >>>>> +     * relocated virtual address.
> >>>>> +     */
> >>>>> +    uintptr_t reloc_offset = kernel_map.virt_addr -
> >>>>> KERNEL_LINK_ADDR;
> >>>>> +    /*
> >>>>> +     * This holds the offset between kernel linked virtual
> >>>>> address and
> >>>>> +     * physical address.
> >>>>> +     */
> >>>>> +    uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR -
> >>>>> kernel_map.phys_addr;
> >>>>> +
> >>>>> +    for ( ; rela < (Elf64_Rela *)&__rela_dyn_end; rela++) {
> >>>>> +        Elf64_Addr addr = (rela->r_offset -
> >>>>> va_kernel_link_pa_offset);
> >>>>> +        Elf64_Addr relocated_addr = rela->r_addend;
> >>>>> +
> >>>>> +        if (rela->r_info != R_RISCV_RELATIVE)
> >>>>> +            continue;
> >>>>> +
> >>>>> +        /*
> >>>>> +         * Make sure to not relocate vdso symbols like rt_sigreturn
> >>>>> +         * which are linked from the address 0 in vmlinux since
> >>>>> +         * vdso symbol addresses are actually used as an offset from
> >>>>> +         * mm->context.vdso in VDSO_OFFSET macro.
> >>>>> +         */
> >>>>> +        if (relocated_addr >= KERNEL_LINK_ADDR)
> >>>>> +            relocated_addr += reloc_offset;
> >>>>> +
> >>>>> +        *(Elf64_Addr *)addr = relocated_addr;
> >>>>> +    }
> >>>>> +}
> >>>>> +#endif /* CONFIG_RELOCATABLE */
> >>>>> +
> >>>>>   #ifdef CONFIG_XIP_KERNEL
> >>>>>   static void __init create_kernel_page_table(pgd_t *pgdir,
> >>>>>                           __always_unused bool early)
> >>>>> @@ -625,6 +666,17 @@ asmlinkage void __init setup_vm(uintptr_t
> >>>>> dtb_pa)
> >>>>>       BUG_ON((kernel_map.virt_addr + kernel_map.size) >
> >>>>> ADDRESS_SPACE_END - SZ_4K);
> >>>>>   #endif
> >>>>>
> >>>>> +#ifdef CONFIG_RELOCATABLE
> >>>>> +    /*
> >>>>> +     * Early page table uses only one PGDIR, which makes it possible
> >>>>> +     * to map PGDIR_SIZE aligned on PGDIR_SIZE: if the relocation
> >>>>> offset
> >>>>> +     * makes the kernel cross over a PGDIR_SIZE boundary, raise a
> >>>>> bug
> >>>>> +     * since a part of the kernel would not get mapped.
> >>>>> +     */
> >>>>> +    BUG_ON(PGDIR_SIZE - (kernel_map.virt_addr & (PGDIR_SIZE - 1)) <
> >>>>> kernel_map.size);
> >>>>> +    relocate_kernel();
> >>>>> +#endif
> >>>>> +
> >>>>>       pt_ops.alloc_pte = alloc_pte_early;
> >>>>>       pt_ops.get_pte_virt = get_pte_virt_early;
> >>>>>   #ifndef __PAGETABLE_PMD_FOLDED
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
