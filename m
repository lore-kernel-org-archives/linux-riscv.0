Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169E9C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 01:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WK9e4t1m56jy92edFIFAveynbBvC+nk419ufGgK8Tfs=; b=CuKgKmelZpXenr
	CYH/utWSBOVv3peu62ixduV+86gULIDMdh4m7MS/TCQbgTdDzdDb/HKeCu1kFTj3sD47ZyE0Whs0e
	hgDYijIC6d3F85UnSSDtCrnCzFSN1xtv6/r0bP44ZKB+lcezJEeq/b5ENq1mNOrkDVJMTE0rF8MH/
	b+56u0qx25vUDLTGdHN+nxldAXY/+WQRNbSvbH2EgfMR5niioWme1xKxpDNAUGQuZ0Ah3qbhbWKJe
	n3/mWArTLxr3RW6uDQ+irPVbPv1vvEL2RYl5jIUlQQdItY4TXSw0YqsJlPDylKzaq55uzVIcJeJnQ
	XcvZMMJaolJmLPn4uHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Gvz-00DCOM-EA; Mon, 17 Jan 2022 01:35:47 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Gvw-00DCNC-81
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 01:35:45 +0000
Received: by mail-pg1-x52e.google.com with SMTP id i8so9185810pgt.13
 for <linux-riscv@lists.infradead.org>; Sun, 16 Jan 2022 17:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OqMpSNI9o/wkUts3PmMeUCyav5wo+up/ZcTRwyLImaU=;
 b=gPRlR1Hf1DlVbJZaGtmNkw21jKWi4su9kEjnfc5X377q7Nd2Y7HtBZ8vt7o0fPFteE
 OnSEKYrRPfCyC+GNzQBc5ldetBk0daHxdb3Lxbb2kSvLFTtfMnrai26rR6lfsiJhA5Wh
 ZG3abik8TZjlyWBQ3+2YgYRT7TtoLmhp+gqoNM/89EpwrKyOXju1Je6li41y6FXwPrJH
 dMJPV+RtTQIrMVx5XXr6iEbXB/ffBTzSh66nJcqwLpN0A/uXf2sg77dt2oyTc+D1BQQh
 jMIqejCOwnTteD3HvNIxv5WFJwq0OotlC0m99621XL3g5wInYZe8k9DeWd3ha9CepGAn
 Sz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OqMpSNI9o/wkUts3PmMeUCyav5wo+up/ZcTRwyLImaU=;
 b=vni12zlSeNISG0/oF0RzCYUGj0dt2flFXoYKnXAMYtFZQER6ND1JB0COBhDpQcdpue
 oO5jQSgX3CNW6whWRnDpCBFo1/Lz1QJ7b1EJ1CVT9Op9HA5cC0us3gh6UQAHGgIZCrRZ
 IHU3oSYTCzQ8wn/zg3BcPNOhZOAJyMjDb8CFybF7FbYZmiu7JuJtFOB9PK0pwZ/PmZqd
 CH8nhg8TfVEAR3tI/i/Bg4WOLcUTIf4jfq3WThQwzK44bWMJSvgRuFV6SqlC+oqYva3X
 QkQYAdzpWzMdsy0RIqKNXGH3QngivXdwRxtA0EpzskDvWfqh1MnhajllV1otZLusbcTq
 TiFg==
X-Gm-Message-State: AOAM532he5K8OgJ6YkKp7mZbekxQM0Y5MsrmkxSTEdc07JXiZkKiWp4k
 KIeCTlfrqiEPRnoB4z9CFkg/DQ==
X-Google-Smtp-Source: ABdhPJwuYjavF52j9NgVoipdfAqM8ttzlG86FOpEh3FLfEagU2BCeR800imtawrLV3moDeYClwsDHQ==
X-Received: by 2002:aa7:92d1:0:b0:4bb:9d7:6951 with SMTP id
 k17-20020aa792d1000000b004bb09d76951mr18916569pfa.40.1642383343595; 
 Sun, 16 Jan 2022 17:35:43 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id l1sm10008335pgn.35.2022.01.16.17.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 17:35:43 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 3/3] dmaengine: sf-pdma: Get number of channel by device
 tree
Date: Mon, 17 Jan 2022 09:35:28 +0800
Message-Id: <0d0b0a3ad703f5ef50611e2dd80439675bda666a.1642383007.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1642383007.git.zong.li@sifive.com>
References: <cover.1642383007.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_173544_311003_3165312A 
X-CRM114-Status: GOOD (  16.72  )
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
 drivers/dma/sf-pdma/sf-pdma.c | 20 +++++++++++++-------
 drivers/dma/sf-pdma/sf-pdma.h |  8 ++------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index f12606aeff87..1264add9897e 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -482,9 +482,7 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
 static int sf_pdma_probe(struct platform_device *pdev)
 {
 	struct sf_pdma *pdma;
-	struct sf_pdma_chan *chan;
 	struct resource *res;
-	int len, chans;
 	int ret;
 	const enum dma_slave_buswidth widths =
 		DMA_SLAVE_BUSWIDTH_1_BYTE | DMA_SLAVE_BUSWIDTH_2_BYTES |
@@ -492,13 +490,21 @@ static int sf_pdma_probe(struct platform_device *pdev)
 		DMA_SLAVE_BUSWIDTH_16_BYTES | DMA_SLAVE_BUSWIDTH_32_BYTES |
 		DMA_SLAVE_BUSWIDTH_64_BYTES;
 
-	chans = PDMA_NR_CH;
-	len = sizeof(*pdma) + sizeof(*chan) * chans;
-	pdma = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
+	pdma = devm_kzalloc(&pdev->dev, sizeof(*pdma), GFP_KERNEL);
 	if (!pdma)
 		return -ENOMEM;
 
-	pdma->n_chans = chans;
+	ret = of_property_read_u32(pdev->dev.of_node, "dma-channels",
+				   &pdma->n_chans);
+	if (ret) {
+		dev_notice(&pdev->dev, "set number of channels to default value: 4\n");
+		pdma->n_chans = PDMA_MAX_NR_CH;
+	}
+
+	if (pdma->n_chans > PDMA_MAX_NR_CH) {
+		dev_err(&pdev->dev, "the number of channels exceeds the maximum\n");
+		return -EINVAL;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	pdma->membase = devm_ioremap_resource(&pdev->dev, res);
@@ -556,7 +562,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
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
