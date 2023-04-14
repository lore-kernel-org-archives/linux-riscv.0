Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB71C77B72
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=tI36O0Jt37p19OX+IqkXT21rpRIxKnDqMijLTozyjZg=; b=czLE/WbW1aBmlN
	xj0wjrQ3ddD523xlA0mTl6BvO9uwqKbhYVuA3ae90WxrMSgVM64czJGCDIK82Bdpatga2y7zqSwCY
	bcitmXMaGFG6024td3mvU7jzS1pm7VaESPQNPOE5LvUS9bxJ7g5PdpH1MNqj4sQcyhQ1NW9MdQ0XG
	g+J3m+3ZCcOugnBTtVwc+QANS1ptEjxWaBZ9Eug8h1bL5xPJB/NJTf0z8mJNCZOvzlaLlzna0A8kI
	kEctphviyfNOMlLASo7nEPw3ZR+RE0hcLE/HLTPNRwZCDCfcOqBuX1gS2EUS37g1drBcS65bQLCT0
	qPj20tyx3CWuILGtzHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnTBV-00ApSj-1R;
	Fri, 14 Apr 2023 23:50:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT6Q-00Aknp-28;
	Fri, 14 Apr 2023 23:45:23 +0000
Message-ID: <20230414232311.441918776@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=6cGHgynMBCaHRwYTrISGgGUY8IfBttwd4gSW6/8ncwo=;
	b=Y6MvVoIRD+b308pDJWowuLkJP8xTk8BgVllbAchtET5SCLxH3pPaTbpOYvBSvJgt29AjQn
	ezcDEAwpvw4go5HJCn0jDdZCGPT9MLW24qpZKb8kz2KJNNnr6JcyXOPyaUGlM/ANv9N+fq
	tuEJRuRxzNty3GrkhGsgHYpRhP/0DX3AEiMTFdAHD/hkrve/Z/OGirQHyoZehUi+ZLj2of
	nh0+zW/XB9E47Zv4MWfj7UgDu31M48dyxxMexXPIhf0Fh2Xfz56PypK/Z4RNZ1QuLpDfkl
	MzM4X40h1quxb59BK38sroOGy3J6fRyyYS1Nn/XWNH7x+1QZ0XFumeRWVGSB2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=6cGHgynMBCaHRwYTrISGgGUY8IfBttwd4gSW6/8ncwo=;
	b=62z6QxHlYDjrTs4WKqbuHCfVc8G+x+AUIAn0i55mZeGFgkDCFd3an/Sr2oboSn6ZUcOcEh
	Lf1/KZWBw97ffRDQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 "Arjan van de Veen" <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
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
 Sabin Rapan <sabrapan@amazon.com>
Subject: [patch 36/37] x86/smpboot/64: Implement
 arch_cpuhp_init_parallel_bringup() and enable it
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:45:12 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164515_045206_EBA12098 
X-CRM114-Status: GOOD (  15.69  )
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

Implement the validation function which tells the core code whether
parallel bringup is possible:

  1) Valid CPUID leaf for APIC ID retrieval. For non x2APIC systmms leaf
     0x1 is sufficient, otherwise leaf 0xb or 0x1f must be available.

  2) Prevent parallel bringup on encrypted guests as this requires a
     different handling of the CPUID leaf retrieval via a call into the
     trusted firmware module. This is what the #VC trap handler does later
     on, which is not available during the very early startup.

Originally-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/Kconfig             |    3 +-
 arch/x86/kernel/cpu/common.c |    6 -----
 arch/x86/kernel/smpboot.c    |   49 +++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 50 insertions(+), 8 deletions(-)

--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -272,8 +272,9 @@ config X86
 	select HAVE_UNSTABLE_SCHED_CLOCK
 	select HAVE_USER_RETURN_NOTIFIER
 	select HAVE_GENERIC_VDSO
+	select HOTPLUG_PARALLEL			if SMP && X86_64
 	select HOTPLUG_SMT			if SMP
-	select HOTPLUG_SPLIT_STARTUP		if SMP
+	select HOTPLUG_SPLIT_STARTUP		if SMP && X86_32
 	select IRQ_FORCED_THREADING
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2127,11 +2127,7 @@ static inline void setup_getcpu(int cpu)
 }
 
 #ifdef CONFIG_X86_64
-static inline void ucode_cpu_init(int cpu)
-{
-	if (cpu)
-		load_ucode_ap();
-}
+static inline void ucode_cpu_init(int cpu) { }
 
 static inline void tss_setup_ist(struct tss_struct *tss)
 {
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -58,6 +58,7 @@
 #include <linux/overflow.h>
 #include <linux/stackprotector.h>
 #include <linux/cpuhotplug.h>
+#include <linux/mc146818rtc.h>
 
 #include <asm/acpi.h>
 #include <asm/cacheinfo.h>
@@ -75,7 +76,7 @@
 #include <asm/fpu/api.h>
 #include <asm/setup.h>
 #include <asm/uv/uv.h>
-#include <linux/mc146818rtc.h>
+#include <asm/microcode.h>
 #include <asm/i8259.h>
 #include <asm/misc.h>
 #include <asm/qspinlock.h>
@@ -128,7 +129,6 @@ int arch_update_cpu_topology(void)
 	return retval;
 }
 
-
 static unsigned int smpboot_warm_reset_vector_count;
 
 static inline void smpboot_setup_warm_reset_vector(unsigned long start_eip)
@@ -247,6 +247,8 @@ static void notrace start_secondary(void
 #endif
 	cpu_init_exception_handling();
 
+	load_ucode_ap();
+
 	/*
 	 * Sync point with the hotplug core. Sets the sync state to ALIVE
 	 * and waits for the control CPU to release it.
@@ -1251,6 +1253,49 @@ void __init smp_prepare_cpus_common(void
 	set_cpu_sibling_map(0);
 }
 
+#ifdef CONFIG_X86_64
+/* Establish whether parallel bringup can be supported. */
+bool __init arch_cpuhp_init_parallel_bringup(void)
+{
+	unsigned int ctrl;
+
+	if (boot_cpu_data.cpuid_level < 0x01) {
+		pr_info("Parallel CPU startup disabled due to lack of CPUID\n");
+		return false;
+	}
+
+	/* Encrypted guests require special CPUID handling. */
+	if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT)) {
+		pr_info("Parallel CPU startup disabled due to guest state encryption\n");
+		return false;
+	}
+
+	switch (topology_extended_leaf) {
+	case 0x0b:
+		ctrl = STARTUP_APICID_CPUID_0B;
+		break;
+	case 0x1f:
+		ctrl = STARTUP_APICID_CPUID_1F;
+		break;
+	case 0x00:
+		/* For !x2APIC mode 8 bits from leaf 0x01 are sufficient. */
+		if (!x2apic_mode) {
+			ctrl = STARTUP_APICID_CPUID_01;
+			break;
+		}
+		fallthrough;
+	default:
+		pr_info("Parallel CPU startup disabled. Unsupported topology leaf %u\n",
+			topology_extended_leaf);
+		return false;
+	}
+
+	pr_debug("Parallel CPU startup enabled: 0x%08x\n", ctrl);
+	smpboot_control = ctrl;
+	return true;
+}
+#endif
+
 /*
  * Prepare for SMP bootup.
  * @max_cpus: configured maximum number of CPUs, It is a legacy parameter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
