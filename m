Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5B9C7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=mAvKo3T4houR6OtL38CvAQ+O0mQ6vfsOvXz9GESgE5o=; b=oJVibzDA6VJN80
	A4MAQirh8P7oM7C510X3bp1g5CKPL4ri1UzlXnEDntilQkeKroXYI5G4kkWU2Wo3xnLeN2fTf91qB
	ZMblmklQz0ri+vbI3VjuWuSsXKz5ZXeCp2+Uh/2Pae75zkT19wLht2iv5lJl81xqEYT1/8sCmf3hl
	Qk5xD3F8YIPqLovpGCX1FkOKpP3TSMlRC3XdhoNMeHeiT2XWyEt6HApB+LA5zFhnTb8z8/on8MI4F
	HwTQTwsQWPg/s8GNoJJmstpqg9MMCH40LcbGoj9v4ENv1qul7/adGVBjxVU8TnEecLXgTsBToP/ga
	efhAUVybEiG419OMsZyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7eg-001LkD-1x;
	Mon, 08 May 2023 20:40:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw7ed-001LgD-36;
	Mon, 08 May 2023 20:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=/nqzDu5xfHXjN7n3gGaKe3Qp9xgjuZPS5IpPjnAT+f4=; b=rXK5w7PaYoR0wDORqy+mIshJ9h
	2dIyeV0yEjih+5Hynoqy1aW7mlVF739UYoDb+M6P1qQl0KtPEfz80fSLMTBpKtj4igPu89UagCAnN
	o9ZIB5bKL8UKEwLE/KG5x5U3Z07YgzZOb3HKR5E63wtAo4v2YIPmiJcg7qvxSgpVdvFRwB/h0TdfL
	/uBZhRtfIE9OsGhs66N5EYzORredezYteJ0Q2urfiyjIxq8m+e7bYwy4jYMHFR85JcX90uB13ge1P
	AZ/qaVZMPA7AktvI5Lu5vm5f747zEY5tFVADESI2KM5RxrrZdFd8vd3drIge6nFsuMaPbhPyQY0YE
	2acW19/A==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6mF-005Gnq-2q;
	Mon, 08 May 2023 19:44:48 +0000
Message-ID: <20230508185218.240871842@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=/nqzDu5xfHXjN7n3gGaKe3Qp9xgjuZPS5IpPjnAT+f4=;
	b=Y9osvnDWdCFR42wS3Sq9455tPTExWH6chOdVK5t+mElOJ7bmi/rBIUzKmrZFhLMAryyWI9
	42k5ASwHdZKGQdxaJo7QXjrfzOtyqL45DfKI3fQNAjyGFICTT/FAvhaW+FpMAE/idsBhLd
	szNwKYPH7EhFVR3AkF2Ir5xe1+1ylMBRrM5mJp72cb88zxQyAVq9cHCCmxD2WbikZ+TEzW
	o3Vo+irhC2HNz6lB8iyeyWXwtTlgXUlJKwaa+XkY0BRUkQCMhfQNf/vofmV4FtVDwALeB6
	HMpdhCe+3uQSS6EgGde3TvQ49KubdZK17ErrXoAMJsr0uMdRNS+eaVdMHMxoew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=/nqzDu5xfHXjN7n3gGaKe3Qp9xgjuZPS5IpPjnAT+f4=;
	b=5t4mMAnQWernMb+O3GXjrwM8U6FkU2jP3+/SU36NRq2BqU7xPkCTiHjSiyuzYfTY/O48DX
	SQFLh5owzs5njNDw==
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
Subject: [patch v3 18/36] [patch V2 18/38] cpu/hotplug: Add CPU state tracking
 and synchronization
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Date: Mon,  8 May 2023 21:43:55 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_204445_796891_0359B93B 
X-CRM114-Status: GOOD (  34.52  )
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

The CPU state tracking and synchronization mechanism in smpboot.c is
completely independent of the hotplug code and all logic around it is
implemented in architecture specific code.

Except for the state reporting of the AP there is absolutely nothing
architecture specific and the sychronization and decision functions can be
moved into the generic hotplug core code.

