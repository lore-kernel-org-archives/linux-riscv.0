Return-Path: <SRS0=OENr=AE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F16C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2020 15:06:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A14C20774
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2020 15:06:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AsQIh0xW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A14C20774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oEmQOqZhuVU7M1jfbwi73vu/DpfsZ3UtIqFEIS6+FzI=; b=AsQIh0xWoIRPUyK9C2lfM1FOX
	ZPVovToePF9ciSBq/UvY22MqrVBB8+F2lGEauhtRAyJv/Mq2YqHB2LCCtnBTGcjPbO4TuMkhvuIKu
	m4emP4clW8ay6gTHvSR1Lr0YxdeciT0+orfdwSFxNO5EUBK6AO/ec6tRgd0tA6FUptT0hAy4DfdP/
	eL8i/HQCQpdrTGLupp4Q1j+Exim8JozKi/IljtZK2gpvuFBVdEoftBOlqFfnHoGYuNdQYsBblQcvf
	QzV7+wMJ+7weFsgp0KqBP7YnUFEkmWXdGcM0D46TBCguJxwjnCxKfeU1oJbnAnQBmmEhobQkYaXlI
	LMbMkYvig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnkV5-0006vo-F3; Tue, 23 Jun 2020 15:06:15 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnkUv-0006oH-Uk
 for linux-riscv@lists.infradead.org; Tue, 23 Jun 2020 15:06:13 +0000
Received: from av3.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 05NF5PHg016112; Tue, 23 Jun 2020 15:05:27 GMT
X-AuditID: 8b5b014d-257ff700000045c5-af-5ef21a35c0e0
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 D9.B1.17861.53A12FE5; Tue, 23 Jun 2020 18:05:25 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Subject: [PATCH v2 2/3] RISC-V: Add kdump support
Date: Tue, 23 Jun 2020 18:05:11 +0300
Message-Id: <20200623150512.896499-3-mick@ics.forth.gr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200623150512.896499-1-mick@ics.forth.gr>
References: <20200623150512.896499-1-mick@ics.forth.gr>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsXSHT1dWddU6lOcQcNGHouWD+9YLRat+M5i
 seXwI2aLbZ9b2Cya351jt3h5uYfZom0Wv0XTi+vMFh/uzmZz4PSY+vsMi0fXjxmsHm9evmTx
 eLjpEpPH5iX1Hpear7N7tB/oZgpgj+KySUnNySxLLdK3S+DKmLD7I3tB+yTGii+z37M3ML4o
 7WLk5JAQMJGY3naNtYuRi0NI4BijxLfWx4wQCTeJ2/d3soLYbAKaEvMvHWQBsUUEzCWaZ74G
 q2EGaVi8rALEFhYwlPiw9Dk7iM0ioCpx+c9tZhCbF6j+/szVrBAz5SXal29n62Lk4OAUsJDY
 O9MAJCwEVHJ2zXsWiHJBiZMzn7BAjJeXaN46m3kCI98sJKlZSFILGJlWMQoklhnrZSYX66Xl
 F5Vk6KUXbWIEBy6j7w7G25vf6h1iZOJgPMQowcGsJML7OuBdnBBvSmJlVWpRfnxRaU5q8SFG
 aQ4WJXHePO7lsUIC6YklqdmpqQWpRTBZJg5OqQam6XP43pk0P2Y5/VojT/u+s5yBf8jVHNuw
 KaxTD37zLNpn+anw1XxZsQeHPdWe5wf97v656UVz8szUkKAvOn+L/886vPH6Z44k3QfeKyZl
 SVV3Gb012WJw4Dr3gSy3Cyc+P5ly6ILvDNfsN/Ksx/1Pi9u2PnG8YHn5+v6kOrVW71/35XY/
 yi+/aTWzWEqn9Kl46v47k7aGPNk95+v92Xw3CpfXsWz+kc1yfraG8ZJDW8IkJZMkihqSb8oF
 dN8yUVizbas2u9cnxvR5Rn8OLIsuOX524ZrUD+qPvq04UNNj/L3/lHCpqqeYhsyGDccm7TSt
 /xz95vEK8cc7bB5pZS71kf1r1RXM1HRHmamY1yCGQ4mlOCPRUIu5qDgRAGi/JzLLAgAA
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Tue, 23 Jun 2020 15:05:27 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av3.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Tue, 23 Jun 2020 15:05:27 +0000 (GMT)
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
Cc: david.abdurachmanov@sifive.com, anup@brainfault.org, atish.patra@wdc.com,
 yibin_liu@c-sky.com, zong.li@sifive.com, paul.walmsley@sifive.com,
 Nick Kossifidis <mick@ics.forth.gr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch adds support for kdump, the kernel will reserve a
