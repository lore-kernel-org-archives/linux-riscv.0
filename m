Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A676BCEBF66
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 01:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Ie7L9kvdFCn7nY4xPRrddlWHOqkMgt6iOMSyCNbeZ8=; b=LiF+q5RO11Uf45
	pSyFGxmbZc7KoKNt5eVtSK0VGOaRwuRhzAJYsym45iIFlQJOkexxINA+Vn5AS9y5UwTKgqitWPBHu
	Z8qtCTKe/Ap8RTvzFvxHtlXe1OGwNp3/pfRfbbaCaAIiEENV0fihKGoGwSHzww3vh4dV+vM0vinIy
	145XTR2dKix0pf1LFGh5cgJtq2XkajYUg1/+8+ev8vl1Kx6cJ5Z9sQUF1Fs8xsbchSBABTC9mu9B7
	y4fmXcqaRBlXZIaPrMv7vMO0V26xnY+n5rBSdWJYsYZk2Yjii23V8e+mKkaGyOSNhGtjsqC59fhXH
	m3jjodjqhtur9s5Cr1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stzja-00000009jbl-0nSJ;
	Fri, 27 Sep 2024 01:25:26 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stzjW-00000009jau-15DT
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 01:25:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20b0b5cdb57so15502595ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 18:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727400321; x=1728005121; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCmcLe0SmYgeEcqqhkJU0Qezbgs/J4u3/7L98eJgBA8=;
        b=f/Qq9c6zvRaCLPx2gb5UFa3fTgXJuvmk8lZUviZ4lhtrLffw67tDEP//IY2tP9p0GI
         71rfV+0fQBqqX8fyK8pRkoWn10oOwAuvlBVtW2eQBdhLJO8xifJfSHSvp15IhbHn4e9G
         /lxhyb6+st6bWZeZ2Zi96bSmRa5mhcTRFM6Q0I/10nvFOF/YKKkZAc8tOXSycLRU4FX2
         5x+ImYtOom30OPrvHr29AshmR4VRGA7czM4cCQJaacdLHgyAObC9x0dWkJoxFDnA9MTL
         Pk7vfe9h/jJ7+4MoT92DpOBp9DUUEUfYZkJMETiXAbQhlMUicJLGD/d3tW1kNSSfhbKw
         RBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727400321; x=1728005121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCmcLe0SmYgeEcqqhkJU0Qezbgs/J4u3/7L98eJgBA8=;
        b=EBXTbgGyJbWzUABKQahZLeqG5zx53q6WjJYpM25NEv+6HK2vgKx/z5BLn7Hc2RZiG7
         +c7MXYpWJ/8e7S+34yvv63paUef+v0y4LReoZ2IB4fYWVYZ6/wZsvQN1XViQazianPlj
         a99EWVLgJnknDOFD07byDuxsZnPcoOBgekotGxF6q+lByaTIpBN6jhs8RZBmFStmQoXJ
         sDdEICaax64S8uGiI+JvvhNj5DxDDCNzMJCj0ZeuykG4cxudeHanuVBAHgAoqYK6LA0k
         SxQUqila+UExlO7Hcp0KIJS8fGYdzBXENQt5Eeygl4IyEScxnt3n8ow3QbChovVdAsFc
         W8WA==
X-Forwarded-Encrypted: i=1; AJvYcCXXICbl67NOYHMMMVVgj+t0LUfkpIoMd4fwAyTXnBOV0grlve9InkL3We+FW3hV/4FqRll09mBwotldwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiA0YXSwyjbGZAKODh+fGTwYywWBbYVYCmxWR3PzVcHR6Qvisx
	tMksFYGrBRsX4rpus8Kcx8jueJePwUMKCyyzUbjf1PxypHrVOhggm9Oix4t9l80=
X-Google-Smtp-Source: AGHT+IFNIOZRxH8HvJGMbMu1i8sPGpIXAzt+jVyHPQIeV5WglmLr8F5WYqM/TslsbY+ZUY/LOi5w8A==
X-Received: by 2002:a17:903:2a84:b0:205:8a8b:bd2a with SMTP id d9443c01a7336-20b19cadb22mr63571405ad.22.1727400321286;
        Thu, 26 Sep 2024 18:25:21 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e357e8sm4132645ad.187.2024.09.26.18.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 18:25:20 -0700 (PDT)
Date: Thu, 26 Sep 2024 18:25:18 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <ZvYJfrPx75FA1IFC@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
 <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
 <ZvWyQo+2mwsC1HS6@x1>
 <0b49b681-2289-412a-8969-d134ffcfb7fc@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b49b681-2289-412a-8969-d134ffcfb7fc@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_182522_338812_3FC92120 
X-CRM114-Status: GOOD (  34.21  )
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

