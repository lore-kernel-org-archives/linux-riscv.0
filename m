Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF94FC369A8
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 21:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5coj0knIq+L3Gs7DLEmxgfGPku5kH/9il+kLpeBElnU=; b=aW3TqRrGGW1JOK
	8qmDYg+nssV21z3av3WHftGnM614LQ1GFKH2xyZWCRbXusyre+O3ckoWF9hf9/LvTAbku4muzPLyw
	+tzjDzd4M3YFGn/YQxLXeiEhcjozPGq7Z9Hl5OcHDwntVTO56MyEgudmRvyn/MiYDSHndR377+HGL
	fS0/D5cTKEOIQo4VDrZpNPLnlr5hVmd16Bne+B83tJXXmJK2b+Sr4xE6ac6NOJxe8aRljKwjlFB30
	sySXuWlbIVWxQ/6GN4KTrSLSLBZdLnUi7DZxRJKy/5MPXAI+BAjUyOGHKq752IDCcWQtuNe1rfIu8
	MlLkSTJGxGaxdFYJPKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dNW-00000008dqA-00Cu;
	Wed, 09 Apr 2025 21:54:38 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cnu-00000008Yba-2pg8
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 21:17:51 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-86142446f3fso4739639f.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 14:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233470; x=1744838270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vaVE3Er2gRm6pRja50190vA7NVtS7/61eybF5RG2eo=;
        b=yIbVlMNzBLPkYuIL6fXogrluOUhxfSQ+so9OU1+dWrTujXMWJpcGj5VjBiVxi4tiiE
         q9yY2aRmm/fOJXwbm3fDi8Zr9bh7e4oAUcugb42dBtk+jT+TPQGZRyHQ+Kq0KT9n+fC+
         /UjLyPVIuJ0G+nwyr5CdNDKUYivH5utYpe22HygF5U9GxuuZR+X/I+zbre/+0sq9+WxE
         J5ZwJTtdcSMXNucG4piQenNHZz6LmmTyW/uPDeluU/ZWaU9Hnpdj6zU2ZVBaOpOxee+M
         n6qFOzSH5OxPZV+dfZOjgNFptqvLEL6x9SRaOA6kIum990DZjvsIrOCea6NzIAGdQ3IZ
         dgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233470; x=1744838270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vaVE3Er2gRm6pRja50190vA7NVtS7/61eybF5RG2eo=;
        b=ioTk6VUgmyHXMVRPL862AA+ZroZHhULP1R37cogX2OFclZEckXeP+RTs+Sb+Ij1hxi
         GsEOjQPVEEDvm5BzjF/lwaVucLA2lSadVV+uiazh4HGyJuR4VCNBJl5W7IAonXvPPYZc
         jkWIbYgTTnpTM+3Vf7dj4eRXWMcn1wxU5YNDJhu9XWMlk9bM6FJ5EaRvwD4LqWC1R4im
         ShCXcxLBRO5yju1Cv7sM0MC4i1uStTkAiBcb99e3Y+cXvE1cLktAUrwe3Llbgm440WYk
         U3OLHvaex2otfF1zOF+ic5O9xHPY+maQaU0mq6+UALr9IxMMv+xbo950W/J9D9PGFVjj
         KIlA==
X-Forwarded-Encrypted: i=1; AJvYcCUC5x8gWPb0MrE5WjcDuEO6X+kiQ8zXP6yRbI+kk2k3mmwJ+wNmjbc5x7Il0z34OuaG6j77yVw+UDo/zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmiVHzO0CSn9MWnfDDdQrStMVwfgWOD43Cp/bb/X3LFpci9AuL
	y8yjSdN1HqJe2ttdNIuUo78fIlNWeZXhzMWllvdKMnpUnbu6WyBVUr8VHNKAUHo=
X-Gm-Gg: ASbGnctGlmi9gI2srJYtWDQzHeN3vZ25pYbjuTWDL0f3FUqgtfUjuThaUvGR/xOteip
	HsADFe+ofHBflF7Icb6PP7xKbkXqm3Sgl1XLziZM5zXyEL23R1bQ+vMLb117sDnWZY5Zmhc27PZ
	CzsW+YzWSzNE/GQqkdr+q/mH59SqRiECt8uvnpGZYuwCBEQgj0H1icigOI8rTEUntEMatqGlKj7
	z3O1syQ/gVw2XMriIfxfkPuO1BtTwmm+LZ16rgRyxLcxmrN0AigWauJlwS+oL23IRnmmlqUfM0K
	tkK5lk7FIsZ9t4x3+f1/A1ap5XTu+PxcgFOLdUG7DF3tvlLXZ4GvHuxdOOsbhFujPVHQolMHVq2
	OCOCRNPw6ZeG5Yg==
X-Google-Smtp-Source: AGHT+IEBY6acRolvlf2WpeIkQxW3UfG8KM2JL9zhL0q472AEywVb8BQfsGSSvLHW9BgVjXxwqB9IyA==
X-Received: by 2002:a05:6602:370f:b0:855:5e3a:e56b with SMTP id ca18e2360f4ac-8616edd5b9amr43972339f.12.1744233469422;
        Wed, 09 Apr 2025 14:17:49 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:49 -0700 (PDT)
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
Subject: [PATCH v3 3/7] clk: spacemit: add reset controller support
Date: Wed,  9 Apr 2025 16:17:36 -0500
Message-ID: <20250409211741.1171584-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_141750_711821_0C9E53AD 
X-CRM114-Status: GOOD (  24.10  )
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
v3: - The spacemit_ccu_data structure is now used, rather than
      creating a new ccu_reset_controller_data structure
    - There might have been a few other minor changes, but generally
      all that's been done is a rebase on top of the new clock code

 drivers/clk/spacemit/ccu-k1.c | 86 +++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 8a8d228b46c3f..2a8c514be4b2c 100644
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
@@ -1200,6 +1215,39 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
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
 				 struct regmap *regmap, struct regmap *lock_regmap,
 				 const struct spacemit_ccu_data *data)
@@ -1247,9 +1295,37 @@ static int spacemit_ccu_register(struct device *dev,
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
 
@@ -1278,11 +1354,15 @@ static int k1_ccu_probe(struct platform_device *pdev)
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
