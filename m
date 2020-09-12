Return-Path: <SRS0=wYeJ=CV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834EDC2D0F6
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 01:35:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD8A6221EB
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 01:35:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TOF2eWkQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="axZMIljT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD8A6221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y90KrLZhXDpIoXgMv2bu8zG13FmDpe7LTdd4WpWKeTg=; b=TOF2eWkQcgZGaDex2aBukdU0M
	uEP1LkQB+s2G/TW9rTpUVwtLIRFfGdrQxT9PtloaXJ40sW8VMTCqJ2JpsVscS2C76FLgPB+ke7Vpv
	onFqvGoWOZ+87EOxAAqctjLgQ8GNYJCL6JeuYNYnqdr9pap80aCvLv1WeFLmZu5uxsnOMIAlpsgYS
	TEBo94YcXwALtvsu1OkPcOz93HfSdwZXROGw1hLlII+5HFMYqC4DMwQJE4HA1He48utSpPZbkyl1G
	RsuPn1RIxNJ+Mj5zWb78c8JBfyTLbPe8A6XHU+QzJit0mbmyTzUXzD+hlKrLWywKQdh3AjK8AtTMu
	SNQx0SHRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGuRH-0003w4-4r; Sat, 12 Sep 2020 01:34:51 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGuRE-0003tl-6B
 for linux-riscv@lists.infradead.org; Sat, 12 Sep 2020 01:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1599874487; x=1631410487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tbb0dwy6D9iYWS1kPOnxa+vdqEyJ1+ag9dCJR1CHDY0=;
 b=axZMIljT3sSfWB2zJ4WiAaFgcFGLlzwP8Z/OnHFjb0CuwCN/QHBKQ6L9
 gkNROkfnamuISKc2LPRkWOmO1HpNO1vX+FXYZWkCrJut9d5qeZcmslmhd
 xWslvBZ7LJBPA2cEl5JDsqgPj6+by5RC7OgMF/bJVbshN9YWm9QhwXDm3
 u7IZ2NSLazG1mSO/bMcQk52lhArBnmpqA+kpP6m4t9cnLheRDzNtEJe2l
 fYuaICIp+M33Uf265cEwlmkvmaM+paQs1Rc9GGH/VX0pgi8EETW7n6XM+
 UwnVr40ERCEFz4miF1w3hqPIgk5ZC2nuQQANCG29mieM6lltuwMkr+GUF Q==;
IronPort-SDR: yLRDbKd49/McXKRrNbHR3fm6vqYo8gDwmVhNufYf5KY94gMuvZln8POmubCbtHDNwqjSC3y4Ep
 e6VTPtNbRGQAaBEtOu2hRAdVkV03zzNdLdmSE9arMW7q9Yc+1HMYOnDJPFdY2DSoM+pdgaQflh
 aOamxgGaHbatgJiNwpbMh4TCTHFgFedywnNrfj5gffEQ37ehf2yDCyam6MVSgBfjcPppftdG//
 rN4x4QrQO00qCdC/n0UrJF/v0wX6DJ0omW+bDCVHnSPjQhKlBGqjSsZfHD1hUUlahXI46yn12d
 YWM=
X-IronPort-AV: E=Sophos;i="5.76,418,1592841600"; d="scan'208";a="256787991"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Sep 2020 09:34:46 +0800
IronPort-SDR: 9ub9WieJ1HPGDt7deSBpzmHCPc6XCJIW7hWSFIpA/m55IFTrrmcqUHEc+aViYOVHf169SlY/zJ
 d270zBdbi64Q==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 18:21:07 -0700
IronPort-SDR: hu6MvwAluDkqpVTgl2uVsaHk+jsK3Sr0U4cnByviLCrw2u2Q4CzH4YrOtkM8MDFlEF+vRjGGOs
 P37IHm8lszDA==
WDCIronportException: Internal
Received: from unknown (HELO jedi-01.hgst.com) ([10.86.59.229])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Sep 2020 18:34:46 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC/RFT PATCH v2 2/5] arm64,
 numa: Change the numa init function name to be generic
