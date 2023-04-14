Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D467C77B71
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=0RUyI525KEXmbRKB1PLJ11OmH24CwrMXS4ZDEyr6qEk=; b=kR2js2gUvdNZir
	A+nbfGR4kLlKt5vStoHTy8Kj2VTlVhPXubOa/ArCAVBNFJCvG5psbdCzqLCUFY8J+iKRLVBECIH7X
	usEjP+T1meBypWxAf+/gEEJV70TH9tIkmp3OibEnH7qrgWSEBRuyz4ZTyv2bplMlWFCmsKJoG+za/
	fhbB/jlUaRz+TQ0z2sBCkDxD0krY5j97ZwLi/tEdiUFn9FFPW9GUC4BaU35h3aAqEi2haWsKiYvX1
	KuxQfh59RmYseMieWaGtFlPObJ3eH1dNV8Ns99XWk+EMCfdwiZaXp4ZYkRxSnPC+bCqILWkXIWcux
	A2vvy2nc2qur5qMHu1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT9Z-00AnZD-2O;
	Fri, 14 Apr 2023 23:48:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT63-00AkQv-1d;
	Fri, 14 Apr 2023 23:44:56 +0000
Message-ID: <20230414232310.569498144@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=dAqk1yNFRcZF7qilzpcfVR/70NZ8+F/SNrVuS7Hd0dk=;
	b=AU6aWn3llfgN87vGRPuEWQIrjtTFwK3yn2f2vw94yybrTzt5H4LRbc91tm1Xw3BwSnq5hP
	rQmL01eHYwGuD/tJ0f+L2+Oe406bYjAoY3D+heXxkuTKO7KuUfo+Vs6B1IlkwX6ZMSgfKv
	MeC7l/ITcGbKIYw5eRyObkCJegLxrMXZzPk/rNGf+zutst2sEf6AX47fGrPZphUN9CnuIP
	6Hqq0/37hmlZ5Bbfm3XWsFI3yH4n+lXK8uvrCVgYW4m/9hcfQmz9XLNpsQ2ZNbshSo8dWB
	0ORFcD1Xi54QY+d+vfpgXIdhI1e6dB7Jux3a2oBfTKMsXcUuUQI04NVVQTd0zA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=dAqk1yNFRcZF7qilzpcfVR/70NZ8+F/SNrVuS7Hd0dk=;
	b=9EnFpcJNs8EwCrNKZip93QB/LFNFkvbQArfrS6NvwMyIg/IEdfp5AE2HOIUr5Sp+QKyDnB
	/vmf1BkRatgvPdDA==
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 David Woodhouse <dwmw@amazon.co.uk>,
 Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
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
Subject:  [patch 22/37] arm64: smp: Switch to hotplug core state synchronization
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:44:49 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164451_713735_6599F4D9 
X-CRM114-Status: GOOD (  12.58  )
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

Switch to the CPU hotplug core state tracking and synchronization
mechanim. No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/Kconfig           |    1 +
 arch/arm64/include/asm/smp.h |    2 +-
 arch/arm64/kernel/smp.c      |   14 +++++---------
 3 files changed, 7 insertions(+), 10 deletions(-)

--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -216,6 +216,7 @@ config ARM64
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_GENERIC_VDSO
+	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select KASAN_VMALLOC if KASAN
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -99,7 +99,7 @@ static inline void arch_send_wakeup_ipi_
 
 extern int __cpu_disable(void);
 
-extern void __cpu_die(unsigned int cpu);
+static inline void __cpu_die(unsigned int cpu) { }
 extern void cpu_die(void);
 extern void cpu_die_early(void);
 
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -333,17 +333,13 @@ static int op_cpu_kill(unsigned int cpu)
 }
 
 /*
- * called on the thread which is asking for a CPU to be shutdown -
- * waits until shutdown has completed, or it is timed out.
+ * Called on the thread which is asking for a CPU to be shutdown after the
+ * shutdown completed.
  */
-void __cpu_die(unsigned int cpu)
+void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 {
 	int err;
 
-	if (!cpu_wait_death(cpu, 5)) {
-		pr_crit("CPU%u: cpu didn't die\n", cpu);
-		return;
-	}
 	pr_debug("CPU%u: shutdown\n", cpu);
 
 	/*
@@ -370,8 +366,8 @@ void cpu_die(void)
 
 	local_daif_mask();
 
-	/* Tell __cpu_die() that this CPU is now safe to dispose of */
-	(void)cpu_report_death();
+	/* Tell cpuhp_bp_sync_dead() that this CPU is now safe to dispose of */
+	cpuhp_ap_report_dead();
 
 	/*
 	 * Actually shutdown the CPU. This must never fail. The specific hotplug


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
