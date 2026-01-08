Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD4D148AE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 06:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29+794a1RO+eBgemLxEafq6DI8jamWcnFJDF7poHSG4=; b=Tnp6Mhj93q2j6t
	qsT/pQMv1DUEd2DVPRY47T+qayRlbvoXW4w6R/e+J15xWTEhSRWhg8VR9kU2mEZe47Z2Ru0p6ATl5
	mFleYMhy70YklT7aaKvw97ncR8pXzFNF4oNN979gfU/Y6Oe/SDYugkfSZTrjx4nYCOFmTMickKZt6
	W2rB/4TIJd81r3LUnXKXXm7hF7sh2nu4Arq1GS3MbUbO5B0GBSQf9MuCDphJenOiP0stZUybDnJMV
	EXsBi5qwdwJCYWRe1nmPL0kK0cG1MzmoNhaIS//xRu4pemFe4U/W3N/2SXf3hO4OOnCuxQwcUfSuo
	PrN9hZ895+HzkzIpMN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjkZ-0000000G0oQ-3Evy;
	Thu, 08 Jan 2026 06:44:03 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjkU-0000000G0mD-300o
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 06:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767854578;
	bh=xNICbiP93javbOYOEDOmSN3X3jhvGY5kWMSgKv9YUfA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=d47ogcw1aV16DhuKA4XfiSx8AoRMS1Koh93aI+V8nvfFOaZWNLHwl1VAuFsWOmDUK
	 3lXPPIBzf/XxEgJoARHuH8u2gvWGKEXleRkw3EWbg6WNwHp0qaOV640VJ0AjClqTEk
	 TlBTjoUElDnVaOLEpeyvl4Qf2m4Z5D/5nmGpMjpM=
X-QQ-mid: zesmtpsz5t1767854570t791e66d6
X-QQ-Originating-IP: FL0t0Z4emkFy4QW8GHyjtFTOgPT7250QHxl78Qjcsmc=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:42:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7203640015464593998
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 14:42:39 +0800
Subject: [PATCH v2 2/3] pinctrl: spacemit: support I/O power domain
 configuration
MIME-Version: 1.0
Message-Id: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-2-6bcb46146e53@linux.spacemit.com>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767854560; l=8638;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=f3Vz/FjB4IU2wC5YjnE37vrmig4UUrSSKIfocxwuzRY=;
 b=d6NPg64FHGSq2o/rhbhpxLvagCFvRUxEu+py5KNltDFp6iskkEarTawgfma5Of07pwaFhs8DA
 e1WEOll82eBCy55JLbg46yJiit5ntQHX37r8kzkYg+mLuwFSPqhWl0M
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MbnQBDA7nIx1iGw+8t/kqNgjsc+u66K9QRlEtFp2nIrre+VjKAUWZBBj
	liOCCONQ1CHCesY/uP63wuGxvPnK/TzQXMvQQtR3r8GW8QsesBNK99WuTpZu4+P7RGqasEY
	28KpVM3rmEKlKWQFENFiXAoa5HVKb+7ejpWO6AA1jMCYNOoflRBmauJwryr7mN+XkfzwnWc
	KXw+EXelByV8xQU9nL82LLuMKugB0SwteDK2ufJUJaoSTwWDB4av4WJ0JUpqkLXvJebqLIz
	xOFQXOsGlGocHBFJ8oCUlP+1vRlKm0JEACsvWdAGkrf1ASU8F1viK8v3zdjD3DJbMUZjzB2
	1HCDG6KK+7Z52/NiusxTPVPcGcTE72J4m7Y9SSHYtyVWknzklRDXizs8YuazreUXOC4YH8h
	nGPDAfhtuafcr2XyyoRzi14My2+B3sQGuL2aTRXWV4dX0woocjwdZY3cI11cf3YtBb5mYTL
	9ExcicU6uaRkMoAO3R5+O7OBjzm9ZiuPJwp5ln9Rch9691JKrCkQv6ssbrY1EbXwShTRxvA
	46tMT78JipnFwV2WhEPzYWYP1Y0XWDtk6tNY0Vg0sbkwFksK+3Ib8UA9+5iwbcga00BmM5w
	Maa0cyFMgBfVn34e+s8re3RNm444vJor0DtAA5Fz/S85hyr9FU/aGhaONYzRkgpiOvLdlIh
	ZuFMQLx1PAimnWtVEfDh/2rt1gBC91rEDP194NratNcjQQDR5PYnntH0p9XDbwuJecrmKXM
	B6sMCuLwWo325OhL4H8zs+hqN1R2FjERD1P0qSfvjrhtDL6/ZGbw8qXxWa/K5SEuH+mGs1a
	gCca7q02g/DYzSmgdQ4mDOca3eKPL+JWeDUMnKwPtmYsbhrfF0QXu6exmA9hz9p/bNyJrCa
	y1tYEVsgR3jh2ftrr6oT7ZqPQxuOHKM8eMVogGrnQl03yxpHTJoX0lOGBu2AcLKdymPh9ND
	O19ZmcCndTkS+R/gP2UiP3EOiePLmZYjI+8HnutalbTtajNaeHxPm6K2Pxq+iJQU8rTPlo8
	bQpU9T1ZPRRW/WSWdUEQwn+Oe3TdJ9I/WXGb3MdCnoXg5ig2YMq/wAb09adX0MYfZ/oIhST
	hf6v7j2669FCNRFzwmZ/ZQtImHRlNfs5lIB4+K7AUZckkFCsDe0Sb3OVeZfiFLb/v0YSJjG
	ksH6Lp0VKsnB19wPWGTuc/0ZKQ==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_224359_371711_D4184F71 
