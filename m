Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6345DC7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 19:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=PEe+ri9rGn8zxGz+6Tjsy1KLwS/slsLx6MVsvcCQ4nE=; b=BF9nxXoifD4gwr
	w1GwBxslcNPix3U19sFSjOthYPhmywR+AgkTuis0NHfZ+Sg7xUDw8E9mVVkR+zJghIu+NHpQl/rfC
	1YRogLhxLy04va6GedL3GN4HZa7ATZbrZFhDCjo4biu++puyTcMQDCFcHtcCD+7Bfw0tAtyB2Fciq
	MH47OKyHifm4Go4XIRC3DVbT0ibqyRfJ0kHc6xnpNxZwdVYEJJVPjbWTM2RJmpllIMzUTZUVHNJDx
	uDDLP0XREde3LKa3PxZGjb7sSV2e9TCZOUP00XwmXXhJ5r23ujDoGQGtcVz0O7El57SjZAedtIoKm
	4uFtSHkeFL1Sa4Vq23aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6nB-001FSS-37;
	Mon, 08 May 2023 19:45:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6mH-001EXF-1E;
	Mon, 08 May 2023 19:44:17 +0000
Message-ID: <20230508185218.643400362@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=hx5fWQqpBJqFhc3VD4cFl0lkC1fEFtezXeQ/kkMDuYM=;
	b=dMSiYiyMCD3/kfD6ycKkp08Cs2yGyR46ibmTbUZ4EPuuwnERkLqo1DPunwf9Bd+Lh282Kk
	iyz5crAqn34/Z1DU1FdeHq8w2ICxkwvwPupWSapQM5bKWcd06oqKMF65CPiBv3i5Jdq5GK
	No9UCLkO9a75FWDWNjS5cUfUlOLyZkVKjYuIut6Mde17+klVjF/vsV/x/8XZgC94CcLGgL
	esCNz6eRqlPWNCIMyIyPzBMIvNBVYenPTUQOWaJr4izZS/Q4K0oHTNZvGzzHj78cMSROKA
	7adYzjGge8G4Bi2MTD6vyk5VOcXBsF4npN+FHo+bMYD6KtCMSa31T9g3imKuVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=hx5fWQqpBJqFhc3VD4cFl0lkC1fEFtezXeQ/kkMDuYM=;
	b=5H4Y1AwaHO6MuLieAAEsSuc7IElwyyxQTr8AXtmBcHORWW1C5BYTyvmgYBKAcPiBa35CdM
	lrZnB79si3SXI4BQ==
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
Subject: [patch v3 25/36] parisc: Switch to hotplug core state synchronization
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Date: Mon,  8 May 2023 21:44:07 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124409_578972_48295FD3 
X-CRM114-Status: GOOD (  12.65  )
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


---
 arch/parisc/Kconfig          |    1 +
 arch/parisc/kernel/process.c |    4 ++--
 arch/parisc/kernel/smp.c     |    7 +++----
 3 files changed, 6 insertions(+), 6 deletions(-)
---

--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -57,6 +57,7 @@ config PARISC
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_REGS_AND_STACK_ACCESS_API
+	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_IRQ_MIGRATION if SMP
 	select HAVE_UNSTABLE_SCHED_CLOCK if SMP
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -166,8 +166,8 @@ void __noreturn arch_cpu_idle_dead(void)
 
 	local_irq_disable();
 
-	/* Tell __cpu_die() that this CPU is now safe to dispose of. */
-	(void)cpu_report_death();
+	/* Tell the core that this CPU is now safe to dispose of. */
+	cpuhp_ap_report_dead();
 
 	/* Ensure that the cache lines are written out. */
 	flush_cache_all_local();
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -500,11 +500,10 @@ int __cpu_disable(void)
 void __cpu_die(unsigned int cpu)
 {
 	pdc_cpu_rendezvous_lock();
+}
 
-	if (!cpu_wait_death(cpu, 5)) {
-		pr_crit("CPU%u: cpu didn't die\n", cpu);
-		return;
-	}
+void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
+{
 	pr_info("CPU%u: is shutting down\n", cpu);
 
 	/* set task's state to interruptible sleep */



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
