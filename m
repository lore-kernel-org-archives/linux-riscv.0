Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B87C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 13:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K4h+PppHh9gpbDV0YaZc98QchX4YUMcY5/PEAf+TBgA=; b=wjysJ6Bna/1Cy5
	5l/pQM5PNduaBJDWdZ2GqQqQ2qjBbpgYCDT12opT1XQw4kUSvRmBVG9JOf93G7QegwDsTfamaPP+U
	LrzMFIxdAVJCvLNpdeW1NpBTVh+mCCYW66RJJVMYdNVM3wpCcvB9VYM5PguQ1TC59h2aqJspEMIn6
	GRsoaZtSxJdaDxWUzsKKtj0BsBm/fvBAjYyS+h7aNY+xojfV1VRpSTZoYU8oxSCyx9ihfKrEUWIlp
	dNrrFZqTzZizgvjdSEpqjhba0oT65u4elS/Cj7Ht2VRwdallcwMmFlHHL8F616ZT4c4LRWHUVG4w4
	fsO6VeRK8l8MBJuSShDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGBu-00BTfu-2v; Tue, 12 Jul 2022 13:44:42 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGBq-00BTWO-NE
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 13:44:40 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Lj23n2KJXz1L8nk;
	Tue, 12 Jul 2022 21:41:57 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 12 Jul 2022 21:44:30 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 12 Jul
 2022 21:44:30 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<broonie@kernel.org>
Subject: [PATCH -next 1/2] spi: microchip-core: fix UAF in mchp_corespi_remove()
Date: Tue, 12 Jul 2022 21:53:56 +0800
Message-ID: <20220712135357.918997-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_064438_944684_E87A2544 
X-CRM114-Status: UNSURE (   7.25  )
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

When using devm_spi_register_master(), the unregister function will
be called in devres_release_all() which is called after ->remove(),
so remove spi_unregister_master() andspi_master_put().

Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/spi/spi-microchip-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index b3083075cd36..c26767343176 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -595,8 +595,6 @@ static int mchp_corespi_remove(struct platform_device *pdev)
 	struct mchp_corespi *spi = spi_master_get_devdata(master);
 
 	mchp_corespi_disable_ints(spi);
-	spi_unregister_master(master);
-	spi_master_put(master);
 	clk_disable_unprepare(spi->clk);
 	mchp_corespi_disable(spi);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
