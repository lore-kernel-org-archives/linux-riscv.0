Return-Path: <SRS0=q1JI=AW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F548C433E3
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 03:59:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 133B42075F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 03:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0d6ZTp6b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="weCyGat+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 133B42075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Vfuof1DSO+80LJLT9LTYGlh4ZWubSuItv/mrQjeKNaE=; b=0d6ZTp6bGGWdMkbkFVD5HTxl3
	GkeTFfEtIQEfU4xwkVGTil0yAe4HpQcxNisNX6nOlY0WdFg63e0GNSE0JKZb7GBjJW3ehIeI2OY/a
	q6lOVaUcmBbD2v7SxLqAIJ3MQa7CbkPLDqkQLXa1N7SuOp8bWO7E6ApRGjea1N6vXEwCBrySfNX9h
	XAA6G39DMTHcKKdRkrzfbJpXDT3AG5Or+Ilhub/IdJ9sATJOZV+DAE+Q5kAVYpmY/i04+QGq4JdzD
	2RcYFgC4utqoCbRSfBqK6Wcga/chX9etCJwTvlVT5l4uGec1B7gXl2GVyPfwEBB2yU8GW8b+P7EKj
	L0FbAixKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju6fa-0001Uh-W9; Sat, 11 Jul 2020 03:59:23 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju6fW-0001Ss-UI
 for linux-riscv@lists.infradead.org; Sat, 11 Jul 2020 03:59:20 +0000
Received: by mail-pg1-x543.google.com with SMTP id d4so3395749pgk.4
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2020 20:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=eGtm9D7fwWnnGLbLxhImnKmV55qkX2+NFOuhGTMsmww=;
 b=weCyGat+t4yBm0EcaycPmijf3QTFBPAE3iwPRIQ5Ia0Ly2dnI+k47CERar4Ic4G4iM
 /APyoy1KpvxJqOfRB8uAtkTZyTEFy5CiOI3aZyvLkgqPY/q9MrVYWQvU+DLLn9E/oqZ0
 AsNwquCIeEVKoxcp4ulc3VyToCLZlQ3Ppbl25S9ckJDGMe79Iu9YHfq7n4Fe3NAdiAku
 82zxCSQB265pCd4xVlIqDaTpyh1HwSS2JalJcyBtkc+N8wQnkeRxi/hkajy0kh/M3nSc
 kBridR/cX5Y4AEE4q6BfbqRP11tTFmfi+FXyTGs5nMdHeXqy9ZIHRSqmcQ2hBkDmB+NR
 wOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=eGtm9D7fwWnnGLbLxhImnKmV55qkX2+NFOuhGTMsmww=;
 b=StR6JP0ocxrz84UPUCusDtNKbdgnHv6UDZyb3Fk6w4/VOwm7qUUgSaKSqjmHSMSt86
 gh383AupX45U14R9Nxg9uNdUqgbjUHim/v9PGYoF+fYCP/DWAEvvvSAij0b5pj/Qy61y
 Tnyhf0a4D8rm779wVXtaM+t/tAc0Nu2QE2OZUhENpH8sDbbOp1lT/Hs9s7or+N1bYGpA
 SyKoM1icSqMY5T2lLOa20DjUSCuwlR9xFsJlZeZpbw5cHP/p9iuO5DHddqDyldeuiJUK
 itcNKSwoslTJB2jikVWaD/BW6FR9si+lYTZM+Qr13HHqjqXJTnYYA8dCVFr477zqEUmW
 sUXQ==
X-Gm-Message-State: AOAM533X9zXP4R+uzS83SsOUHPWDswRcn/QmYqgZ4MjpIpT+E0BA7fYL
 W6IiOiwMSnciIbN02JH8U046MX/vJiI=
X-Google-Smtp-Source: ABdhPJwFWj6w+5BU145jFF1C5jreaZOUjcHTgyod+qg3h8znjSo1BQvcu/2goBx6nVjTEv/YxOd4wA==
X-Received: by 2002:a63:fc59:: with SMTP id r25mr37565227pgk.336.1594439955417; 
 Fri, 10 Jul 2020 20:59:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m3sm8597586pfk.171.2020.07.10.20.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 20:59:14 -0700 (PDT)
