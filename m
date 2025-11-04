Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B9ACCFA04
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XN4jXum0h2BcI1UgKFsoLxVDrs6fXjUmMn0ooQ4JgXw=; b=kGGYzhLynsc9LV
	AZNabs58KWATR4osERRuKycuxoyR/QHh7hmMu7Jzg7LP/Y2tbBTyiAkTnyFaluON0BxnCj/o0k5SA
	f6Kdlp/8oKzMu3GIoXJLFFJMiTfFtCmtKmJode8/x3htg33Yl3YfpU19BLbVZ3XGNBCq7meN8mO2U
	tsODRbSVkcQe6rPNZpV45fTgRG+4JhIfio1YdVLcedKgXbbBGEK4bkqWEfwzaY/V2IFGXOktKgXMq
	rIioA+Orj7tfVuIf2wdMvBSA4JqCCTJe7cl4VNT7AUqImiEr7NrO6ma9idPLxdao6M+03dd174ug9
	QVINmwnSbGsaABj58+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGn9-0000000Bqnt-27X6;
	Tue, 04 Nov 2025 13:09:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGn5-0000000Bqhs-3tE7
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 13:09:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47112a73785so36403825e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Nov 2025 05:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261778; x=1762866578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IW9Ne798a3XGNxpeP/XYKMinJIQLw0sjHAkXdXk9L6c=;
        b=PNjYxwgJfW1d8bQ+X3cABgshHA1IFcrPtnponGglBiTS7TS5hMa4cJBJIc+KxapVLN
         gY6I49333c3qoCHXrkiZF0dSVr6wDnsO5oiR9gwyDjvP4bhX2+ZF5qEswe66i+i/rqzB
         yTWntd1Wvk/2I3TFCARnpBy5AsoHIPA1WmNS2gYZgFX0mu77iz6yX5IIl3ZaCqn9ekKc
         H2oS72hJYluCxQ97LGhwA8PueBWnp20u3aSC0tMFKYSn1fLTQls+ubvmgcHySCHfcYyb
         54T/Y6dtupPhQia/ELGQo6zxiW00RctRJIPhms4Q8Q2tBfXebAETLYEiPc94AKdrISwR
         +WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261778; x=1762866578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IW9Ne798a3XGNxpeP/XYKMinJIQLw0sjHAkXdXk9L6c=;
        b=pcc0gOv9jnxmOq8S82coVsTrPmTyF51HUcYHeUnRZydGjGTUkPohLW4urJ8kRbBIYV
         m/hjTeeiKDtfXNAiFkhAndMb37FPyA3b6hZUXtuS6T7fSY1Xf2Ivtp33s19ua20vL0GN
         Qe1cynSIOb4xJJCTIisW84X8ox7BmOc9tHwVjaPkvSuOujKdX5UefHVb8ZZxeTG+J214
         LCQ9aX84ZaRy1UNQvkXyTynJOgO1B8QJApNDavb96QkKChXisVWtHaoJPWfglHN4/Qhq
         W1kYg3D4QMApu+NBQLrg8ObGnscOYITZpfr887EtrPIJ33h/c0mcHRBvxpVMDRjotdc/
         FNJg==
X-Forwarded-Encrypted: i=1; AJvYcCVUsuoqvyWlEp2xyJ3/6g8qv2ip2pswBwL441AExzuQ5+CLHdj2RZBEcZPkzvwgeqDOCmb54K82YIytuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyfUgSk5YUlWm7oi5P7HDVOtm8TOF91Yp2okl9JLL8PFA73FAm
	/ivculYZz4jTvEcRj13QqoWfYEYA6BZPvv4og5Cni6CBHWZfDWramr8L9y+VfpVl5wE=
