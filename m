Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695A5C433E4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 21:48:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29B4B20716
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 21:48:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bnjMq63i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="jSRwSQr6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29B4B20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e/rQ660kNxI6ngdl0+eIwVf0QgHYrkpiw9PNwViUGO4=; b=bnjMq63iwMP1zcVJmdgnWpAhG
	HhjAT+SBx5DHyIwahHXY3oEDMjtxpyK4qHlB8rM8kGIVXJojVUn+S4YVtFMz1bixtxSjibVjOG5Tr
	o5PW6SEL5oHQ1ryaBGO1zIt23yJNAHhGoStWv+/VkV0vJFOLxSkKwaevZJVsQn6ZhIea9lRJN1brh
	0gLip0+6oojHh27ye15VTuw1T2nowirhnH70yJUzAh1ZPY0b0Ax1n6H6CSqKV2tqq0X/Qx1mp6TFx
	0+GaJGiWpi0MpZBlCuk7yi/In6byK76B+WJoEvmcWekY7DtuK9kiLgxOojDdeX7KJC2hU5bAxGxld
	WigsnmC5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6hZ4-0008Mn-P9; Fri, 14 Aug 2020 21:48:42 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6hYu-0008Im-IC; Fri, 14 Aug 2020 21:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597441712; x=1628977712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m0ccOUy/zHhyg/Evs7xmin4JSbqfjO8+1dBWk5YQiwo=;
 b=jSRwSQr64jdaqiC3Ynhre5kBxzIlz3K/hlcjCrpyBUwkNcuSq8dv18O5
 nEd2tHOLWKxCGwiF8Aj3OwzeiMWYIpaWBb65H7nWVMFQTHbb5LQ9Rb1rk
 5Nmm1Cn1uUMFdCfbYfvrANJ6rgNxz9v74/L4di7aETO8LOrBKyhr4rmbl
 /JIaVPgjXLrQC3fCA6y1z8UqG06E5Zt4x3gW5eh1HeqhCjfecQQbpzBN/
 x/aPdMwpIHt+QsDEb00cTbyTx1qvy8WLpLyYYHQ3s+xACj9Y3vz4Xy6Ss
 gmZ6DjDgAM705xHq1oMg/Vtqm01HUuPLZ7KqsBHaukLonQQmzZYAuynXA g==;
IronPort-SDR: BtPbD4b9df59uMKe/DfULewHf42AryRy39fAPBOqXzsjRPnESqVmAQP1ngcRjIDRICwvRS5dIz
 7Q6hAz7SxM+bMDuZfHejuU0M0vVLTXXkaCEN5q8EiMoDvu+cOikP4TdW824Y/1h60cMiidmrLk
 dvQVe/X9m9difa1zLpE+nOojSz0EtS8i+ybwwJmr9j1GQDoqRgiCEcV3/Jzj/FeFtzu4xs6WCh
 ICr0O7b4d6am/xqE2Gn5uIEpJoBdkeRuX8x4Ps9Rym6jg2kS01HHNiQvKT8s5wxq4zbLDlvsdh
 1RM=
X-IronPort-AV: E=Sophos;i="5.76,313,1592841600"; d="scan'208";a="254397127"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2020 05:48:29 +0800
IronPort-SDR: eS2zB4tpOaaq/YuC9cGDWd8cgstBrVgLL8lnbgQvK/mHmLT5qUtRpdMG1bR6wdNwpJazKyZO7q
 REBbKVceSlyg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 14:35:35 -0700
IronPort-SDR: 2DVjtT6pQ6aK8cobzGLIr5QvsxKqDYZY5QAG/Ddtcd0GZ8GIwoCQOm4wZ3qrCTJjgmFEssxSQT
 4a2SYWxH1DIg==
WDCIronportException: Internal
Received: from cnf006060.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.56])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Aug 2020 14:48:28 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC/RFT PATCH 2/6] arm64,
 numa: Change the numa init function name to be generic
Date: Fri, 14 Aug 2020 14:47:21 -0700
Message-Id: <20200814214725.28818-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200814214725.28818-1-atish.patra@wdc.com>
References: <20200814214725.28818-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_174832_778953_41543480 
X-CRM114-Status: GOOD (  16.80  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

As we are using generic numa implementation code, modify the init function
name to indicate that generic implementation.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/arm64/mm/init.c       | 4 ++--
 drivers/base/arch_numa.c   | 8 ++++++--
 include/asm-generic/numa.h | 4 ++--
 3 files changed, 10 insertions(+), 6 deletions(-)

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
index 73f8b49d485c..83341c807240 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -13,7 +13,9 @@
 #include <linux/module.h>
 #include <linux/of.h>
 
+#ifdef CONFIG_ARM64
 #include <asm/acpi.h>
+#endif
 #include <asm/sections.h>
 
 struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
@@ -445,16 +447,18 @@ static int __init dummy_numa_init(void)
 }
 
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
+#ifdef CONFIG_ARM64
 		if (!acpi_disabled && !numa_init(arm64_acpi_numa_init))
 			return;
+#endif
 		if (acpi_disabled && !numa_init(of_numa_init))
 			return;
 	}
diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
index 0635c0724b7c..309eca8c0b5d 100644
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
