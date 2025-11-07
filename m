Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879C1CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zs6HUD3AZw9jvrTElJSHeAqixmLIBfUQr9nfw3hmW7U=; b=qDJDxYpA++gBpB
	AIceQLo9IAKsVVXhbPA/PYqST6S3+QcRNR1QD4EhoR71udopqqwoalzisTbRnNzVqiEJVVACNA/pV
	Q57MsHvTj34ZMAj6Hy/pcSpOEOt2N/JgnU4gXaVUjl94+/GmVP6/16HGFbyW33k2rz5BYeygxdDww
	3v+Mkn6SLe4E6HmuPRDt9wGc0kO3g2Lr73OjClIhw2uiQgzGcnSDsNCJtC6u9v0NZz5limKKYfVFh
	Qkjw1HvLwWEuQCT2V/ESegJalOrLBrCfQjuFWSRWrJlwwP0ksOfwkurzCRtDY4g5fg4UZyt5hpqO8
	R0cSwuc4qWk8vAve3JVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJkS-0000000H5ni-3yjO;
	Fri, 07 Nov 2025 10:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJkR-0000000H5mx-2W0f
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Nov 2025 10:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EeInQQFLiIKx9a2aZ0cucvmhXeQc/nRxrd1ryoO5rZk=; b=Y1KV1ZG2FHGMmMB9P/z288jHWa
	aEcl0EWe9UrIWW5xpTzsPxJ5l6qgiRRAA0SnRRfVCEXoVxuMNRs1SNFgZmTWposGyIDdpG9d/4jtw
	phWvGEh5j8xLTAPMY+rw4HRkYK4NFUUd17A+T8Uj+BSe6yc4sHMshQ/xYrtVqjtKcbiCKqvNDC+2/
	Pd+uxftnGEJHp3KGv9PjvC87N+uiz6Ishfejbf+rzlbPLXOypQEmDkkfwr/iisupYkGG5EMifTIyB
	RcQGNMxA3pP6jUtd+uBPLzVB1VtCHIjegvpJt2553TXJSEdSO2dA4YF2fG1LBdrjDwTikP7gmIzf8
	RnwCBohA==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIsh-00000006BQq-0PzM
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 09:35:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4298b49f103so224682f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 02:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511409; x=1763116209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EeInQQFLiIKx9a2aZ0cucvmhXeQc/nRxrd1ryoO5rZk=;
        b=xVPCHV15rl6Y4S4jmjgXXhoONYFVNfidGMYKhvPfGVNgL6Sji6NfuSWWmD/WLnRoKe
         diJDcIHZVx7Xyzd6Nl2eamKjDD0tA60kQrtblLSYyTpRDSvJKcMw7bFjMWC4IjaP+1UR
         H9V5ZiY7D6Z1aJbR3IYEsvXujAe//eAKI6S8pnUs5aQ9gBpW9O8Lu86PlOP3FYiFQg0K
         uneLgAUc5VwckjRCGGsBbD4blGtPB50VwYucd3VxFhwsJt5Py3fsnjv+2HXEPTZWvkEZ
         eWyTiwK1DbhHh0GPU3NdIUXyG/uit9dPjFAeCeC92G0JT5I/YQy+Qr3UZKDPS4U7giBY
         bpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511409; x=1763116209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EeInQQFLiIKx9a2aZ0cucvmhXeQc/nRxrd1ryoO5rZk=;
        b=orab3Uq1QsArMxDeXoEy7Qp6sd+8dsTAXYvMcXB/iSgs4Hu6p4OesEwCKcG+RncNm9
         jENmGiHqHqmz2tMYlT6b/hIWeLzacjM4szKblXdledZ7py+XZM2AISHvexwrp6QWUwlZ
         eXIeDBrt8CC1VdIt4vgQ9hRvF9SvCkqOY97upa79vKhP1hNl2HriQemawyteuQ8IpaBj
         aoqD6y8xFKU65mJZh9G0EbqhyrRkv0fOpSWev/CfDzmoAZV3mY+8puaTN/8GRhej2B4v
         udgqcfZ2jgxaCj0/btcXSf4D+Rb5LdPDCs91yYwVIlh+cRcsfScpHuGyjf7w30fkQUPF
         s+WA==
