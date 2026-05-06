Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E33CD342C
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 09:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1Q5Ulqo9eHX4hbpm1w1ILy0WF+ULkg7/r1qEFRRCgI=; b=lRMug/yIPzer8+
	hgkrO6vZONYulfgUauT/9Q9+XRNXV44YwiFDmj8c9b908aY8EvVEBCY3X67a06rOuwW2ZMKg/yFwP
	8g3dh3Vhq8PWi6lgktNUNXq2nlst/Sp+RrI+XC+9vxrDttMK88B6CAx9Mtm3kKpzpxxJ+Zoe9J1m6
	SenmQ+fwwZD7tH8ulAJstVlO18jilRrkys8ymuS0rzQHwDQJr0A07xe/iy6HXjXBFMkBQDZui1dEa
	7vLuAxK4Ybgv/xC11yRpsGXmQfAyCT8ZNC8BANXuEvGrMsnn4F6VBw3V7OcELnX2+HNCxCNqgr1dp
	JyKVj7fo63z0gUTQPzNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZ1C-00000000QIU-466N;
	Wed, 06 May 2026 09:58:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZ1B-00000000QHC-2FP4
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 09:58:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE1B8404F9;
	Wed,  6 May 2026 09:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05979C2BCC4;
	Wed,  6 May 2026 09:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061492;
	bh=TVBXqFY3A1biRCKkk5PCThVDRBq0+hrygrveT6A+Tc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cw6BHAn2KmedwdcWVbFXyvNcRPQEIRONAyjCBbZ+epA5/Sa7T/Ud1NCNhWle/9UHx
	 jfpgSRECQquqSvlIA4GW+QdRpHLHLSGyC2K+fgaLI+ANLYDYltVxEC+bHRKVYsFMuw
	 3q+lH+i4aruIE3OIvHDNUs5eFcL3WctXZd6MKbJ6iOfMnDnc8dpSBldIUByhKmz2Wp
	 hQydrlJrIHnKguASji1EU9DHOgI/CxHSCEl09PrTWXFe1yUpvjpA9AuMGnJ98aH0Mk
	 1AKWaJNIs8AEkeqfU/S7B/opRpgv/aGx1fuRnbLihUaiKtKBJutorUf8jBZjnrjdfc
	 AjxRXWJA2Eypg==
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
Subject: [RFC v1 2/4] pinctrl: add new generic groups/function creation function for pinmux
Date: Wed,  6 May 2026 10:57:40 +0100
Message-ID: <20260506-matted-prominent-6352c26a65a6@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506-energize-dramatize-051909e54256@spud>
References: <20260506-energize-dramatize-051909e54256@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5876; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=IAVHCqBTU/I3FABmI0dhZe5pmDWDVP85YHHq0Hd5uPY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm/BSazdPHMnDO9p/DhFo6FG3kW7/d03HzCUur7NR85/ 50eJ/Vfd5SyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiZ6UY/pk5BU3UcHJ8XKv+ +Od6bc1NDYpNV/Mre58flTEp7gvfc5vhr7TJSa7G52+PuUxQ5Yh+tEjmpcqam1mKrSvzuyx+RFb +5AMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_025813_621471_5D9B4346 
X-CRM114-Status: GOOD (  15.86  )
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/pinconf.h         |  14 ++++
 drivers/pinctrl/pinctrl-generic.c | 134 ++++++++++++++++++++++++++++++
 2 files changed, 148 insertions(+)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 5d99fef27657f..30c42d81e8829 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -167,6 +167,11 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 						 struct pinctrl_map **maps,
 						 unsigned int *num_maps);
 
+int pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **maps,
+					  unsigned int *num_maps);
+
 int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
 			   struct device_node *np, struct pinctrl_map **maps,
 			   unsigned int *num_maps, unsigned int *num_reserved_maps,
@@ -182,6 +187,15 @@ pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return -ENOTSUPP;
 }
 
