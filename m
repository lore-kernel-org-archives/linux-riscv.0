Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA36E6F077
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBHohs46AJXQsv6BkzLcoVRz3jC4AJN4t9eQM9Uoeq0=; b=KR0NkLVa5/wl0M
	wX8rMrW8i4JGRuAUq+K2SSn4yjd0jNIjUMmthWj/uZleP0rHHo0r5tcbFD1jjucy+HhXuEzriZiCM
	q9Z+dZ71tN59Muba8qkZKBu5uNJY+M9HvkTiOXsPLy7Os5nkaVQDXtRKwM9+4qg3LONWtCKqM1Ymj
	D453MbcJ7ybPenIEz/8jhsNqK7feWhZQXnZWg1zTF6eRkpl+9n5++rYgU3jZ8NITOc14d653iA/Vb
	1kJtQZH6JnTeiS+13EBkISiGzLQGURNHcmYCLKvrbJI0QCFwH391Tn1ZiLVuzJQ7wqzJbQdeI7ySZ
	bxi0FtFLJf/EfcFtnZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyRg-0000000Ej7h-3TVv;
	Tue, 23 Dec 2025 09:12:44 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXyRe-0000000Ej5l-0Nfw
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 09:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766481096;
	bh=VrMTiF3Zn2O9PQiW+qTsH5ZlSMA1veprIN9lAh4I/YY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=VoM+u2T1CSp64UQYA/CLm6CcGqt3yMOwFg24b++2QXR0e0YulKFOMRS7OGvBA0+X8
	 zDIAV3lt11RuUYRZ/Mqsba4j/7+AesyMAE643GoZ/m9ZDhc8SSq4HLRY1kvDKG85bf
	 23H1tjFgFC9NNO1xz/A9VbH2Mq37mPTAjWjYoBWU=
X-QQ-mid: zesmtpgz6t1766481084t16904670
X-QQ-Originating-IP: kcO+ntnvqeIk2ReWF769Ryi38sTAnoxbRaBrt9Wf5Cg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Dec 2025 17:11:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13884977633580607309
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 23 Dec 2025 17:11:12 +0800
Subject: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
MIME-Version: 1.0
Message-Id: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481072; l=9633;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=H8MAD1flgSxo90tf4qKPSiR3GbcLMbZ+riVLpJiUFeU=;
 b=Ryg7x+nRbvlWZcilYWuGa/45Bnr1Zz4dgKQfhGSaY7yKcvi1U/0C8htiYBTG/5qUhhyEILGRn
 Obe2NsP1zEBAt2meH8kGgwMXi2+xW2HFXSlP6Tbo4xac8NtGYHNolve
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MSChSQevc97Umce3IsAQNK+p1Pv2RS70N79Z0gKTIyiOWRivsNCLyk1q
	CqgM1JyN7JxEcK19k7+OZxRDpNCtOkpO2yukI/LihCP16/xOe3VnLy0a8DluLEIvog8ENm+
	LZ87Zqxv0bAVJpVIXuwF8TVR8QDPv94CFptYKSHn+Oz64CzizZxa1S5BWqnw3/f8U3/6LaR
	37JOGUCnxfebz4+/1AuFNillu9oNtYxE+w/H2EIE+BQy1hgCsUSsXtJ93PQwLnYPAcnYmOb
	zWcCQPUmNjfuX0ZUBvhDmNCUfylfmwy7yc4abBD45QPRZNL6nEUCQvUGwQkJnCgV6hdzILt
	3VrJsFQFu7U1O3ZOij/2FCWiFg2jH+8IjawjYct1wS82MShJfGn4U5hbSREfTIesP3AOSaY
	6TyRkDvJ1lAJLupmyPIPvVBIC2msl1f8X2IRr0vZ2IkF2UPHoNP3t0sfWQcn8oUH7jQFN2j
	wtYYoqDdk6Q9rYXbDlBvUFmCnYKFSe5Pkw5r/vfD4AtruxnStAvgIyx8nv5FYqtTcCpNZEy
	cLdj0fZgH+bqXsK+03vqamMZX+qMFRpRQRzaA76l5AVrDy8/u1+e4o/tP3c3Ml1sTiihMvW
	ZuqVZ8/5tLU/HbaMiT3vdqSorg66Zpu09E6i03NeNBcP4q3cSTyOz5OdBjuWAslabK9HkS3
	6ebLkMxcTUVDCwTTEuBQO2bf3ZmIYbYiePokpV+HsXWDEATGB7l4kO/Ei0DSbfj0oCSzCyU
	dAM3VxSOL/MLGR0abJrB3QrY+PoOSFzrtFEAeWKtz/uuRWkt3wVBI868/5EiIzWNj+fkFfY
	66i4jDGuJnwOJShDFjbjEPqVexe6ICVf1eNzznMaK6HMm9j6UgQcrCrUzKOaA39s71U8ViL
	fLPYLAcbFGI6lTMOTEoGs4rGEz/hkEs2D/FfXH8M1IXZgd2zwiZ9/UT0G6VeQs/lrTlGTb0
	2VpOL0Z/QIBn2EOFrHl3sA1ZnOKO/yNSewKsfSj9yvUkTAKnlHS+6BHQN5rDafOn7MxHVf5
	oVCXObnOmUk3IOTI48bQOthyZyTq8ip1Xy9lPmZ8wLuh/+X/r0Lj+E8Q+qeS6G5/Nqp5i8+
	HWFtSYoRmPkPGJhHwdu5dA6T7p0e8GxPVe4wpMPpP8GZRTe4Xc6P6RvivFVz1XY2Tu3K32g
	4QvToB1uEm82hkj7MrbST+83JA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_011242_788400_D87EDEBD 
