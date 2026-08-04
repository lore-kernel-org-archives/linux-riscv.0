Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69700C55184
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 04:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=26LVEL02KKSvUcjNmcXATAzGsSrXvZI4BxDil5vRQiY=; b=fWRuoIHozm5Lg0
	DSIUc6enKxmJYjU4YJuVhmvDXtNuXbzk8RDFZU1wQyJpNFHDwbvY44eNcuorCOXnkKt34OU7VHVhK
	yuN6r5AYW8IcIHPWukHl1gBZ+eM0x6UhvA3TpebEBhVmJiuVGNSqZdX7OT0zi4Hm18Ix/4WOMi4uc
	uIHMoQ/7Qnr5SCNSoSB1uY9Zi7se/cZ1UcQvrKr52qWwfpwJQOGWysTiKwgHx8UTY5GPPE2Ms9cBb
	4XR/61/tYd2/8MiCRFtEh2g1xoLntl7oVCyU2KdOIRHXzGIIqzm4DJ8XSpWVizf0cYk9d67K/mS+S
	i3J6BerBRL/t7yfwOOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6nm-00000000zPP-3g4b;
	Tue, 04 Aug 2026 04:30:54 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6nl-00000000zP5-1YrX
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 04:30:54 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso32041615ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 21:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785817852; x=1786422652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7yaXhmEwb+mJHwyLaCJwLr0hoYPttqtvD7BNNFbot6o=;
        b=p86tUt07FshIKLwc00s9LDRHUnHerF4Jmdk1x0hrUdebBwXCT0LOQjuE10RTdv3bdY
         auxYXTC4jz7nDSJH1QgTngtNKRwvB3t5XPumhnlUBcasRVl34NkUKOK/zU8a7RblmNk2
         6rKf0Y0D+/0bhs+tY+Hj/1OjEgv/pt/yz4suRAuBW9o4UM6kRD9GrbJgU90x9Hd8uka9
         s8caqsorB5dtlGowdYAaSgDO70chc1dvG7y/ZiZio8xX1c/mF5CVXD2Hncjpjp7NkdqG
         Fa0YRPhw9/tOnd9GahqfA6WKJG46cAnGMigLJdjxPe7AiBiWPsirSVpq+MhhNFsz//Bh
         ZWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817852; x=1786422652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yaXhmEwb+mJHwyLaCJwLr0hoYPttqtvD7BNNFbot6o=;
        b=gkspB+MVYzUBM8RBEa9+PmwMWkP9wDedgRyN1BjZXsRrInn0FpNsq9Rwlnh2izkZkq
         qEtDIzSF3PaOSC7nqrq86UGy6bl2zpGQLGR9t6ZkgGbku0+00Xz1y5t0HQVy4mWk2/lh
         AWNNUheLavwR0ivTlWA7gGJjQStwmpo/Bjre7OrJ4t5HfmiuRwhvbOamsPaMO8ymvdOL
         bMTbkUSmgPIAtE2584abv9ts2zpeoq6mXnkWgEAkLtVzTHs+UPkxnxUJfj7kS2zkCKTa
         xPyd4ovPTMPZe+gcvPTy6pn0+/8ZemjK0NvdNn+jdRfXma9Ok2ytzpv/NB6tB6n+h4r1
         EVsg==
X-Forwarded-Encrypted: i=1; AHgh+RqkztKoeP9eaPAuh0HY9V9HSQWF/hBPsPrVgXnkV/FviAW7tT+Uri4u+yO34zSGU+rzcHRO4uM4xO10Zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXSU4uJGQ7100NQMapvhBBjz62BT+E1GJAXRZ5TU0qtp6xYW+u
	sboU+Q/1A0xlMspzvGOn7VKqAPAPIWGFlTudFZ9aKY1gRe65rNKT9apx
