Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F364C44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCw0ODhCrupzLVnNMTVM83c4fFSgQiDcEy1tUpa/haw=; b=EfwJi8SlrGikPv
	RsEUfQpwYBXMuk25jOHkfpPCvS5YCOH8Gy+4KcxGVTAc99qynWPPiA1IHdv0YkXQOj2CAmbtELmwN
	AZUPdDNzGGe7BphY9Zg7EzQWh3B9oC+W6zcOPW/PQWrsJxEomUWCSg3gE8UTUoGhK0RS7Sv9W+bIG
	qWS2kMv+lVzLV6QlQHJwLKJxPjuSMh2Vfks53/CeLYMeLYlmVZJvvl6ZluUsGbjugCiXIOcprwrUp
	Yq6onMseiYs2m6KX8rCF+qIR9JDTBAVHJQVppWWpOwCqIVeOa9K2KfzqcLTXCT1BxTttkVcbiyZGH
	+Sl/d1T13zAjLTPqgYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vip97-00000006Xew-1nmU;
	Thu, 22 Jan 2026 07:30:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vip94-00000006XeR-1Ywr
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:30:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a0a95200e8so4797445ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 23:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769067021; x=1769671821; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8p3LGTyptRJ/1/i7rxaDyy2ppqLP8OP36gHwpWf/wko=;
        b=TAt0r7zBNtvg2HvY4cmnoMoqJuiIYgeaEkRQFjKQqWkCsbXRJTzF12DqQRjPpigNW4
         fkoPo9yHZPcAzkOfHh3C3H4DDVvCVZowSJRhG+cP1N2EmZULD026wWUdQNZ9HBKFjoGZ
         7Rj233iJuNAEP2lloBY9/U70p/3xaWINxZSJz2d5P86cGvyLlq/SSqE0187hdhh1dTqU
         GRvvWWx171th8+AWW1eCk4N7g/xSDiCiXm/aGdhbmDWKq4gSn+OpntfBS4ahacvbxNfu
         DMy7vu3HfJVc0vHhpwKFvd+h2qWV/1nQOUTHf1ax3/bvYvreplxlASdmPl1Qg2l/tJMt
         yLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067021; x=1769671821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8p3LGTyptRJ/1/i7rxaDyy2ppqLP8OP36gHwpWf/wko=;
        b=JgFN/gNThWGB1h00TCNCn6xD7mqWwN5hvVV85BVAoJNTLoNemEy/vQAz9ZdTXlb49A
         lfRqhd8UvnQpKy6xVJZAZNnXwgIgAtcC52+GBeK0pMH+rygXXZke/PVR+CTWAESufRGB
         VxxKIYUtJszOmph8UxQRTxJcRzaKdLALz6g5RvPPgOgFacL0PjJjUz40qtxWA4UT6re2
         MuF68glm80zXAj7wODWbVYlS/mkOKTGYFOsjuItBWx3xfByyRfgawMFbpshZh2kTdk5A
         HXVGkQir3BfBH11KDKkObwtJJVQS0V9Vhw8cUk+0tYa2puFX6/KnNyZpdZT9U+/aPnD3
         skPA==
X-Forwarded-Encrypted: i=1; AJvYcCVbVGqWOkGP6kMvJHFoAgWGj08rr0m4tJd+hodx6ayhOJvSuqetIVfbKUmsZOwBcde9s4DjGFnMloGQpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzB9viJ9y6eSpJc1DLU5cexubDDuKPQ8yJQ+tehOeN752L5IR0G
	BYW3XJLEXLNlhjBTzdLBwQfEk6cPZAKZuFiPT3fk2VpNmGPGyldEVFM3RG+wKct5enY=
X-Gm-Gg: AZuq6aJoSR/q3NQurbj04edB0ZoYqHeSC9xsCzVME28So8w7/E9I1J+FOq0U2EOnYCW
	0+14TuUZK5Yx6VV9MfKk0tIM0HalGx9DspzpXN0ZcFj2IXyRO4r3OkRQPtWzMMqy03gyBcyOo7v
	2NdwSnDqSs2SrjsPmmJrWy5jEHCy/5TW/E8aXHWdFPtiKtrH4esj4mKSnL6xCOStTGZbreYA68w
	Uh+YvdAA4RuZJycmFxi4N0tlFMkZrSVR7qR+4mGq4sveRyIGYVER73NSlU5JVNPjoBZZVaTeKwx
	YVbyBMkGdN47ihdO/NwHGke0RUSexjxJxyVANuFtVKxUmdIko+fxfwbeXnQP64+2zZAZe0wDmt1
	d66j2A3IE39yIrGePfKbypghR+B2Vko9FV0mTTmBxy6jd9qbT4t3NyjDLll/g5ZBXdr54vMjsTD
	vkP1p+P0lKw7bMeMmFyutkZ5cZFWmltco=
X-Received: by 2002:a17:903:22c5:b0:295:c2e7:7199 with SMTP id d9443c01a7336-2a76ad6be42mr77946605ad.29.1769067020954;
        Wed, 21 Jan 2026 23:30:20 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm171691845ad.23.2026.01.21.23.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:30:20 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 22 Jan 2026 17:43:42 +0800
Subject: [PATCH 1/4] regulator: spacemit-p1: Fix n_voltages for BUCK and
 LDO regulators
MIME-Version: 1.0
Message-Id: <20260122-spacemit-p1-v1-1-309be27fbff9@riscstar.com>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
In-Reply-To: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233022_423784_336C400E 
X-CRM114-Status: GOOD (  10.79  )
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

Higher voltage settings were unusable due to incorrect n_voltages values
causing registration failures. For example, setting aldo4 to 3.3V failed
with -EINVAL because the required selector (123) exceeded the allowed
range (n_voltages=117).

Fix by aligning n_voltages with the hardware register widths per the P1
datasheet [1]:
- BUCK: 255 (was 254), allows selectors 0-254, selector 255 is reserved
- LDO: 128 (was 117), allows selectors 0-127, selectors 0-10 are for
  suspend mode, valid operational range is 11-127

This enables the full voltage range supported by the hardware.

Fixes: 8b84d712ad84 ("regulator: spacemit: support SpacemiT P1 regulators")
Link: https://developer.spacemit.com/documentation [1]
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/regulator/spacemit-p1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
index 2bf9137e12b1d0bc7a857213d77f05387536fe17..2b585ba01a93d0ce163c33e14c8022a506bdce11 100644
--- a/drivers/regulator/spacemit-p1.c
+++ b/drivers/regulator/spacemit-p1.c
@@ -87,13 +87,13 @@ static const struct linear_range p1_ldo_ranges[] = {
 	}
 
 #define P1_BUCK_DESC(_n) \
-	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 254, p1_buck_ranges)
+	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
 
 #define P1_ALDO_DESC(_n) \
-	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
+	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
 
 #define P1_DLDO_DESC(_n) \
-	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
+	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
 
 static const struct regulator_desc p1_regulator_desc[] = {
 	P1_BUCK_DESC(1),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
