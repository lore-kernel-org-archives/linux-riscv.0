Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE72606A335
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wXtowkR/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ouWcG3I4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aUWO8XmTiyAbqTjIIJhLamsAIYQSB8t5Oyeco4C2J4Y=; b=wXtowkR/TDzi17e6XKxDLfQCYM
	Gz9ZlhZ8EdFEFxGYoRc2XJ4GK8Gyyxwfor40C4DphypcfGpJ4T0sZ6T+7Ol4Kig9W0pRIP1RRpYUm
	q6kyvvvevkGErOQG9E31y5BXf5Wpnl9/OAow5U++MGjqmoAOTc5RuwGmsPSmOa1hbVCNL5OHqp676
	FUnrk/D0XMWzwBgd4NILnuoAgdrCGnUFfD779+NUhdGNRez5iqrV3wUPw7dTT4ORnw0gXv7imaAEi
	g1/lU+vUFVNmgyUnJlddR4gCfVK+mZbLZq9oCDU6zW0ULca3VbpdH4Nw6kMhJqCbxBxJMFvh88KX4
	iD/4Zd3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHBd-0000000ApwP-0rca;
	Wed, 25 Nov 2026 17:53:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAd-0000000Ao7L-1eON
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 17:52:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CF0E04E41789;
	Wed, 25 Nov 2026 17:52:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A37B160480;
	Wed, 25 Nov 2026 17:52:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D4D511E6B0D1;
	Wed, 25 Nov 2026 18:52:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629155; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cB8ERaf54ceIobkfi+P1+y1V3nLqzohkwuRk0Ck5Kv4=;
	b=ouWcG3I4Ncsf3bbLH8YHWAHCMo4HHl+np7P2+zwFQ/DQi3GjhcgPShJUDwCcGCVPvQ2+R5
	hpxDVOwUjlfcz7jyoawSnPcO93n99dd3b9wVvsIr3pWowOPWrTOAM6NN09QWahwTjydzCt
	jmgckOEREt+2Ws+uo20USUe8/IwrOal0NWwwK2FGsuPtFb3w3SG8zWINU8IhIKAH1AS8Kl
	wZts/MI7cV2f0FLuSPAhIkqD7yadTKc/uZZqEpo9qnP9qU8ExG+qJabhIWQ/rirWoKI/ec
	JdaJDygcx+r94a3NGaPvC7iM831kL7hUWwDT/YfxvGlPjLvQiCZy3vFRJwwsXQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:24 +0100
Subject: [PATCH RFC 10/16] spi: nxp-xspi: Consume dummy cycles directly
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-10-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_095241_010850_DC51A990 
X-CRM114-Status: GOOD (  11.50  )
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

The spi-mem layer is now capable of providing the dummy phase in cycle
units rather than bytes, provided that drivers advertize the dummy_cycle
capability. Since this controller is consuming cycles and currently
converts bytes into cycles, flag it capable to consume cycles directly
and drop the extra conversions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-nxp-xspi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-nxp-xspi.c b/drivers/spi/spi-nxp-xspi.c
index 38c8d6269aad..8b836662a5da 100644
--- a/drivers/spi/spi-nxp-xspi.c
+++ b/drivers/spi/spi-nxp-xspi.c
@@ -392,7 +392,7 @@ static bool nxp_xspi_supports_op(struct spi_mem *mem,
 	if (op->addr.nbytes)
 		ret |= nxp_xspi_check_buswidth(xspi, op->addr.buswidth);
 
-	if (op->dummy.nbytes)
+	if (op->dummy.ncycles)
 		ret |= nxp_xspi_check_buswidth(xspi, op->dummy.buswidth);
 
 	if (op->data.nbytes)
@@ -408,8 +408,7 @@ static bool nxp_xspi_supports_op(struct spi_mem *mem,
 		return false;
 
 	/* Max 32 dummy clock cycles supported */
-	if (op->dummy.buswidth &&
-	    (op->dummy.nbytes * 8 / op->dummy.buswidth > 64))
+	if (op->dummy.ncycles > 64)
 		return false;
 
 	if (needs_ip_only(xspi) && op->data.dir == SPI_MEM_DATA_IN &&
@@ -453,12 +452,10 @@ static void nxp_xspi_prepare_lut(struct nxp_xspi *xspi,
 	}
 
 	/* Dummy bytes, if needed */
-	if (op->dummy.nbytes) {
+	if (op->dummy.ncycles) {
 		lutval[lutidx / 2] |= LUT_DEF(lutidx, LUT_DUMMY,
 					      LUT_PAD(op->data.buswidth),
-					      op->dummy.nbytes * 8 /
-						/* need distinguish ddr mode */
-					      op->dummy.buswidth / (op->dummy.dtr ? 2 : 1));
+					      op->dummy.ncycles);
 		lutidx++;
 	}
 
@@ -1307,6 +1304,7 @@ static const struct spi_controller_mem_caps nxp_xspi_mem_caps = {
 	.dtr = true,
 	.per_op_freq = true,
 	.swap16 = true,
+	.dummy_cycles = true,
 };
 
 static void nxp_xspi_cleanup(void *data)

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