X-CRM114-Status: GOOD (  22.01  )
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

Dual-voltage GPIO banks default to 3.3V operation. Even when a bank is
externally supplied with 1.8V, the internal logic remains in the 3.3V
domain, leading to functional failures.

Add support for programming the IO domain power control registers to
allow explicit configuration for 1.8V operation.

These registers are secure due to hardware safety constraints.
Specifically, configuring the domain for 1.8V while externally supplying
3.3V causes back-powering and potential pin damage. Consequently, access
requires unlocking the AIB Secure Access Register (ASAR) in the APBC
block before any read or write operation.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v2:
- drop the offset argument from 'spacemit,apbc' property parsing
- make the syscon optional: disable voltage switching feature instead of failing probe if syscon is missing
- modify commit msg
- remove changes to dts
- remove io_pd_reg
- Link to v1: https://lore.kernel.org/spacemit/20260108042753-GYA2796@gentoo.org/T/#m256523b10c85dacd179b42ef42ae83c3b7b9699f
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 129 +++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 07267c5f0f4453bcdf5eb2d267eb3148a18bd038..71390402aaa63362706ace9e72c6d506c49e196d 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -7,8 +7,10 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 
@@ -47,6 +49,27 @@
 #define PAD_PULLUP		BIT(14)
 #define PAD_PULL_EN		BIT(15)
 
