Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE29AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 21:29:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 928E460EB4
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 21:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 928E460EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vy7goL+NCOEE+alUSURHL1WiytehagktbXpIZuERrTY=; b=LuViJWS9g3YHP52pDmgXeZWBLr
	9Cx1nY91VF+lqzF4oEgTNUDeQXKh/v1oqK20p0f0pWfzR6H+Zs2r+LyoY/TbOA/605UQ8yycpcgjC
	YMVSdIogKIOQIUYqpZ9WLAwxfwqL5sxLjYyAI5kVLKP8arqm2bsQbdH+/hJO5y93FU8kTfkWfkwOC
	XzvxejPiUEOrXbk138JLEMCdW7ehUyylEp4wzmu9OwmK9odK2cAPnwYTSJVuh8lgZc8uhfpgv/n+X
	oh78JPLFDKS397hQujP/dkTuTF/lh0+UcsrXMq8BFdMg1v0D3tNUk1ZuENL/UF5glwV6OlRMKjAiI
	EpEbYtDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfU0c-0038KA-C1; Tue, 26 Oct 2021 21:29:26 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfU0Y-0038Hg-0B
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 21:29:23 +0000
Received: by mail-pl1-x631.google.com with SMTP id t11so463418plq.11
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 14:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=X1yvw8v24V21j1qpd79GOJAEoT3+gpiT6E0yn3IC3aQ=;
 b=HREgEwX3YODOMwk/WNLZ7ZIO2/xIygXyA8hdxDnbBKI+Iussc5tpqWaujep5MCHTKP
 pFhEYZZOAkBEBO6pfKukEL7+TEwDeN9OHUiBIS255udGXxSOrE27K5avVtBi/XkUjgGa
 ti36HIpRS43TWHhk2yUcRFL4cgXLkdqXlzqc99aE/uRdpE6U9efsqR2Sh6RDo7jUG8UO
 1q+rEkuyyX0vQe/4b4fZQ5ARUuwYg6ccePdTSm2n4NdGPrzRZ+w6Si82jGRXpgpbPNnm
 DKs6slEjNbhMPdSMEECbCvpp9nbygugjZAyrf4p+YSKbdAsSdydHB9Us7HSP0Lkakzlt
 Brtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=X1yvw8v24V21j1qpd79GOJAEoT3+gpiT6E0yn3IC3aQ=;
 b=ExMLaZCIXoe2Ruber/KDQ5tvCVgUl61jqYBUN3/UTM5aM17cCMwndt9RvGWpl2f4Ys
 HyqSFieHj5DaLrHkLHjfFqvBCc1PrkJ8LaqP5d0hRTloQQoaTifi49Ro8R4Svlmj3D8K
 c44YLsjbbGA/e+A4DnmyF7VG+ZaQvLTPKQL2+xxu8K05LcA4tmYReyPyefc6KvALhkJR
 0Ud2FKpysYLZUA4v7FmeOEyRS/XuljrYKEPwCaNA773otqdnBlDgq+QjII4+579KaMMc
 uOAmWZIThgH8lZGP9jte6qmWvOTklC0Y40jh+Twxf17AJMtDS9IrDbOoTyHFvBgmRi/4
 ogCg==
X-Gm-Message-State: AOAM531+aJbwGYSZ64yhXPKd0aK2VvQXcvoif8yZzUl/Q1SLlzm1VaCN
 BJmjDgHClJr1/pkAHuervYRSeOg/1jjrZw==
X-Google-Smtp-Source: ABdhPJwCyMI37tlKgyWmHooK2rsZ7SwWPtD6Ua1Foe/rbIK89fOyQw/XJiD6R2idUIMZifknivljFw==
X-Received: by 2002:a17:902:8690:b0:13f:ffd6:6c63 with SMTP id
 g16-20020a170902869000b0013fffd66c63mr24777918plo.23.1635283757728; 
 Tue, 26 Oct 2021 14:29:17 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:676c:ab93:f48d:23ae])
 by smtp.gmail.com with ESMTPSA id p9sm23030680pfn.7.2021.10.26.14.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 14:29:17 -0700 (PDT)
