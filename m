Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7A3C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 05:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sN0tiU2+3n0YIOQw8d0tqr/aLwxp5qLrVaoCjgHQBl8=; b=v4h0aWtq0thWdV
	WzZukKixsVLbaOBcfYbqjeB5jAQO4SxZdnkg15Z7EJNBT3sgXWKSromZwrDyo5VYvxh0el7kVBja1
	Q1kZzXRReKYSPF/ENCULmG3kkKetuIXMnhFlNfEo7kX/0H27wVHJinYSZAc2ULxY4tg+sse93fXig
	dYFScS2AF/Y9n/Zq35epfmUbWOugee7tIP+iVOEelrVvhGW+GVr6dPOw+qOWDFQSMlHm2hyPK+DtX
	iB6mqDBcaNmTmEa6SrvZMAVfd3y8hu53QuZ7GzPHcdbad2otKSBJZ9gXM65LM1R4Qfu4AIp+/a0k8
	p9qig4FyIiSymT3wnbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTgn-000000043Mh-16mp;
	Tue, 01 Jul 2025 05:37:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTgk-000000043LY-0FJZ
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 05:37:51 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-23602481460so53489315ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 22:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348269; x=1751953069; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIPMZwIjwsVXUr19w5dAJ2kyFpb+jn5E1yMbGJ484tE=;
        b=Y16w2dKx/WVKqdTtsTIR1OkpVHBvHbMuLBlBiJdlBC5jXXwySlTpnfUED8a2+qyNMm
         9Kqkdr7CTgw42UI07v4DnQ/eZ2s0kiFeFWpdOV/DkKr85Mpqt1xnik8f2w6ObBm6NKSs
         KgTxpvD2kLaJ53wQmnmHwCteDQDqb1ws24N0rJwPDPKF6/m+GeNtBmFi7v59WCSm0rZJ
         YhEZR9aC+c01ledYDjvDVc9M2hsG0N4DbAGXL/OWO3Rv4Afwa/2nq6OrDN1L5ayMAlr8
         IVcA1onwES8Hutj2PYFhDEyUXgW5slPfBUO2falurhsgFvG6wgWi25fjAc/Hf74STCHs
         0CNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348269; x=1751953069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SIPMZwIjwsVXUr19w5dAJ2kyFpb+jn5E1yMbGJ484tE=;
        b=YOZxlcelDSTMotrfdXwQP35kp+TRo0HthnUtEMencXd5UAz3nAf+l1nCmMIFviw3Pg
         YyrrT4Av+bVGtKIuVVjrL1oqEMrEFwyXr6wZuVHbTXlIGjszfRDapdILrDPUkWIW1RkQ
         WeoLvi0fzmGjp68ONGkEGL0TflekiYu8AMISFnxWO4ZRPbBVlgsNAQ08mf+8SKTiB0kT
         h2xsYTEWBB5e12MB+xMBweZqXDimFhWtnQh7l9oRqrsfbOI4Wtb2C0qPjxa6mkbDBIW0
         SxgXqrf2x/tOwZMKoGqP+wHmp6bX8PVi361cOEJvBnX/giE4dHZW7+/YFdxxP1tVMsn0
         wTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIDDU/P2BlEHrALIEIyZrpkM79jHd+m0rkc+RyrkAIUOUCqGTIWAFtnY5MPXwGm5s1KriqcO4IHarzOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNoH5OIwUafATO+otdgdUuDhGsABWx9P7tkCRrZRuyMKpBtMf8
	EnlwptWbA3E46CFQSjIkO/xrTWPKEkYnCcWpb2ZUJPvVwJ3txexYIm6jPOVBtqvDXIE=
X-Gm-Gg: ASbGncvFfzBGUkjQ7oxZBEh+VdL/Y+9txa9zE4lDrcJh7oTWTKrpo0Rfi+dAnwLu4TG
	8SQHbj2Sog31hpexkKLX+dEMyj1aOetLCKYUR85FH3PFXcA7qjMCRpkrRv7JXW8CP+FTLwvOkcW
	s+zGu2GlMvnpAU6vgevMsEFrbVcs8wK5YtqxHZQA7ErbsRuC2qPfyp4sNKteJ5WfqXhPcwOt7mU
	7tLVR83OEbVhq1loQhVmE+pyqFWKg31eVBQiN+N/EQXupKGYxsYuSudiKh0y5wSLducRFqMnd6c
	5+hOEeKXSL8BBQEV2hf4bKwwyoScIrRfWwLp+FY=
X-Google-Smtp-Source: AGHT+IE16tX1sCq4DSpvKgkQxnN+PHXsI78p3M94DOvhTbzRw8dgntEK2GQnFLXWQ+awumOj/AFs5g==
X-Received: by 2002:a17:903:244c:b0:224:910:23f6 with SMTP id d9443c01a7336-23ac463e8d8mr248581755ad.45.1751348269319;
        Mon, 30 Jun 2025 22:37:49 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:37:49 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:36:56 +0800
Subject: [PATCH v2 2/8] dmaengine: mmp_pdma: Add optional clock support
MIME-Version: 1.0
Message-Id: <20250701-working_dma_0701_v2-v2-2-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_223750_157858_55DD357A 
X-CRM114-Status: GOOD (  12.53  )
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

Add support for retrieving and enabling an optional clock during
mmp_pdma_probe().

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change.
---
 drivers/dma/mmp_pdma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index a95d31103d3063a1d11177a1a37b89ac2fd213e9..4a6dbf55823722d26cc69379d22aaa88fbe19313 100644
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
