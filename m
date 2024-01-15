Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81610C3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzSuvSgxu7Df7FR9dxTQjj5qvN52jU9aUFI4wFWRsY8=; b=M5zhMHdmQny62Z
	g/VyTOIQVTkHeofYsLTs66GJbgG+y0JhYi85jq5Y+ErJ0HSQqVBK54qOSUlIQ7sCh6SbSd5QnFKOl
	DTCMAyh7sm+XcxV4z3IjRdipOFBMSmWDUAbnGdJWCtSFvGUinIihSxyWuPnqMuxM3Son9BXyBqMC1
	54ydI+GPk8W59+73HgefgoRtcB4QORQ9aiw+GSq81ZrRxgY/ZXEKjr/xt56LIQ7brdw3UAAVgRlDZ
	wRq0jBgvREZ8AZjugIlmjX86gVznAJ9wpVmtAQI5ZTg+yHGeb8uvpxVKPVTWAdDspiN8mP09GHYlR
	sf1WLjZSmxHT1ywLHkIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMha-008zmv-2s;
	Mon, 15 Jan 2024 13:08:30 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMhW-008zlC-1k
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 13:08:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so7685181f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 05:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705324104; x=1705928904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQZ/9jrP/1NgAI3hrvaM371L56OshsmWSvm/udtkyhg=;
        b=TnzTbM8A0V9suZlMDLSwsLuKmEdkoQMzTo0p0u7UnnklSwUpMb+7ZgZURtawVtleM/
         ANi9t9BugL9Y4JZpgVtsTRQcv3jW9vW+Nm/1tkW25toUCFmjzCex5lT9GmC3q0sfdUnw
         9vD14KpJOu9z1nErTnnDNhlaM4E5rzj+9Yx9D+JQIo9eDaI32knBBMiCAM72IwxLdebZ
         zIA4f7u8z+zGFTFNS2VqDnZ1SLfKDmDIzevke9is50c2san8QiuvcPDd4dFkFoInd8AZ
         m0m999MbezDL7EoDbK5HGaMyrgcaJ74LJxxBkwfPDlJo8TJCm/9eNJKhsCFA1k+PtYWg
         h1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705324104; x=1705928904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQZ/9jrP/1NgAI3hrvaM371L56OshsmWSvm/udtkyhg=;
        b=Tn4ZEB3PPzmDrEbHnw4BaqUDTs/mq2zS3corj0KNp8RHU6xC0jssMoLsstV2aUkmzD
         wI9Z8CcbnSUB8P3vOCsme6UPDacsr2x3GPkizRwlvHGpCZwa7BbGbR8bOZDXncymTidE
         IIYfKV3HPnfKEoJQVUANty7+2IzHL4sbpQ1SABwmZkbqVCIUEly49dCxcijr+8ZFje90
         B21bBVJo5ZnpSPqzNF7Pjh0leYyGoY69n2Jfm0NSdnUzKYcn74Xusax+fFW/EC9EFeXA
         BW5LFyi9FgM01UQ7aN9LxV9vqQUpopPwc+VnNH9IA/I5JV6DDNtNO6EgqtubGcJTFXJw
         9Mzg==
X-Gm-Message-State: AOJu0YwAS3woWY+YKnUCN+CE27pqFIDxo+07myItuTh0NxDD70T4IEVt
	dqa52hp1oIKDK99fs4DUEwM=
X-Google-Smtp-Source: AGHT+IHXEVNtdu+/A/IXSm3gsfs/I5NtHVD8kxrqAyDw1/RzVZSWWHzlwiiqW1PRNVCJhJzcFymq3A==
X-Received: by 2002:adf:b186:0:b0:337:2e16:218d with SMTP id q6-20020adfb186000000b003372e16218dmr2634761wra.68.1705324103604;
        Mon, 15 Jan 2024 05:08:23 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3d67:232:2eec:2430])
        by smtp.gmail.com with ESMTPSA id d13-20020adfef8d000000b0033739c1da1dsm11843620wro.67.2024.01.15.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 05:08:22 -0800 (PST)
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
Subject: [PATCH v5 2/4] pinctrl: renesas: rzg2l: Include pinmap in RZG2L_GPIO_PORT_PACK() macro
Date: Mon, 15 Jan 2024 13:08:15 +0000
Message-Id: <20240115130817.88456-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_050826_581129_1615D5D6 
X-CRM114-Status: GOOD (  18.02  )
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

Currently we assume all the port pins are sequential ie always PX_0 to
PX_n (n=1..7) exist, but on RZ/Five SoC we have additional pins P19_1 to
P28_5 which have holes in them, for example only one pin on port19 is
available and that is P19_1 and not P19_0. So to handle such cases
include pinmap for each port which would indicate the pin availability
on each port. As the pincount can be calculated based on pinmap drop this
from RZG2L_GPIO_PORT_PACK() macro.