+static inline int
+pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+				      struct device_node *np,
+				      struct pinctrl_map **maps,
+				      unsigned int *num_maps)
+{
+	return -ENOTSUPP;
+}
+
 static inline int
 pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
 		       struct device_node *np, struct pinctrl_map **maps,
diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index 6a13fd4eea65b..69df211f6b964 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -202,3 +202,137 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pinctrl_generic_pins_function_dt_node_to_map);
+
+
+static int pinctrl_generic_pinmux_dt_subnode_to_map(struct pinctrl_dev *pctldev,
+						    struct device_node *parent,
+						    struct device_node *np,
+						    struct pinctrl_map **maps,
+						    unsigned int *num_maps,
+						    unsigned int *num_reserved_maps,
+						    const char **group_names,
+						    unsigned int ngroups)
+{
+	struct device *dev = pctldev->dev;
+	unsigned int *pins, *muxes;
+	int npins, ret;
+
+	npins = of_property_count_u32_elems(np, "pinmux");
+
+	if (npins < 1) {
+		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
+			parent, np, npins);
+		return npins;
+	}
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	muxes = devm_kcalloc(dev, npins, sizeof(*muxes), GFP_KERNEL);
+	if (!muxes)
+		return -ENOMEM;
+
+	for (int i = 0; i < npins; i++) {
+		unsigned int pinmux;
+
+		ret = of_property_read_u32_index(np, "pinmux", i, &pinmux);
+		if (ret)
+			return ret;
+
+		pins[i] = pinmux >> 16;
+		muxes[i] = pinmux & GENMASK(15, 0);
+	}
+
+	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
+				      num_reserved_maps, group_names, ngroups,
+				      muxes, pins, npins);
+}
+
+/*
+ * For platforms that do not define groups or functions in the driver, but
+ * instead use the devicetree to describe them. This function will, unlike
+ * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
+ * and functions, create them in addition to parsing pinconf properties and
+ * adding mappings.
+ *
+ * It assumes that the upper 16 bits of the pinmux items contain the pin
+ * and the lower 16 the mux setting.
+ */
+int pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **maps,
+					  unsigned int *num_maps)
+{
+	struct device *dev = pctldev->dev;
+	struct device_node *child_np;
+	const char **group_names;
+	unsigned int num_reserved_maps = 0;
+	int ngroups = 0;
+	int ret;
+
+	*maps = NULL;
+	*num_maps = 0;
+
+	/*
+	 * Check if this is actually the pinmux node, or a parent containing
+	 * multiple pinmux nodes.
+	 */
+	if (!of_property_present(np, "pinmux"))
+		goto parent;
+
+	group_names = devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
+	if (!group_names)
+		return -ENOMEM;
+
+	ret = pinctrl_generic_pinmux_dt_subnode_to_map(pctldev, np, np,
+						       maps, num_maps,
+						       &num_reserved_maps,
+						       group_names,
+						       ngroups);
+	if (ret) {
+		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+		return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", np->name);
+	}
+
+	ret = pinmux_generic_add_function(pctldev, np->name, group_names, 1, NULL);
+	if (ret < 0) {
+		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
+	}
+
+	return 0;
+
+parent:
+	for_each_available_child_of_node(np, child_np)
+		ngroups += 1;
+
+	group_names = devm_kcalloc(dev, ngroups, sizeof(*group_names), GFP_KERNEL);
+	if (!group_names)
+		return -ENOMEM;
+
+	ngroups = 0;
+	for_each_available_child_of_node_scoped(np, child_np) {
+		ret = pinctrl_generic_pinmux_dt_subnode_to_map(pctldev, np, child_np,
+							       maps, num_maps,
+							       &num_reserved_maps,
+							       group_names,
+							       ngroups);
+		if (ret) {
+			pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n",
+					     np->name);
+		}
+
+		ngroups++;
+	}
+
+	ret = pinmux_generic_add_function(pctldev, np->name, group_names, ngroups, NULL);
+	if (ret < 0) {
+		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pinctrl_generic_pinmux_dt_node_to_map);
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
