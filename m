Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91574CDE032
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 19:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRIfiSa1GXp3pPvhbvaolyFo48+G8PYWCTFLG4nACmU=; b=F++huN7ZAxx3dt
	XRDotxSTOfgUHCkj9VS7jAhphEZXFAxZpixLX2kzGMFDUZI4mlH89IwIEhGnfebNmQKe3wpdRXEqY
	VSyEfSTvvQbd0kENpWQyfiPbit67e+vhCgyx3lmv2afB5VB1lIaUmsN1eOkXuPeBoWyqavSIkRdvV
	QNywYBcI6PCSQgsrdFb9861pZB9rHHlz2NbW7GMKFskHbHetMjwIT1uvpFdJ2zS2b1HJsy86s7WYS
	FhEv0MqzadGikb8dxLw2swr+64i9OED67A5Au8IuraHU4N3UE8DpS5tl7MhYD3LVhO+xm0R2ToPWH
	3dZF3lqX2M8FSbZrDVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stuDe-00000009EJt-3HCh;
	Thu, 26 Sep 2024 19:32:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stuCT-00000009EDM-084R;
	Thu, 26 Sep 2024 19:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=97rXd1MBkbPp1jSwK9uUij1xCT6lwGsNcUi1XGXYkNU=; b=09rsAE21J5GAwQPBlHTy2pwgiE
	axFWDn2gmyE0MCTdb6q0WpzVX2N0d4GXJH/exOZPAC1XNtf81SWp7VHMIPUdAAhF5iAutYcK5qmnc
	/O46i3sSo2Gl688xtwM+5n6PMAYNNAWvervVMz6NqPFHnSYnJRawM0D4wyMZHPI8qN0c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1stuC8-008PNA-1h; Thu, 26 Sep 2024 21:30:32 +0200
Date: Thu, 26 Sep 2024 21:30:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: Add TH1520 ethernet nodes
Message-ID: <0b49b681-2289-412a-8969-d134ffcfb7fc@lunn.ch>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
 <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
 <ZvWyQo+2mwsC1HS6@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZvWyQo+2mwsC1HS6@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_123053_096088_0A54873D 
X-CRM114-Status: GOOD (  20.51  )
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

On Thu, Sep 26, 2024 at 12:13:06PM -0700, Drew Fustini wrote:
> On Thu, Sep 26, 2024 at 08:39:29PM +0200, Andrew Lunn wrote:
> > > +&mdio0 {
> > > +	phy0: ethernet-phy@1 {
> > > +		reg = <1>;
> > > +	};
> > > +
> > > +	phy1: ethernet-phy@2 {
> > > +		reg = <2>;
> > > +	};
> > > +};
> > 
> > Two PHYs on one bus...
> 
> Thanks for pointing this out. I will move phy1 to mdio1.

???

Are you saying the two PHYs are not on the same bus?

> > > +		gmac1: ethernet@ffe7060000 {
> > > +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> > > +			reg = <0xff 0xe7060000 0x0 0x2000>, <0xff 0xec004000 0x0 0x1000>;
> > > +			reg-names = "dwmac", "apb";
> > > +			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "macirq";
> > > +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
> > > +			clock-names = "stmmaceth", "pclk";
> > > +			snps,pbl = <32>;
> > > +			snps,fixed-burst;
> > > +			snps,multicast-filter-bins = <64>;
> > > +			snps,perfect-filter-entries = <32>;
> > > +			snps,axi-config = <&stmmac_axi_config>;
> > > +			status = "disabled";
> > > +
> > > +			mdio1: mdio {
> > > +				compatible = "snps,dwmac-mdio";
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +			};
> > > +		};
> > > +
> > > +		gmac0: ethernet@ffe7070000 {
> > > +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> > > +			reg = <0xff 0xe7070000 0x0 0x2000>, <0xff 0xec003000 0x0 0x1000>;
> > > +			reg-names = "dwmac", "apb";
> > > +			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "macirq";
> > > +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
> > 
> > And the MACs are listed in opposite order. Does gmac1 probe first,
> > find the PHY does not exist, and return -EPROBE_DEFER. Then gmac0
> > probes successfully, and then sometime later gmac1 then reprobes?
> > 
> > I know it is normal to list nodes in address order, but you might be
> > able to avoid the EPROBE_DEFER if you reverse the order.
> 
> The probe order seems to always be the ethernet@ffe7060000 (gmac1) first
> and then ethernet@ffe7070000 (gmac0). I do not see any probe deferral
> in the boot log [1].

> [1] https://gist.github.com/pdp7/02a44b024bdb6be5fe61ac21303ab29a

So two PHYs are found, so they must be on the same bus.

It could well be that this MAC driver does not connect to the PHY
until the interface is opened. That is a good 30 seconds after the
driver probes in this log message. So there has been plenty of time
for the PHYs to be found.

What would be interesting is if you used NFS root. Then the interface
would be opened much faster, and you might see an EPROBE_DEFER. But
i'm just speculating. If it works for you, there is no need to do
more.

      Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
