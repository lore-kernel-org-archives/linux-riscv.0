Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDB5C7EE25
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 21:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=r84aORxPY+N327OvSoC/crRZiuqn4SBm1/F7p9dhccU=; b=F8oCtpJd9dhazO
	+4xJ1WnP8oLEwv05wr+FyIZE6erIS/ATj+bDdL46nrBGVlK5GSDy3evcJ/1MngTZZqPcXiKkFCDWl
	mQhN4ZjTV6oiOonvjSjlDOHDSEqIA+6oTFpcsLm8Krvh5uf5joLWaKjozEIeBpONRCTh2LOdw0vXn
	GUIZt+oj+WdsO67A8xn+LcHi4UVtnCH0AxQXapVzl2Jp08q+ZAH8o6wiDrGpJQ0umUMj8NE8fWFoy
	seGyIxMnpHeWGSmMpGHYAubUPPcaeOIUAnc3xwSqvsfraHhvTPcCEJKPzD+D4Gbou5VIJHCE4kQae
	Sp8LOHPEnFkyuBHF4XXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZze-00CzI5-0M;
	Fri, 12 May 2023 21:08:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZyt-00CyVC-0q;
	Fri, 12 May 2023 21:07:19 +0000
Message-ID: <20230512205255.981999763@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=q33LoArtTxRD/Ru/7HNy8KNvjUqDiwm6+syFdpZ/kWw=;
	b=298zc4LQSXT6SexxbOrNR+pxdBUapgKN2FhLEK6OUjzceaZSFfF3gQZ/P02XnQJKV7onMX
	G82tp6FGlvEJCHk/fYGghxxqy0XquQ6dVAokNULe1uFj1f2YvF9kZo12v5AuT4x9dpb6LM
	MIV+WOcXU9u/9w2UWdlkf7j62NoVP8gL3gHpZTNYTPR4F3tjV1vXnCvr9cNhZILyGgQ3o6
	luGpxQQIC7NP6ZTlVMhe86GpRZLF8muTdGi2x+adhcL/y1D6yQ/W8J/tsp4QGhjHHs1Kbg
	sDQlO7c/Pp6NHwxuRk82HeXQRbgkvp6C+hpt8zSSXeTW3e5BQ1ba3sKB1TDAhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=q33LoArtTxRD/Ru/7HNy8KNvjUqDiwm6+syFdpZ/kWw=;
	b=o/qZFH2k47iHoIluy2YsRj5WdNcKSir3sAheA0GheiTuEAqo2lMSo8uRRCc3N6NV3aBHkN
	EzHISfCLZ+rbXGCg==
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
 Ross Philipson <ross.philipson@oracle.com>
Subject: [patch V4 10/37] x86/smpboot: Get rid of cpu_init_secondary()
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Date: Fri, 12 May 2023 23:07:12 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_140715_612591_34D9D1D7 
X-CRM114-Status: GOOD (  16.33  )
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

The synchronization of the AP with the control CPU is a SMP boot problem
and has nothing to do with cpu_init().

Open code cpu_init_secondary() in start_secondary() and move
wait_for_master_cpu() into the SMP boot code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 arch/x86/include/asm/processor.h |    1 -
 arch/x86/kernel/cpu/common.c     |   27 ---------------------------
 arch/x86/kernel/smpboot.c        |   24 +++++++++++++++++++-----
 3 files changed, 19 insertions(+), 33 deletions(-)

--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -551,7 +551,6 @@ extern void switch_gdt_and_percpu_base(i
 extern void load_direct_gdt(int);
 extern void load_fixmap_gdt(int);
 extern void cpu_init(void);
-extern void cpu_init_secondary(void);
 extern void cpu_init_exception_handling(void);
 extern void cr4_init(void);
 
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2123,19 +2123,6 @@ static void dbg_restore_debug_regs(void)
 #define dbg_restore_debug_regs()
 #endif /* ! CONFIG_KGDB */
 
-static void wait_for_master_cpu(int cpu)
-{
-#ifdef CONFIG_SMP
-	/*
-	 * wait for ACK from master CPU before continuing
-	 * with AP initialization
-	 */
-	WARN_ON(cpumask_test_and_set_cpu(cpu, cpu_initialized_mask));
-	while (!cpumask_test_cpu(cpu, cpu_callout_mask))
-		cpu_relax();
-#endif
-}
-
 static inline void setup_getcpu(int cpu)
 {
 	unsigned long cpudata = vdso_encode_cpunode(cpu, early_cpu_to_node(cpu));
@@ -2239,8 +2226,6 @@ void cpu_init(void)
 	struct task_struct *cur = current;
 	int cpu = raw_smp_processor_id();
 
-	wait_for_master_cpu(cpu);
-
 	ucode_cpu_init(cpu);
 
 #ifdef CONFIG_NUMA
@@ -2293,18 +2278,6 @@ void cpu_init(void)
 	load_fixmap_gdt(cpu);
 }
 
-#ifdef CONFIG_SMP
-void cpu_init_secondary(void)
-{
-	/*
-	 * Relies on the BP having set-up the IDT tables, which are loaded
-	 * on this CPU in cpu_init_exception_handling().
-	 */
-	cpu_init_exception_handling();
-	cpu_init();
-}
-#endif
-
 #ifdef CONFIG_MICROCODE_LATE_LOADING
 /**
  * store_cpu_caps() - Store a snapshot of CPU capabilities
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -220,6 +220,17 @@ static void ap_calibrate_delay(void)
 	cpu_data(smp_processor_id()).loops_per_jiffy = loops_per_jiffy;
 }
 
+static void wait_for_master_cpu(int cpu)
+{
+	/*
+	 * Wait for release by control CPU before continuing with AP
+	 * initialization.
+	 */
+	WARN_ON(cpumask_test_and_set_cpu(cpu, cpu_initialized_mask));
+	while (!cpumask_test_cpu(cpu, cpu_callout_mask))
+		cpu_relax();
+}
+
 /*
  * Activate a secondary processor.
  */
@@ -237,13 +248,16 @@ static void notrace start_secondary(void
 	load_cr3(swapper_pg_dir);
 	__flush_tlb_all();
 #endif
+	cpu_init_exception_handling();
+
 	/*
-	 * Sync point with wait_cpu_initialized(). Before proceeding through
-	 * cpu_init(), the AP will call wait_for_master_cpu() which sets its
-	 * own bit in cpu_initialized_mask and then waits for the BSP to set
-	 * its bit in cpu_callout_mask to release it.
+	 * Sync point with wait_cpu_initialized(). Sets AP in
+	 * cpu_initialized_mask and then waits for the control CPU
+	 * to release it.
 	 */
-	cpu_init_secondary();
+	wait_for_master_cpu(raw_smp_processor_id());
+
+	cpu_init();
 	rcu_cpu_starting(raw_smp_processor_id());
 	x86_cpuinit.early_percpu_clock_init();
 




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
