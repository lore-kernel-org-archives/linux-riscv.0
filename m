Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C47ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 06:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIKBjfuT1+BAvWETaK6qifuzy46E6JUik8BJ4avmYi8=; b=jK7OnMDAqiO4u+
	fqIB9ebYoDLJs++3QZvnltagx8ePvOla80z9rGhgjFhX5zg2RmkG1qOgVR47mh6W7lo4/cNV8gmxK
	Ak5aUTSD7rq7uW7Gxs48PK3yQbSO5nz1HQDqlYln9jffkvcVC0kRiE7UKD2ZbOg9ia7drNRNTLaej
	YAxGH8OnRhwRdhBif8WhfZ8rCtuLpUNQJCql24Tqrci+2BLKceYwDxs5jfvTwzsiEOopk4s2y5NxI
	eoxOWsqkAYBnmmLBEroO9pdZe9tZFXAvNOzEk2/L55vCsVdSJp3n0ImRqpjwQHMewEAUFmlalbLbc
	GWKDWPm2mpJgKaE0RYVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXdHO-007Jpg-9L; Mon, 12 Sep 2022 06:50:50 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXdHJ-007JnW-N9
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 06:50:47 +0000
Received: by mail-pj1-x102f.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so7230686pjh.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 23:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=viUsGW+Zs7kQMJlix4q594CqGsU1OFW3HynVNHA2iG8=;
        b=QkvhKH79pmOL280s8O7XavIGY1hLPyLs7ET4C+xdDdkmp4TWr30f63pv7sXWsYeZAx
         pHcgKhkvNYwrrowng3fX7v+AX7LTGHyxr7d/E8RzFhnMJ2QaMhf3un34DFtxqfxEbw6T
         alKw1AueifAPAfnWXJj1JEeEWegHWkkPBH0aZDqw0TEMZ/daWDxKIyyxcb/0JQH7X82+
         laW34CF1YnFnmnuFcenHABv3GmSSsdxZdlJwLdQjTV5oih0wcQVYGyOb7pG7IRirfu5s
         XZf+P0TViMPLGFznKdEs5pj22lDfusMvl8pvt5Q7HxDzXhkIKP8LuSqU+l+3AZMY9Opt
         pzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=viUsGW+Zs7kQMJlix4q594CqGsU1OFW3HynVNHA2iG8=;
        b=hICMPUOj1FzXOv0HYx1TD6Cdtmr5fOAxC8Qgin70Y33i0EHt0ZTNsVqLGdGb5Mfw79
         GuF5EGlmT75h717/er1LNgvZf8uWttWTWLzCSytm2xjVyWibvXEaayOQJNU8BQoECH4c
         XbkQGnn1vuoJPlmDfaNlbwIfDmRDRI1DXxZoJ+1Z7VJxXzHjPundHL5W75hSrol1LCD5
         FVV2jX5AVeB4F51xSaxXpNq2GA9b44+qGUHQ7bHoLMPKJkDqG/rN89Uk8lcQVH3NqbBA
         RNyQcx6ovp8WGa2IM3OtbfIj28gb3yyhZUVZr0jrV/HY62bmeg+ya8jn0L6xXn+oJCcy
         ZGag==
X-Gm-Message-State: ACgBeo0N3wCh6LExCJETMduUFnRvg9T0+rOPG/b+Ccfw4AwoEx9oDHyz
	rNl6QXYbnH1xF8DR3mHYytPYCQ==
X-Google-Smtp-Source: AA6agR46FsyQUdbhDGQHngJT9dV9LnmotVWxOwBLq7pmBmPETeK9eID1xeX1tu1pGs25qA6nPZf7aQ==
X-Received: by 2002:a17:90a:d149:b0:1fb:6dfb:1fb8 with SMTP id t9-20020a17090ad14900b001fb6dfb1fb8mr21732578pjw.25.1662965445303;
        Sun, 11 Sep 2022 23:50:45 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id v62-20020a632f41000000b00430c6fd7ffbsm4705716pgv.84.2022.09.11.23.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:50:44 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	ben.dooks@sifive.com,
	bp@alien8.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 3/6] soc: sifive: ccache: determine the cache level from dts
Date: Mon, 12 Sep 2022 06:50:26 +0000
Message-Id: <20220912065029.1793-4-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220912065029.1793-1-zong.li@sifive.com>
References: <20220912065029.1793-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_235046_336469_07E9464E 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Composable cache could be L2 or L3 cache, use 'cache-level' property of
device node to determine the level.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/sifive/sifive_ccache.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 949b824e89ad..b361b661ea09 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -38,6 +38,7 @@
 static void __iomem *ccache_base;
 static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
 static struct riscv_cacheinfo_ops ccache_cache_ops;
+static int level;
 
 enum {
 	DIR_CORR = 0,
@@ -144,7 +145,7 @@ static const struct attribute_group *ccache_get_priv_group(struct cacheinfo
 							   *this_leaf)
 {
 	/* We want to use private group for composable cache only */
-	if (this_leaf->level == 2)
+	if (this_leaf->level == level)
 		return &priv_attr_group;
 	else
 		return NULL;
@@ -215,6 +216,9 @@ static int __init sifive_ccache_init(void)
 	if (!ccache_base)
 		return -ENOMEM;
 
+	if (of_property_read_u32(np, "cache-level", &level))
+		return -ENOENT;
+
 	intr_num = of_property_count_u32_elems(np, "interrupts");
 	if (!intr_num) {
 		pr_err("CCACHE: no interrupts property\n");
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
