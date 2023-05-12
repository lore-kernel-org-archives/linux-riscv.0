Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBEAC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 21:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=RRAB0Uk3kXA9aoFlb6IbQtAK3Zqxnq/+NC3KHRCL2lE=; b=l1z+VuSS0ud/Ty
	sD3K77ixSJn5N00USEbr58kvOw17BiLspX47rmFYj3ww+1ClU4UI7S3tLLDuDUqBtGvkNNw5I5iG7
	b5oSJZTKA2tCDGoGIPvUAE7TYniOJO8MP1/pT/VH68so60P2+FDbUmfMvbARoyb2pRtGmeptZTN6P
	vpQMkNvDfWBTIJKjzIeWOe5KLkcfOBjzyyyWMh0hQEoPLRsyAWguSUgV61iiEnHuCT/WGCCnVsCyk
	Ful7mWz8iki6tkcrQiwWAvVodHyFhSexli0id4L6GCr1/vZNQ78bXEkldeVQpy299AezrkKsH/t2G
	7O0tX4byz7OXLlGah2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxa2N-00D1yg-2y;
	Fri, 12 May 2023 21:10:51 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZzU-00Cz70-1Q;
	Fri, 12 May 2023 21:07:58 +0000
Message-ID: <20230512205257.240231377@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=m81D3nDf/Ldd8DuVFoioZX0PA8SIeNGwH2057r8GMno=;
	b=iJ35cdx8v18J/0cGFI4o1VXLLZdnkIko4bXOUYVtvqwDsNw74CR+LpFGs9LIoAVC3T7hi7
	dc0tRrWiWO4wC06n9RMswwP7pAMJGoUKbYcFT9fTUsgOratlkRnK2eSykPzemcWf0o70Ab
	DLVqxum0H5uEbU++/si9skYnkkYHRuLNRO4KEWLLGv/1LPbeUUCGkeVAUAWFNK6MRxw3ob
	p7jOuISbm6d1FYoaYVTrCQEtfSIvBbooWH7sIcvGmX+w76wRfVGgB55G9TZ6bM4r6Wt1KC
	sl80JEZsfrX0W0gRscaY3daheGYoOvayd+Q6CrCXuJzjI+EvpIoiXlHAST5WsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=m81D3nDf/Ldd8DuVFoioZX0PA8SIeNGwH2057r8GMno=;
	b=ir949Ub28BoYQ8jmxON50pUJUyvSlsxOkeqN/nPFkQYD7n1qCJwGDVvYILtG2SfKKh3fqI
	A90aQ1nFBaivBfAg==
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
 David Woodhouse <dwmw@amazon.co.uk>
Subject: [patch V4 33/37] cpu/hotplug: Allow "parallel" bringup up to
 CPUHP_BP_KICK_AP_STATE
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Date: Fri, 12 May 2023 23:07:50 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_140752_822564_F210C165 
X-CRM114-Status: GOOD (  24.91  )
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

There is often significant latency in the early stages of CPU bringup, and
time is wasted by waking each CPU (e.g. with SIPI/INIT/INIT on x86) and
then waiting for it to respond before moving on to the next.

Allow a platform to enable parallel setup which brings all to be onlined
CPUs up to the CPUHP_BP_KICK_AP state. While this state advancement on the
control CPU (BP) is single-threaded the important part is the last state
CPUHP_BP_KICK_AP which wakes the to be onlined CPUs up.

This allows the CPUs to run up to the first sychronization point
cpuhp_ap_sync_alive() where they wait for the control CPU to release them
one by one for the full onlining procedure.

This parallelism depends on the CPU hotplug core sync mechanism which
ensures that the parallel brought up CPUs wait for release before touching
any state which would make the CPU visible to anything outside the hotplug
control mechanism.

To handle the SMT constraints of X86 correctly the bringup happens in two
iterations when CONFIG_HOTPLUG_SMT is enabled. The control CPU brings up
the primary SMT threads of each core first, which can load the microcode
without the need to rendevouz with the thread siblings. Once that's
completed it brings up the secondary SMT threads.

Co-developed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 Documentation/admin-guide/kernel-parameters.txt |    6 +
 arch/Kconfig                                    |    4 
 include/linux/cpuhotplug.h                      |    1 
 kernel/cpu.c                                    |  103 ++++++++++++++++++++++--
 4 files changed, 109 insertions(+), 5 deletions(-)
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -838,6 +838,12 @@
 			on every CPU online, such as boot, and resume from suspend.
 			Default: 10000
 
+	cpuhp.parallel=
+			[SMP] Enable/disable parallel bringup of secondary CPUs
+			Format: <bool>
+			Default is enabled if CONFIG_HOTPLUG_PARALLEL=y. Otherwise
+			the parameter has no effect.
+
 	crash_kexec_post_notifiers
 			Run kdump after running panic-notifiers and dumping
 			kmsg. This only for the users who doubt kdump always
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -53,6 +53,10 @@ config HOTPLUG_SPLIT_STARTUP
 	bool
 	select HOTPLUG_CORE_SYNC_FULL
 
