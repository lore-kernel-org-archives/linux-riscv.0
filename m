Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8AFC87FCF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 16:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/YqsTMh/A7E0hxuCFylrDBNpc+4prmP+QqcTowsKK4=; b=ic82PYUXkGmnyx
	HgSvI7Px0bJuq1qyKyIck8u49RlFfiW1JzaYNSkVZyZxIwGdOqefshNvQ4qnr36aX3X4giXYX05mH
	IW6kaL7LLSOAcrokinmJLp2gGGR5pPThh6zO1VRF9VqJrDkXoX7UWyvixuw9Icjczsz+DDLu97hss
	h2CtU8QjfRju9v5LxUUbaitP2dDOjtpKmYC9hFHNL/pM/ni6AkYbicWHpDtRhHOlFvvm3pjeizNYV
	oSqflY0iqu46ZXw4RvTqBJqs9Skr16NWAfE3ymBjmySzjH9Tmd3GhNCPVRT+QdfjjavmEP93pY2A8
	lRpPBhqO1qWyXEF6Io9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEWZ-0000000ERq3-15QV;
	Wed, 13 Aug 2025 16:40:27 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE9E-0000000ELeE-1yVd
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 16:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=n7haPBNNPZKbfEGBBu257LnsLaghb2tV2gNrhiHCuVc=; b=UkbA0g
	Mvf03QX4hgcVBPlTjgVR9x3M2VX+A4xm+M/cT5ld0qw+Ue827U5OWtUZ8xmLm3n5
	txpVhgOrfGTZzG3i3aCNdwgp9bUYhmffD/hc1mJimCZ0wN+XfUuLckfhfI5UlBsC
	nC8Sl8b1EyAHFSEjnFwPDa2rzE1cNXjnNPJKERidPLqvkSFclrelb/vFrizi8qXV
	BmXx/adHg5c7geyGDFXDtJ40kHfYd1bezGak0BEdfLwvBe/4NccggXlIaqDyMDZc
	Vz7BLV5DpIgXuGsemEDHS2wmELCbmm/MtR5xZvr8AL6P3Y2HS33nrlqPPy9J8vbM
	4Bi0o3kNvb48OS8w==
Received: (qmail 694641 invoked from network); 13 Aug 2025 18:16:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:01 +0200
X-UD-Smtp-Session: l3s3148p1@lTcFeUE8IJVtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 03/21] gpio: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:14:49 +0200
Message-ID: <20250813161517.4746-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_091620_797490_E46A8187 
X-CRM114-Status: UNSURE (   9.55  )
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

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/gpio/gpio-mvebu.c  | 1 -
 drivers/gpio/gpio-sifive.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 5e3f54cb8bc4..261ffd0c614b 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -602,7 +602,6 @@ static const struct regmap_config mvebu_gpio_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 };
 
 /*
diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 067c8edb62e2..98ef975c44d9 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -174,7 +174,6 @@ static const struct regmap_config sifive_gpio_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.disable_locking = true,
 };
 
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