X-Gm-Gg: ASbGnct0Gs+YWDY7H8/ao9bKKbCrvwWciblcabgqtR34Z2WmzTZWj7GF47zynvxR2sW
	JkoXOOXD92QY9FI+bkGW06xgEKdETISm1MSYDz/cXKbznrXfFUSJ/YAzND/Mp8M1Gk8p6VRtn/d
	nY0vhO86Zg0KuseXUsakK8CGDC9xoQjNnjsoapZvfCtDcZCYbLeW6+7nMiDcC0u3noJXjiHMsUp
	6lhfLoHWrGEv1TKsiCAhSZuUKPSvTS5Ot3HQflBjxAid8gS2D/3OMYJSuqHE3QDkIrKGOfhF2GA
	he2rD4hbz8e5uAKBusyJTHzwaUpuPa8c8pSj4lGFy7kWkZyGCbPWzpU6RK00lbf84i8F2b1vaNB
	EZ5AtUnuc+keTzYJOtsv+7l+H1cZU8wTR6ri15IjZgPDeG5f2bI37rPf4vjh4UDiAw2X48Q==
X-Google-Smtp-Source: AGHT+IG1GvRdz1G4OVuTzfGg2rW2umU84ydK8m7ey6D7UWi4H5D+BCD/zY38vh6KQiL9kxoSITMbLQ==
X-Received: by 2002:a05:600c:3b0f:b0:46e:4a60:ea2c with SMTP id 5b1f17b1804b1-477308a897dmr149553725e9.37.1762261777808;
        Tue, 04 Nov 2025 05:09:37 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 04 Nov 2025 14:08:57 +0100
Subject: [PATCH v4 6/8] net: stmmac: qcom-ethqos: split power management
 context into a separate struct
MIME-Version: 1.0
Message-Id: <20251104-qcom-sa8255p-emac-v4-6-f76660087cea@linaro.org>
References: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
In-Reply-To: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4943;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ywDusXCc0OEyB5wkP2D4YZe7bremgDjiZGqRKKOTVlo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfrtclrVDAlMIr4bBijfyWznJtGzxJmoLoxKY
 +2FL+/n8aeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn67QAKCRARpy6gFHHX
 ctIBEAC2l+TiXa3iP8a5AInCFJWKNapCdwbhYWx13UqtZMBgW57BQKI3iEtjlqAPNohvqcgOctk
 0JUeVMqskmHXPpKwwqXRPXzoNcJlfipAmbpDAzCKW5iALUWMCiaFodgqdz97ML0c0AyT/PoLbrw
 XiUG6dk5NJ0tD5FL0E0tOGhQEcTv0llsBYVuwRBVNSih7rrSmLIzNECL0arhuok0qFj4R2v5YYX
 1F0ol9gnXR7+OMae+CNJUSmao4IGbk1uotH7t5QQAnw9hroGg2dCtNdzX/pesedZR4OGaP/R9P9
 2tAq63d7pcOZUdwrvoSiBCdncHK5IqlM43kBDojNWhirTdjWhHKVgPJn72ZjZzQ7FD5MRJqRyAw
 e+7OtVgHYukGRDwG2OaXWZbBnxVInaIOoniDe1GCRgIgS6mM2rw0CetFQSWGQ3ZG2acoLvkh4lV
 9vBPdvoIfSzZTY2R+MEUJIqGRK5HYHu6mxbtEr8fck31gHO8MRyW/lu6YFC8hdbUDrGuz3rtkx+
 G8Vv10l2V7R/fjBI+kdB5yBACw0w79wQbFLyjvw5hdCrT1B4TmqCWuLT8twrdUZaIxTGPsrbImt
 pd1NcGf7YFp3IasjD5uizb7PejGV/SG8p8rUuiN1q6g/l9/Tz2nFK6/zrSv9zmEvgLcfXLWWEBD
 LXjn9oDxsxIrmnQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_050940_601110_63AEDBCA 
X-CRM114-Status: GOOD (  16.42  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1f00556bbad997e2ec76b521cffe2eb14fabb79e..09f122062dec87aa11804af2769ddff4964e6596 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,17 +105,21 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	unsigned int link_clk_rate;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
-	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
+	int serdes_speed;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -181,9 +185,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -639,7 +643,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -708,23 +712,23 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 }
 
 static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -733,7 +737,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -746,7 +750,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -843,9 +847,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -856,9 +860,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
@@ -880,7 +884,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
