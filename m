Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF23CEBF8A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=c9BQXOaGj6t7dbY7kk8zkh+Cgw4m4TlK/r8rFQNIPNI=; b=DPhqvG+S/ThyN1fPSRS4XhJPTn
	XwV50UJvj2W9kvVIU/WujEWhV9RO/5a2FDv6kfiU5TjK0zrBQNIqhopE52pQ9xjO/Inrzl0QGqpd6
	mRKEfkKALIzLwl0vVg5KG/YJ4+wxmcLdMFcIGAzwYnacxjBC+Tyd98rYjCM6K9P4DQhQhdnfILkTm
	Gu+9riogorsFGyzB8Rm8VKm5cqlRpqfSPG95eEoKKXiJK+TviGJ9BlbeWvpvqX8i5m7aVe2zoiRGT
	MBUylp3Qnp/k/aMe1dwvXeV3qdQBBUQ+bUnHqqmBqK0DXg4fnfT5RFuBuLqgddUcU3+hOIFTw2Dlo
	xkdiyhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su6wE-0000000AbuO-0g73;
	Fri, 27 Sep 2024 09:06:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su6wA-0000000AbtK-1Asg
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 09:06:56 +0000
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E43E43FA4F
	for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1727428005;
	bh=TdWwWyYx3NSL/g/B28NaT9+skLBhcn0OqBIgUz2KJ8c=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=n85DTPIC0H7EIZa0VGA0SUJmvFNW8osi2lsceL7gPV5mNHNNeg71BiCkkf0xR5Fx2
	 KQ4Lv+cTem8AfE2cPiW7pH0qWXAlgb4rhdsheit14d+QZOCU3vrA0P683u5kn5syih
	 kEfNQ6s1fakhaAIwS2g2ReQBWm80iFICmig5UHt5FzrGAHbTqB+LEcQuhGIJ3VxJqT
	 cpq1JOqEk9rZoSRBtrgSJDqnDMGcvj/v9m+vs5sPPImEvViqQSE1LJLNmKb72cKoab
	 epTpHbVgVcAKRQjNRjfHwOX5e/ToaqQbdm4dwfXoSav3MZAPrxQtNhqeQyHQDne0E4
	 qnutZAUJZgSxA==
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5e1c8fa5032so1296719eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 02:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727427998; x=1728032798;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdWwWyYx3NSL/g/B28NaT9+skLBhcn0OqBIgUz2KJ8c=;
        b=vwsr00xsgGp4TVcOyFrNbtkB74x9mIUoYqtl4BCmEr2gcdrgeetHLiLMnisSS/TyxJ
         99YZGlSykTqsVOBFBupvmYlObLVTdLMbI7/QCT+IyyNJMl0wYR4bOK240RtMDmpb/u8R
         13bJZDonvE91pFYzIE559o7lfPESYTxjrV7eCNMerHix705reOrSJNbROYsLq+Cxt2Oo
         WMbvghIDGnOZbkbXoZH44dwJT9cv7MalpQt9VoMZZX/ZGd2pBnBQxFrw6s4qdCMqLEYD
         sOrhuxuBbDzIakrBZXUQct9gj5YoMrUb5dt+5lS9xtzsXdEqPfQOAwGXf4rYOl7dJXDZ
         Xr2g==
X-Forwarded-Encrypted: i=1; AJvYcCWMGFMmZE2n9sxwltSu0/up33qT82mG0NqHfFmajinlktwMqdmPGvEYdRDtzEfnklyTyPBmdPJgNsshLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxiqSUPfZcsIj5wzJWlJFwWcp+9F/6gbml+RywLytHvt00gNbH
	WT/UwwJBIWdgF0j/bBm9WNFKLrqauPA3RLKGFXTsJIzp9ElKd2buKRYyn7B8//9o7zsIklirMKP
	AY3JInfZATcnD2ESm9HvvsxTSseCa0B0Hac7AHRGcPi5UQ0ISsC2fKGQSHGcxjEXfmGgP7+Hwv8
	W++rsqWYOZ7LnDZGrYKYvl/Sr3WtLVbhH0kLqPx41W7ImQ9+Cy6vfZCCqY