+config HOTPLUG_PARALLEL
+	bool
+	select HOTPLUG_SPLIT_STARTUP
+
 config GENERIC_ENTRY
 	bool
 
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -524,6 +524,7 @@ void cpuhp_ap_sync_alive(void);
 void arch_cpuhp_sync_state_poll(void);
 void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
 int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
+bool arch_cpuhp_init_parallel_bringup(void);
 
 #ifdef CONFIG_HOTPLUG_CORE_SYNC_DEAD
 void cpuhp_ap_report_dead(void);
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -649,8 +649,23 @@ bool cpu_smt_possible(void)
 		cpu_smt_control != CPU_SMT_NOT_SUPPORTED;
 }
 EXPORT_SYMBOL_GPL(cpu_smt_possible);
+
+static inline bool cpuhp_smt_aware(void)
+{
+	return topology_smt_supported();
+}
+
+static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
+{
+	return cpu_primary_thread_mask;
+}
 #else
 static inline bool cpu_smt_allowed(unsigned int cpu) { return true; }
+static inline bool cpuhp_smt_aware(void) { return false; }
+static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
+{
+	return cpu_present_mask;
+}
 #endif
 
 static inline enum cpuhp_state
@@ -1747,16 +1762,94 @@ int bringup_hibernate_cpu(unsigned int s
 	return 0;
 }
 
-void __init bringup_nonboot_cpus(unsigned int setup_max_cpus)
+static void __init cpuhp_bringup_mask(const struct cpumask *mask, unsigned int ncpus,
+				      enum cpuhp_state target)
 {
 	unsigned int cpu;
 
-	for_each_present_cpu(cpu) {
-		if (num_online_cpus() >= setup_max_cpus)
+	for_each_cpu(cpu, mask) {
+		struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
+
+		if (!--ncpus)
 			break;
-		if (!cpu_online(cpu))
-			cpu_up(cpu, CPUHP_ONLINE);
+
+		if (cpu_up(cpu, target) && can_rollback_cpu(st)) {
+			/*
+			 * If this failed then cpu_up() might have only
+			 * rolled back to CPUHP_BP_KICK_AP for the final
+			 * online. Clean it up. NOOP if already rolled back.
+			 */
+			WARN_ON(cpuhp_invoke_callback_range(false, cpu, st, CPUHP_OFFLINE));
+		}
+	}
+}
+
+#ifdef CONFIG_HOTPLUG_PARALLEL
+static bool __cpuhp_parallel_bringup __ro_after_init = true;
+
+static int __init parallel_bringup_parse_param(char *arg)
+{
+	return kstrtobool(arg, &__cpuhp_parallel_bringup);
+}
+early_param("cpuhp.parallel", parallel_bringup_parse_param);
+
+/*
+ * On architectures which have enabled parallel bringup this invokes all BP
+ * prepare states for each of the to be onlined APs first. The last state
+ * sends the startup IPI to the APs. The APs proceed through the low level
+ * bringup code in parallel and then wait for the control CPU to release
+ * them one by one for the final onlining procedure.
+ *
+ * This avoids waiting for each AP to respond to the startup IPI in
+ * CPUHP_BRINGUP_CPU.
+ */
+static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
+{
+	const struct cpumask *mask = cpu_present_mask;
+
+	if (__cpuhp_parallel_bringup)
+		__cpuhp_parallel_bringup = arch_cpuhp_init_parallel_bringup();
+	if (!__cpuhp_parallel_bringup)
+		return false;
+
+	if (cpuhp_smt_aware()) {
+		const struct cpumask *pmask = cpuhp_get_primary_thread_mask();
+		static struct cpumask tmp_mask __initdata;
+
+		/*
+		 * X86 requires to prevent that SMT siblings stopped while
+		 * the primary thread does a microcode update for various
+		 * reasons. Bring the primary threads up first.
+		 */
+		cpumask_and(&tmp_mask, mask, pmask);
+		cpuhp_bringup_mask(&tmp_mask, ncpus, CPUHP_BP_KICK_AP);
+		cpuhp_bringup_mask(&tmp_mask, ncpus, CPUHP_ONLINE);
+		/* Account for the online CPUs */
+		ncpus -= num_online_cpus();
+		if (!ncpus)
+			return true;
+		/* Create the mask for secondary CPUs */
+		cpumask_andnot(&tmp_mask, mask, pmask);
+		mask = &tmp_mask;
 	}
+
+	/* Bring the not-yet started CPUs up */
+	cpuhp_bringup_mask(mask, ncpus, CPUHP_BP_KICK_AP);
+	cpuhp_bringup_mask(mask, ncpus, CPUHP_ONLINE);
+	return true;
+}
+#else
+static inline bool cpuhp_bringup_cpus_parallel(unsigned int ncpus) { return false; }
+#endif /* CONFIG_HOTPLUG_PARALLEL */
+
+void __init bringup_nonboot_cpus(unsigned int setup_max_cpus)
+{
+	/* Try parallel bringup optimization if enabled */
+	if (cpuhp_bringup_cpus_parallel(setup_max_cpus))
+		return;
+
+	/* Full per CPU serialized bringup */
+	cpuhp_bringup_mask(cpu_present_mask, setup_max_cpus, CPUHP_ONLINE);
 }
 
 #ifdef CONFIG_PM_SLEEP_SMP


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
