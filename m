Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCA2C7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 20:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=yhviv6LnKJqywZh4K1nh35yYF/SvrCRjg/tQ7NaCwbE=; b=3p3b5DRgixCHuO
	lKI9KYtFLFVX2ENmaKILeUpULKOr7Ggj4eHTjAGfHgGoGZoqUSDOQBzwMw1Pf8YT2Uu7UGqP67pNn
	RbrZAwoySBKdZ6VDqWTd3p7mqq76WQ+2c0B/OBhPzUiM0nPRDBT+JugNSwpNi4sWu1ScRd2c7cNl0
	l8cFTT9UDfcfc+WV63AQ7EMOdPnB49+ESkPHazocNoRB+fT25+fc4AFZPVjQPO4Qp7dV73TvCt3Wo
	ljums5LA71k4MNbaOZrbxxi7OcGJ6OG86hi61JLo4fZififJlJYNsqRvpQxvALVmGGT2Ab3Mjb9+F
	DpT7wYUIjrXd3Oaj14nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7eo-001Lpl-2M;
	Mon, 08 May 2023 20:40:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7em-001LnO-0g;
	Mon, 08 May 2023 20:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=aMiZ8OZ6vDaTJDCLruBwx0VdtP/fC3sP/hWfkyTStdQ=; b=D4M0d3NgRM9SygNmW9pfUZIeEC
	EcO7XeRtF368eTSSTytfbHaYWpG1HZKig+qWW3uMWng5TwEbHcWNGZ9qdcHnI4ehHmtfHtYcEQD3w
	X8TsRx0LBN7CcjI+r4itxw9o7BL3s6QmGyqVqHyl+kLhWqXLIEiyl8C4+PDYGio+ZJRxhQaMM9fpb
	LWibPtZgRNICg8Uu8NnXkEJPRmg629DvZjjdv6M2kDGNQnd7nwmPjpC5EmKSVwpojdW6VeUe/p4CJ
	NUoy05fxA03AK/woFVFLJwnUmnJKC3KZ78mVcjpLBbX+b62UWSXTyM0GXptvhIFMfgKaQbzHkuZjS
	QRYv+m+g==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6mX-005GqL-1t;
	Mon, 08 May 2023 19:44:57 +0000
Message-ID: <20230508185219.176824543@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=aMiZ8OZ6vDaTJDCLruBwx0VdtP/fC3sP/hWfkyTStdQ=;
	b=yuDnwG7zN3SLTmatxCLQi6G3M2r5niq2jqlm9COB92lTFmTMZaYgZryIJ+rzTHsCHONba6
	vWo0dxyJs4ESGXbgE0lFP3hCB3L6owshuQVhMMGyIHPKxrbdF1XesOdpTLgoP9tB48W8oh
	mouC0wKak7b/sNfOgtGV8ddHlzYxwPPZi9y6XIo/ya2YHeA0kMFIv3cjw+uxxSpUsxWDUr
	9/ia6goJRJHQwRV1fF/1M6+Sa2hR4Xaf5N6IFcpZwOon0DvYoweKWPqBcr5ZaIifGmqw9E
	7BWWTQJenDmhznIV/zB3Diw5xpR2mScuFAmY1LhjlhzH3b1XVCnrQpwUO8SbWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=aMiZ8OZ6vDaTJDCLruBwx0VdtP/fC3sP/hWfkyTStdQ=;
	b=z+Qn0Pl/QKCqJ4Eb8oVMoc5d6bP6ce6mJl3mcAgcLTAEC9qajSvfk3Z5fjH3P38dAJ+nTB
	ojjVcTl/IJG6D+Dg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject:  [patch v3 35/36] x86/smpboot: Support parallel startup of secondary CPUs
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Date: Mon,  8 May 2023 21:44:23 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_204452_189628_7BB36EC2 
X-CRM114-Status: GOOD (  31.79  )
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

From: David Woodhouse <dwmw@amazon.co.uk>

In parallel startup mode the APs are kicked alive by the control CPU
quickly after each other and run through the early startup code in
parallel. The real-mode startup code is already serialized with a
bit-spinlock to protect the real-mode stack.

In parallel startup mode the smpboot_control variable obviously cannot
contain the Linux CPU number so the APs have to determine their Linux CPU
number on their own. This is required to find the CPUs per CPU offset in
order to find the idle task stack and other per CPU data.

To achieve this, export the cpuid_to_apicid[] array so that each AP can
find its own CPU number by searching therein based on its APIC ID.