Date: Fri, 10 Jul 2020 20:59:14 -0700 (PDT)
X-Google-Original-Date: Fri, 10 Jul 2020 17:40:52 PDT (-0700)
Subject: Re: [PATCH v2 1/3] RISC-V: Add kexec support
In-Reply-To: <20200623150512.896499-2-mick@ics.forth.gr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-9fabdb7a-f138-456f-bf2e-ef1ac05c5a73@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_235919_101444_3B5A51D7 
X-CRM114-Status: GOOD (  48.74  )
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

On Tue, 23 Jun 2020 08:05:10 PDT (-0700), mick@ics.forth.gr wrote:
> This patch adds support for kexec on RISC-V. On SMP systems it depends
> on HOTPLUG_CPU in order to be able to bring up all harts after kexec.
> It also needs a recent OpenSBI version that supports the HSM extension.
> I tested it on riscv64 QEMU on both an smp and a non-smp system.
>
> The older version of this patch can be found at:
> https://patchwork.kernel.org/patch/11508671/
>
> v4:
>  * No functional changes, just re-based
>
> v3:
>  * Use the new smp_shutdown_nonboot_cpus() call.
>  * Move riscv_kexec_relocate to .rodata
>
> v2:
>  * Pass needed parameters as arguments to riscv_kexec_relocate
>    instead of using global variables.
>  * Use kimage_arch to hold the fdt address of the included fdt.
>  * Use SYM_* macros on kexec_relocate.S.
>  * Compatibility with STRICT_KERNEL_RWX.
>  * Compatibility with HOTPLUG_CPU for SMP
>  * Small cleanups
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> Tested-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  arch/riscv/Kconfig                 |  14 +++
>  arch/riscv/include/asm/kexec.h     |  47 ++++++++
>  arch/riscv/kernel/Makefile         |   1 +
>  arch/riscv/kernel/kexec_relocate.S | 158 ++++++++++++++++++++++++
>  arch/riscv/kernel/machine_kexec.c  | 188 +++++++++++++++++++++++++++++
>  include/uapi/linux/kexec.h         |   1 +
>  6 files changed, 409 insertions(+)
>  create mode 100644 arch/riscv/include/asm/kexec.h
>  create mode 100644 arch/riscv/kernel/kexec_relocate.S
>  create mode 100644 arch/riscv/kernel/machine_kexec.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 128192e14..e7dd2d1c5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -340,6 +340,20 @@ config RISCV_SBI_V01
>  	help
>  	  This config allows kernel to use SBI v0.1 APIs. This will be
>  	  deprecated in future once legacy M-mode software are no longer in use.
> +
> +config KEXEC
> +	bool "Kexec system call"
> +	select KEXEC_CORE
> +	select HOTPLUG_CPU if SMP

This needs an S-mode dependency, as this definately won't run as-is in M mode.
While we might be fix up the CSRs pretty quickly, but as we don't really have
any standard-smelling M-mode platforms

> +	help
> +	  kexec is a system call that implements the ability to shutdown your
> +	  current kernel, and to start another kernel. It is like a reboot
> +	  but it is independent of the system firmware. And like a reboot
> +	  you can start any kernel with it, not just Linux.
> +
> +	  The name comes from the similarity to the exec system call.
> +
> +
>  endmenu
>
>  menu "Boot options"
> diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
> new file mode 100644
> index 000000000..efc69feb4
> --- /dev/null
> +++ b/arch/riscv/include/asm/kexec.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 FORTH-ICS/CARV
> + *  Nick Kossifidis <mick@ics.forth.gr>
> + */
> +
> +#ifndef _RISCV_KEXEC_H
> +#define _RISCV_KEXEC_H
> +
> +/* Maximum physical address we can use pages from */
> +#define KEXEC_SOURCE_MEMORY_LIMIT (-1UL)
> +
> +/* Maximum address we can reach in physical address mode */
> +#define KEXEC_DESTINATION_MEMORY_LIMIT (-1UL)
> +
> +/* Maximum address we can use for the control code buffer */
> +#define KEXEC_CONTROL_MEMORY_LIMIT (-1UL)
> +
> +/* Reserve a page for the control code buffer */
> +#define KEXEC_CONTROL_PAGE_SIZE 4096
> +
> +#define KEXEC_ARCH KEXEC_ARCH_RISCV
> +
> +static inline void
> +crash_setup_regs(struct pt_regs *newregs,
> +		 struct pt_regs *oldregs)
> +{
> +	/* Dummy implementation for now */
> +}
> +
> +
> +#define ARCH_HAS_KIMAGE_ARCH

