Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEBEC36000
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsZ5hJ1aizUh8rJPxWBP0UfCMK5GdSuU5Zh/UWosk1g=; b=pY/3zGn4D4lWQz
	4bq48pJPLAd9HhyHrcl6jrh59EMt0weNkjs5kAhpt0tsjGs1+eaiRL53LHIAVKIOdCg74S3Vm01s0
	d0iMSCZRhjYSAZtzM3o7M6mKaW1xYoNZsSYN1qtzfO7SDl2akEtlYyE7SB2S8GJSWJopzUsg30CY2
	1oZ1TbrkHtNwCmd2sOKWVIgWl/+8Sc1HuJJ9BaxRnDarqzZ7HG2WhoHsgo8xV8+GJ8+ls3rcNdMt1
	9FI4f33xyh598CoJfaXH2KRsYTPVwaZdEXQ8dWpCN1ucp0hn6CLyqR3IfUp7EvEn5lc3Y3tb72zpt
	AwoolcyC3Sc+teVc1Pbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tveA6-0000000FHbT-03W9;
	Fri, 21 Mar 2025 15:19:54 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tve8u-0000000FHLk-0Tfh
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 15:18:41 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-85e14ce87ceso63607339f.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742570319; x=1743175119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dlzkhyp/izF78g6ftxTkpFnLH1O8eZPqCB+owD+Ogvs=;
        b=TJfVbtpWTa12ExhcEczbFdK6CD7To/xP1i3Dla7GVJKQgySC3laJNFbhEbRcBbHKfk
         dD31YkbXMetyrqR7sd2GB0i+vOq7R7xAo0falAMRD0AgoXLS3lawSKi7FR2y5PXt5NKm
         5TEvyhANGWLZhn00P/MG5S+aWd16D+T4ZMSpRDRFML8qolvTdJGEaNpA2GWW1RP8KwdJ
         THRzdq9zaGEI6V9d4YDh9JUKkZFHnUcdsIzzwEWVOq54ntIUSTdXA4dotWklqyqLC1lS
         TBoe94hn15fhRZJHwC0M+ObuJsAcVxms3Feh+o35wuXnXA+WsYh7zeRZ7xZ9nEqwPJB5
         k5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742570319; x=1743175119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dlzkhyp/izF78g6ftxTkpFnLH1O8eZPqCB+owD+Ogvs=;
        b=WFUdZmznQWY5Sp71T/jSZXoRd/CGDWm5CqS6OekkPMqUS1L0MI5wmpys+4s5F2kwpI
         lWMMhGC3hpZZt3UKmaumR/MyoW/kMA2TthFDt76TyoBvpQr/v8uh0LWX66BTdURR+fpl
         Ebs79+YJtiYDJh0GGInf8NP8EX5eZomfA24Aoc7cqkMOIjOC6rLy/ylf9zl8ykauttlC
         oBNYshSsTS1HML6BcNNrQrC2/6fXLZenWI08hxp2kaBMwemIbHvkKTGV5oOXQ606J9Cg
         ZuOr2BUgZWh62CLPzUyHqMvRea771gb8fCHzar2d3JLLEX4o8aAlSgHSA+kbvcsVqLGg
         KWkw==
X-Forwarded-Encrypted: i=1; AJvYcCXiALpSAq2oZIREQsDV7cbshrWt8xWpiyJUqUo+Ku7P1zBNQZHfyQlI1VA44mnha9UoMgqMFQ8hiRAmnA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7WaYw4e3P3vWs167/8DkZMDcY7XGAFig7j1udk48mdEXSPj77
	kjvmmVUHudQ11qOnqIiB/wI5fdJul9Dc0jcAu8+Pb515VU9/2SATeU5ifXP9Njs39064xJtlpXO
	dDRG4Vg==
X-Gm-Gg: ASbGncsTfNG5mynIPAfv8hTi5AxWt617JN6yl5AKMK1eBnYQDG/4ctofthUGjMS4pVS
	CDlw7Z2nEZgMQplxvTALHEwq9UjW2zjyYu+w2VkE2ZkjZyz+T1itcdEsTs8SWZ5UOY+Ass3+PUx
	mRBBetNbHlWzLbKbVjXM2iQvNCvUmBXRpGmlWqWhn9+txYXO648YAlg4LWEjWcE07WGLsFGsOhj
	r5vJuozPbYjkya31tDQIagQS23nwCxVBZpXV4+E+sqq+AXzrTViWXoJqmpT5o4WYjLRs/z19AUP
	Bp4d0EsoJpwKGNNPVG3SJjSm7pWIOkT3xGwieQZr3XKjltLZWrzzIM1chVSpQFwKv9VOFU/2WID
	CXlkXZ7U+jMnqnumELMg/DoVM
X-Google-Smtp-Source: AGHT+IEUz8WMBAG/xaa2+GBBPyVyyUIOG2h5tJRf01KFeJERuOLi2IrXGmMUndsyBqpsB4JMvQ48PQ==
X-Received: by 2002:a05:6602:7410:b0:85d:ad56:af88 with SMTP id ca18e2360f4ac-85e1ee299f1mr849828339f.1.1742570319091;
        Fri, 21 Mar 2025 08:18:39 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdd0a21sm475553173.41.2025.03.21.08.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:18:38 -0700 (PDT)
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
Subject: [PATCH RESEND 3/7] clk: spacemit: add reset controller support
Date: Fri, 21 Mar 2025 10:18:26 -0500
Message-ID: <20250321151831.623575-4-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321151831.623575-1-elder@riscstar.com>
References: <20250321151831.623575-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_081840_144609_3AB90C40 
X-CRM114-Status: GOOD (  19.45  )
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
