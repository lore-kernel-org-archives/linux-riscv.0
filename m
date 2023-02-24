Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F2DC64ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ICakCMNzkVuqSdfAlviDVlGcdbfYlM9CgCleLeJz4wk=; b=aSwEd7/oqCv9Zp
	6k08kpm4hB80zvC7KD73chXgPFuCKB6x5Vcb6uJFmCcys/6vy46cytYzBRYxX5csrygSOlbgNkSFf
	2Z9F9Fy7CCUjbbJ4mHJm3o1si6GyB0d95n4MEu6GRWOPZ0DA+Jv3+3P8QZMN5jI30mNaa6D5/CMvw
	BnyzFVRAIMLWfZDgNC/hEd2lJVBAwBEEzH3xdcBmFi/zr6mLeL91az9lWlVWZE0+fBZmtANDirErn
	tAUYbXwaLuhpiiH9OpF0xSqBsbeXCV6hSxNB1VJpP5+422of15ue7b0fK0YWHs4/bb68nyVbyRPTO
	eQPJqKlmtnzBl+NcyCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUnf-001ma4-58; Fri, 24 Feb 2023 09:55:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUnb-001mWD-DF
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 09:55:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id 6so12906323wrb.11
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 01:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B/I6Birz1nudKbAt4YEObLJmlU5k2URNQpB36UP4RQ0=;
        b=Xjumt1lF1bSLpds0vviECi7/BQkLwvPdAxAyqALWyMFHOunQlaxKUL/KyW57n67aoQ
         t0jNmVKzSZhPf1P06M/zj0MEnr/M3BnjkAWTFEhgL8+rvXny5ZT/BXQFgmtBh6KheK1P
         YGoSJAgJl1NKkIHKsVXnitXLgfSKoI5/XbnG+0B3fZrncgQ067CJWIwxH9Fc3WOaYfC8
         3N7YJSXKDMK/6O3+XEJJ7FiqPTwgynNWuPpxN024ylJUUXEmTerPT8CM/JY4wSBb8rMj
         KVVmtuEeNNheRblXk2Wc5Dl+J2XOrglKe6JXR3O8pxJtDrLte2Ue9O+2nmV4mhQntWEw
         PXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/I6Birz1nudKbAt4YEObLJmlU5k2URNQpB36UP4RQ0=;
        b=1qp6UBwZlljqlunBC/Iw2uM7gIJB3UwTBdMsCIqkSIT3/oZXr0rnWrlwwZl3OgiBhl
         vungvdQiWyINJiBZ5UyiJD5iEaXGAL3Z5g01V/JyyYUZBaTHNtb7wxo1z42h+K9BMhdG
         HCeO41nJc/jaEUmRp4TS0P9RJF1kfTnJt6+i/4MoAuS14G/S4Pcr4M/l9iMdKNm/tlAi
         TFPc9KrmnrDFNxoOaA9mXlw4p/aSUMamjgcI3nDofw382mv1H0GB0gFuNRElzT+BOvmL
         Ac3T6Lj/QMcw8hAjt7nbUWJGGHi3oEjO6ZQLcbLcP8WavP7UIXXBjYayilnc58asOP0k
         Kl6g==
X-Gm-Message-State: AO0yUKVqdlw8k18NdrYZXIOwNOQmHnny6yD92x8pddBjYm5x+kV9HpCh
	/WsW66tFSSd0p9JgBu7gj1udkg==
X-Google-Smtp-Source: AK7set/voORFL8ptlES8cyFefg46x+RkqPydamcWb2PsuaMeH1zT0Pw5Yj+0shlZ2/9b2kkxLO2xlg==
X-Received: by 2002:a5d:54c5:0:b0:2c7:df1:a09d with SMTP id x5-20020a5d54c5000000b002c70df1a09dmr6212222wrv.4.1677232527666;
        Fri, 24 Feb 2023 01:55:27 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id az35-20020a05600c602300b003eaf666cbe0sm2272910wmb.27.2023.02.24.01.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 01:55:27 -0800 (PST)
Date: Fri, 24 Feb 2023 10:55:26 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v4 4/4] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Message-ID: <20230224095526.ctctpzw3p3csf6qj@orel>
References: <20230221023523.1498500-1-jeeheng.sia@starfivetech.com>
 <20230221023523.1498500-5-jeeheng.sia@starfivetech.com>
 <20230223180720.55fgbxzlx6xvzgms@orel>
 <b26264a20b5f4bc5abfc6dd87aa4e38f@EXMBX066.cuchost.com>
 <20230224090010.nmy6latszfkdqcft@orel>
 <9cfd485d1e0d46cdb1323bb6ea330f6e@EXMBX066.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9cfd485d1e0d46cdb1323bb6ea330f6e@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015531_479940_6A9EE303 