On Thu, Sep 26, 2024 at 09:30:32PM +0200, Andrew Lunn wrote:
> On Thu, Sep 26, 2024 at 12:13:06PM -0700, Drew Fustini wrote:
> > On Thu, Sep 26, 2024 at 08:39:29PM +0200, Andrew Lunn wrote:
> > > > +&mdio0 {
> > > > +	phy0: ethernet-phy@1 {
> > > > +		reg = <1>;
> > > > +	};
> > > > +
> > > > +	phy1: ethernet-phy@2 {
> > > > +		reg = <2>;
> > > > +	};
> > > > +};
> > > 
> > > Two PHYs on one bus...
> > 
> > Thanks for pointing this out. I will move phy1 to mdio1.
> 
> ???
> 
> Are you saying the two PHYs are not on the same bus?

Sorry, this is my first time working on an Ethernet driver and I
misunderstood.

Sipeed only shares the schematic of the baseboard for the LPi4a [1].
There are pages for GMAC Ethernet0 and GMAC Ethernet1. Each shows 4 MDIO
differential pairs going into a SG4301G transformer.

I believe that RTL8211F-CG phy chips are on the LM4A SoM board which
contains the TH1520 SoC. Unfortunately, Sipeed does not provide a
schematic of the SoM so its hard for me to inspect how the phy chips are
wired up.

Vendor kernel [2] that Sipeed uses has:

	mdio0 {
		#address-cells = <1>;
		#size-cells = <0>;
		compatible = "snps,dwmac-mdio";

		phy_88E1111_0: ethernet-phy@0 {
			reg = <0x1>;
		};

		phy_88E1111_1: ethernet-phy@1 {
			reg = <0x2>;
		};
	};

so I think that does mean they are on the same MDIO bus.

> 
> > > > +		gmac1: ethernet@ffe7060000 {
> > > > +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> > > > +			reg = <0xff 0xe7060000 0x0 0x2000>, <0xff 0xec004000 0x0 0x1000>;
> > > > +			reg-names = "dwmac", "apb";
> > > > +			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			interrupt-names = "macirq";
> > > > +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
> > > > +			clock-names = "stmmaceth", "pclk";
> > > > +			snps,pbl = <32>;
> > > > +			snps,fixed-burst;
> > > > +			snps,multicast-filter-bins = <64>;
> > > > +			snps,perfect-filter-entries = <32>;
> > > > +			snps,axi-config = <&stmmac_axi_config>;
> > > > +			status = "disabled";
> > > > +
> > > > +			mdio1: mdio {
> > > > +				compatible = "snps,dwmac-mdio";
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +			};
> > > > +		};
> > > > +
> > > > +		gmac0: ethernet@ffe7070000 {
> > > > +			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
> > > > +			reg = <0xff 0xe7070000 0x0 0x2000>, <0xff 0xec003000 0x0 0x1000>;
> > > > +			reg-names = "dwmac", "apb";
> > > > +			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
> > > > +			interrupt-names = "macirq";
> > > > +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC_AXI>;
> > > 
> > > And the MACs are listed in opposite order. Does gmac1 probe first,
> > > find the PHY does not exist, and return -EPROBE_DEFER. Then gmac0
> > > probes successfully, and then sometime later gmac1 then reprobes?
> > > 
> > > I know it is normal to list nodes in address order, but you might be
> > > able to avoid the EPROBE_DEFER if you reverse the order.
> > 
> > The probe order seems to always be the ethernet@ffe7060000 (gmac1) first
> > and then ethernet@ffe7070000 (gmac0). I do not see any probe deferral
> > in the boot log [1].
> 
> > [1] https://gist.github.com/pdp7/02a44b024bdb6be5fe61ac21303ab29a
> 
> So two PHYs are found, so they must be on the same bus.
> 
> It could well be that this MAC driver does not connect to the PHY
> until the interface is opened. That is a good 30 seconds after the
> driver probes in this log message. So there has been plenty of time
> for the PHYs to be found.
> 
> What would be interesting is if you used NFS root. Then the interface
> would be opened much faster, and you might see an EPROBE_DEFER. But
> i'm just speculating. If it works for you, there is no need to do
> more.
> 
>       Andrew

I tried to setup an nfs server with a rootfs on my local network. I can
mount it okay from my laptop so I think it is working okay. However, it
does not seem to work on the lpi4a [3]. It appears the rgmii-id
validation fails and the dwmac driver can not open the phy:

 thead-dwmac ffe7060000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
 thead-dwmac ffe7060000.ethernet eth0: validation of rgmii-id with support \
             00,00000000,00000000,00006280 and advertisementa \
	     00,00000000,00000000,00006280 failed: -EINVAL
 thead-dwmac ffe7060000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -22)

I suppose that this is what you were talking about that NFS will cause
the interface to be opened much faster.

Thanks,
Drew

[1] https://dl.sipeed.com/shareURL/LICHEE/licheepi4a/02_Schematic
[2] https://github.com/revyos/thead-kernel/blob/lpi4a/arch/riscv/boot/dts/thead/th1520-b-product.dts#L758
[3] https://gist.github.com/pdp7/458eb93509548383beabeb21c8ffc43a

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
