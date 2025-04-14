Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6965BC369B4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJZzO2KRAAbkYScRHT1n8AH8V/LU9Qzawsh1VJGinfY=; b=tVPeCs53xX/fdA
	eSQ7aN3jn0ggFojsS+r6VplzhpvdAkyhOX3Uq/sSbT0hCqv3ZZiFbWdzVVwpbiRBUvTbXrBWHlFdA
	P5o+ciXQR1R+GnTCbp5v4azHLO3YL/aJ/iXK3QONMJ7d8ivRI00Z4N5h6y7V4RgnkvOEWZS2pDLZt
	ga1dil9rkyXbT83UB2BM/KJee/MLjjZv7vBUHw/CcTcmwxQQxGt8TEtYz0NqtfcbQmWbk490vUNw7
	FbtGhb0qaBWFPRK0RC+Syx8c+teCGHvdUbpvvQpdzEHEuG4bifSNxsX3aXbp4FpVy0ykuKiGxGNpJ
	PTceI6lSY9INJLpmFj8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PN1-00000003JWd-23Vu;
	Mon, 14 Apr 2025 19:21:27 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PJ8-00000003Hn7-05c3
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 19:17:27 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d6e11cd7e2so36832695ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 12:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658245; x=1745263045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Gm/aZH/kO5vouQmivfvsOxccJ1q8Se/O3GQobXDRsw=;
        b=Sob29R3uMso4DLFQsZPSCkci5Xa1GygJmF5z+no1bamBbRrmmdDfCHHK/+qmTjaUad
         Ke8cBqleewpVlS5P8BViC9Lx95MIBaW8c/G5x7Ov22USnSqox1ycbSgpCwFjPZ5PCveG
         2tRV5CYXYp2pRw/i8QKsZdJRD7xLONcRljsYrflVM7ecM+jquqt1Kqn973ZQDZBqEEQq
         vfxen4yQrKhPrQhXFtPqPiESYU8wil8YV/MmTXJ1wlkWRntQxbGkh4RYjX3kB5VQlNXq
         eHKPi9qmB/DdUceDpjbApzdRbGh7cC9+Hi0LN+ByyKQrcIT0XCacNNXJatG0NvLGKb2r
         H1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658245; x=1745263045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Gm/aZH/kO5vouQmivfvsOxccJ1q8Se/O3GQobXDRsw=;
        b=Fne3fcRbLSorvlXvV8LircZnSeyjvC+rI1g0z6wo4M12OtGz+U4apxsD16/ECrzVsc
         Xc0hfXrXxIzUOFK+9rUSVx5iXbiO8cN6WTtFV48sgzTsy3QrqPEnWXMLEAlqLQ2xfdca
         wzd/DrR9MH7mkrFtwuoPnseWGIVYL4XInSzqGASGvida4ItIexQ6noh1GKoA9LRMZ1wn
         lcFRh+CuD3avARYaarNHKdENNSzoFWlySdALqoopfgAIvNY+PTSPnse8O2uEx08jsFOa
         vfJcQzFdtLMyTKoorh9lTPbfPJ0LfqJRzBKKO3u0UbuRwsV9eQb2DkAlA62VKvZhotpb
         3PJw==
X-Forwarded-Encrypted: i=1; AJvYcCU91io+Mtd/ZNA0Rb0RfTPYAHgLq3idIy0dcuqjVUVlMysLnQpykrAZRUVkp+TH6yywfd5bcHalOepoAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxU4Wvx4OYdF8Gu/O1+Z/M3ktvvOPXwdOJ1T9qRKKdPcBkfXOwT
	EKqkynGZN9OQzKaSh9o02DHJ3FcK7qNxfr1k7SDghvmmkE/QhrbuSxLH/CziOj8=
X-Gm-Gg: ASbGncs7fzI2OZO7xOoKMsoz2t5WsfuJ/rNYenzVwaGHc6vFiF2WtOgaNhz92zr6Y7x
	VCLMaS8Qo5/JI19j35fub2qLugln1+dwY04EdSfiiNzLaim7qVSrKuiTxLGv+WolXvH0qKfLdID
	9Dq80Eeb4cXfbiCrfabVMMKOdnpLImicrlhMgU4YHIUuTgJstas4SwC5QNynvTJOTa0XZ7k2yM4
	Odtw5UMyq5l97p+84nP8Bb73NpisN2724BXAZssi+pTGddj4CVwPXpMuSOIpCoqDyGqC705eS5u
	hLkAnFOKCYijdpp0opItB3rDjkIHX8WFGbbWHOryzLd1+8j+3CRlbhLUYa3SScrP+bp8KeUrz1R
	PnJKawuDSWAI1LA==
