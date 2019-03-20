Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30900C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 23:48:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B98218A5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 23:48:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UAQa79Ja";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="EXCRSH6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1B98218A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCc0Bc/d8qAB5G0uBg2u20mNbhv5Hkli8whZ8T/TuFI=; b=UAQa79JaEOUusq
	ADB9INEm/1T4DzSDgD3TUAZ3PrnFyMrHMzwJkE3coVYZzptwzuu4EYvzhKD1tLcoQ6t/EU9IJE9lt
	ooYc4Z3q9YsDMccNjdAoEZIm3D4IyEc/BE6qOkt6vBhk8D5jtdw7gTZhE0XeWotsJKd/YuYzcVZRc
	PGD9FtLOpV7ZhGXimVqZFN0MtvUGNeAv3anh0Qk+8VsPpKCcAp68Mm99v04+QPeKqDj2P9ip1tsbU
	3M0Q+YKyB6edQf9nyIUbYmNfiJxlENJsipmFxLRBPq8BMG8tVd2hk/N67MUQ2XkQY0U5kZtvcBR7m
	9afbMjVUKon8zNwEdXTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6kwa-0001Wu-QC; Wed, 20 Mar 2019 23:48:24 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6kwU-0001P3-Ue
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 23:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553125698; x=1584661698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=clP6NMFQMwOD3n54p6gFwQhrqNU04Jf2cfalAdxHECo=;
 b=EXCRSH6M95NH5rSQ5VPlUyQ3Z97w3Jj8ki5tj5lMrTiy34qM/TbTtT6Q
 2AYkJrbs7RLhdWrR9ofkkX40bnLf/BqJ4Ro3ngpY4VGYkrEZqTuQLdO8L
 sMEhq1aQ9S533ICxqKXSGl9sruI1h45kLZcc3xrgM5vl1Hdew6iGv4J0A
 zaS0fM14vMN4bY7NYwJIy187cBFNPPLDHSouwQJF0mLp2cmLlSks4EmwO
 P5HBVPQhD6nQvtgL0YUuORRNaBF4Ar+7fsthAnIy2v2d6vJBCp+COlTAI
 otuoDjP9O5YOWJ4j5AISBozxxYaFAtYsyOcvp942K3+JM44s/1Dz+0ds+ w==;
X-IronPort-AV: E=Sophos;i="5.58,498,1544457600"; d="scan'208";a="209432745"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2019 07:48:16 +0800
IronPort-SDR: GiRdY+UnApTGV+APexLiuq3lsZ7eI5/LMfX/mEFnAl+IllUOXOJJJMaj9qk1EaCYx2+BqW9xJ7
 Hgu7oTiBmeqDyCwMwX0lnXM8Sa3NO62Irf112AF818QTP80ZmGNUfRNkvqgsdYSFlLh3JFfRPa
 kAhf/Ql8RzSM3093xh2gFUytHYEFClvwYhY5qTEyET04yjFHNiU3FkNHUeHZRrsZ7lTjBVAL9z
 Aa/jTWm7ibJkbgqUhVNQct6RAGlbKGi97OnwlXX+gDntyJsVJMAPAS2PiVEbdTVjMTGQpkJ+YD
 Pipn3HKw1AzqW66PnIqvRn9s
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 20 Mar 2019 16:27:53 -0700
IronPort-SDR: /1pYslUX5TWJJ4C/tLDjSgJrKkGzmhVYGb+STzhMnVSd782VWNJaIqLSzzK3O2t1mZ9460YR5O
 Tk70+87aq32vJCBZ+uyObTfeaJwfG5RPWcf5Sit8WkHkNjUqegyMsgDioCyApcrCMMkJSKAx3A
 +fjtrzVFHjMsFeUJvY2PdBkkHua84WmCaofCHM+pFnIxOHEfUvtc1q9F/zcTHVLlK9pIQF0Hoi
 m8ulEDu8m85a930yWJy+sh5f3yLp8XkudMe8TIDJcP/xBknERMQ1ccK7IzM5cQbZpRmqlRbO1i
 O2E=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Mar 2019 16:48:16 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT/RFC PATCH v3 4/5] arm: Use common cpu_topology
