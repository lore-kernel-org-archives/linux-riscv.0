Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB65DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 08:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+sZqZrl0xkPWmmLkp/ELdgC2wy7POH/z5WaMT+W6wzc=; b=ngEnDdsFHFSwhL
	O3kYGK6WBggg9mcvwM96Xqm+U0PGPPl29NFnZ5IYl84wBdlLIgqmBL8McDeemww1ZGW5gdlVegMtS
	1ofCTOoXaIQhGK8UolWecLOEK3HSPusDeDpwj/JA9cDbT51f4LBOj6Nj/8fRbN7zUEpZi2CMkD1Ev
	3sLiErn/y0W6CO0G+1qhh0CM6ETxTRfdtQJrUY34DAwpnXge4WNdZ58jau1WLcB8I+3C/b926yrKv
	6bRqh/Saunkg5oaVE+oPANK7ek/HOfFHmtx5jrE3+a3u1S5m9toVVY+LQICxTJrAp+n/jnXrLgAqA
	0fdNGunTNyvNdhSNHMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLjw-009DXm-Rv; Mon, 17 Oct 2022 08:44:52 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLjs-009DOc-CG
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 08:44:50 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MrVmh4x4Nz1P7rF;
	Mon, 17 Oct 2022 16:40:04 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 16:44:45 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 16:44:45 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-riscv@lists.infradead.org>
CC: <yash.shah@sifive.com>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>
Subject: [PATCH 1/2] soc: sifive: ccache: fix missing iounmap() in error path in sifive_ccache_init()
Date: Mon, 17 Oct 2022 16:44:10 +0800
Message-ID: <20221017084411.3557098-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_014448_610564_E9EDA481 
X-CRM114-Status: UNSURE (   9.55  )
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

Add missing iounmap() before return error from sifive_ccache_init().

Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/soc/sifive/sifive_ccache.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 1c171150e878..25019c16d8ae 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -222,13 +222,16 @@ static int __init sifive_ccache_init(void)
 	if (!ccache_base)
 		return -ENOMEM;
 
-	if (of_property_read_u32(np, "cache-level", &level))
-		return -ENOENT;
+	if (of_property_read_u32(np, "cache-level", &level)) {
+		rc = -ENOENT;
+		goto err_unmap;
+	}
 
 	intr_num = of_property_count_u32_elems(np, "interrupts");
 	if (!intr_num) {
 		pr_err("No interrupts property\n");
-		return -ENODEV;
+		rc = -ENODEV;
+		goto err_unmap;
 	}
 
 	for (i = 0; i < intr_num; i++) {
@@ -237,7 +240,7 @@ static int __init sifive_ccache_init(void)
 				 NULL);
 		if (rc) {
 			pr_err("Could not request IRQ %d\n", g_irq[i]);
-			return rc;
+			goto err_unmap;
 		}
 	}
 
@@ -250,6 +253,10 @@ static int __init sifive_ccache_init(void)
 	setup_sifive_debug();
 #endif
 	return 0;
+
+err_unmap:
+	iounmap(ccache_base);
+	return rc;
 }
 
 device_initcall(sifive_ccache_init);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