Introduce a flag in the top bits of smpboot_control which indicates that
the AP should find its CPU number by reading the APIC ID from the APIC.

This is required because CPUID based APIC ID retrieval can only provide the
initial APIC ID, which might have been overruled by the firmware. Some AMD
APUs come up with APIC ID = initial APIC ID + 0x10, so the APIC ID to CPU
number lookup would fail miserably if based on CPUID. Also virtualization
can make its own APIC ID assignements. The only requirement is that the
APIC IDs are consistent with the APCI/MADT table.

For the boot CPU or in case parallel bringup is disabled the control bits
are empty and the CPU number is directly available in bit 0-23 of
smpboot_control.

[ tglx: Initial proof of concept patch with bitlock and APIC ID lookup ]
[ dwmw2: Rework and testing, commit message, CPUID 0x1 and CPU0 support ]
[ seanc: Fix stray override of initial_gs in common_cpu_up() ]
[ Oleksandr Natalenko: reported suspend/resume issue fixed in
  x86_acpi_suspend_lowlevel ]
[ tglx: Make it read the APIC ID from the APIC instead of using CPUID,
  	split the bitlock part out ]

Co-developed-by: Thomas Gleixner <tglx@linutronix.de>
Co-developed-by: Brian Gerst <brgerst@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Brian Gerst <brgerst@gmail.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>


---
 arch/x86/include/asm/apic.h    |    2 +
 arch/x86/include/asm/apicdef.h |    5 ++-
 arch/x86/include/asm/smp.h     |    6 +++
 arch/x86/kernel/acpi/sleep.c   |    9 +++++
 arch/x86/kernel/apic/apic.c    |    2 -
 arch/x86/kernel/head_64.S      |   62 +++++++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/smpboot.c      |    2 -
 7 files changed, 84 insertions(+), 4 deletions(-)
---

--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -55,6 +55,8 @@ extern int local_apic_timer_c2_ok;
 extern int disable_apic;
 extern unsigned int lapic_timer_period;
 
