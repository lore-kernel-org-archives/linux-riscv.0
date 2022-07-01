Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B7AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x7lLsa6j9fG/pJzUQRNKzGF30r3cLezagiDVC3Irygc=; b=VoZPFR2UHTpJGD
	amhAT672eYkPLEgsg72fZFOxscyV0zHARZnBCWQAETVT7zjiGJorMNyo7xSrtvdG4HGzco8ZdNHfk
	mFTvzCMk+gg5gPh76gGU/UnfQwOawmsFtNOcFzHluztNgYxNGlBdrjTpGlBf3stR60az/Xr6gVLHw
	c8/Aa6/AAXarLSZNM8xen2mSxV/D1yHPvT00X6+HVOBr8azLMtG3IYMlh+RApncWoNisrGyM+6a/C
	2J8FzrhLRwZ0Ikb941admgmTH/VkGVG1TB3bZnlFJrsADkIzOcz61TR7TUjfMXc9zN2WtkNjgRgTz
	IEvjh53l0HoRxjmrEZ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7GgZ-0053x9-LN; Fri, 01 Jul 2022 13:27:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7GgW-0053w8-Ln
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 13:27:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id l68so1309221wml.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Jul 2022 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vElcCtw04QzuAH22LcbLyJ8OXVl5mqZvOzdsJCSKnNs=;
        b=SV30SZRPWDjribOlXEJdd/yg3juNcqboVOE6JCXCYDcrNei6x23hGFFoTjLeyG5w7s
         8oWs+rkoN0jpkAG4owViglzYHdY/zoC59LuweSuaQMU2oES6Las75LQWod71360VGQsQ
         fxqF643w/vVY4wq3myXS+WkUSXtZVMLQrFyYzdUD020PR2lwg4J/PIIorUhbPHjLyKXl
         eWVvO6aIheXIFXR7rptanl2FwKYc2LwRJXbKOgGiGarJkmhPSIpXFuqrjll593pSlad6
         njT/YBsVcJ///r28v3LoGpgwQSDPxp1VzpKJzu+OD9htbnF4+kaQ3t6G/3lIkRRyuduV
         n4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vElcCtw04QzuAH22LcbLyJ8OXVl5mqZvOzdsJCSKnNs=;
        b=JD0xD9wPgqd/jqfeouaUhff9qJFViJVW9JdIvrhmGVPK+pxAyKoXkH7VICfm2W6ZCD
         nM5WsObEUxHDEEuBw41ETgSlfKaL//P2OHgJj6eeQSpu55elSwdCVOwjzLab7X1iiU8O
         Bdqqq5yOQp8QAITY8UVu0Q0JopYBqbXcqtg74OTQuYh4IWvfbo2zwPknliLhsYq0fBU2
         8UC0xUqrKET7YQ+SCoPH7kYfgFKa5vCqgGHDfyGj+jQW8C6sPwSJQlL4QNsyZg08LpSt
         UFUtkb2utxu8PnN+vwYVljE6zr27sS9906PbJCkf0q92k0wFSQIs5C4AS6e4sMtURqml
         yByQ==
X-Gm-Message-State: AJIora/YcH4vIs4EVvu4NnRvTqfD3feWLkyWdYIwtnRlIOpJeOXufN61
	iCFG3MqrxN9YQLuB81IRdAViW+YVPUYTAg==
X-Google-Smtp-Source: AGRyM1sWqkqw8VCKFu9qbSXKAUEUl2mZp5uKcKNoVZAyGcrDq9btYZgn0zHEhiuQOLpImL9tx3r5+w==
X-Received: by 2002:a1c:f20b:0:b0:39e:f4b9:24e3 with SMTP id s11-20020a1cf20b000000b0039ef4b924e3mr16541364wmc.51.1656682066956;
        Fri, 01 Jul 2022 06:27:46 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id h13-20020adff4cd000000b002103aebe8absm22354337wrp.93.2022.07.01.06.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 06:27:46 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au,
	hch@lst.de,
	heiko@sntech.de
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [RFC PATCH] crypto: flush poison data
Date: Fri,  1 Jul 2022 13:27:35 +0000
Message-Id: <20220701132735.1594822-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_062748_747664_92281063 
X-CRM114-Status: GOOD (  10.37  )
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

On my Allwinner D1 nezha, the sun8i-ce fail self-tests due to:
alg: skcipher: cbc-des3-sun8i-ce encryption overran dst buffer on test vector 0

In fact the buffer is not overran by device but by the dma_map_single() operation.

To prevent any corruption of the poisoned data, simply flush them before
giving the buffer to the tested driver.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---

Hello

I put this patch as RFC, since this behavour happen only on non yet merged RISCV code.
(Mostly riscv: implement Zicbom-based CMO instructions + the t-head variant)

Regards

 crypto/testmgr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index c59bd9e07978..187163e2e593 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -19,6 +19,7 @@
 #include <crypto/aead.h>
 #include <crypto/hash.h>
 #include <crypto/skcipher.h>
+#include <linux/cacheflush.h>
 #include <linux/err.h>
 #include <linux/fips.h>
 #include <linux/module.h>
@@ -205,6 +206,8 @@ static void testmgr_free_buf(char *buf[XBUFSIZE])
 static inline void testmgr_poison(void *addr, size_t len)
 {
 	memset(addr, TESTMGR_POISON_BYTE, len);
+	/* Be sure data is written to prevent corruption from some DMA sync */
+	flush_icache_range((unsigned long)addr, (unsigned long)addr + len);
 }
 
 /* Is the memory region still fully poisoned? */
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
