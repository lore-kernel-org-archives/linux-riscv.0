Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516DFC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 10:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJ7PRAISEDLthxqXvr3rnRdfk/84KApCvyrlDYTFmqc=; b=CmWCt3hZAuPWSJ
	HQRmPK16NbWT9/5jMq1m+TvJLK+zAuUtIiKEg044YM2RNHtOuiebH8P/wQQBZDkdGHI6au2TR30Ok
	UAwYyTg1FD6ASB4VobjJxPKUqLlPsd6G3/PWT+178K2fRhuJCM3Jh4lCJOPhVrqHG8ycIHfm5ebzj
	BCu+q4FzFivexehgnV3z0/ZsTjA6J8AlRP+1dzcAd1oIYgVCnEur1NB82TCcjoH5AEurvH12LLtM1
	uhdGvbYvJ+GZArO3XN/YIPDXv8szRvXrmxVcVS6Uh8jwWwcyLUOCEdfEyTU0wvPSs6unMZXqOVaLV
	up4Er+LX/h0DKjEAmmMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnyR-007S7U-Re; Tue, 31 Jan 2023 10:34:47 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMnQz-007DH8-A3
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 10:00:16 +0000
Received: by mail-wr1-x436.google.com with SMTP id h12so13641085wrv.10
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 02:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I2PnCnyT2fvcTWG9X0fPVr4Dnve0da/bDZmD3vee3D4=;
        b=VCFV5rGhp6Gc9PaT9fkNHYM4wIVeq82lAc3Lw5l6+4ouE3t8Oooeolj/rrCma7MoRn
         q9NKOr4EL53XO5r7Y/yi/baiXcyVje4edXqhLTuiM3Cof/58VwFVnM5AVGmJQIPxR9oG
         rjDGk6K/en6JQuRrsUFASgpLjhMUjogIDdE8+2vIy6y7+HKbXLV/6bzPqUX230MCre2t
         dgEgY7CxXgQ3q9PDQNZb1c5VRZG18ZOtWXCyHQfYwtG5S79UiIQmEQR2NPRiK4gZdvz1
         8mGAAuDTbl+NIlwg9ip1HhtEs+0jE77EXjMCVl4zIVe+NG0yH3VQfSvPSvJ4a/E0EWrq
         81Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2PnCnyT2fvcTWG9X0fPVr4Dnve0da/bDZmD3vee3D4=;
        b=aTuMI99k0kmIaAfQBG4QgrOoHDkpe+kV906y9Vv2UuTtCSzASMC9K6JQ31fkeU/xc9
         MFi88qZBb68gwOWyu/+oqrPsMY8oLsC+ZusTIQUpEY6jfxe41YBclZifVNuwHAweb6eQ
         fuvDrZEliMCeuYDWuj3zUgaAzyc6guvmpfk71C25DyShSUxd0lVeHTkf5Jpuq45RH0jq
         J9kOpHSfMMrjWmX1BB18HYkNg5voqkPxLDQIgm4jnG30ej7tLd/Nr43/IP1ugnmQeE8q
         4zrZUv9NwEVhIyyCjdPKvtBTVwofFB84SeEUSUE4VN9nY/1ULWtfi0jI4JzYdoOdfAx3
         BlCA==
X-Gm-Message-State: AO0yUKXWMy9IWU9lGRQzTPhCXuXKT5gwsHGjXRAXKewmAueWvH6lFqZb
	Qsk72dnMF9uTfjjlKKSqfMJdpw4qWeqOX7w4DytfEg==
X-Google-Smtp-Source: AK7set/QWUSIy/GAgWU6t4njmCkJONh7fggwX0iwg5N1AsGt/lACe4NbLVz1u9gWmsfh2soPTeDjo81U6htWvfEXWhU=
X-Received: by 2002:adf:ee4d:0:b0:2bf:e31a:26ba with SMTP id
 w13-20020adfee4d000000b002bfe31a26bamr408623wro.144.1675159210194; Tue, 31
 Jan 2023 02:00:10 -0800 (PST)
MIME-Version: 1.0
References: <20230127091051.1465278-1-jeeheng.sia@starfivetech.com>
 <20230127091051.1465278-5-jeeheng.sia@starfivetech.com> <Y9hTGo6dfgeusW4B@spud>
