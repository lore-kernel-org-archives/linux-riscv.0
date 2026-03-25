Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8712109C049
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Au+ZJfaJwRT3wGJU3Txml7JAM4kZkxxOtNcuLKVWZqw=; b=32lcIV3dJRhFzN
	8xiRXOQ1x22/r7kJJJAfY7asvU5Ox8K3OBB2D9RFgLKXQwGSbFnpZ94uvoyzVfnbAHYJa4SmTqRAK
	NB0QvBQON27d7Ejc1rxiS+FjrxmeR1osgcNDl9QtgaN7rwwqlSGri0eB3SDpYwfyOTqh+1mg1Fl+S
	P/saKXM7lx6e9KrC0kr4AP8GdiYClXD91sqL6Tv2YpJEpAdkb0GGTBEAubuF9toWijwY8C2To2Ikz
	I3EPoAW5gAVYhoOjIbxlHm+AtdkX+h+gPAfNZm1Sz+8fH+3jFyU7d5WQTvJVH5ivfQAa72JxtfmRK
	relEx7F3GinZ/vW/dHoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RUt-00000003wis-45N4;
	Wed, 25 Mar 2026 16:54:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RUs-00000003wiP-1VUG;
	Wed, 25 Mar 2026 16:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ODQOVWprsCht00NPuMesuID9uYrQZAlXJDnop9aQvWE=; b=rhWx/s3+fF7avQacYSeC8zFMsS
	0uDGNTcpLxO0TuZKXDrjomPy3pwzYNnsVAzqqbIg4nTKsP9tri7TbEAunfT6h17TYxgkuQ4aviXrT
	r0ss54UoPno6paXf+I9KWRHSjZERfK92ZUPbNSMIrX9YUtFSH8GunO9+yRHeE3A6G7ixYggP8VhoU
	QpmOYITfyO2Zo72EcXVHF0R88CcInnRLGaD9PLKCxH/Q4dLN1UrijqnGNraZDpoDI/01w/J5dVRvS
	vqE1F55/G5B068eFKMVDrzbzHh0J34VPIoDrsllRv0oNoPzdNtv59Ei50PoNZM5ki37cgln3Ut/nY
	4/Gd+Gbg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RUo-00000006gd9-40Fm;
	Wed, 25 Mar 2026 16:54:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA75740ADD;
	Wed, 25 Mar 2026 16:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A05C4CEF7;
	Wed, 25 Mar 2026 16:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774457655;
	bh=oMuUWLmoNITVcQzV/o3it6GVvrYLaH+S1Qr6U989rSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qDB30oUW5a/3zO8cnh+u95v1NNfWmdGI2IjUhVXfyQO4SZA9TyoTDvTMqD+MHZCZB
	 NbZtSa7ImOyDdMHoSkCtK7kMx2M9RnDL3kZd0WZAGqqSFNhJA4Vyj+bRdJUtT/WJ1+
	 smzMbNGLEjkZHNkEwdIxqekKRq5iCdcpKCC+5KHh0JNGfGHt78pBcZNG2XZr+ZjCL8
	 +pQPBWT2Qxf0S+D+n9gEGvUaIXjm0r1poXr0/YGLOZB2oBLm4MXdkhUtjKNkn3Qdqe
	 uvMiMQG7Gvnj5hAOzCxfefchzrdYpSo9zodIbgOmf0vcfll+P9lh2ztHg9oF7j+3q5
	 jVMvbkd5KgOww==