Previously we had a max of 7 pins on each port but on RZ/Five Port-20
has 8 pins, so move the single pin configuration to BIT(63).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 56 +++++++++++++------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index fee348b80892..066fcc515335 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -80,19 +80,20 @@
  * n indicates number of pins in the port, a is the register index
  * and f is pin configuration capabilities supported.
  */
-#define PIN_CFG_PIN_CNT_MASK		GENMASK(30, 28)
+#define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(35, 28)
 #define PIN_CFG_PIN_REG_MASK		GENMASK(27, 20)
 #define PIN_CFG_MASK			GENMASK(19, 0)
-#define RZG2L_GPIO_PORT_PACK(n, a, f)	(FIELD_PREP_CONST(PIN_CFG_PIN_CNT_MASK, (n)) | \
+
+#define RZG2L_GPIO_PORT_PACK(n, a, f)	((((1ULL << (n)) - 1) << 28) | \
 					 FIELD_PREP_CONST(PIN_CFG_PIN_REG_MASK, (a)) | \
 					 FIELD_PREP_CONST(PIN_CFG_MASK, (f)))
 
 /*
- * BIT(31) indicates dedicated pin, p is the register index while
+ * BIT(63) indicates dedicated pin, p is the register index while
  * referencing to SR/IEN/IOLH/FILxx registers, b is the register bits
  * (b * 8) and f is the pin configuration capabilities supported.
  */
-#define RZG2L_SINGLE_PIN		BIT(31)
+#define RZG2L_SINGLE_PIN		BIT_ULL(63)
 #define RZG2L_SINGLE_PIN_INDEX_MASK	GENMASK(30, 24)
 #define RZG2L_SINGLE_PIN_BITS_MASK	GENMASK(22, 20)
 
