Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200FEC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 02:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShWNwqnIkhmIs4389kLB1F4dCG/mTVE3oAxRNunaXso=; b=zqMVq8Pkg0HcZk
	NNQbts0Twe92sE9fYpbepOzvQq5xPPQFOUEjexnQ2d92IoJ68nfCYE5Cbz5NLW5/ssBPpehyWJxDN
	pMZ6B+5BMzwHHcol5LHp8XNl6F06gnJd61ch/aHr/PAww2eMfGE5Gi3thV5dyEKRbC7QRLspGJhjp
	/cNdDUiXrVqWmhUvQ4e46/wuIiJHCOzBIlOZGNBL68xkL9T0v2bTDP8aF54L3KdDbbvUIqhHUM6Mg
	/wjVNCsiNQPnxMO2VaWobkw06X75RPig+tovJExrhVpIdlctooDm0n7cGMgsHBxi4eR0m/8Suju8n
	A7dI9Elf1oi3NqlcYeog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okcPA-001MP6-DC; Tue, 18 Oct 2022 02:32:32 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okcP7-001MOe-6Q
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 02:32:30 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MrySc73YyzmV9g;
	Tue, 18 Oct 2022 10:27:44 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 10:32:27 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 10:32:26 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-riscv@lists.infradead.org>
CC: <yash.shah@sifive.com>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<conor@kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH v2 3/3] soc: sifive: ccache: fix missing of_node_put() in sifive_ccache_init()
Date: Tue, 18 Oct 2022 10:31:49 +0800
Message-ID: <20221018023149.1048176-4-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221018023149.1048176-1-yangyingliang@huawei.com>
References: <20221018023149.1048176-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_193229_450698_349172D3 
X-CRM114-Status: UNSURE (   9.98  )
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

The device_node pointer returned by of_find_matching_node() with
refcount incremented, when finish using it, the refcount need be
decreased.

Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/soc/sifive/sifive_ccache.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 98269d056728..3684f5b40a80 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -215,12 +215,16 @@ static int __init sifive_ccache_init(void)
 	if (!np)
 		return -ENODEV;
 
-	if (of_address_to_resource(np, 0, &res))
-		return -ENODEV;
+	if (of_address_to_resource(np, 0, &res)) {
+		rc = -ENODEV;
+		goto err_node_put;
+	}
 
 	ccache_base = ioremap(res.start, resource_size(&res));
-	if (!ccache_base)
-		return -ENOMEM;
+	if (!ccache_base) {
+		rc = -ENOMEM;
+		goto err_node_put;
+	}
 
 	if (of_property_read_u32(np, "cache-level", &level)) {
 		rc = -ENOENT;
@@ -243,6 +247,7 @@ static int __init sifive_ccache_init(void)
 			goto err_free_irq;
 		}
 	}
+	of_node_put(np);
 
 	ccache_config_read();
 
@@ -259,6 +264,8 @@ static int __init sifive_ccache_init(void)
 		free_irq(g_irq[i], NULL);
 err_unmap:
 	iounmap(ccache_base);
+err_node_put:
+	of_node_put(np);
 	return rc;
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
