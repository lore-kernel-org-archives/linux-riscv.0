Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129AACA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0KAuZKZujpzHBXw0FHv/m2kVVTLsPwZMf4BiyZGrANM=; b=TKQ38Tdazk8tY9
	B3Ry+AjQVQP+HetutwsZIAi1dRF1aHzILeFrOJzFRuP+NI9rPJHJSq2N+eqCwjWUG3jkgy4DNHJ3x
	fwV0TlI9/Uo6IBiN3aeAhM3+Z4qdgdLQM8cpvHLg0cdikNyNSmrNCukMFmGydEUMxypiyNiopowo4
	MnK0K9ktZHptW66dkaOs0N3kFE77wfrXawvM7wd1qwCg4O1v4tqX8CZpwGohrIO4m25AT25d0FVB9
	El15ueMS44w1EKuQtc1Uw0ucUvJD5buv4ZJtRMkmQHIg5jip7SpDWwZekeHe/qZ5fg4+58hy87co2
	Qtlv5xnUMTBA5uazRE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqs-00000002IA1-0wCx;
	Fri, 22 Aug 2025 11:22:34 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI73-00000001LIh-3xQY
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 03:06:47 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-323267b98a4so1401872a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 20:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832005; x=1756436805; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNSJ2mPLuZ8B3CyF3qAdwHZOD3xnp4hT+na7SYM4Trs=;
        b=Vdlo/Pd17qxkMC6Kh7raOrYgxUOIU5l+sls2eTXotNkrVT1z8ibVddqBVSIj36mlvs
         9mX/js0JH7gpWwIpXS2Lg3/pqrsqVcqBybaFP4x8drUHEKPmURgtNgBVmZpC7dk9iFj9
         t7uVdVLgqxNc7w4dcULGXvTqElTTkzG6NwdQRYDinEQTNTCCr4OYomN/6c/sW5kSRD79
         iZXluBTA7Xe9CDB40V/C4ScflKvzIYpWA9/R4p7OXkCjZPyxUYcauKgmx5u4g4VVN99C
         n8ill+uhshUo0hoHNL2gxk1pg3TYaOtSf0qVjNnFlZBM1RTESLrNiu6nZZUHVCz46rrj
         DLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832005; x=1756436805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNSJ2mPLuZ8B3CyF3qAdwHZOD3xnp4hT+na7SYM4Trs=;
        b=fxflnCG09cssjt6ON2plivrQxOvXsX+wFk891EY8XaLshZrGTsLy+PgrN/bi7O2+nf
         zLeyq2uNX9hxLdC0Ao/YvxKu2UjYCNN7E48qBVz4ekUvkWcxh1+S5I/80/Sa0+Go7Jog
         EH9pFNSAoEgQX8f1wu0Vv4YJdaYD411mt5zgXVhVwD90tb3m4oRSKN9wl+wG1X/I9m3/
         Q9PkFsPdwwWE15sjM712dUMRAntF/QkkYdsbokjle+1RZOTyZCgF7lXOkyC9gqDtZXTO
         x+0530bHJpyE+Sa2yMtOVQvtBMtFuc1NSibwQtdUvp4HhVie3n71/YDIwtSyB5p95gZ6
         +SiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCto72bpe20VHBOIz3r41bGcWoeITNLvf4hxjoGj+Vcn0uWil3YC7EZ0FJnDIYlz9r49H0RKvcc46rIw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwd/08pPT0ZXl9XZUQau8GRgPuvivPmJq9jDnPI9FwO7ui0ndk
	TMTMrKdiFpRzW66TdtMwMGhS00+4NHnbPC+2fSOXTJglWSbWw1xyxAxkmoIiuPy5ZPE=
X-Gm-Gg: ASbGncvK4wzxyTOWHH6TQdtRhmSNZ4yBjYtX242joIK4AxXqaQXjIb4yQ51ixxhBPSh
	FAZB28yw55M8Fgw8sT2d/p8tjIbEnXYjxUYbllUvjpHY1WZ3klpZ9TRxOGpFesfAvmQMpo+8DkR
	39wym02eWpJEUTY9W7y/7IGQuWMFMSbY6kfhKylkte3UkyvhcZ5cWSUoOzEIKc4fipLvU39XoC4
	DOc7ocB3y0HGWnNgi170lOjOdJHDao56vM4Bc+THZQhhGCde0eKL4DvL9W20qZTf4/XeKa6O+jv
	BvRYxh+yMwI/XePP53A+BjUe0c3JlRHqCfwc427GgaFLXs3xcSAwjDuf6fpUYjrjloLvAi2O9zl
	zBS5YaAUcaHrQB14ixiyS68ikSjYx6zwjlQ==
X-Google-Smtp-Source: AGHT+IFm4R14mG8VZTD2qtlcugXo9bV6lRrUZXdMxf/jLK5A59pmBdn675N88wWnNFsP+MW07XoLbQ==
X-Received: by 2002:a17:90a:e703:b0:31f:6d95:8f76 with SMTP id 98e67ed59e1d1-325177456famr2245633a91.29.1755832005018;
        Thu, 21 Aug 2025 20:06:45 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:06:44 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:28 +0800
Subject: [PATCH v5 2/8] dmaengine: mmp_pdma: Add clock support
MIME-Version: 1.0
Message-Id: <20250822-working_dma_0701_v2-v5-2-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_200645_988358_15B66DB5 
X-CRM114-Status: GOOD (  13.41  )
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
mmp_pdma_probe(). It is optional because in Marvell devices
such as "marvell,pdma-1.0" the clocks property is not a required
property. But in SpacemiT K1 PDMA, "spacemit,k1-pdma" as the dt
binding schema file stated, clocks is required.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: Update the commit message, no source code change.
v3: No change.
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
