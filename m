Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C76C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S8XndBbfeHlN/Jsk6VQY41n9DagsDdiO8PZWPGLR9/Q=; b=EdMqzf9QGylUGY
	MGLP8W90+ygjn4tIaKjP3QTSHn9mncdIB6u3KvRxbaeB+F/2ymejgb3YZ9nsMYnwVW7Eja6Ti+jCQ
	OCod1jxpdyiUoj0YKJHDOdckLlV/+74m6mkiCWryQU/1ZrUIl0krmGsPdN3LR9iLfJ6rJ+lUv4zlc
	f6gx0RskrFVeECkwoUoAGD7ddQytSdhegn7ja6k5vEw763w6o6RMocRSTFScDroEJB+o4rT9HD7yw
	FfUt3ykYRZZnIndU6Cp9c8EIrx3lI36X4C33ov/XF7o2f6IUgPkxdlYuuEsym3WUDgVzR3IE+ANjT
	2LVqq5JR6TVrRC+8Zw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8aL-001m20-Dt; Wed, 19 Oct 2022 12:54:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8Zh-001lQA-L0; Wed, 19 Oct 2022 12:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666184013; x=1697720013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eAJHzmzMTNBBml1IsEoRlVhesYoAxbHDrFN9XFoP2BA=;
  b=sS2wubi8+HSkJMYHyYOqBrvpH1GfsIFCIi++qFYMmziXIQZIs5WMg7yv
   XNKfmRHAWokwQs5eUqPAQKw8yNaCB166XQJ25Y7+h5fSUeRItn5XAzHaU
   kYHnkUwGh1cNun/yrDDPqRtxf9Q/QbSxwXkTTqACfNpswKBiisMhZIGmn
   zh3IHKEGDsfIuc0CtYnyxG4ZOHUO8XUtDzZXE7gTgAsHRVbSMNiOzpK+p
   PHO4tN1rQyx2xKFNYpA3C1klxLrxMDN1hh5rtbpvUW5y1NHi+amUXHUDH
   e/xzDeCkTQYWIbv7/5OTLwJY6+p1zoqAlMgJ61KWPXKZmZvgpzMH6YrE5
   g==;
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="185504900"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Oct 2022 05:53:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 19 Oct 2022 05:53:20 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Wed, 19 Oct 2022 05:53:18 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <stable@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <Brice.Goglin@inria.fr>,
	<atishp@atishpatra.org>, <catalin.marinas@arm.com>,
	<gregkh@linuxfoundation.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <sudeep.holla@arm.com>, <will@kernel.org>, Atish Patra
	<atishp@rivosinc.com>
Subject: [PATCH 5.10 1/2] arm64: topology: move store_cpu_topology() to shared code
Date: Wed, 19 Oct 2022 13:53:02 +0100
Message-ID: <20221019125303.2845522-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_055333_712077_0452570A 
X-CRM114-Status: GOOD (  16.03  )
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

commit 456797da792fa7cbf6698febf275fe9b36691f78 upstream.

arm64's method of defining a default cpu topology requires only minimal
changes to apply to RISC-V also. The current arm64 implementation exits
early in a uniprocessor configuration by reading MPIDR & claiming that
uniprocessor can rely on the default values.

This is appears to be a hangover from prior to '3102bc0e6ac7 ("arm64:
topology: Stop using MPIDR for topology information")', because the
current code just assigns default values for multiprocessor systems.

With the MPIDR references removed, store_cpu_topolgy() can be moved to
the common arch_topology code.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/arm64/kernel/topology.c | 40 ------------------------------------
 drivers/base/arch_topology.c | 19 +++++++++++++++++
 2 files changed, 19 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 4358bc319306..f35af19b7055 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -22,46 +22,6 @@
 #include <asm/cputype.h>
 #include <asm/topology.h>
 
-void store_cpu_topology(unsigned int cpuid)
-{
-	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
-	u64 mpidr;
-
-	if (cpuid_topo->package_id != -1)
-		goto topology_populated;
-
-	mpidr = read_cpuid_mpidr();
-
-	/* Uniprocessor systems can rely on default topology values */
-	if (mpidr & MPIDR_UP_BITMASK)
-		return;
-
-	/*
-	 * This would be the place to create cpu topology based on MPIDR.
-	 *
-	 * However, it cannot be trusted to depict the actual topology; some
-	 * pieces of the architecture enforce an artificial cap on Aff0 values
-	 * (e.g. GICv3's ICC_SGI1R_EL1 limits it to 15), leading to an
-	 * artificial cycling of Aff1, Aff2 and Aff3 values. IOW, these end up
-	 * having absolutely no relationship to the actual underlying system
-	 * topology, and cannot be reasonably used as core / package ID.
-	 *
-	 * If the MT bit is set, Aff0 *could* be used to define a thread ID, but
-	 * we still wouldn't be able to obtain a sane core ID. This means we
-	 * need to entirely ignore MPIDR for any topology deduction.
-	 */
-	cpuid_topo->thread_id  = -1;
-	cpuid_topo->core_id    = cpuid;
-	cpuid_topo->package_id = cpu_to_node(cpuid);
-
-	pr_debug("CPU%u: cluster %d core %d thread %d mpidr %#016llx\n",
-		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
-		 cpuid_topo->thread_id, mpidr);
-
-topology_populated:
-	update_siblings_masks(cpuid);
-}
-
 #ifdef CONFIG_ACPI
 static bool __init acpi_cpu_is_threaded(int cpu)
 {
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8272a3a002a3..51647926e605 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -596,4 +596,23 @@ void __init init_cpu_topology(void)
 	else if (of_have_populated_dt() && parse_dt_topology())
 		reset_cpu_topology();
 }
+
+void store_cpu_topology(unsigned int cpuid)
+{
+	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
+
+	if (cpuid_topo->package_id != -1)
+		goto topology_populated;
+
+	cpuid_topo->thread_id = -1;
+	cpuid_topo->core_id = cpuid;
+	cpuid_topo->package_id = cpu_to_node(cpuid);
+
+	pr_debug("CPU%u: package %d core %d thread %d\n",
+		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
+		 cpuid_topo->thread_id);
+
+topology_populated:
+	update_siblings_masks(cpuid);
+}
 #endif
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