Provide an integrated variant and add the core synchronization and decision
points. This comes in two flavours:

  1) DEAD state synchronization

     Updated by the architecture code once the AP reaches the point where
     it is ready to be torn down by the control CPU, e.g. by removing power
     or clocks or tear down via the hypervisor.

     The control CPU waits for this state to be reached with a timeout. If
     the state is reached an architecture specific cleanup function is
     invoked.

  2) Full state synchronization

     This extends #1 with AP alive synchronization. This is new
     functionality, which allows to replace architecture specific wait
     mechanims, e.g. cpumasks, completely.

     It also prevents that an AP which is in a limbo state can be brought
     up again. This can happen when an AP failed to report dead state
     during a previous off-line operation.

The dead synchronization is what most architectures use. Only x86 makes a
bringup decision based on that state at the moment.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>


---
 arch/Kconfig               |   15 +++
 include/linux/cpuhotplug.h |   12 ++
 kernel/cpu.c               |  193 ++++++++++++++++++++++++++++++++++++++++++++-
 kernel/smpboot.c           |    2 
 4 files changed, 221 insertions(+), 1 deletion(-)
---

--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -34,6 +34,21 @@ config ARCH_HAS_SUBPAGE_FAULTS
 config HOTPLUG_SMT
 	bool
 
+# Selected by HOTPLUG_CORE_SYNC_DEAD or HOTPLUG_CORE_SYNC_FULL
+config HOTPLUG_CORE_SYNC
+	bool
+
+# Basic CPU dead synchronization selected by architecture
+config HOTPLUG_CORE_SYNC_DEAD
+	bool
+	select HOTPLUG_CORE_SYNC
+
+# Full CPU synchronization with alive state selected by architecture
+config HOTPLUG_CORE_SYNC_FULL
+	bool
+	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
+	select HOTPLUG_CORE_SYNC
+
 config GENERIC_ENTRY
 	bool
 
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -517,4 +517,16 @@ void cpuhp_online_idle(enum cpuhp_state
 static inline void cpuhp_online_idle(enum cpuhp_state state) { }
 #endif
 
+void cpuhp_ap_sync_alive(void);
+void arch_cpuhp_sync_state_poll(void);
+void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
+
+#ifdef CONFIG_HOTPLUG_CORE_SYNC_DEAD
+void cpuhp_ap_report_dead(void);
+void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu);
+#else
+static inline void cpuhp_ap_report_dead(void) { }
+static inline void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu) { }
+#endif
+
 #endif
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -17,6 +17,7 @@
 #include <linux/cpu.h>
 #include <linux/oom.h>
 #include <linux/rcupdate.h>
+#include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/bug.h>
 #include <linux/kthread.h>
@@ -59,6 +60,7 @@
  * @last:	For multi-instance rollback, remember how far we got
  * @cb_state:	The state for a single callback (install/uninstall)
  * @result:	Result of the operation
+ * @ap_sync_state:	State for AP synchronization
  * @done_up:	Signal completion to the issuer of the task for cpu-up
  * @done_down:	Signal completion to the issuer of the task for cpu-down
  */
