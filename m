Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FC7C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 08:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+r9MMWhN2hzFuPgaMhJYsV39Rwp5LBzShhhv0mhPrM=; b=KsX8DobZMp2AwJ
	dyMjWxEIGQESCocf06M9ulnk1OANeY9PtKoFFkYKfrs4UcgjIRohO5O9wgeXW4+Fu2kVHnyRy/MeB
	QBox1VQaPVlRh+mKt0qzCApI30KbUxP7Y/8tXO1qDnSUl7OMQ+2IaEU0y7KV2kpXaleu2uHRXvqX2
	S2Gz7PrXLAN4ppUBQY+QuBtHF8mO2SsTinYDIUcvGJTICNVQfYshBjQAfW8poVorlmF3GeGh2y7zW
	7gIqO90Q833Zk4fgQ4nXTFxFm52Hjk/XgSzwZ0dKMQN+6+fVcp582vC6CUdqAfG+OrstPp43xyCaH
	XfuXh7v1rz/AzTiAn+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Csi-00FPep-0I; Tue, 11 Jan 2022 08:51:52 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Cse-00FPdS-Ky
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 08:51:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so3934688pja.1
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jan 2022 00:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3iqaAGZ9UzBXUbLAm4bUUdw8nwdBCobmyXaVuD0M1O8=;
 b=BpcDwsI7iX5IWglV3CB1erV4tmyiRc9yjg3obRAkqf97ex0fO8QIkyZB4JKnkKsGK0
 y2nhSqynYnnhVdX5cnBklZx9kCSAqUZXdX9XhMSaEbVFCPg6ePgwqHceFqH1Hy0bIp8Y
 BLEIfvvTOO57qMoHfRBjXeONJr4t/GNVvuA1iOK/8Kw0hZxf/EQpI7SAj2Cqwh429fEU
 +Kabee08MPoy+9fQnGwGzQxm1qEZq5mGgagui3qiUoVXtWkgWU20Fn19m9QNYPK3UiMP
 28aGeAnp87bJOWx+Zdk3iOwiBzbsQ6fTlB6iUuE0w5RktZ4VIsI/cEtk9g0oywwLHWIa
 h6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3iqaAGZ9UzBXUbLAm4bUUdw8nwdBCobmyXaVuD0M1O8=;
 b=eo5bURQgs09cFgHcxWCYiXriz/D8goWP4bbgFhTzb5Aa3raPQGonGdIE+dFMJMuvba
 iSFtH1NiGYMIsPFH139e6SeQ+tJht+vFy3ZpvgqmT6Hmh2gM/Ii6OmQLI3bVNUof+v2C
 OA2zrmp7D6fUmVLhukxjZnuOYGPl3q+yG3mX37aG661Uuq9XsIl9NStypIEwXaBF1oCf
 q5GWGuIMktOg+NbWDvNxekrdnA45MMmWtrgE7cr/fLig9n+2iiByhdSb9AN4spY4mQq5
 hG6NE0bPdKDyyH/xCPbvYZ5SZI780SrU7ZkUcsIYhmDJs1bLNDHicTtZNe5QhlPwfi3d
 zX7Q==
X-Gm-Message-State: AOAM533Gp+njnDU39SBXoBrMeGc6il3zwa5sckwVo2bLbQAgirbi+wm8
 RF1fP/6du9csSQYS9AWbsBLzWw==
X-Google-Smtp-Source: ABdhPJy+SBuFVm1a11AHzLGbXIf7gcDDLh5LomRsKXxKTX1T+LtK0Vr6OvMTpoaP93jRT/soiExCTA==
X-Received: by 2002:aa7:84c1:0:b0:4bf:379:1d85 with SMTP id
 x1-20020aa784c1000000b004bf03791d85mr3546334pfn.5.1641891107790; 
 Tue, 11 Jan 2022 00:51:47 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id j4sm9447598pfa.149.2022.01.11.00.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 00:51:47 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 3/3] dmaengine: sf-pdma: Get number of channel by device
 tree
Date: Tue, 11 Jan 2022 16:51:27 +0800
Message-Id: <78cfa00a02cbd10202040058af22a73caa9c5ae8.1641890718.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1641890718.git.zong.li@sifive.com>
References: <cover.1641890718.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_005148_714751_3606B214 
X-CRM114-Status: GOOD (  16.23  )
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

For backwards-compatible, it uses the default value (i.e. 4) when there
is no 'dma-channels' information in dts.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 15 +++++++++------
 drivers/dma/sf-pdma/sf-pdma.h |  8 ++------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index f12606aeff87..5d386037bf36 100644
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
+		dev_notice(&pdev->dev, "set number of channels to default value: 4\n");
+		pdma->n_chans = PDMA_MAX_NR_CH;
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