X-Received: by 2002:a05:6871:1c7:b0:277:fd73:8f82 with SMTP id 586e51a60fabf-28710c28d08mr1801235fac.45.1727427998424;
        Fri, 27 Sep 2024 02:06:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv+HoVG+UamQzP9HYGm4dvtX0uDQArn9ex/l2o6/iZbKaH7H7PMWWqDndToxE25AX6dEyIqQ8K4thbHVn/x+E=
X-Received: by 2002:a05:6871:1c7:b0:277:fd73:8f82 with SMTP id
 586e51a60fabf-28710c28d08mr1801204fac.45.1727427998028; Fri, 27 Sep 2024
 02:06:38 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Sep 2024 02:06:37 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <ZvYJfrPx75FA1IFC@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com> <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
 <ZvWyQo+2mwsC1HS6@x1> <0b49b681-2289-412a-8969-d134ffcfb7fc@lunn.ch> <ZvYJfrPx75FA1IFC@x1>
Mime-Version: 1.0
Date: Fri, 27 Sep 2024 02:06:37 -0700
Message-ID: <CAJM55Z8DeGJs=ASgdErEVWagy_f8JMWVe_TEWJWAcrUbzoDjOQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: Add TH1520 ethernet nodes
To: Drew Fustini <dfustini@tenstorrent.com>, Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Drew Fustini <drew@pdp7.com>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_020654_505727_245C02B5 
X-CRM114-Status: GOOD (  18.93  )
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

Drew Fustini wrote:
> On Thu, Sep 26, 2024 at 09:30:32PM +0200, Andrew Lunn wrote:
> > On Thu, Sep 26, 2024 at 12:13:06PM -0700, Drew Fustini wrote:
> > > On Thu, Sep 26, 2024 at 08:39:29PM +0200, Andrew Lunn wrote:
> > > > > +&mdio0 {
> > > > > +	phy0: ethernet-phy@1 {
> > > > > +		reg = <1>;
> > > > > +	};
> > > > > +
> > > > > +	phy1: ethernet-phy@2 {
> > > > > +		reg = <2>;
> > > > > +	};
> > > > > +};
> > > >
> > > > Two PHYs on one bus...
> > >
> > > Thanks for pointing this out. I will move phy1 to mdio1.
> >
> > ???
> >
> > Are you saying the two PHYs are not on the same bus?
>
> Sorry, this is my first time working on an Ethernet driver and I
> misunderstood.
>
> Sipeed only shares the schematic of the baseboard for the LPi4a [1].
> There are pages for GMAC Ethernet0 and GMAC Ethernet1. Each shows 4 MDIO
> differential pairs going into a SG4301G transformer.
>
> I believe that RTL8211F-CG phy chips are on the LM4A SoM board which
> contains the TH1520 SoC. Unfortunately, Sipeed does not provide a
> schematic of the SoM so its hard for me to inspect how the phy chips are
> wired up.
>
> Vendor kernel [2] that Sipeed uses has:
>
> 	mdio0 {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 		compatible = "snps,dwmac-mdio";
>
> 		phy_88E1111_0: ethernet-phy@0 {
> 			reg = <0x1>;
> 		};
>
> 		phy_88E1111_1: ethernet-phy@1 {
> 			reg = <0x2>;
> 		};
> 	};
>
> so I think that does mean they are on the same MDIO bus.

It depends how you look at it. The SoC has two MACs and they can both
control their own MDIO bus. However MDIO of both MACs are pinmux'ed to
the same pins on the SoC. So the solution above just mux the pins to
GMAC0 and let that control both PHYs. Alternatively I guess one could
let each GMAC control their own phy on their own MDIO bus and then
switch pinmux settings everytime you need to need to talk to one or
the other.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
