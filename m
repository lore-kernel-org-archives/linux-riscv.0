Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5334C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsjYLrVdzqZKLZNfmwf8kSskm8U4O575wkDTzzW3ZEw=; b=pIIeVRJLQhaZoo
	BdR7w+ZtW4peFbTERbc1VQ4WUSTjpahVwhOV645Iz4RZBgWq8ngDsOLA5dDdt3v3O1oAkgwKiKLhr
	cWotwciE2ATFcB8RUE0ZqKS20hYlZAMNz4cJpas+VJUojomDep4YlPDSJFR67WGRlPW8Z50PTpqKp
	u0u0w5XhfrnQ005trY6miaDr9tFFBh0jQKNNx/GmGipiY2heny4/LpqOub3xOzw/2LPaOeQXL52Rz
	8M3zHIgKB3IqaCaw3mCvH0hWq+7o2p4EHz7rrBDKKcXcNtMIO4LSrTvSxFd0WVgyAmSmJKiE/mDjc
	Jba43wSbcqj5ZaxwODpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMhZ-008zmR-0a;
	Mon, 15 Jan 2024 13:08:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMhW-008zky-0C
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 13:08:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40e490c2115so43233385e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 05:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705324102; x=1705928902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJ/m+l7GPcHseZYPduukv0ojncUx7hSN3NYiZJ23ScQ=;
        b=CL0hpLwtuhTRqwPWQL4Gb6y7E4AXY4YUGAqK0kJ3EclFsewjUvgdb5h9p4lBNlJY4F
         wqr/zECBzVNKjgss9SFE4Q2s4swX6OYl/eWvTu4Vf3kY2I5bL+QBwmt5CljtKYBwYy3U
         38K5qplTRMnySdPqiNuJ4Ds0BuB82tG1p9BJRs4VkNuSYmaWotc44QTanEmEuiQXsyDF
         rL6Y3Ccc/hcgS6MODxduQge4Ip6ai+ix4KnDTYIMYXFu9SGfnyLnszE0MnM0fV9WsAQW
         NjVz8HuMs+jJXm47FPDPX6rXPvLQvQChmwAEko5yOMVEN9puI/k/xwlnA6FREoAN3dJI
         vmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705324102; x=1705928902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJ/m+l7GPcHseZYPduukv0ojncUx7hSN3NYiZJ23ScQ=;
        b=EWiFnWFpXkJweTJVDvsgCuLvLEmPO9WsxTj1iBYuHzQi7htrXf/jOTAc2c5MiDLkGH
         DxeFx71v3jlSJBXPqVkj7d/sq53gjax8liH7TfKqm+s+2IinqgUZa8tg/WEvTA/0+Y4w
         oSmWs1S1+NT6dWeUAuajbGmyfKx5fKjVRViX+n1K6ZpBjfq65zOfyrNUnq0GehJhwf3w
         UNSPltOJCbuGMVY1g4yzaDfTS/FOcaWTeDYG0DV7U9B3BASEMxoxrAxyymSRCjuF+QCV
         84m0AcnSG3mAJ4+iTSDoy/xEtsPb1hFPEQrEb52kYXKk2TUiMINJ2OMogHWkerXK5vR7
         QDWg==
X-Gm-Message-State: AOJu0YxoUqllz6GkbsIXJ66/hWldIObsVHNx0ZxXzt9Lyam7mKpJfaaI
	difI6Um0EY/BjXdrBAmBvHw=
X-Google-Smtp-Source: AGHT+IG9jFeAFg5etXmfFixnKdv6k/fqBnxgKWbCsB4lzFkB5Q4po4o1DkhXynWZQQbdCzBkENmYsg==
X-Received: by 2002:a05:600c:2184:b0:40e:6064:b70c with SMTP id e4-20020a05600c218400b0040e6064b70cmr3203598wme.82.1705324102143;
        Mon, 15 Jan 2024 05:08:22 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3d67:232:2eec:2430])
        by smtp.gmail.com with ESMTPSA id d13-20020adfef8d000000b0033739c1da1dsm11843620wro.67.2024.01.15.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 05:08:21 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 1/4] pinctrl: renesas: rzg2l: Improve code for readability
