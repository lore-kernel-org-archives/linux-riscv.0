Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA336C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 18:57:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FE562077C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 18:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OYHf7Y8U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="K5zvD3M3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FE562077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=rgQ4P8L272sTMbo9H69hh18b4Ewpus1tK2yj4EI0kBM=; b=OYHf7Y8UHkh2L5
	uzgd38cajiNSVfQNS6aMRHpz/IX60ZyrWKFjHMmxxJjZYoWrRPAMF9xmI/Gdzvgn5MHtq4VwKRb9a
	IHSRGJQ5H1BaiK/PpFff+rlMcG4xt7WN2Wf4tjsmiGq5dO7Ls5lleB/3wfXR/vgFfDtPJIrMARsai
	O0uUveakYSC+4MWDbufDHJRCMVXLNhQZf+zGdSg0k6uCqKozSYr1Txtu7VF5CWj2RIhyN2p5yycyA
	7byVuk0vLO3w3xIq3DelAFy+1llw21eXG/IAbrv1AaQBRlaQJXAcZU5YS3SVyyo+e0KVe9MMARuuK
	7UQIPKH8Hs2/8CKtZUug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJjYf-0006H2-Mi; Thu, 25 Apr 2019 18:57:21 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJjYb-0006Gb-8A
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 18:57:19 +0000
Received: by mail-pg1-x542.google.com with SMTP id y3so279937pgk.12
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 11:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id;
 bh=7mQQGta7HSRthviWyhE8pKJxQnv1MqDQM/HXzaPxn+E=;
 b=K5zvD3M3Jmfw9UnW+ugS14yTdDZedXXVtBPiLWmuuj4SCAf+AoGmJsIBPdKEsQGVhh
 s8c+Ia0XFmdpueXv0CTGgjw+qHWSdybySG5xbjJPLtvx+cnbKDVx+JchbG09N2cztzWb
 xolNMs0SEFc1ybugQWRQUkzDzhMKdjT16eGMqMRozEFrGkQahQwZIm12qEr8ITK7VZXv
 Dl4DyCudZZFzrP9y2GivZExRUy5d8lQ93zhdqZ1Lm1znY+2Lpry9PqCggDcw4MtVeqtI
 uY3IA5caELCFeaALBMkZrIiOGBmu0qWaRe1MrtIFb3czWtYk6yzGXHWsADjKAE87CAUH
 h6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
 bh=7mQQGta7HSRthviWyhE8pKJxQnv1MqDQM/HXzaPxn+E=;
 b=MOY30MTpe7K3yw2iJKNCtk9lnAPeMvPW051eQEZroeh96yT2XGyc0TxwLb2+iSybdF
 kXJDbQQ7dFE+7c2zezRbzwbuLFnv5HIMl1LWoJbx2rBuXIQjMBKbJF7UDRZF8LpDmLSt
 SDJe9IBKQjj88C/rd2O+PKDcpM6m546TVH5U+0BBwnegXponDawxpUByP0UyWY9/YU3I
 DTBNsCswWGiskx8iThfXLARxqajWzqlRQOSQpDkg0wMF0ZYuwMKYXM4TxzwiS1sBtTi6
 GRUWOezVosqwJ1x7RuvAtZkM5CV662Lc2xGGNjnBmbYPrGuoaDP2/my2CWmIXFSOUQeM
 yfkw==
X-Gm-Message-State: APjAAAXMTaylsUR+s59OwJqVCI1Lyp+ZJhq8vxsuZQ5WXblC3FxwKTOU
 io8BiF4dilDHqggSrOsjMS/HycV2r0o=
X-Google-Smtp-Source: APXvYqxQPllDZ2ZzcY8c5mNxOk1tV6kB6vRuiIk3tHnrlXbMeKVeokAz+32CPqX1Ui4/9ef7lFuROg==
X-Received: by 2002:a63:5b4b:: with SMTP id l11mr37452830pgm.95.1556218635757; 
 Thu, 25 Apr 2019 11:57:15 -0700 (PDT)
Received: from localhost ([134.134.139.92])
 by smtp.gmail.com with ESMTPSA id d25sm29772089pfn.154.2019.04.25.11.57.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Apr 2019 11:57:14 -0700 (PDT)
