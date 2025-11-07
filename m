Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B260ECCFA05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 10:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w790T81yDhyQDJN1wlDY3MSCMmkf7okuQA/+mX3UJiM=; b=X3ak+geWdPnTgo
	E8EqWRGx87IBU6L0yXBjQhJq20rv6f0ZFUzw+3fmLC45QSDIPQaHAYgv8oXnhCqQG+H+fBVDHImxg
	HstsEdg/4NHpyX5MZvQKIsHcmKQQ9m56pNjcA5vasMvRNRUgbcsazEZqqTDmmeJGZ3p/QoaK88kyS
	kLRh61wgPXpmKBUOfImxdR/i59UoEv+E96sB/3A7DFp7jqlr+k3JidSh+GBiTnLi2/0Wrpil4BgOi
	ZPDqrFkwUp8d3+AGoGNt4LLH2gCjmoz/WG0CTNRgowu4rou6Mu4O8uIdpCl1gEg+bYQ/G8nhRakpg
	OVHqTrVFk20PpMPLFG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJjd-0000000H5Hw-2HRf;
	Fri, 07 Nov 2025 10:30:25 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJjZ-0000000H5Ao-2tlo
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 10:30:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47721743fd0so2503185e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 02:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511420; x=1763116220; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohz6eJ3JY6PCTOt6pOm4PJLek87cyeexjL7soGZmZnQ=;
        b=VXH5VAqgumd0kvOZ5fXUW0vcwiyTPSGEvXS48dDk7RzWYl+G5i/D0I2+Bp5Z210VM7
         yygLZLkG4weUdHDjfh7kWgyIQi1bDUCQ30hCfwv00zuWm3yxqT6O7HIADMZzQH4Xz7rS
         oWC+CESLH1zhJKKVqOysDOrDMGTJgkLGNg6obNkiOsARcdz+3DlhzM2HVm9HijBMd563
         7KzHK3cKJNGaFstKLdGJah/ziAyChrCOXXTCmC56Tde74bMJ5o2JJeUgiL2VjcNWFaI8
         bP9uf7ueERD3qo6uYZ8f0gfRh1BiDH+ySSrO2UQEma/CZBie68llvA4amMkfq6YfMZ5G
         0c5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511420; x=1763116220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ohz6eJ3JY6PCTOt6pOm4PJLek87cyeexjL7soGZmZnQ=;
        b=jtKvh/LfhLrq7Nkw5XiltpMbQPWvphlsSmqCSzDCc5zlvIgbeKfdhxwgmh5TSKMgSS
         izuZadz7VZGABWiNGlG0umLLckLNVI3Joq6Q9GTjeuCRE1T5qXRqJdociyNOdIMgkDg8
         eT7+ewA0vwxTx8yWnR048X462z/ynVXAg3tWKlt16KiytnRXVpTjp0ls+87GkbCDqy2R
         ZMbnd7kBhewOiXSY/RK6GJBSo8+IQCEurEOacF4kJgeNuG6KBmskVZDo33U/yvj0APoi
         eHzfdoq+LR0EGLlQelYgyey7H00WfxPoHRUvLwmrr9g33HSlaN8Hy3DFOh9klbwyW3pu
         ZEiA==
X-Forwarded-Encrypted: i=1; AJvYcCVG5ackBRo2/cKibVv3Z9L6NULjnKnbd52YPQr4tq+KpSHm5KgXkZf/o5z14smw+qezSen4U7pePzhhXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY1KP+AGxfSmChcBcGT6GUyr6U+2PvWyOmLBycT7/bUb+DtZ2m
	0XdgUJLlvOes7t/QNEseAoBdcw/A7JbP3EEeNMVOe59H8EvNVdMUWb49pDc12e8gi9M=
