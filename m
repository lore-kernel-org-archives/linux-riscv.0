Return-Path: <SRS0=q1JI=AW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C25C433E4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 03:59:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56B672078B
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 03:59:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2+NHC/b6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="TpS9YX+M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56B672078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=L/e+8JoUGDW4TqFQ+ecYtVJpbnY1TvrURK0ILuPty8E=; b=2+NHC/b62j/zSBuCAQQF93XKU
	QFvDFJVo/x/KYo2Vc2TX/BPiu4HQrhlnKbbSvUmIIWvdYohtZfM2a6tEuapT5R5w2ry57mgTuqd7G
	ncvIO6hTMK15BrgQpz9Uz0+jeq2e9SBeascPT5PQLB4m+7CFVEgly/vIEPy56TkeknC9q5yng7p05
	R2l/NgmDrs0U6CKPl3WSTpkbkDQV68BUM3voKIxiuz/QTRy649uDzg2ld7otGBU5tu/tmAYV7Oz/t
	JMsbhq5U+vs5eFP6PmbhllOIYtStz2a/uMhy2v6iMV4MiJ3ei20YQzS787J2YsRWnUD9HtiyrX9nW
	v3f3VMpCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju6fc-0001X6-2R; Sat, 11 Jul 2020 03:59:24 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju6fY-0001Sv-27
 for linux-riscv@lists.infradead.org; Sat, 11 Jul 2020 03:59:21 +0000
Received: by mail-pj1-x1042.google.com with SMTP id t15so3433989pjq.5
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2020 20:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=c6f+6cRpOoLMIpYjB00rFnOa7j759F3NtFrXCYvdvC0=;
 b=TpS9YX+MyD8Wl2k2lcZqbM6aL72opwSRYQR9aVZwEaj4bF1e7VS0w17CtA3L5B+qNh
 w9Ew54N0rSrvM4/SqWNvTkIPOtzNHNb42EdCSGPoyOMnBiMHHjuTZC7etOFsL5acA9o3
 acrIZG5CLAH5fWUWwXDzUZz0EyDr55ljjN8RAa4qKpadxtvZ1CmbMDjRbbjTopGDbonv
 FJZOzDGQf6FMVmWt6N0n3diymyo7bwru0GVmEdybksJRWKN56Oajz5x5SN5Wm6mjDdxx
 zxGmJySNbhLfwfiK3W660ACV3ZsTw/3qCchg9xZ3/zkZRh5AKQ03OsR6XUkmGweK5eFy
 //GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=c6f+6cRpOoLMIpYjB00rFnOa7j759F3NtFrXCYvdvC0=;
 b=Ssr/XHKGdk9YulKi9cnHSVvrtVB58+8r86v7+l+VBIo8zE7XkAZoxI1E5uFt9H1sIy
 Npr3pc3KnTt/byJwibvLe06crCOV/lHXz5NuJzwx6LxE4XAeW6Eaxg2OJIUSS6IbFa2r
 i60HuqYyRclG82kizIVDlp+ZwCFoUUuqtgtzwEJY6jjlFQ/BBgctnCYgTVUmn8wdWF3q
 7+xGnAIl1oSRGO0H9aEgMXjvk8EJDiDEFLVi4ie9RRbQUl3aYXQBsXBrJjt74iqauUUQ
 rWcKcLy3Ogx1N6w6+kQmaoX1xcK8qzJ9bjqn+fw61K3jKZ2LZOKIvIiimNOMKHjSPHgv
 8g5Q==
X-Gm-Message-State: AOAM531E3lofopP8KKIvcDCOKORGE3fzNrjYwq50OOogxtmNvZMxjdio
 u1HMX9xkMEbJ20s04bP/sMUzvMPpgvA=
X-Google-Smtp-Source: ABdhPJwmDNNVGPSzDTCwR0EmiDCoKkEERHtOnvPOntE230GxBrEhdVaLmBYR+zWZN5NKtsGlfy9Txg==
X-Received: by 2002:a17:90a:3567:: with SMTP id
 q94mr9232516pjb.226.1594439957142; 
 Fri, 10 Jul 2020 20:59:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m9sm7161932pjs.18.2020.07.10.20.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 20:59:16 -0700 (PDT)
