Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCCCC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQ6XxcwejjDQm2Is0X1n1OH0vZAT52+45MBtLHqH7vs=; b=ScCUMaynY09Hfu
	GSr1Yhal6Zv2PrZZqCDNeCVtDdrjxYfdRnVeYBi6VteFN9GJTtJvMTdsQCZ/AvzvGiiSnQE8jJYra
	FpoVR6to9ErFvweBIGSxLkmXu44jVHbxkeyJmufLddOjdcWiCFUeP7BL86Ct5mpgf5WmF1oz5jlQw
	CvX/eoqjcSiFc1hLV+l4n6X8wTxlvmfwc3+vq80OGN4xp4xEotd3UEGOXBwD0r0rH3xP8vDRPWIcM
	iUETEqMWBZVhncR6rnkaQ+61QUPmmiif00V51X9uBQGeXYDm9cpJxJDTfiULsJ3xXq0kAP8s+WxSw
	MwAqxjygSHYf8x7egaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP53N-0000000BCaP-17pD;
	Wed, 03 Jul 2024 18:50:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP53H-0000000BCZ3-3Bna;
	Wed, 03 Jul 2024 18:50:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5E6AFCE11AB;
	Wed,  3 Jul 2024 18:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B6EC2BD10;
	Wed,  3 Jul 2024 18:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720032596;
	bh=tL3e/ur6/KMkg7mh3t7r3ZIFeZQ4xi5Q34S/7FlZ2qA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SQ7eo1AkC8LjRWberzbfTrXdEmn8AVAPTH1nI5h830+ubxo1C5MaKmEtPRy9gsG1o
	 M8aW67LDGZEnsrCM4Q/GRKRYn+r39JIjjMUn4+wwhQ4mb+Nyw7/6h4NQGIjateXcmW
	 XAfTSrhx2kUyLwJweon5gGjsH9sMGD6YpKO/TIf9EwzO/u3UL14SYAuIKAMoMlbYkK
	 bxKEJlfNCtFdikjht8PVx57e+Ez2TZA0kY1xDB4xr5o96jrOLhYPq5oX8riaz0aLMe
	 pQxRIT/WAYj12CgJvmnxQibErDTaKj3syhCujN4MjJ27ACtbE6kpJopp6TU3GIN89Q
	 vkEmm7DBvS+3g==
Date: Wed, 3 Jul 2024 11:49:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: patchwork-bot+netdevbpf@kernel.org
Cc: Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, djakov@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, jassisinghbrar@gmail.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, manivannan.sadhasivam@linaro.org, will@kernel.org,
 joro@8bytes.org, conor@kernel.org, tglx@linutronix.de, amitk@kernel.org,
 thara.gopinath@gmail.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, rafael@kernel.org, viresh.kumar@linaro.org,
 vkoul@kernel.org, edumazet@google.com, pabeni@redhat.com,
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
 quic_devipriy@quicinc.com, quic_tsoni@quicinc.com,
 quic_rgottimu@quicinc.com, quic_shashim@quicinc.com,
 quic_kaushalk@quicinc.com, quic_tingweiz@quicinc.com,
 quic_aiquny@quicinc.com, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@quicinc.com
Subject: Re: [PATCH 00/47] arm64: qcom: dts: add QCS9100 support
Message-ID: <20240703114952.6013f05e@kernel.org>
In-Reply-To: <171998042970.21654.12559535993133117436.git-patchwork-notify@kernel.org>
References: <20240703025850.2172008-1-quic_tengfan@quicinc.com>
	<171998042970.21654.12559535993133117436.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_115000_184046_BBAD24D5 
X-CRM114-Status: UNSURE (   6.76  )
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

On Wed, 03 Jul 2024 04:20:29 +0000 patchwork-bot+netdevbpf@kernel.org
wrote:
> This series was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:

> Here is the summary with links:
>   - [01/47] dt-bindings: arm: qcom: Document QCS9100 SoC and RIDE board
>     (no matching commit)
>   - [02/47] arm64: dts: qcom: qcs9100: Introduce QCS9100 SoC dtsi
>     (no matching commit)
>   - [03/47] arm64: dts: qcom: qcs9100: Introduce QCS9100 PMIC dtsi
>     https://git.kernel.org/netdev/net-next/c/df18948d331e

This is some bug / false positive in the bot, to be clear.
Commit df18948d331e is ("Merge branch 'device-memory-tcp'").
No idea how it got from that to DTS.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