+#define IO_PWR_DOMAIN_OFFSET	0x800
+
+#define IO_PWR_DOMAIN_GPIO2_Kx  0x0c
+#define IO_PWR_DOMAIN_MMC_Kx    0x1c
+
+#define IO_PWR_DOMAIN_GPIO3_K1  0x10
+#define IO_PWR_DOMAIN_QSPI_K1   0x20
+
+#define IO_PWR_DOMAIN_GPIO1_K3  0x04
+#define IO_PWR_DOMAIN_GPIO5_K3  0x10
+#define IO_PWR_DOMAIN_GPIO4_K3  0x20
+#define IO_PWR_DOMAIN_QSPI_K3   0x2c
+
+#define IO_PWR_DOMAIN_V18EN	BIT(2)
+
+#define APBC_ASFAR		0x50
+#define APBC_ASSAR		0x54
+
+#define APBC_ASFAR_AKEY		0xbaba
+#define APBC_ASSAR_AKEY		0xeb10
+
 struct spacemit_pin_drv_strength {
 	u8		val;
 	u32		mA;
@@ -78,6 +101,8 @@ struct spacemit_pinctrl {
 	raw_spinlock_t				lock;
 
 	void __iomem				*regs;
+
+	struct regmap				*regmap_apbc;
 };
 
 struct spacemit_pinctrl_data {
@@ -85,6 +110,7 @@ struct spacemit_pinctrl_data {
 	const struct spacemit_pin	*data;
 	u16				npins;
 	unsigned int			(*pin_to_offset)(unsigned int pin);
+	unsigned int			(*pin_to_io_pd_offset)(unsigned int pin);
 	const struct spacemit_pinctrl_dconf	*dconf;
 };
 
@@ -146,6 +172,56 @@ static unsigned int spacemit_k3_pin_to_offset(unsigned int pin)
 	return offset << 2;
 }
 
+static unsigned int spacemit_k1_pin_to_io_pd_offset(unsigned int pin)
+{
+	unsigned int offset = 0;
+
+	switch (pin) {
+	case 47 ... 52:
+		offset = IO_PWR_DOMAIN_GPIO3_K1;
+		break;
+	case 75 ... 80:
+		offset = IO_PWR_DOMAIN_GPIO2_Kx;
+		break;
+	case 98 ... 103:
+		offset = IO_PWR_DOMAIN_QSPI_K1;
+		break;
+	case 104 ... 109:
+		offset = IO_PWR_DOMAIN_MMC_Kx;
+		break;
+	}
+
+	return offset;
+}
+
+static unsigned int spacemit_k3_pin_to_io_pd_offset(unsigned int pin)
+{
+	unsigned int offset = 0;
+
+	switch (pin) {
+	case 0 ... 20:
+		offset = IO_PWR_DOMAIN_GPIO1_K3;
+		break;
+	case 21 ... 41:
+		offset = IO_PWR_DOMAIN_GPIO2_Kx;
+		break;
+	case 76 ... 98:
+		offset = IO_PWR_DOMAIN_GPIO4_K3;
+		break;
+	case 99 ... 127:
+		offset = IO_PWR_DOMAIN_GPIO5_K3;
+		break;
+	case 132 ... 137:
+		offset = IO_PWR_DOMAIN_MMC_Kx;
+		break;
+	case 138 ... 144:
+		offset = IO_PWR_DOMAIN_QSPI_K3;
+		break;
+	}
+
+	return offset;
+}
+
 static inline void __iomem *spacemit_pin_to_reg(struct spacemit_pinctrl *pctrl,
 						unsigned int pin)
 {
@@ -365,6 +441,42 @@ static int spacemit_pctrl_check_power(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static void spacemit_set_io_pwr_domain(struct spacemit_pinctrl *pctrl,
+				      const struct spacemit_pin *spin,
+				      const enum spacemit_pin_io_type type)
+{
+	u32 offset, val = 0;
+
+	if (!pctrl->regmap_apbc)
+		return;
+
+	offset = pctrl->data->pin_to_io_pd_offset(spin->pin);
+
+	/* Other bits are reserved so don't need to save them */
+	if (type == IO_TYPE_1V8)
+		val = IO_PWR_DOMAIN_V18EN;
+
+	/*
+	 * IO power domain registers are protected and cannot be accessed
+	 * directly. Before performing any read or write to the IO power
+	 * domain registers, an explicit unlock sequence must be issued
+	 * via the AIB Secure Access Register (ASAR).
+	 *
+	 * The unlock sequence allows exactly one subsequent access to the
+	 * IO power domain registers. After that access completes, the ASAR
+	 * keys are automatically cleared, and the registers become locked
+	 * again.
+	 *
+	 * This mechanism ensures that IO power domain configuration is
+	 * performed intentionally, as incorrect voltage settings may
+	 * result in functional failures or hardware damage.
+	 */
+	regmap_write(pctrl->regmap_apbc, APBC_ASFAR, APBC_ASFAR_AKEY);
+	regmap_write(pctrl->regmap_apbc, APBC_ASSAR, APBC_ASSAR_AKEY);
+
+	writel_relaxed(val, pctrl->regs + IO_PWR_DOMAIN_OFFSET + offset);
+}
+
 static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 					 struct device_node *np,
 					 struct pinctrl_map **maps,
@@ -572,7 +684,8 @@ static int spacemit_pinconf_get(struct pinctrl_dev *pctldev,
 
 #define ENABLE_DRV_STRENGTH	BIT(1)
 #define ENABLE_SLEW_RATE	BIT(2)
-static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
+static int spacemit_pinconf_generate_config(struct spacemit_pinctrl *pctrl,
+					    const struct spacemit_pin *spin,
 					    const struct spacemit_pinctrl_dconf *dconf,
 					    unsigned long *configs,
 					    unsigned int num_configs,
@@ -646,6 +759,7 @@ static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
 			default:
 				return -EINVAL;
 			}
+			spacemit_set_io_pwr_domain(pctrl, spin, type);
 		}
 
 		val = spacemit_get_driver_strength(type, dconf, drv_strength);
@@ -701,7 +815,7 @@ static int spacemit_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
 	u32 value;
 
-	if (spacemit_pinconf_generate_config(spin, pctrl->data->dconf,
+	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
 					     configs, num_configs, &value))
 		return -EINVAL;
 
@@ -724,7 +838,7 @@ static int spacemit_pinconf_group_set(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	spin = spacemit_get_pin(pctrl, group->grp.pins[0]);
-	if (spacemit_pinconf_generate_config(spin, pctrl->data->dconf,
+	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
 					     configs, num_configs, &value))
 		return -EINVAL;
 
@@ -795,6 +909,7 @@ static const struct pinconf_ops spacemit_pinconf_ops = {
 
 static int spacemit_pinctrl_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct spacemit_pinctrl *pctrl;
 	struct clk *func_clk, *bus_clk;
@@ -816,6 +931,12 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pctrl->regs))
 		return PTR_ERR(pctrl->regs);
 
+	pctrl->regmap_apbc = syscon_regmap_lookup_by_phandle(np, "spacemit,apbc");
+	if (IS_ERR(pctrl->regmap_apbc)) {
+		dev_warn(dev, "no syscon found, disable power voltage switch functionality\n");
+		pctrl->regmap_apbc = NULL;
+	}
+
 	func_clk = devm_clk_get_enabled(dev, "func");
 	if (IS_ERR(func_clk))
 		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
@@ -1118,6 +1239,7 @@ static const struct spacemit_pinctrl_data k1_pinctrl_data = {
 	.data = k1_pin_data,
 	.npins = ARRAY_SIZE(k1_pin_desc),
 	.pin_to_offset = spacemit_k1_pin_to_offset,
+	.pin_to_io_pd_offset = spacemit_k1_pin_to_io_pd_offset,
 	.dconf = &k1_drive_conf,
 };
 
@@ -1455,6 +1577,7 @@ static const struct spacemit_pinctrl_data k3_pinctrl_data = {
 	.data = k3_pin_data,
 	.npins = ARRAY_SIZE(k3_pin_desc),
 	.pin_to_offset = spacemit_k3_pin_to_offset,
+	.pin_to_io_pd_offset = spacemit_k3_pin_to_io_pd_offset,
 	.dconf = &k3_drive_conf,
 };
 

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
