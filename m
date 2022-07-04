Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400A0C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 10:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdfkELbl++MXtiI5jcjxInQlZGBCChgKAXfEnZoZDIk=; b=l6OjAETW1QTorJ
	UYWgkZHUOVyfqYw3IZzs7rjv50HW5ugY6vqqEyP97t4R452F2Qjyayz6nLZmJn2AwZTLhYaJdu8Hk
	gZw8/+qpyV/hsimViPz8FQtgIvhRptM9zxFc5vl51XWt59kBkhbttz7pomQu31p2kgF8jdCCiY0qq
	13jkpzb2t93C9TocCgLPiQNwWERSk34MKdZJ8oRbkMOvxIMUIU5GmA/iyfKRvZMhm2DO+sfpaHbXx
	g63QyHCgzvEHDnKKnoAPoU2nQaBKPVXlrh2wFBPZga/+PmsmROJkwg3Hpdu76ZdgTBEQT4zBzBMWW
	YoDZnD6yxamWr37+v6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JZ7-007A8M-3K; Mon, 04 Jul 2022 10:44:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J8P-006rxV-KN; Mon, 04 Jul 2022 10:16:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B29CD6E;
	Mon,  4 Jul 2022 03:16:53 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0918B3F792;
	Mon,  4 Jul 2022 03:16:50 -0700 (PDT)
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
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 18/21] arch_topology: Set cluster identifier in each core/thread from /cpu-map
Date: Mon,  4 Jul 2022 11:16:02 +0100
Message-Id: <20220704101605.1318280-19-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220704101605.1318280-1-sudeep.holla@arm.com>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031653_916091_FA4EC19B 
X-CRM114-Status: GOOD (  12.65  )
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

Let us set the cluster identifier as parsed from the device tree
cluster nodes within /cpu-map.

We don't support nesting of clusters yet as there are no real hardware
to support clusters of clusters.

Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/arch_topology.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 591c1f8e15e2..217a91fc1f59 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -497,7 +497,7 @@ static int __init get_cpu_for_node(struct device_node *node)
 }
 
 static int __init parse_core(struct device_node *core, int package_id,
-			     int core_id)
+			     int cluster_id, int core_id)
 {
 	char name[20];
 	bool leaf = true;
@@ -513,6 +513,7 @@ static int __init parse_core(struct device_node *core, int package_id,
 			cpu = get_cpu_for_node(t);
 			if (cpu >= 0) {
 				cpu_topology[cpu].package_id = package_id;
+				cpu_topology[cpu].cluster_id = cluster_id;
 				cpu_topology[cpu].core_id = core_id;
 				cpu_topology[cpu].thread_id = i;
 			} else if (cpu != -ENODEV) {
@@ -534,6 +535,7 @@ static int __init parse_core(struct device_node *core, int package_id,
 		}
 
 		cpu_topology[cpu].package_id = package_id;
+		cpu_topology[cpu].cluster_id = cluster_id;
 		cpu_topology[cpu].core_id = core_id;
 	} else if (leaf && cpu != -ENODEV) {
 		pr_err("%pOF: Can't get CPU for leaf core\n", core);
@@ -543,7 +545,8 @@ static int __init parse_core(struct device_node *core, int package_id,
 	return 0;
 }
 
-static int __init parse_cluster(struct device_node *cluster, int depth)
+static int __init
+parse_cluster(struct device_node *cluster, int cluster_id, int depth)
 {
 	char name[20];
 	bool leaf = true;
@@ -563,7 +566,7 @@ static int __init parse_cluster(struct device_node *cluster, int depth)
 		c = of_get_child_by_name(cluster, name);
 		if (c) {
 			leaf = false;
-			ret = parse_cluster(c, depth + 1);
+			ret = parse_cluster(c, i, depth + 1);
 			of_node_put(c);
 			if (ret != 0)
 				return ret;
@@ -587,7 +590,7 @@ static int __init parse_cluster(struct device_node *cluster, int depth)
 			}
 
 			if (leaf) {
-				ret = parse_core(c, 0, core_id++);
+				ret = parse_core(c, 0, cluster_id, core_id++);
 			} else {
 				pr_err("%pOF: Non-leaf cluster with core %s\n",
 				       cluster, name);
@@ -627,7 +630,7 @@ static int __init parse_dt_topology(void)
 	if (!map)
 		goto out;
 
-	ret = parse_cluster(map, 0);
+	ret = parse_cluster(map, -1, 0);
 	if (ret != 0)
 		goto out_map;
 
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