region for the crash kernel and jump there on panic. In order
for userspace tools (kexec-tools) to prepare the crash kernel
kexec image, we also need to expose some information on
/proc/iomem for the memory regions used by the kernel and for
the region reserved for crash kernel. Note that on userspace
the device tree is used to determine the system's memory
layout so the "System RAM" on /proc/iomem is ignored. I just
put it there for compatibility with other archs.

I tested this on riscv64 qemu and works as expected, you may
test it by triggering a crash through /proc/sysrq_trigger:

echo c > /proc/sysrq_trigger

v2:
 * Properly populate the ioresources tree, so that it can be
   used later on for implementing strict /dev/mem.
 * Minor cleanups and re-base

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 arch/riscv/include/asm/kexec.h      |  19 ++-
 arch/riscv/include/uapi/asm/elf.h   |   6 +
 arch/riscv/kernel/Makefile          |   2 +-
 arch/riscv/kernel/crash_save_regs.S |  56 +++++++++
 arch/riscv/kernel/kexec_relocate.S  |  61 +++++++++-
 arch/riscv/kernel/machine_kexec.c   |  31 +++--
 arch/riscv/kernel/setup.c           | 180 ++++++++++++++++++++++++++++
 arch/riscv/mm/init.c                |  77 ++++++++++++
 8 files changed, 411 insertions(+), 21 deletions(-)
 create mode 100644 arch/riscv/kernel/crash_save_regs.S

diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
index efc69feb4..4fd583acc 100644
--- a/arch/riscv/include/asm/kexec.h
+++ b/arch/riscv/include/asm/kexec.h
@@ -21,11 +21,16 @@
 
 #define KEXEC_ARCH KEXEC_ARCH_RISCV
 
+extern void riscv_crash_save_regs(struct pt_regs *newregs);
+
 static inline void
 crash_setup_regs(struct pt_regs *newregs,
 		 struct pt_regs *oldregs)
 {
-	/* Dummy implementation for now */
+	if (oldregs)
+		memcpy(newregs, oldregs, sizeof(struct pt_regs));
+	else
+		riscv_crash_save_regs(newregs);
 }
 
 
