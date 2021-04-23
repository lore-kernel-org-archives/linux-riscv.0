Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503A5C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:31:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FE906137D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FE906137D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=rPTwfwL2b4njXo+IPF0Sd8o+RGlHld+if/U7CEXhJi4=; b=GemTSMh+oZcH98tUTMXbxNfZ0
	uRHwVz/elklsuno1lNuKM8kbfvsCD1/332wjxxiY9RL52hxvv+L4vFaUcK/RE2xm499UN45/Otp5o
	QxYtrrBALdp/54R+EBqep/qWE6R9mjfGsr/DieIO9R7RvsPBIP7exmEhfyQaKj76Cu4WxtOTcKNum
	e3BV6XPYiN2nFc/0ogvciCYhYLyRhb5BsQspfmXyGcfsiEg0OMgDsaRqzG1Y0/m9bn41bgDLdT0Rx
	bkd3ifJzkF09ymNNQA+Ua7xURcZJp5Q+fV0GUEkA85NGbvF6pvVqtGrwZa38IYHAGjiUYjSKcws1s
	fMHWMMJjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmXO-000TQ5-Vi; Fri, 23 Apr 2021 03:31:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmWs-000TKK-Ih
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 03:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=oVxmQOG2AH+g6roo4eThSSUUsNu1Y25X9E2ayaDSGQk=; b=XbkQubW8zDEskMYJLZ8twzn9/n
 EvnyDYXEVZv8TBlIpU5apF0JihNw9XbShNiiZFC732RfBKkOyrCg8RviZOAnit/ywWgw/7JeeGHYd
 OdZFu33KDLj3xLhIZgTKOiAjgDwj+hqtoBmCgSVcpCASHV8wJvTrmckMtnc2V633bkx1t0aJ5DiHR
 OfdaWyz9cxlGYM0HskV6xfy6yTibMeveTzwIqA+ufdur4VDu/grRFgERhDlNIV9giRq3FP9XnamzF
 04bEWSaYHBX1u3TVctm3HIJKI1xdNIfOZrIH14kStI82qlQaZNUwttuA0GTlkcn9z1ngpH2ruTb/j
 YFTJPLBA==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmWp-00E7Go-38
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 03:30:53 +0000
Received: by mail-pf1-x42b.google.com with SMTP id m11so33189168pfc.11
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 20:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=oVxmQOG2AH+g6roo4eThSSUUsNu1Y25X9E2ayaDSGQk=;
 b=upsu3Zy3S6DuYifPhcDDGIbnjXuqj+EhWJkwEvCWRUnetAsqT9j5weKzJE+xgjvon+
 0EQ+zIPSbJhZ0g3VBkkofCQ+e8m+y1zZthq473zisHbFLaIVMvfuyDimYvzKhhrFipMR
 EcWWSccnk9kPu6enZXE1tFXCqHw2/QZWV8/USJtKoHONFwkVcFMnImfrqrilTaOQ1x0a
 qgxr2AVwYJ9jnpehOe2NF3mxwNfJpynjUdNmoTVCAUDfDU5c4rwcZHJ0fymhkZsKR2Mv
 XBXvXLH32obhlS0cNARNc3ZbJ/3JDwRbR6Vilj73P0FlkirWl9rqPm4rToc3WceSjT3o
 FEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=oVxmQOG2AH+g6roo4eThSSUUsNu1Y25X9E2ayaDSGQk=;
 b=gnFg1LqGPAeZZPhtlQLKIeGb05mAviFFkC9btVfvBJorGj43LGc2vJcNbJiZ8Md7wi
 3JgjSROdiKwyGrwaQpOALUQyErcYnlxYSuEatG/ZV9jY9lgP/5dr2VKZvzYYLip5ZUmG
 v74R9YtNZXjA0CoLWxFxbwUOI0L+bA8VZI7geItB76eJy8MPO0Q2p0wupanGZwVo2jWX
 ZJtpiDX1SKYhRBSpQHiEA5XOZvDivwmsyzVZtxAzYrZcodgdsj9Q/Jsq3oQOJsjRZRQX
 4rc6OjXhM5Qm/lzZXUpK8NzHzJLj2DVM5M9UgeAjOrDJ2RbMIc4VZDuFubb1oNnmOpsN
 AHrQ==
X-Gm-Message-State: AOAM532Jtu++Tsl69EZ0CagkAt/dmXDfp1bo9y7xjeqAlFA5XOwNX4yH
 MtEe3EyfNp8X3gic2CXtL02naX6lkw8kEw==
