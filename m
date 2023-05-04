Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E31C7EE21
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=h1/eOAZvnAL6W7eEdY1YAZ7IHu00OXzxSoVD14Cfh68=; b=17ypmvUqjaGvH/
	9rgVQZNwvdGVLtitqX+FpaJkScy/lt7PbnJF8/njH/V2Bv1fhygnhEGQryXMtOiD6kTWQbr97+tW+
	aSIUm0wEs9kjFSzd3moliK22riTDQtYbE1Qu3LNiwoCq+jZzwyHVpQ700hzlrUuOtEcv3hEp67rex
	RK+iZooaLO64s5vplek6PVL1xowvBB0HEkYyyL5ALKRUytC/hur1HBuW/F7QmRrr0x1yFgsRblQJb
	dcYBt0AcxL7SdYNPLKvnm+v4VZzmh89k2ZzF45E1HRCnGQy1NDapJM7ZVSCnPgdmy6BqexGJOsywY
	WzdLIIjnNEHwJPi6qTgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puep4-008oE2-24;
	Thu, 04 May 2023 19:41:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueoz-008o8l-1B;
	Thu, 04 May 2023 19:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=o04fXgOhQs8+8CE7g0ZkhrpkLD4QHZg/LLM7Otp+9z8=; b=qDKfBeZ8ePzvF8S9g870ojoTPq
	q0qLsUfpr6ijpMxJQFbPYME/FyYa7a+iwPOLgYaEbNzcj+qN1EgKlWFpwjDqM0pQEnr+ic5LkYvc4
	TAAssdQltPYs52dX/TRllCaQtxSc2rz+bgJC1NSMjz+UImX3AvMpRpRgIMd7LO9Qf7qZVWRkJoh/r
	v4cBHVW6EDNU8Q6yGsKxgRc85R4XvY0387ieuEIdbT4+yyLOoO1DCXZ5Jln9xFD7hX9GV098PVhRq
	vf2R8vsuKOniPE7bjKiJ4mQnbf55vSMJtOCV+j3a4jfDzZE8KS4cIvQESDN3f92w5YWhwv15ump9U
	jd2rCN3Q==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueDw-001o08-1S;
	Thu, 04 May 2023 19:03:00 +0000
Message-ID: <20230504185937.700483457@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=o04fXgOhQs8+8CE7g0ZkhrpkLD4QHZg/LLM7Otp+9z8=;
	b=p4kcKoUjBHHJo7zBT76SAr4kx217XWJeqQlJZM4VxHPykLQrWLTEC/uzx8rVhbv5iqkHWl
	eKFtH9Dh+4qwsJ89ZP4rLm01HMJyfuh1U+U+HK5bkx7PCIfmaji3wiKDM0hoVurLEfzD81
	Wt5Ubm2jEjitMnzdFcIqEG1m9GNIikM3c5w8xOJBg2D9IGfl3i1Bdd22uIIaFwPx6R+oIN
	02fFHC7cYoeNHnd0KZn/7sG2vBaI1ZwTr6vd36gfFqo6mvp2OfPm/JhGUYVjsHiJsALYHO
	f8H4F6s4Sw0iVizvLScdCi66AVg3wSgMwKU7em9hN7nVzpd/ip3L0uFyKgVW2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=o04fXgOhQs8+8CE7g0ZkhrpkLD4QHZg/LLM7Otp+9z8=;
	b=ZnZlGAwTWV21lQJdfFlOE3KOrdxbCyckyIQwnUuLhsAipHYSOksGllyP3kynqMPIKSFyh4
	3HRt8jQRFFxBADCA==
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
Subject: [patch V2 25/38] parisc: Switch to hotplug core state synchronization
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:38 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_200258_708856_F0DB4FC8 
X-CRM114-Status: GOOD (  12.64  )
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
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org

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