@@ -76,6 +78,7 @@ struct cpuhp_cpu_state {
 	struct hlist_node	*last;
 	enum cpuhp_state	cb_state;
 	int			result;
+	atomic_t		ap_sync_state;
 	struct completion	done_up;
 	struct completion	done_down;
 #endif
@@ -276,6 +279,182 @@ static bool cpuhp_is_atomic_state(enum c
 	return CPUHP_AP_IDLE_DEAD <= state && state < CPUHP_AP_ONLINE;
 }
 
+/* Synchronization state management */
+enum cpuhp_sync_state {
+	SYNC_STATE_DEAD,
+	SYNC_STATE_KICKED,
+	SYNC_STATE_SHOULD_DIE,
+	SYNC_STATE_ALIVE,
+	SYNC_STATE_SHOULD_ONLINE,
+	SYNC_STATE_ONLINE,
+};
+
+#ifdef CONFIG_HOTPLUG_CORE_SYNC
+/**
+ * cpuhp_ap_update_sync_state - Update synchronization state during bringup/teardown
+ * @state:	The synchronization state to set
+ *
+ * No synchronization point. Just update of the synchronization state.
+ */
+static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
+{
+	atomic_t *st = this_cpu_ptr(&cpuhp_state.ap_sync_state);
+	int sync = atomic_read(st);
+
+	while (!atomic_try_cmpxchg(st, &sync, state));
+}
+
+void __weak arch_cpuhp_sync_state_poll(void) { cpu_relax(); }
+
+static bool cpuhp_wait_for_sync_state(unsigned int cpu, enum cpuhp_sync_state state,
+				      enum cpuhp_sync_state next_state)
+{
+	atomic_t *st = per_cpu_ptr(&cpuhp_state.ap_sync_state, cpu);
+	ktime_t now, end, start = ktime_get();
+	int sync;
+
+	end = start + 10ULL * NSEC_PER_SEC;
+
+	sync = atomic_read(st);
+	while (1) {
+		if (sync == state) {
+			if (!atomic_try_cmpxchg(st, &sync, next_state))
+				continue;
+			return true;
+		}
+
+		now = ktime_get();
+		if (now > end) {
+			/* Timeout. Leave the state unchanged */
+			return false;
+		} else if (now - start < NSEC_PER_MSEC) {
+			/* Poll for one millisecond */
+			arch_cpuhp_sync_state_poll();
+		} else {
+			usleep_range_state(USEC_PER_MSEC, 2 * USEC_PER_MSEC, TASK_UNINTERRUPTIBLE);
+		}
+		sync = atomic_read(st);
+	}
+	return true;
+}
+#else  /* CONFIG_HOTPLUG_CORE_SYNC */
+static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state) { }
+#endif /* !CONFIG_HOTPLUG_CORE_SYNC */
+
+#ifdef CONFIG_HOTPLUG_CORE_SYNC_DEAD
+/**
+ * cpuhp_ap_report_dead - Update synchronization state to DEAD
+ *
+ * No synchronization point. Just update of the synchronization state.
+ */
+void cpuhp_ap_report_dead(void)
+{
+	cpuhp_ap_update_sync_state(SYNC_STATE_DEAD);
+}
+
+void __weak arch_cpuhp_cleanup_dead_cpu(unsigned int cpu) { }
+
+/*
+ * Late CPU shutdown synchronization point. Cannot use cpuhp_state::done_down
+ * because the AP cannot issue complete() at this stage.
+ */
+static void cpuhp_bp_sync_dead(unsigned int cpu)
+{
+	atomic_t *st = per_cpu_ptr(&cpuhp_state.ap_sync_state, cpu);
+	int sync = atomic_read(st);
+
+	do {
+		/* CPU can have reported dead already. Don't overwrite that! */
+		if (sync == SYNC_STATE_DEAD)
+			break;
+	} while (!atomic_try_cmpxchg(st, &sync, SYNC_STATE_SHOULD_DIE));
+
+	if (cpuhp_wait_for_sync_state(cpu, SYNC_STATE_DEAD, SYNC_STATE_DEAD)) {
+		/* CPU reached dead state. Invoke the cleanup function */
+		arch_cpuhp_cleanup_dead_cpu(cpu);
+		return;
+	}
+
+	/* No further action possible. Emit message and give up. */
+	pr_err("CPU%u failed to report dead state\n", cpu);
+}
+#else /* CONFIG_HOTPLUG_CORE_SYNC_DEAD */
+static inline void cpuhp_bp_sync_dead(unsigned int cpu) { }
+#endif /* !CONFIG_HOTPLUG_CORE_SYNC_DEAD */
+
+#ifdef CONFIG_HOTPLUG_CORE_SYNC_FULL
+/**
+ * cpuhp_ap_sync_alive - Synchronize AP with the control CPU once it is alive
+ *
+ * Updates the AP synchronization state to SYNC_STATE_ALIVE and waits
+ * for the BP to release it.
+ */
+void cpuhp_ap_sync_alive(void)
+{
+	atomic_t *st = this_cpu_ptr(&cpuhp_state.ap_sync_state);
+
+	cpuhp_ap_update_sync_state(SYNC_STATE_ALIVE);
+
+	/* Wait for the control CPU to release it. */
+	while (atomic_read(st) != SYNC_STATE_SHOULD_ONLINE)
+		cpu_relax();
+}
+
+static bool cpuhp_can_boot_ap(unsigned int cpu)
+{
+	atomic_t *st = per_cpu_ptr(&cpuhp_state.ap_sync_state, cpu);
+	int sync = atomic_read(st);
+
+again:
+	switch (sync) {
+	case SYNC_STATE_DEAD:
+		/* CPU is properly dead */
+		break;
+	case SYNC_STATE_KICKED:
+		/* CPU did not come up in previous attempt */
+		break;
+	case SYNC_STATE_ALIVE:
+		/* CPU is stuck cpuhp_ap_sync_alive(). */
+		break;
+	default:
+		/* CPU failed to report online or dead and is in limbo state. */
+		return false;
+	}
+
+	/* Prepare for booting */
+	if (!atomic_try_cmpxchg(st, &sync, SYNC_STATE_KICKED))
+		goto again;
+
+	return true;
+}
+
+void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu) { }
+
+/*
+ * Early CPU bringup synchronization point. Cannot use cpuhp_state::done_up
+ * because the AP cannot issue complete() so early in the bringup.
+ */
+static int cpuhp_bp_sync_alive(unsigned int cpu)
+{
+	int ret = 0;
+
+	if (!IS_ENABLED(CONFIG_HOTPLUG_CORE_SYNC_FULL))
+		return 0;
+
+	if (!cpuhp_wait_for_sync_state(cpu, SYNC_STATE_ALIVE, SYNC_STATE_SHOULD_ONLINE)) {
+		pr_err("CPU%u failed to report alive state\n", cpu);
+		ret = -EIO;
+	}
+
+	/* Let the architecture cleanup the kick alive mechanics. */
+	arch_cpuhp_cleanup_kick_cpu(cpu);
+	return ret;
+}
+#else /* CONFIG_HOTPLUG_CORE_SYNC_FULL */
+static inline int cpuhp_bp_sync_alive(unsigned int cpu) { return 0; }
+static inline bool cpuhp_can_boot_ap(unsigned int cpu) { return true; }
+#endif /* !CONFIG_HOTPLUG_CORE_SYNC_FULL */
+
 /* Serializes the updates to cpu_online_mask, cpu_present_mask */
 static DEFINE_MUTEX(cpu_add_remove_lock);
 bool cpuhp_tasks_frozen;
