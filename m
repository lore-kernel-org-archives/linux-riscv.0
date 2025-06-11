Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3C7C71144
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 18:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8y187CZqUQEWq77+oUGgzehHk40FRMhVmhvdo8qlG0=; b=2rO3AQ870Y52/q
	aWBRZl1HN4AXiq8Gd4I9nmUVRAKLzickeSVnM9gywbThiEhM2whCBhnlrS9HOhPXsz7SCUsKkC4L0
	IHASzYyTWkg08DhwIXAe8Pt3/7/vSeFk9z9hj+ryVPiKO9nzSWgFr2PkFcXQ1OriFWOWPPzzW6TkY
	pqqOtcY+aJSYSpCwPpr5zH4ry4U/k4lVdvqT7h3rBsYO5nbZwuec2cnOU33nlx8h1hXsU5rccpPaJ
	8SUZmt9Ps5e4rLFqnAbXlFt1vivW3tzRrbWPm5VhJxUbR7ZujpJuljIq+oyX/FXfmPVvxY1gOMdF/
	JXAhBOMaQSkKZN0p1trg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPk0-0000000AmNZ-2Tki;
	Wed, 11 Jun 2025 18:00:00 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLpI-0000000A0K3-19Da
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 13:49:13 +0000
Received: from localhost (unknown [116.232.147.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D4C21335D3A;
	Wed, 11 Jun 2025 13:49:09 +0000 (UTC)
Date: Wed, 11 Jun 2025 13:48:59 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	drew@pdp7.com, emil.renner.berthing@canonical.com,
	inochiama@gmail.com, geert+renesas@glider.be, tglx@linutronix.de,
	hal.feng@starfivetech.com, joel@jms.id.au, duje.mihanovic@skole.hr,
	elder@riscstar.com, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 8/8] riscv: defconfig: Enable MMP_PDMA support for
 SpacemiT K1 SoC
Message-ID: <20250611134859-GYA125008@gentoo>
References: <20250611125723.181711-1-guodong@riscstar.com>
 <20250611125723.181711-9-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611125723.181711-9-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_064912_331686_DADEE373 
X-CRM114-Status: GOOD (  15.14  )
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

Hi Guodong,

On 20:57 Wed 11 Jun     , Guodong Xu wrote:
> Enable CONFIG_MMP_PDMA in the riscv defconfig for SpacemiT K1 SoC boards
> like the BananaPI-F3 (BPI-F3) and the Sipeed LicheePi 3A.
> 
> According to make savedefconfig, the position of CONFIG_DWMAC_THEAD=m
> should be in another place. It was updated in this patch.
I don't really like those unrelated changes brought into this patch,
either having an independent patch to fix "make savedefconfig" issue,
then enable PDMA in follow-up patch, or just ignore it?

> 
> CONFIG_DWMAC_THEAD was initially introduced into riscv defconfig in
> commit 0207244ea0e7 ("riscv: defconfig: enable pinctrl and dwmac support
> for TH1520")
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  arch/riscv/configs/defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 517cc4c99efc..83d0366194ba 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -134,6 +134,7 @@ CONFIG_MACB=y
>  CONFIG_E1000E=y
>  CONFIG_R8169=y
>  CONFIG_STMMAC_ETH=m
> +CONFIG_DWMAC_THEAD=m
>  CONFIG_MICREL_PHY=y
>  CONFIG_MICROSEMI_PHY=y
>  CONFIG_MOTORCOMM_PHY=y
> @@ -240,7 +241,7 @@ CONFIG_RTC_DRV_SUN6I=y
>  CONFIG_DMADEVICES=y
>  CONFIG_DMA_SUN6I=m
>  CONFIG_DW_AXI_DMAC=y
> -CONFIG_DWMAC_THEAD=m
> +CONFIG_MMP_PDMA=m
>  CONFIG_VIRTIO_PCI=y
>  CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
