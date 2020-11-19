Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D86EC63697
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 00:39:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 807F222266
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 00:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P4wp9tsD";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="mlvuIpG5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 807F222266
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3kFVN7AoXODPQpmDeIOcPj8rkl8vpgbUAjzpt6KI0hc=; b=P4wp9tsD5qnmKjgZN9pAq0Cgh
	FSXUhq4JveCvEe92K9tA6WsUUwbY6DCaCT7EqLoA5lan9yoUp2MBkl9ZGKPypS/x7FvQOEVeVyVhx
	TGsAlBD7rkZDuY+QKpi6C1cDbNMsZKMs+4FhPh+dsUzueGR1QvWtFTyPcJowNtmIrFyISxwJ/Aske
	2uUUvTN3OZ3Wghvd6bw7SQqCv9f4N9CGttqDBZbu7MQ7UxN3FFW88P3vgdYWpU7dAMQPW4WHPJRlT
	zAPbESDlOKuIe5XET4FYDZK1C+SubGKy174AG/s6sTFv2KkaLgCOYjjVMyZ93CyDH4WFscfwJB/oe
	bmvo6nbOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfXyK-0006ER-Sq; Thu, 19 Nov 2020 00:38:49 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfXyB-0006CB-Vi; Thu, 19 Nov 2020 00:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605746719; x=1637282719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d3s03R5W/P58NhdkaX/eI00Uo7wjk8iETPnJwkMJkhA=;
 b=mlvuIpG5Csi2S9jMEBrK5H0Pqv3QfKOZ2RoILWSXuP4cgGn17aFyEgob
 kXXCkPNqJa3KUeBdB9YyS93TIC4E2Xv9rtvQDzJMCKvV/1A0n2o5H1Q8N
 YSGjVlz4a8MWLTNex3Nfu/GpyPHU4/sCk0IBmilXHnhfC3mWU6tg6/up1
 0gXDpt49aJH+cT/Thg+g7dUSprI521fdn8dMJiyLkGcouxvb4O0ho9WRw
 ccmm/5FTCNctQa/fDab+2WKa+5XjIQFBQrne72u99/CrkiCgx0I44w7LE
 ZHOYswPM6pPFeE2tsYq/EQry+1ExNU3aVZ5aEaKLou4w+3FhD6CFY5lOX A==;
IronPort-SDR: 2TsehCXqcKhhak48LykbdNEd2oFRzboeDnCV8t62Ts5wK7DYkTIy0Vt7ah5yT/j38Pdzb4BcEB
 qxgX9NK8mg9jwmCtzFCYjL+9quHuaz1prp4oE7HgyEFbmtOQVzF2bCvOqG0J4shETOHH9MeQ+F
 PsE6W3bwrmpY+BzvUdLQLlyABTG54rwFXLX2q3RWGtFczDQGs9r7RLoaBR7oPvkzSqojevmCAT
 PoWC3oRQiO5qN3S+Ho3vRik1u5efjXVcvE2EY4oV2LMHeOmCzfBVr/Q/hE1S8Mi73XCLyenLXS
 bW8=
X-IronPort-AV: E=Sophos;i="5.77,488,1596470400"; d="scan'208";a="256529096"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2020 08:45:14 +0800
IronPort-SDR: tzQG3hhWzNf5fe9ifx4rVj5Dk9pCN3OxgVwygxOsU9hd0DKIBT9o1T32ZSySdUTg5rE0dmr0cB
 ktKT5MMClCXLW2UfwIyZ6X9KiAx5Sc+w/r7yphghgOOaoUaq2u5Mi0i7oTkwBKETs5zbYG0kdK
 sPBiiarv6JnyGPJR8Me1Y7SaDDHLLjJnf8FXpMcM0f15p/9tMFyvw+/W4lyIwbd1FmdpAGzfYp
 0cXtelQjcmGbTye7fmHgvcrBSHQteQgotEhVO6l2qMsOciAqkfQ3/AKNMnN4Oco3ttGaQHPe5F
 f8QLJ4ZY57ewuZ9SS5x9MeCh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 16:23:07 -0800