X-Google-Smtp-Source: ABdhPJydMDMLUv5vLvnGKTQ3PACAM5w6zcmt0t8QpOkv4HrRlLeSvVFwV2dXwO+chfG3atUv4rDn/w==
X-Received: by 2002:aa7:9af7:0:b029:264:b19e:ac9c with SMTP id
 y23-20020aa79af70000b0290264b19eac9cmr1779980pfp.59.1619148648635; 
 Thu, 22 Apr 2021 20:30:48 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z62sm3131617pfb.110.2021.04.22.20.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:30:48 -0700 (PDT)
Date: Thu, 22 Apr 2021 20:30:48 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 20:29:37 PDT (-0700)
Subject: Re: [PATCH v3 4/5] RISC-V: Add kdump support
In-Reply-To: <20210405085712.1953848-5-mick@ics.forth.gr>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-kernel@vger.kernel.org, mick@ics.forth.gr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-f4de30b4-8e2d-4b4a-a570-f168ec8f0ec9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_203051_168710_798DF9BF 
X-CRM114-Status: GOOD (  46.37  )
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

On Mon, 05 Apr 2021 01:57:11 PDT (-0700), mick@ics.forth.gr wrote:
> This patch adds support for kdump, the kernel will reserve a
> region for the crash kernel and jump there on panic. In order
> for userspace tools (kexec-tools) to prepare the crash kernel
> kexec image, we also need to expose some information on
> /proc/iomem for the memory regions used by the kernel and for
> the region reserved for crash kernel. Note that on userspace
> the device tree is used to determine the system's memory
> layout so the "System RAM" on /proc/iomem is ignored.
>
> I tested this on riscv64 qemu and works as expected, you may
> test it by triggering a crash through /proc/sysrq_trigger:
>
> echo c > /proc/sysrq_trigger
>
> v3:
>  * Move ELF_CORE_COPY_REGS to asm/elf.h instead of uapi/asm/elf.h
>  * Set stvec when disabling MMU
>  * Minor cleanups and re-base
>
> v2:
>  * Properly populate the ioresources tree, so that it can be
>    used later on for implementing strict /dev/mem.
>  * Minor cleanups and re-base
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  arch/riscv/include/asm/elf.h        |  6 +++
>  arch/riscv/include/asm/kexec.h      | 19 ++++---
>  arch/riscv/kernel/Makefile          |  2 +-
>  arch/riscv/kernel/crash_save_regs.S | 56 +++++++++++++++++++++
>  arch/riscv/kernel/kexec_relocate.S  | 68 ++++++++++++++++++++++++-
>  arch/riscv/kernel/machine_kexec.c   | 43 +++++++++-------
>  arch/riscv/kernel/setup.c           | 11 ++++-
>  arch/riscv/mm/init.c                | 77 +++++++++++++++++++++++++++++
>  8 files changed, 255 insertions(+), 27 deletions(-)
>  create mode 100644 arch/riscv/kernel/crash_save_regs.S
>
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index 5c725e1df..f4b490cd0 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -81,4 +81,10 @@ extern int arch_setup_additional_pages(struct linux_binprm *bprm,
>  	int uses_interp);
>  #endif /* CONFIG_MMU */
>
> +#define ELF_CORE_COPY_REGS(dest, regs)			\
> +do {							\
> +	*(struct user_regs_struct *)&(dest) =		\
> +		*(struct user_regs_struct *)regs;	\
> +} while (0);
> +
>  #endif /* _ASM_RISCV_ELF_H */
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
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index c2594018c..07f676ad3 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -58,7 +58,7 @@ obj-$(CONFIG_SMP) += cpu_ops_sbi.o
>  endif
>  obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
>  obj-$(CONFIG_KGDB)		+= kgdb.o
> -obj-${CONFIG_KEXEC}		+= kexec_relocate.o machine_kexec.o
> +obj-${CONFIG_KEXEC}		+= kexec_relocate.o crash_save_regs.o machine_kexec.o
>
>  obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>
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
> index 616c20771..14220f70f 100644
> --- a/arch/riscv/kernel/kexec_relocate.S
> +++ b/arch/riscv/kernel/kexec_relocate.S
> @@ -150,7 +150,73 @@ SYM_CODE_START(riscv_kexec_relocate)
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
> +	 * s3: (const) va_pa_offset, used when switching MMU off
> +	 */
> +	mv	s0, a1
> +	mv	s1, a2
> +	mv	s2, a3
> +	mv	s3, a4
> +
> +	/* Disable / cleanup interrupts */
> +	csrw	sie, zero
> +	csrw	sip, zero
> +
> +	/* Switch to physical addressing */
> +	la	s4, 1f
> +	sub	s4, s4, s3
> +	csrw	stvec, s4
> +	csrw	sptbr, zero
> +
> +.align 2
> +1:
> +	/* Pass the arguments to the next kernel  / Cleanup*/
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
> index 2ce6c3daf..e0596c0ac 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -59,11 +59,6 @@ machine_kexec_prepare(struct kimage *image)
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
> @@ -85,17 +80,21 @@ machine_kexec_prepare(struct kimage *image)
>  	}
>
>  	/* Copy the assembler code for relocation to the control page */
> -	control_code_buffer = page_address(image->control_code_page);
> -	control_code_buffer_sz = page_size(image->control_code_page);
> -	if (unlikely(riscv_kexec_relocate_size > control_code_buffer_sz)) {
> -		pr_err("Relocation code doesn't fit within a control page\n");
> -		return -EINVAL;
> -	}
> -	memcpy(control_code_buffer, riscv_kexec_relocate,
> -		riscv_kexec_relocate_size);
> +	if (image->type != KEXEC_TYPE_CRASH) {
> +		control_code_buffer = page_address(image->control_code_page);
> +		control_code_buffer_sz = page_size(image->control_code_page);
>
> -	/* Mark the control page executable */
> -	set_memory_x((unsigned long) control_code_buffer, 1);
> +		if (unlikely(riscv_kexec_relocate_size > control_code_buffer_sz)) {
> +			pr_err("Relocation code doesn't fit within a control page\n");
> +			return -EINVAL;
> +		}
> +
> +		memcpy(control_code_buffer, riscv_kexec_relocate,
> +			riscv_kexec_relocate_size);
> +
> +		/* Mark the control page executable */
> +		set_memory_x((unsigned long) control_code_buffer, 1);
> +	}
>
>  	return 0;
>  }
> @@ -147,6 +146,9 @@ void machine_shutdown(void)
>  void
>  machine_crash_shutdown(struct pt_regs *regs)
>  {
> +	crash_save_cpu(regs, smp_processor_id());
> +	machine_shutdown();
> +	pr_info("Starting crashdump kernel...\n");
>  }
>
>  /**
> @@ -169,7 +171,12 @@ machine_kexec(struct kimage *image)
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
> @@ -180,7 +187,7 @@ machine_kexec(struct kimage *image)
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
> index 030554bab..31866dce9 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -20,6 +20,7 @@
>  #include <linux/swiotlb.h>
>  #include <linux/smp.h>
>  #include <linux/efi.h>
> +#include <linux/crash_dump.h>
>
>  #include <asm/cpu_ops.h>
>  #include <asm/early_ioremap.h>
> @@ -160,6 +161,14 @@ static void __init init_resources(void)
>  	if (ret < 0)
>  		goto error;
>
> +#ifdef CONFIG_KEXEC_CORE
> +	if (crashk_res.start != crashk_res.end) {
> +		ret = add_resource(&iomem_resource, &crashk_res);
> +		if (ret < 0)
> +			goto error;
> +	}
> +#endif
> +
>  	for_each_reserved_mem_region(region) {
>  		res = &mem_res[res_idx--];
>
> @@ -252,7 +261,6 @@ void __init setup_arch(char **cmdline_p)
>  	efi_init();
>  	setup_bootmem();
>  	paging_init();
> -	init_resources();
>  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
>  	unflatten_and_copy_device_tree();
>  #else
> @@ -263,6 +271,7 @@ void __init setup_arch(char **cmdline_p)
>  #endif
>  	misc_mem_init();
>
> +	init_resources();
>  	sbi_init();

This one also caused a merge conflict.

>
>  	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 7f5036fbe..e71b35cec 100644
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
> @@ -14,6 +16,7 @@
>  #include <linux/libfdt.h>
>  #include <linux/set_memory.h>
>  #include <linux/dma-map-ops.h>
> +#include <linux/crash_dump.h>
>
>  #include <asm/fixmap.h>
>  #include <asm/tlbflush.h>
> @@ -586,6 +589,77 @@ void mark_rodata_ro(void)
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
> +#endif /* CONFIG_KEXEC_CORE */
> +
>  void __init paging_init(void)
>  {
>  	setup_vm_final();
> @@ -598,6 +672,9 @@ void __init misc_mem_init(void)
>  	arch_numa_init();
>  	sparse_init();
>  	zone_sizes_init();
> +#ifdef CONFIG_KEXEC_CORE
> +	reserve_crashkernel();
> +#endif
>  	memblock_dump_all();
>  }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
