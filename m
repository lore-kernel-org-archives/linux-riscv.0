Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C236EC54F54
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1DFCvX0RgEcqQEYPgTvabwUrU4j2yV1gOZG1AbGUE0=; b=AoUfnuv1Jik+Dd
	KK4StN4hN+Ju7TD4u01QaRPBWCe62NI2XxKVKqAwsIBoPZ967yFGRYBjHw+UaZ+sJ5U9iofLSS2ML
	1VsbYY6hlCRltrhhnbphLdNd6pJjWWioIX8X8hYvF/EHuNJFNIs8muLEf3UDz1H7SrdKUUtpC9Got
	dIuan3JUO7XvgvkGkjCrQwHEJMzMztqHeMhNzvGQHn2MlDdhd7X/6RCBs2vWKPXpwhtWLydxN4zzV
	xkgNHJlon4gJbUG7a2TaEAV7aVUYQ9vyP8s/2h8GdNEzrL9+bdA6VMwacwHkJ+nbftTMssNGtbrHF
	T/0At0b8lufpgSZ0jOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkHo-0000000CIGM-1h2K;
	Fri, 31 Jul 2026 10:16:16 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkHl-0000000CIFH-0LJz
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 10:16:15 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38e041ea211so933400a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jul 2026 03:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785492972; x=1786097772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAZMksOYurF3tSXLo/jShDOr9iNsQwZ9titE58N+ejE=;
        b=n3S2etT9wJIv5Nw7RUTOMRy2g3yh+kfbklWHCE/1AhULajBSVhGW8O0Ttnc2HAiZbD
         5RnEBGbMi4ecK2Op1LEU/yRRxOT8jkh7Qd+qvXA38yf2QtMjZfVX+8lQ7Pj9bJC/deFj
         aq4dDcxmTvt3VALTnbCfSdsqDReFigm9xKL5n2RR61Yv6cF7/e9Nqe4yUIRkwdenxfY3
         inD69YQRPvijLIwegKOq6hN7jd9ZIp81WPgf/QUhFZ/M6HHC+u2t+hNy2zwrXg5eNnwz
         kApjcF4AblgyQtR+YincV92P6FTWzL/Ygs9XMDQ+yB007t+vjzhkWAdmLYNiDh+NB7/0
         NlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785492972; x=1786097772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAZMksOYurF3tSXLo/jShDOr9iNsQwZ9titE58N+ejE=;
        b=QDnA+OwZnboYetxj7wg1lsouM8xE2p1bDtXncewXOaJrUZyrT/W+Nvmv3+Hoy6KNnO
         +aCMGNMq4F1OmpAqrcq60rkdDwRNa2zliCfSKwDMjl87mn/Bp6hSK/0GpDanulkdutcE
         l3xg9ADRB0w+yhaSwLwW2gjfx/OPwUGf0YSCXi+mouScg/bg5T5KgTwCj9ueuYQtHIg2
         9YTUewONMpl75A/ejjlLwI0v4NDu3lEboEVmNQ5LRvDSNe2t9dKKzWeIsb5Ehl86o+27
         ImcF+K4EcUtF8Ti1mxmh11lAisOdRcH6d1slpGHB/bmRUaM7IX8gbMwv+9lsvxKKRhBE
         ANEw==
X-Forwarded-Encrypted: i=1; AHgh+RpwpYaF1QNs/cCeYhJBqhdkkTkMIXQxHhGIrQADduwLkvYgp7eX0TSv+SbAB/+RTjb0Vxsr2zVeT9KLgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIDPFASNfJSB6E7GplIA7Tl7fjSHX0GHyOug+cden8xhdQV4kD
	T/MdVj0QyhIlZnZW6BLNUoBM3uIm7WvPYKh2F0WjNnoU6/a8C0pQRKJb
X-Gm-Gg: AR+sD12hruW570IuF5EXfAjRv8qilpGPmLhX034mPkovr2PjGoATY/vDQn3pKz+W+2+
	wL/cUSGYdgA2NHKHaobqotgHnz6uvpuj0ZarVT9DeSIlJJqj5IcXwuBaCNBTHFCyXj96ozD3Izn
	DDjnEyxVHGK3dYYOO2EZH9aBIwlRJKCYFnPRnZb5AeQOXvTjfS4lkcHEhRC7yoYKQrIaqsFPu6I
	mmSRuhjurmrbFOLqK30NcDVqg+Ac0ZtEG775T+8XCLIWkfNpk1sF+a6B117LzmmSREBK8ryBlQW
	Q4ljDTvRz6W1RMkWvYjuBh3Fo2EqUPngOfb4QQUoGoa3Mqdn5wdgItBwJJGXBZvZg/7jIhURfxa
	AZJSx2vYVaSETy6UHw1wtZEUYKsMdQaKaHqtAoadAqVyNv60lBJ6M6vA7h/9WjUZBDKC9w+VqBC
	2QVzdUSnL/5HY9BdthXLUjgw4owYZcWkyzkO1hZ43aVnr1b7DuIPb2NFv5HTK2TAOPdE7ewEq3i
	lmBYHPDdYKRkaU6GUYraVCT3LLo3MBveBtGqsWPRhAqcqk3UjRqi/rGGkjltNqOmCB6auGQsX6P
	HATf
X-Received: by 2002:a17:90b:4cce:b0:381:cef1:11bb with SMTP id 98e67ed59e1d1-38fb13e74femr1383086a91.22.1785492972150;
        Fri, 31 Jul 2026 03:16:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2ce28c7sm509733a91.16.2026.07.31.03.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:16:11 -0700 (PDT)
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
Subject: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
Date: Fri, 31 Jul 2026 17:15:39 +0700
Message-ID: <20260731101539.36290-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731101539.36290-1-phucduc.bui@gmail.com>
References: <20260731101539.36290-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_031614_674361_5F535FF5 
X-CRM114-Status: UNSURE (   9.43  )
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

spacemit_i2s_init_dai() takes an optional output parameter dp, but only
assigns *dp on the success path. If devm_kmemdup() fails, *dp is left
untouched.
The current caller does check the return value before using dp, so this
isn't an active bug. Still, initialize *dp to NULL upfront as a defensive
measure, consistent with how core helpers like _snd_pcm_new() handle
their optional output parameters.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/spacemit/k1_i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 64510c9a1a89..23037fa4233c 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -382,6 +382,9 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 	struct property *dma_names;
 	const char *dma_name;
 
+	if (dp)
+		*dp = NULL;
+
 	of_property_for_each_string(node, "dma-names", dma_names, dma_name) {
 		if (!strcmp(dma_name, "tx"))
 			i2s->has_playback = true;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
