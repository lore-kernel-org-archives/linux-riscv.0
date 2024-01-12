Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D799BC47258
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsjYLrVdzqZKLZNfmwf8kSskm8U4O575wkDTzzW3ZEw=; b=LNTYgttSzrDe0t
	cyGzTwUm18a+qN5vk3VGv8O2F28kH81DY06aAo9uTcP/cyVwlSx5wCfGwF37e7B2VEwgueXr/8oz1
	EIC3TAfb/EygbqZCXXL6/hMEhzzm4YfMMaCMZozm7S10yJ0voZjM0yBzmrydPH2wJajANi+3kST7O
	GniIB/S+qWCfq4Ebng3NvBPPxRBXvldZA4AzqkoZrJ8JDryWqDGyKSA1pTNY6Qb0COED2gtr3jOtA
	26vEa1ekW00byVosZqnJzTRzSf5kgSEn+dRQPV5DG53GzR1Hjgtx0kVoh3mOx5JyuziqqbYTnIeN6
	73xyLN4vJiW+iEq5kXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIUU-0031xV-2q;
	Fri, 12 Jan 2024 14:26:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIUR-0031vc-0b
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 14:26:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40d5336986cso82639435e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705069589; x=1705674389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJ/m+l7GPcHseZYPduukv0ojncUx7hSN3NYiZJ23ScQ=;
        b=AC6cwhG1oerPSfFW0XCtDrgFuTT/pMbkusRVKLaZ9q9wVE96yqN0T5BY0Cyr0AMej6
         dieBqnScZlJfzPgfVSu3UYVlEN7/0hOdL11gDcZ/tIx9f7zxM7/ch3V7LYZip+RJeahO
         IaKo47spsNXVTCT09povTMeJMH29TzzAOmbQPwTid9e/McrQpsV6nClLIZp99Ha7T9Fh
         Ez+FTTQ/qUWaaHKUgECxurKMHk/4Mlp/s0kGiASC2zEM/OXqGaJVJLcxY+PtoNFj+Bzx
         TRo4wRAiIg0DoN0hBX7dXB2U96KkYhMyJ2YVUTmzw3wWbuOr22OJQt8dQYxNWC+QQsqG
         tTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705069589; x=1705674389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJ/m+l7GPcHseZYPduukv0ojncUx7hSN3NYiZJ23ScQ=;
        b=EYkbaqezhwxqHqCefPaefRVUPnwkamtAvdVketLEr05Q6gK1vK4BZ9CNIATFT32hhT
         aTB9HSV4YBOG8GwIC5JnFWZ9hR8lSv9n6JWOovDh4n7P9yxyDX0idwtp9GcbB3ZlP6Fv
         VNcoGo5Tqj3UPAJqFhpcf6CGA9wd6HBLPdi4+zTilWxkeJEeypWFqHnxN4Q8q2tV7/mB
         ZZdjLtJfe3UhUXfwfiE8K0LNPJtOpRBN7GLZVv1WoROnWw8ti1qAnPce/NU0C/MbxNOO
         L53VunbaGMlKI0wgqD62pN1y0q9Hz9PXH79Aem6o3U96CROz9354/uR0DWJFt3VCkMHL
         5pWg==
X-Gm-Message-State: AOJu0YwibPu7WM/NTFCf+nPHXy6VpY17j4PmKwAyyNWfMsk/qaMrr044
	WBTbG0FqkBNybAUdCbn2Ub4=
X-Google-Smtp-Source: AGHT+IHo4hdTciokLfarPsuDU0O6Eavyfq3xpkpUuaj+rdJ+//mml5N4EoFvNNsqkKYF0HplzXGuRw==
X-Received: by 2002:a05:600c:1c85:b0:40d:8818:8ea5 with SMTP id k5-20020a05600c1c8500b0040d88188ea5mr744249wms.122.1705069588520;
        Fri, 12 Jan 2024 06:26:28 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:494d:c489:3d96:1b15])
        by smtp.gmail.com with ESMTPSA id f6-20020a5d4dc6000000b00336a2566aa2sm4021219wru.61.2024.01.12.06.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 06:26:27 -0800 (PST)
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
Subject: [PATCH v4 1/4] pinctrl: renesas: rzg2l: Improve code for readability
Date: Fri, 12 Jan 2024 14:26:18 +0000
Message-Id: <20240112142621.13525-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112142621.13525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240112142621.13525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_062631_227180_13119668 
X-CRM114-Status: GOOD (  14.82  )
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
