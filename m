Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB731C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 06:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OshTegOyV9wxbjPay8UCPTBoyQQls3UDNrgu6hW6ktc=; b=s7eQ6LD/tH6rOt
	4MKsgb7tiBc7SADSjaWGNTsYV0fFSageX932YMx08OwwnwYK8aa68plvF4iY5/Zrfjjbzmzmuf9ih
	P4DwzXhv8Y2DcUg1zq2j1ABzt9ed8Z7JfVLdp/0ZV5uNYEllibGAg1sT3wkWqISKmU0Y3g8CeFHP8
	yUi4qewqg8lthf1WXN3gofu31OQJ9eySoq1u5rC/Gz2u9S4ZnVbQcfYNulOttTvAchCCK++wTHoqz
	SYOTkLYhE1C6bOeBHg6t6uG/tIVm+2C+ilZdko0i5VuEjaYTXGQG5ChgdAQ/nCqLrpjaG8qEeuYqe
	KQqEpyX9kxEFLsHBAOXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGxYK-0098Yw-CI; Mon, 07 Feb 2022 06:31:08 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGxYA-0098V7-24
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 06:30:59 +0000
Received: by mail-pf1-x433.google.com with SMTP id v74so11322092pfc.1
 for <linux-riscv@lists.infradead.org>; Sun, 06 Feb 2022 22:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsFZzRzWxi9SLwITfrc8E6h9ajUabmlo1GhXmJ+C3hc=;
 b=WAlvS5EXiVRFIZe8CQYOYmWuBeX252Ah939fQC4xFyJiOgiQOqKLCEZ9w/rsR6+gi6
 9ofS/fBv7QwPpn/VyFviNxUjm4OSgt5WaUQ38ohiXY8yU3zjlUJ1Yvbtqkq/Q0hEdem+
 vOL4LBrdoiDalFZWuSYY69OLG3uLZfb1ktFR1Bo8AZaDqbbY/rsgggVvLIGRaCKEw8tO
 M6ffn1560ArOL3Xpl5xg0EVvQnm6FsEePBN54U5qe7xAaGTB4ob9FbVdBbdf9fWl+Xe5
 0rS+pkIIUcoKVFmz3iMt4cxeBgkdGefflHbs0Y4BJCec9H7Tu+D3zt+hkDIKrAumXmsr
 epUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NsFZzRzWxi9SLwITfrc8E6h9ajUabmlo1GhXmJ+C3hc=;
 b=JjBLph7djahKWKT3H/fPkBZQzhLH1P8NL+QHKpIkoFlRKJJ6KkiO9rac2dWiyVaRGe
 xUHRvKnQKmnft+bdsAYY5hlSMY+JNUXi7jDTbUWOJQv0+2RpR8lvC1ZjElsek5aGxSut
 ypfwn4rv0CmKj17kHPWQ1KC6nOjU8SshQHD9Y/oW/2r/d8u36w63cao2CcZurS9kxgtN
 S/M8ne0mtXiyBqAvBxr2EFVPklG9kKNiSoF+LYVI2Lr8yL8ZG8qJeLOZfWi2LCLsxXgg
 hsxPEEq+kY4cVUuCP8dmNWlqhzcg4DjqelEx54xgswD9q+YBj93KwBu2GzvyCeZ/bk3i
 qzCA==
X-Gm-Message-State: AOAM533BIR8egnt2a4QxUjZmg9FqZ6p87Qun2G9U3wpnRXFBF6yDg+5r
 EsXlxIKOxDk82OWVee5mFBlNHQ==
X-Google-Smtp-Source: ABdhPJztzK0ckN9GMQ0TxEmrpCSlWLQmxoXoG9PxqUVTiaqQJQd7I9kf9tGQI9fcbpFkt9zsEeErKA==
X-Received: by 2002:aa7:84d5:: with SMTP id x21mr14270143pfn.72.1644215456964; 
 Sun, 06 Feb 2022 22:30:56 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id i10sm5266634pjd.2.2022.02.06.22.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 22:30:56 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v5 3/3] dmaengine: sf-pdma: Get number of channel by device
 tree
Date: Mon,  7 Feb 2022 14:30:40 +0800
Message-Id: <df6c8d1c701b33fa735dd072de3cb585dc60f2c9.1644215230.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1644215230.git.zong.li@sifive.com>
References: <cover.1644215230.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_223058_127829_A2E682C9 
X-CRM114-Status: GOOD (  17.48  )
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
---
 drivers/dma/sf-pdma/sf-pdma.c | 21 ++++++++++++++-------
 drivers/dma/sf-pdma/sf-pdma.h |  8 ++------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index f12606aeff87..2ae10b61dfa1 100644
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
@@ -574,6 +580,7 @@ static int sf_pdma_remove(struct platform_device *pdev)
 
 static const struct of_device_id sf_pdma_dt_ids[] = {
 	{ .compatible = "sifive,fu540-c000-pdma" },
+	{ .compatible = "sifive,pdma0" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sf_pdma_dt_ids);
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
