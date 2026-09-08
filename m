Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4F5C79FA1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 22:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PjUicu85XTI2PDsjIWchQuDTAsNc5HhpaEQ4bhE+Ug=; b=PztMlx8nz4BLV8
	chZeOFqrYuJT6HBjrSssL3r9Yr4xUyWXF+dY1/Tw3p+pcfIxHJdTRoSoPnZUkKHQV/rpCIE3GC+8p
	P9Ao280qrra5Wlirt5yw4B/funYNrQYwE3JkeuJvOLye5eBhBIlfD3X1HV5/CJbE+7izkYsbc48Cc
	M8DueBWoQ6JtoygMh7HHR3hpkUB9xhV1qHZL8X6hzL/cvvAkyX42cSP3aao6eAmsOlN0bJ10ydu4f
	AO57gP4X+fFYophbkLdFqC1sKtjIersHhhNgfhp3SwYJtGr3f94DyZQMiGSF3DKbjMhcCmiE1ghZ+
	CXcLXeZBpKtg+EkOYqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43y7-0000000AMuJ-3jCN;
	Tue, 08 Sep 2026 22:07:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x43y5-0000000AMtp-3L2g
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 22:07:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 240E640382;
	Tue,  8 Sep 2026 22:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB041F00A3A;
	Tue,  8 Sep 2026 22:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905225;
	bh=JoK2n9Z7urXwu7MomxxLbY36ml5lzGDpWoJEJWTo6Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ht1oyT2pmfS8hYNjLMLZv8UUdLolw9bM0vdtZG4PTG8bQMpx9IU1W+LbDS4g9HbEY
	 qnbKlwUqqY+or2QCAlEyVAo1riElAbTP21bEZDYkxNHH5klnLBe6TmZF5TQupdeUyg
	 WQI+OzzrdXlS9dsds4R9kVBJl+JlOCDNyyiQx7bLfxdbYXumGT7xcfwA1QMv/P+gn3
	 CYID6n1aMc84oLxAOpBcyHmazgNi24qXeS9bF3Ip886d7DlV5Via6OEMcm8gs1bPF6
	 wYV0IxvuLLAXfqSWjcmdJZXf+ALB8ZTHsKf3ZZe04KAY9MT/VCntZJrUUAhGbXM3R5
	 RaDxaspaqSnMg==
Date: Tue, 8 Sep 2026 22:07:03 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Peter Chen <peter.chen@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Ze Huang <huang.ze@linux.dev>
Subject: Re: [PATCH v2 9/9] riscv: defconfig: enable ChipIdea USB controller
 support
Message-ID: <20260908220703-GKD2346@kernel.org>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
 <20260908-b4-spacemit-k1-usb2-v2-9-f07342ffa051@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-9-f07342ffa051@linux.spacemit.com>
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

Hi Junzhong,

On 17:48 Tue 08 Sep     , Junzhong Pan wrote:
> Enable the ChipIdea USB2 controller and SpacemiT K1 USB2 PHY to support
> USB2.0 controllers on the SpacemiT K1 SoC.
> 
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> ---
>  arch/riscv/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 04ae305d5511..5b556488de66 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -222,6 +222,9 @@ CONFIG_USB_CDNS3_HOST=y
>  CONFIG_USB_CDNS3_STARFIVE=m
>  CONFIG_USB_MUSB_HDRC=m
>  CONFIG_USB_MUSB_SUNXI=m
> +CONFIG_USB_CHIPIDEA=y
> +CONFIG_USB_CHIPIDEA_UDC=y
> +CONFIG_USB_CHIPIDEA_HOST=y
I know some prefer to enable as loadable module for non major drivers
so, can you check if it works as module? and alter the config

>  CONFIG_NOP_USB_XCEIV=m
>  CONFIG_USB_GADGET=y
>  CONFIG_USB_CONFIGFS=m
> @@ -272,6 +275,7 @@ CONFIG_PWM=y
>  CONFIG_PWM_PXA=m
>  CONFIG_THEAD_C900_ACLINT_SSWI=y
>  CONFIG_PHY_SUN4I_USB=m
> +CONFIG_PHY_SPACEMIT_K1_USB2=y
>  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
>  CONFIG_PHY_STARFIVE_JH7110_PCIE=m
>  CONFIG_PHY_STARFIVE_JH7110_USB=m
> 
> -- 
> 2.34.1
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