Date: Thu, 25 Apr 2019 11:57:14 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Apr 2019 11:54:27 PDT (-0700)
Subject: Re: [RFC][PATCH] RISC-V: Add kexec support
In-Reply-To: <20190410161548.17283-1-mick@ics.forth.gr>
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr
Message-ID: <mhng-f3d04938-d58f-4475-8c7b-505690c4539d@palmer-si-x1e>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_115717_303227_7771060B 
X-CRM114-Status: GOOD (  38.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup.Patel@wdc.com, mick@ics.forth.gr, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 10 Apr 2019 09:15:48 PDT (-0700), mick@ics.forth.gr wrote:
> This patch adds support for kexec on RISC-V. For now it doesn't
> include kexec_file or kdump / crashkernel support. I tested it
> on riscv64 QEMU with BBL and a single core. On SMP systems this
> should disable all secondary harts through smp_send_stop(),
> until we get support for hart suspend/resume through SBI, but
> it doesn't seem to work properly with BBL. On OpenSBI I get
> a weird trap handler failure where mcause/scause is 0x5 for
> no apparent reason.

Thanks!  I while ago we sketched out doing kexec with the "all harts start
themselves up" model of booting, but given that the current plan is to move to
explicit SBI calls for power management it might not be worth the headache to
get this actually working.  That said, I'd love to have a proof of concept that
shows this working for the existing SBI.

> The (much larger) patch for kexec-tools (2.0.19) can be found here:
> https://riscv.ics.forth.gr/RISC-V-Add-kexec-support-kexec_tools.patch
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  arch/riscv/Kconfig                 |  11 ++
>  arch/riscv/include/asm/kexec.h     |  43 +++++++
>  arch/riscv/kernel/Makefile         |   4 +-
>  arch/riscv/kernel/kexec_relocate.S | 175 ++++++++++++++++++++++++++
>  arch/riscv/kernel/machine_kexec.c  | 191 +++++++++++++++++++++++++++++
>  include/uapi/linux/kexec.h         |   1 +
>  6 files changed, 424 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/kexec.h
>  create mode 100644 arch/riscv/kernel/kexec_relocate.S
>  create mode 100644 arch/riscv/kernel/machine_kexec.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 515fc3cc9..0ed5f6d20 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -228,6 +228,17 @@ menu "Kernel features"
>
>  source "kernel/Kconfig.hz"
>
> +config KEXEC
> +	bool "Kexec system call"
> +	select KEXEC_CORE
> +	help
> +	  kexec is a system call that implements the ability to shutdown your
> +	  current kernel, and to start another kernel. It is like a reboot
> +	  but it is independent of the system firmware. And like a reboot
> +	  you can start any kernel with it, not just Linux.
> +
> +	  The name comes from the similarity to the exec system call.
> +
>  endmenu
>
>  menu "Boot options"
> diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
> new file mode 100644
> index 000000000..86d2f3c6c
> --- /dev/null
> +++ b/arch/riscv/include/asm/kexec.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 FORTH-ICS/CARV
> + *		      Nick Kossifidis <mick@ics.forth.gr>
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
> +/*
> + * These are defined on kexec_relocate.S
> + * and modified on machine_kexec.c
> + */
> +const extern unsigned char riscv_kexec_relocate[];
> +const extern unsigned int riscv_kexec_relocate_size;
> +
> +extern unsigned long riscv_kexec_start_address;
> +extern unsigned long riscv_kexec_indirection_page;
> +extern unsigned long riscv_kexec_fdt_address;
> +extern unsigned long riscv_kexec_hartid;
> +
> +#endif
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index f13f7f276..de50d5f96 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -40,6 +40,8 @@ obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
>  obj-$(CONFIG_FUNCTION_TRACER)	+= mcount.o ftrace.o
>  obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
>
> -obj-$(CONFIG_PERF_EVENTS)      += perf_event.o
> +obj-$(CONFIG_PERF_EVENTS)	+= perf_event.o
> +
> +obj-${CONFIG_KEXEC}		+= kexec_relocate.o machine_kexec.o
>
>  clean:
> diff --git a/arch/riscv/kernel/kexec_relocate.S b/arch/riscv/kernel/kexec_relocate.S
> new file mode 100644
> index 000000000..fae6b1360
> --- /dev/null
> +++ b/arch/riscv/kernel/kexec_relocate.S
> @@ -0,0 +1,175 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 FORTH-ICS/CARV
> + *		      Nick Kossifidis <mick@ics.forth.gr>
> + */
> +
> +#include <asm/asm.h>	/* For RISCV_* and REG_* macros */
> +#include <asm/page.h>	/* For PAGE_SHIFT */
> +
> +	.globl riscv_kexec_relocate
> +riscv_kexec_relocate:
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
> +	REG_L	s0, riscv_kexec_indirection_page
> +	REG_L	s1, riscv_kexec_start_address
> +	REG_L	s2, riscv_kexec_fdt_address
> +	REG_L	s3, riscv_kexec_hartid
> +	mv	s4, zero
> +	li	s5, ((1 << PAGE_SHIFT) / RISCV_SZPTR)
> +	li	s6, 1
> +	REG_L	s7, va_pa_offset
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
> +
> +	/* Process entries in a loop */
> +.align 2
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
> +
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
> +
> +	/* Exported variables, set on machine_kexec.c */
> +	.globl riscv_kexec_start_address
> +riscv_kexec_start_address:
> +	RISCV_PTR	0x0
> +
> +	.globl riscv_kexec_indirection_page
> +riscv_kexec_indirection_page:
> +	RISCV_PTR	0x0
> +
> +	.globl riscv_kexec_fdt_address
> +riscv_kexec_fdt_address:
> +	RISCV_PTR	0x0
> +
> +	.globl riscv_kexec_hartid
> +riscv_kexec_hartid:
> +	RISCV_PTR	0x0
> +
> +riscv_kexec_relocate_end:
> +
> +	.globl riscv_kexec_relocate_size
> +riscv_kexec_relocate_size:
> +	.long riscv_kexec_relocate_end - riscv_kexec_relocate
> +
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> new file mode 100644
> index 000000000..352bf8219
> --- /dev/null
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 FORTH-ICS/CARV
> + *		      Nick Kossifidis <mick@ics.forth.gr>
> + */
> +
> +#include <linux/kexec.h>
> +#include <asm/kexec.h>		/* For riscv_kexec_* symbol defines */
> +#include <linux/smp.h>		/* For smp_send_stop () */
> +#include <asm/cacheflush.h>	/* For local_flush_icache_all() */
> +#include <asm/barrier.h>	/* For smp_wmb() */
> +#include <asm/page.h>		/* For PAGE_MASK */
> +#include <linux/libfdt.h>	/* For fdt_check_header() */
> +
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
> +	struct fdt_header fdt = {0};
> +	void *control_code_buffer = NULL;
> +	int i = 0;
> +
> +	riscv_kexec_start_address = 0;
> +	riscv_kexec_indirection_page = 0;
> +	riscv_kexec_fdt_address = 0;
> +
> +	kexec_image_info(image);
> +
> +	if (image->type == KEXEC_TYPE_CRASH) {
> +		pr_warn("Loading a crash kernel is unsupported for now.\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Find the Flattened Device Tree */
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
> +		riscv_kexec_fdt_address = (unsigned long) image->segment[i].mem;
> +		break;
> +	}
> +
> +	if (!riscv_kexec_fdt_address) {
> +		pr_err("Device tree not included in the provided image\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Initialize the rest of the arguments for the relocation code */
> +	riscv_kexec_start_address = (unsigned long) image->start;
> +	riscv_kexec_indirection_page = (unsigned long) &image->head;
> +
> +	/* Copy the assembler code for relocation to the control buffer */
> +	control_code_buffer = page_address(image->control_code_page);
> +	memcpy(control_code_buffer, riscv_kexec_relocate,
> +		riscv_kexec_relocate_size);
> +
> +#ifdef CONFIG_SMP
> +	/*
> +	 * Make sure other harts see the copied data
> +	 * if they try to read the buffer
> +	 */
> +	smp_wmb();
> +#endif

Isn't smp_wmb() already a NOP for !CONFIG_SMP?

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
> + * harts and possibly devices etc) for a kexec reboot. Since on kexec
> + * the current kernel will be lost, the other harts on the system won't
> + * know what to run and will hang in an unrecoverable way. Until we
> + * support CPU suspend through SBI we just stop all other harts by
> + * forcing them on an infinite wfi loop with interrupts disabled.
> + */
> +void machine_shutdown(void)
> +{
> +#ifdef CONFIG_SMP
> +	pr_notice("Stopping secondary harts\n");
> +	smp_send_stop();
> +#endif
> +}

This is not how I would do it: I'd have this put all the secondary harts into
an in-kernel spin table, with machine_kexec then pointing all secondary harts
to the new kernel image's entry point before jumping there itself.

Maybe I'm missing something, but won't this result in the new kernel only ever
getting a single hart?  Unless the other harts get filtered out of the device
tree then the kernel will hang waiting for them to appear.

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
> +void
> +machine_kexec(struct kimage *image)
> +{
> +	void (*do_relocate)(void) __noreturn;
> +	void *control_code_buffer = NULL;
> +
> +	control_code_buffer = page_address(image->control_code_page);
> +	do_relocate = control_code_buffer;
> +
> +	/* Pass the current hart's id to the next kernel */
> +	riscv_kexec_hartid = raw_smp_processor_id();
> +
> +	pr_notice("Will call new kernel at %08lx from hart id %lx\n",
> +		  riscv_kexec_start_address, riscv_kexec_hartid);
> +	pr_notice("FDT image at %08lx\n", riscv_kexec_fdt_address);
> +
> +	/* We can't be interrupted during reboot */
> +	local_irq_disable();
> +
> +	/* Make sure the relocation code is visible to the hart */
> +	local_flush_icache_all();
> +
> +	/* Jump to the relocation code */
> +	pr_notice("Bye...\n");
> +	do_relocate();
> +}
> diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
> index 6d1128682..87af2f17a 100644
> --- a/include/uapi/linux/kexec.h
> +++ b/include/uapi/linux/kexec.h
> @@ -41,6 +41,7 @@
>  #define KEXEC_ARCH_MIPS_LE (10 << 16)
>  #define KEXEC_ARCH_MIPS    ( 8 << 16)
>  #define KEXEC_ARCH_AARCH64 (183 << 16)
> +#define KEXEC_ARCH_RISCV   (243 << 16)
>
>  /* The artificial cap on the number of segments passed to kexec_load. */
>  #define KEXEC_SEGMENT_MAX 16

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
