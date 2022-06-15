Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED055C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 14:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mvsxD9467ABm76TXb9CCh0V1Jagc/SBAob5EFPnKIgM=; b=xdWm0ueAKLAprW
	WBuiL89KM7ragGndpMnmFVlvT0q6rznE4IFbL3hIUaZ14HFWLMRqRcz4yO7+Wja45f8GIiPd8HX+w
	MFCrnH7Zcc4TdTiDln0hvlD/6o/0i5U4Zc42AIx8+9rmfz/TE3uYn7X7OLebU+XoJEaHJLqPe2zEr
	rrMIcBVYwanXapxDVypQFVZ2IIMatvBees7LY0nH3DhrDi6rRVdMa5W144FU+HR2nxMREB34rbY1k
	7fyIWr/WlnpNUEvfew6BYBRMR+1sJn4QGGc3NSxLeVG6MRE+Q8m8WeorsJQEV1d3MvgvzrEJ7TNN1
	hOj5gMR5vsvH05VTH63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Tuw-00EvYR-Cf; Wed, 15 Jun 2022 14:22:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Tut-00EvUw-3d
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 14:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655302962; x=1686838962;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9qyp6+bi5a1Nfggtjv4LRguWeuVmJJ6PLYs6RLiuRn4=;
  b=Wq9UX5w25KxvEB+CIAY/Hjm1Iq1IU2MsjVfR3ZvzPBtIrBOH6PYSICAY
   ksdwc6/2XtH4gjLRq+BLKAFQZge2lhhd1fQxmD1Y43j5bZeBsEOkcBGFY
   LHwpJWnbLhKVKMBf51Mv94jj5ShhXDF/uy84wvOVy4VJI1VZVVpT/s1Yb
   FBYkohwkIMXgBlHO930D1f3V1q0YMK8izsEwBD+kFvSqNdSyev/6MP4q7
   IfRSSRkr0wSKc97yMtTV9VrmFsBhILKUOLfyON2Uenn+ga6irUlIWgoB2
   oe4Ezw1UjZyZhKoXw5/vyNdNdyrTKThYites6CZf1Q/K581hVLXml6BxF
   A==;
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="178078168"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2022 07:22:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 15 Jun 2022 07:22:37 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 15 Jun 2022 07:22:35 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Lewis Hanly
	<lewis.hanly@microchip.com>, Conor Dooley <conor.dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2] spi: microchip-core: fix passing zero to PTR_ERR warning
Date: Wed, 15 Jun 2022 15:20:29 +0100
Message-ID: <20220615142028.2991915-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_072243_252514_2F295DFE 
X-CRM114-Status: GOOD (  11.83  )
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

It is possible that the error case for devm_clk_get() returns NULL,
in which case zero will be passed to PTR_ERR() as shown by the Smatch
static checker warning:
drivers/spi/spi-microchip-core.c:557 mchp_corespi_probe()
warn: passing zero to 'PTR_ERR'

Remove the NULL check and carry on with a dummy clock in case of an
error. To avoid a potential div zero, abort calculating clkgen if
clk_get_rate(spi->clk) is zero.

Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/linux-spi/20220615091633.GI2168@kadam/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2: drop the NULL check entirely rather than returning -ENXIO if NULL
---
 drivers/spi/spi-microchip-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index 5b2aee30fa04..d866a831104c 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -433,6 +433,8 @@ static int mchp_corespi_calculate_clkgen(struct mchp_corespi *spi,
 	unsigned long clk_hz, spi_hz, clk_gen;
 
 	clk_hz = clk_get_rate(spi->clk);
+	if (!clk_hz)
+		return -EINVAL;
 	spi_hz = min(target_hz, clk_hz);
 
 	/*
@@ -553,7 +555,7 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 	}
 
 	spi->clk = devm_clk_get(&pdev->dev, NULL);
-	if (!spi->clk || IS_ERR(spi->clk)) {
+	if (IS_ERR(spi->clk)) {
 		ret = PTR_ERR(spi->clk);
 		dev_err(&pdev->dev, "could not get clk: %d\n", ret);
 		goto error_release_master;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