@@ -196,12 +197,12 @@ struct rzg2l_hwcfg {
 
 struct rzg2l_dedicated_configs {
 	const char *name;
-	u32 config;
+	u64 config;
 };
 
 struct rzg2l_pinctrl_data {
 	const char * const *port_pins;
-	const u32 *port_pin_configs;
+	const u64 *port_pin_configs;
 	unsigned int n_ports;
 	const struct rzg2l_dedicated_configs *dedicated_pins;
 	unsigned int n_port_pins;
@@ -302,7 +303,7 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	pins = group->pins;
 
 	for (i = 0; i < group->num_pins; i++) {
-		unsigned int *pin_data = pctrl->desc.pins[pins[i]].drv_data;
+		u64 *pin_data = pctrl->desc.pins[pins[i]].drv_data;
 		u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 		u32 pin = RZG2L_PIN_ID_TO_PIN(pins[i]);
 
@@ -565,13 +566,13 @@ static int rzg2l_dt_node_to_map(struct pinctrl_dev *pctldev,
 }
 
 static int rzg2l_validate_gpio_pin(struct rzg2l_pinctrl *pctrl,
-				   u32 cfg, u32 port, u8 bit)
+				   u64 cfg, u32 port, u8 bit)
 {
-	u8 pincount = FIELD_GET(PIN_CFG_PIN_CNT_MASK, cfg);
+	u8 pinmap = FIELD_GET(PIN_CFG_PIN_MAP_MASK, cfg);
 	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
-	u32 data;
+	u64 data;
 
-	if (bit >= pincount || port >= pctrl->data->n_port_pins)
+	if (!(pinmap & BIT(bit)) || port >= pctrl->data->n_port_pins)
 		return -EINVAL;
 
 	data = pctrl->data->port_pin_configs[port];
@@ -863,7 +864,7 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
-	unsigned int *pin_data = pin->drv_data;
+	u64 *pin_data = pin->drv_data;
 	unsigned int arg = 0;
 	u32 off, cfg;
 	int ret;
@@ -966,7 +967,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	struct rzg2l_pinctrl_pin_settings settings = pctrl->settings[_pin];
-	unsigned int *pin_data = pin->drv_data;
+	u64 *pin_data = pin->drv_data;
 	enum pin_config_param param;
 	unsigned int i, arg, index;
 	u32 cfg, off;
@@ -1171,7 +1172,7 @@ static int rzg2l_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
-	u32 *pin_data = pin_desc->drv_data;
+	u64 *pin_data = pin_desc->drv_data;
 	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 	u32 port = RZG2L_PIN_ID_TO_PORT(offset);
 	u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
@@ -1203,7 +1204,7 @@ static void rzg2l_gpio_set_direction(struct rzg2l_pinctrl *pctrl, u32 offset,
 				     bool output)
 {
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
-	unsigned int *pin_data = pin_desc->drv_data;
+	u64 *pin_data = pin_desc->drv_data;
 	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 	u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
 	unsigned long flags;
@@ -1224,7 +1225,7 @@ static int rzg2l_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
-	unsigned int *pin_data = pin_desc->drv_data;
+	u64 *pin_data = pin_desc->drv_data;
 	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 	u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
 
@@ -1255,7 +1256,7 @@ static void rzg2l_gpio_set(struct gpio_chip *chip, unsigned int offset,
 {
 	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
-	unsigned int *pin_data = pin_desc->drv_data;
+	u64 *pin_data = pin_desc->drv_data;
 	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 	u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
 	unsigned long flags;
@@ -1288,7 +1289,7 @@ static int rzg2l_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[offset];
-	unsigned int *pin_data = pin_desc->drv_data;
+	u64 *pin_data = pin_desc->drv_data;
 	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 	u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
 	u16 reg16;
@@ -1373,7 +1374,7 @@ static const char * const rzg2l_gpio_names[] = {
 	"P48_0", "P48_1", "P48_2", "P48_3", "P48_4", "P48_5", "P48_6", "P48_7",
 };
 
-static const u32 r9a07g044_gpio_configs[] = {
+static const u64 r9a07g044_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(2, 0x10, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(2, 0x11, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(2, 0x12, RZG2L_MPXED_PIN_FUNCS),
@@ -1425,7 +1426,7 @@ static const u32 r9a07g044_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(5, 0x40, RZG2L_MPXED_PIN_FUNCS),
 };
 
-static const u32 r9a07g043_gpio_configs[] = {
+static const u64 r9a07g043_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(4, 0x10, RZG2L_MPXED_PIN_FUNCS),
 	RZG2L_GPIO_PORT_PACK(5, 0x11, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
 	RZG2L_GPIO_PORT_PACK(4, 0x12, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IO_VMC_ETH0)),
@@ -1447,7 +1448,7 @@ static const u32 r9a07g043_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(6, 0x22, RZG2L_MPXED_PIN_FUNCS),
 };
 
-static const u32 r9a08g045_gpio_configs[] = {
+static const u64 r9a08g045_gpio_configs[] = {
 	RZG2L_GPIO_PORT_PACK(4, 0x20, RZG3S_MPXED_PIN_FUNCS(A)),			/* P0  */
 	RZG2L_GPIO_PORT_PACK(5, 0x30, RZG2L_MPXED_ETH_PIN_FUNCS(PIN_CFG_IOLH_C |
 								PIN_CFG_IO_VMC_ETH0)) |
@@ -1615,12 +1616,12 @@ static int rzg2l_gpio_get_gpioint(unsigned int virq, const struct rzg2l_pinctrl_
 	bit = virq % 8;
 
 	if (port >= data->n_ports ||
-	    bit >= FIELD_GET(PIN_CFG_PIN_CNT_MASK, data->port_pin_configs[port]))
+	    bit >= hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK, data->port_pin_configs[port])))
 		return -EINVAL;
 
 	gpioint = bit;
 	for (i = 0; i < port; i++)
-		gpioint += FIELD_GET(PIN_CFG_PIN_CNT_MASK, data->port_pin_configs[i]);
+		gpioint += hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK, data->port_pin_configs[i]));
 
 	return gpioint;
 }
@@ -1631,7 +1632,7 @@ static void rzg2l_gpio_irq_disable(struct irq_data *d)
 	struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
 	unsigned int hwirq = irqd_to_hwirq(d);
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[hwirq];
-	unsigned int *pin_data = pin_desc->drv_data;
+	u64 *pin_data = pin_desc->drv_data;
 	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 	u8 bit = RZG2L_PIN_ID_TO_PIN(hwirq);
 	unsigned long flags;
@@ -1658,7 +1659,7 @@ static void rzg2l_gpio_irq_enable(struct irq_data *d)
 	struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
 	unsigned int hwirq = irqd_to_hwirq(d);
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[hwirq];
-	unsigned int *pin_data = pin_desc->drv_data;
+	u64 *pin_data = pin_desc->drv_data;
 	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 	u8 bit = RZG2L_PIN_ID_TO_PIN(hwirq);
 	unsigned long flags;
@@ -1795,7 +1796,8 @@ static void rzg2l_init_irq_valid_mask(struct gpio_chip *gc,
 		bit = offset % 8;
 
 		if (port >= pctrl->data->n_ports ||
-		    bit >= FIELD_GET(PIN_CFG_PIN_CNT_MASK, pctrl->data->port_pin_configs[port]))
+		    bit >= hweight8(FIELD_GET(PIN_CFG_PIN_MAP_MASK,
+					      pctrl->data->port_pin_configs[port])))
 			clear_bit(offset, valid_mask);
 	}
 }
@@ -1877,7 +1879,7 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
 	const struct rzg2l_hwcfg *hwcfg = pctrl->data->hwcfg;
 	struct pinctrl_pin_desc *pins;
 	unsigned int i, j;
-	u32 *pin_data;
+	u64 *pin_data;
 	int ret;
 
 	pctrl->desc.name = DRV_NAME;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