checkpatch complains about this, but everyone else does it this way so I'm
going to take it for now and fix it up later.

> +
> +struct kimage_arch {
> +	unsigned long fdt_addr;
> +};
> +
> +const extern unsigned char riscv_kexec_relocate[];
> +const extern unsigned int riscv_kexec_relocate_size;
> +
> +typedef void (*riscv_kexec_do_relocate)(unsigned long first_ind_entry,
> +					unsigned long jump_addr,
> +					unsigned long fdt_addr,
> +					unsigned long hartid,
> +					unsigned long va_pa_off);
> +
> +#endif
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index b355cf485..63fc530a4 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -52,5 +52,6 @@ obj-$(CONFIG_SMP) += cpu_ops_sbi.o
>  endif
>  obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
>  obj-$(CONFIG_KGDB)		+= kgdb.o
> +obj-${CONFIG_KEXEC}		+= kexec_relocate.o machine_kexec.o
>
>  clean:
> diff --git a/arch/riscv/kernel/kexec_relocate.S b/arch/riscv/kernel/kexec_relocate.S
> new file mode 100644
> index 000000000..cd17d585f
> --- /dev/null
> +++ b/arch/riscv/kernel/kexec_relocate.S
> @@ -0,0 +1,158 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 FORTH-ICS/CARV
> + *  Nick Kossifidis <mick@ics.forth.gr>
> + */
> +
> +#include <asm/asm.h>	/* For RISCV_* and REG_* macros */
> +#include <asm/page.h>	/* For PAGE_SHIFT */
> +#include <linux/linkage.h> /* For SYM_* macros */
> +
> +.section ".rodata"
> +SYM_CODE_START(riscv_kexec_relocate)
> +
> +	/*
> +	 * s0: Pointer to the current entry
> +	 * s1: (const) Phys address to jump to after relocation
> +	 * s2: (const) Phys address of the FDT image
> +	 * s3: (const) The hartid of the current hart
> +	 * s4: Pointer to the destination address for the relocation
> +	 * s5: (const) Number of words per page
> +	 * s6: (const) 1, used for subtraction
> +	 * s7: (const) va_pa_offset, used when switching MMU off
> +	 * s8: (const) Physical address of the main loop
> +	 * s9: (debug) indirection page counter
> +	 * s10: (debug) entry counter
> +	 * s11: (debug) copied words counter
> +	 */
> +	mv	s0, a0
> +	mv	s1, a1
> +	mv	s2, a2
> +	mv	s3, a3
> +	mv	s4, zero
> +	li	s5, ((1 << PAGE_SHIFT) / RISCV_SZPTR)
> +	li	s6, 1
> +	mv	s7, a4
> +	mv	s8, zero
> +	mv	s9, zero
> +	mv	s10, zero
> +	mv	s11, zero
> +
> +	/* Disable / cleanup interrupts */
> +	csrw	sie, zero
> +	csrw	sip, zero
> +
> +	/*
> +	 * When we switch SATP.MODE to "Bare" we'll only
> +	 * play with physical addresses. However the first time
> +	 * we try to jump somewhere, the offset on the jump
> +	 * will be relative to pc which will still be on VA. To
> +	 * deal with this we set stvec to the physical address at
> +	 * the start of the loop below so that we jump there in
> +	 * any case.
> +	 */
> +	la	s8, 1f
> +	sub	s8, s8, s7
> +	csrw	stvec, s8

