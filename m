Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3767AC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Aug 2024 03:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UjUO/MeGMJtW2F32MJ4nz+Mbh3Ip5QdjemsBJ5W94ow=; b=2abK45LRWWpz+T
	yCfyUal0ipqpT1u6L6I2SGHi4g2PoLts/xdNT3IDsZAgI9lc1JOw2uUWS8O1iWSCQAd8DjRRb+J/Q
	s4jaoC5JyPoaouUCLgPE9A+eh3KLsN3SlB/OAs76+WXqpD5hj6Jaysp820q5PnGHU04HcAul3tszX
	avRfIbXRYxtsLJB8mTNbvpR9OkFnr6PZa7eYivpvSuZ5f+35xa21ulhlQKWO9YKgq3Js+IOJhLqeZ
	ruPvOHxS9y/vLU7lWqVqLSYEk5L9347aEeEaS84qRZbQJX/VYOU/0duzRhOLS888Zn4p9jXryDf/J
	O01O0lq5YPZtT6/csTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scz6N-0000000Ewoo-3wMr;
	Sun, 11 Aug 2024 03:18:39 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scz6K-0000000Ewm7-0yoy
	for linux-riscv@lists.infradead.org;
	Sun, 11 Aug 2024 03:18:38 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WhN9Y1wFhzpTKR;
	Sun, 11 Aug 2024 11:17:05 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 003B61400D8;
	Sun, 11 Aug 2024 11:18:20 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sun, 11 Aug 2024 11:18:20 +0800
From: Hanjun Guo <guohanjun@huawei.com>
To: Sunil V L <sunilvl@ventanamicro.com>, Haibo Xu <haibo1.xu@intel.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
CC: Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Hanjun Guo
	<guohanjun@huawei.com>
Subject: [PATCH] ACPI: RISCV: Make acpi_numa_get_nid() to be static
Date: Sun, 11 Aug 2024 11:18:04 +0800
Message-ID: <20240811031804.3347298-1-guohanjun@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_201836_814303_28C4F095 
X-CRM114-Status: GOOD (  10.35  )
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

acpi_numa_get_nid() is only called in acpi_numa.c for riscv,
no need to add it in head file, so make it static and remove
related functions in the asm/acpi.h.

Spotted by doing some cleanup for arm64 ACPI.

Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
---
 arch/riscv/include/asm/acpi.h | 2 --
 arch/riscv/kernel/acpi_numa.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index e0a1f84404f3..6e13695120bc 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -91,10 +91,8 @@ static inline void acpi_get_cbo_block_size(struct acpi_table_header *table,
 #endif /* CONFIG_ACPI */
 
 #ifdef CONFIG_ACPI_NUMA
-int acpi_numa_get_nid(unsigned int cpu);
 void acpi_map_cpus_to_nodes(void);
 #else
-static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
 static inline void acpi_map_cpus_to_nodes(void) { }
 #endif /* CONFIG_ACPI_NUMA */
 
diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
index 0231482d6946..a93c773b60e6 100644
--- a/arch/riscv/kernel/acpi_numa.c
+++ b/arch/riscv/kernel/acpi_numa.c
@@ -30,7 +30,7 @@
 
 static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
 
-int __init acpi_numa_get_nid(unsigned int cpu)
+static int __init acpi_numa_get_nid(unsigned int cpu)
 {
 	return acpi_early_node_map[cpu];
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