From: Simon Horman <horms@kernel.org>
To: bartosz.golaszewski@oss.qualcomm.com
Cc: Simon Horman <horms@kernel.org>,
	magnus.damm@gmail.com,
	jernej.skrabec@gmail.com,
	s32@nxp.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	wens@kernel.org,
	netdev@vger.kernel.org,
	geert+renesas@glider.be,
	linux-stm32@st-md-mailman.stormreply.com,
	dfustini@tenstorrent.com,
	andersson@kernel.org,
	khilman@baylibre.com,
	linux-mips@vger.kernel.org,
	mripard@kernel.org,
	romain.gantois@bootlin.com,
	vkoul@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	jbrunet@baylibre.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	sophgo@lists.linux.dev,
	brgl@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-sunxi@lists.linux.dev,
	conor+dt@kernel.org,
	davem@davemloft.net,
	jan.petrous@oss.nxp.com,
	shawnguo@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	bartosz.golaszewski@linaro.org,
	peppe.cavallaro@st.com,
	krzk+dt@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	martin.blumenstingl@googlemail.com,
	andrew+netdev@lunn.ch,
	rrendec@redhat.com,
	linux-rockchip@lists.infradead.org,
	christophe.roullier@foss.st.com,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	alexandre.torgue@foss.st.com,
	edumazet@google.com,
	robh@kernel.org
Subject: Re: [PATCH net-next v10 6/6] net: stmmac: qcom-ethqos: add support for sa8255p
Date: Wed, 25 Mar 2026 16:53:35 +0000
Message-ID: <20260325165335.326630-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323-qcom-sa8255p-emac-v10-6-79302b238a16@oss.qualcomm.com>
References: <20260323-qcom-sa8255p-emac-v10-6-79302b238a16@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_165419_435769_5A82A8C3 
X-CRM114-Status: GOOD (  17.35  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: qcom-ethqos: add support for sa8255p

Extend the driver to support a new model - sa8255p. Unlike the
previously supported variants, this one's power management is done in
the firmware using SCMI. This is modeled in linux using power domains so
add support for them.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index f32ff0d9ce51..09ce80b446cb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

[ ... ]

> @@ -710,6 +785,45 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
>  	return ret;
>  }
>
> +static int ethqos_mac_finish_serdes_pd(struct net_device *ndev, void *priv,
> +				       unsigned int mode,
> +				       phy_interface_t interface)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +	int ret = 0;
> +
> +	qcom_ethqos_set_sgmii_loopback(ethqos, false);
> +
> +	if (interface == PHY_INTERFACE_MODE_SGMII ||
> +	    interface == PHY_INTERFACE_MODE_2500BASEX)
> +		ret = dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);
> +
> +	return ret;
> +}
> +
> +static int qcom_ethqos_pd_serdes_powerup(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +	int ret;
> +
> +	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
> +	if (ret < 0)
> +		return ret;
> +
> +	return dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);
> +}

Does this leak the PM runtime reference if dev_pm_opp_set_level() fails?

qcom_ethqos_pd_serdes_powerup() calls qcom_ethqos_domain_on() which
acquires a PM runtime reference via pm_runtime_resume_and_get():

qcom_ethqos_pd_serdes_powerup()
  qcom_ethqos_domain_on()
    pm_runtime_resume_and_get(dev)

If the subsequent dev_pm_opp_set_level() fails, the function returns the
error without calling qcom_ethqos_domain_off() to release the reference.

The caller stmmac_legacy_serdes_power_up() in stmmac_main.c does not set
legacy_serdes_is_powered=true on error, so stmmac_legacy_serdes_power_down()
in the cleanup path skips the powerdown call.

In the existing non-PD code path, qcom_ethqos_serdes_powerup() correctly
handles this case by calling phy_exit() when phy_power_on() fails:

drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:qcom_ethqos_serdes_powerup() {
	ret = phy_init(ethqos->pm.serdes_phy);
	if (ret)
		return ret;

	ret = phy_power_on(ethqos->pm.serdes_phy);
	if (ret) {
		phy_exit(ethqos->pm.serdes_phy);
		return ret;
	}
	...
}

Should qcom_ethqos_pd_serdes_powerup() call qcom_ethqos_domain_off()
before returning the error from dev_pm_opp_set_level()?

> +
> +static void qcom_ethqos_pd_serdes_powerdown(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
> +
> +	dev_pm_opp_set_level(dev, 0);
> +	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);
> +}

[ ... ]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
