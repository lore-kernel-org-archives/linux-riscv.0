Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DACC4727E
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 00:18:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC9B3207F7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 00:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hh3mioN/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Snu1ixFB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC9B3207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=59Q2UwSlP3JwVJGsARNCyokmWaqg5k79nuJ0Yb9oNgU=; b=Hh3mioN/vDZuzrpIeiEVkQAMs
	S1B/Rx4WngtDEGfCMFkHxlzPhmOZM8c4LL03DC5TZAhighZx7wzMOJJYLUlI+nrlsI/fP0asS8Pfr
	mL7w8qBD3boBhqoQOCi+B4RNrQFDO9blCqFlq7YsSe2XlRP0kDGGZN1hENrabFQEoerSFonhq1y6b
	CP4xBVV3Vlmh2ENRoYuKTnMZK+uZ42yqERFrLkazJMx5IoWE43e0V1UF5uL7Bx60dNWwIxKWNmouG
	1hZmkwIPFtJgrQzd7CiKLknsykbn2ZSZzkMZFf/fpPskIoOitG0LcprvkAKuDPjUmHj1INCnEgkOc
	SwH6VPOjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPagA-0006qX-Ln; Tue, 06 Oct 2020 00:18:06 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPag7-0006op-JD; Tue, 06 Oct 2020 00:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601943483; x=1633479483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jfrlgXznAUc7CfJc5sdSM/Hlx3h6V83dfBBFaAjyQXg=;
 b=Snu1ixFB4xGs53LOxv29TyYtLP0AV1AqubIkYQMO344D9J4GJsrMeI2S
 L4RDyWBNUXkSuC8jxktV4Ne3cAjk6CKSrYq319ecGaKWJ7XZ+2PmITmqg
 BdxvD88uTwZf9TpsG4VmEogRwhowL3xSWJx6mybn//3GoxHk9ZfrgCVjq
 VMsVDSikQevl75B4eOxOLpfzMcZPAVzy6gCK7L/E9btabScnqAmTPui1p
 RpGuXxeWShqofVas7ML1TxMujcNtmVtqEdN+J94gBF2tPRylEQ75Qqax7
 6/N9/wYVFuGxmfej3HHTawESc1pJUWawgKvkWIRPuC5IDnmQkrxs2cdfB g==;
IronPort-SDR: t6mbJ/vPwGnm7163M0R2Xc0qDmaJ+/pEngVKtcN5XnDXwIRKsTCHYeHUVyHW3DZcpzL4G0J6GJ
 5wZaaTI+/lKeqUDs20mny38EbCau6n8JuOuaCarLxzIF481y3T3fHsvagZdd68tMu9sSQOgSbZ
 NQqvrHu5jVSETmDrQSCtLgmsP7vdMslBF7MJxkblJgdtWRrbRCHqHlSYiBO28fKcklxn2YRAL5
 rDijnEiuF2ttpRLvl/I+v90+sjjFwkKOczTbXWyzFmu9GB6f5n8mmqh9xGc8BAqi9Bed5MC+3t
 9Vk=
X-IronPort-AV: E=Sophos;i="5.77,341,1596470400"; d="scan'208";a="153530920"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Oct 2020 08:17:58 +0800
IronPort-SDR: Gu1rSGie/KwUS4IsMjZBAdNLOu8U8mJD33o5e1V2Z3rOPj2xTZHoyDKwOiXk9tclOYuOJe+E1T
 uuL//xoDhlBw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 17:04:44 -0700
IronPort-SDR: E9y87SoW9Zy1q10ZwSTIl1B/6F0q/o9ZwnaI3zF+SSqC1S0WPF6vC59m4/JceurnRxcJWNVi1O
 WwUbQuSG8mRg==
WDCIronportException: Internal
Received: from b9f8262.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.253])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 Oct 2020 17:17:57 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] arm64,
 numa: Change the numa init functions name to be generic
Date: Mon,  5 Oct 2020 17:17:49 -0700
Message-Id: <20201006001752.248564-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201006001752.248564-1-atish.patra@wdc.com>
References: <20201006001752.248564-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_201803_830753_31AC164B 
X-CRM114-Status: GOOD (  19.79  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Jia He <justin.he@arm.com>,
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

As we are using generic numa implementation code, modify the acpi & numa
init functions name to indicate that generic implementation.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 arch/arm64/kernel/acpi_numa.c | 13 -------------
 arch/arm64/mm/init.c          |  4 ++--
 drivers/base/arch_numa.c      | 30 +++++++++++++++++++++++++-----
 include/asm-generic/numa.h    |  4 ++--
 4 files changed, 29 insertions(+), 22 deletions(-)

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
index 73f8b49d485c..74b4f2ddad70 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 
-#include <asm/acpi.h>
 #include <asm/sections.h>
 
 struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
@@ -444,16 +443,37 @@ static int __init dummy_numa_init(void)
 	return 0;
 }
 
+#ifdef CONFIG_ACPI_NUMA
+static int __init arch_acpi_numa_init(void)
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
+static int __init arch_acpi_numa_init(void)
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
- * last fallback is dummy single node config encomapssing whole memory.
+ * last fallback is dummy single node config encompassing whole memory.
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
