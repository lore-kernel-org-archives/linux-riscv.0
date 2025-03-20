Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0F7C36005
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 19:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsZ5hJ1aizUh8rJPxWBP0UfCMK5GdSuU5Zh/UWosk1g=; b=iwj6Eu8bHYxGpw
	wYSz+2aSVuveEVJV7RqLyI5E2D5mXGc3mPdNrTnAusqDJty7ejzU7IEzLKE77FiTOwwGqztvpKW4A
	tBwgCJWWZVeVau/2f7Vna85TGlJ60QIr9uFmlzVinKR0YOIxPsf4B3nkdwK2rBhVkEgndvs8dXg9K
	zFnk937QA934q8lbk9h7uGq9lDQglMKHBrbrpS/jkR5DIuQuQqJ4K9e/1mY1GdSx5RM7frjohNTAC
	ak6oJ67c0a8VxT6bK6ozUfWHqDM3MJrYo0pIegJzY+AgrD2S2VMvTPEOkRdVQNKveW9Y3ZLwgMXdc
	+VAjnXnH457Z0G285JZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvLp8-0000000D6Ol-164F;
	Thu, 20 Mar 2025 19:45:02 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvLp5-0000000D6MT-2hxP
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 19:45:00 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-85df99da233so97662339f.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 12:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742499898; x=1743104698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dlzkhyp/izF78g6ftxTkpFnLH1O8eZPqCB+owD+Ogvs=;
        b=RpjJoU1Etsgtinh+kZ4H+WusdUM/sLGbL3y0X4gp2vgE7Ry72v/t0mKjTsGARJVui7
         NkTl0Uxf1m0yI4RH7+3IPWA/FbWzZNqsHq0wIwElQyHt6CiOiwgNw7/xkha8/zISz8WC
         uIbaVvWz1PushOdTQcmEm3yPrKXfZ3gFf4FHYuyz2HWSoPDVihZRkDNPayxEOZhpaeFm
         eIxTatp8sNZzZW9yYPfxD6ebvwbp/MjezfojMYF2xKMBPXKfN3PGEetHwAoLJ6JdwT/q
         g31coR702Ulj1tDp7Uqs87NCcXrn+bqJN1bMVhx127k2q48luDBingFGMJ1UJTC7Aw15
         Acsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499898; x=1743104698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dlzkhyp/izF78g6ftxTkpFnLH1O8eZPqCB+owD+Ogvs=;
        b=woUQOk/52cozI08frpVx+mRKGy0UN6jgujJoYGQbS72FSnAv/iBKFilGiPsPCR7J2b
         Ho7MLAg1x7KA30NxzQE0FP5w01+UlYERWVJvNZ444YuRcevf725ksjgPai3sTzxLGqzA
         BOahaWh42DxRrz7aOIzjTe8C5WjVNFkvta0v0hq8XGaiMS+FrRFnv4z5C8/7NHrTzFqd
         P7oPbrw+fBsb+Jo1sIGirt5OfOf5/vAGfmj8iPcUbb4N7PebVQxHiSVTJo2wkbQEhmjA
         PpIceBChixKGSG1Yy5en3akZXlNMxg7opUCndcN4cO/3lQUNYBfmcAgp5l/eQXWpQZU4
         8APA==
X-Forwarded-Encrypted: i=1; AJvYcCXXb9Bq0mKyR0t2ZVNloiBm/0G6KXSqy1VWSw+rHJErajdYfKeykTPhvtXNY+ex6sknexu27KqJnDLv7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YycTsj/SQhxrMMNZ6LUwmuRL8ObrNu2xT42dHnoO1XgCr/XuraD
	jA/S7fXCttQe9EU6dOssFDK4RnJ9C9Njf4HSqMFTQe7JbHacmwg/zc6lUe9iHbw=
