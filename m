Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24671FEFB56
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6lb3yQmyMMYgQeP7efFxGVoQGzD1o2qRL8obQAhgBw=; b=dRq+zFCeO0BVOq
	7Nq/ZQg5g02Us2Y8j15GbMPT/5Z5tVZRJK12QV5ZY4t9Ltd1Ta1YsM+RrsoZTK18rHqPwK4Cuuicb
	LQEfNf4P9C96MoMUr3BEHlFdP0nOBlaALt9lPx5l5mlwbi6RA/TuMew89D7E0P2kEp/buwP7xd8Zp
	gP42woIjDFmKAphCuiYFsE5HCwJpacEluPxI2G40RsUy6+c03Wyh2D2GXzvIs24oGpDglY2yNGNwy
	LF7SzqmZ/z/t35whlFNozW48dV1/vxptInCZdb35NqILXSvDLtX+GQQLi6nm2XCXdhy09Xg+EL7R7
	j/9iwprLxAHKAWnWIRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzJs-00000008Y2D-2KpG;
	Fri, 27 Feb 2026 14:59:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzJq-00000008Y1r-3HmU;
	Fri, 27 Feb 2026 14:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K7r8Z1FlUMFRinIqgzxf/xf21Zt3QwRPfC2JIlyyqwU=; b=TRGGO44IVrK2kKf1lWtZC0Es36
	Mg1+dOj/+kKydYYrBURGaaCIFKd6u/P1NGau5SPCPUkrOz2XTsNQogaaxah8j12znGMH248irNM9t
	AatN/JD+A2uXVgEfLPZToUdeaiwkb2dQDVQoNAyWLYfXd13jKNgybB/4X1ATSeMp18gfqe9JKJycW
	xtW2KInAcYga1qwtLjnUuY23rTyWdt587mGkDSNPEx/oItD1fa/jPMx9atfAP91WU4XUKtRtdhn8Y
	ZfgvYIq4oN+CcvB5BnUdhLNXBU7ehAHhMy5LsUF3Cnz8hbsnE1R5/SvRnojRhn2zSavoUotBXHypp
	H31qosBg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzJl-0000000DIWx-3Z3O;
	Fri, 27 Feb 2026 14:59:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 994174383C;
	Fri, 27 Feb 2026 14:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AD5C116C6;
	Fri, 27 Feb 2026 14:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772204387;
	bh=MZa9xWLiumaplzcIo8ZJptqQvtOjLhpO8tJPSbBzWug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QL1/ckIeUXLAKmiHGzBfhKJwkndP36tCWXnb5pplxYMTpN1cZNCETQIVmfto9G2ii
	 +cRsc+StQjLulD2ifCd+gtZijsMCJOBvKPgZsul21LjvCWu3/Ab79RqLekJ22E65a6
	 B+hWEV6QhJ21xMZPjK3+MDj0TD/9Iy8sIYIFqsXBE7pZtRftya1ElAJngc4eQnLPuO
	 9kTl6um+I7uyuaAdYsd94t4Sbic62Uj87k7gl4+reuKTllvOMpLfYcRWL5JvqvDMUQ
	 XHVxOxA8iD/aoqagR5l8hwsvXiQMoVRcqo2m+kvlOa9A/yu0q+5BgSYLgXi0xB2yf9
	 ql7iuT4JvW4aw==
Date: Fri, 27 Feb 2026 20:29:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: k1-usb: k3: add USB2 PHY support
Message-ID: <aaGxX_3FXjM1LT6y@vaman>
References: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
 <20260214-11-k3-usb2-phy-v2-3-6ed31e031ab4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260214-11-k3-usb2-phy-v2-3-6ed31e031ab4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_145951_141470_E9D15F94 
X-CRM114-Status: GOOD (  14.85  )
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

On 14-02-26, 20:29, Yixun Lan wrote:
> Add USB2 PHY support for SpacemiT K3 SoC.
> 
> Register layout of handling USB disconnect operation has been changed,
> So introducing a platform data to distinguish the different SoCs.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/phy/spacemit/phy-k1-usb2.c | 34 +++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> index 959bf79c7a72..b4ba97481ddd 100644
> --- a/drivers/phy/spacemit/phy-k1-usb2.c
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -51,6 +51,9 @@
>  #define PHY_K1_HS_HOST_DISC		0x40
>  #define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
>  
> +#define PHY_K3_HS_HOST_DISC		0x20
> +#define  PHY_K3_HS_HOST_DISC_CLR		BIT(8)
> +
>  #define PHY_PLL_DIV_CFG			0x98
>  #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
>  #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
> @@ -145,7 +148,7 @@ static int spacemit_usb2phy_exit(struct phy *phy)
>  	return 0;
>  }
>  
> -static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
> +static int spacemit_k1_usb2phy_disconnect(struct phy *phy, int port)
>  {
>  	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
>  
> @@ -155,10 +158,27 @@ static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
>  	return 0;
>  }
>  
> -static const struct phy_ops spacemit_usb2phy_ops = {
> +static int spacemit_k3_usb2phy_disconnect(struct phy *phy, int port)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	regmap_update_bits(sphy->regmap_base, PHY_K3_HS_HOST_DISC,
> +					   PHY_K3_HS_HOST_DISC_CLR, PHY_K3_HS_HOST_DISC_CLR);

Please match this with preceding open parenthesis

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