stvec needs to be aligned.

> +
> +	/* Process entries in a loop */
> +1:
> +	addi	s10, s10, 1
> +	REG_L	t0, 0(s0)		/* t0 = *image->entry */
> +	addi	s0, s0, RISCV_SZPTR	/* image->entry++ */
> +
> +	/* IND_DESTINATION entry ? -> save destination address */
> +	andi	t1, t0, 0x1
> +	beqz	t1, 2f
> +	andi	s4, t0, ~0x1
> +	j	1b
> +
> +2:
> +	/* IND_INDIRECTION entry ? -> update next entry ptr (PA) */
> +	andi	t1, t0, 0x2
> +	beqz	t1, 2f
> +	andi	s0, t0, ~0x2
> +	addi	s9, s9, 1
> +	csrw	sptbr, zero

If I understand correctly (it's ambiguous in the ISA right now), we don't need
a fence here.  I've opened https://github.com/riscv/riscv-isa-manual/issues/538
for clarification.

> +	jalr	zero, s8, 0
> +
> +2:
> +	/* IND_DONE entry ? -> jump to done label */
> +	andi	t1, t0, 0x4
> +	beqz	t1, 2f
> +	j	4f
> +
> +2:
> +	/*
> +	 * IND_SOURCE entry ? -> copy page word by word to the
> +	 * destination address we got from IND_DESTINATION
> +	 */
> +	andi	t1, t0, 0x8
> +	beqz	t1, 1b		/* Unknown entry type, ignore it */
> +	andi	t0, t0, ~0x8
> +	mv	t3, s5		/* i = num words per page */
> +3:	/* copy loop */
> +	REG_L	t1, (t0)	/* t1 = *src_ptr */
> +	REG_S	t1, (s4)	/* *dst_ptr = *src_ptr */
> +	addi	t0, t0, RISCV_SZPTR /* stc_ptr++ */
> +	addi	s4, s4, RISCV_SZPTR /* dst_ptr++ */
> +	sub	t3, t3, s6	/* i-- */
> +	addi	s11, s11, 1	/* c++ */
> +	beqz	t3, 1b		/* copy done ? */
> +	j	3b
> +
> +4:
> +	/* Wait for the relocation to be visible by other harts */
> +	fence	w,w

That's not how fences work.  A "fence w,w" just ensures that prior writes are
visible before subsequent writes.  Usually that would be some sort of control
write being ordered after the data writes, which on the other harts would be
paired with a "fence r,r" to make sure the control read is seen before any
other reads.  I don't see that, though.

I think the right answer here is to ignore ordering here, as we're operating in
a single processor mode, and instead push the fences into the CPU hotplug up
codepath.  We have to handle that anyway, so we might as well just do it once.

> +	/* Pass the arguments to the next kernel  / Cleanup*/
> +	mv	a0, s3
> +	mv	a1, s2
> +	mv	a2, s1
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
> +	/*
> +	 * Make sure the relocated code is visible
> +	 * and jump to the new kernel
> +	 */
> +	fence.i
> +
> +	jalr	zero, a2, 0
> +
> +SYM_CODE_END(riscv_kexec_relocate)
> +riscv_kexec_relocate_end:
> +
> +	.section ".rodata"
> +SYM_DATA(riscv_kexec_relocate_size,
> +	.long riscv_kexec_relocate_end - riscv_kexec_relocate)
> +
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> new file mode 100644
> index 000000000..88734a056
> --- /dev/null
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 FORTH-ICS/CARV
> + *  Nick Kossifidis <mick@ics.forth.gr>
> + */
> +
> +#include <linux/kexec.h>
> +#include <asm/kexec.h>		/* For riscv_kexec_* symbol defines */
> +#include <linux/smp.h>		/* For smp_send_stop () */
> +#include <asm/cacheflush.h>	/* For local_flush_icache_all() */
> +#include <asm/barrier.h>	/* For smp_wmb() */
> +#include <asm/page.h>		/* For PAGE_MASK */
> +#include <linux/libfdt.h>	/* For fdt_check_header() */
> +#include <asm/set_memory.h>	/* For set_memory_x() */
> +#include <linux/compiler.h>	/* For unreachable() */
> +#include <linux/cpu.h>		/* For cpu_down() */
> +
> +/**
> + * kexec_image_info - Print received image details
> + */
> +static void
> +kexec_image_info(const struct kimage *image)
> +{
> +	unsigned long i;
> +
> +	pr_debug("Kexec image info:\n");
> +	pr_debug("\ttype:        %d\n", image->type);
> +	pr_debug("\tstart:       %lx\n", image->start);
> +	pr_debug("\thead:        %lx\n", image->head);
> +	pr_debug("\tnr_segments: %lu\n", image->nr_segments);
> +
> +	for (i = 0; i < image->nr_segments; i++) {
> +		pr_debug("\t    segment[%lu]: %016lx - %016lx", i,
> +			image->segment[i].mem,
> +			image->segment[i].mem + image->segment[i].memsz);
> +		pr_debug("\t\t0x%lx bytes, %lu pages\n",
> +			(unsigned long) image->segment[i].memsz,
> +			(unsigned long) image->segment[i].memsz /  PAGE_SIZE);
> +	}
> +}
> +
> +/**
> + * machine_kexec_prepare - Initialize kexec
> + *
> + * This function is called from do_kexec_load, when the user has
> + * provided us with an image to be loaded. Its goal is to validate
> + * the image and prepare the control code buffer as needed.
> + * Note that kimage_alloc_init has already been called and the
> + * control buffer has already been allocated.
> + */
> +int
> +machine_kexec_prepare(struct kimage *image)
> +{
> +	struct kimage_arch *internal = &image->arch;
> +	struct fdt_header fdt = {0};
> +	void *control_code_buffer = NULL;
> +	int i = 0;
> +
> +	kexec_image_info(image);
> +
> +	if (image->type == KEXEC_TYPE_CRASH) {
> +		pr_warn("Loading a crash kernel is unsupported for now.\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Find the Flattened Device Tree and save its physical address */
> +	for (i = 0; i < image->nr_segments; i++) {
> +		if (image->segment[i].memsz <= sizeof(fdt))
> +			continue;
> +
> +		if (copy_from_user(&fdt, image->segment[i].buf, sizeof(fdt)))
> +			continue;
> +
> +		if (fdt_check_header(&fdt))
> +			continue;
> +
> +		internal->fdt_addr = (unsigned long) image->segment[i].mem;
> +		break;
> +	}
> +
> +	if (!internal->fdt_addr) {
> +		pr_err("Device tree not included in the provided image\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Copy the assembler code for relocation to the control page */
> +	control_code_buffer = page_address(image->control_code_page);
> +	memcpy(control_code_buffer, riscv_kexec_relocate,
> +		riscv_kexec_relocate_size);

The toolchain doesn't make any guarantees that you can move code around without
-fPIC, but we're already taking advantage of the fact that simply medany code
can be moved around so this should be OK.  This is all assembly and it looks
fine, but since it's placed in the rodata segment there's at least a
reasonably possibility that GP could end up close enough that things get
relaxed.  We'd be safer adding .norelax to that assembly file, as there's
nothing in there that's performance critical.

Also, as far as I can tell nothing is checking that riscv_kexec_relocate_size
is smaller than a page.  That could cause overflows in this memcpy, but a
static check should be sufficient.

> +
> +	/* Mark the control page executable */
> +	set_memory_x((unsigned long) control_code_buffer, 1);
> +
> +#ifdef CONFIG_SMP
> +	/*
> +	 * Make sure other harts see the copied data
> +	 * if they try to read the control buffer
> +	 */
> +	smp_wmb();
> +#endif

This appears to have similar issues as the fence.

Also, smp_wmb() already has the relevant CONFIG_SMP checks.

> +
> +	return 0;
> +}
> +
> +
> +/**
> + * machine_kexec_cleanup - Cleanup any leftovers from
> + *			   machine_kexec_prepare
> + *
> + * This function is called by kimage_free to handle any arch-specific
> + * allocations done on machine_kexec_prepare. Since we didn't do any
> + * allocations there, this is just an empty function. Note that the
> + * control buffer is freed by kimage_free.
> + */
> +void
> +machine_kexec_cleanup(struct kimage *image)
> +{
> +}
> +
> +
> +/*
> + * machine_shutdown - Prepare for a kexec reboot
> + *
> + * This function is called by kernel_kexec just before machine_kexec
> + * below. Its goal is to prepare the rest of the system (the other
> + * harts and possibly devices etc) for a kexec reboot.
> + */
> +void machine_shutdown(void)
> +{
> +	/*
> +	 * No more interrupts on this hart
> +	 * until we are back up.
> +	 */
> +	local_irq_disable();
> +
> +#if defined(CONFIG_HOTPLUG_CPU) && (CONFIG_SMP)
> +	smp_shutdown_nonboot_cpus(smp_processor_id());
> +#endif
> +}
> +
> +/**
> + * machine_crash_shutdown - Prepare to kexec after a kernel crash
> + *
> + * This function is called by crash_kexec just before machine_kexec
> + * below and its goal is similar to machine_shutdown, but in case of
> + * a kernel crash. Since we don't handle such cases yet, this function
> + * is empty.
> + */
> +void
> +machine_crash_shutdown(struct pt_regs *regs)
> +{
> +}
> +
> +/**
> + * machine_kexec - Jump to the loaded kimage
> + *
> + * This function is called by kernel_kexec which is called by the
> + * reboot system call when the reboot cmd is LINUX_REBOOT_CMD_KEXEC,
> + * or by crash_kernel which is called by the kernel's arch-specific
> + * trap handler in case of a kernel panic. It's the final stage of
> + * the kexec process where the pre-loaded kimage is ready to be
> + * executed. We assume at this point that all other harts are
> + * suspended and this hart will be the new boot hart.
> + */
> +void __noreturn
> +machine_kexec(struct kimage *image)
> +{
> +	struct kimage_arch *internal = &image->arch;
> +	unsigned long jump_addr = (unsigned long) image->start;
> +	unsigned long first_ind_entry = (unsigned long) &image->head;
> +	unsigned long this_hart_id = raw_smp_processor_id();
> +	unsigned long fdt_addr = internal->fdt_addr;
> +	void *control_code_buffer = page_address(image->control_code_page);
> +	riscv_kexec_do_relocate do_relocate = control_code_buffer;
> +
> +	pr_notice("Will call new kernel at %08lx from hart id %lx\n",
> +		  jump_addr, this_hart_id);
> +	pr_notice("FDT image at %08lx\n", fdt_addr);
> +
> +	/* Make sure the relocation code is visible to the hart */
> +	local_flush_icache_all();
> +
> +	/* Jump to the relocation code */
> +	pr_notice("Bye...\n");
> +	do_relocate(first_ind_entry, jump_addr, fdt_addr,
> +		    this_hart_id, va_pa_offset);
> +	unreachable();
> +}
> diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
> index 05669c87a..778dc191c 100644
> --- a/include/uapi/linux/kexec.h
> +++ b/include/uapi/linux/kexec.h
> @@ -42,6 +42,7 @@
>  #define KEXEC_ARCH_MIPS_LE (10 << 16)
>  #define KEXEC_ARCH_MIPS    ( 8 << 16)
>  #define KEXEC_ARCH_AARCH64 (183 << 16)
> +#define KEXEC_ARCH_RISCV   (243 << 16)

I usually split the UAPI changes out as their own patch.  This one is pretty
trivial, but it's always nice to make sure everyone knows we're making a UAPI
change just to be on the safe side.

>
>  /* The artificial cap on the number of segments passed to kexec_load. */
>  #define KEXEC_SEGMENT_MAX 16

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
