Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2081AC531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tragq6fLiMGhlbxIFdTuQTFlpjznuopdRXQy5YT4fJs=; b=qQYiH5MCjLPZ4U
	E9HPGsdepf05LWXoKPHEJI+vZz5AOyJo8WTvDLVcHi4upi6dHmoNDCEDqloX3wlgG0t2GjJ8M/wA1
	uj2gyAHxwp3tVX5hOPHqrElRYmSRV9JbGu1L6tflKi6K6TSXf90WiBl9hu3iOEMDN3w4VbrNRWVIG
	CHCokHjsCqi9VyY/MTJ+uGt9ci06tvZ6i2R3ZhpoPKcLwxA258VTPrXn1P7Rfa+bmete8QGi6hkfa
	kA8COA/agjG2YnKfm9h+ZwbHaarqmeIliJFpCPqGqHBa2aoxFQfOl4rP9/jRPfU9gxgv7bjIvevWB
	pGYm2nIW1fRna6qVhgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnelE-00000000VF2-1V7Q;
	Sat, 25 Jul 2026 15:58:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnelB-00000000VEf-45q3
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 15:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jgtuDnxQHEcklSeiDd1KgmBuuv8iaStyhrluO90ziCo=; b=aXXlbmLdbUaQPC3cjZ4BdXrF6i
	kqFuWuGky72WVRw8gdnecWTFVPorfj/UXuSshZda+KE3VOXB1ngc/y/ZwyG08337V0V7oYJGAas2X
	28kh/uP3z8AVwibMp+3/W1UbOcui9FcXds/vMJhbSiJqy1xRKyy9fC11DileQTMQlGQo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wnekw-00E9wW-NK; Sat, 25 Jul 2026 17:57:42 +0200
Date: Sat, 25 Jul 2026 17:57:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>, E Shattow <e@freeshell.de>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Fix phy id check for the phy
 on pico-itx board
Message-ID: <0d11de51-546a-42b6-80cb-8ca258389a17@lunn.ch>
References: <20260725005804.373698-1-inochiama@gmail.com>
 <20260725005804.373698-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260725005804.373698-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_085758_036427_574122FA 
X-CRM114-Status: GOOD (  15.67  )
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

On Sat, Jul 25, 2026 at 08:58:02AM +0800, Inochi Amaoto wrote:
> Current phy framework can not reinit the phy correctly, as it will
> assert the phy reset GPIO so the phy id can not be readed. Setting
> the phy id of board pico-itx manually so the phy id dectection can
> be skipped.
> 
> Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> Reported-by: E Shattow <e@freeshell.de>
> Reported-by: Inochi Amaoto <inochiama@gmail.com>
> Closes: https://lore.kernel.org/netdev/20260712045233.800748-1-inochiama@gmail.com
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> index b2a7d2d0d3a8..b9d2de878f38 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -196,7 +196,8 @@ &eth0 {
>  
>  	mdio {
>  		phy0: phy@1 {
> -			compatible = "ethernet-phy-ieee802.3-c22";
> +			compatible = "ethernet-phy-id001c.c916",
> +				     "ethernet-phy-ieee802.3-c22";

There was a patch recently from one of the DT Maintainers removing the
-c22 compatible when there was a specific PHY ID. I did not look into
why. Does this pass all the binding tool checks?

     Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
