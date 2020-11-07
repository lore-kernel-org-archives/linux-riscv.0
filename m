Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D850C4741F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1348620872
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A5yxlhga";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AlfKQSOB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1348620872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5JFBW5CXWCTbrkF5/cdE5WaFEnm+KP3++us/b57IU4k=; b=A5yxlhgacmPxy4jV0S3haF30H
	ot7uBf74VgzbiLGDDlMcbnNK+j4B378yKGDMDHmZ7KIoe0+YDlZ4hdZhxMiWi+p7qkO1i/QWHigIH
	1EBm0ei2yArS2IasO88xSK2u27QwjKKGEKd8zy56oRxY12Dm6qiOOAcrbF0pjY7JBE50rz4tzwi6H
	j36ww4YhpLkWmQNIHljYfsRBE/BKi8kPLqs/6jm6nbhQEMJbjzMkz4hKyXiV6Yvg/wp4zC0Fd5XLJ
	i3OtIeUVW7aU/IRV9jbDOOeAjwBbwoAlhqUDl38aNPrXO9e6F+TxLJ5PVxmmZ4SCpjWBSMkoasHou
	/Z8xs6KUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJMx-0000Uq-IA; Sat, 07 Nov 2020 08:14:43 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJMu-0000PH-Fz
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736880; x=1636272880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iimtT32W5p5FAu0oxnrDsTs89ZbKIS+MLA+sDDXHho0=;
 b=AlfKQSOB0nl6s+Vn43T8y2By5q7ObpDW7cc1jnwoUxVudUMJ9OGQQ1C0
 fx+Ee+hhOp9PZZBLDQDbDFolDmENbKO2FaYlpdPG8gGsG7ksxRMFBPIcO
 6/gfqfcQUT+kQw7cj6XXOav9SZcLiyROEkKp1Rv/Z4SbAdHeykjhigzLK
 ReAqAD6YEFaP/5Aw7Q6JHUDOCQFhtJ4/Q2+Kh2Qifc5rNcYigcDntev6p
 9hD/jIML2hatiJZa0A68edqh1m7Vc9JUKrBEQJzSAvHoMwT9390cIqZ26
 piL0w7jpwFLUtna6KILI6mLEHeqyqBjARjfYwFwn05jqsJH6TACvWpHBD Q==;
IronPort-SDR: 2j9XrNeWa3gpFMLs/PoxldeMuGrKwTD5wQnZ4WNE8NfjO9351vBvDd9tl5aEGqR+2AWH+AJ0s6
 I+Ul0q5RAobv37Ti7nFwZbjWpAr4G+ObwtCb2bagpBex83EPOwKf/f7xhrVfPVwcfqIBrX8+xy
 dPc19cMVr4qr5S1b1jz+8xi6KLEGHh2TdAxTLw0bQL7w92Gk3JjWxERgd7KOr11z6nn/pZy+jO
 0r7AEV3sCK9JoL5dSIFxDMJ21pvdWJsHPAuQfzot80UNTEbnOjqaFghah8cgJwaW/WRTBRfNIz
 uDw=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079273"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:40 +0800
IronPort-SDR: /8l/KJLkdtwQOBHL6SO8oUAUlZay168xCfeJMFOjnZL3MzSPpM88nRmnRJXLvnLWQmpSXZmobd
 BkZXOC4hBrab3h5LVF5Sul36hW1DlMMJMSXzSxMH7S2c/4bAXH4UKKMylPX4RBiMTGL+gkF+0d
 58Z03cAP0wk0aEaGECuBZnVjm5VFmwGb/BUT3gd+JOV6W4MAgP3+Iz9zHihorfBZegOcFFrCOF
 OYjo5K52nvgxo0g8Tbm7XXQqBb6fyo9VhCuHHODwGhYrSXc+eBTR6SiUmI5xqUpgDJJlKVh/AC
 qL50XTt69H0GP5mPkRZOyIHT
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:00:44 -0800
IronPort-SDR: RdOTi/aGVzzkQ1zw17EziNuHaTrqDthul70mDxDqzYbCrfwEko2QLEnKEMOuhG7qnWoWA/RawD
 yGW/gIESiRbw3laeubqdNRnuPkK0x1U74x+9SYn1JOKiinSA1LOE59YqR8vJZafV2TIMgF1AUS
 OQSQYzCAAWxNgJjEfO/jvbDRiffLcgtGIhz/oif0Ha72+/m6X9m+m6S6iK5wvdpFNvj9mDvrGq
 bPp0ctzPKEEaOsD8G52/kknK9kSMFhbVN3EyosMlpCTNhxeJTA9JUp1Hbk0SL6hqyOiNo+jyTr
 DLI=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:38 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 06/32] spi: dw: Add support for the Kendryte K210 SoC
Date: Sat,  7 Nov 2020 17:13:54 +0900
Message-Id: <20201107081420.60325-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031440_763017_EA20EA1C 
X-CRM114-Status: GOOD (  13.83  )
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

The DW SPI master of the Kendryte K210 RISC-V SoC uses the 32-bits
ctrlr0 register format. This SoC is also quite slow and gets significant
SD card performance improvements from using no-delay polled transfers.
Add the dw_spi_k210_init() function tied to the
"canaan,kendryte-k210-spi" compatible string to set the
DW_SPI_CAP_DFS_32 and DW_SPI_CAP_POLL_NODELAY DW SPI capability fields
for this SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/spi/spi-dw-mmio.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index 3f1bc384cb45..a00def6c5b39 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -223,6 +223,14 @@ static int dw_spi_keembay_init(struct platform_device *pdev,
 	return 0;
 }
 
+static int dw_spi_k210_init(struct platform_device *pdev,
+			    struct dw_spi_mmio *dwsmmio)
+{
+	dwsmmio->dws.caps = DW_SPI_CAP_DFS_32 | DW_SPI_CAP_POLL_NODELAY;
+
+	return 0;
+}
+
 static int dw_spi_mmio_probe(struct platform_device *pdev)
 {
 	int (*init_func)(struct platform_device *pdev,
@@ -340,6 +348,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
 	{ .compatible = "snps,dwc-ssi-1.01a", .data = dw_spi_dwc_ssi_init},
 	{ .compatible = "intel,keembay-ssi", .data = dw_spi_keembay_init},
 	{ .compatible = "microchip,sparx5-spi", dw_spi_mscc_sparx5_init},
+	{ .compatible = "canaan,kendryte-k210-spi", .data = dw_spi_k210_init},
 	{ /* end of table */}
 };
 MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
