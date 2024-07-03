Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE329C30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 04:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+bk9bxGoFYr3LJ8tGllRswlohsTv+OW9f5QgOQqrQY=; b=AMOTLP0ubjG9sJ
	xyai5ihYPZJuFYuEW6KxHD+PRTlDhd98AJZFlKPu2WrpVuag0GhozDZvN+l6dYmn9LFG5tDReAcFz
	c6kGOs1pNd9djsjUxLbEDORHlW35OBna4vfRGt++lHyIt3aYzgeDMEVbRcciptfivjX5VrHA31YE4
	znUAQs73fQAPJjY5K1b7+SaFMmSyoPhNMQriFLMIAQg2ojNtYoo7lBJusEC9U6eFwvzJ6LDFt/J/b
	SaGYkOVCTq9sMAqBULFmYbJWzjTveUVu4E+oWqfl9v9LOrRWHkQ/kU6nPNN1EklwT9QN+QFZlecVK
	7/99Eb6dbtuwds2R6sUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOrTy-00000008ukC-2chW;
	Wed, 03 Jul 2024 04:20:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOrTt-00000008uhP-1X8W;
	Wed, 03 Jul 2024 04:20:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 566EACE28B6;
	Wed,  3 Jul 2024 04:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E524CC4AF12;
	Wed,  3 Jul 2024 04:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719980430;
	bh=5+RRC9YtK/dpU9PvT6M4Kinr+sN6vQFSkkmB2wAChzw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=k4GZm3W301fozxrlMm1PKo9FsrahhfCRNckbTsGEZa9SeQ+BWLat/mKmf07qyo2G3
	 7HtwKjoOP3sIsaFy2XjRZDzVRuUes1+zYsx28GSHReW4r/TAnQGMOEEKRLYmD64oC3
	 5HP9MPj/nxQA+V27pTEIfcLwguB9ztP53hOcAocJ8K9oNSLPKWKOorDcVlvgMFJF1s
	 +n2tF3wXBYNtPARGAecITkoFb4M6nTKpdWYYZeYAdYbdYZZKaSoWocmvH6J+ZT8brS
	 VN8xCBQKSwOqbotAq8HYrCEO3PdOEojLlkxDblTHAb20rLyhxfhjNFZbG6OokWLJZa
	 gK2QnmHcjiCBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C5DF7CF3B95;
	Wed,  3 Jul 2024 04:20:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 01/47] dt-bindings: arm: qcom: Document QCS9100 SoC and RIDE
 board
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171998042979.21654.8518238511530738014.git-patchwork-notify@kernel.org>
Date: Wed, 03 Jul 2024 04:20:29 +0000
References: <20240703035735.2182165-2-quic_tengfan@quicinc.com>
In-Reply-To: <20240703035735.2182165-2-quic_tengfan@quicinc.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, djakov@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, jassisinghbrar@gmail.com,
 herbert@gondor.apana.org.au, davem@davemloft.net,
 manivannan.sadhasivam@linaro.org, will@kernel.org, joro@8bytes.org,
 conor@kernel.org, tglx@linutronix.de, amitk@kernel.org,
 thara.gopinath@gmail.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, rafael@kernel.org, viresh.kumar@linaro.org,
 vkoul@kernel.org, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, robimarko@gmail.com, quic_gurus@quicinc.com,
 bartosz.golaszewski@linaro.org, kishon@kernel.org, quic_wcheng@quicinc.com,
 alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
 agross@kernel.org, gregkh@linuxfoundation.org, quic_tdas@quicinc.com,
 robin.murphy@arm.com, daniel.lezcano@linaro.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, quic_rjendra@quicinc.com, ulf.hansson@linaro.org,
 quic_sibis@quicinc.com, otto.pflueger@abscue.de, quic_rohiagar@quicinc.com,
 luca@z3ntu.xyz, neil.armstrong@linaro.org, abel.vesa@linaro.org,
 bhupesh.sharma@linaro.org, alexandre.torgue@foss.st.com,
 peppe.cavallaro@st.com, joabreu@synopsys.com, netdev@vger.kernel.org,
 lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 ahalaney@redhat.com, krzysztof.kozlowski@linaro.org,
 u.kleine-koenig@pengutronix.de, dmitry.baryshkov@linaro.org,
 quic_cang@quicinc.com, danila@jiaxyga.com, quic_nitirawa@quicinc.com,
 mantas@8devices.com, athierry@redhat.com, quic_kbajaj@quicinc.com,
 quic_bjorande@quicinc.com, quic_msarkar@quicinc.com,
 quic_devipriy@quicinc.com, quic_tsoni@quicinc.com, quic_rgottimu@quicinc.com,
 quic_shashim@quicinc.com, quic_kaushalk@quicinc.com,
 quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@quicinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_212033_932508_9A86C21A 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 3 Jul 2024 11:56:49 +0800 you wrote:
> Document the QCS9100 SoC and RIDE board.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - [01/47] dt-bindings: arm: qcom: Document QCS9100 SoC and RIDE board
    (no matching commit)
  - [02/47] arm64: dts: qcom: qcs9100: Introduce QCS9100 SoC dtsi
    (no matching commit)
  - [03/47] arm64: dts: qcom: qcs9100: Introduce QCS9100 PMIC dtsi
    https://git.kernel.org/netdev/net-next/c/df18948d331e
  - [04/47] arm64: dts: qcom: qcs9100: Add QCS9100 RIDE board dts
    (no matching commit)
  - [05/47] dt-bindings: firmware: qcom,scm: document SCM on QCS9100 SoC
    (no matching commit)
  - [06/47] dt-bindings: interconnect: qcom: document the interconnect compatibles for QCS9100
    (no matching commit)
  - [07/47] dt-bindings: clock: document QCS9100 GCC compatible
    (no matching commit)
  - [08/47] dt-bindings: mailbox: qcom-ipcc: Document the QCS9100 IPCC
    (no matching commit)
  - [09/47] dt-bindings: phy: Add QMP UFS PHY comptible for QCS9100
    (no matching commit)
  - [10/47] dt-bindings: crypto: ice: Document QCS9100 inline crypto engine
    (no matching commit)
  - [11/47] dt-bindings: crypto: qcom,prng: document QCS9100
    (no matching commit)
  - [12/47] dt-bindings: phy: qcom,usb-snps-femto-v2: Add bindings for QCS9100
    (no matching commit)
  - [13/47] dt-bindings: ufs: qcom: document QCS9100 UFS
    (no matching commit)
  - [14/47] dt-bindings: phy: qcom,qmp-usb: Add QCS9100 USB3 PHY
    (no matching commit)
  - [15/47] dt-bindings: usb: dwc3: Add QCS9100 compatible
    (no matching commit)
  - [16/47] dt-bindings: clock: qcom: describe the GPUCC clock for QCS9100
    (no matching commit)
  - [17/47] dt-bindings: arm-smmu: Document QCS9100 GPU SMMU
    (no matching commit)
  - [18/47] dt-bindings: phy: describe the Qualcomm SGMII PHY for QCS9100
    (no matching commit)
  - [19/47] dt-bindings: cache: qcom,llcc: Add QCS9100 description
    (no matching commit)
  - [20/47] dt-bindings: interrupt-controller: qcom,pdc: document pdc on QCS9100
    (no matching commit)
  - [21/47] dt-bindings: thermal: qcom-tsens: document the QCS9100 Temperature Sensor
    (no matching commit)
  - [22/47] dt-bindings: soc: qcom,aoss-qmp: Document the QCS9100 AOSS channel
    (no matching commit)
  - [23/47] dt-bindings: pinctrl: add qcs9100-tlmm compatible
    (no matching commit)
  - [24/47] dt-bindings: soc: qcom: add qcom,qcs9100-imem compatible
    (no matching commit)
  - [25/47] dt-bindings: watchdog: qcom-wdt: document QCS9100
    (no matching commit)
  - [26/47] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for QCS9100
    (no matching commit)
  - [27/47] dt-bindings: cpufreq: cpufreq-qcom-hw: Add QCS9100 compatibles
    (no matching commit)
  - [28/47] dt-bindings: power: qcom,rpmpd: document the QCS9100 RPMh Power Domains
    (no matching commit)
  - [29/47] dt-bindings: net: qcom,ethqos: add description for qcs9100
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
