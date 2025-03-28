Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF22C36013
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 21:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vry836bBFYJwxDdxC+lYm3rc5uvTQWaRHSUT2EdG7IA=; b=2qZYDTK+U5TXmg
	ig53JEPYUu0zEMbZEdA/cbmCiJ2zOEpVcs7lQjXteHPpXk6V6vWNblAeafFCp8s37akO8t9uw16Kq
	LR6yPupo/IL8HaS9YRCqrXHmyDkcRdj8ub2ck5qW7VXEFO0GPRpciZEqQ0xK46Ze4/poFE2ps09kc
	4FwCrLrQD7RbKlSXyZQj7ju0ktNmK7SbYVjhcDXqhPc6SwqpKMnNY4sAZmv9pQm2bhQoxGrke2UYP
	dNEijk9zJuwa9QLiHodrWmFR7HCyRH1S+d0fkXdxkeyERcH7F9D0mr4iQvC85VJTUeVBS7zMv2fRg
	GjgEBFIz7XclmsCoUwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqk-0000000EJ6C-0g6a;
	Fri, 28 Mar 2025 21:02:46 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqg-0000000EJ3y-3emd
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 21:02:45 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d439dc0548so6900275ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195762; x=1743800562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIUpk1T7UnnKdNmxEWfla8NigtjlAU2jHuPthzllD9o=;
        b=iRN4qjO339DmLE03Kcs9v7YA91n3FY0Zhi4ZeuFdjok7Ew4ZZPje2J9TcGyIMHPfZq
         6VFaYs18izK57uH+Y5AjQTD+m4hLpD/HeLsN4W16tEWYioD6rt86eOjcxUKLQ2qRZ9wk
         pag/PtvdUeWhz1J4mXT3051GVdIWOM+B5w/IAyP37W2BCWHqVOfPpgT6uqRWoYgbHyGW
         F1LNFn0pbd+d3Mm6V1IL+1HdODZvy9Ci2J6uvKGcpUv5qzTBtajo0tu9+UNamQNoh0GI
         J3uitbXHDNYPS1oYwiFSdvPTYHxmjUdlFmJIfQq9tHRuUgZxXseK4NhDP3WH79yzRj4H
         PbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195762; x=1743800562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIUpk1T7UnnKdNmxEWfla8NigtjlAU2jHuPthzllD9o=;
        b=wa1lfHXKc0bIJhjSaSiCsRb4pfK9uhui2uxyI94TeGcxOoWs8gttHK1XxCsh4GZIts
         7SISCVeOhdnxZFr1kUKY/R3lBiukXnm/wUz8OptghGmEuV+xdkF6aihPAvqzliYLH99e
         UeBbWxHpc4UT8q959vAJcIWily+wpqxNmzAoicmLa0N2yeaefRXKpxmyf3FEnKRaLvjG
         yoa+Ur40xrj9LnVEVOjLWKGJHs/5mSHnxK+nD/rbSydzxQfqlHHypSrnq1sPwtZwM1IO
         g40Bzr6ect+guFA7JpGHOcKvX8TziC0W3nj+zLmv4b6qWgBZOpFIJ6Q9SWLTjI7WHqiJ
         G6ug==
X-Forwarded-Encrypted: i=1; AJvYcCX4HDA6Wag9S4YsDtm+ZyM1XORw5Ac8KfFP6ja3fhv1MPxrM1o/1CG0AWIZL0HsYynMuVWp/+Ub7gltSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YynJ6NPQM6uTUTe9yBQf1cdXeF/0lxBeaX8L8E2WmAypmM1wuMl
	ogN35T1JQp7cG6JwI98Ahqx/WRNm7GCRjFWmfPBMn/TRjZdnYeJjs/qhwNhOpjg=
X-Gm-Gg: ASbGncskWkJaWnzEfuQGkRkv+Gwf4C/bNe+rUUiz8cLBNgyeBpkMijZBDm1oJGsmitp
	s2RYrBoRh4nEf7yTGoGY+tZztsJAcQyK6yaolwv+WTnz+XmdnPKrYtn83pWDYZBMnkWjjOaqLYq
	LuydlLqCD0AVHmupDsWFPpmLCxy/jAyJir755gKQCrn5V01M6/VoqP/jyRCU92qd974T8ufZb9f
	KEdpSDmoHSJWeLaAh+3UJ3E2u/e7SpiqOMgXFh4jJ+hllkJUPMqFL7b+CxU93seObcTgpx7I9NZ
	uoqV4+kBvccEK6V25MoFSBo8oHjF84t0fy3F9+VZHJTlNleVwLDNHAzy5+gEdyAhoQP7fi8yI9a
	Fb3M6mPDjhVQ3DsUgSIbuUYbLkUbZ