@@ -588,6 +767,9 @@ static int bringup_cpu(unsigned int cpu)
 	struct task_struct *idle = idle_thread_get(cpu);
 	int ret;
 
+	if (!cpuhp_can_boot_ap(cpu))
+		return -EAGAIN;
+
 	/*
 	 * Reset stale stack state from the last time this CPU was online.
 	 */
@@ -606,6 +788,10 @@ static int bringup_cpu(unsigned int cpu)
 	if (ret)
 		goto out_unlock;
 
+	ret = cpuhp_bp_sync_alive(cpu);
+	if (ret)
+		goto out_unlock;
+
 	ret = bringup_wait_for_ap_online(cpu);
 	if (ret)
 		goto out_unlock;
@@ -1109,6 +1295,8 @@ static int takedown_cpu(unsigned int cpu
 	/* This actually kills the CPU. */
 	__cpu_die(cpu);
 
+	cpuhp_bp_sync_dead(cpu);
+
 	tick_cleanup_dead_cpu(cpu);
 	rcutree_migrate_callbacks(cpu);
 	return 0;
@@ -1355,8 +1543,10 @@ void cpuhp_online_idle(enum cpuhp_state
 	if (state != CPUHP_AP_ONLINE_IDLE)
 		return;
 
+	cpuhp_ap_update_sync_state(SYNC_STATE_ONLINE);
+
 	/*
-	 * Unpart the stopper thread before we start the idle loop (and start
+	 * Unpark the stopper thread before we start the idle loop (and start
 	 * scheduling); this ensures the stopper task is always available.
 	 */
 	stop_machine_unpark(smp_processor_id());
@@ -2733,6 +2923,7 @@ void __init boot_cpu_hotplug_init(void)
 {
 #ifdef CONFIG_SMP
 	cpumask_set_cpu(smp_processor_id(), &cpus_booted_once_mask);
+	atomic_set(this_cpu_ptr(&cpuhp_state.ap_sync_state), SYNC_STATE_ONLINE);
 #endif
 	this_cpu_write(cpuhp_state.state, CPUHP_ONLINE);
 	this_cpu_write(cpuhp_state.target, CPUHP_ONLINE);
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -326,6 +326,7 @@ void smpboot_unregister_percpu_thread(st
 }
 EXPORT_SYMBOL_GPL(smpboot_unregister_percpu_thread);
 
+#ifndef CONFIG_HOTPLUG_CORE_SYNC
 static DEFINE_PER_CPU(atomic_t, cpu_hotplug_state) = ATOMIC_INIT(CPU_POST_DEAD);
 
 /*
@@ -488,3 +489,4 @@ bool cpu_report_death(void)
 }
 
 #endif /* #ifdef CONFIG_HOTPLUG_CPU */
+#endif /* !CONFIG_HOTPLUG_CORE_SYNC */



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
