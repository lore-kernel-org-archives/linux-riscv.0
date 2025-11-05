Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5108CCFA04
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 08:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYDvQnvHiNRDQEbp72qT4sboPHRdMDRwFAlNMBoBypI=; b=Z+WxyZ1OqA2ghn
	/3mU/CU9EZ4LvdZvtPjc7FWcdGr/ADYHWCOAxD9lGX1GHKRCcQcTre6dvOgYiosSsRWoM38iFfkCo
	vVf0Xwvr5AbpE89LKGWnhoLUSK9P3sIZquMEkJXNRIZZAuGYtZ6X4NN72iUQ0DDex932eFwLn/WCP
	xEIHoW7cRE8ezdNm//WmhxO+rzt/XW8nRnwc4aLJEmbSTHojyEuVPyAF+uTr7TRdRV5/MuPL8qxE2
	jU23v9VRXCq7sy+AovYa0xT6Zp5wWP0uLe1IB+li1QzvAUkjIj7j/HE/F3RowMIED7N/zBRku/IAg
	mMec7BVnoy/yXaFKdcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYxS-0000000DIcT-1lGI;
	Wed, 05 Nov 2025 08:33:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYxP-0000000DIbN-1L8c;
	Wed, 05 Nov 2025 08:33:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6693C43A22;
	Wed,  5 Nov 2025 08:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA45C4CEF8;
	Wed,  5 Nov 2025 08:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762331610;
	bh=N9DVJZLHg/ikq7JcKb017+GXdHTNHUl1swp5I6YFwKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWRtcGLQVHMZgFcfCcC2Ue5biDzICOqxbsTH9uRs3nHuk4V9OMogHP0jGb51Z/R1/
	 jJxkWdC8AHsbMqgtuTPgrjWZOlEwVVOpsHrziXpskkAkKCA1xrAzVVi07M2Ld7UyTP
	 VJIqW87HIEtASx13s4C1VM/y6/X7on3YXHn7gwZzVxCFO470mCBBKSCNdU9LIk5Cyc
	 1XM/bvkZNvlVnWDHYXq4thAk5z0FFtDTWqf6wOzceEzFJa6Pqtp/I85AxdCnbThUg5
	 dL17TQbIUFUeUW15dIGkbb9zPwlX5ZkCMOZjeOPxSyuT7pqNhvIJS5W4nOvExPXANQ
	 M6yn12bRbQ/3Q==
Date: Wed, 5 Nov 2025 09:33:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Shuang Liang <liangshuang@eswincomputing.com>, Zhi Li <lizhi2@eswincomputing.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	David Wu <david.wu@rock-chips.com>, Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 1/8] dt-bindings: net: qcom: document the ethqos
 device for SCMI-based systems
Message-ID: <20251105-fat-aromatic-nightingale-1ef8ac@kuoka>
References: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
 <20251104-qcom-sa8255p-emac-v4-1-f76660087cea@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251104-qcom-sa8255p-emac-v4-1-f76660087cea@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_003331_510186_5325B2D0 
X-CRM114-Status: GOOD (  13.39  )
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

On Tue, Nov 04, 2025 at 02:08:52PM +0100, Bartosz Golaszewski wrote:
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ff70d785d326f39a8fe5698759c56ab2cb7f7eef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qcom,ethqos-scmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Ethernet ETHQOS device (firmware managed)
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
> +  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +
> +description:
> +  dwmmac based Qualcomm ethernet devices which support Gigabit
> +  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
> +  managed by firmware
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-ethqos
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: stmmaceth
> +      - const: rgmii
> +
> +  interrupts:
> +    items:
> +      - description: Combined signal for various interrupt events
> +      - description: The interrupt that occurs when HW safety error triggered
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: sfty
> +
> +  power-domains:
> +    minItems: 3

You should have here both constraints - min and maxItems. Current code
works fine, but usually we want it to be explicit.

I found two more nits which I did not notice earlier, so when fixing
above please also:

1. Please name the file following compatible, so:
qcom,sa8255p-ethqos.yaml
(unless this was already discussed...)

> +        snps,tso;
> +        snps,pbl = <32>;
> +        rx-fifo-depth = <16384>;
> +        tx-fifo-depth = <16384>;
> +
> +        phy-handle = <&ethernet_phy>;
> +        phy-mode = "2500base-x";
> +
> +        snps,mtl-rx-config = <&mtl_rx_setup1>;
> +        snps,mtl-tx-config = <&mtl_tx_setup1>;
> +
> +        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
> +        power-domain-names = "core", "mdio","serdes";

2. Missing space after ,


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
