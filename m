Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706F8C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 05:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNV2gSQZabhZpcBuucMjizoLlK3hocjVGBnGHVIRpiE=; b=qNDljEDdcFqFca
	bJxRKU9AzFD0wvaVMk0sQyxJurC2ap1RDxLanZcc6DoVKscDkeviX8xrt6dsTkdPXtD0I4Fx3qOZs
	/FcI1izy1Y64kSbWQ26xyk8ckUZSZfyW1qHudi9xtLfsdpieVoqsTicAwI7iNzhPwWNPmbFzr8Jp4
	biRkm+HPbUpo7v4R56ybyej4CtCcj+Geoo1tC7LCvrGwGHHT7XxTKXXjxjXiGfesA0rMVL+PNxwbX
	CP0BqSUIPQtoFmnNjbvCnoLm/NUw6/2+RamUR7iqiAG6tiJ5S3/OqSte0qocGK7gm0BU1q/f2KfPV
	hvRVPfbPGN7Z6Ro4Fdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTgs-000000043OQ-1723;
	Tue, 01 Jul 2025 05:37:58 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTgp-000000043NL-3v7p
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 05:37:57 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b34a6d0c9a3so3070613a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 22:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348275; x=1751953075; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgkMXCCp3lXpUTtLPZUq7+FcCnIZ36CClHz2F6hgg/c=;
        b=ibS2XoxlaPhwqZFnq4fuxx8P5WTeVRa8CsuUxfgyx62eGcCt1pWy9VNB1RzUowzI50
         Tb336q09hRQa1UM0x9uLxDOlQ+47UZoK7974sR1mTXtN+Z20PapjygY08GYvxLQGuRPN
         8WUMtApj5nFKoFcg9nqTXElIpZ9WRN96hoKeGRQ6aL0qw4upH24Q1ENIyaSm/CqYo/4j
         iAzBtBON5AIJbcfzP87F3SVxKPwRvseDKqQZXioF15kEaHnTvyqfbGBuIn+CirQ4Pxdd
         ei33prT2iOV4MK3w6tt2SvDmjqJ7Ht8I+rsfoGKyKbTq8bOBq8WpT8YT4h3dFimjPubz
         wrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348275; x=1751953075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgkMXCCp3lXpUTtLPZUq7+FcCnIZ36CClHz2F6hgg/c=;
        b=V5ZeBepbvKSHvzDlBVVfIdoVgfwclU6x2Y5U0sDYm/cXQ8mEs6zw/W9LhmxDauPTgD
         0FtNGUNREaLj1EP+nQadOFywhySyuOifOKraMJbD2VRmv7uj9jKDTGj9+jaRwpjmzVo8
         lL9sXbvd0GTxE0tD9E+7k5CsVoeEkmChiyRP8Q6VGShimJRuEzDrHb+kAD7Q5GkY6zgW
         puFH4IEZxA6vgKK1TYW1eneKnW8Yc+68kHVvKo1i0ZD9XX4x1MWFbJ/+ZQtyoQY2xOHk
         aOqAQ9JxVmSzE01kYCYmuN24s4cWiS8IGrNSdW4QdWaeFoqY8IKjI0XJhWehX2J10n0H
         0N6g==
X-Forwarded-Encrypted: i=1; AJvYcCV/gaF27a1iznwa8xxza7Mhpybxki0PWMhNqZ+EbGrnzOw3YGN7j8UH2x5ftaCua7CtFhzOvnOmGfMMdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHbYk6uOZasI8GqavGi8xyjfJ2p9yoh3QCmk/xWRWb/j44mKux
	iP+4QxoSj2KhVue6z3KQxjZJdZzg1hJ232q72OJAE3xKGmCLhv1X9Daa+G4LGDSHTH4=
X-Gm-Gg: ASbGncvolsqTRyrNEm/wLyUa9o5jg+xDecNwtm00hOv2b3E0pWXE8NR/GWqeukkonFT
	OSsGeLha2dCwKF4OteIyxHx4tXteU1ePqmT2yGKlJT+gCiZ/n7fCF2WTrx7L4ezfVdLy8X+WTjC
	Rp3oIqa7FKsYTfEyn+FfyFc0qcwRCM4BlGqijiB5WPXrB8XR/NscasjJY7GDhP+DWR3UdENTxqI
	GcD/Ogshzqinjfsz/isshq6sKSIgHLDk/yNqQoq7GE7guXAu8W5E46Bj3bj+kecKKwCDC9uejxB
	fJJADSzVA07zsgtzXFdWnDESCPaQFhLpMnaclmU=
X-Google-Smtp-Source: AGHT+IHiipoIqFDXP36F8aMSuW4HpbiTpTi3qEOpw0AtYIq3Z5klUPs1xtkEis7GRnmZy5rq7VtuOQ==
X-Received: by 2002:a17:90b:50cf:b0:314:7e4a:db08 with SMTP id 98e67ed59e1d1-318c9243f36mr27007305a91.18.1751348275126;
        Mon, 30 Jun 2025 22:37:55 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:37:54 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:36:57 +0800
Subject: [PATCH v2 3/8] dmaengine: mmp_pdma: Add optional reset controller
 support
MIME-Version: 1.0
Message-Id: <20250701-working_dma_0701_v2-v2-3-ab6ee9171d26@riscstar.com>
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
X-CRM114-CacheID: sfid-20250630_223755_995169_484FF0C2 
X-CRM114-Status: GOOD (  11.58  )
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