@@ -38,10 +43,12 @@ struct kimage_arch {
 const extern unsigned char riscv_kexec_relocate[];
 const extern unsigned int riscv_kexec_relocate_size;
 
-typedef void (*riscv_kexec_do_relocate)(unsigned long first_ind_entry,
-					unsigned long jump_addr,
-					unsigned long fdt_addr,
-					unsigned long hartid,
-					unsigned long va_pa_off);
+typedef void (*riscv_kexec_method)(unsigned long first_ind_entry,
+				   unsigned long jump_addr,
+				   unsigned long fdt_addr,
+				   unsigned long hartid,
+				   unsigned long va_pa_off);
+
+extern riscv_kexec_method riscv_kexec_norelocate;
 
 #endif
diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
index d696d6610..5b19f5547 100644
--- a/arch/riscv/include/uapi/asm/elf.h
+++ b/arch/riscv/include/uapi/asm/elf.h
@@ -19,6 +19,12 @@ typedef unsigned long elf_greg_t;
 typedef struct user_regs_struct elf_gregset_t;
 #define ELF_NGREG (sizeof(elf_gregset_t) / sizeof(elf_greg_t))
 
+#define ELF_CORE_COPY_REGS(dest, regs)			\
+do {							\
+	*(struct user_regs_struct *)&(dest) =		\
+		*(struct user_regs_struct *)regs;	\
+} while (0);
+
 /* We don't support f without d, or q.  */
 typedef __u64 elf_fpreg_t;
 typedef union __riscv_fp_state elf_fpregset_t;
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 63fc530a4..b9a3842ad 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -52,6 +52,6 @@ obj-$(CONFIG_SMP) += cpu_ops_sbi.o
 endif
 obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
 obj-$(CONFIG_KGDB)		+= kgdb.o
-obj-${CONFIG_KEXEC}		+= kexec_relocate.o machine_kexec.o
+obj-${CONFIG_KEXEC}		+= kexec_relocate.o crash_save_regs.o machine_kexec.o
 
 clean:
diff --git a/arch/riscv/kernel/crash_save_regs.S b/arch/riscv/kernel/crash_save_regs.S
new file mode 100644
index 000000000..7832fb763
--- /dev/null
+++ b/arch/riscv/kernel/crash_save_regs.S
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 FORTH-ICS/CARV
+ *  Nick Kossifidis <mick@ics.forth.gr>
+ */
+
+#include <asm/asm.h>    	/* For RISCV_* and REG_* macros */
+#include <asm/csr.h>		/* For CSR_* macros */
+#include <asm/asm-offsets.h>	/* For offsets on pt_regs */
+#include <linux/linkage.h>	/* For SYM_* macros */
+
+.section ".text"
+SYM_CODE_START(riscv_crash_save_regs)
+	REG_S ra,  PT_RA(a0)	/* x1 */
+	REG_S sp,  PT_SP(a0)	/* x2 */
+	REG_S gp,  PT_GP(a0)	/* x3 */
+	REG_S tp,  PT_TP(a0)	/* x4 */
+	REG_S t0,  PT_T0(a0)	/* x5 */
+	REG_S t1,  PT_T1(a0)	/* x6 */
+	REG_S t2,  PT_T2(a0)	/* x7 */
+	REG_S s0,  PT_S0(a0)	/* x8/fp */
+	REG_S s1,  PT_S1(a0)	/* x9 */
+	REG_S a0,  PT_A0(a0)	/* x10 */
+	REG_S a1,  PT_A1(a0)	/* x11 */
+	REG_S a2,  PT_A2(a0)	/* x12 */
+	REG_S a3,  PT_A3(a0)	/* x13 */
+	REG_S a4,  PT_A4(a0)	/* x14 */
+	REG_S a5,  PT_A5(a0)	/* x15 */
+	REG_S a6,  PT_A6(a0)	/* x16 */
+	REG_S a7,  PT_A7(a0)	/* x17 */
+	REG_S s2,  PT_S2(a0)	/* x18 */
+	REG_S s3,  PT_S3(a0)	/* x19 */
+	REG_S s4,  PT_S4(a0)	/* x20 */
+	REG_S s5,  PT_S5(a0)	/* x21 */
+	REG_S s6,  PT_S6(a0)	/* x22 */
+	REG_S s7,  PT_S7(a0)	/* x23 */
+	REG_S s8,  PT_S8(a0)	/* x24 */
+	REG_S s9,  PT_S9(a0)	/* x25 */
+	REG_S s10, PT_S10(a0)	/* x26 */
+	REG_S s11, PT_S11(a0)	/* x27 */
+	REG_S t3,  PT_T3(a0)	/* x28 */
+	REG_S t4,  PT_T4(a0)	/* x29 */
+	REG_S t5,  PT_T5(a0)	/* x30 */
+	REG_S t6,  PT_T6(a0)	/* x31 */
+
+	csrr t1, CSR_STATUS
+	csrr t2, CSR_EPC
+	csrr t3, CSR_TVAL
+	csrr t4, CSR_CAUSE
+
+	REG_S t1, PT_STATUS(a0)
+	REG_S t2, PT_EPC(a0)
+	REG_S t3, PT_BADADDR(a0)
+	REG_S t4, PT_CAUSE(a0)
+	ret
+SYM_CODE_END(riscv_crash_save_regs)
diff --git a/arch/riscv/kernel/kexec_relocate.S b/arch/riscv/kernel/kexec_relocate.S
index cd17d585f..c417c44ea 100644
--- a/arch/riscv/kernel/kexec_relocate.S
+++ b/arch/riscv/kernel/kexec_relocate.S
@@ -152,7 +152,66 @@ SYM_CODE_START(riscv_kexec_relocate)
 SYM_CODE_END(riscv_kexec_relocate)
 riscv_kexec_relocate_end:
 
-	.section ".rodata"
+
+/* Used for jumping to crashkernel */
+.section ".text"
+SYM_CODE_START(riscv_kexec_norelocate)
+	/*
+	 * s0: (const) Phys address to jump to
+	 * s1: (const) Phys address of the FDT image
+	 * s2: (const) The hartid of the current hart
+	 */
+	mv	s0, a1
+	mv	s1, a2
+	mv	s2, a3
+
+	/* Disable / cleanup interrupts */
+	csrw	sie, zero
+	csrw	sip, zero
+
+	/* Switch to physical addressing */
+	csrw	sptbr, zero
+
+	/* Pass the arguments to the next kernel  / Cleanup*/
+	mv	a0, s2
+	mv	a1, s1
+	mv	a2, s0
+
+	/* Cleanup */
+	mv	a3, zero
+	mv	a4, zero
+	mv	a5, zero
+	mv	a6, zero
+	mv	a7, zero
+
+	mv	s0, zero
+	mv	s1, zero
+	mv	s2, zero
+	mv	s3, zero
+	mv	s4, zero
+	mv	s5, zero
+	mv	s6, zero
+	mv	s7, zero
+	mv	s8, zero
+	mv	s9, zero
+	mv	s10, zero
+	mv	s11, zero
+
+	mv	t0, zero
+	mv	t1, zero
+	mv	t2, zero
+	mv	t3, zero
+	mv	t4, zero
+	mv	t5, zero
+	mv	t6, zero
+	csrw	sepc, zero
+	csrw	scause, zero
+	csrw	sscratch, zero
+
+	jalr	zero, a2, 0
+SYM_CODE_END(riscv_kexec_norelocate)
+
+.section ".rodata"
 SYM_DATA(riscv_kexec_relocate_size,
 	.long riscv_kexec_relocate_end - riscv_kexec_relocate)
 
diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 88734a056..dfe6e9066 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -58,11 +58,6 @@ machine_kexec_prepare(struct kimage *image)
 
 	kexec_image_info(image);
 
-	if (image->type == KEXEC_TYPE_CRASH) {
-		pr_warn("Loading a crash kernel is unsupported for now.\n");
-		return -EINVAL;
-	}
-
 	/* Find the Flattened Device Tree and save its physical address */
 	for (i = 0; i < image->nr_segments; i++) {
 		if (image->segment[i].memsz <= sizeof(fdt))
@@ -84,12 +79,14 @@ machine_kexec_prepare(struct kimage *image)
 	}
 
 	/* Copy the assembler code for relocation to the control page */
-	control_code_buffer = page_address(image->control_code_page);
-	memcpy(control_code_buffer, riscv_kexec_relocate,
-		riscv_kexec_relocate_size);
+	if (image->type != KEXEC_TYPE_CRASH) {
+		control_code_buffer = page_address(image->control_code_page);
+		memcpy(control_code_buffer, riscv_kexec_relocate,
+		       riscv_kexec_relocate_size);
 
-	/* Mark the control page executable */
-	set_memory_x((unsigned long) control_code_buffer, 1);
+		/* Mark the control page executable */
+		set_memory_x((unsigned long) control_code_buffer, 1);
+	}
 
 #ifdef CONFIG_SMP
 	/*
@@ -149,6 +146,9 @@ void machine_shutdown(void)
 void
 machine_crash_shutdown(struct pt_regs *regs)
 {
+	crash_save_cpu(regs, smp_processor_id());
+	machine_shutdown();
+	pr_info("Starting crashdump kernel...\n");
 }
 
 /**
@@ -171,7 +171,12 @@ machine_kexec(struct kimage *image)
 	unsigned long this_hart_id = raw_smp_processor_id();
 	unsigned long fdt_addr = internal->fdt_addr;
 	void *control_code_buffer = page_address(image->control_code_page);
-	riscv_kexec_do_relocate do_relocate = control_code_buffer;
+	riscv_kexec_method kexec_method = NULL;
+
+	if (image->type != KEXEC_TYPE_CRASH)
+		kexec_method = control_code_buffer;
+	else
+		kexec_method = (riscv_kexec_method) &riscv_kexec_norelocate;
 
 	pr_notice("Will call new kernel at %08lx from hart id %lx\n",
 		  jump_addr, this_hart_id);
@@ -182,7 +187,7 @@ machine_kexec(struct kimage *image)
 
 	/* Jump to the relocation code */
 	pr_notice("Bye...\n");
-	do_relocate(first_ind_entry, jump_addr, fdt_addr,
-		    this_hart_id, va_pa_offset);
+	kexec_method(first_ind_entry, jump_addr, fdt_addr,
+		     this_hart_id, va_pa_offset);
 	unreachable();
 }
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f04373be5..4dc940389 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -4,6 +4,8 @@
  *  Chen Liqin <liqin.chen@sunplusct.com>
  *  Lennox Wu <lennox.wu@sunplusct.com>
  * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2020 FORTH-ICS/CARV
