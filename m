Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42084C4453C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TeaHZqRgx52TdXMDtk3/IiWOvB8miJDFYjon+6/Ut/M=; b=ZQwkaCGyj9Egxx
	KyTwq/W5kTMkY7iUi5NAy5i7uvjCoDh46V2ouU5eg09t3nhV+JRR1PxDNQIi/3KHpQPri0morQm73
	wIa1TxFfR+7NR1ezD5gqSbOfgTvNSd/t4S/JboxZ/2JyGvk0jGT+U1OIwiqmVeKgoHFZvK+0EIkN2
	fQqQSXbp1ZTaLIfL3g9a6jrIWX/pvC+zX4R9kjxnoeoOg8n98XNIjmSpFJp0gY5sZlbdyVnUnrHTF
	KfZmek/OjDxVKDTHqN5emt2IPwJtWPrTvtLsr9iLdwVeK9x1b2a0uvmWgMfKf5ealFkIyc2Ynim8J
	0dwhl0w8Rz9aIm5B7eKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZkn-0000000CKfl-3KNH;
	Wed, 22 Jul 2026 16:25:05 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZkl-0000000CKf8-19ZF
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 16:25:04 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso8529990a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784737502; x=1785342302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXYrafFh6v41hHNrCujwkEXP25aXy1QcuniyU+tuiOM=;
        b=QfbzBvwftZg2xz+68D/HEKicR5YSGhFDDcHYptqmw6QqivXTvH9Qyms9Acl255ao2K
         rbdmYn4FM89c/n3GqBrspaKAytbvmcWcvV0G0RkLnFERMKLfoscwJZmmGigpW2QYdrvL
         Mn+mZi2q7PjmQUu6YQ7CkxR3e67mMqA5JlodMU6RDHwp1vgFCQ5v4KUMSOQBPa3S6MZN
         +iLxNfgdMjRkHIf3sFBDWHntOWIlNKn7i6fSqjugO9IUjDmGlCEeMjR10pUa1kbJxq6B
         k2qmjhiiZaF2o885imy9CsLhIQjm5c+DK1Pw03BqLWJCmEy1OxdBbg+qjte1CE1tDi+K
         XNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784737502; x=1785342302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXYrafFh6v41hHNrCujwkEXP25aXy1QcuniyU+tuiOM=;
        b=mx2XTCsHtNxlaFGI5ZwTqznIOAkoXziWnQ52E44KVLA1G2WP1O1ZYump7djT5jXC/H
         ZSWG3KwG8eQ2dCPT0xEcdNSJ/69+ksSl9aFR+PqpgYfu2lAHmI0NVuQHipcN9ucKsyHz
         nJOfNTsFJkFq1YtRfsrHsuJgXs7LIVuRmAZD3TFhpGxBPjAH/ocRBvqsCsD8g7qoUoYN
         vOSnBNF/4umOkdwQj3lbp6pR5MjwWlfz5AaCsrjCNys/qYLp+TpAFuU10GmZjbK3OL9C
         SUGSCsN5EAKaYGIA96elkp4NIW8bnKokaDImgDXZux+8v8ozoIalNVgjA23lvUBABXxd
         OA8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpnbtGw9QA18tX8b0X6hPlJCSWkHuMoX5zcDEgGIVamhiPIKOSJUfos0+QyaGtgnbzwfn0uVdoQ5X+lpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB6ATGOSPdTPSHjZaMqEOytwIH04/BwUTg3cXuAB4y5l99gSOb
	xXWLnaG47SnlBf9mhgthojS5wmxknA3M2arTNI2aEpYSvfdTcV/td5Q=
