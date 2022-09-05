Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA7BECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8E7AIiDHPnudJNsOQoOsvkU4NAPZkdB2L51Avdu55FA=; b=UQuMCUljXSestX
	CdIIq4ZmBaH4gDrTSK0MXa6tbY1SDdQDtRxLvgo5Gz2ZvG5NNfh11YWwunlDzKfHvO3aQDNXCNoIU
	opBaFuXjaLujLqaG533poW80juOhm1oRLmAOV048RfHhKbUZLc8+N/J3q0pcXYyjstzmpT3iB2c1m
	vv5lWoXFfPYsgULzTcnWTK2W331vF5nmBIgTmsSd1OwPRaADeDMDcRXzumsvveCKlyMSxchDzAl2j
	x3z9UJ7pqxc017PoTkaxkC97bL2j8FFdngR0ajwmEH5mlVp4sJ2SWCG28iOWCCbTiKGQ/aIbh2zSm
	Uu1aWI9BT5vv0V8O7pnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV92E-00HOqV-Mx; Mon, 05 Sep 2022 10:08:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV7WA-00EhGM-Gj
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 08:31:51 +0000
Received: by mail-pj1-x102c.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso11544318pjk.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 01:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=YU1T+4ItypqC13KzotwkMdBINkHdY6ElFDyiDsgiSMA=;
        b=nNMuNeProX34RDrsnOSF/BtRNHaeyc7GAQa7GcuIU3JsvnbmieUL6SWAaDQ+evChiZ
         BNni/5dIqlJlRBtmOxUta8R767lUhkcQyYVD0O/SS6bb4mqGfq9hKJngI+YlSNH+ODB3
         Mjcc9iKS769m/u0NzDOwBu6i9DAZs/6z1UJA2Et4QPqA6y8nNHGDTU4ZKTCZpB0mYPRY
         97/obMJ0FR/56xLLkjeY+xyR/0PSHw0LbcE6xBG51vf5S0Q/1qwM+Km9sBDbHjmTlBAO
         Ms+xtQuHsRPuT5wDc9guJCTzsRvaghbdR6CzzhVc+x8v8h0b6aHg1WpPNr1k7YlBuBNt
         qHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YU1T+4ItypqC13KzotwkMdBINkHdY6ElFDyiDsgiSMA=;
        b=0QiqF5Qpl8FLIjRfLW2vuKKT9rjwY6epw42kCrGx6zTclpG6EEFTNDU46gFWYFcGJK
         yrQzsRNW1F7BgEui1G3nwd/Fc0uuQUvjOfomM7KEcOgbhNPKIpS2Wym5HqmcvndHO5qy
         nbisZvFEmG15tJBxaXqO53OU9fPHIr/hE1xh7XVEASxzjXAqtimqn5mNbQ/d/MtJI530
         4Fko+b5fPFIqzcc8yIRO1GvF46hcajworfp/qyqEcwml8zHWLnWbTBwuWC0wN/RWOWLz
         PcMYv/RiBrCUxKe4IGlVO6vckJpa8+ZnmKqY4YoB5+I7IKWFFtFf24E4v4ELZTLAL6zY
         7HJw==
X-Gm-Message-State: ACgBeo2KXpCf2wl9NYpVb/6kzRb0DMz0eWobviroYK/RATx6RJ9r6o0o
	f281c6b3Lc+I1JHY2PFmf/w7zA==
X-Google-Smtp-Source: AA6agR4LF03FLh3g6astJCmw5kiDaKHkZHqjx7NtyxT/YQSsUe5vXkXmUES8QpWPLpQaTuxNhrQPDQ==
X-Received: by 2002:a17:902:e844:b0:172:d21c:3fe2 with SMTP id t4-20020a170902e84400b00172d21c3fe2mr47953924plg.43.1662366700991;
        Mon, 05 Sep 2022 01:31:40 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b00537dfd6e67esm7089721pfo.48.2022.09.05.01.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 01:31:40 -0700 (PDT)
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
Subject: [PATCH v2 3/6] soc: sifive: ccache: determine the cache level from dts
Date: Mon,  5 Sep 2022 08:31:22 +0000
Message-Id: <20220905083125.29426-4-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220905083125.29426-1-zong.li@sifive.com>
References: <20220905083125.29426-1-zong.li@sifive.com>
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
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 drivers/soc/sifive/sifive_ccache.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 1b16a196547f..0e0eb85c94d8 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -38,6 +38,7 @@
 static void __iomem *ccache_base;
 static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
 static struct riscv_cacheinfo_ops ccache_cache_ops;
+static int level;
 
 enum {
 	DIR_CORR = 0,
@@ -143,7 +144,7 @@ static const struct attribute_group priv_attr_group = {
 static const struct attribute_group *ccache_get_priv_group(struct cacheinfo *this_leaf)
 {
 	/* We want to use private group for composable cache only */
-	if (this_leaf->level == 2)
+	if (this_leaf->level == level)
 		return &priv_attr_group;
 	else
 		return NULL;
@@ -210,6 +211,9 @@ static int __init sifive_ccache_init(void)
 	if (!ccache_base)
 		return -ENOMEM;
 
+	if (of_property_read_u32(np, "cache-level", &level))
+		return -ENODEV;
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
