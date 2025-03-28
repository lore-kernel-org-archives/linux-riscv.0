Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6860BC36016
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 21:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxJ1OMlReK111nsEJZpnNb2I48v1h6B1RtYT0Ztv6Qg=; b=SCSrt0bxVidv01
	ZEaGm11We8IshgCqnmER8BaaXoc19M/GiDIw12SGSCZQcfDjP2B2fWXKbhl20g8KyKMO4pXfdBDLB
	2A2YpgVmTsSx4Y+N9g0kgMIf2XKhjMymPSuuYInkQq1CIDV6MsQf6Y7QXzVV5R/ogKE+nPresfhQR
	CAfXdAlVNYck5ZVIC1w3SO5urupG6xtb6RVw2JUwanNG7CDOvOK6m73aBqTN0YL38KG7kEIx0z8vE
	Lmc6+fUVI254qwK4+ynpc/FKujnLU8CS/TWCA9HH7lklYQFo2w3KmOOdvSTTx53ewmOcwOH8EYSJB
	0c44Uml9QkkRraBgQHBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqm-0000000EJ7Y-1knO;
	Fri, 28 Mar 2025 21:02:48 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqj-0000000EJ5E-3dRb
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 21:02:47 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-85dac9728cdso50419639f.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 14:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195765; x=1743800565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rerGx2TveORsLjDrW3hkWd+yAs+YmYyP0wNHZuEm2gw=;
        b=WJde+pYueJJyUnTdaXifmoNX+dT3xvVkGLpBLv7dUrZBPOsIopnumF1y+8RMGdOPu/
         8ohHQMeAbhtiWE4M3KYnVresL+RUlVn4M8x3BV1/QTSKxh3XM3wiNuyQOeoYiS/lH00+
         pTtInWSC/mxk4/7J9UGGOevF1q89skcrLu3qV/xV5/+sf+NiPao8gXcxc/HbPis3sjxf
         gXWIA/d1x/DC9eQySoTJtAEspJSCKj0kjQg279/3ci+EbJ2MBUBFb1b0R9B1YwvKb98L
         dpL0M4+wwzrDFLp/PZ6ltJpz6z5QxRAGHsPPFB7sO6WiGnGt3m+LNaAfuRh4Zvsdd1ZC
         Jc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195765; x=1743800565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rerGx2TveORsLjDrW3hkWd+yAs+YmYyP0wNHZuEm2gw=;
        b=kZsqSu2X1xaO2A7wdwtlZYiUBwL1tK+bSyya/jMjtw4HMi3BdqMzf2el3bSVN/vIvu
         zuCCOz4y5gTjf4V5221Esfvzhqmo7WdqCus/y+iT/IzBKLpWyb20uiH5y5zLhfawGW3w
         3a/ucc30wSKBGxo6bj4RN8h0un2n0PeIqj2MKcOL+ZPJDus6u3lXRtJD4yK9O4Qu97lS
         Zz1slO5rofW0vRWPKH9NrngV9/0N2BxU/XcvL1ABb3E46gArbjWSYnoCgLXzWBG002xQ
         5eJdBcPCrjzN7LgoYk47zcXlzoTJIV0zC3o9CR4UnDU9MuCBBMxSn6AWWvS9zeoidfwJ
         Uj3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWcqX3YYLNKZcG5be+hqM9tg2kgqcszQSCa8HFD7Nz64h5hzY8OEfzvbeOiflfC7InbwgqRi3EpWrcbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMoIx5NoyARGlYfjfwb+nn9eYWu+N5RdmdgXcKp0vedxYMoCwi
	crCnFXpMLO3nsywd1BPe6l7grfwKTmjHRl3HZ5xP9YcfXcgLHWbDX4334UjGFu0=
X-Gm-Gg: ASbGnctEonWkybX7rNArCvs4i2URrumK0F7Bi7/5Z4SPQhs3FLxop4p/wUN+xRQpM6w
	ypd+x+2YFCBzlw0iiFHNz9d/vQk3yYO6QUDvHTixOu+P65KmJCMEwC/fpWAGwrAv5TDRWjiGfCk
	rd31pdGlcM+TKVfM/v5q8CDBYZUHJ0YNWcCa4Xo70sD/Ixrt7bhYmukH77WBJSW2mHSahXd6g8J
	fkf/rJlfvFrwOygcRWrXgjlNRAHwdgFg8ip8xpeDOHRS4AyhcT5zOvC4IpbKxlpdBmJCDm9iW9R
	KDVk6CjUt2hVxXa0ErKRoP5vRQTpt8ZUVMT7B6EpygQw14KfHcaT85fs4U3qlbBSAJfBAI2aIJ/
	pwqLAOaM7dKq8XQZsfw==
X-Google-Smtp-Source: AGHT+IEkrPw2Xf+zBd0lVIv6FoNOsOZlQH+aK8mKUSksTkEV25RH9WtQ+nDLN/BB4g7AYZH94fGGSA==
X-Received: by 2002:a05:6e02:152e:b0:3d2:6768:c4fa with SMTP id e9e14a558f8ab-3d5e09fdbf6mr10526775ab.21.1743195764543;
        Fri, 28 Mar 2025 14:02:44 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:44 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] clk: spacemit: make clocks optional
Date: Fri, 28 Mar 2025 16:02:30 -0500
Message-ID: <20250328210233.1077035-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_140245_905462_BF0B420C 
X-CRM114-Status: GOOD (  12.74  )
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

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Comment explains constraints on match data

 drivers/clk/spacemit/ccu-k1.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index f837d2c2f31fc..6885fea81f6f3 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1821,6 +1821,10 @@ static int spacemit_ccu_register(struct device *dev,
 	const struct spacemit_ccu_clk *clk;
 	int i, ret, max_id = 0;
 
+	/* Clocks are optional */
+	if (!clks)
+		return 0;
+
 	for (clk = clks; clk->hw; clk++)
 		max_id = max(max_id, clk->id);
 
@@ -1926,7 +1930,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
-/* The match data is required to be non-null, and have a non-null clk pointer */
+/* The match data is required, and its clk or reset_data field must not be null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