X-Forwarded-Encrypted: i=1; AJvYcCXOk4S3kWWdFUF+QvGyc2ZYYtaWhmSSTFqJk4kahhOFKS3L4IQM+HtaLUg92HyMpJp9R0xidVu4qalCkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAmgO0H9Oeah1gYtIUU21F+H3TeItb7JUcM9FRxIXqUEHRyK9F
	RYwRYImtlebRCgQmo7yNyhr4gPtkOJPgxqT6OSzQwKJhH5PW3nozTOpL1WG5qQkMVHE=
X-Gm-Gg: ASbGncu1Nyt/q3OiRA5nIzHkqQX3FF35Yd495oeHV0eo0h4XrlZgyOzxD9cR50/2y4q
	RhvFgbXdqBKZmp15ykbzpjxlLizTStyjG4He931vpv6YnA1fjatBrUa484VsC+TdFJf8U+zppHp
	dvqLwRMZa+is+9oxG0INcGHIt8cLJDkFa7FKSTHJK1nbu7hVwwcmNVMJaTnEhiD507Vs368LwTH
	+ETsuu7ztwVda0GmO4yYOmSEsnBQr7k6Ja3SM5ycrk512sYbib8QfxuoJgKDjXantAxvPhOY2nd
	Le2vvPsgeicSjDoJUVoPMC6p+fa6CBj7yhYAV9ndRKufqgu6dLpJg+k39pCvB5Mq5FI8FzU5JpO
	2/6emrNvLGR77ZzAo4OIVyIF6duy0xwuDbqgH5tDdHNDSRFpTxThLobSQMVryEKBKpz/bMV39rw
	PT62w=
X-Google-Smtp-Source: AGHT+IFWpZ4poiZ9SDXbV8ON2MHdizseFiZAt8VOLHhvPsXxDGeYll4+fwCN9jkQCS4Zle5ZwgVqIg==
X-Received: by 2002:a05:6000:4285:b0:429:c774:dc08 with SMTP id ffacd0b85a97d-42ae5aebaf5mr2437383f8f.53.1762511409391;
        Fri, 07 Nov 2025 02:30:09 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:08 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:52 +0100
Subject: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
MIME-Version: 1.0
Message-Id: <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=POv+vDF2xSPchjLMqtdcREByAr5wVSRC/4xfmqCj4bM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcon0J86/ZOn2V7ZnaixLSQbUE+OOX0GyGHbN
 J0IncBZa6SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KJwAKCRARpy6gFHHX
 ciIrEADVzOpNMnNgNcWPwGlAIVMHEpqCfHtBeXPJvQn07MHtxYl3U9LGnzv620nVLy60nQXmdAj
 pl3ZH62GP+XUvTaa+j/Z2gCKkYsYElWtU+zFXoq3HYslfFES+CnYlKKCUmQophJ5kf0OtQCt7fO
 5abxCLdbNTLSvsEW8oVYqioJeULR4+HfOiPNUiahqO/7PrqApBkNAhtmqdbVH+Y/EeNbiYnOCf2
 ZE6sCBDEzpxLPiYAwB0GUT6G6dzFKvCnBMKGLQ8w7g0Y2Ir6rZD+Un4BWa0CNrGKvNHwo5xO8bo
 nGfuSWFYUqibed/x5q6cbRcrqIv4AmIJq3gc7On4l7G7nPtxCppRhvhSChUmt0Gwl3nU7ag+EdT
 9+tJ2dVjWe5HNxZ6uYIO5iCQkTDt3zHGuEI7sIwGGyMuQUb7feOaRdvBOk3Uzk12VujF7tf0KFh
 b+OPkxYIl6dR2V2vM6Iltg5uvz1odCEojGxY4X1ssONLOPT4Io72HgrU4Ic0feuQA8hwoch6sR/
 FRi9jKn6EJVxMvcjNsmigzOuuZ657/JCBDLfzmcsTY+k/jtVm8lTErQTHQN+xZDKdPke/55kcro
 7TpPf1P6vZKDWhTuWJQrIlPA/9Y2Tcn9d3fifuHIRnt/DqPTlrMScJeQkcUIZjtMw0xYQmGCR4I
 ViImRD8T6UC/KGg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_093543_849595_8B3B8D83 
X-CRM114-Status: GOOD (  14.21  )
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

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 87c5bea6c2a243f3be998b2c3935bc1dc23bfe22..22d0eaab35eaffac0bca58f8625ecc5c955b6631 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1a616a71c36ace29a74a0aa23fc8173443aa49a5..8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -748,7 +748,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -799,7 +798,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -836,9 +835,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
