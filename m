Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56BFC7EE2C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 21:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=DbPkg5gXBrm8szrJZJSPEGC/mxAaZF9huKkC/HI1mjE=; b=D8lC3umzrkkiJW
	VOaWipnvJxVDWg/ZWFNmlYRSesPZPCeK8G9pKpZ70kSdohYpFyBaSaVJbYLA6P7IBuu3UTkkilNMP
	hX1DwepCAT8bofOGeYNw6Fsi4bJDXv6stycCqFO01LuYzhECh1IjQpE0c46wIRPHvB9QUXC8rcEd0
	3png5GUd5NERhKZ5xjW9cS1bRdG5irHFzFs9JXxskNPJPvdH2m8QoSVOriMOpyfuWMx2PRUMyGlZv
	J1rCzFoJxGQwtm9x/VrYuBzu91BezuwwUmUZlS4gRkscP5HdzScOersIPGSTAyfq2CtTwR7CYow6D
	/VGBdMfm3h+ccjAhOHQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pugIs-0090yw-0W;
	Thu, 04 May 2023 21:15:54 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueE6-008e1K-2Y;
	Thu, 04 May 2023 19:02:54 +0000
Message-ID: <20230504185938.019102098@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=/CyZEPJpAlcZassSDf6yPEl3fpuFiplGVJNrFAE1PjY=;
	b=JeZqr+iiqJKFh0frIQBEVa7KD1KSyYbB9ecZpoyy+Ss/8iF+SulZrNYmpNtbaINJPS+GKN
	Q6QZfpf+NIX8lp5U7q5IujAix4aBXn2NuS91LKTuT2EN4Wx27Sc9ozVGaKryZ1Xz3aRx2+
	pp8GZXqg1tw/FM8H1JHmg09BpGTRsIUfCFt3B7zeMEtw/SuA3yHhIfdyfHSJKF8aaDmkKn
	qwpwBR9+GFxfv0EF2zQ4uLzx0BTfrYNVsAosc3zXIaKDTQTdRFy5RnXNSRt5/H9P60pdjJ
	D6kES7EIGSOfUpN+Y62CgSsoDjmz21DT61TP4zDe+YR8Qs5pB+Pp23YRydrpMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=/CyZEPJpAlcZassSDf6yPEl3fpuFiplGVJNrFAE1PjY=;
	b=QiMfb78X11T9xHP4n7a/ByAPbBWoJBf5QSjjdz3uu1bRQb6HpSz+jFnI3924nrlMSI1nr3
	XF1289B2KoIGXfCw==
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
Subject: [patch V2 31/38] x86/apic: Provide cpu_primary_thread mask
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:48 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_120251_172210_D43F06CE 
X-CRM114-Status: GOOD (  15.72  )
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
