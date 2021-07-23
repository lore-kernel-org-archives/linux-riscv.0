Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C61FC4320A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:41:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CBC560EB6
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 21:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CBC560EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knqn0MnIbldcQ4kIFkci40aqkyICMP5luy42YKu3AoM=; b=s0cgzqORqaHQuy
	anqiq6fjKu3Cf5e8643H0RkOw2OZi6C6Fs+mek+Qsuk4KGJWKkYsJ7SEpW0SJ+GiCiMn2qZqPiwX5
	cizWIawQiBo6LCU3gTEIg1HizL1nePnvnyh6oKLKsupvv/yi8H0juYVNWGM11Jw+6RQ1ThnA1cfYN
	cpxMY8UIV7Kvgsk59M7F3YwHcfoMsV6F8IkzdkAA/Nh1ibWKvr8mTCGyulhM85uiRUnZWeL3ZD1op
	5llcYCqyxhOwSBVsuJMWOlVhWwHBJdHwjmreEfy4Nweko4DhMRjkh3B2kz3Ng2LZe3/EXHjr7g27Z
	o8TGlmUtXMESZGZqpoPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m72uW-005zPi-Uz; Fri, 23 Jul 2021 21:40:48 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m72uM-005zIy-Px
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 21:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627076438; x=1658612438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TtAadJ6hGLCmc033TEnWfjUBgRsF/DZxBUrEEIez1Fo=;
 b=Zb2Hpeezq3ByKu9BcihxIKZFm+OsdsvTvT6nDUEt8DdVE+eIOcSn+yNf
 imHlJxDD50gJhBoZlWS5X1GhaaFxsyMS2WeqhexTUsUmY01x8+ja7HwHF
 Qk4VObpUrJZhZavlFjBTpRADoRBJFPnf9LdSjuBeACBtt6XMbTJsK0iZy
 ZCFCpsVk0HRzs9rgGWgfrmxJN4MQRSoip2Dcd2GrCByL6qG7hG9/wd79s
 HqBmpbnUsmcVLpVRFZhSRzOmYdZBLsja77ehnA1GU7VZIS8BRwnkPMrDE
 DICIsMNZpbc6TiceMVgaFCHBCNveH2vQW67n5KlPl3/njqyjnQagQckxR Q==;
X-IronPort-AV: E=Sophos;i="5.84,265,1620662400"; d="scan'208";a="279198456"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 05:40:36 +0800
IronPort-SDR: NGqARVcFpgsp99vaJlDjeCwaj/1YpVEuCO/5yrG4xP7MXwDm68v+Esek/jxV+8bPT0rdNZnjv3
 sVE0bGBeD++BpocfuwOhUSKXepHLXYj0FLaDhCxyDOR6yayY51FoJ1KnrLxYWmvXMD7zoXeKIo
 nmwUTxktFWyamAQCBswisZpLlbgDC7D5/YQtzkW5PqPwUVnYh3BQbG8FMVwE2lxbiS2tRxjq36
 UKwIHn5XqdeeIh3t5uTCv0PSEaArU6CR4lztb9Lc3E9mNoI8NpOiqquzZLEuoMH4fKX7Sq5pYW
 Bxw9bZp4qUOUNYJ/bZbMmO03
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 14:18:25 -0700
IronPort-SDR: iht1k14TXaRgYuHcExQMxXDvBJ3lM+d2qFu0HNLMP/m1Lxt3+sb+N39um9cWnSgGv+xK+oULw8
 GD+comDzjiA03Yi/yzbvF1tLI9LK7/uFKDc61+UxJ+unNE4NlgItR+mWHeop/k1FW+LDY1iGkv
 bIRs/GghVxg/KlDKAwSOAE56h8UurPmyEwvBnYOlWDOK8rQ6pIUqNcTdfmUWYQvtbTUB8AstNj
 ybmzgG1fG/v3JWXcN82OQ0gkWAp2DRz2Ef6vAOkDxAxJMNcx1b1yxxQEbRI/2TozKavkbY18h1
 UWw=
WDCIronportException: Internal
Received: from ucfbox21.ad.shared (HELO hulk.wdc.com) ([10.225.167.4])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Jul 2021 14:40:36 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christoph Hellwig <hch@lst.de>, devicetree@vger.kernel.org,
 Dmitry Vyukov <dvyukov@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Guo Ren <guoren@linux.alibaba.com>, iommu@lists.linux-foundation.org,
 linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Tobias Klauser <tklauser@distanz.ch>
Subject: [RFC 2/5] of: Move of_dma_get_range to of_address.h
Date: Fri, 23 Jul 2021 14:40:28 -0700
Message-Id: <20210723214031.3251801-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723214031.3251801-1-atish.patra@wdc.com>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_144038_990753_55FDB863 
X-CRM114-Status: GOOD (  11.21  )
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

Currently, of_dma_get_range is kept in of_private.h as it is used by only
OF support code.

Move it to of_address.h so that it can be used by the code outside OF
support code.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/of/of_private.h    | 10 ----------
 include/linux/of_address.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 631489f7f8c0..f65f801e3aae 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -160,16 +160,6 @@ extern int of_bus_n_addr_cells(struct device_node *np);
 extern int of_bus_n_size_cells(struct device_node *np);
 
 struct bus_dma_region;
-#if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
-int of_dma_get_range(struct device_node *np,
-		const struct bus_dma_region **map);
-#else
-static inline int of_dma_get_range(struct device_node *np,
-		const struct bus_dma_region **map)
-{
-	return -ENODEV;
-}
-#endif
 
 void fdt_init_reserved_mem(void);
 void fdt_reserved_mem_save_node(unsigned long node, const char *uname,
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 45598dbec269..0e20f85850fc 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -154,4 +154,16 @@ static inline const __be32 *of_get_pci_address(struct device_node *dev, int bar_
 	return __of_get_address(dev, -1, bar_no, size, flags);
 }
 
+struct bus_dma_region;
+#if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
+int of_dma_get_range(struct device_node *np,
+		const struct bus_dma_region **map);
+#else
+static inline int of_dma_get_range(struct device_node *np,
+		const struct bus_dma_region **map)
+{
+	return -ENODEV;
+}
+#endif
+
 #endif /* __OF_ADDRESS_H */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