IronPort-SDR: kMFG0KK2onH84n/YkSW2DPfPkfqV7JvYk2Z5etWmTh2d7R7KjInZRcMAwOWbZEHwAnEqzVFKdd
 iNJwUDMIK5wbHtmnRSrxLxDjZOzwXabgibkBvwrE5wJ98CmTuT0t65rebDoe02B5oBWeZHTFUr
 rm+nRsbJP4SoOzmt0cA/8+n3bpEigbujo3ntO2GXoQJ46min3JyoPejqh2QhYWDdAKfNKQnN6+
 krptl40k7Z7xvMRsTcDFH03NeFKiLVYT1XfzKdyJRXCEdINMe6psaBaq7FbEK1Gx6WwkGGxtzv
 pao=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.71])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Nov 2020 16:38:35 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/5] arm64,
 numa: Change the numa init functions name to be generic
Date: Wed, 18 Nov 2020 16:38:25 -0800
Message-Id: <20201119003829.1282810-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119003829.1282810-1-atish.patra@wdc.com>
References: <20201119003829.1282810-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_193840_227584_BBE3EC5F 
X-CRM114-Status: GOOD (  19.53  )
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
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arch@vger.kernel.org, Zhengyuan Liu <liuzhengyuan@tj.kylinos.cn>,
 Baoquan He <bhe@redhat.com>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is a preparatory patch for unifying numa implementation between
ARM64 & RISC-V. As the numa implementation will be moved to generic
code, rename the arm64 related functions to a generic one.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/numa.h |  4 ++--
 arch/arm64/kernel/acpi_numa.c | 12 ------------
 arch/arm64/mm/init.c          |  4 ++--
 arch/arm64/mm/numa.c          | 27 +++++++++++++++++++++++----
 4 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/numa.h b/arch/arm64/include/asm/numa.h
index dd870390d639..ffc1dcdf1871 100644
--- a/arch/arm64/include/asm/numa.h
+++ b/arch/arm64/include/asm/numa.h
@@ -32,7 +32,7 @@ static inline const struct cpumask *cpumask_of_node(int node)
 }
 #endif
 
-void __init arm64_numa_init(void);
+void __init arch_numa_init(void);
 int __init numa_add_memblk(int nodeid, u64 start, u64 end);
 void __init numa_set_distance(int from, int to, int distance);
 void __init numa_free_distance(void);
@@ -46,7 +46,7 @@ void numa_remove_cpu(unsigned int cpu);
 static inline void numa_store_cpu_info(unsigned int cpu) { }
 static inline void numa_add_cpu(unsigned int cpu) { }
 static inline void numa_remove_cpu(unsigned int cpu) { }
-static inline void arm64_numa_init(void) { }
+static inline void arch_numa_init(void) { }
 static inline void early_map_cpu_to_node(unsigned int cpu, int nid) { }
 
 #endif	/* CONFIG_NUMA */
diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
index 7ff800045434..fdfecf0991ce 100644
--- a/arch/arm64/kernel/acpi_numa.c
+++ b/arch/arm64/kernel/acpi_numa.c
@@ -118,15 +118,3 @@ void __init acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa)
 	node_set(node, numa_nodes_parsed);
 }
 
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
index 095540667f0f..977b47f6815a 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -407,10 +407,10 @@ void __init bootmem_init(void)
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
diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index a8303bc6b62a..0dae54ce7d43 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 
-#include <asm/acpi.h>
 #include <asm/sections.h>
 
 struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
@@ -445,16 +444,36 @@ static int __init dummy_numa_init(void)
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
+#endif
+
 /**
- * arm64_numa_init() - Initialize NUMA
+ * arch_numa_init() - Initialize NUMA
  *
  * Try each configured NUMA initialization method until one succeeds. The
  * last fallback is dummy single node config encompassing whole memory.
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
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