In-Reply-To: <Y9hTGo6dfgeusW4B@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 31 Jan 2023 10:59:58 +0100
Message-ID: <CAHVXubgoi8FsfdAXVocL=ZcfGT=mA72uiq60jPVJB52ovKhdzA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
To: Conor Dooley <conor@kernel.org>
Cc: Sia Jee Heng <jeeheng.sia@starfivetech.com>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, leyfoon.tan@starfivetech.com, 
	mason.huo@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_020013_628685_5E668BFD 
X-CRM114-Status: GOOD (  48.64  )
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

Hi,

On Tue, Jan 31, 2023 at 12:30 AM Conor Dooley <conor@kernel.org> wrote:
>
> +CC Alex
>
> Alex, could you take a look at the page table bits here when you get a
> chance please?

Yes, I'll do that soon.

Thanks,

Alex

>
> On Fri, Jan 27, 2023 at 05:10:51PM +0800, Sia Jee Heng wrote:
> > Low level Arch functions were created to support hibernation.
> > swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
> > cpu state onto the stack, then calling swsusp_save() to save the memory
> > image.
> >
> > Arch specific hibernation header is implemented and is utilized by the
> > arch_hibernation_header_restore() and arch_hibernation_header_save()
> > functions. The arch specific hibernation header consists of satp, hartid,
> > and the cpu_resume address. The kernel built version is also need to be
> > saved into the hibernation image header to making sure only the same
> > kernel is restore when resume.
> >
> > swsusp_arch_resume() creates a temporary page table that covering only
> > the linear map. It copies the restore code to a 'safe' page, then start
> > to restore the memory image. Once completed, it restores the original
> > kernel's page table. It then calls into __hibernate_cpu_resume()
> > to restore the CPU context. Finally, it follows the normal hibernation
> > path back to the hibernation core.
> >
> > To enable hibernation/suspend to disk into RISCV, the below config
> > need to be enabled:
> > - CONFIG_ARCH_HIBERNATION_HEADER
> > - CONFIG_ARCH_HIBERNATION_POSSIBLE
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> > ---
> >  arch/riscv/Kconfig                 |   7 +
> >  arch/riscv/include/asm/assembler.h |  20 ++
> >  arch/riscv/include/asm/suspend.h   |  21 ++
> >  arch/riscv/kernel/Makefile         |   1 +
> >  arch/riscv/kernel/asm-offsets.c    |   5 +
> >  arch/riscv/kernel/hibernate-asm.S  |  89 +++++++
> >  arch/riscv/kernel/hibernate.c      | 360 +++++++++++++++++++++++++++++
> >  7 files changed, 503 insertions(+)
> >  create mode 100644 arch/riscv/kernel/hibernate-asm.S
> >  create mode 100644 arch/riscv/kernel/hibernate.c
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e2b656043abf..4555848a817f 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -690,6 +690,13 @@ menu "Power management options"
> >
> >  source "kernel/power/Kconfig"
> >
> > +config ARCH_HIBERNATION_POSSIBLE
> > +     def_bool y
> > +
> > +config ARCH_HIBERNATION_HEADER
> > +     def_bool y
> > +     depends on HIBERNATION
> > +
> >  endmenu # "Power management options"
> >
> >  menu "CPU Power Management"
> > diff --git a/arch/riscv/include/asm/assembler.h b/arch/riscv/include/asm/assembler.h
> > index ef1283d04b70..3de70d3e6ceb 100644
> > --- a/arch/riscv/include/asm/assembler.h
> > +++ b/arch/riscv/include/asm/assembler.h
> > @@ -59,4 +59,24 @@
> >               REG_L   s11, (SUSPEND_CONTEXT_REGS + PT_S11)(a0)
> >       .endm
> >
> > +/**
> > + * copy_page - copy 1 page (4KB) of data from source to destination
>
> arch/riscv/include/asm/assembler.h:64: warning: Incorrect use of kernel-doc format:  * copy_page - copy 1 page (4KB) of data from source to destination
>
> > + * @a0 - destination
> > + * @a1 - source
> > + */
> > +     .macro  copy_page a0, a1
> > +             lui     a2, 0x1
> > +             add     a2, a2, a0
> > +.1 :
> > +             REG_L   t0, 0(a1)
> > +             REG_L   t1, SZREG(a1)
> > +
> > +             REG_S   t0, 0(a0)
> > +             REG_S   t1, SZREG(a0)
> > +
> > +             addi    a0, a0, 2 * SZREG
> > +             addi    a1, a1, 2 * SZREG
> > +             bne     a2, a0, .1
>
> allmodconfig, clang 15.0.4:
>
> <instantiation>:3:1: error: unexpected token at start of statement
> .1 :
> ^
> /stuff/linux/arch/riscv/kernel/hibernate-asm.S:83:2: note: while in macro instantiation
>  copy_page a0, a1
>  ^
> <instantiation>:12:15: error: unknown operand
>   bne a2, a0, .1
>               ^
> /stuff/linux/arch/riscv/kernel/hibernate-asm.S:83:2: note: while in macro instantiation
>  copy_page a0, a1
>  ^
> make[5]: *** [/stuff/linux/scripts/Makefile.build:384: arch/riscv/kernel/hibernate-asm.o] Error 1
>
> > +     .endm
> > +
> >  #endif       /* __ASM_ASSEMBLER_H */
> > diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
> > index 75419c5ca272..db40ae433aa9 100644
> > --- a/arch/riscv/include/asm/suspend.h
> > +++ b/arch/riscv/include/asm/suspend.h
> > @@ -21,6 +21,12 @@ struct suspend_context {
> >  #endif
> >  };
> >
> > +/*
> > + * This parameter will be assigned to 0 during resume and will be used by
> > + * hibernation core for the subsequent resume sequence
>
> This isn't a parameter! I'm not sure that the comment really adds
> anything to be honest, but "Used by the hibernation core and cleared
> during the resume sequence" probably gets the point across equally well.
>
> > + */
> > +extern int in_suspend;
> > +
> >  /* Low-level CPU suspend entry function */
> >  int __cpu_suspend_enter(struct suspend_context *context);
> >
> > @@ -36,4 +42,19 @@ int __cpu_resume_enter(unsigned long hartid, unsigned long context);
> >  /* Used to save and restore the csr */
> >  void suspend_save_csrs(struct suspend_context *context);
> >  void suspend_restore_csrs(struct suspend_context *context);
> > +
> > +/* Low-level API to support hibernation */
> > +int swsusp_arch_suspend(void);
> > +int swsusp_arch_resume(void);
> > +int arch_hibernation_header_save(void *addr, unsigned int max_size);
> > +int arch_hibernation_header_restore(void *addr);
> > +int __hibernate_cpu_resume(void);
> > +
> > +/* Used to resume on the CPU we hibernated on */
> > +int hibernate_resume_nonboot_cpu_disable(void);
> > +
> > +/* Used to restore the hibernated image */
>
> I think this comment is kinda stating the obvious, no?
>
> > +asmlinkage void restore_image(unsigned long resume_satp, unsigned long satp_temp,
> > +                             unsigned long cpu_resume);
> > +asmlinkage int core_restore_code(void);
>
> How about dropping the comment and prepending hiberate_ to this function
> names?
>
> >  #endif
> > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > index 4cf303a779ab..daab341d55e4 100644
> > --- a/arch/riscv/kernel/Makefile
> > +++ b/arch/riscv/kernel/Makefile
> > @@ -64,6 +64,7 @@ obj-$(CONFIG_MODULES)               += module.o
> >  obj-$(CONFIG_MODULE_SECTIONS)        += module-sections.o
> >
> >  obj-$(CONFIG_CPU_PM)         += suspend_entry.o suspend.o
> > +obj-$(CONFIG_HIBERNATION)    += hibernate.o hibernate-asm.o
> >
> >  obj-$(CONFIG_FUNCTION_TRACER)        += mcount.o ftrace.o
> >  obj-$(CONFIG_DYNAMIC_FTRACE) += mcount-dyn.o
> > diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> > index df9444397908..d6a75aac1d27 100644
> > --- a/arch/riscv/kernel/asm-offsets.c
> > +++ b/arch/riscv/kernel/asm-offsets.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/kbuild.h>
> >  #include <linux/mm.h>
> >  #include <linux/sched.h>
> > +#include <linux/suspend.h>
> >  #include <asm/kvm_host.h>
> >  #include <asm/thread_info.h>
> >  #include <asm/ptrace.h>
> > @@ -116,6 +117,10 @@ void asm_offsets(void)
> >
> >       OFFSET(SUSPEND_CONTEXT_REGS, suspend_context, regs);
> >
> > +     OFFSET(HIBERN_PBE_ADDR, pbe, address);
> > +     OFFSET(HIBERN_PBE_ORIG, pbe, orig_address);
> > +     OFFSET(HIBERN_PBE_NEXT, pbe, next);
> > +
> >       OFFSET(KVM_ARCH_GUEST_ZERO, kvm_vcpu_arch, guest_context.zero);
> >       OFFSET(KVM_ARCH_GUEST_RA, kvm_vcpu_arch, guest_context.ra);
> >       OFFSET(KVM_ARCH_GUEST_SP, kvm_vcpu_arch, guest_context.sp);
> > diff --git a/arch/riscv/kernel/hibernate-asm.S b/arch/riscv/kernel/hibernate-asm.S
> > new file mode 100644
> > index 000000000000..a83d534b89bd
> > --- /dev/null
> > +++ b/arch/riscv/kernel/hibernate-asm.S
> > @@ -0,0 +1,89 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Hibernation support specific for RISCV
> > + *
> > + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> > + *
> > + * Author: Jee Heng Sia <jeeheng.sia@starfivetech.com>
> > + */
> > +
> > +#include <asm/asm.h>
> > +#include <asm/asm-offsets.h>
> > +#include <asm/assembler.h>
> > +#include <asm/csr.h>
> > +
> > +#include <linux/linkage.h>
> > +
> > +/*
> > + * This code is executed when resume from the hibernation.
> > + *
> > + * It begins with loading the temporary page table then restores the memory image.
> > + * Finally branches to __hibernate_cpu_resume() to restore the state saved by
> > + * swsusp_arch_suspend().
> > + */
>
> This file looks to be confusingly ordered. You lead with a comment
> describing a sequence but the file doesn't follow it.
> I suggest removing this comment.
>
> > +
> > +/*
> > + * int __hibernate_cpu_resume(void)
> > + * Switch back to the hibernated image's page table prior to restore the CPU
>
> nit: s/restore/restoring
>
> > + * context.
> > + *
> > + * Always returns 0 to the C code.
>
> s/to the C code//
>
> > + */
> > +ENTRY(__hibernate_cpu_resume)
> > +     /* switch to hibernated image's page table */
> > +     csrw CSR_SATP, s0
> > +     sfence.vma
> > +
> > +     REG_L   a0, hibernate_cpu_context
> > +
> > +     /* Restore CSRs */
>
> Stating the obvious again here, no?
>
> > +     restore_csr
> > +
> > +     /* Restore registers (except A0 and T0-T6) */
>
> Do we need to mention the (except A0 & T0-T6) here and elsewhere?
> If they're lost across calls anyway, is it worth mentioning that they're
> lost across hibernation?
>
> > +     restore_reg
> > +
> > +     /* Return zero value */
> > +     add     a0, zero, zero
> > +
> > +     /* Return to C code */
>
> I'd drop this comment. I don't think the presumed caller of the function
> needs to be mentioned here.
>
> > +     ret
> > +END(__hibernate_cpu_resume)
> > +
> > +/*
> > + * Prepare to restore the image.
> > + * a0: satp of saved page tables
> > + * a1: satp of temporary page tables
> > + * a2: cpu_resume
> > + */
> > +ENTRY(restore_image)
> > +     mv      s0, a0
> > +     mv      s1, a1
> > +     mv      s2, a2
> > +     REG_L   s4, restore_pblist
> > +     REG_L   a1, relocated_restore_code
> > +
> > +     jalr    a1
> > +END(restore_image)
> > +
> > +/*
> > + * The below code will be executed from a 'safe' page.
> > + * It first switches to the temporary page table, then start to copy the pages
>
> nit: s/start/starts/
>
> > + * back to the original memory location. Finally, it jumps to the __hibernate_cpu_resume()
>
> nit: s/jumps to the/jumps to/
>
> > + * to restore the CPU context.
> > + */
> > +ENTRY(core_restore_code)
> > +     /* switch to temp page table */
> > +     csrw satp, s1
> > +     sfence.vma
> > +.Lcopy:
> > +     /* The below code will restore the hibernated image. */
>
> I think this should be moved to the top of the pre-function comment.
>
> > +     REG_L   a1, HIBERN_PBE_ADDR(s4)
> > +     REG_L   a0, HIBERN_PBE_ORIG(s4)
> > +
> > +     copy_page a0, a1
> > +
> > +     REG_L   s4, HIBERN_PBE_NEXT(s4)
> > +     bnez    s4, .Lcopy
> > +
> > +     jalr    s2
> > +END(core_restore_code)
> > diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
> > new file mode 100644
> > index 000000000000..bf7f3c781820
> > --- /dev/null
> > +++ b/arch/riscv/kernel/hibernate.c
> > @@ -0,0 +1,360 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Hibernation support specific for RISCV
>
> Well, it'd be odd if it was for another arch but sitting in arch/riscv!
> ;)
>
> Thanks for your patches though, it'll be great to have hibernation
> support going.
>
> > + *
> > + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> > + *
> > + * Author: Jee Heng Sia <jeeheng.sia@starfivetech.com>
> > + */
> > +
> > +#include <asm/barrier.h>
> > +#include <asm/cacheflush.h>
> > +#include <asm/mmu_context.h>
> > +#include <asm/page.h>
> > +#include <asm/pgtable.h>
> > +#include <asm/sections.h>
> > +#include <asm/set_memory.h>
> > +#include <asm/smp.h>
> > +#include <asm/suspend.h>
> > +
> > +#include <linux/cpu.h>
> > +#include <linux/memblock.h>
> > +#include <linux/pm.h>
> > +#include <linux/sched.h>
> > +#include <linux/suspend.h>
> > +#include <linux/utsname.h>
> > +
> > +/* The logical cpu number we should resume on, initialised to a non-cpu number */
> > +static int sleep_cpu = -EINVAL;
> > +
> > +/* CPU context to be saved */
> > +struct suspend_context *hibernate_cpu_context;
> > +
> > +unsigned long relocated_restore_code;
> > +
> > +/* Pointer to the temporary resume page table */
> > +pgd_t *resume_pg_dir;
>
> sparse doesn't like what you've done here:
> /stuff/linux/arch/riscv/kernel/hibernate.c:31:24: warning: symbol 'hibernate_cpu_context' was not declared. Should it be static?
> /stuff/linux/arch/riscv/kernel/hibernate.c:33:15: warning: symbol 'relocated_restore_code' was not declared. Should it be static?
> /stuff/linux/arch/riscv/kernel/hibernate.c:36:7: warning: symbol 'resume_pg_dir' was not declared. Should it be static?
> > +
> > +/**
> > + * struct arch_hibernate_hdr_invariants - container to store kernel build version
> > + * @uts_version: to save the build number and date so that the we are not resume with
>
> nit: "so that we do not resume"
>
> > + *           a different kernel
> > + */
> > +struct arch_hibernate_hdr_invariants {
> > +     char            uts_version[__NEW_UTS_LEN + 1];
> > +};
> > +
> > +/**
> > + * struct arch_hibernate_hdr - helper parameters that help us to restore the image
> > + * @invariants: container to store kernel build version
> > + * @hartid: to make sure same boot_cpu executing the hibernate/restore code.
>
> nit: s/executing/executes
>
> Also, my OCD is triggered by the inconsistent full stops at EOL.
>
> > + * @saved_satp: original page table used by the hibernated image.
> > + * @restore_cpu_addr: the kernel's image address to restore the CPU context.
> > + */
> > +static struct arch_hibernate_hdr {
> > +     struct arch_hibernate_hdr_invariants invariants;
> > +     unsigned long   hartid;
> > +     unsigned long   saved_satp;
> > +     unsigned long   restore_cpu_addr;
> > +} resume_hdr;
> > +
> > +static inline void arch_hdr_invariants(struct arch_hibernate_hdr_invariants *i)
> > +{
> > +     memset(i, 0, sizeof(*i));
> > +     memcpy(i->uts_version, init_utsname()->version, sizeof(i->uts_version));
> > +}
> > +
> > +/*
> > + * Check if the given pfn is in the 'nosave' section.
> > + */
> > +int pfn_is_nosave(unsigned long pfn)
> > +{
> > +     unsigned long nosave_begin_pfn = sym_to_pfn(&__nosave_begin);
> > +     unsigned long nosave_end_pfn = sym_to_pfn(&__nosave_end - 1);
> > +
> > +     return ((pfn >= nosave_begin_pfn) && (pfn <= nosave_end_pfn));
> > +}
> > +
> > +void notrace save_processor_state(void)
> > +{
> > +     WARN_ON(num_online_cpus() != 1);
> > +}
> > +
> > +void notrace restore_processor_state(void)
> > +{
> > +}
> > +
> > +/*
> > + * Helper parameters need to be saved to the hibernation image header.
> > + */
> > +int arch_hibernation_header_save(void *addr, unsigned int max_size)
> > +{
> > +     struct arch_hibernate_hdr *hdr = addr;
> > +
> > +     if (max_size < sizeof(*hdr))
> > +             return -EOVERFLOW;
> > +
> > +     arch_hdr_invariants(&hdr->invariants);
> > +
> > +     hdr->hartid = cpuid_to_hartid_map(sleep_cpu);
> > +     hdr->saved_satp = csr_read(CSR_SATP);
> > +     hdr->restore_cpu_addr = (unsigned long)__hibernate_cpu_resume;
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(arch_hibernation_header_save);
>
> EXPORT_SYMBOL_GPL(), no? Same below.
>
> > +/*
> > + * Retrieve the helper parameters from the hibernation image header
> > + */
> > +int arch_hibernation_header_restore(void *addr)
> > +{
> > +     struct arch_hibernate_hdr_invariants invariants;
> > +     struct arch_hibernate_hdr *hdr = addr;
> > +     int ret = 0;
> > +
> > +     arch_hdr_invariants(&invariants);
> > +
> > +     if (memcmp(&hdr->invariants, &invariants, sizeof(invariants))) {
> > +             pr_crit("Hibernate image not generated by this kernel!\n");
>
> Out of curiosity more than anything else, why pr_crit()? Copy-paste from
> arm64?
>
> > +             return -EINVAL;
> > +     }
> > +
> > +     sleep_cpu = riscv_hartid_to_cpuid(hdr->hartid);
> > +     if (sleep_cpu < 0) {
> > +             pr_crit("Hibernated on a CPU not known to this kernel!\n");
> > +             sleep_cpu = -EINVAL;
> > +             return -EINVAL;
> > +     }
> > +
> > +#ifdef CONFIG_SMP
> > +     ret = bringup_hibernate_cpu(sleep_cpu);
> > +     if (ret) {
> > +             sleep_cpu = -EINVAL;
> > +             return ret;
> > +     }
> > +#endif
> > +     resume_hdr = *hdr;
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(arch_hibernation_header_restore);
> > +
> > +int swsusp_arch_suspend(void)
> > +{
> > +     int ret = 0;
> > +
> > +     if (__cpu_suspend_enter(hibernate_cpu_context)) {
> > +             sleep_cpu = smp_processor_id();
> > +             suspend_save_csrs(hibernate_cpu_context);
> > +             ret = swsusp_save();
> > +     } else {
> > +             suspend_restore_csrs(hibernate_cpu_context);
> > +             flush_tlb_all();
> > +
> > +             /* Invalidated Icache */
>
> Think this comment can go, no?
>
> > +             flush_icache_all();
> > +
> > +             /*
> > +              * Tell the hibernation core that we've just restored
> > +              * the memory
>
> I noticed arm64 manipulates the crash kernel in this function too.
> How come we don't?
>
> > +              */
> > +             in_suspend = 0;
> > +             sleep_cpu = -EINVAL;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
>
> The page table stuff here is beyond me... Hopefully Alex can take a look!
>
> I noticed arm64's one of these is not gated, what is different about
> RISC-V that requires it to be?
>
> > +int hibernate_resume_nonboot_cpu_disable(void)
> > +{
> > +     if (sleep_cpu < 0) {
> > +             pr_err("Failing to resume from hibernate on an unknown CPU.\n");
> > +             return -ENODEV;
> > +     }
> > +
> > +     return freeze_secondary_cpus(sleep_cpu);
> > +}
> > +#endif
> > +
> > +static int __init riscv_hibernate_init(void)
> > +{
> > +     hibernate_cpu_context = kcalloc(1, sizeof(struct suspend_context), GFP_KERNEL);
> > +
> > +     if (WARN_ON(!hibernate_cpu_context))
> > +             return -ENOMEM;
> > +
> > +     return 0;
> > +}
>
> Thanks,
> Conor.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
