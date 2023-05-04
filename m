Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A20C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 19:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=2tO8lLicATKVMWycRMmwu3OIrTGbpIfyi8tqBwTgqbc=; b=UgEDMTyN1yRi5H
	J/GJn9eYTbQTmcTJryFXbXdX4yf5sUBR6WicuE0UCPeILj4fk6LKFCETUVzw4CJIJG18/RTKG05KV
	89GwLOvyk7RiZLJPjngUuQ1apuI+vFmD7/6bWwr9R8fop+aHJr432N8q+0C98Zh73i1mvAETWJd5i
	MB/YS4QFY7rNINimOEO2u+TzZyTV8P/g9g6W0LhSHFmnXSfVLRSzsYfvtUaO0Iiugyx6Q8eZewr+U
	og5MZ+NrpuMXNF4GFCZHVrlkkgX7ZwXoxkqVWz17dmvV4yOL9fGA+1E33yCMzeiryhbxYmV94N/eR
	x0jaPtBDN4ERHoMEch4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pueoz-008o9O-1O;
	Thu, 04 May 2023 19:40:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueov-008o5u-2V;
	Thu, 04 May 2023 19:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=wTNocxrIkrZERW1CgHrOxDfBd1NuTsgJS4AJ8mYPyyQ=; b=oweweaI7Iv5txdp2tuIC0PaZuX
	+F5nAPUg81ppVLDtcQX4Iz0p76p/CFpZkDDOoBs51KUDXjDkGpgCm94y+Lp08o3zvXV0Xds5rNgWB
	HWX/YDgfzoANHvGuvsh8NKjq/3GqrfmBy7QNCCa7vyEuMRrV+1iRgh5+uHwEuc9JpKuBgUXBxlL9B
	gUzpHGATRcRZFjtmF/krJrqmznfxQJcyqugwSW6296Df7YgkSREDT8M+dezBZ2vQA1oH9P/MwiY6t
	VxCLZk3h4iAsHE7v1+PkNcoAPDzNV9eGEwny06zaPmsh94AedQSCgKimM6GZAk4uK7Z7Zln7ALWcH
	LrppRhEA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueDt-001o01-1E;
	Thu, 04 May 2023 19:02:52 +0000
Message-ID: <20230504185937.584277566@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=wTNocxrIkrZERW1CgHrOxDfBd1NuTsgJS4AJ8mYPyyQ=;
	b=Mi46V8eHgoltNQxPJmnbu9i1N0WqNbjlBS5gXzUQdYuzDGSlRAwFIn42Fl4qTDQ9tpMOpi
	9pMD9eqFIhnqecwmKQOcPdssVAfxr98Ufnj8kPfEnna6Jg1FJPiFDXjB5qyYPeKOEBzagH
	d9bGKI26ZnIO1dmzo62pzKDwF621ZdxsTsNqH8faar1/6RQwLMfz9EzVFpDrERESz08UzT
	RKiX6TWVgbEvDpDMLz5ptMwZldZAxWrvz613h9Whj+rnlmmRseJTa9scp2XVHyZRgXYYx9
	W9B8x3jWUGKujnEYbsdrx7KzjQ+swT2YMyT9UZUBAmo9KzwEdkHLM2GZWs0XOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=wTNocxrIkrZERW1CgHrOxDfBd1NuTsgJS4AJ8mYPyyQ=;
	b=4wN87waBqOWq8wTSM62nHwIaB3nHKF5Odvy83jhqjVG4mxeKOSh6qxwJk2zaru4HlpMduu
	ieIS3XjNdw5x/MBw==
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
Subject:  [patch V2 23/38] csky/smp: Switch to hotplug core state synchronization
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:35 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_200249_042172_FD1B6B59 
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
Cc: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org

---
 arch/csky/Kconfig           |    1 +
 arch/csky/include/asm/smp.h |    2 +-
 arch/csky/kernel/smp.c      |    8 ++------
 3 files changed, 4 insertions(+), 7 deletions(-)
---
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -96,6 +96,7 @@ config CSKY
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select MAY_HAVE_SPARSE_IRQ
 	select MODULES_USE_ELF_RELA if MODULES
 	select OF
--- a/arch/csky/include/asm/smp.h
+++ b/arch/csky/include/asm/smp.h
@@ -23,7 +23,7 @@ void __init set_send_ipi(void (*func)(co
 
 int __cpu_disable(void);
 
-void __cpu_die(unsigned int cpu);
+static inline void __cpu_die(unsigned int cpu) { }
 
 #endif /* CONFIG_SMP */
 
--- a/arch/csky/kernel/smp.c
+++ b/arch/csky/kernel/smp.c
@@ -291,12 +291,8 @@ int __cpu_disable(void)
 	return 0;
 }
 
-void __cpu_die(unsigned int cpu)
+void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 {
-	if (!cpu_wait_death(cpu, 5)) {
-		pr_crit("CPU%u: shutdown failed\n", cpu);
-		return;
-	}
 	pr_notice("CPU%u: shutdown\n", cpu);
 }
 
@@ -304,7 +300,7 @@ void __noreturn arch_cpu_idle_dead(void)
 {
 	idle_task_exit();
 
-	cpu_report_death();
+	cpuhp_ap_report_dead();
 
 	while (!secondary_stack)
 		arch_cpu_idle();


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
