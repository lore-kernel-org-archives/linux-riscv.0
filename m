Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E7FC25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 00:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+tKL9jjYejHP0VWNaIdOV2jE3K2CkUyAD+lQ1g9y3tM=; b=1spz7nmKVRj9jL
	wSF90aUzoQpBebkHho1/I/xF15Q5Ds2jOlq7fFS84FtYWOjvWenjlS6IQOz3bnD+G1e1v/v07eRNW
	8P4amVN0SVPtQ65o8GueODifElloCLGPBJPRQ6SEOMS5WDs7URFJ0rWblJ1JT9iFoaquRHBnpTiXc
	nvUpmig4tAc+Y8aiUf3+Ao9+gMtX01wQwJB6uDTwnoTrmpQWAJKOvTM6vHJ14Kc43FiYCNeldJBA2
	lkLe2nMdiXlot82uwYjWFqX+Axy0Oa0t3kCMnGc0sAMO2LCG6WyZ+v1csubXnVUxk7UJY5br0Kf3R
	U8kf5q0fGhglc5Rbq0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBkUF-0000000GfNB-2iMn;
	Tue, 28 May 2024 00:14:43 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBkUA-0000000GfMQ-12K5
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 00:14:40 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5b9794dad09so134959eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 17:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716855274; x=1717460074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtU4Y/eRQ2OBmokCMjLNZWabCaVyZYO3DB4JfpF3nAY=;
        b=a/GHStp5uAFNDzhuBZzWLFdbulMCm55wRqC1r4+l7AaNRPI74mTTkTvAxR+qHcYMd2
         NrMfjpzPC+6tLImWMwrZCGpdkvvwqAL1uPpyo7PoBGnS9NV3XoKZFoqreOkNhTiuQ2Ui
         7P67tLOx8q8OQYv1+cK6deWY+/7+ZFA7U9LJOrKDj17ZbmMPCX+uFCyGYL2+0MhubEdi
         ocwJbzA4gFl2emnxLZvG/29cVgzHJC6uJ8cFzMcOFVh0PtgZji2xsw5e8VJ0J7BefivA
         1YPiPO8OJbPLSLBRw/ddesNGTAXcuenv4qPGps1xyXkpbHTmKXORehhaPbzz/S0p5Uvc
         aqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716855274; x=1717460074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtU4Y/eRQ2OBmokCMjLNZWabCaVyZYO3DB4JfpF3nAY=;
        b=c3Z0xEQtO/jUNYLVdaHy2ZQ1eUoAlgAY4tGNfwOkjVW1tsOh8OhTkSPA6unJ6Eo8gU
         zCXMrJWHCXEMRNg3K3lTDIfYRUPhkZmaX1a+O+BFR74VPT44vbeWpFjnP2KLTMh3kxtj
         g18/X+pdTV/7BuAUDCrrHpvFUoSANbhz7XMQb0dhiVcfutnz9DW+OpObJWQMspG8cupN
         LVQ+jBLZH+fbXA/2Flz+4DOQVB3lQrL2/dvpAG7FoIqtVCl0owa30x9vqasepzF+biJm
         cUnp8aQ5bMS3PuvLLIpVXGVxu38XSX0470uQzmM+MFs5q4dSFoXqks4JWkvbRAV4/2A/
         zq/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJrVI7cADQGkD02OKAM7Llk2MpI3qm+vY9H3og6GqesGkFbTDulXHlo0m6TnfQHSFz9wbnvJUBqDLSOExiZArvLsH2hRXE4NKgEcEM7b5G
X-Gm-Message-State: AOJu0YwxSElk2cHfYShz1HuDzdfgWgyt93IXnProPjgITPZhgX9SvRJL
	7KDZm5wpyonji3btborrRwLLiEEgDqRTx+KjdgpePnqkTayfKFePaGmlxww5WTQ=
X-Google-Smtp-Source: AGHT+IGxwhLw6BTrQ2V9xcN9eZHUbmtBeH0DBK7jsO/MxRI72pCJIA3N2I2HkR6izN4ncWAVY0y9bw==
X-Received: by 2002:a05:6358:4688:b0:192:ce79:b64 with SMTP id e5c5f4694b2df-197e50f4911mr1498831955d.9.1716855274176;
        Mon, 27 May 2024 17:14:34 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-682226fc4dcsm6536043a12.42.2024.05.27.17.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 17:14:33 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Russell King <linux@armlinux.org.uk>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yang Li <yang.lee@linux.alibaba.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] clk: sifive: Do not register clkdevs for PRCI clocks
Date: Mon, 27 May 2024 17:14:12 -0700
Message-ID: <20240528001432.1200403-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_171438_327942_85B0268E 
X-CRM114-Status: GOOD (  12.98  )
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

These clkdevs were unnecessary, because systems using this driver always
look up clocks using the devicetree. And as Russell King points out[1],
since the provided device name was truncated, lookups via clkdev would
never match.

Recently, commit 8d532528ff6a ("clkdev: report over-sized strings when
creating clkdev entries") caused clkdev registration to fail due to the
truncation, and this now prevents the driver from probing. Fix the
driver by removing the clkdev registration.

Link: https://lore.kernel.org/linux-clk/ZkfYqj+OcAxd9O2t@shell.armlinux.org.uk/ [1]
Fixes: 30b8e27e3b58 ("clk: sifive: add a driver for the SiFive FU540 PRCI IP block")
Fixes: 8d532528ff6a ("clkdev: report over-sized strings when creating clkdev entries")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/linux-clk/7eda7621-0dde-4153-89e4-172e4c095d01@roeck-us.net/
Suggested-by: Russell King <linux@armlinux.org.uk>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---
This change fixes v6.10-rc1 boot on HiFive Unmatched.

 drivers/clk/sifive/sifive-prci.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index 25b8e1a80ddc..b32a59fe55e7 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -4,7 +4,6 @@
  * Copyright (C) 2020 Zong Li
  */
 
-#include <linux/clkdev.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -537,13 +536,6 @@ static int __prci_register_clocks(struct device *dev, struct __prci_data *pd,
 			return r;
 		}
 
-		r = clk_hw_register_clkdev(&pic->hw, pic->name, dev_name(dev));
-		if (r) {
-			dev_warn(dev, "Failed to register clkdev for %s: %d\n",
-				 init.name, r);
-			return r;
-		}
-
 		pd->hw_clks.hws[i] = &pic->hw;
 	}
 
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
