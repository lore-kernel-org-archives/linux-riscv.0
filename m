Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3422DC47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 13:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/Mpu5M11RhOQQjppFuinULVVxlNlFTWUmOYzn+gklk=; b=gvZWrVNUc0Slq3
	YPwGaWeylYMO8IfqCE0z3198FFF5HHKSMqZgAQ8zWWz/ZpQZNDQK4i1QcNH1QXPe+r8y3vto17d6O
	C79+S8Wy3BYViXDRmuj3sZjybtoCan+lnd9cl3fUB4naUosbjvbFAEn1qkZbdHxbKHDrJXIrCPH91
	VRdtYZ5oaPsBCRDkJNevI1DmuesrBhmZXSV/qDSm+TR8puK9dC4mkFbNcBDhWhzMa3FufIgMZnKBB
	UresptFWxFlwq5/568l7PUtY/jqrDqJCUDM3AOj6B6qb8brVPZE4jm7wvaiRDD4bfTvArLpzXZhNu
	iQ+kvddmtY7Ab7HH5Rew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUS7m-0000000Cy0b-2Djt;
	Mon, 29 Jan 2024 13:56:34 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUS7g-0000000Cxxs-32w7
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 13:56:30 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5102b00c2cdso1872618e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 05:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706536587; x=1707141387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSuvJDsIeu/noXriCuOK1Pr7/Fad1f+UMujsbtdvC+8=;
        b=Q6erldIU958srHsmAWkL8/9+9gQFMPhMznz97ILRHfFCRNV3dvZmXRakUUQyPZMBNG
         TzBW/Br4rjQdTVF6HczNdr8oG095cldGx3dzxbabG20KowHfuJFUNQwa7vcXgYV63DmK
         9UFIQPeT1CyGSeKxeBLxYddz7HNzneeXTsWIfjSbdOEQDuBo6Xt4yM3M/4xGzIOhBE0n
         J+YlivwbPTj586Qqsfc9aOihelAWWsRiOzaN3YlqKlU7IMJuaOMKfe7XbjrJEB0Ckwu4
         3h1UVwubY80cRDROUZMJwYnft0AYo/7x2CqStF0l2K9Yvxh6EslrxkHn0EBONscsQINv
         ynTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706536587; x=1707141387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSuvJDsIeu/noXriCuOK1Pr7/Fad1f+UMujsbtdvC+8=;
        b=cAz4kLYwUmhbc7T5WeZ8Wc8s25XpTiPez5BDOLSbDaMDj3mz6OjFRnPEDkRy20HRuW
         bGUqMQfKnlgJw2o/8slTbhmra7mn+TsgYArKW1upH0rUhvHslpnErl1Gxhzi1XUsBm/Q
         8k+WVbr9je7DlKy0ekMnq1b93fsIMUCHks3kf0H2cfRJASQjHMT8RczfsYKlow2s5M5a
         LNshrxlP7SkswffwY/Vr3OPABet/LsAtjUIDZXfBokYopAmXkVLpEphZ1MBkhEyGT46J
         cCpx9X9ZXqFVSqTkAVRUjywQvpXBm+MtVzHGZD+k8BGSdyteFKnF7mqqaWOfBlhifwIb
         DyxQ==
X-Gm-Message-State: AOJu0YzBu2YL9SXHHTlEdkoJAy72nNm2LraJP0ikSuq+da7GRQIApz4p
	aic1v63Op2/SWjKOx3YQw56DAp7mwxRR0uKIqAQOuIPnnGkcwovN
X-Google-Smtp-Source: AGHT+IGMVMyO53aT0M7GhF/8zOa+Td/nQDyiF9IHaMRKYkTdJIQel/UrjWDMws5qzhmwHyz76uoWyQ==
X-Received: by 2002:a05:6512:e8f:b0:511:f41:6144 with SMTP id bi15-20020a0565120e8f00b005110f416144mr2458512lfb.61.1706536586965;
        Mon, 29 Jan 2024 05:56:26 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:5616:a18c:ea50:2995])
        by smtp.gmail.com with ESMTPSA id bh5-20020a05600005c500b0033aed46956csm3058057wrb.80.2024.01.29.05.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 05:56:25 -0800 (PST)
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
Subject: [PATCH v6 3/4] pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28
Date: Mon, 29 Jan 2024 13:55:55 +0000
Message-Id: <20240129135556.63466-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129135556.63466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240129135556.63466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_055629_006220_E2757D50 
X-CRM114-Status: GOOD (  22.02  )
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

