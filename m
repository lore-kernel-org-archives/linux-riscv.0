Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405EDC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lk/vWEod9WwDiM7kD5ZNtgAr4SepWJhPdcQ4Zqt6pIU=; b=ouYVkVy2P2Xf7A
	wwdz8UPcDANzwwI7Ib/DjUaWNiR1aV9Mc/TrxdJgV27kipIa+OC/eFOdTMMntCa/b43GeSA3NQdbe
	91dxklIvgjPkz//NO6eVywuQQl36fnRAx0cHPn7jpACqo77G1QrsD8HSCXsjVMoJ4WA4CRrTnXdIG
	NdBidcSCGjgnKnGeHCroGWzM0OqsRjyecHmS5kY95FSnL4AETWO7U089OQJprCuwRqWkvLH//HNCc
	xx1s5rby5UODOJp+OyxMnu7Xg6DFBRyN4iBGmpOgmuKHncif/a+Lj5PorTAR4oV0pIYEqOmuZUauJ
	A+k2evaqvW3jzC8D6tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JZs-007AvU-Es; Mon, 04 Jul 2022 10:45:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J8V-006s2L-NQ; Mon, 04 Jul 2022 10:17:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30ED5D6E;
	Mon,  4 Jul 2022 03:16:59 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0613B3F792;
	Mon,  4 Jul 2022 03:16:56 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>,
	Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v6 21/21] ACPI: Remove the unused find_acpi_cpu_cache_topology()
Date: Mon,  4 Jul 2022 11:16:05 +0100
Message-Id: <20220704101605.1318280-22-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220704101605.1318280-1-sudeep.holla@arm.com>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031659_909167_CC46BDC9 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

The sole user of this find_acpi_cpu_cache_topology() was arm64 topology
which is now consolidated into the generic arch_topology without the need
of this function.

Drop the unused function find_acpi_cpu_cache_topology().

Reported-by: Ionela Voinescu <ionela.voinescu@arm.com>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/acpi/pptt.c  | 37 -------------------------------------
 include/linux/acpi.h |  5 -----
 2 files changed, 42 deletions(-)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index 763f021d45e6..dd3222a15c9c 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -691,43 +691,6 @@ int find_acpi_cpu_topology(unsigned int cpu, int level)
 	return find_acpi_cpu_topology_tag(cpu, level, 0);
 }
 
-/**
- * find_acpi_cpu_cache_topology() - Determine a unique cache topology value
- * @cpu: Kernel logical CPU number
- * @level: The cache level for which we would like a unique ID
- *
- * Determine a unique ID for each unified cache in the system
- *
- * Return: -ENOENT if the PPTT doesn't exist, or the CPU cannot be found.
- * Otherwise returns a value which represents a unique topological feature.
- */
-int find_acpi_cpu_cache_topology(unsigned int cpu, int level)
-{
-	struct acpi_table_header *table;
-	struct acpi_pptt_cache *found_cache;
-	acpi_status status;
-	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
-	struct acpi_pptt_processor *cpu_node = NULL;
-	int ret = -1;
-
-	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
-	if (ACPI_FAILURE(status)) {
-		acpi_pptt_warn_missing();
-		return -ENOENT;
-	}
-
-	found_cache = acpi_find_cache_node(table, acpi_cpu_id,
-					   CACHE_TYPE_UNIFIED,
-					   level,
-					   &cpu_node);
-	if (found_cache)
-		ret = ACPI_PTR_DIFF(cpu_node, table);
-
-	acpi_put_table(table);
-
-	return ret;
-}
-
 /**
  * find_acpi_cpu_topology_package() - Determine a unique CPU package value
  * @cpu: Kernel logical CPU number
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4f82a5bc6d98..7b96a8bff6d2 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1429,7 +1429,6 @@ int find_acpi_cpu_topology(unsigned int cpu, int level);
 int find_acpi_cpu_topology_cluster(unsigned int cpu);
 int find_acpi_cpu_topology_package(unsigned int cpu);
 int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
-int find_acpi_cpu_cache_topology(unsigned int cpu, int level);
 #else
 static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
 {
@@ -1451,10 +1450,6 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
 {
 	return -EINVAL;
 }
-static inline int find_acpi_cpu_cache_topology(unsigned int cpu, int level)
-{
-	return -EINVAL;
-}
 #endif
 
 #ifdef CONFIG_ACPI_PCC
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
