Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFE9CA0EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 05:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUXRtyEfbnT2UZkiOfDeXCICqUVQn4l2MaePLrSpd3c=; b=HLQLlO1wLL4LLg
	y+Wzm9XfCeKPlOWfqRteeO1bePB/uzZ0/X0Bvb6JszGlK2uT3XaQVpNrF4rNVT3gIZ8Uzhlc+/wIZ
	V+kOFO+UtGjoW1J76Cl+9dzw56iZt9smGZjuCV9/bWQMTlLWhQMmX+bBYd8sDcWLNaXzGMxp1kF3d
	d8CiX0VuKf42yvhwId2kN8uAgwssCnb0ZSOPVnfZAmwKc/aVUo7nUl5o2WoxG/BJRanjuIE5T9GZW
	r1a20FkRMHm5EStFn3hA6UYK0mSmB5L8OIh5vBYiP8YoLmxnQwnfqTNWulR495lTm3jp4eJ5ZWy9+
	5D8eKqbOwEOYnqyLHZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummp4-00000001VEu-2qPL;
	Fri, 15 Aug 2025 05:17:50 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummp3-00000001VEA-02H4
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 05:17:50 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32326e66dbaso1318749a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 22:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755235068; x=1755839868; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzJqrcT6Sr4Domw6gSg6TRk14H0do5SxSGJ7BY074bk=;
        b=FKKuB0+o9+CJWEr7OT9vdql3Gyvm1SxWRM3OKGkGnYTuNe/eVCyk9oJBG98oL9jMUV
         YgG6RK38mJhbpdrOREc+ozypPt669LQZjXvGKLNoDcl2cYuKI/6Cn3amOX3+CQRZ1jrS
         70khpgGMrnCs50eB8ZiKBlqQ90mJKz2ZVq6vE/3Ro5vs9LOyR3jbmSUVLeikny6AXKbE
         HLJ9zJaCUN+X0XGsMugF1HDUqlKn0/mmBFn1Of5cGgnlN2MK3BJYKTk0oe1Xfly56CZW
         ccL+ueUwZ3ymIE9B1A5H6Pbp5a99ffy8bPP1OoCv9dcZtJYqURWnqw7zOT8Oach5acfH
         wRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235068; x=1755839868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzJqrcT6Sr4Domw6gSg6TRk14H0do5SxSGJ7BY074bk=;
        b=HyT26nMK10ut6DOOo9dcAxyH6feaeOXinjydDkUbIbjA7j+3fIsx36WWfI3kKo09Ah
         h+oQMgJqxhqej0xonL4jDuX8MI4jn7CyNTVvxJponN+zP3oNnE19u8swUTY9wl9fmt2k
         3UHiw285S3Lp921pXknxmmTKhzuwgataJrFTWD10lXmhXvOSQJaKP8moJJr0n82O/JYh
         a/K5NqTzlqf38DbOaZIBPF+Hvu/laehmedRvWQg+R6SXbWV+yL3K9Ek4XMDbN1qGXGSi
         S5e8EgMnh/vXxhYmzigcKnoTTMYVHv00eDqybSEehkPf+nsxEzj7emsXiWK9wzbMsdXs
         pfrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIRgUcgKadmpzehOtT3biP2gtU39vatoI11HhNqAEGRpYKgRHFjmoASOgY8MFKfRQpLS6tuspEh/gP2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yznd0wHZ0QPQSNF4SWEW2HrcdB2s4m1K79EAo8nQZO+lPWK+1gT
	bJeeEa9UTu68AfUVpr//hS5GQ2JbycxxiCeZdGHU/GHe1B2xeGpjlgioz1aT+F1zZbo=
X-Gm-Gg: ASbGncuQCQNrYhp7oksWzFE89XJvfOTlj5YupQm8PeySOLe8Vw5Q42qOGzbpJ371Fh1
	KeV8eLHKqnAkzL70XeV7VrTrTLfpoeEjsazVIcHnPwYXrZhoNtiLDw+5VTO2qMJu1tSO9bkOXBI
	CnJQv9sqJgM9jvp9ICzX3nvh198A3lvw4FRGIisrdtEkpcvXl+mzXs+iYOSHOyMzhJD8TxrRxBV
	lMqo2LG3v/eiuEP7EOMR80jPbPzMzs5IceQCBceLXgu9DVyjbkBBL9sIVostQhZBPZoYWzuRoyL
	bPCJy+R2uLp6aybpJN0eeUHX9G6nq/KUErz1l2lOuU48Pu8nIRA0X++8+5YEQfBpBLOPJ4RehEC
	bmKEaHJpL00ym2kdoKXxfPg==
X-Google-Smtp-Source: AGHT+IGEpJzSAAi5oYh5J4I/dYuHH3xIHOFcQzFYpHxGCez4ecdeF62QFwuHOYZn933LvQXIM7H3KA==
X-Received: by 2002:a17:90b:224f:b0:321:9366:5865 with SMTP id 98e67ed59e1d1-323421217cbmr1522970a91.33.1755235068158;
        Thu, 14 Aug 2025 22:17:48 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323439978a4sm373212a91.10.2025.08.14.22.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:17:47 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 13:16:24 +0800
Subject: [PATCH v4 2/8] dmaengine: mmp_pdma: Add clock support
MIME-Version: 1.0
Message-Id: <20250815-working_dma_0701_v2-v4-2-62145ab6ea30@riscstar.com>
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
X-CRM114-CacheID: sfid-20250814_221749_053432_AA5CF6EC 
X-CRM114-Status: GOOD (  13.11  )
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