X-Gm-Gg: AR+sD10RrAaUJLLyqRHcbQFpnCWUPUv6aE1eFrRCl19qtm38nnNZC092mhZfcMMt4ZI
	kn3vV6h/OlX2gKqMPEVVHeXWcjkIWllNTnBTXJ6r+X2tcZDTleYWITcZIs/MmyFciTTc9Rg5zsi
	KNH5f9NgbTFXbUImPN61qjjImboncFsS9Woq8e40VaWHLhgkknAK+vbaBKQY2Nqa7KkG9wbHcwB
	TslBzmr/a8jqQ942BMBx20sg3qmDwD7y2ISCnV6WRD0uvTmS98YhPEMf1JMa4lAWMtv1X6G5/Lu
	EZ4DJN8SAHbYkxH1hOB5adpPX6mRNq7mHP057ROjHCvD2QEsGQU1PifOwUN1GZrECU+M19hbaTS
	JxzKixxBOVJOdFgfhgXtiDXQtZoUbioEp1aeduagnaLJ/KYMR222za/JX8P8hKmSZHDF3koe53P
	97FP68Me3h63kqYQppAZrxvANExN7l7y+cQAwTNV8xW7CAIDRu8+/m2D6ucwNvUYXxmYZ8PbQP8
	90EK5SfmF/4ofJYPyO5MWf5XmPDKRESCNpL40FSrPXJKYdIFF1QNx62FABegbGGGUlM5zZVABZv
	GSTn
X-Received: by 2002:a17:903:390c:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d05218984fmr118913895ad.8.1785817852050;
        Mon, 03 Aug 2026 21:30:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae58d8bsm46026045ad.26.2026.08.03.21.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 21:30:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Yixun Lan <dlan@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Goko Mell <goku.sonxin626@gmail.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: spacemit: Remove redundant DAI field initialization
Date: Tue,  4 Aug 2026 11:30:36 +0700
Message-ID: <20260804043036.22065-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_213053_410573_8BAE23DE 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

From: bui duc phuc <phucduc.bui@gmail.com>

spacemit_i2s_init_dai() already initializes the playback and capture
fields after duplicating the static DAI template with devm_kmemdup().
Remove the duplicated initializers from the static template and keep
all field initialization in spacemit_i2s_init_dai().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/spacemit/k1_i2s.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 2d5ea1fd5d49..28a762769253 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -354,22 +354,6 @@ static const struct snd_soc_dai_ops spacemit_i2s_dai_ops = {
 
 static struct snd_soc_dai_driver spacemit_i2s_dai = {
 	.ops = &spacemit_i2s_dai_ops,
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SPACEMIT_PCM_RATES,
-		.rate_min = SNDRV_PCM_RATE_8000,
-		.rate_max = SNDRV_PCM_RATE_48000,
-		.formats = SPACEMIT_PCM_FORMATS,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SPACEMIT_PCM_RATES,
-		.rate_min = SNDRV_PCM_RATE_8000,
-		.rate_max = SNDRV_PCM_RATE_48000,
-		.formats = SPACEMIT_PCM_FORMATS,
-	},
 	.symmetric_rate = 1,
 };
 
@@ -399,6 +383,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 		dai->playback.channels_min = 1;
 		dai->playback.channels_max = 2;
 		dai->playback.rates = SPACEMIT_PCM_RATES;
+		dai->playback.rate_min = SNDRV_PCM_RATE_8000;
+		dai->playback.rate_max = SNDRV_PCM_RATE_48000;
 		dai->playback.formats = SPACEMIT_PCM_FORMATS;
 
 		i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
@@ -411,6 +397,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 		dai->capture.channels_min = 1;
 		dai->capture.channels_max = 2;
 		dai->capture.rates = SPACEMIT_PCM_RATES;
+		dai->capture.rate_min = SNDRV_PCM_RATE_8000;
+		dai->capture.rate_max = SNDRV_PCM_RATE_48000;
 		dai->capture.formats = SPACEMIT_PCM_FORMATS;
 
 		i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
