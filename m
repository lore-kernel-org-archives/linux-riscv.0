Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437ECC63777
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9B4321707
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MSMyyV7Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="QshweGYe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9B4321707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OqVSvy9HRwIhiYT1L029M02f4SbtGFDQwdQ0/bVT8o4=; b=MSMyyV7Q4rvhiR/s9nbt9ObAR
	PC1B9Utf7TlCDGDkIpXGCvTo1dCjaOD3iZWQlGOL4HNjpo2jqmak1puNt0Bc+iZZyBGxVibmY6tAX
	Sv3jV9c66jfprLVIjdeouqRe7fV/MJJvz2eMMDlsa1FrXBreclyWsaXcCm7BQIWo5LuGUKfKSf0Fp
	/w+s9Hg92SvJO9E/4MhsqbTYdKezVOWL5ysEsCjITIiQFPAG/9jDMj4oyUYPQFKZ9cbf3Jz4cqeI5
	vAms/0ajshoYJQgWUPo9nMQBN6N/TTYYM/KyXo4GgfkO4CUcsPnkYXG0HOr4KY3N3QylzOpLhCzfS
	KCodsfGtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJMq-0000Rs-Op; Sat, 07 Nov 2020 08:14:36 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJMo-0000PH-PF
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736874; x=1636272874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aCvWQLDyaSFYntB4Womc0e0j3CRsIntIfbuSiFLr4hA=;
 b=QshweGYemJGcT+KkzovV5Pwo18pjWZTCW8g3u1CTCEdIBWJC7EJAcDdg
 DAImK8qOXPy+gVlzduQkc0P9q05LXvxzjG0oC91IP3dwDUOEfUMFo0wnv
 K+1WjPuBDcfsDLiRltK1GvqpTuFlqClk+5WjN3nWs+NuTMcwsiFAyMc8Z
 dYPIekGvygw5Rq73diPfYPDa3bJQ+XpIXgOyWRXZ1c4OpWgOeFrHudKUh
 uXmFqJDDaKlcm65v2/liCIjD6yEbhvClZe8iFGkfiBfZd08yEJJqo6r7G
 1jH5hOzqc0YmU3jX9fwgBgTufIYiIbsmYFOC5hnM2dLWrBRH0rwDnyZeK Q==;
IronPort-SDR: z3qnin9m6LGyCNSUOjOg+KV7ALzPzASJqp3W/PKIMsBlmE985Lm/iLAVvFTuTEmQIeDilt5F+6
 Vr/lGCtsU1FAv6eYas1v1Yoa4vZlGheFJRopxL9pruduvbSwGlZ/Q5maXYt2v+ukv4qOOHPnzi
 VVoQ3xPaOkdDW7V4r5sdvyVRyPLYqpzNOM2OTsb4pJuMuyqmtURJwungrQnBGN4aBxUTWZf0sL
 wYGHXyXAl4nyAGDLQ3h/sb9LSMow6CpFDz8QSyY6VPdhTroHcrpRrs/onL1AZsFNKhC4WRuOOC
 4Gc=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079263"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:34 +0800
IronPort-SDR: F+6i5AqhD70GS5hGzYC+OV25G11lUXAhRlKO5K7+clI2WlspQ/L8K+cSOXiwiw6KHCfG6EKydY
 fBUavVCv+aiHX9v+xcTSFi7iAvLXEstlxTb4ySO/QJCSzAp7wm9rhzRlMjlyK0lGqqeV/xVIX6
 8lfqbTI9j+FbySSU14wPoqOiDLnJE+Q6Ff8BdDCSYrq/SgkHRSCMM+28sgAetVKHQWTVczinOT
 bWW3EySDxHiZLJAEGih5KLbLHLFXufFR9FqplUMLnkk07elxMOyWnvkmyTPGmdjoN+h6eIOg/M
 SfZlL/c+GSK/bCBfiwqcQnQ9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:00:38 -0800
IronPort-SDR: xnMAOU5B9k8aXLtf1hpdfpBLHr6sZSOKvHHBazK2i2wFWcv7QRgwZDB5yRurYFkmsx6Ckwu05/
 WIME6Tf0b8tFqPDMJp7/bOJ2eMa/MWFmwTtlEgPFNFta0wWOqkFLFw+s9KUG4tiHjNQjPzfJzZ
 /Y+aqMbroxYK3YbaE0zZbN7MU/4qG8l2hqxL0GzsGZG88bgSljIGv2IlEe2BTxWw+VOgklowg5
 t4NjYuQ2n8DxVap/Y0ZPa9osrcuQ405tsfj9NtcR3I/JsJDarohMqN/7Ix0DY0jcQmIqLh7HX+
 nZg=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:32 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 04/32] spi: dw: Introduce polling device tree property
Date: Sat,  7 Nov 2020 17:13:52 +0900
Message-Id: <20201107081420.60325-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031435_047075_6BC7E184 
X-CRM114-Status: GOOD (  16.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

With boards that have slow interrupts context switch, and a fast device
connected to a spi master, e.g. an SD card through mmc-spi, using
dw_spi_poll_transfer() intead of the regular interrupt based
dw_spi_transfer_handler() function is more efficient and can avoid a lot
of RX FIFO overflow errors while keeping the device SPI frequency
reasonnably high (for speed). Introduce the "polling" device tree
property to allow requesting polled processing of transfer depending on
the connected device while keeping the spi master interrupts property
unschanged. E.g. device trees such as:

Generic soc.dtsi dts:

spi0: spi@53000000 {
	#address-cells = <1>;
	#size-cells = <0>;
	compatible = "snps,dw-apb-ssi";
	reg = <0x53000000 0x100>;
	interrupts = <2>;
	...
}

Board specific dts:

...
&spi0 {
	polling;
	status = "okay";

	slot@0 {
		compatible = "mmc-spi-slot";
		reg = <0>;
		voltage-ranges = <3300 3300>;
		spi-max-frequency = <4000000>;
	};
}

will result in using polled transfers for the SD card while other boards
using spi0 for different peripherals can use interrupt based transfers
without needing to change the generic base soc dts.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/spi/spi-dw-mmio.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index d0cc5bf4fa4e..3f1bc384cb45 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -20,6 +20,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/interrupt.h>
 
 #include "spi-dw.h"
 
@@ -246,9 +247,13 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
 
 	dws->paddr = mem->start;
 
-	dws->irq = platform_get_irq(pdev, 0);
-	if (dws->irq < 0)
-		return dws->irq; /* -ENXIO */
+	if (device_property_read_bool(&pdev->dev, "polling")) {
+		dws->irq = IRQ_NOTCONNECTED;
+	} else {
+		dws->irq = platform_get_irq(pdev, 0);
+		if (dws->irq < 0)
+			return dws->irq; /* -ENXIO */
+	}
 
 	dwsmmio->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(dwsmmio->clk))
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
