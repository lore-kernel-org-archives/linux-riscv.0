Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C4A606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 19:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=grija1yn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TZNZ44V3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dSmaTWOGbe6kLgAtobYjO1+bhFzf2QarRW1GSAEKbSI=; b=grija1ynf8hgg7eYSWezd6hSiE
	9skW83pAebX34U15CMSaIB+zGT/bKZvFCcwehIFFsnMdxN/bOuXOmPaWgXNXKy4fUlsRM16uFnW1G
	ES5nc9yC0axot5XEwgx/dA+L06r008uwEACJ5uYIRp72DKNzswXSBjRpY04l0bgJJ7Az5uPvpXEQ1
	R5VEZJyzAcch9z2DsdbJePGUiuNIA9rTWCaILAAuAqMyfJBfT5HAiKBgkDBRm9cP8Wdpy/eAnRoPl
	fEWjltQR6uyy/C0V+fJkbMYxsmIxs8NGiWQOxNSKwW7XUL6wNQyVE9Jki36KBwiZK87g2q/wsHZLO
	hVEPq8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWet3-0000000EFJR-1og2;
	Thu, 26 Nov 2026 19:12:05 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWesT-0000000EEWP-0kP5;
	Thu, 26 Nov 2026 19:11:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 71DE5C2AC48;
	Thu, 26 Nov 2026 19:11:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B0C160558;
	Thu, 26 Nov 2026 19:11:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F68211E691C6;
	Thu, 26 Nov 2026 20:11:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795720285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z2SDAeMcZbzv6+qb40r4M3IxubYi8XKkur/4WIhWlrI=;
	b=TZNZ44V3iWTnm4oCWdGoYBdBNuawXE6bixpW9HdFtyO39AMlXam6rU2aaC/zRszXEn0uWa
	/OYQXP7kXn8APG7XqjuqfeKVhtzdCq1Oc6ixdWvi05EORBIPfo1YT5oSeIeIrL9O47fugU
	daWTs5T7EyEfj5Pl5ybGTFeabf6ihIndwzC069qI9vAS/DWUGvF4kS8XvRA0LWvJ3ER9ov
	3XqkP6N+WJI4zsH3FK/F2ORO5a5vgNOXbOVH2snB3hXHZxZ0MjBkGhDK5zjGdaShsiPsdE
	qfmsEQw33P5bVKMOnfRnyFB8yizvLl99B9aDZeNIQ1Tjmm9VYXPsRfm3BAGltg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 20:10:26 +0100
Subject: [PATCH 07/12] spi: atmel-quadspi: Advertise DTR for the octal
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-7-ca8e924cca1b@bootlin.com>
References: <20261126-macronix-upstreaming-spi-driver-fixes-v1-0-ca8e924cca1b@bootlin.com>
In-Reply-To: <20261126-macronix-upstreaming-spi-driver-fixes-v1-0-ca8e924cca1b@bootlin.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>, 
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, 
 Mark Brown <broonie@kernel.org>, CL Wang <cl634@andestech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Yang Shen <shenyang39@huawei.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_111129_557669_3A204174 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The octal SAMA7G5 controller implements DTR transfers, but the driver
never advertised the capability, so the DTR code was unreachable. Set
dtr_caps for the octal controllers.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/atmel-quadspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 4f3ceef67b40..0b695b0b3c98 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1429,6 +1429,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 	ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD | SPI_TX_DUAL | SPI_TX_QUAD;
 	if (aq->caps->octal)
 		ctrl->mode_bits |= SPI_RX_OCTAL | SPI_TX_OCTAL;
+	ctrl->dtr_caps = aq->caps->octal;
 
 	if (aq->caps->has_gclk)
 		aq->ops = &atmel_qspi_sama7g5_ops;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
