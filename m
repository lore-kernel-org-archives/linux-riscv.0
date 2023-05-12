Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FD4C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 21:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=Q0C6nTMR3Y0jVDAnGTYikmUnNkgXjL8wfzd3l52c/GE=; b=n6YQjdkKc3yfyh
	D9MsgHCKrP2JtGCAInAO4xV00s/z2rmMHtdW360tkq2YyuTs68zBpKjemzeuTT18YQ9RQ9ybVN+Pz
	5f4Dh0C3qCJkEI8+32FA9jPiq8YG23xLn+/5rvEroEobHzWVgp2HxtoSb7Wlya7xA4ZRaoscQZ7Eo
	vM8/xED872P/ux9oYCs0ONf5L2zHqHb03Jq0JM/ZdjHasu9KtGHstfTS8q42H/R0sZQjDtLl3Ei/x
	p2zIEYGTxWbhAnQ57NVUEx7JQQzFL/HY7tfbP1QW8xhxreSJT7MitM02T52vgHktM6uPfIfmtyMi/
	I/kXPg2LQktvRyFAgtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxa0g-00D0Iy-0w;
	Fri, 12 May 2023 21:09:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZzA-00CykG-35;
	Fri, 12 May 2023 21:07:35 +0000
Message-ID: <20230512205256.582584351@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=rBjhgMw+R3T5P7fIX0knHpgERmAnldETzGDcA6m3soI=;
	b=cbaRZFL8MG+FpoRLi83o8C0jAfcbHTHB+vfFTRdb6Fb5sn0p9lXLPNX7cm2p36LZqMBqmR
	1io+Dw1jv1H97vrkFacfHVWEtoGH53aEdX3vz4beRct8h0e0dd26xWSWd8eZW1KCcIJC7Q
	IQjkl2Ljo3IYhaQRAOEzrdGinOoTCNtqBI4rzplYXNLyGSql4W9oEPvKLwby3cjoIJikik
	vY7h0DuJoO+oJqXbmBmpR/nMx6mZkS+vKcfhwlFUdevTe78P5zT0sVzDMJyx2aF2BpjVmT
	1nL7SZdRWGuShjCMJNYSq1acmRBhEsUAZ4zDDuAqjK77jqt83aYfTHAfG+pL7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=rBjhgMw+R3T5P7fIX0knHpgERmAnldETzGDcA6m3soI=;
	b=JWEuLlJQJHioUWfttr6TJZop/D83BErX+18Kxt47uf7+fJoL0/b+dnZa33N9Vj8OnGttOs
	Ptz2z9++OXaZSQCA==
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
Subject: [patch V4 21/37] cpu/hotplug: Remove cpu_report_state() and related
 unused cruft
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Date: Fri, 12 May 2023 23:07:30 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_140733_334982_CB44BC97 
X-CRM114-Status: GOOD (  18.83  )
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

No more users.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 include/linux/cpu.h |    2 -
 kernel/smpboot.c    |   90 ----------------------------------------------------
 2 files changed, 92 deletions(-)


--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -184,8 +184,6 @@ void arch_cpu_idle_enter(void);
 void arch_cpu_idle_exit(void);
 void __noreturn arch_cpu_idle_dead(void);
 
-int cpu_report_state(int cpu);
-int cpu_check_up_prepare(int cpu);
 void cpu_set_state_online(int cpu);
 void play_idle_precise(u64 duration_ns, u64 latency_ns);
 
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -329,97 +329,7 @@ EXPORT_SYMBOL_GPL(smpboot_unregister_per
 #ifndef CONFIG_HOTPLUG_CORE_SYNC
 static DEFINE_PER_CPU(atomic_t, cpu_hotplug_state) = ATOMIC_INIT(CPU_POST_DEAD);
 
-/*
- * Called to poll specified CPU's state, for example, when waiting for
- * a CPU to come online.
- */
-int cpu_report_state(int cpu)
-{
-	return atomic_read(&per_cpu(cpu_hotplug_state, cpu));
-}
-
-/*
- * If CPU has died properly, set its state to CPU_UP_PREPARE and
- * return success.  Otherwise, return -EBUSY if the CPU died after
- * cpu_wait_death() timed out.  And yet otherwise again, return -EAGAIN
- * if cpu_wait_death() timed out and the CPU still hasn't gotten around
- * to dying.  In the latter two cases, the CPU might not be set up
- * properly, but it is up to the arch-specific code to decide.
- * Finally, -EIO indicates an unanticipated problem.
- *
- * Note that it is permissible to omit this call entirely, as is
- * done in architectures that do no CPU-hotplug error checking.
- */
-int cpu_check_up_prepare(int cpu)
-{
-	if (!IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
-		atomic_set(&per_cpu(cpu_hotplug_state, cpu), CPU_UP_PREPARE);
-		return 0;
-	}
-
-	switch (atomic_read(&per_cpu(cpu_hotplug_state, cpu))) {
-
-	case CPU_POST_DEAD:
-
-		/* The CPU died properly, so just start it up again. */
-		atomic_set(&per_cpu(cpu_hotplug_state, cpu), CPU_UP_PREPARE);
-		return 0;
-
-	case CPU_DEAD_FROZEN:
-
-		/*
-		 * Timeout during CPU death, so let caller know.
-		 * The outgoing CPU completed its processing, but after
-		 * cpu_wait_death() timed out and reported the error. The
-		 * caller is free to proceed, in which case the state
-		 * will be reset properly by cpu_set_state_online().
-		 * Proceeding despite this -EBUSY return makes sense
-		 * for systems where the outgoing CPUs take themselves
-		 * offline, with no post-death manipulation required from
-		 * a surviving CPU.
-		 */
-		return -EBUSY;
-
-	case CPU_BROKEN:
-
-		/*
-		 * The most likely reason we got here is that there was
-		 * a timeout during CPU death, and the outgoing CPU never
-		 * did complete its processing.  This could happen on
-		 * a virtualized system if the outgoing VCPU gets preempted
-		 * for more than five seconds, and the user attempts to
-		 * immediately online that same CPU.  Trying again later
-		 * might return -EBUSY above, hence -EAGAIN.
-		 */
-		return -EAGAIN;
-
-	case CPU_UP_PREPARE:
-		/*
-		 * Timeout while waiting for the CPU to show up. Allow to try
-		 * again later.
-		 */
-		return 0;
-
-	default:
-
-		/* Should not happen.  Famous last words. */
-		return -EIO;
-	}
-}
-
-/*
- * Mark the specified CPU online.
- *
- * Note that it is permissible to omit this call entirely, as is
- * done in architectures that do no CPU-hotplug error checking.
- */
-void cpu_set_state_online(int cpu)
-{
-	(void)atomic_xchg(&per_cpu(cpu_hotplug_state, cpu), CPU_ONLINE);
-}
-
 #ifdef CONFIG_HOTPLUG_CPU
-
 /*
  * Wait for the specified CPU to exit the idle loop and die.
  */




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
