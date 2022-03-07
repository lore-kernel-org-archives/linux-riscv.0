Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C99C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 05:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9N+fHU2Ze9hw5dXr/JX3ppnT6Itpp+BhG3wnyUjvwks=; b=LaXIs+p/NgNid/
	+HykNLwFqEe0nZQ2JO2uWXpDadbt88rzfDjsrnTdqXKzAQveMbGJW65b6WVfCEbq5eCcQdrGj72e/
	WA97McetPC2FEri9JrxzZjpluhRCB36Gjfu8sRN9RX5AcEVzpHsYvCpyGSHFOVuZsXMHZ1uJXNc0d
	GBsGl3yj/gtkZ9AH4SetcsulzHYLRStQm5EjqVKF/205bppBy9cgB9fBa8F/BfqwpxmiDh2niTg++
	KQlzOgyCDjSZiuPnWPMNs8nlMDfd122AisrNXIsCWBJOFk37MP6lmUwkxJblHmuzwRFCiuA6ACHh+
	1ARzA0bXEwjFdEXZspBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR6Ao-00FwrN-6l; Mon, 07 Mar 2022 05:44:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR6Ak-00FwpR-Pb
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 05:44:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id m2so6839784pll.0
 for <linux-riscv@lists.infradead.org>; Sun, 06 Mar 2022 21:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjzY9j/Keh5kcP1plUzMyATlCp3344jlI/9GvjcvYoo=;
 b=H3ukiKpOjrWALA8cOGscza/eG7Y9H2VLma85d2rXV3BXdDxL23AADulFiqldBByUvF
 WT8geB6FfT0goNe7T7/ASGaN1cwQlt950sSp9K3T3FyagkBawU++fkoDTJ2WEYkQ58MI
 u2zlWVYRjMM4RFgRkJTVEc8HLTG835uxlwm3VLCxckYcnJl5S7+o4cVvSr0Be4cAbixI
 IojXvz0/AEovaZpUoitVfkC0P1dp3LchCuHwZWp3okcn/ivmURm5SGsScCSuQ2aQHZbg
 nZHdTH3xFtJOZxWtnStzka2lW4RKhHGLFSyKabTYgkBm1y9JJy1AuXOQ9JhkDlDhwZVO
 Dkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjzY9j/Keh5kcP1plUzMyATlCp3344jlI/9GvjcvYoo=;
 b=0tmpksNvVixFVX1pWYftt7nRfHq7TdfLd8cpiLf4CdvxspgCGRK+ZyfJPKjgZ00/02
 sWo9oscTACbaA0Q4vV87Mk96Izls9QYV3YXK6fpPvbmDA/XQZLN3EEi8WPQHMVoKTCe9
 2Vev98LtTRhPvwHKY9f+cmuPtIis9D2UUiE6LnPqx/F02k4nFVxO/sSuI+XV2W5Plj3+
 Uz2K4Rt2+mipmIfpomcr73+kD8lK1xIibCpRNB+OLAEo4wXCkNu2W6p5y3Y42BkWcCW0
 vWajS9bIURl3OmVL9afcbQLZFEiZQQL/l/mGqFP6s/uNHZErnBb+yaq2z4GOQd/98RJE
 b5Ww==
X-Gm-Message-State: AOAM530eUrSUw3lR1jLpZ4kRH7CVYp7gN70vLKGZEvf2bAd1EIMCBQkP
 n+fURm5ivyg27eNl+fbbk7JybA==
X-Google-Smtp-Source: ABdhPJwmsg2NvIPGJKgc2QYAjoAgRREp5vq1gE8kB+AJyhWvnd21cTaR/lWtZMx27QIwQX1NVuEHUQ==
X-Received: by 2002:a17:90a:950b:b0:1bf:4f9b:710e with SMTP id
 t11-20020a17090a950b00b001bf4f9b710emr6343302pjo.241.1646631882007; 
 Sun, 06 Mar 2022 21:44:42 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a056a00168100b004e0e45a39c6sm14447385pfc.181.2022.03.06.21.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 21:44:41 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v7 3/3] dmaengine: sf-pdma: Get number of channel by device
 tree
Date: Mon,  7 Mar 2022 13:44:26 +0800
Message-Id: <73fcb88608aa18c02e92f1641441c073a7912ea3.1646631717.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1646631717.git.zong.li@sifive.com>
References: <cover.1646631717.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_214442_856364_5CC12D8B 
X-CRM114-Status: GOOD (  18.82  )
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
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
