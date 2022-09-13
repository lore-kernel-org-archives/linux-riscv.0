Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413AFC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 06:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sf66vtAr42uf9eGnRNvLS1zvlb6omLbxagZOj3WyBQ=; b=WFuyJUBAlBd03u
	cePKi6ZAU48LJcnaikW+lqkn/Y0JDSklBjWTKrnyWau6iUBZdvz9+13a+Su/TCkrqZ6Y+g8GwyGj9
	lTf1tHlyghlE7YqBupHmQk+6edSZhLnXgyMLj7lkMdFMYzCfnBKYK7VuRj7+1OXgJy3jVMUVpnRlq
	kqJiaYWDsCkKtUuiDAeUr/GX2n5ldzHpSA+hCWMhCGBzUUq7JmCRGHIt0wVhZcKcwbMK82SFb035F
	0cBCjD3kvradc5ot4Du+dA/NbunTI9s4LBNsyELZxNJHwA5AvAJ6ZPPWjyuRcOW9guXo23KueWxpF
	Ddcnucxu/M135NCAWndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzGA-002slg-LE; Tue, 13 Sep 2022 06:19:02 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzFs-002sc5-OG
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 06:18:46 +0000
Received: by mail-pl1-x633.google.com with SMTP id x1so10789643plv.5
        for <linux-riscv@lists.infradead.org>; Mon, 12 Sep 2022 23:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=5bvvWd4WtFmP4+rZD5AyV+ZxO3T7wivPuDP2w82MTho=;
        b=jApF67DKgFFG4O14T8MMLEVYllTFfzxVxqJv0QDe0Y7gZy5P4wy4+CYiVaDwLtddlL
         OR3wCdSbFRyImrrTVtWSMPC1kEFumV2I+PLI26CZ9+VZd3LMsPb4D+Mi3Byce+1hGzKH
         0CEOu1pJP9J8A4z74Nllja0NAM/Vqqi1MX6yStEWz1yXQAEzCAzvowGS9ZT7tMjuhQNH
         Y0e1UnccGZtuBBvkj/KZFupslQYyZWFMZAaMTTfqidADyYnEhuItBVC97SLDTUrQW+r5
         RZ/hSMoIWot9KCwGt+s6YkhhGyOS3ojPelCuGG9jcfiLHk97Oc6+DPknS4NUmMmijGhV
         eJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5bvvWd4WtFmP4+rZD5AyV+ZxO3T7wivPuDP2w82MTho=;
        b=7ZNwLiyd1dIqPooaBwkj9g7nWNxgt2K6w++xtWtQG8YO6KFC7TR1i0PUH9HbU1S0V7
         6fYok1X/d1Av6XOw7X79scbbYfO/lnx9H7mh+aJfLbHRWC0bgCWiPp7wQlqpVz6GEbhO
         i1j1nooTG9PUpYSgUg/F0+vSA4a1QTIEEYnbjRaQrRmJ6aYUD/c+8ffwAoqIPOuOFx4r
         czV7pdkEvyKsVu6zha2MA+RYtRF3wG6P8ALJ97g02rVOYV45RPIZur4qR2hohIzfB9BR
         yr+rxjXkulCMUJZfmIx1qdnkLqCTJq+J6n3Cuc2pRUgRx4xik0I5OBQQJNe4vnLYGH0k
         JV8Q==
X-Gm-Message-State: ACgBeo2+JqBEco9ZVqLTJyOacvOnxjwUVReawh2yXVxybtN0XXydFdgx
	2l13F7C11yiG1p7vdft9wzf4Xg==
X-Google-Smtp-Source: AA6agR7ohooCghBf34n40h3VqSzgxuUDH9DmUDn6UjYI5sZtusgmGig7dwtb1cLx7HzbGSjvzgji/A==
X-Received: by 2002:a17:90a:e293:b0:202:6eab:acac with SMTP id d19-20020a17090ae29300b002026eabacacmr2229554pjz.203.1663049922048;
        Mon, 12 Sep 2022 23:18:42 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id z11-20020a170902cccb00b00173cfaed233sm7296332ple.62.2022.09.12.23.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 23:18:41 -0700 (PDT)
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
Subject: [PATCH v5 6/7] soc: sifive: ccache: define the macro for the register shifts
Date: Tue, 13 Sep 2022 06:18:16 +0000
Message-Id: <20220913061817.22564-7-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913061817.22564-1-zong.li@sifive.com>
References: <20220913061817.22564-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_231844_878143_34B6167C 
X-CRM114-Status: GOOD (  10.13  )
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

Define the macro for the register shifts, it could make the code be
more readable

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/sifive/sifive_ccache.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 91f0c2b32ea2..1c171150e878 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -13,6 +13,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/device.h>
+#include <linux/bitfield.h>
 #include <asm/cacheinfo.h>
 #include <soc/sifive/sifive_ccache.h>
 
@@ -33,6 +34,11 @@
 #define SIFIVE_CCACHE_DATECCFAIL_COUNT 0x168
 
 #define SIFIVE_CCACHE_CONFIG 0x00
+#define SIFIVE_CCACHE_CONFIG_BANK_MASK GENMASK_ULL(7, 0)
+#define SIFIVE_CCACHE_CONFIG_WAYS_MASK GENMASK_ULL(15, 8)
+#define SIFIVE_CCACHE_CONFIG_SETS_MASK GENMASK_ULL(23, 16)
+#define SIFIVE_CCACHE_CONFIG_BLKS_MASK GENMASK_ULL(31, 24)
+
 #define SIFIVE_CCACHE_WAYENABLE 0x08
 #define SIFIVE_CCACHE_ECCINJECTERR 0x40
 
@@ -87,11 +93,11 @@ static void ccache_config_read(void)
 	u32 cfg;
 
 	cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
-
-	pr_info("%u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
-		(cfg & 0xff), (cfg >> 8) & 0xff,
-		BIT_ULL((cfg >> 16) & 0xff),
-		BIT_ULL((cfg >> 24) & 0xff));
+	pr_info("%llu banks, %llu ways, sets/bank=%llu, bytes/block=%llu\n",
+		FIELD_GET(SIFIVE_CCACHE_CONFIG_BANK_MASK, cfg),
+		FIELD_GET(SIFIVE_CCACHE_CONFIG_WAYS_MASK, cfg),
+		BIT_ULL(FIELD_GET(SIFIVE_CCACHE_CONFIG_SETS_MASK, cfg)),
+		BIT_ULL(FIELD_GET(SIFIVE_CCACHE_CONFIG_BLKS_MASK, cfg)));
 
 	cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
 	pr_info("Index of the largest way enabled: %u\n", cfg);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