X-Gm-Gg: ASbGncteslA+NJ5fdUobNA5Eifz+Nuilba+gjngX1yeCmNAwy+8FCfR3gy64IPJGDJF
	wtGPyhVEHAaSlrblfT0TcbSqhf6n+yYVq7/As2FlRWpAl508dYlM+LHD/vNsMFgKowyBHfnHNtB
	zzgXl4BBPzcL8fMTjWMgEgR82D3i+jg7NDpsk1MZWL1BTq+tJqrHH+VrjgKWWj8wgFDwuDFAHuN
	3tsp92EdRr114yxaLUdjMgN6bAmOk/lrsdi59Jns5FpUxxXVKozhAhNW/w2HX7ZN1FlqVApbiWZ
	quIbav6O9ON7odlzrOjqFsZbuKGtC6LnMLm3cMByzKreOhV9NOyO7IKlLB+YhogRG52IAr4MbfF
	HpOV19vcjSJtPi0C0Sve3bSQn
X-Google-Smtp-Source: AGHT+IF5Um4wxnf1VBR2WUaWHAuuXv8maMmB3T9J09ThCkD0kILxqdXmbC6BUXhNgpO/3CkQqObwKg==
X-Received: by 2002:a05:6602:399a:b0:85b:58b0:7abd with SMTP id ca18e2360f4ac-85e2ca35536mr78053339f.1.1742499898515;
        Thu, 20 Mar 2025 12:44:58 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c40fsm8341439f.32.2025.03.20.12.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:44:58 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] clk: spacemit: add reset controller support
Date: Thu, 20 Mar 2025 14:44:44 -0500
Message-ID: <20250320194449.510569-4-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320194449.510569-1-elder@riscstar.com>
References: <20250320194449.510569-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_124459_684800_954C5DE0 
X-CRM114-Status: GOOD (  19.88  )
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
k1_ccu_data structure.  Reset support is optional for SpacemiT CCUs;
the new pointer field will be null for CCUs without any resets.

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
 drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index f7367271396a0..6d879411c6c05 100644
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
 struct k1_ccu_data {
 	struct spacemit_ccu_clk *clk;		/* array with sentinel */
+	const struct ccu_reset_controller_data *rst_data;
+};
+
+struct ccu_reset_controller {
+	struct regmap *regmap;
+	const struct ccu_reset_controller_data *data;
+	struct reset_controller_dev rcdev;
 };
 
 /*	APBS clocks start	*/
@@ -1630,6 +1649,48 @@ static const struct k1_ccu_data k1_ccu_apmu_data = {
 	.clk		= k1_ccu_apmu_clks,
 };
 
+static struct ccu_reset_controller *
+rcdev_to_controller(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct ccu_reset_controller, rcdev);
+}
+
+static int
+k1_rst_update(struct reset_controller_dev *rcdev, unsigned long id, bool assert)
+{
+	struct ccu_reset_controller *controller = rcdev_to_controller(rcdev);
+	struct regmap *regmap = controller->regmap;
+	const struct ccu_reset_data *data;
+	u32 val;
+	int ret;
+
+	data = &controller->data->data[id];
+
+	ret = regmap_read(regmap, data->offset, &val);
+	if (ret)
+		return ret;
+
+	val &= ~(data->assert_mask | data->deassert_mask);
+	val |= assert ? data->assert_mask : data->deassert_mask;
+
+	return regmap_write(regmap, data->offset, val);
+}
+
+static int k1_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return k1_rst_update(rcdev, id, true);
+}
+
+static int k1_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return k1_rst_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops k1_reset_control_ops = {
+	.assert		= k1_rst_assert,
+	.deassert	= k1_rst_deassert,
+};
+
 static int k1_ccu_register(struct device *dev, struct regmap *regmap,
 			   struct regmap *lock_regmap,
 			   struct spacemit_ccu_clk *clks)
@@ -1675,6 +1736,33 @@ static int k1_ccu_register(struct device *dev, struct regmap *regmap,
 	return ret;
 }
 
+static int
+k1_reset_controller_register(struct device *dev, struct regmap *regmap,
+			     const struct ccu_reset_controller_data *data)
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
+	rcdev->owner = THIS_MODULE;
+	rcdev->nr_resets = data->count;
+	rcdev->ops = &k1_reset_control_ops;
+	rcdev->of_node = dev->of_node;
+
+	return devm_reset_controller_register(dev, rcdev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
@@ -1710,6 +1798,11 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = k1_reset_controller_register(dev, base_regmap, data->rst_data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register reset controller\n");
+
 	return 0;
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