X-Google-Smtp-Source: AGHT+IGOxfDnhHNiznYS8q5dIns7Gd3Y5nX+rCfx2C7pXyEaBqFpX/9ByXKN0AFavSlx3js9Rz+fyA==
X-Received: by 2002:a05:6e02:1888:b0:3d5:d71f:75b3 with SMTP id e9e14a558f8ab-3d7ec265c2emr131876555ab.15.1744658245022;
        Mon, 14 Apr 2025 12:17:25 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:24 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
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
Subject: [PATCH v4 3/7] clk: spacemit: add reset controller support
Date: Mon, 14 Apr 2025 14:17:10 -0500
Message-ID: <20250414191715.2264758-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_121726_063492_56CFB345 
X-CRM114-Status: GOOD (  22.24  )
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

Define ccu_reset_data as a structure that contains the constant
register offset and bitmasks used to assert and deassert a reset
control on a SpacemiT K1 CCU. Add a pointer to an array of those
structures to the spacemit_ccu_data structure, along with a field
indicating how many elements are in that array.  Resets will be
optional, and if none are defined the reset array pointer will be
null.

Define a new ccu_reset_controller structure, which (for a CCU with
resets) contains a pointer to the constant reset data, the regmap
to be used for the controller, and an embedded a reset controller
structure.

Each reset control is asserted or deasserted by updating bits in
a register.  The bits used are defined by an assert mask and a
deassert mask.  In some cases, one (non-zero) mask asserts reset
and a different (non-zero) mask deasserts it.  Otherwise one mask
is nonzero, and the other is zero.  Either way, the bits in
both masks are cleared, then either the assert mask or the deassert
mask is set in a register to affect the state of a reset control.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 86 +++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 4db91c1b1d280..020e751a9f305 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -11,6 +11,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
 
 #include "ccu_common.h"
 #include "ccu_pll.h"
@@ -129,9 +130,23 @@
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+struct ccu_reset_data {
+	u32 offset;
+	u32 assert_mask;
+	u32 deassert_mask;
+};
+
 struct spacemit_ccu_data {
-	struct clk_hw **clk_hws;
+	struct clk_hw **clk_hws;			/* array */
 	size_t clk_num;
+	const struct ccu_reset_data *reset_data;	/* array */
+	size_t reset_num;
+};
+
+struct ccu_reset_controller {
+	struct regmap *regmap;
+	const struct spacemit_ccu_data *data;
+	struct reset_controller_dev rcdev;
 };
 
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
@@ -1042,6 +1057,39 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static int spacemit_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
+{
+	struct ccu_reset_controller *controller;
+	const struct ccu_reset_data *data;
+	u32 mask;
+	u32 val;
+
+	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
+	data = &controller->data->reset_data[id];
+	mask = data->assert_mask | data->deassert_mask;
+	val = assert ? data->assert_mask : data->deassert_mask;
+
+	return regmap_update_bits(controller->regmap, data->offset, mask, val);
+}
+
+static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, true);
+}
+
+static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops spacemit_reset_control_ops = {
+	.assert		= spacemit_reset_assert,
+	.deassert	= spacemit_reset_deassert,
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap,
 				 struct regmap *lock_regmap,
@@ -1090,9 +1138,37 @@ static int spacemit_ccu_register(struct device *dev,
 	return ret;
 }
 
+static int spacemit_reset_controller_register(struct device *dev,
+					      struct regmap *regmap,
+					      const struct spacemit_ccu_data *data)
+{
+	struct ccu_reset_controller *controller;
+	struct reset_controller_dev *rcdev;
+
+	/* Resets are optional */
+	if (!data->reset_data)
+		return 0;
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+
+	controller->regmap = regmap;
+	controller->data = data;
+
+	rcdev = &controller->rcdev;
+	rcdev->ops = &spacemit_reset_control_ops;
+	rcdev->owner = THIS_MODULE;
+	rcdev->of_node = dev->of_node;
+	rcdev->nr_resets = data->reset_num;
+
+	return devm_reset_controller_register(dev, rcdev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -1121,11 +1197,15 @@ static int k1_ccu_probe(struct platform_device *pdev)
 					     "failed to get lock regmap\n");
 	}
 
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
-				    of_device_get_match_data(dev));
+	data = of_device_get_match_data(dev);
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = spacemit_reset_controller_register(dev, base_regmap, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register reset controller\n");
+
 	return 0;
 }
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