+ *  Nick Kossifidis <mick@ics.forth.gr>
  */
 
 #include <linux/init.h>
@@ -17,6 +19,8 @@
 #include <linux/sched/task.h>
 #include <linux/swiotlb.h>
 #include <linux/smp.h>
+#include <linux/crash_dump.h>
+#include <linux/initrd.h>
 
 #include <asm/clint.h>
 #include <asm/cpu_ops.h>
@@ -49,6 +53,181 @@ atomic_t hart_lottery __section(.sdata);
 unsigned long boot_cpu_hartid;
 static DEFINE_PER_CPU(struct cpu, cpu_devices);
 
+/*
+ * Place kernel memory regions on the resource tree so that
+ * kexec-tools can retrieve them from /proc/iomem. While there
+ * also add "System RAM" regions for compatibility with other
+ * archs, and the rest of the known regions for completeness.
+ */
+static struct resource code_res = { .name = "Kernel code", };
+static struct resource data_res = { .name = "Kernel data", };
+static struct resource rodata_res = { .name = "Kernel rodata", };
+static struct resource bss_res = { .name = "Kernel bss", };
+
+static int __init add_resource(struct resource *parent,
+				struct resource *res)
+{
+	int ret = 0;
+
+	ret = insert_resource(parent, res);
+	if (ret < 0) {
+		pr_err("Failed to add a %s resource at %llx\n",
+			res->name, res->start);
+		return ret;
+	}
+
+	return 1;
+}
+
+static int __init add_kernel_resources(struct resource *res)
+{
+	int ret = 0;
+
+	/*
+	 * The memory region of the kernel image is continuous and
+	 * was reserved on setup_bootmem, find it here and register
+	 * it as a resource, then register the various segments of
+	 * the image as child nodes
+	 */
+	if (!(res->start <= code_res.start && res->end >= data_res.end))
+		return 0;
+
+	res->name = "Kernel image";
+	res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	/*
+	 * We removed a part of this region on setup_bootmem so
+	 * we need to expand the resource for the bss to fit in.
+	 */
+	res->end = bss_res.end;
+
+	ret = add_resource(&iomem_resource, res);
+	if (ret < 0)
+		return ret;
+
+	ret = add_resource(res, &code_res);
+	if (ret < 0)
+		return ret;
+
+	ret = add_resource(res, &rodata_res);
+	if (ret < 0)
+		return ret;
+
+	ret = add_resource(res, &data_res);
+	if (ret < 0)
+		return ret;
+
+	ret = add_resource(res, &bss_res);
+
+	return ret;
+}
+
+#ifdef CONFIG_KEXEC_CORE
+static int __init add_crashk_resource(struct resource *res)
+{
+	if (res->start <= crashk_res.start && res->end >= crashk_res.end)
+		return add_resource(&iomem_resource, &crashk_res);
+
+	return 0;
+}
+#endif
+
+static void __init init_resources(void)
+{
+	struct memblock_region *region = NULL;
+	struct resource *res = NULL;
+	int ret = 0;
+
+	code_res.start = __pa_symbol(_text);
+	code_res.end = __pa_symbol(_etext) - 1;
+	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	rodata_res.start = __pa_symbol(__start_rodata);
+	rodata_res.end = __pa_symbol(__end_rodata) - 1;
+	rodata_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	data_res.start = __pa_symbol(_data);
+	data_res.end = __pa_symbol(_edata) - 1;
+	data_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	bss_res.start = __pa_symbol(__bss_start);
+	bss_res.end = __pa_symbol(__bss_stop) - 1;
+	bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+
+	/*
+	 * Start by adding the reserved regions, if they overlap
+	 * with /memory regions, insert_resource later on will take
+	 * care of it.
+	 */
+	for_each_memblock(reserved, region) {
+		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
+		if (!res)
+			panic("%s: Failed to allocate %zu bytes\n", __func__,
+			      sizeof(struct resource));
+
+		res->name = "Reserved";
+		res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
+		res->start = __pfn_to_phys(memblock_region_reserved_base_pfn(region));
+		res->end = __pfn_to_phys(memblock_region_reserved_end_pfn(region)) - 1;
+
+		ret = add_kernel_resources(res);
+		if (ret < 0)
+			goto error;
+		else if (ret)
+			continue;
+
+#ifdef CONFIG_KEXEC_CORE
+		ret = add_crashk_resource(res);
+		if (ret < 0)
+			goto error;
+		else if (ret)
+			continue;
+#endif
+
+		/*
+		 * Ignore any other reserved regions within
+		 * system memory.
+		 */
+		if (memblock_is_memory(res->start))
+			continue;
+
+		ret = add_resource(&iomem_resource, res);
+		if (ret < 0)
+			goto error;
+	}
+
+	/* Add /memory regions to the resource tree */
+	for_each_memblock(memory, region) {
+		res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
+		if (!res)
+			panic("%s: Failed to allocate %zu bytes\n", __func__,
+			      sizeof(struct resource));
+
+		if (unlikely(memblock_is_nomap(region))) {
+			res->name = "Reserved";
+			res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
+		} else {
+			res->name = "System RAM";
+			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+		}
+
+		res->start = __pfn_to_phys(memblock_region_memory_base_pfn(region));
+		res->end = __pfn_to_phys(memblock_region_memory_end_pfn(region)) - 1;
+
+		ret = add_resource(&iomem_resource, res);
+		if (ret < 0)
+			goto error;
+	}
+
+	return;
+
+ error:
+	memblock_free((phys_addr_t) res, sizeof(struct resource));
+	/* Better an empty resource tree than an inconsistent one */
+	release_child_resources(&iomem_resource);
+}
+
+
 void __init parse_dtb(void)
 {
 	if (early_init_dt_scan(dtb_early_va))
@@ -74,6 +253,7 @@ void __init setup_arch(char **cmdline_p)
 
 	setup_bootmem();
 	paging_init();
+	init_resources();
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
 	unflatten_and_copy_device_tree();
 #else
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f4adb3684..e4ce3a2af 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -2,6 +2,8 @@
 /*
  * Copyright (C) 2012 Regents of the University of California
  * Copyright (C) 2019 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2020 FORTH-ICS/CARV
+ *  Nick Kossifidis <mick@ics.forth.gr>
  */
 
 #include <linux/init.h>
@@ -13,6 +15,7 @@
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <linux/set_memory.h>
+#include <linux/crash_dump.h>
 
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
@@ -517,6 +520,77 @@ void mark_rodata_ro(void)
 }
 #endif
 
