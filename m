Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC22CD2E006
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 01:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjWEfUH2b7FRJkSoeMzKqGs1lZYHUthge0FOWPD+oRM=; b=Lk802zkpXPL04O
	dMUPH9+eBadkYhTstUzdl0xge/740w2Bcq/StKyh6U1bzXejCplkM4BNWxoglvI5SW6+IeP7ExT/P
	e/UVTKWhMlsJFg2q4bUQwCr415MoWaIvCWWcYCISeWQKCHrwH2eoCvLeF6pdBIVF/gWQGsijiAWXa
	uBl2s4C8TL7XSHToZ4QPmbo/38/jjkKat6GeK519HaONuhHB0BD91d2/7AYHVFwN7Bk//vSy+dTom
	5tXT5tAcvnHgQebBuOOVmQRGjhQHk2ZYzXSPtZ/mefnED2qJG6vnjADxJ2VDnoLPlAgZ+DfrleuEE
	73EcxVJ4oSASLcnsc+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ptk-0000000CaY5-0JsW;
	Wed, 23 Oct 2024 01:10:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3PsC-0000000CaNM-16v8;
	Wed, 23 Oct 2024 01:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Luc414sqlYd9r0hDusrFOUlGPmShpMBsFYhEzzPbPG8=; b=aEgBdFd7EvMykDpVG1QVfh49KR
	5u9QFtmR4J7sflyt1GIeWIFboSZRFtINEdsb08ZeGtSJbNlinAimtn8fpFRuP3MWjkp38q1HWNocG
	h8ynoSuwrb9LfOGoX/pw869W4udzciX9gh/6NHwhIGv5REsP6umt77XbQWTKsum6FfR8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t3Pro-00AtuF-B7; Wed, 23 Oct 2024 03:08:52 +0200
Date: Wed, 23 Oct 2024 03:08:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <d691a687-c0e2-48a9-bf76-d0a086aa7870@lunn.ch>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
 <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
 <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
 <424erlm55tuorjvs2xgmanzpximvey22ufhzf3fli7trpimxih@st4yz53hpzzr>
 <66f35d1b-fd26-429b-bbf9-d03ed0c1edaf@lunn.ch>
 <zum7n3656qonk4sdfu76owfs4jk2mkjrzayd57uuoqeb6iiris@635pw3mqymqd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <zum7n3656qonk4sdfu76owfs4jk2mkjrzayd57uuoqeb6iiris@635pw3mqymqd>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_180916_329300_1DB1FB97 
X-CRM114-Status: GOOD (  27.12  )
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

On Wed, Oct 23, 2024 at 08:41:36AM +0800, Inochi Amaoto wrote:
> On Tue, Oct 22, 2024 at 03:51:08PM +0200, Andrew Lunn wrote:
> > On Tue, Oct 22, 2024 at 06:21:49PM +0800, Inochi Amaoto wrote:
> > > On Mon, Oct 21, 2024 at 03:27:18PM +0200, Andrew Lunn wrote:
> > > > > It is related to the RGMII delay. On sg2044, when the phy 
> > > > > sets rx-delay, the interal mac is not set the same delay, 
> > > > > so this is needed to be set.
> > > > 
> > > > This is the wrong way to do it. Please look at how phy-mode should be
> > > > used, the four different "rgmii" values. Nearly everybody gets this
> > > > wrong, so there are plenty of emails from me in the netdev list about
> > > > how it should be done.
> > > > 
> > > 
> > > The phy-mode is alreay set to the "rgmii-id" and a rx delay is already
> > > set (a default tx delay is set by the phy driver). In the scenario 
> > > the extra bit is used to fix 2ns difference between the sampling clock
> > > and data. It is more like an extra setting and the kernel can not handle
> > > it by only setting the phy-mode.
> > 
> > This sounds wrong.
> > 
> > So in DT you have rgmii-id? You say the PHY is doing TX delay. So you
> > pass PHY_INTERFACE_MODE_RGMII_TXID to the PHY? It is not clear from
> > this patch, i don't see any code mentioning
> > PHY_INTERFACE_MODE_RGMII_TXID. Could you point me at that code.
> > 
> > 	Andrew
> 
> The phy on the board I have is YT8531, The config code is here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/motorcomm.c#n868

This PHY should be able to do rgmii-id, so there is no need for the
MAC to add delays. We encourage that setup in linux, so all RGMII
MAC/PHY pairs are the same, the PHY add the delays.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
