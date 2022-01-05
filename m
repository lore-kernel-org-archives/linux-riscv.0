Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF6FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jan 2022 05:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTKo83ZQhiFKGUDftioYCZoASTvpTh4g/uq+uxZhKlA=; b=qtPY/eBRHiELe7
	mFlYilrAPsiMebkKRfQS4hHnxMQFXK2cHVPa72AB/+6iAAzQjE2UVYFlYRRqEVSCeJOvi9fHNYXa7
	qVd1nfArICZi+VWbM8yloA8MIZgYXuLLA0EE+rWN44aFoiEZtP7vRR7KUEvaiRCldVHzymQfCaN9t
	gOW+LOhmNoBBGVYoGwELaCF5AlI1Awh7p+KH6cLG7oPPBluK2ubpaxOxnfRTcuqCpgK6YoLY6Ckrn
	2mkVmjN6P2YRTwrrgDMoaDTu/nPfQzSjMoSo9E8Q2Z+5/nW2aboy20EwXOC/iP1qlKD0TP/Wz/y8X
	j/Owo1Y0F+G6lcUiS75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4z62-00Db5J-Ap; Wed, 05 Jan 2022 05:44:26 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4z5z-00Db3s-Fh
 for linux-riscv@lists.infradead.org; Wed, 05 Jan 2022 05:44:24 +0000
Received: by mail-pf1-x435.google.com with SMTP id 196so34231168pfw.10
 for <linux-riscv@lists.infradead.org>; Tue, 04 Jan 2022 21:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gYCrjT384T+qCrcrLtXCLy/4eLs5COm+VZcUyniicZE=;
 b=JDBhwI9bbq1as4Sn5NxIQCtQ0iNed6+ByFwf7cjiwad0mZ/9TAZWPe2ZW/hhPyW464
 8T8zu5JqkxOLVyjCLIJ8XCocG23s20vJU5aqlOEmdYyQTNbZ15c2hR1HuQDrSkeZBC4V
 qUemjLC1qYOTfMSDT5g5C07+pbrbKLXngwtKeqTwojZ8ag11mYLKtp6AirbVe6fjlXD/
 vBbz0J5Iuv5eRPdciFg3hM/FnYmim3CV0tznzsYiY0i95IQqjhzSEj9FpvnnjYv3bk5E
 EWIWc+xFATIkNnh+qEqE6I1NswKMGmnhwM0OuxbGbbgcxs1zjdv7MiezAP9XeFHTg6xY
 RSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gYCrjT384T+qCrcrLtXCLy/4eLs5COm+VZcUyniicZE=;
 b=YsW3btmKMBQXQprm/q1gqOcMA9Qffi5Iw/9pipTel5P2oZQ8nGVlrf8e+n1PSg+kIA
 rxeWog1bOJ7w8Nm/F8BonWKX61X7m8xhvMf9OBh6fe9Re+WLj9XsI9H9FPNk64mwDnyC
 aamzt1QJWJP/WA899GtmaDetAR8cu0LKr90hyY1I4shGI2ZF2hKu6zZbVebp3DJH05IL
 TUKY82m+PRs/1upUSEgitkQNwAMWSo7/IEgR7kRky8tFH0y6NzelKp0AUp6ns81cThP9
 F7yoPL41JEvllamFGqmzJnR2KrqaWhL4EzMe4ZuwUtyESnMcUCusge+7DUAbP8S5ffzK
 YfHw==
X-Gm-Message-State: AOAM531vCBW8StqJEEg8xp5CVDaJDcVZMWW9P7GTTqHFEkSmhT032Skc
 5GMyPvpadaD2q0yqVXbyKa9Iyw==
X-Google-Smtp-Source: ABdhPJyyQ0QdcjtQaZ5nXIIXvrOrCVJIoWRS55wSz1V5EQJqDCCp2soZV7ICOR8x08ZwFRrTbCYxsQ==
X-Received: by 2002:a63:b245:: with SMTP id t5mr1475467pgo.231.1641361461670; 
 Tue, 04 Jan 2022 21:44:21 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cu18sm1000574pjb.53.2022.01.04.21.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 21:44:21 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 3/3] dmaengine: sf-pdma: Get number of channel by device tree
Date: Wed,  5 Jan 2022 13:44:00 +0800
Message-Id: <5a7786cff08d55d0e084cd28bc2800565fa2dce7.1641289490.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1641289490.git.zong.li@sifive.com>
References: <cover.1641289490.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_214423_547996_1025EA4C 
X-CRM114-Status: GOOD (  15.62  )
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

It currently assumes that there are four channels by default, it might
cause the error if there is actually less than four channels. Change
that by getting number of channel from device tree.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 15 +++++++++------
 drivers/dma/sf-pdma/sf-pdma.h |  8 ++------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index f12606aeff87..c941150fc830 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -484,21 +484,24 @@ static int sf_pdma_probe(struct platform_device *pdev)
 	struct sf_pdma *pdma;
 	struct sf_pdma_chan *chan;
 	struct resource *res;
-	int len, chans;
-	int ret;
+	int len, ret;
 	const enum dma_slave_buswidth widths =
 		DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
 		DMA_SLAVE_BUSWIDTH_4_BYTES | DMA_SLAVE_BUSWIDTH_8_BYTES |
 		DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
 		DMA_SLAVE_BUSWIDTH_64_BYTES;
 
-	chans = PDMA_NR_CH;
-	len = sizeof(*pdma) + sizeof(*chan) * chans;
+	len = sizeof(*pdma) + sizeof(*chan) * PDMA_MAX_NR_CH;
 	pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
 	if (!pdma)
 		return -ENOMEM;
 
-	pdma->n_chans = chans;
+	ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
+				   &pdma->n_chans);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to read dma-channels\n");
+		return ret;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	pdma->membase = devm_ioremap_resource(&pdev->dev, res);
@@ -556,7 +559,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
 	struct sf_pdma_chan *ch;
 	int i;
 
-	for (i = 0; i < PDMA_NR_CH; i++) {
+	for (i = 0; i < pdma->n_chans; i++) {
 		ch = &pdma->chans[i];
 
 		devm_free_irq(&pdev->dev, ch->txirq, ch);
diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
index 0c20167b097d..8127d792f639 100644
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
+	struct sf_pdma_chan	chans[PDMA_MAX_NR_CH];
 };
 
 #endif /* _SF_PDMA_H */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