+#ifdef CONFIG_KEXEC_CORE
+/*
+ * reserve_crashkernel() - reserves memory for crash kernel
+ *
+ * This function reserves memory area given in "crashkernel=" kernel command
+ * line parameter. The memory reserved is used by dump capture kernel when
+ * primary kernel is crashing.
+ */
+static void __init reserve_crashkernel(void)
+{
+	unsigned long long crash_base = 0;
+	unsigned long long crash_size = 0;
+	unsigned long search_start = memblock_start_of_DRAM();
+	unsigned long search_end = memblock_end_of_DRAM();
+
+	int ret = 0;
+
+	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
+				&crash_size, &crash_base);
+	if (ret || !crash_size)
+		return;
+
+	crash_size = PAGE_ALIGN(crash_size);
+
+	if (crash_base == 0) {
+		/*
+		 * Current riscv boot protocol requires 2MB alignment for
+		 * RV64 and 4MB alignment for RV32 (hugepage size)
+		 */
+		crash_base = memblock_find_in_range(search_start, search_end,
+#ifdef CONFIG_64BIT
+						    crash_size, SZ_2M);
+#else
+						    crash_size, SZ_4M);
+#endif
+		if (crash_base == 0) {
+			pr_warn("crashkernel: couldn't allocate %lldKB\n",
+				crash_size >> 10);
+			return;
+		}
+	} else {
+		/* User specifies base address explicitly. */
+		if (!memblock_is_region_memory(crash_base, crash_size)) {
+			pr_warn("crashkernel: requested region is not memory\n");
+			return;
+		}
+
+		if (memblock_is_region_reserved(crash_base, crash_size)) {
+			pr_warn("crashkernel: requested region is reserved\n");
+			return;
+		}
+
+#ifdef CONFIG_64BIT
+		if (!IS_ALIGNED(crash_base, SZ_2M)) {
+#else
+		if (!IS_ALIGNED(crash_base, SZ_4M)) {
+#endif
+			pr_warn("crashkernel: requested region is misaligned\n");
+			return;
+		}
+	}
+	memblock_reserve(crash_base, crash_size);
+
+	pr_info("crashkernel: reserved 0x%016llx - 0x%016llx (%lld MB)\n",
+		crash_base, crash_base + crash_size, crash_size >> 20);
+
+	crashk_res.start = crash_base;
+	crashk_res.end = crash_base + crash_size - 1;
+}
+#endif
+
 void __init paging_init(void)
 {
 	setup_vm_final();
@@ -524,6 +598,9 @@ void __init paging_init(void)
 	sparse_init();
 	setup_zero_page();
 	zone_sizes_init();
+#ifdef CONFIG_KEXEC_CORE
+	reserve_crashkernel();
+#endif
 }
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
