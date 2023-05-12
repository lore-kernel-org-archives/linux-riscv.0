Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B270C7EE43
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 21:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=CGo55RlwapT+uS13vyoOv9gDec+KWT61XUaAks+OEbw=; b=TFcyA4NUjuKI4y
	VIp9xqnmDiKFIUngDElBBVSlxg3SZe3DzfcJitAIy+O2EwS93DL8UQ+hlByJ+fjDjr6raX59CR9S1
	Vhf5SuDbWV230rcc9+2IT5xAbuKNURzZM9AvKSVMTghdnGXX4MIKwdf+ecyMFdytLocDds6uWnZZB
	CoXzV0M7DVXaxJGmnU+deIz1BedDezldjTybausPnnsGS+D86ltbZA6tJQNyALobi9cK1gs6kIZi3
	64XJnquAkhp3g+lhBFkEiOEvOxtN9GbBjCiiVdMuNcjMkgPbEGqMHTNKWs4ePOMcfjFdGh/qleAIf
	pLvKM+AqVUUgfHKlVRWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxa1i-00D1IA-1U;
	Fri, 12 May 2023 21:10:10 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZzK-00CyuB-0k;
	Fri, 12 May 2023 21:07:44 +0000
Message-ID: <20230512205256.916055844@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=3WyGAeXCoINo+ZjbtqDSmG4Uv4XxBoW1eRT13EQq0fk=;
	b=gCuo784jqFHJl8ajBn8394w4OmHWarWHua689soLfocU0hu6yonNTwuMrKteuZS5UiIuEV
	qrcv15f4Q6TokbWN0YfdK3MSd6z8xiHfnEZzev7CF61wRptMWuiL7c2cva2fdafmy4x44i
	QLCrGnHJHlwNB/wrQX3E9sCIWLmnibPYc8f6Fvn0Mhtkx8DzedCkReA25Zy2fK9LabrFWb
	x1UPFk0hgEJqdWWpnRwgFxJ1i3v5p9suQyaN5MHQM1jUq9DQq3rPXVvibiH0XDHv/RMwo0
	mWl2Aksb+Mjpq0yv8/Ii5IfUB3vzQQo6B2UpFf/trJXJtP52QvDOQWDArAV10Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=3WyGAeXCoINo+ZjbtqDSmG4Uv4XxBoW1eRT13EQq0fk=;
	b=LWXqEciaP4I0I25ywyzxuHHtRRVAY1D7DccVqnOk2GJSZvUntz/BBxlff7vjipNfXjw8l7
	MDKU/BWHM78qyUDA==
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
 Ross Philipson <ross.philipson@oracle.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: [patch V4 27/37] riscv: Switch to hotplug core state synchronization
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Date: Fri, 12 May 2023 23:07:40 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_140742_436022_426FA7C5 
X-CRM114-Status: GOOD (  15.14  )
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
Tested-by: Michael Kelley <mikelley@microsoft.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Kconfig              |    1 +
 arch/riscv/include/asm/smp.h    |    2 +-
 arch/riscv/kernel/cpu-hotplug.c |   14 +++++++-------
 3 files changed, 9 insertions(+), 8 deletions(-)
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -122,6 +122,7 @@ config RISCV
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select KASAN_VMALLOC if KASAN
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -70,7 +70,7 @@ asmlinkage void smp_callin(void);
 
 #if defined CONFIG_HOTPLUG_CPU
 int __cpu_disable(void);
-void __cpu_die(unsigned int cpu);
+static inline void __cpu_die(unsigned int cpu) { }
 #endif /* CONFIG_HOTPLUG_CPU */
 
 #else
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -8,6 +8,7 @@
 #include <linux/sched.h>
 #include <linux/err.h>
 #include <linux/irq.h>
+#include <linux/cpuhotplug.h>
 #include <linux/cpu.h>
 #include <linux/sched/hotplug.h>
 #include <asm/irq.h>
@@ -49,17 +50,15 @@ int __cpu_disable(void)
 	return ret;
 }
 
+#ifdef CONFIG_HOTPLUG_CPU
 /*
- * Called on the thread which is asking for a CPU to be shutdown.
+ * Called on the thread which is asking for a CPU to be shutdown, if the
+ * CPU reported dead to the hotplug core.
  */
-void __cpu_die(unsigned int cpu)
+void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 {
 	int ret = 0;
 
-	if (!cpu_wait_death(cpu, 5)) {
-		pr_err("CPU %u: didn't die\n", cpu);
-		return;
-	}
 	pr_notice("CPU%u: off\n", cpu);
 
 	/* Verify from the firmware if the cpu is really stopped*/
@@ -76,9 +75,10 @@ void __noreturn arch_cpu_idle_dead(void)
 {
 	idle_task_exit();
 
-	(void)cpu_report_death();
+	cpuhp_ap_report_dead();
 
 	cpu_ops[smp_processor_id()]->cpu_stop();
 	/* It should never reach here */
 	BUG();
 }
+#endif




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
