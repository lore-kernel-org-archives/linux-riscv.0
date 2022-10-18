Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B6CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 02:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToLBbz04sLbK6LfJKYbyExr1lHbOHEUlFWBudtvMJHk=; b=yNjhJ9V8YNNN9I
	tokwlss6N1SpdFA6XQo1kiiBHRHV54ErnBGiMx47xMY29tNl0mI6pgZWwnEY+F+NI+3esUVoqb12w
	eDIyojklC6RIYe3DimKpMDVBbpeu1Xr8BxmW3gktPOGsqgaYFnzZ1b2PtK2n+Bfzr15dTK2Hz5oIy
	vgizPMhtKubeCyKi6iFnunfNdFMWsI2mTNXh36in5k3VfzwxnjVeK98B8iwLjldc57wqJEPQrAKW/
	U+y1S9Odv4PHGBNxgks7Sfo5q2GmGLtT8rO5kHx+t/jqVgobRkniZBugB1WjKtUeQg1pqmBWbE3fb
	n4VGy9zAJoO57edu/TjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okcPS-001MSL-6V; Tue, 18 Oct 2022 02:32:50 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okcPO-001MPz-SI
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 02:32:48 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MryT35Y0RzVj2f;
	Tue, 18 Oct 2022 10:28:07 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 10:32:26 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 10:32:25 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-riscv@lists.infradead.org>
CC: <yash.shah@sifive.com>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<conor@kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH v2 1/3] soc: sifive: ccache: fix missing iounmap() in error path in sifive_ccache_init()
Date: Tue, 18 Oct 2022 10:31:47 +0800
Message-ID: <20221018023149.1048176-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221018023149.1048176-1-yangyingliang@huawei.com>
References: <20221018023149.1048176-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_193247_110796_AC9B5494 
X-CRM114-Status: GOOD (  10.16  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
