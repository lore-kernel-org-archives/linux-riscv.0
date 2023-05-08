Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72707C7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 19:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=6x9KWzMjWGIKGCm6X+8xXAA/jclia5I/+Xl9zPI1xlw=; b=t/wLYih4N/bbgN
	6EAA8Czr6iUeFz3cJkOOxULZQkQcBWSUxSLvjT5UPagdnc3OKy5Reqb99bIk3CIlo7GSuiH2PgqUB
	4c6JR6gj3GrxZ4rsya/FBZ50lUOrZOV3EcbFPyorwuXppjmUUM5cs2Yur/qCZDOzCLvMzKp6PSCLL
	HQ0aeBgAuJpQBStHb/B3OwVEgLEchexlv70KKgVOXutnCrd9oSA1d7rwTmusev7iWr6P5WBQv+96E
	F7K9kL6HnqVZq0dDRkIfVkWv3aTV6aqthJfiEoXos+bNX0uV6MOHpCL7At0nte8nOggoWmDPnDt5C
	PPQD9QGu/bKKWFyFFs5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6nN-001Ffe-0T;
	Mon, 08 May 2023 19:45:17 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw6mR-001Eil-0K;
	Mon, 08 May 2023 19:44:28 +0000
Message-ID: <20230508185218.962208640@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=7J6qDuLCrgdvR1kG/InEcQTSLCUqJ2Io10qHE6FCHaM=;
	b=0Hv0AspymKyYz8qW0hj6Fb0vUtVHsdGmkvWcUakIBtshYh+zVy/vlvZHR1/vJJLPlas4D8
	PRzzSySwBkg1+JPbOBNLLdT/hp7seWkZBvoftuEF+vw8QuQjWUJ4K4oLdS5xDTwEjJHE7A
	gNOv1k4J4BrzZeGVnOAKkMmcblUqN/FYihcmxHZv2nEClm+/K+rhv+En8fpkOo6ZMhekbP
	fp0J8Mycqhuh4vaLIP3ZaeDDy7dR7H2M1G6jiZF8zqKNY6sfFE8cTQVtJvDtVzZmYHGBDI
	A83cW4yHAFFLmlY1u2nMBkF0J3x6Dy2QTQscDGxCprr2i8ihRMilmaPq8wHcbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=7J6qDuLCrgdvR1kG/InEcQTSLCUqJ2Io10qHE6FCHaM=;
	b=3bCOAPoiV1ViDB0Ns+pjgu6fuq8OhbzSh5tZOLe9PQ/YwBWzawJVTSPOhF+994y0l1r8Gv
	bZKIMX08LnDG7gCA==
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
Subject: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Date: Mon,  8 May 2023 21:44:17 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_124419_447520_541B65AD 
X-CRM114-Status: GOOD (  15.75  )
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

Make the primary thread tracking CPU mask based in preparation for simpler
handling of parallel bootup.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>


---
 arch/x86/include/asm/apic.h     |    2 --
 arch/x86/include/asm/topology.h |   19 +++++++++++++++----
 arch/x86/kernel/apic/apic.c     |   20 +++++++++-----------
 arch/x86/kernel/smpboot.c       |   12 +++---------
 4 files changed, 27 insertions(+), 26 deletions(-)
---

--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -506,10 +506,8 @@ extern int default_check_phys_apicid_pre
 #endif /* CONFIG_X86_LOCAL_APIC */
 
 #ifdef CONFIG_SMP
-bool apic_id_is_primary_thread(unsigned int id);
 void apic_smt_update(void);
 #else
-static inline bool apic_id_is_primary_thread(unsigned int id) { return false; }
 static inline void apic_smt_update(void) { }
 #endif
 
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -31,9 +31,9 @@
  * CONFIG_NUMA.
  */
 #include <linux/numa.h>
+#include <linux/cpumask.h>
 
 #ifdef CONFIG_NUMA
-#include <linux/cpumask.h>
 
 #include <asm/mpspec.h>
 #include <asm/percpu.h>
@@ -139,9 +139,20 @@ static inline int topology_max_smt_threa
 int topology_update_package_map(unsigned int apicid, unsigned int cpu);
 int topology_update_die_map(unsigned int dieid, unsigned int cpu);
 int topology_phys_to_logical_pkg(unsigned int pkg);
-bool topology_is_primary_thread(unsigned int cpu);
 bool topology_smt_supported(void);
-#else
+
+extern struct cpumask __cpu_primary_thread_mask;
+#define cpu_primary_thread_mask ((const struct cpumask *)&__cpu_primary_thread_mask)
+
+/**
+ * topology_is_primary_thread - Check whether CPU is the primary SMT thread
+ * @cpu:	CPU to check
+ */
+static inline bool topology_is_primary_thread(unsigned int cpu)
+{
+	return cpumask_test_cpu(cpu, cpu_primary_thread_mask);
+}
+#else /* CONFIG_SMP */
 #define topology_max_packages()			(1)
 static inline int
 topology_update_package_map(unsigned int apicid, unsigned int cpu) { return 0; }
@@ -152,7 +163,7 @@ static inline int topology_max_die_per_p
 static inline int topology_max_smt_threads(void) { return 1; }
 static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
 static inline bool topology_smt_supported(void) { return false; }
-#endif
+#endif /* !CONFIG_SMP */
 
 static inline void arch_fix_phys_package_id(int num, u32 slot)
 {
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2386,20 +2386,16 @@ bool arch_match_cpu_phys_id(int cpu, u64
 }
 
 #ifdef CONFIG_SMP
-/**
- * apic_id_is_primary_thread - Check whether APIC ID belongs to a primary thread
- * @apicid: APIC ID to check
- */
-bool apic_id_is_primary_thread(unsigned int apicid)
+static void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid)
 {
-	u32 mask;
-
-	if (smp_num_siblings == 1)
-		return true;
 	/* Isolate the SMT bit(s) in the APICID and check for 0 */
-	mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
-	return !(apicid & mask);
+	u32 mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
+
+	if (smp_num_siblings == 1 || !(apicid & mask))
+		cpumask_set_cpu(cpu, &__cpu_primary_thread_mask);
 }
+#else
+static inline void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid) { }
 #endif
 
 /*
@@ -2544,6 +2540,8 @@ int generic_processor_info(int apicid, i
 	set_cpu_present(cpu, true);
 	num_processors++;
 
+	cpu_mark_primary_thread(cpu, apicid);
+
 	return cpu;
 }
 
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -102,6 +102,9 @@ EXPORT_PER_CPU_SYMBOL(cpu_die_map);
 DEFINE_PER_CPU_READ_MOSTLY(struct cpuinfo_x86, cpu_info);
 EXPORT_PER_CPU_SYMBOL(cpu_info);
 
+/* CPUs which are the primary SMT threads */
+struct cpumask __cpu_primary_thread_mask __read_mostly;
+
 /* Representing CPUs for which sibling maps can be computed */
 static cpumask_var_t cpu_sibling_setup_mask;
 
@@ -283,15 +286,6 @@ static void notrace start_secondary(void
 }
 
 /**
- * topology_is_primary_thread - Check whether CPU is the primary SMT thread
- * @cpu:	CPU to check
- */
-bool topology_is_primary_thread(unsigned int cpu)
-{
-	return apic_id_is_primary_thread(per_cpu(x86_cpu_to_apicid, cpu));
-}
-
-/**
  * topology_smt_supported - Check whether SMT is supported by the CPUs
  */
 bool topology_smt_supported(void)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
