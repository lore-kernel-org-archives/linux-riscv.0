Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E6DECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 10:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNH/tdrl+3jS0PUD5Mut8B1Vpbj5raxFrgGM+zO/CPw=; b=taVyJdPRV8wmzr
	K8otatx5A6DL+1Td3NxjTD9Xco6U5VKJpkAiuCiuVg15qxpsbEABhvWeG33Y5gUlnpAVLSJyveju3
	iejkOdgbEFpFlWxdA3KBLKAg4fIXrghaiZ88HtpqWwPmlMyCcIEmk+kRHYhXSxW4BfN9AAVTMCvHv
	5OiVxBCIbewJXtC0hpb1IAGf1dz1RlSWe+mRoCGPF3jFKExy5/AhpxfQGy4Rrz5F/Okap9W25sRiq
	14mekYsovNbCZTBXODNrkDDZ6ODT+YeoVbcp2QVjgvQbgJstZZnzvtE/dXJmMue6nX9CIY3XcAJ3x
	UvpBDwlwdJ/5eNNMZBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV92C-00HOjl-LX; Mon, 05 Sep 2022 10:08:52 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV7WD-00EhKF-7U
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 08:31:51 +0000
Received: by mail-pg1-x536.google.com with SMTP id h188so7497077pgc.12
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 01:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:to:from:from:to:cc
         :subject:date;
        bh=RDrMP3xvws9OaH5g40HGBJ+ievxTdagfiswczWlZGrE=;
        b=GaEGPW0pfxra5HjSvW8DeN4YpWoDxiCA4SwjaVQvOZ3i033gVO66Ds4YdkdRFvVUya
         0Bmvj8jqNQ7QspNRcSsRmlQo8JYeVdn5pNrHy8O2USdEE1RhKHTc6rsOWqZ5Fq/9GHvJ
         O2FmKSh5S0l5UlkRbFxN9/tKFgOMa8JcVwVN7ILAYbaELD7UjIrvpbbVLs+7p33Vo4E8
         6WdWUfSvarxMXQoVdsshCZYGQAHfMgKyWY9PriMGsNn79q9T6IGu++ZnukL741KyLhen
         E0v6wZaIZd7rSuWpY7XpVzGa18Ur21XRrr3LZJjgyvOe+MXvDiuONh1fzOklInFhGJ7C
         PHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RDrMP3xvws9OaH5g40HGBJ+ievxTdagfiswczWlZGrE=;
        b=s/qsP3xu6Y/1csRPg8f3mO809w8fvSIQqteHULUf1zs90LU+FnCneSFCulCNvxQjlx
         NvVvMeZLFvpr+Sz3p5rHyPTzYInYKUZmpkCyk2KByWidaL4AlfXfXPXoCjKPtxyGUVUP
         7zd4dnjrjY2fjIP9Tt3UurKpKJOse/bEHPoatGp4Wz/fbxEwjV0tauJCcE3/HBiPtZPF
         NuYSO9G+mBvj8lNO3lfqtjTPxe+IrdUI6B43MceI5F9it3ggwIue0GuGT/IxHQOfi++f
         BRqYHZNxZQhO4/XVm5K74uOPeg+I5LSXgMbgO2zVgkQQfBaF2qP+23k8QlOOI7a1p3DA
         TJwA==
X-Gm-Message-State: ACgBeo1rrWlvHqhLU9EnqS++o/j1VnaWqWDsH3/cAyyUp22fu6Ez7M7T
	MfgNYX/zalR3XantWHlCjwEKOw==
X-Google-Smtp-Source: AA6agR4PksOGChEzlZmHfYqVAO3icSi/6xHuDhyAO991X/YapRhAqjqHkJbNMMdn9RTr3ycRSxWiQw==
X-Received: by 2002:a05:6a00:b41:b0:52f:59dc:75 with SMTP id p1-20020a056a000b4100b0052f59dc0075mr48945533pfo.33.1662366704155;
        Mon, 05 Sep 2022 01:31:44 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y3-20020aa79423000000b00537dfd6e67esm7089721pfo.48.2022.09.05.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 01:31:43 -0700 (PDT)
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
Subject: [PATCH v2 4/6] soc: sifive: ccache: reduce printing on init
Date: Mon,  5 Sep 2022 08:31:23 +0000
Message-Id: <20220905083125.29426-5-zong.li@sifive.com>
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

From: Ben Dooks <ben.dooks@sifive.com>

The driver prints out 6 lines on startup, which can easily be redcued
to two lines without losing any information.

Note, to make the types work better, uint64_t has been replaced with
ULL to make the unsigned long long match the format in the print
statement.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 drivers/soc/sifive/sifive_ccache.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 0e0eb85c94d8..401c67a485e2 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -81,20 +81,17 @@ static void setup_sifive_debug(void)
 
 static void ccache_config_read(void)
 {
-	u32 regval, val;
-
-	regval = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
-	val = regval & 0xFF;
-	pr_info("CCACHE: No. of Banks in the cache: %d\n", val);
-	val = (regval & 0xFF00) >> 8;
-	pr_info("CCACHE: No. of ways per bank: %d\n", val);
-	val = (regval & 0xFF0000) >> 16;
-	pr_info("CCACHE: Sets per bank: %llu\n", (uint64_t)1 << val);
-	val = (regval & 0xFF000000) >> 24;
-	pr_info("CCACHE: Bytes per cache block: %llu\n", (uint64_t)1 << val);
-
-	regval = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
-	pr_info("CCACHE: Index of the largest way enabled: %d\n", regval);
+	u32 cfg;
+
+	cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
+
+	pr_info("CCACHE: %u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
+		(cfg & 0xff), (cfg >> 8) & 0xff,
+		BIT_ULL((cfg >> 16) & 0xff),
+		BIT_ULL((cfg >> 24) & 0xff));
+
+	cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
+	pr_info("CCACHE: Index of the largest way enabled: %d\n", cfg);
 }
 
 static const struct of_device_id sifive_ccache_ids[] = {
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