X-Gm-Gg: AR+sD104o0ywhvFP7IFTVAg2mRwG9VYKd7z86jswUPUknhh36qLfQ5ChRrxh5tPAjf2
	V6+TD2Wq0RW/zP6tH3/LLyp27YGlGTLxdjN7r3IJqHgNtKP3cP+SsdKos8BiHmALVVzeM3UbAaH
	vXEfowJ2ptWGP/H6eoT153nbSas9snoXb+Vo4jf56xi1M3rgq4J1Ob8FMAKAB6uAtnzKW/2gDe6
	jdCbyuXDF6DLPN2W0Z+jkE45+F1KsDx4raVFEvws709bBo/kcEwCXgcFvj1nHeFdyrANa7ywSLF
	0jjgZkXxqaK0oWP5gUctPkH5os3qSPvTIV9r1yG9pcU2NUagrdV76GbGBUKbA1YsMgRe1TwVihL
	zF07tVNkS2la5bHO1mJxLKKOzmfh5tAFz6llZHTFJCepQw6Bg3HfzKPZIpp4DoxWCJVYaq1zQNv
	/+t5O6NXSx40URKv30m24mzr0ppX1xy3Wpt3RZ
X-Received: by 2002:a05:6a20:a10a:b0:3c3:88a5:83db with SMTP id adf61e73a8af0-3c3ad6036b0mr25638872637.5.1784737502208;
        Wed, 22 Jul 2026 09:25:02 -0700 (PDT)
Received: from t-rex ([2401:4900:c212:546e:3d3e:f0d9:52c0:8a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6162csm10753122eec.7.2026.07.22.09.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:25:01 -0700 (PDT)
From: kr494167@gmail.com
To: broonie@kernel.org,
	dlan@kernel.org
Cc: elder@riscstar.com,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH v2] spi: spacemit: prepare both DMA descriptors before submitting
Date: Wed, 22 Jul 2026 21:54:44 +0530
Message-ID: <20260722162444.11415-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_092503_376330_D67690A4 
X-CRM114-Status: GOOD (  13.43  )
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

From: Surendra Singh Chouhan <kr494167@gmail.com>

k1_spi_dma_one() currently submits the TX DMA descriptor to the DMA engine
before preparing the RX DMA descriptor. If preparing the RX descriptor
subsequently fails, the function jumps to the fallback error path without
canceling or aborting the already submitted TX DMA descriptor.

Fix this by preparing both the TX and RX descriptors before submitting
either of them to the DMA engine.

Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
 drivers/spi/spi-spacemit-k1.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
index 215fe66d27b4..96b41b67fcbf 100644
--- a/drivers/spi/spi-spacemit-k1.c
+++ b/drivers/spi/spi-spacemit-k1.c
@@ -278,25 +278,25 @@ static int k1_spi_dma_one(struct spi_controller *host, struct spi_device *spi,
 			  struct spi_transfer *transfer)
 {
 	struct k1_spi_driver_data *drv_data = spi_controller_get_devdata(host);
-	struct dma_async_tx_descriptor *desc;
+	struct dma_async_tx_descriptor *txdesc, *rxdesc;
 	u32 val;
 
-	/* Prepare the TX descriptor and submit it */
-	desc = k1_spi_dma_prep(drv_data, transfer, true);
-	if (!desc)
+	/* Prepare the TX descriptor */
+	txdesc = k1_spi_dma_prep(drv_data, transfer, true);
+	if (!txdesc)
 		goto fallback;
-	dmaengine_submit(desc);
 
-	/* Prepare the RX descriptor and submit it */
-	desc = k1_spi_dma_prep(drv_data, transfer, false);
-	if (!desc)
+	/* Prepare the RX descriptor */
+	rxdesc = k1_spi_dma_prep(drv_data, transfer, false);
+	if (!rxdesc)
 		goto fallback;
 
 	/* When RX is complete we also know TX has completed */
-	desc->callback = k1_spi_dma_callback;
-	desc->callback_param = drv_data;
+	rxdesc->callback = k1_spi_dma_callback;
+	rxdesc->callback_param = drv_data;
 
-	dmaengine_submit(desc);
+	dmaengine_submit(txdesc);
+	dmaengine_submit(rxdesc);
 
 	val = readl(drv_data->base + SSP_TOP_CTRL);
 	val |= TOP_TRAIL;		/* Trailing bytes handled by DMA */
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
