Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F97C369CF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 14:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3SJX0hjxD/anW3aaTkLosHQAFPjzTOn9mxhDZATVQ18=; b=BxC4d3LsjHnr/+
	iFSZ9kPmNcbP6U9Mmu+9iVwzAWQCod1lZ2J4rnWPFzYzeM77gr3xFmialmd0PMIvyqzKv86mS1PPB
	P630SI0w+ZnUTL4Lzqakbk3Q2xpdx1dA2pc3Q54R9JMXmoRN7cW9VOtFrQbVtZIWYjf5lPRZMuTc5
	DqWVu1KCOnX/tXB+yZEhog0DGB+I82El5Pk4QBr52AHsVc0XxTO2tose9sgzeUV7YvTWFAwn9bVGb
	V2YEkU1EdiNnxpY/iSuNka+SJN0Kvk5C4+5PzAjBh1LueFuW0Bq5qx/+e+mfeIM6HNzGXremU2rX8
	sKZLeG8JXuLd+qrL4Fmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n8D-0000000GX06-3MMz;
	Fri, 18 Apr 2025 14:55:53 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n6Z-0000000GWQ6-22V9
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 14:54:12 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4768f90bf36so17979841cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988050; x=1745592850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaw5lt81qT1qo0WLXCCCbUzvwZO95HiGQh1l0h3tFD4=;
        b=IQIIoC00NROiSt75N3VN9ciRtbCwdMWoLGSpIX6D/Aam7H0ucvbfRvGWIx74zH4EDV
         pIGS6ZLVtH9OW/51PHmXqdMdFujezAO05oK57lV+qlIYICo/S0gLv+8NWRqORdQiIPYs
         TupByMlK5JzieJyB16exC0vT/WbDxDZNKikRLeuZnciUSaY0GLvi3uL6w+eklC0dMvCT
         bU0fYzF3yitlzHFzNzB557pjtoRpfQ7oPQDF/OWhcifIqCz2/gU5hJR7b8CGDS8ccq/F
         8KXcv0u/oiZqfHSguuvB6C46JEcf5InMjR9pmn83azgMtVfoiNDgZN51++reOpsadcmR
         Y5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988050; x=1745592850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaw5lt81qT1qo0WLXCCCbUzvwZO95HiGQh1l0h3tFD4=;
        b=YgBFgrC3niu0u7n/KUZVVLS+JLijZ8m6L3b+yaEYTnDRwRWiNhv3mvEZrBB5Uuuulw
         ADR6bjK7dWnZNZPNExABXvS0w+mcuA57PFS7+Ezjx+2cUQ66BUwonr3IHIO6o/ytCMBh
         /xJpXdQ4PXuQ62L1FDfZYKKZ0F+ow3cjtyXjvb+Hc69fJJpmhLsTIS7H2evtmKtb26lr
         08HGiah/kS2MX6E19A4gzj3QJlNm5lPQsvBG0d1ZYYPri4Ua9AQANxKOrf7io/nyP1Jf
         sbaKy0G1qrjPuBTxSCrwxaETclgZrOS+BJswe6EngwmRYElEgmHB66/oOYZgqSHNyqhB
         9eWA==
X-Forwarded-Encrypted: i=1; AJvYcCUvfDfPsi+26yq5ldMEhkOvhBhQREPO9fdMrlcvg7uEhHjaXds6daQ7azSEoMn1eCjX+Q2YYN2+e3fcYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB65cl6XfIeBMZ84UxDzm3lSWhPHwa3My2+Cql3D+W4y7J2Ean
	twbfpufdqOWDtmiPo/1LQlV17YblcaqVTf9FJFWz0C6Kb7cDJJM2OHsIm5I2dDs=
X-Gm-Gg: ASbGncuuBeJLF6jokt5fdyNAh5ScBy5w9n0wXiV2PYrw8mJPFiOMcU7A6wPBZ18pr1g
	O5+oMYfqjtLJgcqbayC4kTT8qdJ7DNUja0AUnX+P4rVwL/FS/G0fYxdRHac09YOPbgLRpwg7nJK
	RLzvmv/88OT+bBAmV7Y7xjMphAje1nmxoCJUdAtgi3dNq6z59IuX1UlatlECLmruBxdvQUzEmKS
	Cmm+dDsnG+g07vrEf6tEys3rdosywb8whzMjRZypk8I7Yxlj/8pSJ+iJcKvb4vi8bqfM+2eVWLb
	tKMlGrHaP7aBdocOGd4zR1D6wJeFWtcNkqaN3HTtgLoiKbdVQNUrNtE2JjWg2FH2O33jqZBkV5E
	VbO+5sAhmUAcYFg==
X-Google-Smtp-Source: AGHT+IFvYy7PkzuSyv6/DahcPqSuURSVxow9I8GZ9PMmiSUagXcMHnpfEu6YrBdLJKJ9ltUJ181r5g==
X-Received: by 2002:ac8:57cf:0:b0:47a:e70c:e1ad with SMTP id d75a77b69052e-47aec399e28mr54297341cf.1.1744988050449;
        Fri, 18 Apr 2025 07:54:10 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:10 -0700 (PDT)
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
Subject: [PATCH v5 3/7] clk: spacemit: add reset controller support
Date: Fri, 18 Apr 2025 09:53:55 -0500
Message-ID: <20250418145401.2603648-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_075411_527764_CF36CCEC 
X-CRM114-Status: GOOD (  22.12  )
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/clk/spacemit/ccu-k1.c | 86 +++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index a7712d1681a11..9152cce00ce90 100644
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
