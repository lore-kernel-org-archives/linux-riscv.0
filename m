Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40C4C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 14:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFtf8Xp4coM9ya1A2LjmIF7spxXWMt1JF2+zOfih9Ws=; b=NSvOIZ/x/WWhJl
	EJO7h7lVrjmDL2IXei7FllGWVNIUMwXi8ES8wp8q8DAJ2r63y3kLP4liwGRLIoZtciDHffjZuj1r1
	+RBe3YicFrjJyjTDsV5X1fxIq38ENOJKFydz5SI9q0jpRX9uKHuaIupYFb8VO/U9UAFITuf7WRRRM
	1GST0ZUP8lRmpRLla1xIDuEPHYbHsFfLmX81Xq0GVmq0ft2HmmnBQ+SkpZp/lGTwQEUgao/JtXICw
	OapNQxWflLmc3j2Ak9iIoAFDvePUuFDcWCElcb7D3EAXPIRPoKZ3ghhlzouT6IsawZH9zF1H+R/Tx
	681G1LLm/1r7mGYA5new==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIos-004soZ-MW; Thu, 08 Sep 2022 14:47:54 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIlu-004qTt-5h
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 14:44:51 +0000
Received: by mail-pj1-x102a.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso2608746pjk.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=J1tHlju2+cXYieX/pEOr8qlvVRzsaNnqR5zd8sgRAW4=;
        b=gmV61+9vUSmtpDQFopsJ2ku3wTMWgbaDlPMVRXv9AHl4iBvo7ocd62TOfwkJbaLlD3
         sdT+g6nLvNMzHUhHmtJMNBASiEfsmw5xvFYEEpF5JM8o+Z95TepA0A+CNZRGuWl2+0Ib
         FSOAE6spy6vcklkB7VHY1c58jGl7J+cTfUZGw3XEpdmxWADy8O7kPJ70CNnTLI4noPYb
         3kDm38AsD9c3hqaGc0CFGnWsvAUdNYGezZtE2RgipI8yB0lzYIr45BNTI/FRQzPqNSq2
         TPB8PMf0lwv6udO9FeRhJ7E/YjNbr2+Col9SKCnYpk4TdSc9Kyt66l7al4XJYsNNmdU9
         rxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=J1tHlju2+cXYieX/pEOr8qlvVRzsaNnqR5zd8sgRAW4=;
        b=Oh2e5LXw6YEbC0mHkT7u7zHvh83n+duXYD5elytaNGKHd0C2a8Y6l7mrr5uFXcn+gN
         SjNahGIPhvAPnuuLuO/g+OXyfYpsZO1zekuE9H23eSbcreXVb0E38mdHNj4s8zGsaEGN
         B4x6R85heGbsrrq7ECUu5qjaTQFwkAcCPsF7hu1qgVHbNrfEiQZk5UlGiJkSGn51qx8G
         HvZ7DAL/c/igMGTMeEqrc5Vo9O78L5oKJ8V5jPomSgLAKlZRhnceDxtMMfQjFyktjQuH
         h0Ln4bErnme3ts81d+69CPXlpW/HZp1/mLFmqYQUyrRUXINC7BeObDDlmEiEgCXjZ+ga
         7T2Q==
X-Gm-Message-State: ACgBeo3FXZW9vuk6sw0VA2Gt39cm9/OFGeljrEHXAL3/LWnlP3Mj41S+
	nVWH9wfRX/x6BmuKT+A7hFdhWA==
X-Google-Smtp-Source: AA6agR40T8VGOwQPVPXwn0xDEJUAihdvvc+xd5Ba8Hk/nOFgbOdiZAU3choIZea4zpjK/11k8ZrXAg==
X-Received: by 2002:a17:902:d2c7:b0:176:c8a4:2f2 with SMTP id n7-20020a170902d2c700b00176c8a402f2mr9425217plc.119.1662648289321;
        Thu, 08 Sep 2022 07:44:49 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902d40400b001750361f430sm4484728ple.155.2022.09.08.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 07:44:48 -0700 (PDT)
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
Subject: [PATCH v3 6/6] soc: sifive: ccache: define the macro for the register shifts
Date: Thu,  8 Sep 2022 14:44:24 +0000
Message-Id: <20220908144424.4232-7-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908144424.4232-1-zong.li@sifive.com>
References: <20220908144424.4232-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_074450_230069_DF6E8570 
X-CRM114-Status: GOOD (  10.45  )
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
---
 drivers/soc/sifive/sifive_ccache.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index b3929c4d6d5b..0ddcc657c694 100644
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
