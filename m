Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154D5CEBF9D
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6dCQdRrDkWSx1C27CBZ8gDh9Su8iSzTScY1N05ZPHs=; b=QVCXCgiwNTinX1
	Pg8BXRRvdpBPZCqfZQUGj5/43oaLJ7ePAzt6zXuwgrU9v9X4CbA/rLkJ2tNP91qVh+IKqpL0mRZYE
	BQPCnZxPBx9BlwsPEqZgINnjhitJ9RrCsLPMU07TO/0WoaFrBMJX/cUconfA0Ss0YPGHtlkd5o/Wj
	arNUpLid0OiYk+UeczQCcieuysw2yPZsHnTUDaNUvcozJ3EfiARz8Xx3B6WKEkQ2+tMeh0xWG5yyw
	0x+phk5p7kO9YDidey/4Abi2Piov4GAZFAmx7RB9M0AfyvcG3zdh+CEDmr+LTWsOMZm8xzsZoPnlD
	8yBrmnh5cVryAWhHNyRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su9Ye-0000000AzC7-3igx;
	Fri, 27 Sep 2024 11:54:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su9XS-0000000Az3Z-2ZVB;
	Fri, 27 Sep 2024 11:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LgsT4SJMaVNaLNol8+Oz0Hs0nQdKgvAFUDMvdqVb/p4=; b=kUz/gtJV5Vb3boPbS5Hd8g4qUb
	nTO809F1WCk2dNhTjwdVN/6Av34/Kh2NVM0U2HL7fV1lBS5V/PVX0UN7VxCc/TnFbjkE/ZYlXWFfc
	9cYEeD9OQdiZGwLk0B8Lo+JBnVv1X3lYEgqQvMbZFOyVOYgN12/T31JYxHbIr0rcFWM8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1su9X3-008SNh-CZ; Fri, 27 Sep 2024 13:53:09 +0200
Date: Fri, 27 Sep 2024 13:53:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Drew Fustini <dfustini@tenstorrent.com>,
	"David S. Miller" <davem@davemloft.net>,
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
Message-ID: <5eead228-7e46-4905-8faa-6a5bc1da70c4@lunn.ch>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
 <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
 <ZvWyQo+2mwsC1HS6@x1>
 <0b49b681-2289-412a-8969-d134ffcfb7fc@lunn.ch>
 <ZvYJfrPx75FA1IFC@x1>
 <CAJM55Z8DeGJs=ASgdErEVWagy_f8JMWVe_TEWJWAcrUbzoDjOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z8DeGJs=ASgdErEVWagy_f8JMWVe_TEWJWAcrUbzoDjOQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_045334_681058_09B94B9C 
X-CRM114-Status: GOOD (  10.04  )
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

> > Vendor kernel [2] that Sipeed uses has:
> >
> > 	mdio0 {
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 		compatible = "snps,dwmac-mdio";
> >
> > 		phy_88E1111_0: ethernet-phy@0 {
> > 			reg = <0x1>;
> > 		};
> >
> > 		phy_88E1111_1: ethernet-phy@1 {
> > 			reg = <0x2>;
> > 		};
> > 	};
> >
> > so I think that does mean they are on the same MDIO bus.
> 
> It depends how you look at it. The SoC has two MACs and they can both
> control their own MDIO bus. However MDIO of both MACs are pinmux'ed to
> the same pins on the SoC.

Ah. That is unusual. 

> So the solution above just mux the pins to GMAC0 and let that
> control both PHYs.

That makes sense. Using both MDIO bus controllers and playing with the
pinmux on each transaction would be a lot more complex.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
