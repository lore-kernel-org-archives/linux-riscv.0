Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A06C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 09:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+AAjm4B68TmXwXqWowREjhZZT5v2eHqvCAgX0ag4lw=; b=g0ScHK4X8D4rFD
	1ZUmXeSbpLZvcsas8JABOluHhx5qlpa/WMoLg7z/jwcIj4OavELRFdTe+50D5Xru/FgrnNc6F7urg
	kXiKic4UuhHZFBVbYY9tHor/5+O6qO/uaJSSj7h8QDHnMuFGjDjW6Jobm+qBZn7xYKcxFQny84OA4
	+OvB2gbsWHWOXhXfk0IEQUGtw+rk7Tg/8EhartrNlc92k4RHWxKylgHem6YxgIWIylwZHyXS0Pk8h
	8LLV5rYhepJrfZDuAx68ViJg3XKCK5UNqQiSTUn4W1ZzmJoTc7uDoH9YfQQJ2JlL2/rheOcaLTi7J
	CWLrjAnPR92IN7iGDDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Iie-008RZW-Ik; Fri, 14 Jan 2022 09:18:00 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Iic-008RY9-Le
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 09:18:00 +0000
Received: by mail-pj1-x1030.google.com with SMTP id o1so811630pjr.2
 for <linux-riscv@lists.infradead.org>; Fri, 14 Jan 2022 01:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UnDHOgPgHxrpEfq7DGKwHo/JXpf5Q25m6hL15BhwKxo=;
 b=niPVQetGLY/pUlNg30eKEQ/IYzZi4OmcTVvIzI0ERhmfvbGC8tWx782CbK2myBiWXh
 dmzulVUdZMrKW47do7EuMg6wUDNXv71UCjEbNTFKIO7SdOeIfCSjmqWv4+plJOE/2Nki
 1tOU3eImAfPdcEO1IzToFlneunoUKpMmvlBmlJ7dgLSJH7kcJhSac2WMRzTksKJuDVX2
 xUP74Td3sketHGJhWiqo4o6+yymg+fw4M+AqLdaPMbqrD33oyirXdSaROio6fM7YpQJm
 Q27snM7DzwdyrU632YbM8zvumymhdPZ1W/tiNff6HxXyn/bKh0VlSM1XUyb7673CULw7
 FSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UnDHOgPgHxrpEfq7DGKwHo/JXpf5Q25m6hL15BhwKxo=;
 b=g6MuDG+6hrKglNLkZNKbgADIHS7UJq2e/XhVz2cAIyHsJJ/oAZ6pmxvXkXWmLc0Ov5
 RQPtr06EGz1i5/KU39HZ158BhEMaRQeUHZb2SpyUmqYI8TIhFpg1lnS8sJKxPfFZsQWO
 FVPgrGqCMlDNEy5z9OXtBv7Y6GwbFYbDM7rBpfCfbGsd7C7TdsYvbJS/NmEQ9DRGxWll
 8eHdFzhdoVwM78BIchonoStOh4g7KgiaQR6PpMk5tpbDYg+xl8sYB5UvXkLqR8P+a4Dt
 1MEZkQs0Mts0Gp/XJw9tBWOpjDkLhECdvOf7vlxoDOyKUZ+t3DTfN//O1W48KP+VPiVu
 +pNA==
X-Gm-Message-State: AOAM533H7dfDbcwnJ62uSr+0eIygpU6dtxJZvteGue/Dm+N59D4uUJI7
 zdO5NsilIqfcf3jnLXCyYq2qxw==
X-Google-Smtp-Source: ABdhPJyzg2ZT4GxwLjdse984P77qAjIRC7yU7HACLQpYCuRh79FQtcfOgBxIrntqjqdoRZkaHFHl3Q==
X-Received: by 2002:a17:90a:3846:: with SMTP id
 l6mr19256262pjf.7.1642151877575; 
 Fri, 14 Jan 2022 01:17:57 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id z3sm4237179pgc.45.2022.01.14.01.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 01:17:57 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v3 3/3] dmaengine: sf-pdma: Get number of channel by device
 tree
Date: Fri, 14 Jan 2022 17:17:41 +0800
Message-Id: <91a8fb6dff811b36db951ee98d955ad14a2a30eb.1642151791.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1642151791.git.zong.li@sifive.com>
References: <cover.1642151791.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_011758_736301_F8BDAD6D 
X-CRM114-Status: GOOD (  16.92  )
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
 drivers/dma/sf-pdma/Makefile  |  2 ++
 drivers/dma/sf-pdma/sf-pdma.c | 20 +++++++++++++-------
 drivers/dma/sf-pdma/sf-pdma.h |  8 ++------
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/sf-pdma/Makefile b/drivers/dma/sf-pdma/Makefile
index 764552ab8d0a..cf1daff7e445 100644
--- a/drivers/dma/sf-pdma/Makefile
+++ b/drivers/dma/sf-pdma/Makefile
@@ -1 +1,3 @@
 obj-$(CONFIG_SF_PDMA)   += sf-pdma.o
+
+CFLAGS_sf-pdma.o += -O0
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
