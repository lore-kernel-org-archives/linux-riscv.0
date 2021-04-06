Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BC2C433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 18:39:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B7D613B7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 18:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B7D613B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5pXHOeDdtBHXA63KUxVdZ+0PsyMzpsi0mC4qVyF4ylU=; b=AKQ9YJpvrcIxsxMbnXAXXHcOb
	vj1CNkiPh/fqZU4/5l341sE69Yd5M+AEY1/+mYSGpgy9MB2FNfTERcG9y7pxM76che6f3OMgnNXUE
	Yefm+m8M/21LBpSmD7VWkMpwJdsSH2j6YdZjnCLdFNHViTqeig3t6F6IBPaYayuPi8UT2/BrxZoaI
	kqCWfg6O9jEkTCKadcLvarz/5xrtPekcr3LC9Y83MDEmhSNaAgAOtBQ6AP1o4hTIBbtGrwuyHxgpp
	uPf9AlxJPjyK4EoebR8BRrOuvWZ3BCesAfD0RQ0ONujVZhIEdLVDXr/BgmA1VEmaq9sObJZYJ8mwp
	hc2SfJIhA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTqbB-003Hbw-2g; Tue, 06 Apr 2021 18:38:49 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTqb7-003Hbd-E8
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 18:38:47 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 944BFC0004;
 Tue,  6 Apr 2021 18:38:43 +0000 (UTC)
From: Alex Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v3 2/5] RISC-V: Add kexec support
To: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: paul.walmsley@sifive.com, linux-kernel@vger.kernel.org
References: <20210405085712.1953848-1-mick@ics.forth.gr>
 <20210405085712.1953848-3-mick@ics.forth.gr>