+extern int cpuid_to_apicid[];
+
 extern enum apic_intr_mode_id apic_intr_mode;
 enum apic_intr_mode_id {
 	APIC_PIC,
--- a/arch/x86/include/asm/apicdef.h
+++ b/arch/x86/include/asm/apicdef.h
@@ -138,7 +138,8 @@
 #define		APIC_EILVT_MASKED	(1 << 16)
 
 #define APIC_BASE (fix_to_virt(FIX_APIC_BASE))
-#define APIC_BASE_MSR	0x800
+#define APIC_BASE_MSR		0x800
+#define APIC_X2APIC_ID_MSR	0x802
 #define XAPIC_ENABLE	(1UL << 11)
 #define X2APIC_ENABLE	(1UL << 10)
 
@@ -162,6 +163,7 @@
 #define APIC_CPUID(apicid)	((apicid) & XAPIC_DEST_CPUS_MASK)
 #define NUM_APIC_CLUSTERS	((BAD_APICID + 1) >> XAPIC_DEST_CPUS_SHIFT)
 
+#ifndef __ASSEMBLY__
 /*
  * the local APIC register structure, memory mapped. Not terribly well
  * tested, but we might eventually use this one in the future - the
@@ -435,4 +437,5 @@ enum apic_delivery_modes {
 	APIC_DELIVERY_MODE_EXTINT	= 7,
 };
 
+#endif /* !__ASSEMBLY__ */
 #endif /* _ASM_X86_APICDEF_H */
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -200,4 +200,10 @@ extern unsigned long apic_mmio_base;
 
 #endif /* !__ASSEMBLY__ */
 
+/* Control bits for startup_64 */
+#define STARTUP_READ_APICID	0x80000000
+
+/* Top 8 bits are reserved for control */
+#define STARTUP_PARALLEL_MASK	0xFF000000
+
 #endif /* _ASM_X86_SMP_H */
--- a/arch/x86/kernel/acpi/sleep.c
+++ b/arch/x86/kernel/acpi/sleep.c
@@ -16,6 +16,7 @@
 #include <asm/cacheflush.h>
 #include <asm/realmode.h>
 #include <asm/hypervisor.h>
+#include <asm/smp.h>
 
 #include <linux/ftrace.h>
 #include "../../realmode/rm/wakeup.h"
@@ -127,7 +128,13 @@ int x86_acpi_suspend_lowlevel(void)
 	 * value is in the actual %rsp register.
 	 */
 	current->thread.sp = (unsigned long)temp_stack + sizeof(temp_stack);
-	smpboot_control = smp_processor_id();
+	/*
+	 * Ensure the CPU knows which one it is when it comes back, if
+	 * it isn't in parallel mode and expected to work that out for
+	 * itself.
+	 */
+	if (!(smpboot_control & STARTUP_PARALLEL_MASK))
+		smpboot_control = smp_processor_id();
 #endif
 	initial_code = (unsigned long)wakeup_long64;
 	saved_magic = 0x123456789abcdef0L;
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2380,7 +2380,7 @@ static int nr_logical_cpuids = 1;
 /*
  * Used to store mapping between logical CPU IDs and APIC IDs.
  */
-static int cpuid_to_apicid[] = {
+int cpuid_to_apicid[] = {
 	[0 ... NR_CPUS - 1] = -1,
 };
 
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -24,7 +24,9 @@
 #include "../entry/calling.h"
 #include <asm/export.h>
 #include <asm/nospec-branch.h>
+#include <asm/apicdef.h>
 #include <asm/fixmap.h>
+#include <asm/smp.h>
 
 /*
  * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
@@ -234,8 +236,68 @@ SYM_INNER_LABEL(secondary_startup_64_no_
 	ANNOTATE_NOENDBR // above
 
 #ifdef CONFIG_SMP
+	/*
+	 * For parallel boot, the APIC ID is read from the APIC, and then
+	 * used to look up the CPU number.  For booting a single CPU, the
+	 * CPU number is encoded in smpboot_control.
+	 *
+	 * Bit 31	STARTUP_READ_APICID (Read APICID from APIC)
+	 * Bit 0-23	CPU# if STARTUP_xx flags are not set
+	 */
 	movl	smpboot_control(%rip), %ecx
+	testl	$STARTUP_READ_APICID, %ecx
+	jnz	.Lread_apicid
+	/*
+	 * No control bit set, single CPU bringup. CPU number is provided
+	 * in bit 0-23. This is also the boot CPU case (CPU number 0).
+	 */
+	andl	$(~STARTUP_PARALLEL_MASK), %ecx
+	jmp	.Lsetup_cpu
+
+.Lread_apicid:
+	/* Check whether X2APIC mode is already enabled */
+	mov	$MSR_IA32_APICBASE, %ecx
+	rdmsr
+	testl	$X2APIC_ENABLE, %eax
+	jnz	.Lread_apicid_msr
+
+	/* Read the APIC ID from the fix-mapped MMIO space. */
+	movq	apic_mmio_base(%rip), %rcx
+	addq	$APIC_ID, %rcx
+	movl	(%rcx), %eax
+	shr	$24, %eax
+	jmp	.Llookup_AP
+
+.Lread_apicid_msr:
+	mov	$APIC_X2APIC_ID_MSR, %ecx
+	rdmsr
+
+.Llookup_AP:
+	/* EAX contains the APIC ID of the current CPU */
+	xorq	%rcx, %rcx
+	leaq	cpuid_to_apicid(%rip), %rbx
+
+.Lfind_cpunr:
+	cmpl	(%rbx,%rcx,4), %eax
+	jz	.Lsetup_cpu
+	inc	%ecx
+#ifdef CONFIG_FORCE_NR_CPUS
+	cmpl	$NR_CPUS, %ecx
+#else
+	cmpl	nr_cpu_ids(%rip), %ecx
+#endif
+	jb	.Lfind_cpunr
+
+	/*  APIC ID not found in the table. Drop the trampoline lock and bail. */
+	movq	trampoline_lock(%rip), %rax
+	lock
+	btrl	$0, (%rax)
+
+1:	cli
+	hlt
+	jmp	1b
 
+.Lsetup_cpu:
 	/* Get the per cpu offset for the given CPU# which is in ECX */
 	movq	__per_cpu_offset(,%rcx,8), %rdx
 #else
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1002,7 +1002,7 @@ static int do_boot_cpu(int apicid, int c
 	if (IS_ENABLED(CONFIG_X86_32)) {
 		early_gdt_descr.address = (unsigned long)get_cpu_gdt_rw(cpu);
 		initial_stack  = idle->thread.sp;
-	} else {
+	} else if (!(smpboot_control & STARTUP_PARALLEL_MASK)) {
 		smpboot_control = cpu;
 	}
 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
