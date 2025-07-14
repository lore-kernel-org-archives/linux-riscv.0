Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFABC83F25
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBA8LdNwt6Zt8jFd++VN3JNLKXBTyf7rQdBuR49egz4=; b=hzd/6HNxMsGvQV
	poUGIuT9BvG73smGN0tkN+nuGEShXe/SFtuIsyN/y+KzQrwdGb8bIHThWBkjrwUD5JoCPdcd0mtV+
	y8BFamDejalhF1KgBqoPA+/7y5nDYuEvaswds7Jm9aUjs39SK/Bsn02g3nB5Wr/Rspc4qV/uTRWZp
	mKzosePT6HAhkH5YxXF/BHPqZuf/2C+37LrvMop+ojAV3AeFOpu5PTpEx3n11R+cY5msKtbHiJzD+
	xIlS3yVw1Ij3rwugujmRpzSablV6nYq6V+c6oIbPyXVyBD9GD7ljH4V484/MjyylPOaNOetnWMHmO
	FyWy6NhFdOSGQ3FroHLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFyL-00000001rSl-38OR;
	Mon, 14 Jul 2025 09:59:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFfj-00000001o9P-30qR
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 09:40:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45526dec171so28105405e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486030; x=1753090830; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OERStMpxFd1oXz1mhimWCIXZsdyaGxN/N1YtYf02ffU=;
        b=IYp1562F03WW9OKLcp/bE+dKD7hMY4O2Ck6kUkcqzdNBn5V98Saw30JstIOyh3ubKS
         e9OTmmNvV4n5aDG3Eky3JROuTIelvj8Z/A4f9Xh7AzPMcmY6xOkXhalsF7H5aalN/PBR
         KCXH/7ZL7D/eV+MHkUbwQlleKwKSC3KtX2HzmoJbcqxcJza/95wP7ZjthAupdhZiq+pq
         VpcC/+46+dGMjJcQ4YJjkSjIw1a9zgiigrvVoLFiAQL6cIYQzEpizotI44BPcev34qt8
         to5keBT+QEsyC9SlXAQt+F5wd6tmYJcFiieXfybz0BajvyaOcNaP3J7vezaBfIVywQ3U
         c88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486030; x=1753090830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OERStMpxFd1oXz1mhimWCIXZsdyaGxN/N1YtYf02ffU=;
        b=FVRD5lTvGFfEj2Un/G32bcH9of0U8Dbze7vpNpM2kz6aOeoTAOdk9mwt7CAcphP3NQ
         jqImZ4hpp21sEmr9pWpzpQ7iPAD9D8UwCWq2WdvCmxm091Fp5R816ufSiH+UHEqWr3yQ
         KODNff4DcIlYkOraoStBywuOBp/rU9oHhwoB6Or+Ch/avQK7cXyZlYEA9JuMlJNddHH+
         ZBY9tMgSvfMB6E9KuZ7AFn3oKdA1M0LmZeyWQIuDAFq+xBvRBQ4dER0YapMXtFitGP1+
         pNRvw/x+0hszSzIWY2v6fxJg0/hyoCb0+4kpH6xczAsWaZLIrB5dgEJfnSICzkGrvxzL
         hjHg==
X-Forwarded-Encrypted: i=1; AJvYcCW3BcYEU1GipdvXbKXzvx4D0ix4DvxHt3uT7DolwMEDJC2ZibPYjU9vwV6zupq+z6Z2xh0aYyu6UgoV6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3QmM4NutNSCCjcPUzKWnQvGsi/XH49/iqPJc/5JBdSWG5jOGn
	hSCVs1V5Lgbu6b9QfWZgLBCdklW0MAoA9JjInqSBUD0r9A+kwtxVuKgJXwFEmj8XBng=
X-Gm-Gg: ASbGncvNmj+ILoOui5TLbitAQs0891P9JLHURLthyFrmkRELLw1vCV3mxsTbrU7ybs5
	4+OBOx/fh3Z/2l+NA/ljC2I9b/4KaWFWDbrVwNFJBprfYp5YFbnVsgQBfvKT8LhcIz8lJod+RLB
	r7SLkDWW5gjZzuVhG9HJsaSJsl80hgN711P4FitW/KruEEoKlK0X6mGemf+skyNc2wG7M8JstEf
	gukdfCO0spW8KH4ugldqJr6jLncQ9EBMly0iguzWlKa+pObLy4qkjSIJLMTuV08oiVYmCkYcTtm
	Z9ozSFwqcywilY6NYzNUyovVNSTs8R7wSpHvahS08/7+X5ytGzl/NoxM5sByGKKjxMoU7KNL2A=
	=
X-Google-Smtp-Source: AGHT+IFjyUYE1dOQ8JxazLI7iDjsE8P/QTDlCi2i9qu5IYfCUbgHi3kKfOduLMWkN27Rdg061Q9fig==
X-Received: by 2002:a05:600c:a08e:b0:453:745:8534 with SMTP id 5b1f17b1804b1-454ec128c22mr110575145e9.12.1752486030219;
        Mon, 14 Jul 2025 02:40:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:29 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 14 Jul 2025 17:39:30 +0800
Subject: [PATCH v3 3/8] dmaengine: mmp_pdma: Add optional reset controller
 support
MIME-Version: 1.0
Message-Id: <20250714-working_dma_0701_v2-v3-3-8b0f5cd71595@riscstar.com>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
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
X-CRM114-CacheID: sfid-20250714_024031_764005_B84BCA58 
X-CRM114-Status: GOOD (  11.63  )
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

Add support to acquire and deassert an optional hardware reset controller
during mmp_pdma_probe().

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change.
v2: No change.
---
 drivers/dma/mmp_pdma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 4a6dbf55823722d26cc69379d22aaa88fbe19313..fe627efeaff07436647f86ab5ec5333144a3c92d 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -16,6 +16,7 @@
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
 #include <linux/clk.h>
+#include <linux/reset.h>
 #include <linux/of_dma.h>
 #include <linux/of.h>
 
@@ -1021,6 +1022,7 @@ static int mmp_pdma_probe(struct platform_device *op)
 	struct mmp_pdma_device *pdev;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
 	struct clk *clk;
+	struct reset_control *rst;
 	int i, ret, irq = 0;
 	int dma_channels = 0, irq_num = 0;
 	const enum dma_slave_buswidth widths =
@@ -1043,6 +1045,11 @@ static int mmp_pdma_probe(struct platform_device *op)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(pdev->dev,
+								   NULL);
+	if (IS_ERR(rst))
+		return PTR_ERR(rst);
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
