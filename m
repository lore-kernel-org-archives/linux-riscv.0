Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B6AC7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 19:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=8DVjUdIzGwllIRxuQXJLY87SdrPwRybpI2zZmtmXjN0=; b=l6NYirwTkdP6nL
	cAOL0EtckAmgrXnCnf6PVOU5vowqyy7sxXhwUv96XMPmnszbgo6pxG6Gze3gF/CSJSOxw7zFOddyM
	b0Qvk1dABETuCpgS1WZ8rSoBTmk7i516PkaEexDWT8pRRxuPVsqRizZIfHxQv6Lf8Xq+MUehDGMNE
	M7ragni0mc/mpAUBnZci4P6qIePm8jlI7mm80HyaB2EjI7IRFx68p2UzvMZ2y2u2gdJgmaMI5PYRe
	0xn/n/fKKfFpYw2m2etUX2855cHb8kfejGwPsS0g7Qqu66s7pOEIARBglVqvxaIFtfe5LA00IS3Ps
	JaZbqnd/bEfcFdZeLqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pueF5-008fFw-2h;
	Thu, 04 May 2023 19:03:51 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueDq-008djT-0q;
	Thu, 04 May 2023 19:02:37 +0000
Message-ID: <20230504185937.477649111@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=J5ghl8+CFsq8rw8xRo6ZeJvRj8tj82GRgWZ3Thf5XTs=;
	b=QenhqFcoejPtec/MlD+hqV1n9MlgT2acU00U3XD2Oc1Pol7q/9eI63VtS15ZCC/d+9WDGA
	KxchOK615tOJzZsBewTOkPd1Jd5+B3is2a42u/N5CTkPLatyJZrrvz8FEIqC7XWO8in3oU
	53hbjDByv1h2xPpYpva0v6RgjUscQ2HfSl/jqKFOass4OpUQpzxo6UHcGhtLw9087/2M+Z
	tt8EMVFZ49ggeVcETqNdsJDpa2BsXfwNUKKIIKpi+M53OvsvG9KFTR5Ffn+WK+321Pqy5y
	ZzdinLtGlwMYQuT48xSu+HgHHks4RytPcjC2QUYQ0+Ziux8bRvvTSEM3m/LHVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=J5ghl8+CFsq8rw8xRo6ZeJvRj8tj82GRgWZ3Thf5XTs=;
	b=jA8uBZa7TYtw4jZ6vKFGruDR2mfnjcH3f8p0I307i2kdUOd1y2C6N6fsUQhyOplmByw+pg
	yUiP5bOguA/FxuBw==
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
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject:  [patch V2 21/38] ARM: smp: Switch to hotplug core state synchronization
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:32 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_120234_499766_510ADD73 
X-CRM114-Status: GOOD (  14.96  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Switch to the CPU hotplug core state tracking and synchronization
mechanim. No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org

---
 arch/arm/Kconfig           |    1 +
 arch/arm/include/asm/smp.h |    2 +-
 arch/arm/kernel/smp.c      |   18 +++++++-----------
 3 files changed, 9 insertions(+), 12 deletions(-)
---
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -124,6 +124,7 @@ config ARM
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
 	select HAVE_VIRT_CPU_ACCOUNTING_GEN
+	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_FORCED_THREADING
 	select MODULES_USE_ELF_REL
 	select NEED_DMA_MAP_STATE
--- a/arch/arm/include/asm/smp.h
+++ b/arch/arm/include/asm/smp.h
@@ -64,7 +64,7 @@ extern void secondary_startup_arm(void);
 
 extern int __cpu_disable(void);
 
-extern void __cpu_die(unsigned int cpu);
+static inline void __cpu_die(unsigned int cpu) { }
 
 extern void arch_send_call_function_single_ipi(int cpu);
 extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -288,15 +288,11 @@ int __cpu_disable(void)
 }
 
 /*
- * called on the thread which is asking for a CPU to be shutdown -
- * waits until shutdown has completed, or it is timed out.
+ * called on the thread which is asking for a CPU to be shutdown after the
+ * shutdown completed.
  */
-void __cpu_die(unsigned int cpu)
+void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 {
-	if (!cpu_wait_death(cpu, 5)) {
-		pr_err("CPU%u: cpu didn't die\n", cpu);
-		return;
-	}
 	pr_debug("CPU%u: shutdown\n", cpu);
 
 	clear_tasks_mm_cpumask(cpu);
@@ -336,11 +332,11 @@ void __noreturn arch_cpu_idle_dead(void)
 	flush_cache_louis();
 
 	/*
-	 * Tell __cpu_die() that this CPU is now safe to dispose of.  Once
-	 * this returns, power and/or clocks can be removed at any point
-	 * from this CPU and its cache by platform_cpu_kill().
+	 * Tell cpuhp_bp_sync_dead() that this CPU is now safe to dispose
+	 * of. Once this returns, power and/or clocks can be removed at
+	 * any point from this CPU and its cache by platform_cpu_kill().
 	 */
-	(void)cpu_report_death();
+	cpuhp_ap_report_dead();
 
 	/*
 	 * Ensure that the cache lines associated with that completion are


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