X-Gm-Gg: ASbGnctxX7SD8IwMuFTWxi7Hb5Km5tDBjV5IXu9FwPWMeu4aeVgh8MCBbo8j1i3IxdC
	wZUGszOvjuWZmLgmJ1zF9EzA40LSDQJRPSmm2zwU2O/gHpcyZELZe8dQmqkxNCP9cyggc9N2/kV
	pSN9VG9Rtsk7ZIKI3UzdlVle0ZntEOshKOpRWPQQgp9EoGSyjGbisOiIa4S5LUns05cMVK6wJTI
	Xgtqr/DrHWdX6n9TlQbOLYd4GziGWJ4/RV8EHMRLHwVcvjfbAVT9NeEsbQ3mrokYZC2j2+lnLUl
	yFp8WRByC0MOqUg2rZx6mxtqcGpodqb6qA171oJ6eyeopfeRVAzE3EayJRBkzgpo82dqlz3dtbm
	hlyQq+Qc5Yc2z4HG6ILyGu7/hcHtfDRefs7rtdaZx+K5XhzkZemUU0eblZizELBHpdVSh
X-Google-Smtp-Source: AGHT+IFKea4oH8KFgwyHaSc2l6blpKP8GuUwPAJgJx/KeJrPkBTKpHrnLvxgE6v/f0QnXtYHee9P1g==
X-Received: by 2002:a05:600c:4fd0:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-4776bc8654cmr24454425e9.4.1762511419489;
        Fri, 07 Nov 2025 02:30:19 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:55 +0100
Subject: [PATCH v5 5/8] net: stmmac: qcom-ethqos: split power management
 fields into a separate structure
MIME-Version: 1.0
Message-Id: <20251107-qcom-sa8255p-emac-v5-5-01d3e3aaf388@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3440;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GhJny0rrOhbWO9GcfNfulcQ1HGUq/SGEEOh5ESB4E5E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcooKW8Y7IR9mSClISDLeDYYhK8iNiIaH/TPy
 fxuwujaev6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KKAAKCRARpy6gFHHX
 coQrD/4qTn+RVPw7hjcmgGU3/snDkcs3NDhDHvv/5Gw30fWDbq4JYVy7783sYOwPB85RJqY4S7e
 orJaF0tbCcwFjqBa5r8puEfO+0tE9C798uYzqB4byWlr6wBm4ZV6MDxHdHiFUueijk1GVKKDf6p
 g0vBL/7/QSHIP3uvzWFS0McUu8nUHMLyHlC4mDTBLNRh/CvqCrRhcCskFXvUwnq+mVRXz1wUxWz
 eDuRl3e2s3lfYQsM69iL9yBi0tU6BCfztIGXqBZZwjMcofQem0B48N8RmtBPROWrheeySK+WqZk
 OBM8gt2jphPBxF7VBTtiIk6NShAwzwpC4LOeJNfR7Iz4oMzbMZ1+sr+95ubeQz3fiF83h920czl
 MJwT3u6C5W6fr5f4J/BTXhnb2QIiyRdoOk2UI8S3GwfBO2JW8PjAMexz4jvF1bo1Y08k6rUB30B
 WQe+j+4ipBuswROPqGlXNHuAuYh0Ctt53cyQNyXmx2rv1Wz5rFkVXEI2ponYkRGvYXmUGdjCRCo
 EvX51dwNUgROqZCbihmyIjeymPgPQWSJnm27ZMUAE/b9wYySNcBPLTPheqUICJIZ4O+Gr8QFVWK
 TVRxJAFi0n4SyszGjUpLKWarMWT+htsRLk6A8LGgEbPjOumLm7HeK2SO6eVB8sCZ8rWG4snO4ZZ
 6c8vSYyDBZkk7jg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_023021_798429_B7EF8B46 
X-CRM114-Status: GOOD (  14.63  )
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

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9cafe101049d5412d649b3beaca350c497ffc981..1f00556bbad997e2ec76b521cffe2eb14fabb79e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -292,7 +296,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -313,8 +316,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -771,11 +779,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -823,6 +833,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -830,7 +843,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
