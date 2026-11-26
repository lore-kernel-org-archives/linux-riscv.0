Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4CA606A334
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 19:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n06XQAZ1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iZSSBUOA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/nUvqLREQbvNOV9BoGcMuGdcYpgnDqx8qXTBzgD8z1M=; b=n06XQAZ1qp2E2sez9Nvu95+jtG
	d6kz+S5CF9cFoi843teIzZsGymEd1ykKj7Qs+XqmCTRHpYu5Carlhq0CCPTcLkeMTVEqCcFixtzDK
	SMpr0WyCIaN8+xyHI9QBmCOo3UrRdW2lyN4SMKAOKYcUt/4/k+E43WS+VW/Z5vKPExsrymwR06693
	0VnhAcRON1De9hJcwT+gdWNR5B7t+hMFVXPonDgqhwgBiQixq7iyL4tVDGCN4aVYjuD3CPpsJS8OR
	jYhepkHrV0mH5x0JVOZwjNjR6oXLphu7Gu1Ppfys1jr+OouVNuMriAhMK9BDx9+kDeyE5aPQJhrxX
	+dXVdCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWesW-0000000EEdp-2DnL;
	Thu, 26 Nov 2026 19:11:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWesN-0000000EEPP-0Vpn
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 19:11:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9BB2E1A181E;
	Thu, 26 Nov 2026 19:11:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6ED9F60558;
	Thu, 26 Nov 2026 19:11:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF9BB11E691C1;
	Thu, 26 Nov 2026 20:11:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795720279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=toteBFJ4ezZ5aPGYGIb4HRCJ6xMk4nB0klctz7NUA/U=;
	b=iZSSBUOATQ0jf1GSEgkGedTsY3xVjj9Bmqth01IcKq0iQ5mxaCAvDTZ2oZBEMHvKK8eSfL
	lKd47wn3dz0W70XIZFmbZEYi43A5vXuREUiMFDNNCKfxyDcvfp/sj4SBAdrNAYxl1F96vU
	CGPFbMNmgVObZJwnfTw6uJyDDrJJgHICdBxbrTsEBqHfPvnihrAsiqnxpU5QuBniTx8N+J
	YGSxrhud2yXi52gEmySDfY45KsLc5GXM438WDyFioSFYJXotT8uTv+5YVfuyaHfiba2QaI
	6ltbJQM+wMQ91dltcnXfr1mJjX3ms+Q/ai9dKeo9eYi3Z5zi39hyU+RXd9BnSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 20:10:24 +0100
Subject: [PATCH 05/12] spi: atmel-quadspi: Drop redundant address buswidth
 check
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-5-ca8e924cca1b@bootlin.com>
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
X-CRM114-CacheID: sfid-20261126_111123_408221_CAEFBE7C 
X-CRM114-Status: GOOD (  10.70  )
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

spi_mem_check_op() rejects an address phase with a non-zero byte count
and a zero buswidth, so op->addr.buswidth is always set when
op->addr.nbytes is non-zero. Drop the redundant condition in
atmel_qspi_sama7g5_set_cfg().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/atmel-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 762a3fb0fca8..c53e0488dcb6 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -712,7 +712,7 @@ static int atmel_qspi_sama7g5_set_cfg(struct atmel_qspi *aq,
 					      op->dummy.buswidth);
 	}
 
-	if (op->addr.buswidth && op->addr.nbytes) {
+	if (op->addr.nbytes) {
 		ifr |= FIELD_PREP(QSPI_IFR_ADDRL_SAMA7G5, op->addr.nbytes - 1) |
 		       QSPI_IFR_ADDREN;
 		iar = FIELD_PREP(QSPI_IAR_ADDR, op->addr.val);

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