Date: Fri, 11 Sep 2020 18:34:38 -0700
Message-Id: <20200912013441.9730-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200912013441.9730-1-atish.patra@wdc.com>
References: <20200912013441.9730-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_213448_378107_347896AE 
X-CRM114-Status: GOOD (  19.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Jia He <justin.he@arm.com>,
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Steven Price <steven.price@arm.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

As we are using generic numa implementation code, modify the init function
name to indicate that generic implementation.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/arm64/kernel/acpi_numa.c | 13 -------------
 arch/arm64/mm/init.c          |  4 ++--
 drivers/base/arch_numa.c      | 29 ++++++++++++++++++++++++++---
 include/asm-generic/numa.h    |  4 ++--
 4 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
index 7ff800045434..96502ff92af5 100644
--- a/arch/arm64/kernel/acpi_numa.c
+++ b/arch/arm64/kernel/acpi_numa.c
@@ -117,16 +117,3 @@ void __init acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa)
 
 	node_set(node, numa_nodes_parsed);
 }
-
-int __init arm64_acpi_numa_init(void)
-{
-	int ret;
-
-	ret = acpi_numa_init();
-	if (ret) {
-		pr_info("Failed to initialise from firmware\n");
-		return ret;
-	}
-
-	return srat_disabled() ? -EINVAL : 0;
-}
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 481d22c32a2e..93b660229e1d 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -418,10 +418,10 @@ void __init bootmem_init(void)
 	max_pfn = max_low_pfn = max;
 	min_low_pfn = min;
 
-	arm64_numa_init();
+	arch_numa_init();
 
 	/*
-	 * must be done after arm64_numa_init() which calls numa_init() to
+	 * must be done after arch_numa_init() which calls numa_init() to
 	 * initialize node_online_map that gets used in hugetlb_cma_reserve()
 	 * while allocating required CMA size across online nodes.
 	 */
diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 73f8b49d485c..a4039dcabd3e 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -13,7 +13,9 @@
 #include <linux/module.h>
 #include <linux/of.h>
 
+#ifdef CONFIG_ACPI_NUMA
 #include <asm/acpi.h>
+#endif
 #include <asm/sections.h>
 
 struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
@@ -444,16 +446,37 @@ static int __init dummy_numa_init(void)
 	return 0;
 }
 
+#ifdef CONFIG_ACPI_NUMA
+int __init arch_acpi_numa_init(void)
+{
+	int ret;
+
+	ret = acpi_numa_init();
+	if (ret) {
+		pr_info("Failed to initialise from firmware\n");
+		return ret;
+	}
+
+	return srat_disabled() ? -EINVAL : 0;
+}
+#else
+int __init arch_acpi_numa_init(void)
+{
+	return -EOPNOTSUPP;
+}
+
+#endif
+
 /**
- * arm64_numa_init() - Initialize NUMA
+ * arch_numa_init() - Initialize NUMA
  *
  * Try each configured NUMA initialization method until one succeeds. The
  * last fallback is dummy single node config encomapssing whole memory.
  */
-void __init arm64_numa_init(void)
+void __init arch_numa_init(void)
 {
 	if (!numa_off) {
-		if (!acpi_disabled && !numa_init(arm64_acpi_numa_init))
+		if (!acpi_disabled && !numa_init(arch_acpi_numa_init))
 			return;
 		if (acpi_disabled && !numa_init(of_numa_init))
 			return;
diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
index 2718d5a6ff03..e7962db4ba44 100644
--- a/include/asm-generic/numa.h
+++ b/include/asm-generic/numa.h
@@ -27,7 +27,7 @@ static inline const struct cpumask *cpumask_of_node(int node)
 }
 #endif
 
-void __init arm64_numa_init(void);
+void __init arch_numa_init(void);
 int __init numa_add_memblk(int nodeid, u64 start, u64 end);
 void __init numa_set_distance(int from, int to, int distance);
 void __init numa_free_distance(void);
@@ -41,7 +41,7 @@ void numa_remove_cpu(unsigned int cpu);
 static inline void numa_store_cpu_info(unsigned int cpu) { }
 static inline void numa_add_cpu(unsigned int cpu) { }
 static inline void numa_remove_cpu(unsigned int cpu) { }
-static inline void arm64_numa_init(void) { }
+static inline void arch_numa_init(void) { }
 static inline void early_map_cpu_to_node(unsigned int cpu, int nid) { }
 
 #endif	/* CONFIG_NUMA */
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
