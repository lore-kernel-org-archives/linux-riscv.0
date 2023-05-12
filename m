Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E25C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 21:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=F3bIDCdsHoOJhQiDTDdOq5Z5oMqTH0Y6DXjdhhQb25k=; b=AoguIZSlX3NgWH
	kTOfotMUMfR66/F8sAq87XgFYaYIzqz3jQtwSaL8PiZiVV4lrcoc18wmgWgxEehiWptTk4UGooK1z
	OXBZbgIf818awObPbgfXsGs4OTY+E3uLcshtEr9RpY7TVsMrNgbf2bct3G4ddd9MVwzI0xVqxw516
	l6V0FIjbns3fZsxRU1UyWTXEWeaUeOq3utVqpm5pE0ZYk1PIKCvmrrrxLE/LB5FnDpopBTyTRabBt
	EEsaTEKvWaz/iEReizy6S9m/AClNEoWooMeAMRMd2ifhJxYqaAICxY8DtfAgI/NDOKjJm11n3Wzwl
	nto4r11e4Y3+VEvKV5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxa0i-00D0MG-2D;
	Fri, 12 May 2023 21:09:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZzD-00Cyn4-20;
	Fri, 12 May 2023 21:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=JaqZxTMPaJm1imrOji7tK0gvC/N5/O2xb6G86Du4TqQ=; b=Y+cyw2bd8nzkBUuHWoIdVXGwr4
	PLzBeCmSa/bYQgTSKu9MvHnNHTNFbbL3B+4vlJrQSx0BBb5XxjlNjI8aQUUyIKAv7zAdjXwcSf+3h
	QwRAycL/8l0i3JDYyfFBn8pM4H0rBlBQEx+d8QboKxBKNwp+9gF0dicgg3kbhQvXg1E+sFSZiEvPO
	71A+zOVCPsIe0itSnV0TWCOVwrHBBTNDcnYooAbhEXXOOzXuZ7fOmuJmhh7OC/lqOxDYJZlH9uFtJ
	AXqTQvkXuSLXaOusLsZJGJCwdDBAk2COMHR9Pkc22cRDBe3KsaeMlepOBLRZks80DbR8Xv40vhBaJ
	RhziFbLw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZz9-009J8k-0L;
	Fri, 12 May 2023 21:07:33 +0000
Message-ID: <20230512205256.091511483@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=JaqZxTMPaJm1imrOji7tK0gvC/N5/O2xb6G86Du4TqQ=;
	b=cDejufDlaxyCx5CGX4hiOWO/B+3Z4Wh19xsvilcT9IPO7FIYNiPHNJX+pqRc5X+N/dDVs5
	tKDZ+XQ4GQv9J6hR2SPc85jI+MqPX6q6xxXuGbFXUxAJjXbPQHMFewGqbQuhrfB7sY2u2u
	nkHDr5FQjj8WBPk6AwjKUsu+7FyPK4nSUfby3R43DpF7wYT+TQ8zFWGIr2lnlOG6YYmjM4
	uygdhGu263NI6nr6HYNtETYJgziVDxphZhDBdka0UYVVHe8n5+ats7GS5MAlTVrF+827ll
	IFxU3itG8+fVOGZr/SA1ZuDUQI+EuEEA8a+PjeX7nu7Hjbhz0RXLqD2NveT9KQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=JaqZxTMPaJm1imrOji7tK0gvC/N5/O2xb6G86Du4TqQ=;
	b=sOj3zUEdJE/NxvevxKX5WPFqqf/zY9uCI4lEroCJWyOhcwEBsNa+MdD4dK9wBn2igUgSdu
	8HJ4zRRiu3a17ODw==
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
Subject:  [patch V4 12/37] x86/smpboot: Move synchronization masks to SMP boot code
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Date: Fri, 12 May 2023 23:07:16 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_220731_465919_82D66C51 
X-CRM114-Status: GOOD (  13.29  )
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

The usage is in smpboot.c and not in the CPU initialization code.

The XEN_PV usage of cpu_callout_mask is obsolete as cpu_init() not longer
waits and cacheinfo has its own CPU mask now, so cpu_callout_mask can be
made static too.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
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
@@ -169,15 +161,6 @@ static void ppin_init(struct cpuinfo_x86
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
