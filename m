Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DDDCAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYsNl4HHej8vHekRAu9isQ730+FDpEp5M7rszBxzFxw=; b=wIDjF2B3caCVWk
	CHdf/N0wso27nO/IY1SJnv335oYTQlyZo5wIQ0Ai7SEG9vK6HfAXKTJEmN2IJFWxsUukd1N5rlP0J
	Ad9UIEHENL9YMYgi1UntNShs481GUhUssFBWWvI9l1xlwskLIytwSrXQvBysrxKOKewIy6KQ3iA4e
	mVRFHnDuAnj3v4sVA+1EFD/fF7773dnD0WmplJ0NeEz3XjAJIei3cddIca7WDrvD6rlOFlgr9+2zH
	qPjYs6EntlNOe9TGcw5lA6EehFDdppnpZzAaZ2u8rHmpFTIezgfEIpPrVBjtf7lXpQ6t7VyRAFS7i
	lBsqHesfWV3G1T0pVCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFiC-00000000A42-0n81;
	Thu, 18 Sep 2025 14:34:16 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFi8-000000009zh-1b13
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 14:34:14 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CFC7826210;
	Thu, 18 Sep 2025 16:34:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykOANX01JFbL; Thu, 18 Sep 2025 16:34:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1758206043; bh=OJ/iqE0vvbz18E6GMkIrxbTsaF2vnkeSqVJuU7BblCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YEWrKUzSsCSY/6lIet+LJXfrbqvxxgBxu6EEaX8WOASNrM38vUChMCZrBB90JUeZr
	 PYE4avyLNpvtfF3gMXoo/oN4PzmqZRuq3zKlh6TIzhiqSezN8/ZUxp5MzRdt+aXPqZ
	 C878VW1nj0rQliDJ4fSM76NUg9MIMxlTihpAKWpybl0tWvALkOrBbqexPFr5o1qXpg
	 3rmhgnenssdkNeC17OKLvMoWxS8IBGORgKww22AU2aqImLklkm8lEnnTRsKEVVhN9q
	 nZUmKMgCaje+iGZkQ6UF4F3mNjEudmMO9W4ifJ7wT9WeOdKg5wkOLfMUHye9TgosOc
	 qQn2tknU207Yg==
Date: Thu, 18 Sep 2025 14:33:40 +0000
From: Yao Zi <ziyao@disroot.org>
To: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
Message-ID: <aMwYRGjTdbQCJf3S@pie>
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-4-elder@riscstar.com>
 <20250918133209-GYB1273705@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250918133209-GYB1273705@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_073412_818092_0DEF8CC0 
X-CRM114-Status: GOOD (  20.54  )
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

On Thu, Sep 18, 2025 at 09:32:09PM +0800, Yixun Lan wrote:
> Hi Alex,
> 
> On 17:07 Wed 17 Sep     , Alex Elder wrote:
> > Define a node for the fourth SoC SPI controller (number 3) on
> > the SpacemiT K1 SoC.
> > 
> > Enable it on the Banana Pi BPI-F3 board, which exposes this feature
> > via its GPIO block:
> >   GPIO PIN 19:  MOSI
> >   GPIO PIN 21:  MISO
> >   GPIO PIN 23:  SCLK
> >   GPIO PIN 24:  SS (inverted)
> > 
> > Define pincontrol configurations for the pins as used on that board.
> > 
> > (This was tested using a GigaDevice GD25Q64E SPI NOR chip.)
> > 
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > ---
> >  .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++++++
> >  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
> >  arch/riscv/boot/dts/spacemit/k1.dtsi          | 19 ++++++++++++++++++
> >  3 files changed, 45 insertions(+)

...

> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index 66b33a9110ccd..a826cc1ac83d5 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -834,6 +834,25 @@ storage-bus {
> >  			#size-cells = <2>;
> >  			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
> >  
> > +			spi3: spi@d401c000 {
> > +				compatible = "spacemit,k1-spi";
> > +				reg = <0x0 0xd401c000 0x0 0x30>;
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				clocks = <&syscon_apbc CLK_SSP3>,
> > +					 <&syscon_apbc CLK_SSP3_BUS>;
> ..
> > +				clock-names = "core",
> > +					      "bus";
> can you simply put them together in one line? it's kind of tedious to split..
> > +				resets = <&syscon_apbc RESET_SSP3>;
> > +				interrupts-extended = <&plic 55>;
> why use interrupts-extended?
> > +				spacemit,k1-ssp-id = <3>;
> > +				dmas = <&pdma 20>,
> > +				       <&pdma 19>;
> .. em, so the SPI will use pdma, then probably you should also adjust Kconfig to
> select PDMA driver?

The driver seems to depend on the generic DMA engine API only, IOW,
theoretically it should work with other DMA controller as well. And it's
even capable to operate without DMA (see k1_spi_dma_setup()).

Dependency to PDMA really doesn't seem something should be enforced in
Kconfig: it doesn't exist in code level, and the driver is actually more
flexible.

Best regards,
Yao Zi

> > +				dma-names = "rx",
> > +					    "tx";
> > +				status = "disabled";
> > +			};
> > +
> >  			emmc: mmc@d4281000 {
> >  				compatible = "spacemit,k1-sdhci";
> >  				reg = <0x0 0xd4281000 0x0 0x200>;
> > -- 
> > 2.48.1
> > 
> > 
> 
> -- 
> Yixun Lan (dlan)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
