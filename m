Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ED5CCFA04
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fAvIehqXLH1AcgPRBhtWHpFUVeATQXeCbZo8OuFVPDw=; b=Z330aCvxQ44DsB
	opEO04ogW2D6OPJ47+QJsFAMXM8iclSuJ7bI/KwZD3hLtdm5pNyqSBZGdaeugtLq5rmQkhg485EjQ
	gD6MpLRfpdcMOwxOiHiqC49gtbY+V8MQtCHV3LbFaJZ16fZP948PFSgxVbJn/yYV5x9RZxqz3N5D2
	Lom8bf4P6QiqexFoa3d8nGkrNpnOO+uz5+WNSwJt5vrhQNz4LFKJD4ReQYJznfYhnqpByg+zF320s
	DDWS/90iZh+Pi7xxuIfE/RPC1slQBrN0/YWgmNAKbcgOpwvA8LzZhhKZ70sF/YxKG3HfPxfeYkUu9
	Vyr2ADvJj5DkTIzLze8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGnE-0000000BqvV-2zhu;
	Tue, 04 Nov 2025 13:09:48 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGnA-0000000Bqno-1kj5
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 13:09:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-429b7ba208eso3414186f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Nov 2025 05:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261783; x=1762866583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7G2ramQk2hxdGs1tmlSj6o/OfknwFPaFfxdjJIosVo=;
        b=nPOmPou0s4i47VmHjfS9Z17e6t+QW4z/k0BGuAfSQ7/9FPLhwPMagwIkzpDIN4gA2O
         liaNS8Fc0xhxqmtigKCDk1yOzrXj9zsU2bpwA6m78R6fLsx/2/UHWZE/Des9UMC7QS5U
         +F4lS8xpdg0wi1HP6Wmv1RKwUjz6DCAUh7TmDqnx7mKJ3jDPIAzGNySsRi63E4BJTI5s
         8rWDeydZJLsawH2ok2WF6uGXe8A4t9aSCHfak5yYYj392UHDeTswXas1QeMjaT9mOv7G
         eWOORkmloW25Mm1UPJ5PCprytbY05t7+P474jMBRHVFCjRpdo/50qY8EQn1YM2vIA0N6
         UxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261783; x=1762866583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7G2ramQk2hxdGs1tmlSj6o/OfknwFPaFfxdjJIosVo=;
        b=Nm5Ek5C9Pp4xQPphsk2tAJ5Ez0jU66buvyiUqaebPNu8OSE730HKLFR+YCB/VLl069
         uaXAFKnUfAcfODlmOa3anaQ3u9D+EhOxDiMM5wS5kcvaZlnBbVho++d+yJjg0DqOH0nP
         EIUR66L2J+FAw7sSQ3iAJfX5I3PegXpbWSiLUJ05Rru2k1DFFfI4y4plv6ZzdMi0Rth2
         2MqCsoIuJYyJaNxXPTP5xkLGIxoWxkhxokiIMXTX/BzM67PCx53BzOlLFltJciWqLIp3
         Cbu09OcHxuELsH2vqi5MX/TZfZIqOYIMetGrW8bWlpJjriPDsRfceVrPrnF/bSw41SFH
         MkPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWRG5xEGg1av2pTusMTSdVmQKKIkSAcbMhxF44mkZDH34ERAkq/H7oXdCDNAvsaaCix5KD7Av30fMJjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEEd2ixXdYm/mLLcmI4u4pkbEOvTsAe2tXwa4MafKQHc8nB84Z
	57lyEO+cZ7jOg1J0hsXylTwl2cYGCjlyxF44EDULLmpP0MIVpMdtc3M2R+7ahw+TLRE=
