Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2558DCD342C
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 09:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5efhEhdodmAbu+IBntg5lRagCzFOr/W1eyKoR0L23c=; b=e/jdIodbmHmgQg
	d9sfUrWW+65HN4sTIeOaQnfIDJg7H6RINvkYFKZw8p2j0aeNd6UwXE34ZxJcayYSuWYbuZprlKxHo
	Rg4oanTa8yCxCHLpJhnyBdQOsc/zDgX5t7I9pvaFjerhryvYlg0/7w1QFDkNItxCzKQGBlcyQdST7
	oWyeCCLKcj86LZ6hWSVEudvs1EZ9pryTkPPJ3jsvEXzHY9vnssU6XdE/MAr53VZzDP3d+d3oazXNQ
	/7Wj4dAb3iXHnD2gHFb+AoTB+E5hxh2pdnf42tsKpwPTRLmokWUvV/X7tghEpMxJu9g/di/e6pesz
	SLSXF8wt76I5j+4kB44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZ1H-00000000QLc-0ajw;
	Wed, 06 May 2026 09:58:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZ1G-00000000QKl-1XXM
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 09:58:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7069A60180;
	Wed,  6 May 2026 09:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60557C2BCC9;
	Wed,  6 May 2026 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061497;
	bh=v2Z43waBNb1sScGZkywyBPPfu9AJTH0bPEJbypNx/9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WG44oO9TMvF7kiD51Etx91un/RdtZOeMoteCnQgQFqUaqeA25FD+DAHQIemqgDZng
	 56v2HgLykir7ilGwY9wv7O7zsRQvLUgh5yDL6057DboKTr1t3Py+T+6fRjT0wPJsW8
	 CdoPtl1bodVpxIaCoadImuzAM6g7WIWpVpbgBiwlZQpAqExNBrz1j8fUi9MLTQVy4p
	 yXc1RAc8fUEGvdOwVurE48hcOFFCAwlnvPWr1Co5fXGmL1rkzzS/f9hVLCB+UTHR0X
	 kiT5vg85L0QLRi+TpixO/5bbuxbl+WQzFAIoaf9HUpWupesFCATXTu2Wvyob4pHuh8
	 UqMinIs5doyBQ==
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
Subject: [RFC v1 4/4] pinctrl: spacemit: move over to generic pinmux dt_node_to_map implementation
Date: Wed,  6 May 2026 10:57:42 +0100
Message-ID: <20260506-womb-bonus-68a236490084@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506-energize-dramatize-051909e54256@spud>
References: <20260506-energize-dramatize-051909e54256@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3606; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=EBo7vsj45Fm6ts8vxVZqmKyxIs0BuENJUV4vbK7h45M=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm/BSb39VRuPlyx7dTVybtPFKcGfqt8LVWl+3qm9zZDQ Z9Oix2nO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARz4+MDPvXrE5ff0aqJjZ+ 72rz29sKlLcx7hURWFDwKJSjs+PzSw6Gf4Y7Z25c31Yd73LtiJXD7brJorYHdHd7HHn/8v2O0Gw XcSYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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
 drivers/pinctrl/spacemit/pinctrl-k1.c | 33 ++++++++++-----------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 41d8a34bc386b..c90b6ccfce2ea 100644
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
@@ -474,7 +469,6 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	ngroups = 0;
 	guard(mutex)(&pctrl->mutex);
 	for_each_available_child_of_node_scoped(np, child) {
-		struct spacemit_pin_mux_config *pinmuxs;
 		unsigned int config, *pins;
 		int i, npins;
 
@@ -497,10 +491,6 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		if (!pins)
 			return -ENOMEM;
 
-		pinmuxs = devm_kcalloc(dev, npins, sizeof(*pinmuxs), GFP_KERNEL);
-		if (!pinmuxs)
-			return -ENOMEM;
-
 		for (i = 0; i < npins; i++) {
 			ret = of_property_read_u32_index(child, "pinmux",
 							 i, &config);
@@ -509,11 +499,6 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				return -EINVAL;
 
 			pins[i] = spacemit_dt_get_pin(config);
-			pinmuxs[i].config = config;
-			pinmuxs[i].pin = spacemit_get_pin(pctrl, pins[i]);
-
-			if (!pinmuxs[i].pin)
-				return dev_err_probe(dev, -ENODEV, "failed to get pin %d\n", pins[i]);
 		}
 
 		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
@@ -522,7 +507,7 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		nmaps += 1;
 
 		ret = pinctrl_generic_add_group(pctldev, grpname,
-						pins, npins, pinmuxs);
+						pins, npins, &config);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "failed to add group %s: %d\n", grpname, ret);
 
@@ -559,7 +544,7 @@ static const struct pinctrl_ops spacemit_pctrl_ops = {
 	.get_group_name		= pinctrl_generic_get_group_name,
 	.get_group_pins		= pinctrl_generic_get_group_pins,
 	.pin_dbg_show		= spacemit_pctrl_dbg_show,
-	.dt_node_to_map		= spacemit_pctrl_dt_node_to_map,
+	.dt_node_to_map		= pinctrl_generic_pinmux_dt_node_to_map,
 	.dt_free_map		= pinctrl_utils_free_map,
 };
 
@@ -568,8 +553,8 @@ static int spacemit_pmx_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct group_desc *group;
-	const struct spacemit_pin_mux_config *configs;
 	unsigned int i, mux;
+	unsigned int *configs;
 	void __iomem *reg;
 
 	group = pinctrl_generic_get_group(pctldev, gsel);
@@ -579,11 +564,17 @@ static int spacemit_pmx_set_mux(struct pinctrl_dev *pctldev,
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
