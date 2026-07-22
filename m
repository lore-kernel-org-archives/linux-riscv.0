Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC72C4451C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 03:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M5lm+atzUB9GcoP4EeLe/Bs70a1CH0rpiD9K30VErCo=; b=QIsQ9oFBgwBkcU
	D1ZK7hVVduQV1p/LKieEadPnzYaFBigCZUnMysZC8ZnO5gYlCLeQsh8mxQ76+FsOqipMg3HI/RwUS
	qvM5J7n+Fwq7tVM1R3tiunw4YP/KTHUoMG1J0SrfEcnyKNSFNBF8YF3g6wGQzpraqQvudAeJf1pYN
	rFlw5pvc5n+0h49o7t4ZLYgfIAQjEMSVxKsA4myqq5fNoDZV8HtVONasVzNrdvmszZyQaWuB4eDCi
	O16Id4VEnX0jVZ+A5SyW2+orZSsGbc5NeZ86WMhy8TkjPTPWIo+PM+7JEPIVwkU8usduLFc/9p68N
	lpOJFpBOq5mP0+WE1krw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNpd-0000000AprT-02j6;
	Wed, 22 Jul 2026 03:41:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNpa-0000000Apr1-1CPO
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 03:41:15 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso137488635ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 20:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784691673; x=1785296473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fMsLP/6JMCFywbSNUxwQOz2CeAVV57hRVViNt75YJiE=;
        b=FXPVjyQ8rkkLgfjn2SixQrJdwHeb6qKCfHlM4XUlCW2IMzKxWsWd2af+DJDzoR5Scn
         RZYqcmaGuwaueQiSZJHl6gDolCPi7klRdq7735vWRB5oZq9xJyXhR7ntX5MkIuLZKl/0
         0vtgLxmpv3gFIErHM03ErrmPl8QSMQ9HHDUe93OqQS7LpVTdy0jaGvkGV1jB/nBmBNi2
         ub10jWDDjl32w1ehYExSYq1W4/+ekLxXnVxSHCtl23yjsI6pvgO1NE14cgHEGDwp4DDK
         FUuykM7b1da5pFJgoUCcKlDEVjR+cCdPP9nsvLNnG92S3kSpb19JBZ8O2zSWB6JEVQKW
         UdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691673; x=1785296473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMsLP/6JMCFywbSNUxwQOz2CeAVV57hRVViNt75YJiE=;
        b=DM+S5m7Zn0SQzFHnbGVY2/doRl7DwydxqxR6ryELmDcCCOs9MXG2NsOdMNJmYmp7qq
         6L8xI0qQI2cOJ9GsrjF2NV4DewqPVNJbxPk3tHexAajnKGxqZnLhdvJ44pP4P2D7PfP+
         2vXOqKe4uDMRT+k4kC/VMEQgdlK+1ZXSfcTB20jVu/vRJB8ZCWgON+pZ6w4zS2gIfClT
         neyavccf15UEUo++1UxVRLGdQN5MyCxBUNoJmJCFqiMmJ8YVo3ACmIcX9ur+6qklOVwv
         qk7d7kR1YZLXJPWrARh7j7U2IGECh1Pk7XN80s0KZBjyREZ3TKoXOCqnLLES31nrvm9b
         6BAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRyrQB7HORsspFuZttAI0Z9lhjMDOQLsMRHAbU53HqSE5PQW7RMSBQaQXl9WFHEZ92IkF4A4e+EUCt7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ+x7OtY9VNsimRIwLvNZUBhdAaDDkHd4uKh2x+grZh5eu8gqb
	4jNsTiZzXbGWMtkIuzViACN00htA3aajgsxx6lSZPF9WZyZKLhSvQu0=
X-Gm-Gg: AR+sD119LFl9W2Ll1+FDuOmRwEYWdXAzlyUw6hyiP7/cOeS+2mxPpspP4DM1xOk0iQy
	vYVrqDW/jkkKmdDXfsZGo6n5RH+yX16y6sfQd8w8kVWR203n9i7ZcJFdvft3SO2QQTBVewmsftG
	pd8wsLiq0P0ygTNF2zUFsqVGc2MzrxIQk2tZUP06VRcSMi7ZcF3SP9y/xA8SNO+cf1EFwyNvQTP
	QPnrOV0yHjDDaVvzOkrW9K+w2x5UkLs6QNN6A0lP+WfywUmZAmubk8EcLu2AC6R8u2fAaO78PU2
	kuLiP+JGx1KbmyjrWvOpHf2YWPEvCF1L4oxqLMx2DAqdIRj9mSK+bO+jDYR3YAYnbu2KnH/5RiE
	q05YbEvNCyAWBXxQdBUQdBDQZBZambCZw6porH3GEL8cV+cVd72Uy2uwag3DBwl4FdaqH7dUsZD
	BS7jzkisSamuN31TFE2vrDvKkiWkw=
X-Received: by 2002:a17:903:1247:b0:2ca:de3:15e1 with SMTP id d9443c01a7336-2cf34a0a682mr225407425ad.31.1784691673137;
        Tue, 21 Jul 2026 20:41:13 -0700 (PDT)
Received: from t-rex ([2401:4900:adaa:53ec:4dd9:f3bc:714a:d631])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm7523404eec.1.2026.07.21.20.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:41:12 -0700 (PDT)
From: kr494167@gmail.com
To: broonie@kernel.org,
	dlan@kernel.org
Cc: elder@riscstar.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH] spi: spacemit: prepare both DMA descriptors before submitting
Date: Wed, 22 Jul 2026 09:11:03 +0530
Message-ID: <20260722034103.12190-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_204114_350975_69C486EB 
X-CRM114-Status: GOOD (  13.24  )
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

From: surendra <kr494167@gmail.com>

k1_spi_dma_one() currently submits the TX DMA descriptor to the DMA engine
before preparing the RX DMA descriptor. If preparing the RX descriptor
subsequently fails, the function jumps to the fallback error path without
canceling or aborting the already submitted TX DMA descriptor.

Fix this by preparing both the TX and RX descriptors before submitting
either of them to the DMA engine.

Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
Signed-off-by: surendra <kr494167@gmail.com>
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
