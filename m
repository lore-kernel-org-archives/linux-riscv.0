Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB21CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vc4BTfBkIV1G/Ou3QGLL/3R+EibsdQ+nLE5ePgBUpU=; b=E3KmpdbT45jEbs
	F2z/PreKkervw+8LW3nefQQTaHa4329oqLmEYSNnS4dVA8sHa5R+vpVqWzQu/ntJIPmxeRIFnIO+K
	dKFf8A16WPjeGmOhIhpNboxbw1ikDifQordyW+MvAOSe8WqLaFB6b8sUPfzdXPCVRfIH6hBYjvy+Z
	oh/qSJKMheoR4ykimV6I7RlOUWf1axk5NZ+xalHim7xVYtl0r0BrCPAssU3pHVMares/lhfIjKTSL
	lqQRDnH7WLs+5tv+k3OGBAxDVtu4C/dtq9vHlHOIGNJQnwvQxBlrk7/B53hWnFc1g03Rf3RZmCNRy
	Smr+4Ezu068colTh7VCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGtP-00000000x1l-3PyH;
	Tue, 19 May 2026 09:37:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGtN-00000000wzw-1SHt
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 09:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17C674421A;
	Tue, 19 May 2026 09:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32644C2BCF5;
	Tue, 19 May 2026 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183457;
	bh=8pnXCimxvUfNZJTuvj5cbE0l0aw6K9TRDdNYEip+NcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Iw5Xoizd4zvKo/tB/LOHquuUCFSvBVE7YDhESTHbzWQXIVyzkt8Bh0B0XHB4nUWXq
	 dsAmlNJ+3jCidfiFkDSTuKvQHIlM2REmSXCN4SOnoqUBhIX6yDyyG1gUSmfqHcAGbH
	 tjVN/yeJJJi2CB+Kdh2YTFL+iJQc6lEuhAA0mp5yHV/S8T2Onk4DIKYbXAEawB3TMC
	 LM/3qcL0IDHdBQKIG32JJZUIHvD9rl5lkVZvXfwGpmaqpp7zOtIK/d4meaukRjeQi/
	 Z/WsPZe9u1gM/vIyZYJA8m0lcv3MnVllyuOESM5syK6d4HvAilA2WKeh/Skdnofg3u
	 JhDPlHZbmQHQQ==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v2 4/4] pinctrl: spacemit: move over to generic pinmux dt_node_to_map implementation
