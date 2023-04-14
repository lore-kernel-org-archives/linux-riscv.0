Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5D0C77B72
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=SgWAUGeqebhU6WdXB/8YPkRs7iS2/moVNQhfwZSrIlI=; b=KwM0Rsc3e0nlTH
	Bxr5XDKcKJXDhAeD6uxjjs0TWOnH0At9ZLp7i4LdbHtF46D0UzJ9ybxsxU6UGRI19InodcmBQgzMU
	PR/dkQdm7g5cuhTsAY1pzLZ0cgKocElny/FbdKYA/MXBQ0X+yqI6Nv4ZQtKrhbvzsGuTwQxeu2oxO
	g0BmscTkYB6/D8b0MxuaKAZRolvyUrMaxW8ejnFxoOShyu6kCBOohKvTSe2a6wMoXbNqA2vrUuASq
	+3J1YSS0+C1Bnl78cLvh+9jjTTHeCuqFISpur0IBfFtWaBxFIMFv00GQuSxHUDyXiaLuasnp4F1aG
	SFGt0n8MjIEY0xb8RePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT66-00AkTp-0o;
	Fri, 14 Apr 2023 23:44:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT5g-00Ak4f-1I;
	Fri, 14 Apr 2023 23:44:30 +0000
Message-ID: <20230414232309.697634212@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=1Wi+qwoi+evP9/DCOV2cSOOVm8Cmr+iaowZLI6jmphg=;
	b=AtRfJAw/8dYgxzfcjPmLpOmGdUx0vCx8DqJiiMUmA3Cx+ZLSfVD8knv2kLNlnnW0M6wLbC
	T2QMHllGrZw7clK5/9Izh2AsnDdOvwLy0I4V80idxIhDm2+ZbZDLAikAULtI4e2AXQKPJr
	hBN5Y+KDw8n4D6Q1OvfiiBRG0iaAfEdsTfZ4cQweomKAopqUvixONL5zoVls1tMNAxyOEc
	sq7MkdcHTAZO6XblFcZcs66KyhWSvsJm9iqyZTxzUjsNnLQXic0xapY2RzQ/O/jDEPsPId
	R7R0FelILdrBFPupQz1xDszAcoMcHcibu8KNFeW7JRloBkiOApBN6zt3RCxP6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=1Wi+qwoi+evP9/DCOV2cSOOVm8Cmr+iaowZLI6jmphg=;
	b=erfBajWkK4A2wOU949cIjl3VUhIAl2v89iiOuXqsNlKDnlt3hip7OcUwwjvwGRE24kiwsr
	gNkbbyv7cvDgLNDA==
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
Subject: [patch 08/37] x86/smpboot: Split up native_cpu_up() into separate
 phases and document them
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:44:26 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164428_727093_2B81A0DE 
X-CRM114-Status: GOOD (  23.69  )
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

There are four logical parts to what native_cpu_up() does on the BSP (or
on the controlling CPU for a later hotplug):

 1) Wake the AP by sending the INIT/SIPI/SIPI sequence.

 2) Wait for the AP to make it as far as wait_for_master_cpu() which
    sets that CPU's bit in cpu_initialized_mask, then sets the bit in
    cpu_callout_mask to let the AP proceed through cpu_init().

 3) Wait for the AP to finish cpu_init() and get as far as the
    smp_callin() call, which sets that CPU's bit in cpu_callin_mask.

 4) Perform the TSC synchronization and wait for the AP to actually
    mark itself online in cpu_online_mask.

In preparation to allow these phases to operate in parallel on multiple
APs, split them out into separate functions and document the interactions
a little more clearly in both the BP and AP code paths.

No functional change intended.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Usama Arif <usama.arif@bytedance.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/smpboot.c |  187 +++++++++++++++++++++++++++++-----------------
 1 file changed, 121 insertions(+), 66 deletions(-)

--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -193,6 +193,10 @@ static void smp_callin(void)
 
 	wmb();
 
