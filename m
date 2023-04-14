Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159B2C77B71
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=fX50gkaKfQ1sOq0hxLcVKmcFsIBcT6lgv7UEle7TW30=; b=bbQVX/Z/BtbPMb
	+CYIMHUfYr81sl0nCeGGxbbnfm64YBHPpTlp64jLD3G+53O5+RQIrYFvjWgvHDs+hh23WKo8pvnxy
	5bJdrsqe4kWM1fyeW8U4Oxj1vTJi2Wl2xWxjzWqveDUfhs6fd+R3N9V9pvI68x6B9akEiSPipHMST
	AWIkrz2hlxfLD6ecH6eOsgQs0lwFmTuVPFHjyMaDLAWhuq4iztavXllhNAnRPFP6ErVssMxa3FaTY
	lHQbZpCG16vHd9i64fwNsAWlngfl7+UUzlTHud0NnnZVSXeFuzEtNdeQoV4vK2vHYKnP0iBU/E+25
	O/xxiT1a5vmAATymQw5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT6x-00AlEz-0C;
	Fri, 14 Apr 2023 23:45:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT5l-00Ak8y-1E;
	Fri, 14 Apr 2023 23:44:35 +0000
Message-ID: <20230414232309.886802016@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=/ZK0+aYTDprGh+TLZnlXwtj4Vfn8D4d3BT+xMJ2O4BY=;
	b=vjkoNmrHuvgLnadmWDBQsaj4074jsURhSMcG/y+SAv5U7Hjl873Sfi0Y38vZ0CiBW30lkc
	YSRug6WOf+XkPtW/Ok7DfLfUey146jL84NdowhhogdHAP/UKxbH2eo4JQjN009SbEVnvNW
	1zv9NUb4vEW1lio3uk0/iDb4xih4TRxA+1g65l9y4CxPj9/vIKfhtqspZBp17LHEOMwTUs
	uqFNHzjdehaY7LPLRMdLZxqYkTGv4zrW/lRcOci3KT4V49tXaioV61gsRoQXocuqUqCvtS
	KqU2xIzYJQYvtQyq2IG1EFa3XvWD9GUEZsifVyZD2YZ/wz91ynh5mZJDMN6fTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=/ZK0+aYTDprGh+TLZnlXwtj4Vfn8D4d3BT+xMJ2O4BY=;
	b=5l86SHxSNU5XjxfrY2KYmiaNiv7XnFBAOMn0HfeVzwcXghypKkHnPtf+Boxw8mjzqZQmUJ
	Sn14SMUAF/D/3pAQ==
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
Subject:  [patch 11/37] x86/smpboot: Move synchronization masks to SMP boot code
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:44:31 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164433_726013_14D5C797 
X-CRM114-Status: GOOD (  12.24  )
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

The usage is in smpboot.c and not in the CPU initialization code.

The XEN_PV usage of cpu_callout_mask is obsolete as cpu_init() not longer
waits and cacheinfo has its own CPU mask now, so cpu_callout_mask can be
made static too.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/include/asm/cpumask.h |    5 -----
 arch/x86/kernel/cpu/common.c   |   17 -----------------
 arch/x86/kernel/smpboot.c      |   16 ++++++++++++++++
 arch/x86/xen/smp_pv.c          |    3 ---
 4 files changed, 16 insertions(+), 25 deletions(-)

--- a/arch/x86/include/asm/cpumask.h
+++ b/arch/x86/include/asm/cpumask.h
@@ -4,11 +4,6 @@
 #ifndef __ASSEMBLY__
 #include <linux/cpumask.h>
 
-extern cpumask_var_t cpu_callin_mask;
-extern cpumask_var_t cpu_callout_mask;
-extern cpumask_var_t cpu_initialized_mask;
-extern cpumask_var_t cpu_sibling_setup_mask;
-
 extern void setup_cpu_local_masks(void);
 
 /*
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -67,14 +67,6 @@
 
 u32 elf_hwcap2 __read_mostly;
 
-/* all of these masks are initialized in setup_cpu_local_masks() */
-cpumask_var_t cpu_initialized_mask;
-cpumask_var_t cpu_callout_mask;
-cpumask_var_t cpu_callin_mask;
-
-/* representing cpus for which sibling maps can be computed */
-cpumask_var_t cpu_sibling_setup_mask;
-
 /* Number of siblings per CPU package */
 int smp_num_siblings = 1;
 EXPORT_SYMBOL(smp_num_siblings);
@@ -168,15 +160,6 @@ static void ppin_init(struct cpuinfo_x86
 	clear_cpu_cap(c, info->feature);
 }
 
-/* correctly size the local cpu masks */
-void __init setup_cpu_local_masks(void)
-{
-	alloc_bootmem_cpumask_var(&cpu_initialized_mask);
-	alloc_bootmem_cpumask_var(&cpu_callin_mask);
-	alloc_bootmem_cpumask_var(&cpu_callout_mask);
-	alloc_bootmem_cpumask_var(&cpu_sibling_setup_mask);
-}
-
 static void default_init(struct cpuinfo_x86 *c)
 {
 #ifdef CONFIG_X86_64
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -101,6 +101,13 @@ EXPORT_PER_CPU_SYMBOL(cpu_die_map);
 DEFINE_PER_CPU_READ_MOSTLY(struct cpuinfo_x86, cpu_info);
 EXPORT_PER_CPU_SYMBOL(cpu_info);
 
+/* All of these masks are initialized in setup_cpu_local_masks() */
+static cpumask_var_t cpu_initialized_mask;
+static cpumask_var_t cpu_callout_mask;
+static cpumask_var_t cpu_callin_mask;
+/* Representing CPUs for which sibling maps can be computed */
+static cpumask_var_t cpu_sibling_setup_mask;
+
 /* Logical package management. We might want to allocate that dynamically */
 unsigned int __max_logical_packages __read_mostly;
 EXPORT_SYMBOL(__max_logical_packages);
@@ -1548,6 +1555,15 @@ early_param("possible_cpus", _setup_poss
 		set_cpu_possible(i, true);
 }
 
+/* correctly size the local cpu masks */
+void __init setup_cpu_local_masks(void)
+{
+	alloc_bootmem_cpumask_var(&cpu_initialized_mask);
+	alloc_bootmem_cpumask_var(&cpu_callin_mask);
+	alloc_bootmem_cpumask_var(&cpu_callout_mask);
+	alloc_bootmem_cpumask_var(&cpu_sibling_setup_mask);
+}
+
 #ifdef CONFIG_HOTPLUG_CPU
 
 /* Recompute SMT state for all CPUs on offline */
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -254,15 +254,12 @@ cpu_initialize_context(unsigned int cpu,
 	struct desc_struct *gdt;
 	unsigned long gdt_mfn;
 
-	/* used to tell cpu_init() that it can proceed with initialization */
-	cpumask_set_cpu(cpu, cpu_callout_mask);
 	if (cpumask_test_and_set_cpu(cpu, xen_cpu_initialized_map))
 		return 0;
 
 	ctxt = kzalloc(sizeof(*ctxt), GFP_KERNEL);
 	if (ctxt == NULL) {
 		cpumask_clear_cpu(cpu, xen_cpu_initialized_map);
-		cpumask_clear_cpu(cpu, cpu_callout_mask);
 		return -ENOMEM;
 	}
 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