Add the missing port pins P19 to P28 for RZ/Five SoC. These additional
pins provide expanded capabilities and are exclusive to the RZ/Five SoC.

Couple of port pins have different configuration and are not identical for
the complete port so introduce struct rzg2l_variable_pin_cfg to handle
such cases and introduce the PIN_CFG_VARIABLE macro. The actual pin config
is then assigned in rzg2l_pinctrl_get_variable_pin_cfg().

Add an additional check in rzg2l_gpio_get_gpioint() to only allow GPIO pins
which support interrupt facility.

While at define RZG2L_GPIO_PORT_PACK() using RZG2L_GPIO_PORT_SPARSE_PACK().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 213 +++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 33ea5f8dc998..ac44b0f9dfa7 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -57,6 +57,8 @@
 #define PIN_CFG_IOLH_C			BIT(13)
 #define PIN_CFG_SOFT_PS			BIT(14)
 #define PIN_CFG_OEN			BIT(15)
+#define PIN_CFG_VARIABLE		BIT(16)
+#define PIN_CFG_NOGPIO_INT		BIT(17)
 
 #define RZG2L_MPXED_COMMON_PIN_FUNCS(group) \
 					(PIN_CFG_IOLH_##group | \
@@ -76,17 +78,23 @@
 					 PIN_CFG_FILNUM | \
 					 PIN_CFG_FILCLKSEL)
 
-/*
- * n indicates number of pins in the port, a is the register index
- * and f is pin configuration capabilities supported.
- */
 #define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(35, 28)
 #define PIN_CFG_PIN_REG_MASK		GENMASK(27, 20)
 #define PIN_CFG_MASK			GENMASK(19, 0)
 
-#define RZG2L_GPIO_PORT_PACK(n, a, f)	((((1ULL << (n)) - 1) << 28) | \
-					 FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
-					 FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
+/*
+ * m indicates the bitmap of supported pins, a is the register index
+ * and f is pin configuration capabilities supported.
+ */
+#define RZG2L_GPIO_PORT_SPARSE_PACK(m, a, f)	(FIELD_PREP_CONST(PIN_CFG_PIN_MAP_MASK, (m)) | \
+						 FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
+						 FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
+
+/*
+ * n indicates number of pins in the port, a is the register index
+ * and f is pin configuration capabilities supported.
+ */
+#define RZG2L_GPIO_PORT_PACK(n, a, f)	RZG2L_GPIO_PORT_SPARSE_PACK((1ULL << (n)) - 1, (a), (f))
 
 /*
  * BIT(63) indicates dedicated pin, p is the register index while
@@ -200,6 +208,18 @@ struct rzg2l_dedicated_configs {
 	u64 config;
 };
 
+/**
+ * struct rzg2l_variable_pin_cfg - pin data cfg
+ * @cfg: port pin configuration
+ * @port: port number
+ * @pin: port pin
+ */
+struct rzg2l_variable_pin_cfg {
+	u32 cfg:20;
+	u32 port:5;
+	u32 pin:3;
+};
+
 struct rzg2l_pinctrl_data {
 	const char * const *port_pins;
 	const u64 *port_pin_configs;
@@ -208,6 +228,8 @@ struct rzg2l_pinctrl_data {
 	unsigned int n_port_pins;
 	unsigned int n_dedicated_pins;
 	const struct rzg2l_hwcfg *hwcfg;
+	const struct rzg2l_variable_pin_cfg *variable_pin_cfg;
+	unsigned int n_variable_pin_cfg;
 };
 
 /**
@@ -243,6 +265,143 @@ struct rzg2l_pinctrl {
 
 static const u16 available_ps[] = { 1800, 2500, 3300 };
 
+#ifdef CONFIG_RISCV
+static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
+					      u64 pincfg,
+					      unsigned int port,
+					      u8 pin)
+{
+	unsigned int i;
+
+	for (i = 0; i < pctrl->data->n_variable_pin_cfg; i++) {
+		if (pctrl->data->variable_pin_cfg[i].port == port &&
+		    pctrl->data->variable_pin_cfg[i].pin == pin)
+			return (pincfg & ~PIN_CFG_VARIABLE) | pctrl->data->variable_pin_cfg[i].cfg;
+	}
+
+	return 0;
+}
+
+static const struct rzg2l_variable_pin_cfg r9a07g043f_variable_pin_cfg[] = {
+	{
+		.port = 20,
+		.pin = 0,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 1,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 2,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+		       PIN_CFG_IEN  | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 3,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 4,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 5,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 6,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 20,
+		.pin = 7,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 23,
+		.pin = 1,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT
+	},
+	{
+		.port = 23,
+		.pin = 2,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 23,
+		.pin = 3,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 23,
+		.pin = 4,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 23,
+		.pin = 5,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 0,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 1,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 2,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 3,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 4,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_NOGPIO_INT,
+	},
+	{
+		.port = 24,
+		.pin = 5,
+		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+		       PIN_CFG_NOGPIO_INT,
+	},
+};
+#endif
+
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 pin, u8 off, u8 func)
 {
@@ -1446,6 +1605,25 @@ static const u64 r9a07g043_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(2, 0x20, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(4, 0x21, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(6, 0x22, RZG2L_MPXED_PIN_FUNCS),
+#ifdef CONFIG_RISCV
+	/* Below additional port pins (P19 - P28) are exclusively available on RZ/Five SoC only */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x06, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+				    PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+				    PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),			/* P19 */
+	RZG2L_GPIO_PORT_PACK(8, 0x07, PIN_CFG_VARIABLE),				/* P20 */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x08, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+				    PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),			/* P21 */
+	RZG2L_GPIO_PORT_PACK(4, 0x09, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
+			     PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),				/* P22 */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x3e, 0x0a, PIN_CFG_VARIABLE),			/* P23 */
+	RZG2L_GPIO_PORT_PACK(6, 0x0b, PIN_CFG_VARIABLE),				/* P24 */
+	RZG2L_GPIO_PORT_SPARSE_PACK(0x2, 0x0c, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_FILONOFF |
+				    PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
+				    PIN_CFG_NOGPIO_INT),				/* P25 */
+	0x0,										/* P26 */
+	0x0,										/* P27 */
+	RZG2L_GPIO_PORT_PACK(6, 0x0f, RZG2L_MPXED_PIN_FUNCS | PIN_CFG_NOGPIO_INT),	/* P28 */
+#endif
 };
 
 static const u64 r9a08g045_gpio_configs[] = {
@@ -1606,12 +1784,18 @@ static const struct rzg2l_dedicated_configs rzg3s_dedicated_pins[] = {
 						       PIN_CFG_IO_VMC_SD1)) },
 };
 
