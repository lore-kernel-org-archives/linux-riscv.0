Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEE3C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 19:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=gRbzfqS4PKs7ALg7AXAaVu7lVFl8iQh/bz8139Ymeyk=; b=Sqo0CXbN3btn12
	crew73PmY82fQE2BWtYn7DbgXMvK5qnV8bLkZTO1IcGvj9tWSCD/EeE+SqhvEn8uYnFkylQaTaJpk
	chvA8eKgNO/DJEFUp0bRERbbSotQnFyewWgJkpwm3OPA5Wld/L5FIDRHMxooqz4LkCgCZ7LTp0250
	+aU2WkNu9jit1uVG3bwR/TaS7kJ7W2jk/tghIf2A5wrKthYwCtMm7+S6FqW8FYtNLo7wdbzxHll/O
	Bs39dgWvVoaa8bbt7RKDCCYx4de0ZU0eDpjpVZmc7pwWV9FVVbp1/IRAMo7KxKlP1Nj12x9IUff+q
	LOHGM01r4ZfShLZ492Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pueoJ-008nlV-0B;
	Thu, 04 May 2023 19:40:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueoG-008nkj-21;
	Thu, 04 May 2023 19:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=F8kXoaR1nBQ6o9VxPp8Uz6U2V5tkVIrZOYAD+Uqf6yU=; b=MniihvyKlFGv2LbSgc7EJmiA/v
	HGkOOgylAwskv4RCuk2eJxtgzNH4IeIjcwLP4/0YMMXj57VScDqw8yGLcVnPKvh8f3M9RZxF4GIUH
	449wQhwZJMByKS7c6KDlR6tTAp8lx9kFuSbZROYlZ+1o2JueFgcQjOU2wIhYYPXQ1rM3pO82xY8HX
	QuWohy+BepPkCMsX8CxdvOdSc5bhkxJRpec8EynUA/hRzX16V9GuG20ekv+82bCraNhEFYXS4tgxM
	0SANLbCHQjHpXyuBn8ebMuanppUXbanqfLEv1iV/gOZ7jXCy/v56kaTpRBaJRtHcrmKAvr0xpvnZI
	naFO+Knw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueE3-001o1B-0Z;
	Thu, 04 May 2023 19:02:56 +0000
Message-ID: <20230504185937.912510359@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=F8kXoaR1nBQ6o9VxPp8Uz6U2V5tkVIrZOYAD+Uqf6yU=;
	b=FHHwtM3MehcvxyTD3IIJz8sgSlPXUlchZh7xJFV6jf2jNACHHUSgTO098Ser6A+TKYqwby
	MlO+QBW9B7CBztPuD5tg+w+tvkSrJZeyBsoOwfT3EBQQwdnjzUEH5V/q7RLkoQV5ifNNa+
	at9KsHlVkTZ1F4ajKTdjiM9iHVozExltMcmveGrXQs/fOlHDH8HgFUnTWmeo5rouQexRZ4
	Xry4XkxaL7TCkZzvLR+YbuqgPQqwNW1A3kMmXVynnWeMARwsSVesHKDo20gZt3Skv9srif
	0A1QbnYXe4Tj6Hfs/b/c+uuWIPdrOvy2KufgGEj/6EkbPvsEiWUj1xzdM/2/FQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=F8kXoaR1nBQ6o9VxPp8Uz6U2V5tkVIrZOYAD+Uqf6yU=;
	b=eKOKrA/+YsiD2CsaRIq67Pl+6fGbLOp23MnHr4M6jOIgCJwCHmPsKgxoXghxnT8I2GMUKL
	U9rUX94YG+zIxfDw==
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
Subject:  [patch V2 29/38] cpu/hotplug: Provide a split up CPUHP_BRINGUP mechanism
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:45 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_200253_033463_49D073E6 
X-CRM114-Status: GOOD (  24.33  )
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

The bring up logic of a to be onlined CPU consists of several parts, which
are considered to be a single hotplug state:

  1) Control CPU issues the wake-up

  2) To be onlined CPU starts up, does the minimal initialization,
     reports to be alive and waits for release into the complete bring-up.

  3) Control CPU waits for the alive report and releases the upcoming CPU
     for the complete bring-up.

Allow to split this into two states:

  1) Control CPU issues the wake-up

     After that the to be onlined CPU starts up, does the minimal
     initialization, reports to be alive and waits for release into the
     full bring-up. As this can run after the control CPU dropped the
     hotplug locks the code which is executed on the AP before it reports
     alive has to be carefully audited to not violate any of the hotplug
     constraints, especially not modifying any of the various cpumasks.

     This is really only meant to avoid waiting for the AP to react on the
     wake-up. Of course an architecture can move strict CPU related setup
     functionality, e.g. microcode loading, with care before the
     synchronization point to save further pointless waiting time.

  2) Control CPU waits for the alive report and releases the upcoming CPU
     for the complete bring-up.

This allows that the two states can be split up to run all to be onlined
CPUs up to state #1 on the control CPU and then at a later point run state
#2. This spares some of the latencies of the full serialized per CPU
bringup by avoiding the per CPU wakeup/wait serialization. The assumption
is that the first AP already waits when the last AP has been woken up. This
obvioulsy depends on the hardware latencies and depending on the timings
this might still not completely eliminate all wait scenarios.