+	/*
+	 * This runs the AP through all the cpuhp states to its target
+	 * state (CPUHP_ONLINE in the case of serial bringup).
+	 */
 	notify_cpu_starting(cpuid);
 
 	/*
@@ -233,14 +237,31 @@ static void notrace start_secondary(void
 	load_cr3(swapper_pg_dir);
 	__flush_tlb_all();
 #endif
+	/*
+	 * Sync point with wait_cpu_initialized(). Before proceeding through
+	 * cpu_init(), the AP will call wait_for_master_cpu() which sets its
+	 * own bit in cpu_initialized_mask and then waits for the BSP to set
+	 * its bit in cpu_callout_mask to release it.
+	 */
 	cpu_init_secondary();
 	rcu_cpu_starting(raw_smp_processor_id());
 	x86_cpuinit.early_percpu_clock_init();
+
+	/*
+	 * Sync point with wait_cpu_callin(). The AP doesn't wait here
+	 * but just sets the bit to let the controlling CPU (BSP) know that
+	 * it's got this far.
+	 */
 	smp_callin();
 
-	/* otherwise gcc will move up smp_processor_id before the cpu_init */
+	/* Otherwise gcc will move up smp_processor_id() before cpu_init() */
 	barrier();
-	/* Check TSC synchronization with the control CPU: */
+
+	/*
+	 * Check TSC synchronization with the control CPU, which will do
+	 * its part of this from wait_cpu_online(), making it an implicit
+	 * synchronization point.
+	 */
 	check_tsc_sync_target();
 
 	/*
@@ -259,6 +280,7 @@ static void notrace start_secondary(void
 	 * half valid vector space.
 	 */
 	lock_vector_lock();
+	/* Sync point with do_wait_cpu_online() */
 	set_cpu_online(smp_processor_id(), true);
 	lapic_online();
 	unlock_vector_lock();
