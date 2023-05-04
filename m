Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1C3C7EE21
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=YWdMjBPX1mGBcWa4g7uOvo/vYG/+COOmF7poepJugMk=; b=Jf9X97864+e9au
	FD6ENyQ9UE/3D1dbZiZQtv+NHxS8Qes4b4+1ByNXZwW9y6RoEU79ZSQyI2S2olSlO1mPEeWny0ElP
	IEwiX40MZXLNnMpjuu3e8y5XJ/Y5nBL/lhVHORY+3KlhBiVqveoSQsmMTs3x0oKdbmIEcvDv04A03
	rL/i21A0/P+58STgoZMXPh4KMNNcCqSBrDfozRFWGrD/tu4983z8UfQFitl53hngVQSmiWajtT+0q
	y1wN/Gvw+IoGWTAzQ0KvsZs9oeyF/UgCE3+mQKcFv8n0j2qOvvhqR+YBRBb/P//LMwcApqAr4fXPM
	Rbebwnx14KV6PHTUc3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pueow-008o7A-2p;
	Thu, 04 May 2023 19:40:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueou-008o52-0k;
	Thu, 04 May 2023 19:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=Q8MXo4UxfGPWkYiCkH8SfFuLE8nd3MwYFSO4OPkEU0k=; b=cwQc/Qx0+iFXL8j//LLloVzz23
	dD0Nr7E1Jc7Z1K8n/rKp610tONEf9DhkjdjA/gG56MXysh72wrd/c/nm2DTmCi5jEIHvHv4RtS6Hk
	AU9x/lnzeM7zzTYeRSw1+1Ap3J0BzHYBKDK3785KWqGeGkfoo5d0JRmzI0j3k+yDrcL+hhNyEQRzb
	YFA60h33YXJB9Mt+yBYV417UqjK2P82GZC1TZYtRt8La7/QPMKCuhyF9kwkrOllkGkLsy9qMXLM2j
	PKnTZJ+P2lpwTXLZypCcWfJS9aeVtFgyjK65Gc3286fbk46EYi+ibiOiFn4MyiqznLgz9ky+TihRL
	C1bgoCkw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueDr-001nzy-2g;
	Thu, 04 May 2023 19:02:48 +0000
Message-ID: <20230504185937.531087176@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Q8MXo4UxfGPWkYiCkH8SfFuLE8nd3MwYFSO4OPkEU0k=;
	b=bnUOgHwWBE9hQkfsy68hlWixo+U0yYAVZfCfMXKGJisrc20Q1Webu21cChSehhJQaLZl77
	aYcKQ8Ytt2r2NeJhvWxidSRTpvTvE+EspS4m5s+LoGulbB1pCU2KCiI4sYoDI+vWCSHJkY
	pLu+grBlA9n7NODW06zxUNEt82sbImz6W8Kz7FepCq/gr5/IfItCe6Dkdodt5Q+vNIzgkQ
	Xn7Gz8k6gfZophc27B+l6J4sJeUpLR0bJXlF4TZA5eQidQJCcWgls2wS0/Py/vTS1AsL0f
	As3W35eXgUx29dMadPvgrCRe8Y9FS7s6QYZrLEoJyk9bohOWQId+pyuCBRum1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Q8MXo4UxfGPWkYiCkH8SfFuLE8nd3MwYFSO4OPkEU0k=;
	b=HogNRfK+WKVbHXq0EreqUC5qHXGSg3L8ztEoy1FUGNc1//IkmnGiuVjwLox91YGFbTshES
	iAwGBolutbMvD0Cw==
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
Subject:  [patch V2 22/38] arm64: smp: Switch to hotplug core state synchronization
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:34 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_200240_871692_D0AF204B 
X-CRM114-Status: GOOD (  14.21  )
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
Tested-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/Kconfig           |    1 +
 arch/arm64/include/asm/smp.h |    2 +-
 arch/arm64/kernel/smp.c      |   14 +++++---------
 3 files changed, 7 insertions(+), 10 deletions(-)
---
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -222,6 +222,7 @@ config ARM64
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
 extern void __noreturn cpu_die(void);
 extern void __noreturn cpu_die_early(void);
 
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -332,17 +332,13 @@ static int op_cpu_kill(unsigned int cpu)
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
@@ -369,8 +365,8 @@ void __noreturn cpu_die(void)
 
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