Date: Tue, 19 May 2026 10:37:25 +0100
Message-ID: <20260519-cosmetics-careless-0e9a219c51ef@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519-germinate-ageless-631033d22797@spud>
References: <20260519-germinate-ageless-631033d22797@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6986; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=W023L0/ELOiyf4uTaGH6YKjJuH+4shQM+HkkXMqZAK4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFk8+sFrJhQ2MF99LXCk4c+n+jXvHF8rvr7gsbB4dcbpS +fOhez81FHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJNOoxMixk8NPRE17iuOuC +l+LoN1BJoGbDrrwfzo3xSHlc9lWGU2Gf/Z+Ot/4tm7Nac5v3t3TOtV/W9iZXUv/dTZ8eNARskT xDAcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_023737_432297_6F80A53C 
X-CRM114-Status: GOOD (  19.25  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Replace the custom implementation of dt_node_to_map with
pinctrl_generic_dt_node_to_map() to demonstrate its use.
spacemit_pin_mux_config didn't provide much value in the first place,
because the group contains the information required to look up the
spacemit_pin struct corresponding to a pin, so there's no loss in
functionality as a result of the generic function carrying only the mux
data in the group's data pointer rather than having an array of
spacemit_pin_mux_config structs.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/spacemit/Kconfig      |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c | 140 ++------------------------
 2 files changed, 12 insertions(+), 132 deletions(-)

diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
index c021d51033d16..b2365deffe1be 100644
--- a/drivers/pinctrl/spacemit/Kconfig
+++ b/drivers/pinctrl/spacemit/Kconfig
@@ -8,9 +8,7 @@ config PINCTRL_SPACEMIT_K1
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on OF
 	default ARCH_SPACEMIT
-	select GENERIC_PINCTRL_GROUPS
-	select GENERIC_PINMUX_FUNCTIONS
-	select GENERIC_PINCONF
+	select GENERIC_PINCTRL
 	help
 	  Say Y to select the pinctrl driver for K1/K3 SoC.
 	  This pin controller allows selecting the mux function for
diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 95c891c4c8fb4..394ef0cd26bcc 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -114,11 +114,6 @@ struct spacemit_pinctrl_data {
 	const struct spacemit_pinctrl_dconf	*dconf;
 };
 
-struct spacemit_pin_mux_config {
-	const struct spacemit_pin	*pin;
-	u32				config;
-};
-
 /* map pin id to pinctrl register offset, refer MFPR definition */
 static unsigned int spacemit_k1_pin_to_offset(unsigned int pin)
 {
@@ -228,16 +223,6 @@ static inline void __iomem *spacemit_pin_to_reg(struct spacemit_pinctrl *pctrl,
 	return pctrl->regs + pctrl->data->pin_to_offset(pin);
 }
 
-static u16 spacemit_dt_get_pin(u32 value)
-{
-	return value >> 16;
-}
-
-static u16 spacemit_dt_get_pin_mux(u32 value)
-{
-	return value & GENMASK(15, 0);
-}
-
 static const struct spacemit_pin *spacemit_get_pin(struct spacemit_pinctrl *pctrl,
 						   unsigned long pin)
 {
@@ -445,121 +430,12 @@ static void spacemit_set_io_pwr_domain(struct spacemit_pinctrl *pctrl,
 	writel_relaxed(val, pctrl->regs + IO_PWR_DOMAIN_OFFSET + offset);
 }
 
-static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
-					 struct device_node *np,
-					 struct pinctrl_map **maps,
-					 unsigned int *num_maps)
-{
-	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct device *dev = pctrl->dev;
-	struct device_node *child;
-	struct pinctrl_map *map;
-	const char **grpnames;
-	const char *grpname;
-	int ngroups = 0;
-	int nmaps = 0;
-	int ret;
-
-	for_each_available_child_of_node(np, child)
-		ngroups += 1;
-
-	grpnames = devm_kcalloc(dev, ngroups, sizeof(*grpnames), GFP_KERNEL);
-	if (!grpnames)
-		return -ENOMEM;
-
-	map = kzalloc_objs(*map, ngroups * 2);
-	if (!map)
-		return -ENOMEM;
-
-	ngroups = 0;
-	guard(mutex)(&pctrl->mutex);
-	for_each_available_child_of_node_scoped(np, child) {
-		struct spacemit_pin_mux_config *pinmuxs;
-		unsigned int config, *pins;
-		int i, npins;
-
-		npins = of_property_count_u32_elems(child, "pinmux");
-
-		if (npins < 1) {
-			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn\n",
-				np, child);
-			return -EINVAL;
-		}
-
-		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn",
-					 np, child);
-		if (!grpname)
-			return -ENOMEM;
-
-		grpnames[ngroups++] = grpname;
-
-		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
-		if (!pins)
-			return -ENOMEM;
-
-		pinmuxs = devm_kcalloc(dev, npins, sizeof(*pinmuxs), GFP_KERNEL);
-		if (!pinmuxs)
-			return -ENOMEM;
-
-		for (i = 0; i < npins; i++) {
-			ret = of_property_read_u32_index(child, "pinmux",
-							 i, &config);
-
-			if (ret)
-				return -EINVAL;
-
-			pins[i] = spacemit_dt_get_pin(config);
-			pinmuxs[i].config = config;
-			pinmuxs[i].pin = spacemit_get_pin(pctrl, pins[i]);
-
-			if (!pinmuxs[i].pin)
-				return dev_err_probe(dev, -ENODEV, "failed to get pin %d\n", pins[i]);
-		}
-
-		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
-		map[nmaps].data.mux.function = np->name;
-		map[nmaps].data.mux.group = grpname;
-		nmaps += 1;
-
-		ret = pinctrl_generic_add_group(pctldev, grpname,
-						pins, npins, pinmuxs);
-		if (ret < 0)
-			return dev_err_probe(dev, ret, "failed to add group %s: %d\n", grpname, ret);
-
-		ret = pinconf_generic_parse_dt_config(child, pctldev,
-						      &map[nmaps].data.configs.configs,
-						      &map[nmaps].data.configs.num_configs);
-		if (ret)
-			return dev_err_probe(dev, ret, "failed to parse pin config of group %s\n",
-				grpname);
-
-		if (map[nmaps].data.configs.num_configs == 0)
-			continue;
-
-		map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
-		map[nmaps].data.configs.group_or_pin = grpname;
-		nmaps += 1;
-	}
-
-	ret = pinmux_generic_add_function(pctldev, np->name,
-					  grpnames, ngroups, NULL);
-	if (ret < 0) {
-		pinctrl_utils_free_map(pctldev, map, nmaps);
-		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
-	}
-
-	*maps = map;
-	*num_maps = nmaps;
-
-	return 0;
-}
-
 static const struct pinctrl_ops spacemit_pctrl_ops = {
 	.get_groups_count	= pinctrl_generic_get_group_count,
 	.get_group_name		= pinctrl_generic_get_group_name,
 	.get_group_pins		= pinctrl_generic_get_group_pins,
 	.pin_dbg_show		= spacemit_pctrl_dbg_show,
-	.dt_node_to_map		= spacemit_pctrl_dt_node_to_map,
+	.dt_node_to_map		= pinctrl_generic_pinmux_dt_node_to_map,
 	.dt_free_map		= pinctrl_utils_free_map,
 };
 
@@ -568,8 +444,8 @@ static int spacemit_pmx_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct group_desc *group;
-	const struct spacemit_pin_mux_config *configs;
 	unsigned int i, mux;
+	unsigned int *configs;
 	void __iomem *reg;
 
 	group = pinctrl_generic_get_group(pctldev, gsel);
@@ -579,11 +455,17 @@ static int spacemit_pmx_set_mux(struct pinctrl_dev *pctldev,
 	configs = group->data;
 
 	for (i = 0; i < group->grp.npins; i++) {
-		const struct spacemit_pin *spin = configs[i].pin;
-		u32 value = configs[i].config;
+		const struct spacemit_pin *spin;
+		u32 value = configs[i];
+
+		spin = spacemit_get_pin(pctrl, group->grp.pins[i]);
+		if (!spin) {
+			dev_err(pctrl->dev, "Invalid pin %u\n", group->grp.pins[i]);
+			return -EINVAL;
+		}
 
 		reg = spacemit_pin_to_reg(pctrl, spin->pin);
-		mux = spacemit_dt_get_pin_mux(value);
+		mux = value;
 
 		guard(raw_spinlock_irqsave)(&pctrl->lock);
 		value = readl_relaxed(reg) & ~PAD_MUX;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