Date: Wed, 20 Mar 2019 16:48:05 -0700
Message-Id: <20190320234806.19748-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320234806.19748-1-atish.patra@wdc.com>
References: <20190320234806.19748-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_164819_221377_3928BF0B 
X-CRM114-Status: GOOD (  12.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Johan Hovold <johan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, ARM32 and ARM64 uses different data structures to
represent their cpu toplogies. Since, we are moving the ARM64
topology to common code to be used by other architectures, we
can reuse that for ARM32 as well.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/arm/include/asm/topology.h | 22 +---------------------
 arch/arm/kernel/topology.c      | 10 +++++-----
 include/linux/arch_topology.h   | 10 +++++++++-
 3 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/arch/arm/include/asm/topology.h b/arch/arm/include/asm/topology.h
index 2a786f54..52f99ec8 100644
--- a/arch/arm/include/asm/topology.h
+++ b/arch/arm/include/asm/topology.h
@@ -5,26 +5,6 @@
 #ifdef CONFIG_ARM_CPU_TOPOLOGY
 
 #include <linux/cpumask.h>
-
-struct cputopo_arm {
-	int thread_id;
-	int core_id;
-	int socket_id;
-	cpumask_t thread_sibling;
-	cpumask_t core_sibling;
-};
-
-extern struct cputopo_arm cpu_topology[NR_CPUS];
-
-#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
-#define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
-#define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
-#define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
-
-void init_cpu_topology(void);
-void store_cpu_topology(unsigned int cpuid);
-const struct cpumask *cpu_coregroup_mask(int cpu);
-
 #include <linux/arch_topology.h>
 
 /* Replace task scheduler's default frequency-invariant accounting */
@@ -38,7 +18,7 @@ const struct cpumask *cpu_coregroup_mask(int cpu);
 
 #else
 
-static inline void init_cpu_topology(void) { }
+static inline void init_cpu_topology(void) {}
 static inline void store_cpu_topology(unsigned int cpuid) { }
 
 #endif
diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
index 60e375ce..0ddb24c7 100644
--- a/arch/arm/kernel/topology.c
+++ b/arch/arm/kernel/topology.c
@@ -180,7 +180,7 @@ static inline void update_cpu_capacity(unsigned int cpuid) {}
  /*
  * cpu topology table
  */
-struct cputopo_arm cpu_topology[NR_CPUS];
+struct cpu_topology cpu_topology[NR_CPUS];
 EXPORT_SYMBOL_GPL(cpu_topology);
 
 const struct cpumask *cpu_coregroup_mask(int cpu)
@@ -197,9 +197,9 @@ const struct cpumask *cpu_corepower_mask(int cpu)
 	return &cpu_topology[cpu].thread_sibling;
 }
 
-static void update_siblings_masks(unsigned int cpuid)
+void update_siblings_masks(unsigned int cpuid)
 {
-	struct cputopo_arm *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
+	struct cpu_topology *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
 	int cpu;
 
 	/* update core and thread sibling masks */
@@ -230,7 +230,7 @@ static void update_siblings_masks(unsigned int cpuid)
  */
 void store_cpu_topology(unsigned int cpuid)
 {
-	struct cputopo_arm *cpuid_topo = &cpu_topology[cpuid];
+	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
 	unsigned int mpidr;
 
 	/* If the cpu topology has been already set, just return */
@@ -302,7 +302,7 @@ void __init init_cpu_topology(void)
 
 	/* init core mask and capacity */
 	for_each_possible_cpu(cpu) {
-		struct cputopo_arm *cpu_topo = &(cpu_topology[cpu]);
+		struct cpu_topology *cpu_topo = &(cpu_topology[cpu]);
 
 		cpu_topo->thread_id = -1;
 		cpu_topo->core_id =  -1;
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index d4e76e0a..7c850611 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -36,17 +36,25 @@ unsigned long topology_get_freq_scale(int cpu)
 struct cpu_topology {
 	int thread_id;
 	int core_id;
+#ifdef CONFIG_ARM_CPU_TOPOLOGY
+	int socket_id;
+#else
 	int package_id;
 	int llc_id;
+	cpumask_t llc_sibling;
+#endif
 	cpumask_t thread_sibling;
 	cpumask_t core_sibling;
-	cpumask_t llc_sibling;
 };
 
 #ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
 extern struct cpu_topology cpu_topology[NR_CPUS];
 
+#ifdef CONFIG_ARM_CPU_TOPOLOGY
+#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
+#else
 #define topology_physical_package_id(cpu)	(cpu_topology[cpu].package_id)
+#endif
 #define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
 #define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
 #define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