Message-ID: <386bf260-006a-62c4-2d7b-1a22a43b3513@ghiti.fr>
Date: Tue, 6 Apr 2021 14:38:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210405085712.1953848-3-mick@ics.forth.gr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_193845_646178_1E9699B6 
X-CRM114-Status: GOOD (  58.09  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Le 4/5/21 =E0 4:57 AM, Nick Kossifidis a =E9crit=A0:
> This patch adds support for kexec on RISC-V. On SMP systems it depends
> on HOTPLUG_CPU in order to be able to bring up all harts after kexec.
> It also needs a recent OpenSBI version that supports the HSM extension.
> I tested it on riscv64 QEMU on both an smp and a non-smp system.
> =

> v5:
>   * For now depend on MMU, further changes needed for NOMMU support
>   * Make sure stvec is aligned
>   * Cleanup some unneeded fences
>   * Verify control code's buffer size
>   * Compile kexec_relocate.S with medany and norelax
> =

> v4:
>   * No functional changes, just re-based
> =

> v3:
>   * Use the new smp_shutdown_nonboot_cpus() call.
>   * Move riscv_kexec_relocate to .rodata
> =

> v2:
>   * Pass needed parameters as arguments to riscv_kexec_relocate
>     instead of using global variables.
>   * Use kimage_arch to hold the fdt address of the included fdt.
>   * Use SYM_* macros on kexec_relocate.S.
>   * Compatibility with STRICT_KERNEL_RWX.
>   * Compatibility with HOTPLUG_CPU for SMP
>   * Small cleanups
> =

> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>   arch/riscv/Kconfig                 |  15 +++
>   arch/riscv/include/asm/kexec.h     |  47 ++++++++
>   arch/riscv/kernel/Makefile         |   5 +
>   arch/riscv/kernel/kexec_relocate.S | 156 ++++++++++++++++++++++++
>   arch/riscv/kernel/machine_kexec.c  | 186 +++++++++++++++++++++++++++++
>   5 files changed, 409 insertions(+)
>   create mode 100644 arch/riscv/include/asm/kexec.h
>   create mode 100644 arch/riscv/kernel/kexec_relocate.S
>   create mode 100644 arch/riscv/kernel/machine_kexec.c
> =

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8ea60a0a1..3716262ef 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -389,6 +389,21 @@ config RISCV_SBI_V01
>   	help
>   	  This config allows kernel to use SBI v0.1 APIs. This will be
>   	  deprecated in future once legacy M-mode software are no longer in us=
e.
> +
> +config KEXEC
> +	bool "Kexec system call"
> +	select KEXEC_CORE
> +	select HOTPLUG_CPU if SMP
> +	depends on MMU
> +	help
> +	  kexec is a system call that implements the ability to shutdown your
> +	  current kernel, and to start another kernel. It is like a reboot
> +	  but it is independent of the system firmware. And like a reboot
> +	  you can start any kernel with it, not just Linux.
> +
> +	  The name comes from the similarity to the exec system call.
> +
> +
>   endmenu
>   =

>   menu "Boot options"
> diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexe=
c.h
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

PAGE_SIZE instead ?

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
> index 3dc0abde9..c2594018c 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -9,6 +9,10 @@ CFLAGS_REMOVE_patch.o	=3D $(CC_FLAGS_FTRACE)
>   CFLAGS_REMOVE_sbi.o	=3D $(CC_FLAGS_FTRACE)
>   endif
>   =

> +ifdef CONFIG_KEXEC
> +AFLAGS_kexec_relocate.o :=3D -mcmodel=3Dmedany -mno-relax
> +endif
> +
>   extra-y +=3D head.o
>   extra-y +=3D vmlinux.lds
>   =

> @@ -54,6 +58,7 @@ obj-$(CONFIG_SMP) +=3D cpu_ops_sbi.o
>   endif
>   obj-$(CONFIG_HOTPLUG_CPU)	+=3D cpu-hotplug.o
>   obj-$(CONFIG_KGDB)		+=3D kgdb.o
> +obj-${CONFIG_KEXEC}		+=3D kexec_relocate.o machine_kexec.o

Other obj-$() use parenthesis.

>   =

>   obj-$(CONFIG_JUMP_LABEL)	+=3D jump_label.o
>   =

> diff --git a/arch/riscv/kernel/kexec_relocate.S b/arch/riscv/kernel/kexec=
_relocate.S
> new file mode 100644
> index 000000000..616c20771
> --- /dev/null
> +++ b/arch/riscv/kernel/kexec_relocate.S
> @@ -0,0 +1,156 @@
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

1 << PAGE_SHIFT =3D PAGE_SIZE

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
> +
> +	/* Process entries in a loop */
> +.align 2
> +1:
> +	addi	s10, s10, 1
> +	REG_L	t0, 0(s0)		/* t0 =3D *image->entry */
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
> +	mv	t3, s5		/* i =3D num words per page */
> +3:	/* copy loop */
> +	REG_L	t1, (t0)	/* t1 =3D *src_ptr */
> +	REG_S	t1, (s4)	/* *dst_ptr =3D *src_ptr */
> +	addi	t0, t0, RISCV_SZPTR /* stc_ptr++ */
> +	addi	s4, s4, RISCV_SZPTR /* dst_ptr++ */
> +	sub	t3, t3, s6	/* i-- */
> +	addi	s11, s11, 1	/* c++ */
> +	beqz	t3, 1b		/* copy done ? */
> +	j	3b
> +
> +4:
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
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machin=
e_kexec.c
> new file mode 100644
> index 000000000..2ce6c3daf
> --- /dev/null
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -0,0 +1,186 @@
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
> + * harts and possibly devices etc) for a kexec reboot.
> + */
> +void machine_shutdown(void)
> +
> +	pr_debug("Kexec image info:\n");
> +	pr_debug("\ttype:        %d\n", image->type);
> +	pr_debug("\tstart:       %lx\n", image->start);
> +	pr_debug("\thead:        %lx\n", image->head);
> +	pr_debug("\tnr_segments: %lu\n", image->nr_segments);
> +
> +	for (i =3D 0; i < image->nr_segments; i++) {
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
> +	struct kimage_arch *internal =3D &image->arch;
> +	struct fdt_header fdt =3D {0};
> +	void *control_code_buffer =3D NULL;
> +	unsigned int control_code_buffer_sz =3D 0;
> +	int i =3D 0;
> +
> +	kexec_image_info(image);
> +
> +	if (image->type =3D=3D KEXEC_TYPE_CRASH) {
> +		pr_warn("Loading a crash kernel is unsupported for now.\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Find the Flattened Device Tree and save its physical address */
> +	for (i =3D 0; i < image->nr_segments; i++) {
> +		if (image->segment[i].memsz <=3D sizeof(fdt))
> +			continue;
> +
> +		if (copy_from_user(&fdt, image->segment[i].buf, sizeof(fdt)))
> +			continue;
> +
> +		if (fdt_check_header(&fdt))
> +			continue;
> +
> +		internal->fdt_addr =3D (unsigned long) image->segment[i].mem;
> +		break;
> +	}
> +
> +	if (!internal->fdt_addr) {
> +		pr_err("Device tree not included in the provided image\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Copy the assembler code for relocation to the control page */
> +	control_code_buffer =3D page_address(image->control_code_page);
> +	control_code_buffer_sz =3D page_size(image->control_code_page);
> +	if (unlikely(riscv_kexec_relocate_size > control_code_buffer_sz)) {
> +		pr_err("Relocation code doesn't fit within a control page\n");
> +		return -EINVAL;
> +	}
> +	memcpy(control_code_buffer, riscv_kexec_relocate,
> +		riscv_kexec_relocate_size);
> +
> +	/* Mark the control page executable */
> +	set_memory_x((unsigned long) control_code_buffer, 1);
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

Shouldn't it be defined(CONFIG_SMP) ?

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
> +	struct kimage_arch *internal =3D &image->arch;
> +	unsigned long jump_addr =3D (unsigned long) image->start;
> +	unsigned long first_ind_entry =3D (unsigned long) &image->head;
> +	unsigned long this_hart_id =3D raw_smp_processor_id();
> +	unsigned long fdt_addr =3D internal->fdt_addr;
> +	void *control_code_buffer =3D page_address(image->control_code_page);
> +	riscv_kexec_do_relocate do_relocate =3D control_code_buffer;
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
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
