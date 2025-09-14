Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FEECAC587
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Sep 2025 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVCVF3vxBWz/tLMdLNPqxxwdTLZyCN+CVcSMRmdxl6U=; b=vMc+6TcqLwvIjR
	WrGrPgdevsRwSlOiWTWPf35Abt3G/sStF2pBvpp+UavOXyjRTEQSPc+wvu/iGbJM99MYQ0QMJrCTN
	3suwdHglfSjdVTXnhZWOhVEyDsyKtyfwGyOWO690DjDPPp0ihb61samBCwKlNLYyB6JgS6jK1YrAY
	ad49imR0mpnIN7x9rxrlm+B+cJUoV3tG2vjRqD09tdzRw/gXtFsrgfuE/KJPUSs2N1+cIRxFAfkmW
	JezLAkK0MLmS/YOKvJAXZiCrhskeNrvX+8Dp7v4eAICNiirvD3Ees2oeU6OJ0ggM9zO5QXjgNu8Nf
	1knWiu4x9aJguWkv5mOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnhA-00000001Vqy-1Zsw;
	Sun, 14 Sep 2025 14:27:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnh8-00000001Vpc-32uh
	for linux-riscv@lists.infradead.org;
	Sun, 14 Sep 2025 14:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=an9Yth3zuqwupnWSHxyQHPNMhHnRBJyE4Xw/D6M144A=; b=fF/26pStELSIaGPcAH6ff7U6dr
	L1qbzoep8I4H4LOyTOr4NFtZCf8zQqVMHii8T2GKxQrmrARzobsesSnyZT2BaTOAxq3Vsde3knI2A
	GLNjO6WhwwG+Xskn5DhtUht1TEQg+mY0+EfUOGsAb3mBr/0hrlmsMK0rtE7sE7nuCzew=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uxngk-008LrZ-1F; Sun, 14 Sep 2025 16:26:46 +0200
Date: Sun, 14 Sep 2025 16:26:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Vivian Wang <uwu@dram.page>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Simon Horman <horms@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH net-next v12 4/5] riscv: dts: spacemit: Add Ethernet
 support for BPI-F3
Message-ID: <6ace8fca-21db-40f1-b44d-28e4a1d3d2da@lunn.ch>
References: <20250914-net-k1-emac-v12-0-65b31b398f44@iscas.ac.cn>
 <20250914-net-k1-emac-v12-4-65b31b398f44@iscas.ac.cn>
 <007c08ab-b432-463f-abd8-215371e117c4@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <007c08ab-b432-463f-abd8-215371e117c4@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_072710_766952_7FE4B40B 
X-CRM114-Status: GOOD (  14.52  )
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

On Sun, Sep 14, 2025 at 12:31:04PM +0800, Vivian Wang wrote:
> On 9/14/25 12:23, Vivian Wang wrote:
> > Banana Pi BPI-F3 uses an RGMII PHY for each port and uses GPIO for PHY
> > reset.
> >
> > Tested-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> > Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 48 +++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..33e223cefd4bd3a12fae176ac6cddd8276cb53dc 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -11,6 +11,8 @@ / {
> >  	compatible = "bananapi,bpi-f3", "spacemit,k1";
> >  
> >  	aliases {
> > +		ethernet0 = &eth0;
> > +		ethernet1 = &eth1;
> 
> Hi Andrew,
> 
> I added these two aliases in v12, but kept your Reviewed-by for v11
> because this is fairly trivial. Same for patch 5.
> 
> Is this okay?

Yes, this is fine.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
