Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415B5C43219
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4p+0n1P6njJ6SwyJFjUOBqtSIYZmkD/d2HQpgjVjSQ4=; b=GZxBIwFBV7IEpq
	Pub8uYegh3XRzHi4DPxoctK2lPliXqNNytAj6ivdZjX/iOh/FXkWV6AphphEyA7V5Zytwq0qDRwpJ
	U1nmq5Rrecfs0/D5LOmDYit/dO/OFRzUDZi7TMdFLZn5Pyo3K4G1dYOOprp5iwZs5xYtNS8Ia25DM
	J3ghM7aIkLWdx4AX9CFZlnMPeK5M7ESweThpeY5QasQ9W2Rlm+eiFrOFZBpY+Rqk4S5NvC5gThNiW
	vgzXFf9W4Iuzj7UbfTmJsfBjbF3XjKZE1GjWkCtERN8gGQBT9Ft0RhURKagM+nQujjErLeOET7+j7
	GRUQF7j161h9iFWlUS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLk1-009DcU-7C; Mon, 17 Oct 2022 08:44:57 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLjs-009DPv-L3
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 08:44:50 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MrVmh4bzTzmVDm;
	Mon, 17 Oct 2022 16:40:04 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 16:44:45 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 16:44:45 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-riscv@lists.infradead.org>
CC: <yash.shah@sifive.com>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>
Subject: [PATCH 2/2] soc: sifive: ccache: fix missing free_irq() in error path in sifive_ccache_init()
Date: Mon, 17 Oct 2022 16:44:11 +0800
Message-ID: <20221017084411.3557098-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221017084411.3557098-1-yangyingliang@huawei.com>
References: <20221017084411.3557098-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_014448_877632_AA0F1FD8 
X-CRM114-Status: UNSURE (   9.48  )
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

Add missing free_irq() before return error from sifive_ccache_init().

Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/soc/sifive/sifive_ccache.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 25019c16d8ae..98269d056728 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -240,7 +240,7 @@ static int __init sifive_ccache_init(void)
 				 NULL);
 		if (rc) {
 			pr_err("Could not request IRQ %d\n", g_irq[i]);
-			goto err_unmap;
+			goto err_free_irq;
 		}
 	}
 
@@ -254,6 +254,9 @@ static int __init sifive_ccache_init(void)
 #endif
 	return 0;
 
+err_free_irq:
+	while (--i >= 0)
+		free_irq(g_irq[i], NULL);
 err_unmap:
 	iounmap(ccache_base);
 	return rc;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