X-Gm-Gg: ASbGncskwDh07/Z/Ecw1ioL0Et7XdjQFczxj8HzPeAIXU9dSWZY84+ZTXkYwRKtGJpk
	caWlV69fWeaAdaq+SWc3FyGDX7anlVFZoMLrAm34Cf5aqsVt6XGYwEzNBoJ1prZmcZ73wRj7qpQ
	ndg933HyHnAFZRxfh+LpQKAsjkbgV35chc0PRDNNivYjCxvSJ7VF4pVqthT1Rz29Wevat4tUUfp
	vwcCp1zNSSEaHYRJI2asJyeMPcYHQyjTJqeIUm3SXQucm05C8OORRwxRZJu8Woj85tzmRzUCJHH
	ANXoJ014PhK6hNz1JyE30j2+41RbLm/U5Poco4bXRz7LJl0T0lSMusnnTvYwhckihILHEf+ZpCU
	TFFPGkGxq9/cXjsClQe+dFLFVfk2OaooKPGpO3R9fKEhFBhZfvg/qfUBvYMJ0gx/LwEbldQ==
X-Google-Smtp-Source: AGHT+IGt39/RFIYRQsWApaQS4QlJBSyR/bfENK9HcdGp1Eg6T4YSk8jvmlZ1WO8dgmB5bkvcm4+SQA==
X-Received: by 2002:a05:6000:26cf:b0:429:c6a7:4cdc with SMTP id ffacd0b85a97d-429c6a74ff1mr11008945f8f.50.1762261782582;
        Tue, 04 Nov 2025 05:09:42 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 04 Nov 2025 14:08:58 +0100
Subject: [PATCH v4 7/8] net: stmmac: qcom-ethqos: define a callback for
 setting the serdes speed
MIME-Version: 1.0
Message-Id: <20251104-qcom-sa8255p-emac-v4-7-f76660087cea@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Yczz6nmRkpIoGqMAKNVvyF3zmCEkrzboH4PyVFVc9jM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfrucVA2CeMFxPGfABXbkXXyqSC5jmN8LI8mD
 yCNOJ0bLhOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn67gAKCRARpy6gFHHX
 ciBqD/0XNJFi5uHJB6d9F1X9w/Akoe2fxdrPp29/FzIfuLlu4+eNY+P8ZHWXvGT21CWTBHzyLRu
 e0CXNLnV1f4a1wGZEvwBVVfisgS/M5avHcSEdAfYOIYk0DcbJfKIrYhpJprz/82G+ujPgLdl/kn
 TaYBe32VUyJHFGX0s+6ZMEQZDKgAQ2R73og7Zw/AckjDePp2xiiEb11GU8ckU6wwQtG0GEURGh5
 TFXn2h7JLMGoElSLJlJFYz/1ZBC9CQqcX8WPjpHcIOHDClY5dmoMJ0E/A/nsdOVC+1eS4HwkZtf
 hy9I8tBtPs/FIb4xoVM5zQbLtNu5pfkWYl0IL/lcMyRYfV51YrMG+As1VTo0lemfPcVLtf75muB
 sthcpgvGIFJ8q3uxmA6DmoCAA9zeUYYSOpR8Uv182IqbYfaAnhLGu/XIuLcivlPoi3eFqMWCSq9
 nTgIrvu5OVCSrQ7GXx6POR0ysJ1GJa7axDRNaThJUimC07hyobjKOtejPjjH6MC5zAeIOgAZXA6
 WdPsoVGTqwtOeotmc2KOOZQnWeEPyo//Hd33noVu8pQBWmSLyXgsa3uIpmDbkeJP/bRuUA5BfNp
 0D78mPjyDVvKS3gSyXyjG1KXrnjeuov9V3NvOVzkiMghcYQTB9IMUjf//vqgCNmlotmEnX2mptx
 QZ5kuabKK8e7LFQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_050944_511428_28153732 
X-CRM114-Status: GOOD (  13.27  )
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

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 09f122062dec87aa11804af2769ddff4964e6596..446f06b591a0b70992c7a431b56cf88c1b6718fd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -120,6 +120,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -640,11 +641,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -865,6 +871,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