This split is just a preparatory step for enabling the parallel bringup
later. The boot time bringup is still fully serialized. It has a separate
config switch so that architectures which want to support parallel bringup
can test the split of the CPUHP_BRINGUG step separately.

To enable this the architecture must support the CPU hotplug core sync
mechanism and has to be audited that there are no implicit hotplug state
dependencies which require a fully serialized bringup.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 arch/Kconfig               |    4 ++
 include/linux/cpuhotplug.h |    4 ++
 kernel/cpu.c               |   70 +++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 76 insertions(+), 2 deletions(-)
---
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -49,6 +49,10 @@ config HOTPLUG_CORE_SYNC_FULL
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select HOTPLUG_CORE_SYNC
 
+config HOTPLUG_SPLIT_STARTUP
+	bool
+	select HOTPLUG_CORE_SYNC_FULL
+
 config GENERIC_ENTRY
 	bool
 
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -133,6 +133,7 @@ enum cpuhp_state {
 	CPUHP_MIPS_SOC_PREPARE,
 	CPUHP_BP_PREPARE_DYN,
 	CPUHP_BP_PREPARE_DYN_END		= CPUHP_BP_PREPARE_DYN + 20,
+	CPUHP_BP_KICK_AP,
 	CPUHP_BRINGUP_CPU,
 
 	/*
@@ -517,9 +518,12 @@ void cpuhp_online_idle(enum cpuhp_state
 static inline void cpuhp_online_idle(enum cpuhp_state state) { }
 #endif
 
+struct task_struct;
+
 void cpuhp_ap_sync_alive(void);
 void arch_cpuhp_sync_state_poll(void);
 void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
+int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
 
 #ifdef CONFIG_HOTPLUG_CORE_SYNC_DEAD
 void cpuhp_ap_report_dead(void);
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -761,6 +761,47 @@ static int bringup_wait_for_ap_online(un
 	return 0;
 }
 
+#ifdef CONFIG_HOTPLUG_SPLIT_STARTUP
+static int cpuhp_kick_ap_alive(unsigned int cpu)
+{
+	if (!cpuhp_can_boot_ap(cpu))
+		return -EAGAIN;
+
+	return arch_cpuhp_kick_ap_alive(cpu, idle_thread_get(cpu));
+}
+
+static int cpuhp_bringup_ap(unsigned int cpu)
+{
+	struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
+	int ret;
+
+	/*
+	 * Some architectures have to walk the irq descriptors to
+	 * setup the vector space for the cpu which comes online.
+	 * Prevent irq alloc/free across the bringup.
+	 */
+	irq_lock_sparse();
+
+	ret = cpuhp_bp_sync_alive(cpu);
+	if (ret)
+		goto out_unlock;
+
+	ret = bringup_wait_for_ap_online(cpu);
+	if (ret)
+		goto out_unlock;
+
+	irq_unlock_sparse();
+
+	if (st->target <= CPUHP_AP_ONLINE_IDLE)
+		return 0;
+
+	return cpuhp_kick_ap(cpu, st, st->target);
+
+out_unlock:
+	irq_unlock_sparse();
+	return ret;
+}
+#else
 static int bringup_cpu(unsigned int cpu)
 {
 	struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
@@ -777,7 +818,6 @@ static int bringup_cpu(unsigned int cpu)
 	 */
 	irq_lock_sparse();
 
-	/* Arch-specific enabling code. */
 	ret = __cpu_up(cpu, idle);
 	if (ret)
 		goto out_unlock;
@@ -801,6 +841,7 @@ static int bringup_cpu(unsigned int cpu)
 	irq_unlock_sparse();
 	return ret;
 }
+#endif
 
 static int finish_cpu(unsigned int cpu)
 {
@@ -1940,13 +1981,38 @@ static struct cpuhp_step cpuhp_hp_states
 		.startup.single		= timers_prepare_cpu,
 		.teardown.single	= timers_dead_cpu,
 	},
-	/* Kicks the plugged cpu into life */
+
+#ifdef CONFIG_HOTPLUG_SPLIT_STARTUP
+	/*
+	 * Kicks the AP alive. AP will wait in cpuhp_ap_sync_alive() until
+	 * the next step will release it.
+	 */
+	[CPUHP_BP_KICK_AP] = {
+		.name			= "cpu:kick_ap",
+		.startup.single		= cpuhp_kick_ap_alive,
+	},
+
+	/*
+	 * Waits for the AP to reach cpuhp_ap_sync_alive() and then
+	 * releases it for the complete bringup.
+	 */
+	[CPUHP_BRINGUP_CPU] = {
+		.name			= "cpu:bringup",
+		.startup.single		= cpuhp_bringup_ap,
+		.teardown.single	= finish_cpu,
+		.cant_stop		= true,
+	},
+#else
+	/*
+	 * All-in-one CPU bringup state which includes the kick alive.
+	 */
 	[CPUHP_BRINGUP_CPU] = {
 		.name			= "cpu:bringup",
 		.startup.single		= bringup_cpu,
 		.teardown.single	= finish_cpu,
 		.cant_stop		= true,
 	},
+#endif
 	/* Final state before CPU kills itself */
 	[CPUHP_AP_IDLE_DEAD] = {
 		.name			= "idle:dead",


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
