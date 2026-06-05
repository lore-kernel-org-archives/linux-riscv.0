Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA38CD6E5D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 08:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhXyFF0jKxaO/a5Q3MqiQwcZ4mPBTuaRU2z2CRjaoCM=; b=inJTgFuka3EB0Y
	rnTnJC+N5ltJCI2zks+G+SanZXbysaW/K54e9h808U8MsyCt4empQDQNrxcIB42l3ynepv2MBwBQ/
	rxLaknFz64YjKT8qK7UrQ1jai8a2fzUScM4AOYwt8o/w8PJ7r1QsFHt580bFyLtZZ8n4WT0v03fnK
	LdYVPdN2mMZNzTeXnXjQieOylNzHOvvAwvFyUy2cBDPxH5aSSgQhPEzvFy++QXLD/xGTgR2UDFGgU
	ipQ9ZoRr0nfWldShovDfsJQkvS4XKwFKoMxR3aoOX5F2Nslulzuk7CQXxL5Sn6IwQtjz51yfuUT+s
	MVxNi8MtB1VB5i7GYVww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQNW-00000000Lvn-2qv5;
	Fri, 05 Jun 2026 08:58:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQNU-00000000LvI-20FM
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 08:58:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 568D0600AA;
	Fri,  5 Jun 2026 08:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763EC1F00893;
	Fri,  5 Jun 2026 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780649887;
	bh=vrTp+Zp3JQ83tPZI8WFTcJrcku+BrM25I8gPXoRu00s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eZooJwy7No+NiA5mGCXKPhhxRgkfbPnq1r1z/VZHxsSyt3aAFEyzw7+/EyQvPjA+/
	 e9lBR4zEV2LfDztZB+44URcKzJnHDE+LKQ6E43HN8zqzLnURRwxrpq86XBZoPxKWih
	 coCzmeGl+gyY6LvwdgKuaizZqeNpLDS7lYLjw7YluJPl4TcdNljJBb0KL8moPk2FJI
	 RA7x6DKl6v4ZglbX8s3hAqTPg8xDPVsTP6W3diVP78F9GXTTVXKg/E92vKo/OMXhc+
	 QK2w3FHqncGdfgaiw9D3TSzmDQaXg5/gsPFbpEZdVk4WEBOBtGau1NXmo84qpYNUPd
	 gZEBgLjBsrwMg==
Date: Fri, 5 Jun 2026 08:58:02 +0000
From: Yixun Lan <dlan@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>, Han Gao <gaohan@iscas.ac.cn>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dts: riscv: spacemit: k3: Fix I/O power settings
Message-ID: <20260605085802-GKD3727415@kernel.org>
References: <20260518-07-dts-pinctrl-io-power-v1-1-abe19c14a726@kernel.org>
 <9585b7c7-100c-4d77-bed1-d2b6b25b3940@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9585b7c7-100c-4d77-bed1-d2b6b25b3940@freeshell.de>
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

Hi E Shattow,

On 13:17 Wed 03 Jun     , E Shattow wrote:
> 
> Hi Yixun,
> 
> This property on its own does not seem to be enough to get the ethernet
> network port functional on Sipeed K3 Pico-ITX 32GB model that I have,
> when it is loading Debian 13 Trixie debian-installer netinst initramfs
> (with cross-compiled Linux kernel and modules from -next 20260602).
> 
I don't think your problem directly connect to this pacth..

> Reproducer instructions for cross-compiling and debian-installer netinst
> initramfs modification at:
> https://wiki.debian.org/InstallingDebianOn/SpacemiT/K3PicoITX?action=recall&rev=2
> 
> In addition to those instructions above I am using within the factory
> pre-installed vendor U-Boot the following commands to try what your
> patch does:
> 
> fdt addr $fdt_addr_r
> fdt resize
> fdt header get filesize totalsize
> fdt rm /soc/pinctrl@d401e000 spacemit,apbc
> fdt get value spacemit_apbc_phandle /soc/system-controller@d4015000 phandle
> fdt set /soc/pinctrl@d401e000 spacemit,apbc <$spacemit_apbc_phandle>
> 
> I then verify within Linux environment the presence of
> /sys/firmware/devicetree/base/soc/pinctrl@d401e000/spacemit,apbc
> 
> The same Linux kernel and modules as modified into the installer then do
> have functional ethernet networking on that board if running from the
> installed system and with the spacemit,apbc devicetree property. Is this
> a dependency or ordering issue of the modules, or the Kconfig options?
> 
I've checked with the failure kernel dmesg log (you provided offline),
the dwmac driver has been probed twice, with first time failed, it
might be the PHY driver not been initialized, adjust following 
configuration works for me..

CONFIG_STMMAC_ETH=y
CONFIG_REALTEK_PHY=y
CONFIG_I2C_K1=y

the PMIC/Power Regulator rely on I2C driver..

> Also, the more general problem is that cycling rmmod and modprobe on the
> ethernet networking related modules fails:
> 
> rmmod dwmac_spacemit
> rmmod stmmac_platform
> rmmod stmmac
> rmmod mdio
> modprobe dwmac_spacemit
> 
> [ 1487.618517] mdio_bus stmmac-0: MDIO device at address 1 is missing.
> 
> [ 1487.623815] spacemit-dwmac cac80000.ethernet end0: renamed from eth0
> 
> rmmod dwmac_spacemit
> rmmod stmmac_platform
> rmmod stmmac
> rmmod mdio
> modprobe dwmac_spacemit
> 
Need to investigate, could be problem of resource deinitialization issue..

> [ 1539.374486] spacemit-dwmac cac80000.ethernet end0: cannot attach to
> PHY (erro
> r: -ENODEV)
> [ 1615.299451] spacemit-dwmac cac80000.ethernet end0: stmmac_dvr_remove:
> removin
> g driver
> 
> Please advise how to troubleshoot?  Thanks,
> 
> - E Shattow
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
