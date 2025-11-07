Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1C6CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 11:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/Ag7/1armw9LZo0QwOuKbbLbuBDSkzonAAdzcuZHCkc=; b=AENi0e00gqNs90ieC7/oWpXDi5
	lwf3W/qhN7O/+f7RIuaEElMrmo0Lhmyce4ZzuMhV10YqBtvEPvdUEzVmpbL4Dip9c8P52EldemJ79
	4E1mBJMoTHlI1RZHHFuhbl/XVf8OYH2rCAHlxzy7ruXU2wVftF4v8nMLHcjUI2Ld30kwfO6+B7v5d
	GPWqt0tJ5A/V7g9qRJy5exFrVW4bCt0MWZkTlraszrpT6tNRrGBqa71It7AJ9j4oz6rBkFKtXX0pb
	o4CdluovAIfMyz63tlkaHSqiFXI3oWY8qatRLUbYLgaUAsjrlD0VO3YzSw54cp2PGDp/Ra6g4JOz5
	lXN9ps7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKXw-0000000HCKo-3VZW;
	Fri, 07 Nov 2025 11:22:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKXt-0000000HCJg-2YAl;
	Fri, 07 Nov 2025 11:22:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A00EC4450E;
	Fri,  7 Nov 2025 11:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45321C4CEF7;
	Fri,  7 Nov 2025 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762514540;
	bh=WqJuyrothph0jJUBiuUUbS1FvhvPkDqkS2NhaeN0xV0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rImSqDdr0csAuwceoiZMORIrJXnobUCP+yoqx199IwW4RPtIeHWgGg8yhQ45V/D7R
	 HxCBJlEMisUSTZWQ74AkbgFanp3OacerkO8+FsunvIN8Qv1PJjoKvEhbkIBisz2yNh
	 fHEnA2G6Z+rnjMkyoYcahxv0PRsrM8NiFmSYDw5XFjOljLa3mMJnwZAikRLma8aHey
	 0V3PWYoagJTX1nuIdJ2Oom+6PchZMhCgWc6c354u4h/wXc/BosroSeZA0hazMf3txS
	 iSFPT4TBGUlSnwuvzF4pqevVMyluivzg/6sz2Tim0ZSb22VBqsrJyyImM6xekisJtj
	 QhXJiXhB/cEDw==
Date: Fri, 07 Nov 2025 05:22:18 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Samin Guo <samin.guo@starfivetech.com>, linux-amlogic@lists.infradead.org, 
 netdev@vger.kernel.org, imx@lists.linux.dev, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-renesas-soc@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Guo Ren <guoren@kernel.org>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Swathi K S <swathi.ks@samsung.com>, linux-arm-msm@vger.kernel.org, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 linux-rockchip@lists.infradead.org, Frank Li <Frank.Li@nxp.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 Vinod Koul <vkoul@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Jan Petrous <jan.petrous@oss.nxp.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, s32@nxp.com, 
 Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, 
 devicetree@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
 linux-mips@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, linux-sunxi@lists.linux.dev, 
 Heiko Stuebner <heiko@sntech.de>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Fu Wei <wefu@redhat.com>, Linux Team <linux-imx@nxp.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Drew Fustini <fustini@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, sophgo@lists.linux.dev, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Minda Chen <minda.chen@starfivetech.com>, linux-riscv@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-1-01d3e3aaf388@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-1-01d3e3aaf388@linaro.org>
Message-Id: <176251453854.1709481.17350672291824662534.robh@kernel.org>
Subject: Re: [PATCH v5 1/8] dt-bindings: net: qcom: document the ethqos
 device for SCMI-based systems
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_032221_687467_F7EBB6DA 
X-CRM114-Status: GOOD (  12.28  )
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


On Fri, 07 Nov 2025 11:29:51 +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file. Since we need to update the maximum number of power
> domains, let's update existing bindings referencing the top-level
> snps,dwmac.yaml and limit their maxItems for power-domains to 1.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |  3 +
>  .../bindings/net/altr,socfpga-stmmac.yaml          |  3 +
>  .../bindings/net/amlogic,meson-dwmac.yaml          |  3 +
>  .../devicetree/bindings/net/eswin,eic7700-eth.yaml |  3 +
>  .../devicetree/bindings/net/intel,dwmac-plat.yaml  |  3 +
>  .../bindings/net/loongson,ls1b-gmac.yaml           |  3 +
>  .../bindings/net/loongson,ls1c-emac.yaml           |  3 +
>  .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |  3 +
>  .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |  3 +
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |  3 +
>  .../devicetree/bindings/net/qcom,ethqos.yaml       |  3 +
>  .../bindings/net/qcom,sa8255p-ethqos.yaml          | 98 ++++++++++++++++++++++
>  .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |  3 +
>  .../bindings/net/renesas,rzv2h-gbeth.yaml          |  3 +
>  .../devicetree/bindings/net/rockchip-dwmac.yaml    |  3 +
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  5 +-
>  .../bindings/net/sophgo,cv1800b-dwmac.yaml         |  3 +
>  .../bindings/net/sophgo,sg2044-dwmac.yaml          |  3 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml        |  3 +
>  .../devicetree/bindings/net/stm32-dwmac.yaml       |  3 +
>  .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |  3 +
>  .../devicetree/bindings/net/thead,th1520-gmac.yaml |  3 +
>  .../bindings/net/toshiba,visconti-dwmac.yaml       |  3 +
>  MAINTAINERS                                        |  1 +
>  24 files changed, 166 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/net/qcom,ethqos-scmi.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251107-qcom-sa8255p-emac-v5-1-01d3e3aaf388@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
