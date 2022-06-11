Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F9AC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jun 2022 02:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pMKlq564NsCOCd26Lj469oShusHB4pTDChx2SK2Fo5M=; b=U1k4jB9B07GUDL
	Yp/vt2N1MekzFbWFeQDPzOwwWyDy1GQf49qzaJ5UOsil3FQ7HXKIwtin+0CbSRqf7UvDGBcvVO+Ca
	G9UfFiSGZqVfu79HBeG6B1Ald9MrGv7a2JaSEkX+n6miWSUCRgj7qkEu+BkB3mVwrlQuninw2yEzZ
	46/LTCEDRXmmmKW3bYgduJ/ezvubri2dOXQaiUUXlEgRQc2fNL04RBF6Sr+m9kGNanQtoy9BUYPXL
	O59rwZ8P45TMQQJpMzrwEC97HSGyhOtO75slbyy5wNoRZ7ByRhlS/D8gIF4kw8oiyWSDFB8E01kBv
	PoJ8fItRxoKRSZKf6/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzqgJ-00Ayj6-Em; Sat, 11 Jun 2022 02:16:55 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzqgG-00Aygw-DY
	for linux-riscv@lists.infradead.org; Sat, 11 Jun 2022 02:16:53 +0000
Received: from kwepemi500023.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LKhHw0qD0zjX7G;
	Sat, 11 Jun 2022 10:15:24 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500023.china.huawei.com
 (7.221.188.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 11 Jun
 2022 10:16:47 +0800
From: Peng Wu <wupeng58@huawei.com>
To: <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>,
	<broonie@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <liwei391@huawei.com>, <wupeng58@huawei.com>
Subject: [PATCH] spi: micro: fix unreasonable clk_prepare_enable() on error in mchp_corespi_probe()
Date: Sat, 11 Jun 2022 02:11:17 +0000
Message-ID: <20220611021117.40494-1-wupeng58@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500023.china.huawei.com (7.221.188.76)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_191652_662759_3FA036FD 
X-CRM114-Status: UNSURE (   7.77  )
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

Fix the unreasonable clk_prepare_enable() with clk_disable_unprepare()
before return from mchp_corespi_probe() in the error handling case.

Signed-off-by: Peng Wu <wupeng58@huawei.com>
---
 drivers/spi/spi-microchip-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index 5b2aee30fa04..bf6847d95fe3 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -580,7 +580,7 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 
 error_release_hardware:
 	mchp_corespi_disable(spi);
-	clk_prepare_enable(spi->clk);
+	clk_disable_unprepare(spi->clk);
 error_release_master:
 	spi_master_put(master);
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
