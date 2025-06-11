Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF750C71137
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6Tq4XwRSEsyDPQkwbe+zSKHDETY6iq95Ty6tVLKmqM=; b=VIUVHTKLYlWuck
	udb7V0mC54pPNMzCwT8s3RmQ/EBd2ibXI97sK5toZeu9HPt0O6zIUpzfS2a2ov3M/xH1xiINepvma
	aV3uCIW/KBDe8qoNJAvuezqqoCr2SGP3QF1Jc16NdrqMh3ptmk6ImfDWgg9Jmjhp4VPBCx4fWa9Rs
	LE8qX/gJaLjCHsq7TlHSGHDSApSwE+4OIs8YJzuRvrM+VQx6N23FTUfi3VX6V6camiPDxI6cdrjya
	FaYI3shPZ9FF9EdEB/IGNeviKBZpRCLe6UH4w7SEQwAd+uCuj/3siDuUeHrE8u52gCgk6+8O6QQ3B
	0gCM+0ag/GHjHG6mooBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5o-0000000AZFu-1jhc;
	Wed, 11 Jun 2025 16:14:24 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPL3J-00000009trz-1Vh1
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 12:59:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-234d366e5f2so75542625ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 05:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646776; x=1750251576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbUdwqpOjgljwseuYvc1wSTutki3xIN9U2HpImhqa58=;
        b=zhaxYwzBjEV+4yvIzfyNlrKBjNFGdTG3hjiIQOXIDYPEnpPU+gJGr5hIWsqGr87rK2
         vL/dIr9u1vy23HGihgEcMWu8xJDBpPr2hLjg2UqY806hXj+5Dl5avpExzvjBJKR+Z72c
         jiUpwjnWUAZT+nPcusSpAbMqi/FmmGv8breaw+PUgL4u4A+u72ORaZJDDSSKQHh1VS9s
         aE24vqFL8wrps4RbkCo9aDxhyp/S6/mCgTQxYbf5HEGpQ4Ks7h5eNw8llLbV2L6yOeJA
         +hUGasCtqFt3U1Gm+fBwEwNOpfPVWKGgJyRts1BYMmWGoGt22hUR37y8qqxXuiEgnBgi
         VWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646776; x=1750251576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbUdwqpOjgljwseuYvc1wSTutki3xIN9U2HpImhqa58=;
        b=vAhfRDmi8M3EK/yJ1tJsw55dAnpMqbEbdV8wt/AOhqdkv5id8XkuLzDJpuBMmDYOJ1
         At2R5GxVVktUqw+XMjtZInuTGkFDATinvIeAvfdWh9wKMonqZNiN1JdsT1MTRH4H2c3p
         nGU1Fy75GoV601ACo86QKJLDO+pWR/AxLWfwUMtIzH2uD+Lt7W+rlwOAj0Tc+8gl0gcb
         d0YrUB4VhQ4M/gne1A7W3loPz5gf59M42lWsQanTqWC29dvvGNJoUSgrvuzSNPzEHTr4
         OhJjp7ObeuUHs/lUNvIwvVVCydvzt2XgtOtYbBBZyFDJG+Gqx3EtBB0tZHvdLlowcwEI
         ukKg==
X-Forwarded-Encrypted: i=1; AJvYcCWeuvi8UMWihJdEVwoTnJxWSy2KhLqNjIZvs1cB+25gcipMDYUee5GcSlUu4d+cqbBbh5mrrzQnXbSupg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz9qngr8WdEP9dsNKllg14OOBx5JsLvI16AZsq7xjbHdZgwoE3
	X+FBn+n96U88ds6q6QpuCKO8s1J2AHeNaywBbfEKfky7EwnZwD6FfGPDq9LqZCFaanA=
X-Gm-Gg: ASbGncuNOp5imbAmKCfMrx5nHWGpYNX2YCs+ZyhZEBSpwOynPkwGEzs1OR/G5Ps4jFi
	gWQv6rRROrYJbKH3xI+BFQ8gDzfaHl6Djal2woAdo4M2QWdkOgZhCNyZG4vH4cqOrtPdkJ/kSte
	1LrLj7eNHQ8GKYotJHzFv+/1oQTp8TgIKg+YWH+Xw57Q0S6Pu+xLqdzy7tgCkF/U84gtM9xOJzm
	VUliPS5LMdC2J0VA8s/ja4MFMw7Syn+BZcYtVr8lrcqirm2YMMAuFpl3LHKD1xTG8Q+MwUKHowv
	+glQRHsaUCEqwTdL/s9Gb4vsXlC3lTKg7VrEjlDKY9tJO14BliEre9dABA2cw3Z0EWmNeofv3/N
	fhboeD9S5jQBIaG0iUaBiRA==
X-Google-Smtp-Source: AGHT+IFwmOGY2tPNuPQv/TIROenh+j1fH/hIa0++yIAIoLEcfqCONIj2DYpz4kpbLhhFofJZJXqRvQ==
X-Received: by 2002:a17:902:cf0f:b0:234:986c:66d5 with SMTP id d9443c01a7336-23641a8ba0bmr41504395ad.5.1749646776539;
        Wed, 11 Jun 2025 05:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:59:36 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 2/8] dma: mmp_pdma: Add optional clock support
Date: Wed, 11 Jun 2025 20:57:17 +0800
Message-ID: <20250611125723.181711-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055937_395876_64C4913A 
X-CRM114-Status: GOOD (  11.57  )
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

Add support for retrieving and enabling an optional clock using
devm_clk_get_optional_enabled() during mmp_pdma_probe().

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/dma/mmp_pdma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index a95d31103d30..4a6dbf558237 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
+#include <linux/clk.h>
 #include <linux/of_dma.h>
 #include <linux/of.h>
 
@@ -1019,6 +1020,7 @@ static int mmp_pdma_probe(struct platform_device *op)
 {
 	struct mmp_pdma_device *pdev;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
+	struct clk *clk;
 	int i, ret, irq = 0;
 	int dma_channels = 0, irq_num = 0;
 	const enum dma_slave_buswidth widths =
@@ -1037,6 +1039,10 @@ static int mmp_pdma_probe(struct platform_device *op)
 	if (IS_ERR(pdev->base))
 		return PTR_ERR(pdev->base);
 
+	clk = devm_clk_get_optional_enabled(pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
 	if (pdev->dev->of_node) {
 		/* Parse new and deprecated dma-channels properties */
 		if (of_property_read_u32(pdev->dev->of_node, "dma-channels",
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
