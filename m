Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B27FC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 13:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CqWnd2F+kgYbVRT9oJJppyactfRWq9B/QVcurJA6IRs=; b=clUf0YEmqU5pKW
	wRJ9gq6Fy+Rb2NHSj/LbldcmdM28mGK96Fkr9WltaZv+Z5ZaWqxU+vwB3eQ7MHjxZbShjWrM2EfYD
	kOo80ISptVInMS7HsXdTByMTSZTeMXkSrA59/Bs6bxTl1tfxQgWNWeDiQl4xjwoxDwFPQS0OAF8C3
	hFhDtwdEspt+HtRvQLIZPx/ZQ7kHcRyoDKYyr/Bo4HrYQNukGgJPhMQBhr+ZM18ES5BC3d1wIXYBz
	R0uxtwrJedjGfuN4BQeuT4j9XClVBCyNtZYmD9lIVhXtXqTU5E4xQ7tr7Gnl5kuFBwMDbatimTNZF
	RaSqUnpEv/xhVa+sZDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XPZ-00C4x0-SX; Wed, 29 Jun 2022 13:07:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XPD-00C4pd-Od; Wed, 29 Jun 2022 13:07:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63BCB152B;
	Wed, 29 Jun 2022 06:06:54 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62B703F792;
	Wed, 29 Jun 2022 06:06:52 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: sudeep.holla@arm.com,
	rafael@kernel.org
Cc: atishp@atishpatra.org,
	atishp@rivosinc.com,
	dietmar.eggemann@arm.com,
	gregkh@linuxfoundation.org,
	ionela.voinescu@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	pierre.gondois@arm.com,
	robh+dt@kernel.org,
	vincent.guittot@linaro.org,
	wangqing@vivo.com,
	linux-acpi@vger.kernel.org
Subject: [PATCH] ACPI: Remove the unused find_acpi_cpu_cache_topology()
Date: Wed, 29 Jun 2022 14:06:44 +0100
Message-Id: <20220629130644.1258904-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220627165047.336669-1-sudeep.holla@arm.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_060655_953893_60776B51 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: linux-acpi@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/acpi/pptt.c  | 37 -------------------------------------
 include/linux/acpi.h |  5 -----
 2 files changed, 42 deletions(-)

Hi Rafael,

This is another patch that I would like to be part of the series[1].
Please ack the same if you are OK to route this via Greg. I am avoiding
to repost the whole series just for this one additional patch for now.

Regards,
Sudeep

[1] https://lore.kernel.org/all/20220627165047.336669-1-sudeep.holla@arm.com/

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
