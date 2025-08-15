Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA7ECA0EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 05:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEhi1mRyHIaFLc5FrHNOE1Ak6PAXjl+EeGz2e7HUkZw=; b=Hhc7rQPoPjaxAB
	r1OUCiyJr/ejklEruh8OLJwbFPRrG20IY+JMYg8xId2+4tvjirRD5WkXRN2q/Rm++9oWQ6iENcdv0
	u9P2SD025C8hTbYyk+RB5pEg3ti3CFj1JVghmWPwGl6h98SnNJDw1JJAZABy2VJjrDIZJlIph9e1u
	b17FGHv1y47WxkeNOa/WByw10Awm3cwWHK7VWfxikeRqUjOkzx1JUIIqf/Oe1fiDeN8hcMMdzIDqi
	19pF8ZQa9ElogEfWpOZQORejoU54txdM6vKzZ+jTygeHG7APsfw1i2x2ODdlnkGv7KMY36bBHAItP
	6jyjpjEhCHqIHZSJ4ckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummpB-00000001VI6-1FGg;
	Fri, 15 Aug 2025 05:17:57 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummp9-00000001VGi-03Lw
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 05:17:56 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-32326e7baa1so1511466a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 22:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755235074; x=1755839874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAR7LvrtEvYXVvXsm/WrP4bERAT0LEz+OoLyN7irYo0=;
        b=Hut1khVXU1TrlciG04SKr7LMthPDVLxFV5O9XwjwgoSuoOwPmJMjYQdLNtqGuyw9X4
         oXPQaufiOAM6gBy32s6XiHntpwHClmwasTb3oJY33BVNlGpKI2QwPWsJBLMUu8bAhHZk
         OpCkA6yQij0Mul75jy+EdQJlCuaYNLWmseOjC784qqd+WELawNgFeoQ0f6WOoGow3qvv
         jno2qgGMOyF1B4hvpbBWzjBIAnZgxcf7GEFKuEowZKIoJR+KkYMr9vszRUalf7HiOTG0
         qSMHbtQvxUansHp4f70/Fkua1z2aWDJ3MeNU6bRpZfOXbN4Ll5M7OFIlpwRAArdK1H0i
         P1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235074; x=1755839874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAR7LvrtEvYXVvXsm/WrP4bERAT0LEz+OoLyN7irYo0=;
        b=Am4Cq+iKkmofQdJ3SsPgq+TZU6vHUhFXV1gRcGOzNXBndnRJdRpcSLtEVRWIgUZYjj
         kkKcXRmaWyhLA9xykJm7a7Sy18sbnQ6JHi1F7adpXdy/Bl+oYCs9POC/JYv7Gt+MRhuD
         cK9iLadRGvKiMoJeHV9ytPNw83xO8rFkHvleaQytp+iF5S6KYobXfygQe4AkLxixPGcf
         otdbKv7a1bk/Co2FQ/HOOaTDiVrtby6GIGBx2TdBV9m0dYYC6lrsH1EhU+ldWnlUBKey
         GUVdunyICaEqtdvLPXahkvB39CZAfQEuchbkAfXJB7tVi0VMqOuxiJ3/nreOACaF60tz
         hPkg==
X-Forwarded-Encrypted: i=1; AJvYcCVA9IEi6luYvwej4/bw0eWak/GUda3trXYnK/UVwkgB67ilKOj2MoPpI9PArGCxNL3pnZ/clouc9jCNeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMQ3nDZtCJtmIRVwBz39RN/A3XLOHibDWKi/9jy6rd2AbzL5o4
	Lz0qgblbQrDG7iD6ruYJCbgev5mgdSuflapimdn5S21/oqBc10JihPBdaVbcycfIa+I=
X-Gm-Gg: ASbGncvRA+m578nA++G3IIjkdleJsEssbUfsZw/XiufxhHRrX9kUPe2R77c8yoVqjRK
	vQtO6bJsJp+5VlGNRUwno0U3/Oz4bkDkTSMph7vjuMTyQ0ccDHvz0qIv+BIaxpcNxXU+Asqq/QH
	NjwJoNF1AMWVeI5qWIKUwbHxdWe6sKguO18A3sW/i2VnBguzQGPCpnoTHLzdoF9ToYbbxbPBNb6
	ptiW7fqHr4RV7XFzXOrhlH5OvJ8Ue6qW/XgTumKA8wkFkbGPF1pmZadBYqUBrhHMwka53pyPmbo
	kVhJ8pUsmUcp1mF26UWictrfJQRlNUIv7m+szzQetT3ezT9oWj5myQVTT7AXoVbPBt4bnu8yi3G
	k+DJdDY9Q6Ioy9nfcjePaEQ==
X-Google-Smtp-Source: AGHT+IGPjF60DU2opRQQ2ZRiuLuntu3rKr9lba7AQVneRYMhgy2+Kz3SAcjcb/1v+om4sP4fBS+qiw==
X-Received: by 2002:a17:90b:1b41:b0:321:1df6:97d3 with SMTP id 98e67ed59e1d1-32341ea79f5mr1298891a91.4.1755235074382;
        Thu, 14 Aug 2025 22:17:54 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323439978a4sm373212a91.10.2025.08.14.22.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:17:54 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 13:16:25 +0800
Subject: [PATCH v4 3/8] dmaengine: mmp_pdma: Add reset controller support
MIME-Version: 1.0
Message-Id: <20250815-working_dma_0701_v2-v4-3-62145ab6ea30@riscstar.com>
References: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
In-Reply-To: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
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
X-CRM114-CacheID: sfid-20250814_221755_064345_EB848016 
X-CRM114-Status: GOOD (  12.75  )
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
during mmp_pdma_probe(). It is optional because in Marvell devices
such as "marvell,pdma-1.0" the resets property is not a required
property. But in SpacemiT K1 PDMA, "spacemit,k1-pdma" as the dt
binding schema file stated, resets is required.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: Updated the commit message, no source code change.
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
