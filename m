Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0B0C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Mar 2022 09:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rUJ2/hrDMkr01W77ND/ERl5/ATNXCS9d/JJjKxhKQA=; b=LvX/SrGCG6ZF2K
	YQREeSMcS8FXDnMl0fFC4vYjQDEM9pv4dObXlgRRLeifblL+4Hj7TpiAXT3nYcmXVUNex4vCf2dHa
	Urq9IPYVVflx+Zz1mgY3eaLamvQpXAdtfRjAy26WbaPoCrH8hkhxBtO6t//0PR/mqBRGukuTDwsul
	/zT0IdMXYJWR0lA6v9iku3KohNNrtrhforuRi06uUorbz0Du4enxlTRyaYzuFXXZIA/4prILcvEQO
	wmT/KkPwq2NnJXTkBMbugLPcYhl3aEuciixLFizYDcuz1cqA2oW2uYp/Wo4NNvuFPFN+hfpFEN7bV
	hy1Uah/yrFNKgmITK1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYm3O-0085jk-B5; Mon, 28 Mar 2022 09:52:50 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYm3L-0085hh-Ej
 for linux-riscv@lists.infradead.org; Mon, 28 Mar 2022 09:52:48 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so9922053pjk.4
 for <linux-riscv@lists.infradead.org>; Mon, 28 Mar 2022 02:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oFYJu8bdS9lTnagtGk2u5UISyqGssJEWeZR75J4CCQ4=;
 b=GntnHgow6kb2bhuinGrTFT6S/X9qym/s0sFSEUkJXDmNQl82e2NCI1Dma+l72P+0wm
 9XMVcbHiRuxmvVtSPBZ7tQKj3M9CwbQN8u0YrhUHuwLJA0xwxOAP/iwP5HG2ieL5yBOB
 riyl5rYiqhApthbGtlZAOlL61VBJIcvqO1QaO37Z7lv9H4vxQ+xubqdQx26xXUVGFD8d
 gxMFYcwX+olVPgEM1Ntshiy1FnwUIwyiKDhK2pqaCM1mSHd6b1m0g9+oLCrcBHPeLggT
 +UMQ6lX6a6VxpFVHvdyINtwXFxyfB2gkIAq5wYTXNjWGzZ4XNOPo3g7YIa1sPy5P0hSU
 vILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oFYJu8bdS9lTnagtGk2u5UISyqGssJEWeZR75J4CCQ4=;
 b=T/+DZd3zLjPzO5VtYbvWIelkZc5B/RagEIFCxus1hthOF/c0P+fRHFUW3C6lEfmAAO
 R3mE8BaBqrmeZjGHyw0FbLglaWSsegmRy6JWYcaxND8UwHmXIqrPx/MlrKDT/o5ZokmN
 CbJq3wb80ftLwhvYzkte36AHKd8gNOkIOJnjkCb87vJZtDA92GhcKgpEr2xr6+++wtq4
 hCLhC9m85gzybDvIedbDnlQpZspkrdtiZc290LJgsygI0Gd4ilL09h1e2UVMWSOh4zEg
 DgX0Z5nBkmTQLnX/CnwY1S2HvhLRDSLS2EkUaOnQLhWAZnxiM1ygXfmT5ZtZJq1Jxlrc
 lHCQ==
X-Gm-Message-State: AOAM5317oF+jLo7lS0mW5QeuFapBwa7Au2QRmkOYA5kbCWtcpKGi6/fv
 knUKTqRhC+oH/FMVDbTdH5Ufhw==
X-Google-Smtp-Source: ABdhPJwLen54FYCTR5UKlde92eYTDiJhw3WeUWHMHtaUWkB4DnSeea8SCaamC7zkpBJAESiySUP9EA==
X-Received: by 2002:a17:90b:1c01:b0:1c6:dc49:d146 with SMTP id
 oc1-20020a17090b1c0100b001c6dc49d146mr39288419pjb.29.1648461166701; 
 Mon, 28 Mar 2022 02:52:46 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a633744000000b00381efba48b0sm12255117pgn.44.2022.03.28.02.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 02:52:46 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v8 4/4] dmaengine: sf-pdma: Get number of channel by device
 tree