-static int rzg2l_gpio_get_gpioint(unsigned int virq, const struct rzg2l_pinctrl_data *data)
+static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl)
 {
+	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[virq];
+	const struct rzg2l_pinctrl_data *data = pctrl->data;
+	u64 *pin_data = pin_desc->drv_data;
 	unsigned int gpioint;
 	unsigned int i;
 	u32 port, bit;
 
+	if (*pin_data & PIN_CFG_NOGPIO_INT)
+		return -EINVAL;
+
 	port = virq / 8;
 	bit = virq % 8;
 
@@ -1721,7 +1905,7 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 	unsigned long flags;
 	int gpioint, irq;
 
-	gpioint = rzg2l_gpio_get_gpioint(child, pctrl->data);
+	gpioint = rzg2l_gpio_get_gpioint(child, pctrl);
 	if (gpioint < 0)
 		return gpioint;
 
@@ -1907,6 +2091,13 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
 		if (i && !(i % RZG2L_PINS_PER_PORT))
 			j++;
 		pin_data[i] = pctrl->data->port_pin_configs[j];
+#ifdef CONFIG_RISCV
+		if (pin_data[i] & PIN_CFG_VARIABLE)
+			pin_data[i] = rzg2l_pinctrl_get_variable_pin_cfg(pctrl,
+									 pin_data[i],
+									 j,
+									 i % RZG2L_PINS_PER_PORT);
+#endif
 		pins[i].drv_data = &pin_data[i];
 	}
 
@@ -2058,6 +2249,10 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
 	.n_port_pins = ARRAY_SIZE(r9a07g043_gpio_configs) * RZG2L_PINS_PER_PORT,
 	.n_dedicated_pins = ARRAY_SIZE(rzg2l_dedicated_pins.common),
 	.hwcfg = &rzg2l_hwcfg,
+#ifdef CONFIG_RISCV
+	.variable_pin_cfg = r9a07g043f_variable_pin_cfg,
+	.n_variable_pin_cfg = ARRAY_SIZE(r9a07g043f_variable_pin_cfg),
+#endif
 };
 
 static struct rzg2l_pinctrl_data r9a07g044_data = {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