Date: Fri, 10 Jul 2020 20:59:16 -0700 (PDT)
X-Google-Original-Date: Fri, 10 Jul 2020 18:16:37 PDT (-0700)
Subject: Re: [PATCH v2 2/3] RISC-V: Add kdump support
In-Reply-To: <20200623150512.896499-3-mick@ics.forth.gr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-8b167c99-bbdf-420c-95a4-40ad9d706d45@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_235920_196285_4C19A444 
X-CRM114-Status: GOOD (  46.96  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: david.abdurachmanov@sifive.com, anup@brainfault.org,
 Atish Patra <Atish.Patra@wdc.com>, yibin_liu@c-sky.com, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 23 Jun 2020 08:05:11 PDT (-0700), mick@ics.forth.gr wrote:
> This patch adds support for kdump, the kernel will reserve a
> region for the crash kernel and jump there on panic. In order
> for userspace tools (kexec-tools) to prepare the crash kernel
> kexec image, we also need to expose some information on
> /proc/iomem for the memory regions used by the kernel and for
> the region reserved for crash kernel. Note that on userspace
> the device tree is used to determine the system's memory
> layout so the "System RAM" on /proc/iomem is ignored. I just
> put it there for compatibility with other archs.
>
> I tested this on riscv64 qemu and works as expected, you may
> test it by triggering a crash through /proc/sysrq_trigger:
>
> echo c > /proc/sysrq_trigger
>
> v2:
>  * Properly populate the ioresources tree, so that it can be
>    used later on for implementing strict /dev/mem.
>  * Minor cleanups and re-base
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  arch/riscv/include/asm/kexec.h      |  19 ++-
>  arch/riscv/include/uapi/asm/elf.h   |   6 +
>  arch/riscv/kernel/Makefile          |   2 +-
>  arch/riscv/kernel/crash_save_regs.S |  56 +++++++++
>  arch/riscv/kernel/kexec_relocate.S  |  61 +++++++++-
>  arch/riscv/kernel/machine_kexec.c   |  31 +++--
>  arch/riscv/kernel/setup.c           | 180 ++++++++++++++++++++++++++++
>  arch/riscv/mm/init.c                |  77 ++++++++++++
>  8 files changed, 411 insertions(+), 21 deletions(-)
>  create mode 100644 arch/riscv/kernel/crash_save_regs.S
>
> diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
> index efc69feb4..4fd583acc 100644
> --- a/arch/riscv/include/asm/kexec.h
> +++ b/arch/riscv/include/asm/kexec.h
> @@ -21,11 +21,16 @@
>
>  #define KEXEC_ARCH KEXEC_ARCH_RISCV
>
> +extern void riscv_crash_save_regs(struct pt_regs *newregs);
> +
>  static inline void
>  crash_setup_regs(struct pt_regs *newregs,
>  		 struct pt_regs *oldregs)
>  {
> -	/* Dummy implementation for now */
> +	if (oldregs)
> +		memcpy(newregs, oldregs, sizeof(struct pt_regs));
> +	else
> +		riscv_crash_save_regs(newregs);
>  }
>
>
> @@ -38,10 +43,12 @@ struct kimage_arch {
>  const extern unsigned char riscv_kexec_relocate[];
>  const extern unsigned int riscv_kexec_relocate_size;
>
> -typedef void (*riscv_kexec_do_relocate)(unsigned long first_ind_entry,
> -					unsigned long jump_addr,
> -					unsigned long fdt_addr,
> -					unsigned long hartid,
> -					unsigned long va_pa_off);
> +typedef void (*riscv_kexec_method)(unsigned long first_ind_entry,
> +				   unsigned long jump_addr,
> +				   unsigned long fdt_addr,
> +				   unsigned long hartid,
> +				   unsigned long va_pa_off);
> +
> +extern riscv_kexec_method riscv_kexec_norelocate;
>
>  #endif
> diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
> index d696d6610..5b19f5547 100644
> --- a/arch/riscv/include/uapi/asm/elf.h
> +++ b/arch/riscv/include/uapi/asm/elf.h
> @@ -19,6 +19,12 @@ typedef unsigned long elf_greg_t;
>  typedef struct user_regs_struct elf_gregset_t;
>  #define ELF_NGREG (sizeof(elf_gregset_t) / sizeof(elf_greg_t))
>
> +#define ELF_CORE_COPY_REGS(dest, regs)			\
> +do {							\
> +	*(struct user_regs_struct *)&(dest) =		\
> +		*(struct user_regs_struct *)regs;	\
> +} while (0);
> +
>  /* We don't support f without d, or q.  */
>  typedef __u64 elf_fpreg_t;
>  typedef union __riscv_fp_state elf_fpregset_t;
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 63fc530a4..b9a3842ad 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -52,6 +52,6 @@ obj-$(CONFIG_SMP) += cpu_ops_sbi.o
>  endif
>  obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
>  obj-$(CONFIG_KGDB)		+= kgdb.o
> -obj-${CONFIG_KEXEC}		+= kexec_relocate.o machine_kexec.o
> +obj-${CONFIG_KEXEC}		+= kexec_relocate.o crash_save_regs.o machine_kexec.o
>
>  clean:
> diff --git a/arch/riscv/kernel/crash_save_regs.S b/arch/riscv/kernel/crash_save_regs.S
> new file mode 100644
> index 000000000..7832fb763
> --- /dev/null
> +++ b/arch/riscv/kernel/crash_save_regs.S
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 FORTH-ICS/CARV
> + *  Nick Kossifidis <mick@ics.forth.gr>
> + */
> +
> +#include <asm/asm.h>    	/* For RISCV_* and REG_* macros */
> +#include <asm/csr.h>		/* For CSR_* macros */
> +#include <asm/asm-offsets.h>	/* For offsets on pt_regs */
> +#include <linux/linkage.h>	/* For SYM_* macros */
> +
> +.section ".text"
> +SYM_CODE_START(riscv_crash_save_regs)
> +	REG_S ra,  PT_RA(a0)	/* x1 */
> +	REG_S sp,  PT_SP(a0)	/* x2 */
> +	REG_S gp,  PT_GP(a0)	/* x3 */
> +	REG_S tp,  PT_TP(a0)	/* x4 */
> +	REG_S t0,  PT_T0(a0)	/* x5 */
> +	REG_S t1,  PT_T1(a0)	/* x6 */
> +	REG_S t2,  PT_T2(a0)	/* x7 */
> +	REG_S s0,  PT_S0(a0)	/* x8/fp */
> +	REG_S s1,  PT_S1(a0)	/* x9 */
> +	REG_S a0,  PT_A0(a0)	/* x10 */
> +	REG_S a1,  PT_A1(a0)	/* x11 */
> +	REG_S a2,  PT_A2(a0)	/* x12 */
> +	REG_S a3,  PT_A3(a0)	/* x13 */
> +	REG_S a4,  PT_A4(a0)	/* x14 */
> +	REG_S a5,  PT_A5(a0)	/* x15 */
> +	REG_S a6,  PT_A6(a0)	/* x16 */
> +	REG_S a7,  PT_A7(a0)	/* x17 */
> +	REG_S s2,  PT_S2(a0)	/* x18 */
> +	REG_S s3,  PT_S3(a0)	/* x19 */
> +	REG_S s4,  PT_S4(a0)	/* x20 */
> +	REG_S s5,  PT_S5(a0)	/* x21 */
> +	REG_S s6,  PT_S6(a0)	/* x22 */
> +	REG_S s7,  PT_S7(a0)	/* x23 */
> +	REG_S s8,  PT_S8(a0)	/* x24 */
> +	REG_S s9,  PT_S9(a0)	/* x25 */
> +	REG_S s10, PT_S10(a0)	/* x26 */
> +	REG_S s11, PT_S11(a0)	/* x27 */
> +	REG_S t3,  PT_T3(a0)	/* x28 */
> +	REG_S t4,  PT_T4(a0)	/* x29 */
> +	REG_S t5,  PT_T5(a0)	/* x30 */
> +	REG_S t6,  PT_T6(a0)	/* x31 */
> +
> +	csrr t1, CSR_STATUS
> +	csrr t2, CSR_EPC
> +	csrr t3, CSR_TVAL
> +	csrr t4, CSR_CAUSE
> +
> +	REG_S t1, PT_STATUS(a0)
> +	REG_S t2, PT_EPC(a0)
> +	REG_S t3, PT_BADADDR(a0)
> +	REG_S t4, PT_CAUSE(a0)
> +	ret
> +SYM_CODE_END(riscv_crash_save_regs)
> diff --git a/arch/riscv/kernel/kexec_relocate.S b/arch/riscv/kernel/kexec_relocate.S
> index cd17d585f..c417c44ea 100644
> --- a/arch/riscv/kernel/kexec_relocate.S
> +++ b/arch/riscv/kernel/kexec_relocate.S
> @@ -152,7 +152,66 @@ SYM_CODE_START(riscv_kexec_relocate)
>  SYM_CODE_END(riscv_kexec_relocate)
>  riscv_kexec_relocate_end:
>
> -	.section ".rodata"
> +
> +/* Used for jumping to crashkernel */
> +.section ".text"
> +SYM_CODE_START(riscv_kexec_norelocate)
> +	/*
> +	 * s0: (const) Phys address to jump to
> +	 * s1: (const) Phys address of the FDT image
> +	 * s2: (const) The hartid of the current hart
> +	 */
> +	mv	s0, a1
> +	mv	s1, a2
> +	mv	s2, a3
> +
> +	/* Disable / cleanup interrupts */
> +	csrw	sie, zero
> +	csrw	sip, zero
> +
> +	/* Switch to physical addressing */
> +	csrw	sptbr, zero

I guess I'm missing something, but I'd assume that we would need some sort of
tvec juggling here like we usually do when jumping between virtual and physical
spaces.  I get that we're not relocating the kernel that we're jumping to, but
I don't understand how PAGE_OFFSET works.

> +
> +	/* Pass the arguments to the next kernel  / Cleanup*/

Missing space in that comment.

> +	mv	a0, s2
> +	mv	a1, s1
> +	mv	a2, s0
> +
> +	/* Cleanup */
> +	mv	a3, zero
> +	mv	a4, zero
> +	mv	a5, zero
> +	mv	a6, zero
> +	mv	a7, zero
> +
> +	mv	s0, zero
> +	mv	s1, zero
> +	mv	s2, zero
> +	mv	s3, zero
> +	mv	s4, zero
> +	mv	s5, zero
> +	mv	s6, zero
> +	mv	s7, zero
> +	mv	s8, zero
> +	mv	s9, zero
> +	mv	s10, zero
> +	mv	s11, zero
> +
> +	mv	t0, zero
> +	mv	t1, zero
> +	mv	t2, zero
> +	mv	t3, zero
> +	mv	t4, zero
> +	mv	t5, zero
> +	mv	t6, zero
> +	csrw	sepc, zero
> +	csrw	scause, zero
> +	csrw	sscratch, zero
> +
> +	jalr	zero, a2, 0
> +SYM_CODE_END(riscv_kexec_norelocate)
> +
> +.section ".rodata"
>  SYM_DATA(riscv_kexec_relocate_size,
>  	.long riscv_kexec_relocate_end - riscv_kexec_relocate)
>
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> index 88734a056..dfe6e9066 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -58,11 +58,6 @@ machine_kexec_prepare(struct kimage *image)
>
>  	kexec_image_info(image);
>
> -	if (image->type == KEXEC_TYPE_CRASH) {
> -		pr_warn("Loading a crash kernel is unsupported for now.\n");
> -		return -EINVAL;
> -	}
> -
>  	/* Find the Flattened Device Tree and save its physical address */
>  	for (i = 0; i < image->nr_segments; i++) {
>  		if (image->segment[i].memsz <= sizeof(fdt))
> @@ -84,12 +79,14 @@ machine_kexec_prepare(struct kimage *image)
>  	}
>
>  	/* Copy the assembler code for relocation to the control page */
> -	control_code_buffer = page_address(image->control_code_page);
> -	memcpy(control_code_buffer, riscv_kexec_relocate,
> -		riscv_kexec_relocate_size);
> +	if (image->type != KEXEC_TYPE_CRASH) {
> +		control_code_buffer = page_address(image->control_code_page);
> +		memcpy(control_code_buffer, riscv_kexec_relocate,
> +		       riscv_kexec_relocate_size);
>
> -	/* Mark the control page executable */
> -	set_memory_x((unsigned long) control_code_buffer, 1);
> +		/* Mark the control page executable */
> +		set_memory_x((unsigned long) control_code_buffer, 1);
> +	}
>
>  #ifdef CONFIG_SMP
>  	/*
> @@ -149,6 +146,9 @@ void machine_shutdown(void)
>  void
>  machine_crash_shutdown(struct pt_regs *regs)
>  {
> +	crash_save_cpu(regs, smp_processor_id());
> +	machine_shutdown();
> +	pr_info("Starting crashdump kernel...\n");
>  }
>
>  /**
> @@ -171,7 +171,12 @@ machine_kexec(struct kimage *image)
>  	unsigned long this_hart_id = raw_smp_processor_id();
>  	unsigned long fdt_addr = internal->fdt_addr;
>  	void *control_code_buffer = page_address(image->control_code_page);
> -	riscv_kexec_do_relocate do_relocate = control_code_buffer;
> +	riscv_kexec_method kexec_method = NULL;
> +
> +	if (image->type != KEXEC_TYPE_CRASH)
> +		kexec_method = control_code_buffer;
> +	else
> +		kexec_method = (riscv_kexec_method) &riscv_kexec_norelocate;
>
>  	pr_notice("Will call new kernel at %08lx from hart id %lx\n",
>  		  jump_addr, this_hart_id);
> @@ -182,7 +187,7 @@ machine_kexec(struct kimage *image)
>
>  	/* Jump to the relocation code */
>  	pr_notice("Bye...\n");
> -	do_relocate(first_ind_entry, jump_addr, fdt_addr,
> -		    this_hart_id, va_pa_offset);
> +	kexec_method(first_ind_entry, jump_addr, fdt_addr,
> +		     this_hart_id, va_pa_offset);
>  	unreachable();
>  }
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f04373be5..4dc940389 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -4,6 +4,8 @@
>   *  Chen Liqin <liqin.chen@sunplusct.com>
>   *  Lennox Wu <lennox.wu@sunplusct.com>
>   * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2020 FORTH-ICS/CARV
> + *  Nick Kossifidis <mick@ics.forth.gr>
>   */
>
>  #include <linux/init.h>
> @@ -17,6 +19,8 @@
>  #include <linux/sched/task.h>
>  #include <linux/swiotlb.h>
>  #include <linux/smp.h>
> +#include <linux/crash_dump.h>
> +#include <linux/initrd.h>
>
>  #include <asm/clint.h>
>  #include <asm/cpu_ops.h>
> @@ -49,6 +53,181 @@ atomic_t hart_lottery __section(.sdata);
>  unsigned long boot_cpu_hartid;
>  static DEFINE_PER_CPU(struct cpu, cpu_devices);
>
> +/*
> + * Place kernel memory regions on the resource tree so that
> + * kexec-tools can retrieve them from /proc/iomem. While there
> + * also add "System RAM" regions for compatibility with other
> + * archs, and the rest of the known regions for completeness.
> + */
> +static struct resource code_res = { .name = "Kernel code", };
> +static struct resource data_res = { .name = "Kernel data", };
> +static struct resource rodata_res = { .name = "Kernel rodata", };
> +static struct resource bss_res = { .name = "Kernel bss", };
> +
> +static int __init add_resource(struct resource *parent,
> +				struct resource *res)
> +{
> +	int ret = 0;
> +
> +	ret = insert_resource(parent, res);
> +	if (ret < 0) {
> +		pr_err("Failed to add a %s resource at %llx\n",
> +			res->name, res->start);
> +		return ret;
> +	}
> +
> +	return 1;
> +}
> +
> +static int __init add_kernel_resources(struct resource *res)
> +{
> +	int ret = 0;
> +
> +	/*
> +	 * The memory region of the kernel image is continuous and
> +	 * was reserved on setup_bootmem, find it here and register
> +	 * it as a resource, then register the various segments of
> +	 * the image as child nodes
> +	 */
> +	if (!(res->start <= code_res.start && res->end >= data_res.end))
> +		return 0;
> +
> +	res->name = "Kernel image";
> +	res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +
> +	/*
> +	 * We removed a part of this region on setup_bootmem so
> +	 * we need to expand the resource for the bss to fit in.
> +	 */
> +	res->end = bss_res.end;
> +
> +	ret = add_resource(&iomem_resource, res);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = add_resource(res, &code_res);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = add_resource(res, &rodata_res);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = add_resource(res, &data_res);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = add_resource(res, &bss_res);
> +
> +	return ret;
> +}
> +
> +#ifdef CONFIG_KEXEC_CORE
> +static int __init add_crashk_resource(struct resource *res)
> +{
> +	if (res->start <= crashk_res.start && res->end >= crashk_res.end)
> +		return add_resource(&iomem_resource, &crashk_res);
> +
> +	return 0;
> +}
> +#endif
> +
> +static void __init init_resources(void)
> +{
> +	struct memblock_region *region = NULL;
> +	struct resource *res = NULL;
> +	int ret = 0;
> +
> +	code_res.start = __pa_symbol(_text);
> +	code_res.end = __pa_symbol(_etext) - 1;
> +	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +
> +	rodata_res.start = __pa_symbol(__start_rodata);
> +	rodata_res.end = __pa_symbol(__end_rodata) - 1;
> +	rodata_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +
> +	data_res.start = __pa_symbol(_data);
> +	data_res.end = __pa_symbol(_edata) - 1;
> +	data_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +
> +	bss_res.start = __pa_symbol(__bss_start);
> +	bss_res.end = __pa_symbol(__bss_stop) - 1;
> +	bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +
> +	/*
> +	 * Start by adding the reserved regions, if they overlap
> +	 * with /memory regions, insert_resource later on will take
> +	 * care of it.
> +	 */
> +	for_each_memblock(reserved, region) {
> +		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
> +		if (!res)
> +			panic("%s: Failed to allocate %zu bytes\n", __func__,
> +			      sizeof(struct resource));
> +
> +		res->name = "Reserved";
> +		res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> +		res->start = __pfn_to_phys(memblock_region_reserved_base_pfn(region));
> +		res->end = __pfn_to_phys(memblock_region_reserved_end_pfn(region)) - 1;
> +
> +		ret = add_kernel_resources(res);
> +		if (ret < 0)
> +			goto error;
> +		else if (ret)
> +			continue;
> +
> +#ifdef CONFIG_KEXEC_CORE
> +		ret = add_crashk_resource(res);
> +		if (ret < 0)
> +			goto error;
> +		else if (ret)
> +			continue;
> +#endif
> +
> +		/*
> +		 * Ignore any other reserved regions within
> +		 * system memory.
> +		 */
> +		if (memblock_is_memory(res->start))
> +			continue;
> +
> +		ret = add_resource(&iomem_resource, res);
> +		if (ret < 0)
> +			goto error;
> +	}
> +
> +	/* Add /memory regions to the resource tree */
> +	for_each_memblock(memory, region) {
> +		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
> +		if (!res)
> +			panic("%s: Failed to allocate %zu bytes\n", __func__,
> +			      sizeof(struct resource));
> +
> +		if (unlikely(memblock_is_nomap(region))) {
> +			res->name = "Reserved";
> +			res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;

This differs from what I ended up with in that I don't have IORESOURCE_BUSY.  I
just copied this blindly from arm64 so I don't actually know what the
difference is.

> +		} else {
> +			res->name = "System RAM";
> +			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
> +		}
> +
> +		res->start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
> +		res->end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
> +
> +		ret = add_resource(&iomem_resource, res);
> +		if (ret < 0)
> +			goto error;
> +	}
> +
> +	return;
> +
> + error:
> +	memblock_free((phys_addr_t) res, sizeof(struct resource));
> +	/* Better an empty resource tree than an inconsistent one */
> +	release_child_resources(&iomem_resource);
> +}
> +
> +
>  void __init parse_dtb(void)
>  {
>  	if (early_init_dt_scan(dtb_early_va))
> @@ -74,6 +253,7 @@ void __init setup_arch(char **cmdline_p)
>
>  	setup_bootmem();
>  	paging_init();
> +	init_resources();
>  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
>  	unflatten_and_copy_device_tree();
>  #else
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index f4adb3684..e4ce3a2af 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -2,6 +2,8 @@
>  /*
>   * Copyright (C) 2012 Regents of the University of California
>   * Copyright (C) 2019 Western Digital Corporation or its affiliates.
> + * Copyright (C) 2020 FORTH-ICS/CARV
> + *  Nick Kossifidis <mick@ics.forth.gr>
>   */
>
>  #include <linux/init.h>
> @@ -13,6 +15,7 @@
>  #include <linux/of_fdt.h>
>  #include <linux/libfdt.h>
>  #include <linux/set_memory.h>
> +#include <linux/crash_dump.h>
>
>  #include <asm/fixmap.h>
>  #include <asm/tlbflush.h>
> @@ -517,6 +520,77 @@ void mark_rodata_ro(void)
>  }
>  #endif
>
> +#ifdef CONFIG_KEXEC_CORE
> +/*
> + * reserve_crashkernel() - reserves memory for crash kernel
> + *
> + * This function reserves memory area given in "crashkernel=" kernel command
> + * line parameter. The memory reserved is used by dump capture kernel when
> + * primary kernel is crashing.
> + */
> +static void __init reserve_crashkernel(void)
> +{
> +	unsigned long long crash_base = 0;
> +	unsigned long long crash_size = 0;
> +	unsigned long search_start = memblock_start_of_DRAM();
> +	unsigned long search_end = memblock_end_of_DRAM();
> +
> +	int ret = 0;
> +
> +	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
> +				&crash_size, &crash_base);
> +	if (ret || !crash_size)
> +		return;
> +
> +	crash_size = PAGE_ALIGN(crash_size);
> +
> +	if (crash_base == 0) {
> +		/*
> +		 * Current riscv boot protocol requires 2MB alignment for
> +		 * RV64 and 4MB alignment for RV32 (hugepage size)
> +		 */
> +		crash_base = memblock_find_in_range(search_start, search_end,
> +#ifdef CONFIG_64BIT
> +						    crash_size, SZ_2M);
> +#else
> +						    crash_size, SZ_4M);
> +#endif
> +		if (crash_base == 0) {
> +			pr_warn("crashkernel: couldn't allocate %lldKB\n",
> +				crash_size >> 10);
> +			return;
> +		}
> +	} else {
> +		/* User specifies base address explicitly. */
> +		if (!memblock_is_region_memory(crash_base, crash_size)) {
> +			pr_warn("crashkernel: requested region is not memory\n");
> +			return;
> +		}
> +
> +		if (memblock_is_region_reserved(crash_base, crash_size)) {
> +			pr_warn("crashkernel: requested region is reserved\n");
> +			return;
> +		}
> +
> +#ifdef CONFIG_64BIT
> +		if (!IS_ALIGNED(crash_base, SZ_2M)) {
> +#else
> +		if (!IS_ALIGNED(crash_base, SZ_4M)) {
> +#endif
> +			pr_warn("crashkernel: requested region is misaligned\n");
> +			return;
> +		}
> +	}
> +	memblock_reserve(crash_base, crash_size);
> +
> +	pr_info("crashkernel: reserved 0x%016llx - 0x%016llx (%lld MB)\n",
> +		crash_base, crash_base + crash_size, crash_size >> 20);
> +
> +	crashk_res.start = crash_base;
> +	crashk_res.end = crash_base + crash_size - 1;
> +}
> +#endif
> +
>  void __init paging_init(void)
>  {
>  	setup_vm_final();
> @@ -524,6 +598,9 @@ void __init paging_init(void)
>  	sparse_init();
>  	setup_zero_page();
>  	zone_sizes_init();
> +#ifdef CONFIG_KEXEC_CORE
> +	reserve_crashkernel();
> +#endif
>  }
>
>  #ifdef CONFIG_SPARSEMEM_VMEMMAP

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

If you split out init_resource() then I can take it before the rest of the
kexec stuff.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