Date: Mon, 28 Mar 2022 17:52:25 +0800
Message-Id: <f08a95b6582a51712c5b2c3cb859136d07bfa8b9.1648461096.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648461096.git.zong.li@sifive.com>
References: <cover.1648461096.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_025247_538544_32760A76 
X-CRM114-Status: GOOD (  18.91  )
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

It currently assumes that there are always four channels, it would
cause the error if there is actually less than four channels. Change
that by getting number of channel from device tree.

For backwards-compatibility, it uses the default value (i.e. 4) when
there is no 'dma-channels' information in dts.

Signed-off-by: Zong Li <zong.li@sifive.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 24 ++++++++++++++++--------
 drivers/dma/sf-pdma/sf-pdma.h |  8 ++------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index f12606aeff87..db5a4ef76077 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -482,23 +482,30 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
 static int sf_pdma_probe(struct platform_device *pdev)
 {
 	struct sf_pdma *pdma;
-	struct sf_pdma_chan *chan;
 	struct resource *res;
-	int len, chans;
-	int ret;
+	int ret, n_chans;
 	const enum dma_slave_buswidth widths =
 		DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
 		DMA_SLAVE_BUSWIDTH_4_BYTES | DMA_SLAVE_BUSWIDTH_8_BYTES |
 		DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
 		DMA_SLAVE_BUSWIDTH_64_BYTES;
 
-	chans = PDMA_NR_CH;
-	len = sizeof(*pdma) + sizeof(*chan) * chans;
-	pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
+	ret = of_property_read_u32(pdev->dev.of_node, "dma-channels", &n_chans);
+	if (ret) {
+		/* backwards-compatibility for no dma-channels property */
+		dev_dbg(&pdev->dev, "set number of channels to default value: 4\n");
+		n_chans = PDMA_MAX_NR_CH;
+	} else if (n_chans > PDMA_MAX_NR_CH) {
+		dev_err(&pdev->dev, "the number of channels exceeds the maximum\n");
+		return -EINVAL;
+	}
+
+	pdma = devm_kzalloc(&pdev->dev, struct_size(pdma, chans, n_chans),
+			    GFP_KERNEL);
 	if (!pdma)
 		return -ENOMEM;
 
-	pdma->n_chans = chans;
+	pdma->n_chans = n_chans;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	pdma->membase = devm_ioremap_resource(&pdev->dev, res);
@@ -556,7 +563,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
 	struct sf_pdma_chan *ch;
 	int i;
 
-	for (i = 0; i < PDMA_NR_CH; i++) {
+	for (i = 0; i < pdma->n_chans; i++) {
 		ch = &pdma->chans[i];
 
 		devm_free_irq(&pdev->dev, ch->txirq, ch);
@@ -574,6 +581,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
 
 static const struct of_device_id sf_pdma_dt_ids[] = {
 	{ .compatible = "sifive,fu540-c000-pdma" },
+	{ .compatible = "sifive,pdma0" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sf_pdma_dt_ids);
diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
index 0c20167b097d..dcb3687bd5da 100644
--- a/drivers/dma/sf-pdma/sf-pdma.h
+++ b/drivers/dma/sf-pdma/sf-pdma.h
@@ -22,11 +22,7 @@
 #include "../dmaengine.h"
 #include "../virt-dma.h"
 
-#define PDMA_NR_CH					4
-
-#if (PDMA_NR_CH != 4)
-#error "Please define PDMA_NR_CH to 4"
-#endif
+#define PDMA_MAX_NR_CH					4
 
 #define PDMA_BASE_ADDR					0x3000000
 #define PDMA_CHAN_OFFSET				0x1000
@@ -118,7 +114,7 @@ struct sf_pdma {
 	void __iomem            *membase;
 	void __iomem            *mappedbase;
 	u32			n_chans;
-	struct sf_pdma_chan	chans[PDMA_NR_CH];
+	struct sf_pdma_chan	chans[];
 };
 
 #endif /* _SF_PDMA_H */
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
