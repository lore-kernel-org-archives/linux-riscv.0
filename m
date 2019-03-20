Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19532C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 02:31:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB89D2183E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 02:31:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ru0tjm4J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0KVmnjyY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JUiGQG18"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB89D2183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCc0Bc/d8qAB5G0uBg2u20mNbhv5Hkli8whZ8T/TuFI=; b=ru0tjm4JYKJj+Q
	ShiueTzBx1PH9iUdBn99PQo8+kBiEMMa95/466hfwIiQiF0+CDipPzbwh2j4psR1b68oabPUrDMUN
	2su40AZATZfVgMaLNUYHpI4Zm0QADBaLuHxskRBlQbyokkcd3l65VtoOp++Wn9axaTtD9PsaqUhpT
	7CLqPlnGDwvqRJHTobV9Ia/7qAfPcMcccneRsAkPXVmx052Xue0wfiADkLglEk856GO3eEVFBBQgy
	kP38Y5SJ27pC2DCsrYDjwjB0kKhmZBQL59AbNN/GooVjux58tlVtwT4XECCgZ+GTSKmTed7ZEgaYD
	bOdeTS/hoP1Khs1RgF/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6R0Q-0007TY-Ml; Wed, 20 Mar 2019 02:31:02 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6R0O-0007R6-VP
 for linux-riscv@bombadil.infradead.org; Wed, 20 Mar 2019 02:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6SZ4XhXjV5vqZvElaORVn8YwgWY8MepX+6i1Uml0ZHM=; b=0KVmnjyYeDhv6XeFFEpklMlq7x
 IESQyK0vu6CN0JEt7cRkK2DN2Pk9twsfdE4DRl5Fynux4HQVFTnGRMkqKYoGDTFT7ieESgfSctLof
 HgwKV9EWaionCM+cTWcufFiYAEOGeiP64nUjc2QvU6zp7ZVwcbXyIxsqiSqOm5CSnSrijR0MOQ2LE
 houhWJYTOdpPa5D8M/35yD9WcQhrT0w74/VWSdKk6ZDbRw1pdjNpdBzM1cTojwwOFMu29ARzber3h
 vSsHOxpZqxRQGdp2xnO0uqK36BM+fjnAZcJR7tEXn/cj8PSLwEUYrHDyjx53ZvyaT9EzSRh3SVw7x
 sFCHBgkg==;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Pxc-0007Xx-7k
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 01:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553045044; x=1584581044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=clP6NMFQMwOD3n54p6gFwQhrqNU04Jf2cfalAdxHECo=;
 b=JUiGQG18RfvPCbwMR+1MFW+xhej2mGf+MpysIROnoqpp31mz41x5C+bq
 lVIpeRjdXjsf/trrTd9YVPNx0nTyDAGU0SREwSBudQZ+990KoRDx0rdCL
 HgCFLa/IRTV8ga4tYLZhv9dvKEObgN8vr06tiGpf+9dEBUt/JzHl2Qm45
 4dFTc2WYrH3xxoiy4a02Y0AGLk/jDBLBrz6tp6JwsoRxnOphCs7+KUSor
 yV67Xs9bCHuIQ/IqyOrlgIp1hudMjM6LPBHLW2NYMXDL3qRmn0ADr9raF
 JP376Kri9rerXD/3MrWeZE3dWf1dHgioveVcMP3nDKGSHQvs66KBuojXz w==;
X-IronPort-AV: E=Sophos;i="5.60,246,1549900800"; d="scan'208";a="105533382"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 09:22:59 +0800
IronPort-SDR: LTzCueQwGGCm4jXO1LQdxvnHzSWpkSo9VmSjqUSbvAz2OXDAPShrV6Ggu+zpUkkw3kemf0tYla
 YFfesSNLhE4kHQe3WrbUzNZbrJxNPzYH77nZHAcobbCc0+mFaq4iJDhoETx6VmBIyMZbyQANdI
 FGII5cvZc2lInl6FI31xcs2rWOSqzpJQmkTUlkHdql2QmTyazKzsbAQyXy/fIo2fB6WweoNgWg
 TQRZlY++N0O6v/9l/9rHDTJUwJtMIiACLdMT1sANWxfvhIeeRUVn4XcBVwRssYr85qAluYPWus
 684Bu5zF8sZcDqUP2MUTxnD+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 19 Mar 2019 18:00:36 -0700
IronPort-SDR: Mm5ffHnMXLnxzR1GUSYNkrtLoY2+7RghWhnwm3rbWmIpX08gxIVYkBbEC5fVJZJ9NDkJDK9Xin
 FhOTRoW7BlLxIMunZBjIBu0QNT6ma2EmmYIAWko25FHzceSMVH1ysTi8VHGeFo2mgdzRuljAhH
 dOsnYATokewlBOXrwwg8owTuQL28346eGYMJ+BUgEbg/nTNxtoRwgt7vyulnZowRtjtbpyGTNi
 MvpVbRYG7k13jQD+ietuBwFSjIxgDdPJnghQFwFrRBYaoSfnU+/UN0v72cNq7CPhPB3ppX79iI
 ISc=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2019 18:22:59 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT/RFC PATCH v2 3/4] arm: Use common cpu_topology
Date: Tue, 19 Mar 2019 18:22:50 -0700
Message-Id: <20190320012251.2728-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320012251.2728-1-atish.patra@wdc.com>
References: <20190320012251.2728-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_212404_467755_474834A3 
X-CRM114-Status: GOOD (  16.86  )
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
 linux-riscv@lists.infradead.org, Morten Rasmussen <morten.rasmussen@arm.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Ingo Molnar <mingo@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
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