X-CRM114-Status: GOOD (  48.66  )
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

On Fri, Feb 24, 2023 at 09:33:31AM +0000, JeeHeng Sia wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Jones <ajones@ventanamicro.com>
> > Sent: Friday, 24 February, 2023 5:00 PM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> > kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> > Subject: Re: [PATCH v4 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> > 
> > On Fri, Feb 24, 2023 at 02:05:43AM +0000, JeeHeng Sia wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Andrew Jones <ajones@ventanamicro.com>
> > > > Sent: Friday, 24 February, 2023 2:07 AM
> > > > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > > > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> > > > kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> > > > Subject: Re: [PATCH v4 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> > > >
> > > > On Tue, Feb 21, 2023 at 10:35:23AM +0800, Sia Jee Heng wrote:
> > > > > Low level Arch functions were created to support hibernation.
> > > > > swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
> > > > > cpu state onto the stack, then calling swsusp_save() to save the memory
> > > > > image.
> > > > >
> > > > > Arch specific hibernation header is implemented and is utilized by the
> > > > > arch_hibernation_header_restore() and arch_hibernation_header_save()
> > > > > functions. The arch specific hibernation header consists of satp, hartid,
> > > > > and the cpu_resume address. The kernel built version is also need to be
> > > > > saved into the hibernation image header to making sure only the same
> > > > > kernel is restore when resume.
> > > > >
> > > > > swsusp_arch_resume() creates a temporary page table that covering only
> > > > > the linear map. It copies the restore code to a 'safe' page, then start
> > > > > to restore the memory image. Once completed, it restores the original
> > > > > kernel's page table. It then calls into __hibernate_cpu_resume()
> > > > > to restore the CPU context. Finally, it follows the normal hibernation
> > > > > path back to the hibernation core.
> > > > >
> > > > > To enable hibernation/suspend to disk into RISCV, the below config
> > > > > need to be enabled:
> > > > > - CONFIG_ARCH_HIBERNATION_HEADER
> > > > > - CONFIG_ARCH_HIBERNATION_POSSIBLE
> > > > >
> > > > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > > > Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> > > > > ---
> > > > >  arch/riscv/Kconfig                 |   7 +
> > > > >  arch/riscv/include/asm/assembler.h |  20 ++
> > > > >  arch/riscv/include/asm/suspend.h   |  19 ++
> > > > >  arch/riscv/kernel/Makefile         |   1 +
> > > > >  arch/riscv/kernel/asm-offsets.c    |   5 +
> > > > >  arch/riscv/kernel/hibernate-asm.S  |  77 +++++
> > > > >  arch/riscv/kernel/hibernate.c      | 447 +++++++++++++++++++++++++++++
> > > > >  7 files changed, 576 insertions(+)
> > > > >  create mode 100644 arch/riscv/kernel/hibernate-asm.S
> > > > >  create mode 100644 arch/riscv/kernel/hibernate.c
> > > > >
> > > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > > index e2b656043abf..4555848a817f 100644
> > > > > --- a/arch/riscv/Kconfig
> > > > > +++ b/arch/riscv/Kconfig
> > > > > @@ -690,6 +690,13 @@ menu "Power management options"
> > > > >
> > > > >  source "kernel/power/Kconfig"
> > > > >
> > > > > +config ARCH_HIBERNATION_POSSIBLE
> > > > > +	def_bool y
> > > > > +
> > > > > +config ARCH_HIBERNATION_HEADER
> > > > > +	def_bool y
> > > > > +	depends on HIBERNATION
> > > >
> > > > nit: I think this can be simplified as def_bool HIBERNATION
> > > good suggestion. will change it.
> > > >
> > > > > +
> > > > >  endmenu # "Power management options"
> > > > >
> > > > >  menu "CPU Power Management"
> > > > > diff --git a/arch/riscv/include/asm/assembler.h b/arch/riscv/include/asm/assembler.h
> > > > > index 727a97735493..68c46c0e0ea8 100644
> > > > > --- a/arch/riscv/include/asm/assembler.h
> > > > > +++ b/arch/riscv/include/asm/assembler.h
> > > > > @@ -59,4 +59,24 @@
> > > > >  		REG_L	s11, (SUSPEND_CONTEXT_REGS + PT_S11)(a0)
> > > > >  	.endm
> > > > >
> > > > > +/*
> > > > > + * copy_page - copy 1 page (4KB) of data from source to destination
> > > > > + * @a0 - destination
> > > > > + * @a1 - source
> > > > > + */
> > > > > +	.macro	copy_page a0, a1
> > > > > +		lui	a2, 0x1
> > > > > +		add	a2, a2, a0
> > > > > +1 :
> > > >     ^ please remove this space
> > > can't remove it otherwise checkpatch will throws ERROR: spaces required around that ':'
> > 
> > Oh, right, labels in macros have this requirement.
> > 
> > > >
> > > > > +		REG_L	t0, 0(a1)
> > > > > +		REG_L	t1, SZREG(a1)
> > > > > +
> > > > > +		REG_S	t0, 0(a0)
> > > > > +		REG_S	t1, SZREG(a0)
> > > > > +
> > > > > +		addi	a0, a0, 2 * SZREG
> > > > > +		addi	a1, a1, 2 * SZREG
> > > > > +		bne	a2, a0, 1b
> > > > > +	.endm
> > > > > +
> > > > >  #endif	/* __ASM_ASSEMBLER_H */
> > > > > diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
> > > > > index 75419c5ca272..3362da56a9d8 100644
> > > > > --- a/arch/riscv/include/asm/suspend.h
> > > > > +++ b/arch/riscv/include/asm/suspend.h
> > > > > @@ -21,6 +21,11 @@ struct suspend_context {
> > > > >  #endif
> > > > >  };
> > > > >
> > > > > +/*
> > > > > + * Used by hibernation core and cleared during resume sequence
> > > > > + */
> > > > > +extern int in_suspend;
> > > > > +
> > > > >  /* Low-level CPU suspend entry function */
> > > > >  int __cpu_suspend_enter(struct suspend_context *context);
> > > > >
> > > > > @@ -36,4 +41,18 @@ int __cpu_resume_enter(unsigned long hartid, unsigned long context);
> > > > >  /* Used to save and restore the csr */
> > > > >  void suspend_save_csrs(struct suspend_context *context);
> > > > >  void suspend_restore_csrs(struct suspend_context *context);
> > > > > +
> > > > > +/* Low-level API to support hibernation */
> > > > > +int swsusp_arch_suspend(void);
> > > > > +int swsusp_arch_resume(void);
> > > > > +int arch_hibernation_header_save(void *addr, unsigned int max_size);
> > > > > +int arch_hibernation_header_restore(void *addr);
> > > > > +int __hibernate_cpu_resume(void);
> > > > > +
> > > > > +/* Used to resume on the CPU we hibernated on */
> > > > > +int hibernate_resume_nonboot_cpu_disable(void);
> > > > > +
> > > > > +asmlinkage void hibernate_restore_image(unsigned long resume_satp, unsigned long satp_temp,
> > > > > +					unsigned long cpu_resume);
> > > > > +asmlinkage int hibernate_core_restore_code(void);
> > > > >  #endif
> > > > > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > > > > index 4cf303a779ab..daab341d55e4 100644
> > > > > --- a/arch/riscv/kernel/Makefile
> > > > > +++ b/arch/riscv/kernel/Makefile
> > > > > @@ -64,6 +64,7 @@ obj-$(CONFIG_MODULES)		+= module.o
> > > > >  obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
> > > > >
> > > > >  obj-$(CONFIG_CPU_PM)		+= suspend_entry.o suspend.o
> > > > > +obj-$(CONFIG_HIBERNATION)	+= hibernate.o hibernate-asm.o
> > > > >
> > > > >  obj-$(CONFIG_FUNCTION_TRACER)	+= mcount.o ftrace.o
> > > > >  obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
> > > > > diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> > > > > index df9444397908..d6a75aac1d27 100644
> > > > > --- a/arch/riscv/kernel/asm-offsets.c
> > > > > +++ b/arch/riscv/kernel/asm-offsets.c
> > > > > @@ -9,6 +9,7 @@
> > > > >  #include <linux/kbuild.h>
> > > > >  #include <linux/mm.h>
> > > > >  #include <linux/sched.h>
> > > > > +#include <linux/suspend.h>
> > > > >  #include <asm/kvm_host.h>
> > > > >  #include <asm/thread_info.h>
> > > > >  #include <asm/ptrace.h>
> > > > > @@ -116,6 +117,10 @@ void asm_offsets(void)
> > > > >
> > > > >  	OFFSET(SUSPEND_CONTEXT_REGS, suspend_context, regs);
> > > > >
> > > > > +	OFFSET(HIBERN_PBE_ADDR, pbe, address);
> > > > > +	OFFSET(HIBERN_PBE_ORIG, pbe, orig_address);
> > > > > +	OFFSET(HIBERN_PBE_NEXT, pbe, next);
> > > > > +
> > > > >  	OFFSET(KVM_ARCH_GUEST_ZERO, kvm_vcpu_arch, guest_context.zero);
> > > > >  	OFFSET(KVM_ARCH_GUEST_RA, kvm_vcpu_arch, guest_context.ra);
> > > > >  	OFFSET(KVM_ARCH_GUEST_SP, kvm_vcpu_arch, guest_context.sp);
> > > > > diff --git a/arch/riscv/kernel/hibernate-asm.S b/arch/riscv/kernel/hibernate-asm.S
> > > > > new file mode 100644
> > > > > index 000000000000..846affe4dced
> > > > > --- /dev/null
> > > > > +++ b/arch/riscv/kernel/hibernate-asm.S
> > > > > @@ -0,0 +1,77 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > > +/*
> > > > > + * Hibernation low level support for RISCV.
> > > > > + *
> > > > > + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> > > > > + *
> > > > > + * Author: Jee Heng Sia <jeeheng.sia@starfivetech.com>
> > > > > + */
> > > > > +
> > > > > +#include <asm/asm.h>
> > > > > +#include <asm/asm-offsets.h>
> > > > > +#include <asm/assembler.h>
> > > > > +#include <asm/csr.h>
> > > > > +
> > > > > +#include <linux/linkage.h>
> > > > > +
> > > > > +/*
> > > > > + * int __hibernate_cpu_resume(void)
> > > > > + * Switch back to the hibernated image's page table prior to restoring the CPU
> > > > > + * context.
> > > > > + *
> > > > > + * Always returns 0
> > > > > + */
> > > > > +ENTRY(__hibernate_cpu_resume)
> > > > > +	/* switch to hibernated image's page table. */
> > > > > +	csrw CSR_SATP, s0
> > > > > +	sfence.vma
> > > > > +
> > > > > +	REG_L	a0, hibernate_cpu_context
> > > > > +
> > > > > +	restore_csr
> > > > > +	restore_reg
> > > > > +
> > > > > +	/* Return zero value. */
> > > > > +	add	a0, zero, zero
> > > >
> > > > nit: mv a0, zero
> > > sure
> > > >
> > > > > +
> > > > > +	ret
> > > > > +END(__hibernate_cpu_resume)
> > > > > +
> > > > > +/*
> > > > > + * Prepare to restore the image.
> > > > > + * a0: satp of saved page tables.
> > > > > + * a1: satp of temporary page tables.
> > > > > + * a2: cpu_resume.
> > > > > + */
> > > > > +ENTRY(hibernate_restore_image)
> > > > > +	mv	s0, a0
> > > > > +	mv	s1, a1
> > > > > +	mv	s2, a2
> > > > > +	REG_L	s4, restore_pblist
> > > > > +	REG_L	a1, relocated_restore_code
> > > > > +
> > > > > +	jalr	a1
> > > > > +END(hibernate_restore_image)
> > > > > +
> > > > > +/*
> > > > > + * The below code will be executed from a 'safe' page.
> > > > > + * It first switches to the temporary page table, then starts to copy the pages
> > > > > + * back to the original memory location. Finally, it jumps to __hibernate_cpu_resume()
> > > > > + * to restore the CPU context.
> > > > > + */
> > > > > +ENTRY(hibernate_core_restore_code)
> > > > > +	/* switch to temp page table. */
> > > > > +	csrw satp, s1
> > > > > +	sfence.vma
> > > > > +.Lcopy:
> > > > > +	/* The below code will restore the hibernated image. */
> > > > > +	REG_L	a1, HIBERN_PBE_ADDR(s4)
> > > > > +	REG_L	a0, HIBERN_PBE_ORIG(s4)
> > > >
> > > > Are we sure restore_pblist will never be NULL?
> > > restore_pblist is a link-list, it will be null during initialization or during page clean up by hibernation core. During the initial resume
> > process, the hibernation core will check the header and load the pages. If everything works correctly, the page will be linked to the
> > restore_pblist and then invoke swsusp_arch_resume() else hibernation core will throws error and failed to resume from the
> > hibernated image.
> > 
> > I know restore_pblist is a linked-list and this doesn't answer the
> > question. The comment above restore_pblist says
> > 
> > /*
> >  * List of PBEs needed for restoring the pages that were allocated before
> >  * the suspend and included in the suspend image, but have also been
> >  * allocated by the "resume" kernel, so their contents cannot be written
> >  * directly to their "original" page frames.
> >  */
> > 
> > which implies the pages that end up on this list are "special". My
> > question is whether or not we're guaranteed to have at least one
> > of these special pages. If not, we shouldn't assume s4 is non-null.
> > If so, then a comment stating why that's guaranteed would be nice.
> The restore_pblist will not be null otherwise swsusp_arch_resume wouldn't get invoked. you can find how the link-list are link and how it checks against validity at https://elixir.bootlin.com/linux/v6.2-rc8/source/kernel/power/snapshot.c . " A comment stating why that's guaranteed would be nice" ? Hmm, perhaps this is out of my scope but I do believe in the page validity checking in the link I shared.

Sorry, but pointing to an entire source file (one that I've obviously
already looked at, since I quoted a comment from it...) is not helpful.
I don't see where restore_pblist is being checked before
swsusp_arch_resume() is issued (from its callsite in hibernate.c).

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
