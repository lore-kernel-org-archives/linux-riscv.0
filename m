Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9719AFC9EE3
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Mar 2026 10:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQe9JsE6rOu55JRPTbLa0R0MEmdqbXvpZguYHxfL/Q0=; b=a7fgx9X0i+NuBa
	5ZFNh3jv8FY1vaUt+z79KNQ0AYBxcVDZt3QhwpGqsv4fK+3gSQxELnrLnwdqM7bipGVtqZ8e8IJGt
	dzSPiJMOTve7SJYeQ7kscTzzjp20RnBBEsT/BQ85FdVhQ1k2ItqhV/QYmV/y6ttTtxQeG4y24HTQB
	5KIeiIi26Q18eJr0Ro/1rSxUbiJcAQBcwitavcfqTkxh64kohw0/mPZ/IS9aQVAnWcvAvqtHkMHbk
	q5KfDl7AHVFHZu6mYQi+2Hc4mzD/KfaxPwzhCRQMi15jr1Tg8WSzn9zS5xMhNyMP/0skNUWgNugAa
	ZYsPNDuLIWBLOgVgrp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyorC-000000055gU-0knN;
	Sat, 07 Mar 2026 10:26:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyorA-000000055g9-1Uyu;
	Sat, 07 Mar 2026 10:26:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9AEA60018;
	Sat,  7 Mar 2026 10:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DAFC19422;
	Sat,  7 Mar 2026 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772879158;
	bh=gK0pRUM/Slfh1oiPmyu3lYsDR18Y7TIzAYUu4D4ldj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j0Cac6S7TyQb+E6Y2hSbXhG5N5uDfVrssvtttU324wBvcszTcCtHvLTTG6vhZAYq7
	 wskyH5zr18JuTUiOMKGCzxZJNC30mVQa9uzgNH+81iLrwuTOS7AF+F1rg+Qcw90+J4
	 Hup3d6KGjEoFHVj4LT2aRD+9kmz3xe5CPxlWzaTUcLe+k82X84Bj76ifbo8W1lksUv
	 nSTMoq1tSEPXIuSTcFIfIHv5bK2Xol6mUMEI2LMojWPdFCTWxH27UDeFaF40KZilXu
	 Et7B4BVoQTlXRPP6S6sInBPHaCZQhjZcsKbaAYTa3jYkRERSa3gTQIQbkmerjXe7ml
	 UpoHRIhMOPjCw==
Date: Sat, 7 Mar 2026 11:25:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
	Bartosz Golaszewski <brgl@kernel.org>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH net-next v7 1/7] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
Message-ID: <20260307-boisterous-tuscan-rat-1eb9bb@quoll>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
 <20260306-qcom-sa8255p-emac-v7-1-d6a3013094b7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-1-d6a3013094b7@oss.qualcomm.com>
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

On Fri, Mar 06, 2026 at 04:46:39PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file. Since we need to update the maximum number of power
> domains, let's update existing bindings referencing the top-level
> snps,dwmac.yaml and limit their maxItems for power-domains to 1.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Romain Gantois <romain.gantois@bootlin.com> # For RZ/N1

Can we drop half-baked reviews? Reviewing only that piece is not even
possible, because it makes no sense outside of main change context. IOW,
it's pointless review of nothing, if you do not actually review the main
change impacting RZ/N1.

Also submitting patches do not really allow to apply reviewer's
statement of oversight to inly part of the patch.

It's called Ack then. Use proper tags if one does not actually review
the patch.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
