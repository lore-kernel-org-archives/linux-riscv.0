Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CD8E6B253
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZQSGpTPsz3butQ3JZfyA527QTF/dcszG4v1Cbvm7n0=; b=EbMH6xpXOYl2nl
	sZDJ5qZNynHdskntbiaEqtz46iOwZfN6W6whoQWusy1q+3ShWQjyPj1mYzhySn2S8dzB9KkyuqvV4
	jGKD3kB5uBN8/pHSjxQyF8VriyN8nM0DiBhtWJqMVbZaWFhUlmqOwJHYweTeLVB8iwhzTR97a9vEI
	IJAm8sVsj5sYJ3iMZh4qHpOrs5L42KW5QM7eNN3yxWEQwpORWZljjR4rzn3ro6lCx/egKMcSqDWlx
	H+XN73NOPCyOj+58VwqqYwKh7AqPG5hVhqiL9OS6BmE7H9fT1RKsjZcqUxII1YOlQN9ZLrnzL1DlP
	B4zO2YdFdNXGjl/6rUJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qwt-000000074eH-24YK;
	Fri, 01 Nov 2024 12:40:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qwq-000000074dK-1g3l
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 12:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JLfKetvUuxPUYkpPeA7mnXrzdgQkP5ynoIU4H8aYS3U=; b=h0FAhilmGmVBQ5NQWg3uCkBa5Z
	wBWcuyUI17qGVzn7hgmPZYc8+Y/8faJQW7qsFUCd4+QAan8AfGgxrSLUThwbNqFCSqRFnV8RWNRFl
	DvvjfhGliWxog9tagmqENZzMNVIlzb7BrBGuszd5VPi+LN8iAw7MpZz4Ue4QhsS0WqoI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t6qwa-00BsXZ-SD; Fri, 01 Nov 2024 13:40:00 +0100
Date: Fri, 1 Nov 2024 13:40:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Liu Gui <kenneth.liu@sophgo.com>, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: Add ethernet configuration for cv18xx
Message-ID: <5b08e092-c302-43a9-a04d-3566bec96e94@lunn.ch>
References: <20241028011312.274938-1-inochiama@gmail.com>
 <87e215a7-0b27-4336-9f9c-e63ade0772ef@lunn.ch>
 <wgggariprpp2wczsljy3vw6kp7vhnrifg6soxdgiio2seyctym@4owbzlg3ngum>
 <ftfp2rwkytqmzruogcx66d5qkn4tzrgyjtlz4hdduxhwit3tok@kczgzrjdxx46>
 <e389a60d-2fe3-46fd-946c-01dd3a0a0f6f@lunn.ch>
 <nkydxanwucqmbzzz2fb24xyelrouj6gvhuuou2ssbf4tvvhfea@6uiuueim7m3a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <nkydxanwucqmbzzz2fb24xyelrouj6gvhuuou2ssbf4tvvhfea@6uiuueim7m3a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_054016_469306_32A39A1C 
X-CRM114-Status: GOOD (  24.40  )
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

> > > > > > +			mdio {
> > > > > > +				compatible = "snps,dwmac-mdio";
> > > > > > +				#address-cells = <1>;
> > > > > > +				#size-cells = <0>;
> > > > > > +
> > > > > > +				phy0: phy@0 {
> > > > > > +					compatible = "ethernet-phy-ieee802.3-c22";
> > > > > > +					reg = <0>;
> > > > > > +				};
> > > > > > +			};
> > > > > 
> > > > > It is not clear to me what cv18xx.dtsi represents, 
> > > > 
> > > > This is a include file to define common ip for the whole
> > > > cv18xx series SoCs (cv1800b, cv1812h, sg2000, sg2000).
> > > > 
> > > > > and where the PHY node should be, here, or in a .dts file. 
> > > > > Is this a SOM, and the PHY is on the SOM? 
> > > > 
> > > > The phy is on the SoC, it is embedded, and no external phy
> > > > is supported. So I think the phy node should stay here, not 
> > > > in the dts file.
> > > 
> > > There is a mistake, Some package supports external rmii/mii
> > > phy. So I will move this phy definition to board specific.
> > 
> > When there is an external PHY, does the internal PHY still exists? If
> > it does, it should be listed, even if it is not used.
> > 
> > Do the internal and external PHY share the same MDIO bus? 
> 
> They share the same MDIO bus and phy id setting.

What do you mean by phy ID?

> When an external phy
> is select, the internal one is not initialized and can not be accessed
> by the SoC.
> 
> > I've seen some SoCs with complex MDIO muxes for internal vs external
> > PHYs.
> > 
> > 	Andrew
> 
> There is a switch register on the SoC to decide which phy/mode is used. 
> By defaut is internal one with rmii mode. I think a driver is needed to
> handle this properly.

This sounds like a complex MDIO mux. You should think about this now,
because others have left this same problem too late and ended up with
a complex design in order to keep backwards compatibility with old DT
blobs which don't actually describe the real hardware.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