Date: Mon, 15 Jan 2024 13:08:14 +0000
Message-Id: <20240115130817.88456-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_050826_109287_47196E6A 
X-CRM114-Status: GOOD (  14.89  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

As the RZ/G2L pinctrl driver is extensively utilized by numerous SoCs and
has experienced substantial growth, enhance code readability by
incorporating FIELD_PREP_CONST/FIELD_GET macros wherever necessary.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 41 +++++++++++++++----------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index e90d47136889..fee348b80892 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2021 Renesas Electronics Corporation.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
@@ -38,8 +39,6 @@
  */
 #define MUX_PIN_ID_MASK		GENMASK(15, 0)
 #define MUX_FUNC_MASK		GENMASK(31, 16)
-#define MUX_FUNC_OFFS		16
-#define MUX_FUNC(pinconf)	(((pinconf) & MUX_FUNC_MASK) >> MUX_FUNC_OFFS)
 
 /* PIN capabilities */
 #define PIN_CFG_IOLH_A			BIT(0)
@@ -81,8 +80,12 @@
  * n indicates number of pins in the port, a is the register index
  * and f is pin configuration capabilities supported.
  */
-#define RZG2L_GPIO_PORT_PACK(n, a, f)	(((n) << 28) | ((a) << 20) | (f))
-#define RZG2L_GPIO_PORT_GET_PINCNT(x)	(((x) & GENMASK(30, 28)) >> 28)
+#define PIN_CFG_PIN_CNT_MASK		GENMASK(30, 28)
+#define PIN_CFG_PIN_REG_MASK		GENMASK(27, 20)
+#define PIN_CFG_MASK			GENMASK(19, 0)
+#define RZG2L_GPIO_PORT_PACK(n, a, f)	(FIELD_PREP_CONST(PIN_CFG_PIN_CNT_MASK, (n)) | \
+					 FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
+					 FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
 
 /*
  * BIT(31) indicates dedicated pin, p is the register index while
@@ -90,14 +93,18 @@
  * (b * 8) and f is the pin configuration capabilities supported.
  */
 #define RZG2L_SINGLE_PIN		BIT(31)
+#define RZG2L_SINGLE_PIN_INDEX_MASK	GENMASK(30, 24)
+#define RZG2L_SINGLE_PIN_BITS_MASK	GENMASK(22, 20)
+
 #define RZG2L_SINGLE_PIN_PACK(p, b, f)	(RZG2L_SINGLE_PIN | \
-					 ((p) << 24) | ((b) << 20) | (f))
-#define RZG2L_SINGLE_PIN_GET_BIT(x)	(((x) & GENMASK(22, 20)) >> 20)
+					 FIELD_PREP_CONST(RZG2L_SINGLE_PIN_INDEX_MASK, (p)) | \
+					 FIELD_PREP_CONST(RZG2L_SINGLE_PIN_BITS_MASK, (b)) | \
+					 FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
 
-#define RZG2L_PIN_CFG_TO_CAPS(cfg)		((cfg) & GENMASK(19, 0))
+#define RZG2L_PIN_CFG_TO_CAPS(cfg)		((cfg) & PIN_CFG_MASK)
 #define RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg)	((cfg) & RZG2L_SINGLE_PIN ? \
-						(((cfg) & GENMASK(30, 24)) >> 24) : \
-						(((cfg) & GENMASK(26, 20)) >> 20))
+						 FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
+						 FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
 
 #define P(off)			(0x0000 + (off))
 #define PM(off)			(0x0100 + (off) * 2)
@@ -432,8 +439,8 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		ret = of_property_read_u32_index(np, "pinmux", i, &value);
 		if (ret)
 			goto done;
-		pins[i] = value & MUX_PIN_ID_MASK;
-		psel_val[i] = MUX_FUNC(value);
+		pins[i] = FIELD_GET(MUX_PIN_ID_MASK, value);
+		psel_val[i] = FIELD_GET(MUX_FUNC_MASK, value);
 	}
 
 	if (parent) {
@@ -560,7 +567,7 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
 static int rzg2l_validate_gpio_pin(struct rzg2l_pinctrl *pctrl,
 				   u32 cfg, u32 port, u8 bit)
 {
-	u8 pincount = RZG2L_GPIO_PORT_GET_PINCNT(cfg);
+	u8 pincount = FIELD_GET(PIN_CFG_PIN_CNT_MASK, cfg);
 	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
 	u32 data;
 
@@ -868,7 +875,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 	cfg = RZG2L_PIN_CFG_TO_CAPS(*pin_data);
 	if (*pin_data & RZG2L_SINGLE_PIN) {
-		bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
+		bit = FIELD_GET(RZG2L_SINGLE_PIN_BITS_MASK, *pin_data);
 	} else {
 		bit = RZG2L_PIN_ID_TO_PIN(_pin);
 
@@ -972,7 +979,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 	cfg = RZG2L_PIN_CFG_TO_CAPS(*pin_data);
 	if (*pin_data & RZG2L_SINGLE_PIN) {
-		bit = RZG2L_SINGLE_PIN_GET_BIT(*pin_data);
+		bit = FIELD_GET(RZG2L_SINGLE_PIN_BITS_MASK, *pin_data);
 	} else {
 		bit = RZG2L_PIN_ID_TO_PIN(_pin);
 
@@ -1608,12 +1615,12 @@ static int rzg2l_gpio_get_gpioint(unsigned int virq, const struct rzg2l_pinctrl_
 	bit = virq % 8;
 
 	if (port >= data->n_ports ||
-	    bit >= RZG2L_GPIO_PORT_GET_PINCNT(data->port_pin_configs[port]))
+	    bit >= FIELD_GET(PIN_CFG_PIN_CNT_MASK, data->port_pin_configs[port]))
 		return -EINVAL;
 
 	gpioint = bit;
 	for (i = 0; i < port; i++)
-		gpioint += RZG2L_GPIO_PORT_GET_PINCNT(data->port_pin_configs[i]);
+		gpioint += FIELD_GET(PIN_CFG_PIN_CNT_MASK, data->port_pin_configs[i]);
 
 	return gpioint;
 }
@@ -1788,7 +1795,7 @@ static void rzg2l_init_irq_valid_mask(struct gpio_chip *gc,
 		bit = offset % 8;
 
 		if (port >= pctrl->data->n_ports ||
-		    bit >= RZG2L_GPIO_PORT_GET_PINCNT(pctrl->data->port_pin_configs[port]))
+		    bit >= FIELD_GET(PIN_CFG_PIN_CNT_MASK, pctrl->data->port_pin_configs[port]))
 			clear_bit(offset, valid_mask);
 	}
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