X-Google-Smtp-Source: AGHT+IECKvdnGHV+2dD/S9BOB5FzsYtTtuEs5MGoEBeKOGx5i4Vk45Sjo1VplD8ywIkPbA8ikLjZxg==
X-Received: by 2002:a05:6e02:3d04:b0:3d0:4e2b:9bbb with SMTP id e9e14a558f8ab-3d5e0a0063cmr13188765ab.21.1743195761696;
        Fri, 28 Mar 2025 14:02:41 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:41 -0700 (PDT)
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
Subject: [PATCH v2 3/7] clk: spacemit: add reset controller support
Date: Fri, 28 Mar 2025 16:02:28 -0500
Message-ID: <20250328210233.1077035-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_140242_909330_F0B1C26B 
X-CRM114-Status: GOOD (  21.53  )
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
control on a SpacemiT K1 CCU. Define ccu_reset_controller_data as
a structure that contains the address of an array of those structures
and a count of the number of elements in the array.

Add a pointer to a ccu_reset_controller_data structure to the
spacemit_ccu_data structure.  Reset support is optional for
SpacemiT CCUs; the new pointer field will be null for CCUs
without any resets.

Finally, define a new ccu_reset_controller structure, which (for
a CCU with resets) contains a pointer to the constant reset data,
the regmap to be used for the controller, and an embedded a reset
controller structure.

Each reset control is asserted or deasserted by updating bits in
a register.  The bits used are defined by an assert mask and a
deassert mask.  In some cases, one (non-zero) mask asserts reset
and a different (non-zero) mask deasserts it.  Otherwise one mask
is nonzero, and the other is zero.  Either way, the bits in
both masks are cleared, then either the assert mask or the deassert
mask is set in a register to affect the state of a reset control.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Use regmap_update_bits() to safely update a register
    - Symbols are named RESET* and reset* rather than RST* and rst*
    - Reordered some assignments in the registration function
    - Allowed some longs to exceed 80 column width

 drivers/clk/spacemit/ccu-k1.c | 83 +++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 5cadb395a7dd6..9c7c7108cfe38 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -10,6 +10,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
 
 #include "ccu_common.h"
 #include "ccu_pll.h"
@@ -134,8 +135,26 @@ struct spacemit_ccu_clk {
 	struct clk_hw *hw;
 };
 
+struct ccu_reset_data {
+	u32 offset;
+	u32 assert_mask;
+	u32 deassert_mask;
+};
+
+struct ccu_reset_controller_data {
+	u32 count;
+	const struct ccu_reset_data *data;	/* array */
+};
+
 struct spacemit_ccu_data {
 	struct spacemit_ccu_clk *clk;		/* array with sentinel */
+	const struct ccu_reset_controller_data *reset_data;
+};
+
+struct ccu_reset_controller {
+	struct regmap *regmap;
+	const struct ccu_reset_controller_data *data;
+	struct reset_controller_dev rcdev;
 };
 
 /*	APBS clocks start	*/
@@ -1630,6 +1649,39 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.clk		= k1_ccu_apmu_clks,
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
+	data = &controller->data->data[id];
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
 				 struct spacemit_ccu_clk *clks)
@@ -1675,6 +1727,33 @@ static int spacemit_ccu_register(struct device *dev,
 	return ret;
 }
 
+static int spacemit_reset_controller_register(struct device *dev,
+					      struct regmap *regmap,
+					      const struct ccu_reset_controller_data *data)
+{
+	struct ccu_reset_controller *controller;
+	struct reset_controller_dev *rcdev;
+
+	/* Resets are optional */
+	if (!data)
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
+	rcdev->nr_resets = data->count;
+
+	return devm_reset_controller_register(dev, rcdev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
@@ -1708,6 +1787,10 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = spacemit_reset_controller_register(dev, base_regmap, data->reset_data);
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