@@ -981,17 +1003,13 @@ int common_cpu_up(unsigned int cpu, stru
 /*
  * NOTE - on most systems this is a PHYSICAL apic ID, but on multiquad
  * (ie clustered apic addressing mode), this is a LOGICAL apic ID.
- * Returns zero if CPU booted OK, else error code from
+ * Returns zero if startup was successfully sent, else error code from
  * ->wakeup_secondary_cpu.
  */
 static int do_boot_cpu(int apicid, int cpu, struct task_struct *idle)
 {
-	/* start_ip had better be page-aligned! */
 	unsigned long start_ip = real_mode_header->trampoline_start;
 
-	unsigned long boot_error = 0;
-	unsigned long timeout;
-
 #ifdef CONFIG_X86_64
 	/* If 64-bit wakeup method exists, use the 64-bit mode trampoline IP */
 	if (apic->wakeup_secondary_cpu_64)
@@ -1048,60 +1066,89 @@ static int do_boot_cpu(int apicid, int c
 	 * - Use an INIT boot APIC message
 	 */
 	if (apic->wakeup_secondary_cpu_64)
-		boot_error = apic->wakeup_secondary_cpu_64(apicid, start_ip);
+		return apic->wakeup_secondary_cpu_64(apicid, start_ip);
 	else if (apic->wakeup_secondary_cpu)
-		boot_error = apic->wakeup_secondary_cpu(apicid, start_ip);
-	else
-		boot_error = wakeup_secondary_cpu_via_init(apicid, start_ip);
+		return apic->wakeup_secondary_cpu(apicid, start_ip);
 
-	if (!boot_error) {
-		/*
-		 * Wait 10s total for first sign of life from AP
-		 */
-		boot_error = -1;
-		timeout = jiffies + 10*HZ;
-		while (time_before(jiffies, timeout)) {
-			if (cpumask_test_cpu(cpu, cpu_initialized_mask)) {
-				/*
-				 * Tell AP to proceed with initialization
-				 */
-				cpumask_set_cpu(cpu, cpu_callout_mask);
-				boot_error = 0;
-				break;
-			}
-			schedule();
-		}
-	}
+	return wakeup_secondary_cpu_via_init(apicid, start_ip);
+}
 
-	if (!boot_error) {
-		/*
-		 * Wait till AP completes initial initialization
-		 */
-		while (!cpumask_test_cpu(cpu, cpu_callin_mask)) {
-			/*
-			 * Allow other tasks to run while we wait for the
-			 * AP to come online. This also gives a chance
-			 * for the MTRR work(triggered by the AP coming online)
-			 * to be completed in the stop machine context.
-			 */
-			schedule();
-		}
-	}
+static int wait_cpu_cpumask(unsigned int cpu, const struct cpumask *mask)
+{
+	unsigned long timeout;
 
-	if (x86_platform.legacy.warm_reset) {
-		/*
-		 * Cleanup possible dangling ends...
-		 */
-		smpboot_restore_warm_reset_vector();
+	/*
+	 * Wait up to 10s for the CPU to report in.
+	 */
+	timeout = jiffies + 10*HZ;
+	while (time_before(jiffies, timeout)) {
+		if (cpumask_test_cpu(cpu, mask))
+			return 0;
+
+		schedule();
 	}
+	return -1;
+}
 
-	return boot_error;
+/*
+ * Bringup step two: Wait for the target AP to reach cpu_init_secondary()
+ * and thus wait_for_master_cpu(), then set cpu_callout_mask to allow it
+ * to proceed.  The AP will then proceed past setting its 'callin' bit
+ * and end up waiting in check_tsc_sync_target() until we reach
+ * do_wait_cpu_online() to tend to it.
+ */
+static int wait_cpu_initialized(unsigned int cpu)
+{
+	/*
+	 * Wait for first sign of life from AP.
+	 */
+	if (wait_cpu_cpumask(cpu, cpu_initialized_mask))
+		return -1;
+
+	cpumask_set_cpu(cpu, cpu_callout_mask);
+	return 0;
 }
 
-int native_cpu_up(unsigned int cpu, struct task_struct *tidle)
+/*
+ * Bringup step three: Wait for the target AP to reach smp_callin().
+ * The AP is not waiting for us here so we don't need to parallelise
+ * this step. Not entirely clear why we care about this, since we just
+ * proceed directly to TSC synchronization which is the next sync
+ * point with the AP anyway.
+ */
+static void wait_cpu_callin(unsigned int cpu)
+{
+	while (!cpumask_test_cpu(cpu, cpu_callin_mask))
+		schedule();
+}
+
+/*
+ * Bringup step four: Synchronize the TSC and wait for the target AP
+ * to reach set_cpu_online() in start_secondary().
+ */
+static void wait_cpu_online(unsigned int cpu)
 {
-	int apicid = apic->cpu_present_to_apicid(cpu);
 	unsigned long flags;
+
+	/*
+	 * Check TSC synchronization with the AP (keep irqs disabled
+	 * while doing so):
+	 */
+	local_irq_save(flags);
+	check_tsc_sync_source(cpu);
+	local_irq_restore(flags);
+
+	/*
+	 * Wait for the AP to mark itself online, so the core caller
+	 * can drop sparse_irq_lock.
+	 */
+	while (!cpu_online(cpu))
+		schedule();
+}
+
+static int native_kick_ap(unsigned int cpu, struct task_struct *tidle)
+{
+	int apicid = apic->cpu_present_to_apicid(cpu);
 	int err;
 
 	lockdep_assert_irqs_enabled();
@@ -1142,25 +1189,33 @@ int native_cpu_up(unsigned int cpu, stru
 		return err;
 
 	err = do_boot_cpu(apicid, cpu, tidle);
-	if (err) {
+	if (err)
 		pr_err("do_boot_cpu failed(%d) to wakeup CPU#%u\n", err, cpu);
-		return err;
-	}
 
-	/*
-	 * Check TSC synchronization with the AP (keep irqs disabled
-	 * while doing so):
-	 */
-	local_irq_save(flags);
-	check_tsc_sync_source(cpu);
-	local_irq_restore(flags);
+	return err;
+}
 
-	while (!cpu_online(cpu)) {
-		cpu_relax();
-		touch_nmi_watchdog();
-	}
+int native_cpu_up(unsigned int cpu, struct task_struct *tidle)
+{
+	int ret;
 
-	return 0;
+	ret = native_kick_ap(cpu, tidle);
+	if (ret)
+		goto out;
+
+	ret = wait_cpu_initialized(cpu);
+	if (ret)
+		goto out;
+
+	wait_cpu_callin(cpu);
+	wait_cpu_online(cpu);
+
+out:
+	/* Cleanup possible dangling ends... */
+	if (x86_platform.legacy.warm_reset)
+		smpboot_restore_warm_reset_vector();
+
+	return ret;
 }
 
 /**


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