Date: Tue, 26 Oct 2021 14:29:17 -0700 (PDT)
X-Google-Original-Date: Sat, 23 Oct 2021 16:23:32 PDT (-0700)
Subject: Re: [PATCH v7 1/3] riscv: Introduce CONFIG_RELOCATABLE
In-Reply-To: <a6223864-7263-5450-0890-0f05a137d8c2@ghiti.fr>
CC: alexandre.ghiti@canonical.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-4d503326-d18d-4155-a595-91dc15cfb4f1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_142922_078731_C39EC9EC 
X-CRM114-Status: GOOD (  34.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 09 Oct 2021 10:20:20 PDT (-0700), alex@ghiti.fr wrote:
> Arf, I have sent this patchset with the wrong email address. @Palmer
> tell me if you want me to resend it correctly.

Sorry for being kind of slow here.  It's fine: there's a "From:" in the 
patch, and git picks those up so it'll match the signed-off-by line.  I 
send pretty much all my patches that way, as I never managed to get my 
Google address working correctly.

>
> Thanks,
>
> Alex
>
> On 10/9/21 7:12 PM, Alexandre Ghiti wrote:
>> From: Alexandre Ghiti <alex@ghiti.fr>
>>
>> This config allows to compile 64b kernel as PIE and to relocate it at
>> any virtual address at runtime: this paves the way to KASLR.
>> Runtime relocation is possible since relocation metadata are embedded into
>> the kernel.

IMO this should really be user selectable, at a bare minimum so it's testable.
I just sent along a patch to do that (my power's off at home, so email is a bit
wacky right now).

I haven't put this on for-next yet as I'm not sure if you had a fix for the
kasan issue (which IIUC would conflict with this).

>> Note that relocating at runtime introduces an overhead even if the
>> kernel is loaded at the same address it was linked at and that the compiler
>> options are those used in arm64 which uses the same RELA relocation
>> format.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>  arch/riscv/Kconfig              | 12 ++++++++
>>  arch/riscv/Makefile             |  7 +++--
>>  arch/riscv/kernel/vmlinux.lds.S |  6 ++++
>>  arch/riscv/mm/Makefile          |  4 +++
>>  arch/riscv/mm/init.c            | 54 ++++++++++++++++++++++++++++++++-
>>  5 files changed, 80 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index ea16fa2dd768..043ba92559fa 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -213,6 +213,18 @@ config PGTABLE_LEVELS
>>  config LOCKDEP_SUPPORT
>>  	def_bool y
>>
>> +config RELOCATABLE
>> +	bool
>> +	depends on MMU && 64BIT && !XIP_KERNEL
>> +	help
>> +          This builds a kernel as a Position Independent Executable (PIE),
>> +          which retains all relocation metadata required to relocate the
>> +          kernel binary at runtime to a different virtual address than the
>> +          address it was linked at.
>> +          Since RISCV uses the RELA relocation format, this requires a
>> +          relocation pass at runtime even if the kernel is loaded at the
>> +          same address it was linked at.
>> +
>>  source "arch/riscv/Kconfig.socs"
>>  source "arch/riscv/Kconfig.erratas"
>>
>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> index 0eb4568fbd29..2f509915f246 100644
>> --- a/arch/riscv/Makefile
>> +++ b/arch/riscv/Makefile
>> @@ -9,9 +9,12 @@
>>  #
>>
>>  OBJCOPYFLAGS    := -O binary
>> -LDFLAGS_vmlinux :=
>> +ifeq ($(CONFIG_RELOCATABLE),y)
>> +	LDFLAGS_vmlinux += -shared -Bsymbolic -z notext -z norelro
>> +	KBUILD_CFLAGS += -fPIE
>> +endif
>>  ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
>> -	LDFLAGS_vmlinux := --no-relax
>> +	LDFLAGS_vmlinux += --no-relax
>>  	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
>>  	CC_FLAGS_FTRACE := -fpatchable-function-entry=8
>>  endif
>> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
>> index 5104f3a871e3..862a8c09723c 100644
>> --- a/arch/riscv/kernel/vmlinux.lds.S
>> +++ b/arch/riscv/kernel/vmlinux.lds.S
>> @@ -133,6 +133,12 @@ SECTIONS
>>
>>  	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
>>
>> +	.rela.dyn : ALIGN(8) {
>> +		__rela_dyn_start = .;
>> +		*(.rela .rela*)
>> +		__rela_dyn_end = .;
>> +	}
>> +
>>  #ifdef CONFIG_EFI
>>  	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
>>  	__pecoff_data_virt_size = ABSOLUTE(. - __pecoff_text_end);
>> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
>> index 7ebaef10ea1b..2d33ec574bbb 100644
>> --- a/arch/riscv/mm/Makefile
>> +++ b/arch/riscv/mm/Makefile
>> @@ -1,6 +1,10 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>
>>  CFLAGS_init.o := -mcmodel=medany
>> +ifdef CONFIG_RELOCATABLE
>> +CFLAGS_init.o += -fno-pie
>> +endif
>> +
>>  ifdef CONFIG_FTRACE
>>  CFLAGS_REMOVE_init.o = $(CC_FLAGS_FTRACE)
>>  CFLAGS_REMOVE_cacheflush.o = $(CC_FLAGS_FTRACE)
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index c0cddf0fc22d..42041c12d496 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -20,6 +20,9 @@
>>  #include <linux/dma-map-ops.h>
>>  #include <linux/crash_dump.h>
>>  #include <linux/hugetlb.h>
>> +#ifdef CONFIG_RELOCATABLE
>> +#include <linux/elf.h>
>> +#endif
>>
>>  #include <asm/fixmap.h>
>>  #include <asm/tlbflush.h>
>> @@ -103,7 +106,7 @@ static void __init print_vm_layout(void)
>>  	print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
>>  		  (unsigned long)high_memory);
>>  #ifdef CONFIG_64BIT
>> -	print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
>> +	print_mlm("kernel", (unsigned long)kernel_map.virt_addr,
>>  		  (unsigned long)ADDRESS_SPACE_END);
>>  #endif
>>  }
>> @@ -518,6 +521,44 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
>>  #error "setup_vm() is called from head.S before relocate so it should not use absolute addressing."
>>  #endif
>>
>> +#ifdef CONFIG_RELOCATABLE
>> +extern unsigned long __rela_dyn_start, __rela_dyn_end;
>> +
>> +static void __init relocate_kernel(void)
>> +{
>> +	Elf64_Rela *rela = (Elf64_Rela *)&__rela_dyn_start;
>> +	/*
>> +	 * This holds the offset between the linked virtual address and the
>> +	 * relocated virtual address.
>> +	 */
>> +	uintptr_t reloc_offset = kernel_map.virt_addr - KERNEL_LINK_ADDR;
>> +	/*
>> +	 * This holds the offset between kernel linked virtual address and
>> +	 * physical address.
>> +	 */
>> +	uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - kernel_map.phys_addr;
>> +
>> +	for ( ; rela < (Elf64_Rela *)&__rela_dyn_end; rela++) {
>> +		Elf64_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
>> +		Elf64_Addr relocated_addr = rela->r_addend;
>> +
>> +		if (rela->r_info != R_RISCV_RELATIVE)
>> +			continue;
>> +
>> +		/*
>> +		 * Make sure to not relocate vdso symbols like rt_sigreturn
>> +		 * which are linked from the address 0 in vmlinux since
>> +		 * vdso symbol addresses are actually used as an offset from
>> +		 * mm->context.vdso in VDSO_OFFSET macro.
>> +		 */
>> +		if (relocated_addr >= KERNEL_LINK_ADDR)
>> +			relocated_addr += reloc_offset;
>> +
>> +		*(Elf64_Addr *)addr = relocated_addr;
>> +	}
>> +}
>> +#endif /* CONFIG_RELOCATABLE */
>> +
>>  #ifdef CONFIG_XIP_KERNEL
>>  static void __init create_kernel_page_table(pgd_t *pgdir,
>>  					    __always_unused bool early)
>> @@ -625,6 +666,17 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>>  	BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);
>>  #endif
>>
>> +#ifdef CONFIG_RELOCATABLE
>> +	/*
>> +	 * Early page table uses only one PGDIR, which makes it possible
>> +	 * to map PGDIR_SIZE aligned on PGDIR_SIZE: if the relocation offset
>> +	 * makes the kernel cross over a PGDIR_SIZE boundary, raise a bug
>> +	 * since a part of the kernel would not get mapped.
>> +	 */
>> +	BUG_ON(PGDIR_SIZE - (kernel_map.virt_addr & (PGDIR_SIZE - 1)) < kernel_map.size);
>> +	relocate_kernel();
>> +#endif
>> +
>>  	pt_ops.alloc_pte = alloc_pte_early;
>>  	pt_ops.get_pte_virt = get_pte_virt_early;
>>  #ifndef __PAGETABLE_PMD_FOLDED

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