X-CRM114-Status: GOOD (  24.34  )
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

IO domain power control registers are used to configure the operating
voltage of dual-voltage GPIO banks. By default, these registers are
configured for 3.3V operation. As a result, even when a GPIO bank is
externally supplied with 1.8V, the internal logic continues to
operate in the 3.3V domain, which may lead to functional failures.

This patch adds support for programming the IO domain power control
registers, allowing dual-voltage GPIO banks to be explicitly configured
for 1.8V operation when required.

Care must be taken when configuring these registers. If a GPIO bank is
externally supplied with 3.3V while the corresponding IO power domain
is configured for 1.8V, external current injection (back-powering)
may occur, potentially causing damage to the GPIO pin.

Due to these hardware constraints and safety considerations, the IO
domain power control registers are implemented as secure registers.
Access to these registers requires unlocking via the AIB Secure Access
Register (ASAR) in the APBC block before a single read or write
operation can be performed.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c | 131 +++++++++++++++++++++++++++++++++-
 2 files changed, 131 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -565,10 +565,12 @@ i2c8: i2c@d401d800 {
 
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
-			reg = <0x0 0xd401e000 0x0 0x400>;
+			reg = <0x0 0xd401e000 0x0 0x400>,
+			      <0x0 0xd401e800 0x0 0x34>;
 			clocks = <&syscon_apbc CLK_AIB>,
 				 <&syscon_apbc CLK_AIB_BUS>;
 			clock-names = "func", "bus";
+			spacemit,apbc = <&syscon_apbc 0x50>;
 		};
 
 		pwm8: pwm@d4020000 {
diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 8ca247fb8ba0321c02423f9739130e03277d1053..b3ffb32f88a79ebf6b64e62a7846df60b92799fe 100644
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
 
@@ -47,6 +49,25 @@
 #define PAD_PULLUP		BIT(14)
 #define PAD_PULL_EN		BIT(15)
 
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
+#define APBC_ASFAR		0x00
+#define APBC_ASSAR		0x04
+
+#define APBC_ASFAR_AKEY		0xbaba
+#define APBC_ASSAR_AKEY		0xeb10
+
 struct spacemit_pin_drv_strength {
 	u8		val;
 	u32		mA;
@@ -78,6 +99,10 @@ struct spacemit_pinctrl {
 	raw_spinlock_t				lock;
 
 	void __iomem				*regs;
+	void __iomem				*io_pd_reg;
+
+	struct regmap				*regmap_apbc;
+	u32					regmap_apbc_offset;
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
@@ -365,6 +441,38 @@ static int spacemit_pctrl_check_power(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static void spacemit_set_io_pwr_domain(struct spacemit_pinctrl *pctrl,
+				      const struct spacemit_pin *spin,
+				      const enum spacemit_pin_io_type type)
+{
+	u32 offset = pctrl->data->pin_to_io_pd_offset(spin->pin);
+	u32 val = 0;
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
+	regmap_write(pctrl->regmap_apbc, pctrl->regmap_apbc_offset + APBC_ASFAR, APBC_ASFAR_AKEY);
+	regmap_write(pctrl->regmap_apbc, pctrl->regmap_apbc_offset + APBC_ASSAR, APBC_ASSAR_AKEY);
+
+	writel_relaxed(val, pctrl->io_pd_reg + offset);
+}
+
 static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 					 struct device_node *np,
 					 struct pinctrl_map **maps,
@@ -572,7 +680,8 @@ static int spacemit_pinconf_get(struct pinctrl_dev *pctldev,
 
 #define ENABLE_DRV_STRENGTH	BIT(1)
 #define ENABLE_SLEW_RATE	BIT(2)
-static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
+static int spacemit_pinconf_generate_config(struct spacemit_pinctrl *pctrl,
+					    const struct spacemit_pin *spin,
 					    const struct spacemit_pinctrl_dconf *dconf,
 					    unsigned long *configs,
 					    unsigned int num_configs,
@@ -646,6 +755,7 @@ static int spacemit_pinconf_generate_config(const struct spacemit_pin *spin,
 			default:
 				return -EINVAL;
 			}
+			spacemit_set_io_pwr_domain(pctrl, spin, type);
 		}
 
 		val = spacemit_get_driver_strength(type, dconf, drv_strength);
@@ -701,7 +811,7 @@ static int spacemit_pinconf_set(struct pinctrl_dev *pctldev,
 	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
 	u32 value;
 
-	if (spacemit_pinconf_generate_config(spin, pctrl->data->dconf,
+	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
 					     configs, num_configs, &value))
 		return -EINVAL;
 
@@ -724,7 +834,7 @@ static int spacemit_pinconf_group_set(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	spin = spacemit_get_pin(pctrl, group->grp.pins[0]);
-	if (spacemit_pinconf_generate_config(spin, pctrl->data->dconf,
+	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
 					     configs, num_configs, &value))
 		return -EINVAL;
 
@@ -795,6 +905,7 @@ static const struct pinconf_ops spacemit_pinconf_ops = {
 
 static int spacemit_pinctrl_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct spacemit_pinctrl *pctrl;
 	struct clk *func_clk, *bus_clk;
@@ -816,6 +927,18 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pctrl->regs))
 		return PTR_ERR(pctrl->regs);
 
+	pctrl->io_pd_reg = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(pctrl->io_pd_reg))
+		return PTR_ERR(pctrl->io_pd_reg);
+
+	pctrl->regmap_apbc =
+		syscon_regmap_lookup_by_phandle_args(np, "spacemit,apbc", 1,
+						     &pctrl->regmap_apbc_offset);
+
+	if (IS_ERR(pctrl->regmap_apbc))
+		return dev_err_probe(dev, PTR_ERR(pctrl->regmap_apbc),
+				     "failed to get syscon\n");
+
 	func_clk = devm_clk_get_enabled(dev, "func");
 	if (IS_ERR(func_clk))
 		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
@@ -1118,6 +1241,7 @@ static const struct spacemit_pinctrl_data k1_pinctrl_data = {
 	.data = k1_pin_data,
 	.npins = ARRAY_SIZE(k1_pin_desc),
 	.pin_to_offset = spacemit_k1_pin_to_offset,
+	.pin_to_io_pd_offset = spacemit_k1_pin_to_io_pd_offset,
 	.dconf = &k1_drive_conf,
 };
 
@@ -1455,6 +1579,7 @@ static const struct spacemit_pinctrl_data k3_pinctrl_data = {
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
