Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24271C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9EwHBZ8fqwc3Ocki09DvBtsJ9SO2xONum4SW66BCPg=; b=3gozlO1wL+eL2K
	XczZP4/vH/5C/1KGctrXZD0DXz20sHjOBzevUjiRd1na/5wgSBrlBHpNYjshVVpkSmmvKkdBW73Zu
	oxpKbKzurjtiIaUFxDkWAjT8e4Lj8w+8lLCt3WG05zo0RTDLH34oJeXkPS6tR+GlNYNtaEN4byIVs
	AF//OYfKu7ugAlc2hSiGnFoRhxO+Gv/g/UvgCUAf3nS35bBL6qiz/nzQ9XrZwRtKnPLousqTT6Rj5
	rtUNFqGLd31YdSGFG9c+fZi9fSPc0inm5I0+6EAOkj+6LbINVO9EGNFstEQTO9420wiryLiiE5A0B
	I4EE2O4ru5R0sZTOXKcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0fe-0000000ENt1-23Vz;
	Tue, 07 Jul 2026 07:56:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0fd-0000000ENsv-2uKV
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 07:56:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C0E3401CA;
	Tue,  7 Jul 2026 07:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245F11F000E9;
	Tue,  7 Jul 2026 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411005;
	bh=qaJDMFyR+9jLQSxF03msoSIkTshFmDA4EhMhCDFnmjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A9bjJadLxG7fn5qzOI2Qt9OPM+U3hP3p5LM/75sg6b45yzGpoyX8tnEdXaOuB4HRh
	 /bwASg9dpZ5oFrf+ISXo4aN3d3Z9jl070OUQMmTjx10FdBHbb6nueTTppRJelqTRBN
	 A7PJopGnCYOuFPjxQQTgbWlSzbytw0HVdLLLN6N3DGcs+kO6TK0uM75Z4E3o0zTH8O
	 hznV7A8UruoBehq1CXMx92z33Q3Lr5YDSwaK9KLxSZLwZayKvIYX32AkQ26YuCBKU4
	 U44d6P9KWlHlzB4i6z8s/MiB75PZPiu7Jr8RPAZAS8hCVHGJ8+AGs7NLVZm7Gvm+mS
	 3+GlhJSgmoziQ==
Date: Tue, 7 Jul 2026 07:56:42 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 5/5] riscv: dts: spacemit: improve RTL8211F PHY
 configuration on K3 Pico-ITX board
Message-ID: <20260707075642-GKG35811@kernel.org>
References: <20260623204431.498700-1-aurelien@aurel32.net>
 <20260623204431.498700-6-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260623204431.498700-6-aurelien@aurel32.net>
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

Hi Aurelien,

On 22:43 Tue 23 Jun     , Aurelien Jarno wrote:
> Vendor kernel enabled ALDPS (Advanced Link Down Power Saving) on the
> RTL8211F PHY to save power when link down.
for ALDPS, tested here do noticed it will configure RTL8211F PHY's
 RTL8211F_PHYCR1 register via rtl8211f_config_aldps()

And plug out then in the cable, the network(eth0) will come back and still
works fine, although I have no power consumption meter to test, but I think
 it deserves:

Tested-by: Yixun Lan <dlan@kernel.org>

> 
> Vendor kernel also disabled the 125MHz clkout clock signal, and indeed
> the schematics confirms that it only goes to a test point (TP14), so
> let's do the same.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index bf64b6c6f867f..e12d798b48a49 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -234,6 +234,8 @@ phy0: phy@1 {
>  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
>  			reset-assert-us = <10000>;
>  			reset-deassert-us = <10000>;
> +			realtek,aldps-enable;
> +			realtek,clkout-disable;
>  		};
>  	};
>  };
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
