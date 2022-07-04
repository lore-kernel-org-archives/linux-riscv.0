Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B1AC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTcG5awPNNDDqquK6V8/SbBb9WAJFRMotVICIqH6JH0=; b=VQOK9dvfYIUVmG
	Rhq0YdoE20YyRQfi9ZppaKWi5y/akKRG0kC0yA8p8Vbwyp/GeyBnPKN0k4L2hCe4OmlhAY7wA5Swv
	ma16j/S3VWKADhbukssoQ2wPOrlAUYLzUoDYsVtVTfGYDoWvH9WepMw/NhPnPsVkrCvPGTt2VkO8h
	mWLKT3d/6HA8N8E+aR0RHGEVPblnKZhFNooAigfASIRIlDee/eSsXTHIJSP7NHqfToqZnZY+BjaTr
	3OT/rDA81OVK0/AncIZ63JjmBOGq9RakQkDa1xuIzRzibV7sNauB6FshT5cfDy11nI8bB+91tKLm7
	UEJmpOm18/VJXDsjuQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JYu-0079vd-Ao; Mon, 04 Jul 2022 10:44:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J8R-006ryh-Al; Mon, 04 Jul 2022 10:16:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 175111480;
	Mon,  4 Jul 2022 03:16:55 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 052023F792;
	Mon,  4 Jul 2022 03:16:52 -0700 (PDT)
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
Subject: [PATCH v6 19/21] arch_topology: Add support for parsing sockets in /cpu-map
Date: Mon,  4 Jul 2022 11:16:03 +0100
Message-Id: <20220704101605.1318280-20-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220704101605.1318280-1-sudeep.holla@arm.com>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031655_541682_06D5F82B 
X-CRM114-Status: GOOD (  16.59  )
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

Finally let us add support for socket nodes in /cpu-map in the device
tree. Since this may not be present in all the old platforms and even
most of the existing platforms, we need to assume absence of the socket
node indicates that it is a single socket system and handle appropriately.

Also it is likely that most single socket systems skip to as the node
since it is optional.

Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/arch_topology.c | 37 +++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 217a91fc1f59..8719c4458df9 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -545,8 +545,8 @@ static int __init parse_core(struct device_node *core, int package_id,
 	return 0;
 }
 
-static int __init
-parse_cluster(struct device_node *cluster, int cluster_id, int depth)
+static int __init parse_cluster(struct device_node *cluster, int package_id,
+				int cluster_id, int depth)
 {
 	char name[20];
 	bool leaf = true;
@@ -566,7 +566,7 @@ parse_cluster(struct device_node *cluster, int cluster_id, int depth)
 		c = of_get_child_by_name(cluster, name);
 		if (c) {
 			leaf = false;
-			ret = parse_cluster(c, i, depth + 1);
+			ret = parse_cluster(c, package_id, i, depth + 1);
 			of_node_put(c);
 			if (ret != 0)
 				return ret;
@@ -590,7 +590,8 @@ parse_cluster(struct device_node *cluster, int cluster_id, int depth)
 			}
 
 			if (leaf) {
-				ret = parse_core(c, 0, cluster_id, core_id++);
+				ret = parse_core(c, package_id, cluster_id,
+						 core_id++);
 			} else {
 				pr_err("%pOF: Non-leaf cluster with core %s\n",
 				       cluster, name);
@@ -610,6 +611,32 @@ parse_cluster(struct device_node *cluster, int cluster_id, int depth)
 	return 0;
 }
 
+static int __init parse_socket(struct device_node *socket)
+{
+	char name[20];
+	struct device_node *c;
+	bool has_socket = false;
+	int package_id = 0, ret;
+
+	do {
+		snprintf(name, sizeof(name), "socket%d", package_id);
+		c = of_get_child_by_name(socket, name);
+		if (c) {
+			has_socket = true;
+			ret = parse_cluster(c, package_id, -1, 0);
+			of_node_put(c);
+			if (ret != 0)
+				return ret;
+		}
+		package_id++;
+	} while (c);
+
+	if (!has_socket)
+		ret = parse_cluster(socket, 0, -1, 0);
+
+	return ret;
+}
+
 static int __init parse_dt_topology(void)
 {
 	struct device_node *cn, *map;
@@ -630,7 +657,7 @@ static int __init parse_dt_topology(void)
 	if (!map)
 		goto out;
 
-	ret = parse_cluster(map, -1, 0);
+	ret = parse_socket(map);
 	if (ret != 0)
 		goto out_map;
 
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
