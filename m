Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFEEC36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 18:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBR0SiP+B9DSTq9Mk5JK09MpA4EI+jHCfXWN05sIapw=; b=HirYhynPQnysYk
	/ZNH9Zu2EYEcIuD8b+/rUt7RUtnchx/rchEGSdkxQxTwmfLcPa6X9UXxXI22X0/9mF4Wj4AED0ezY
	IQ4lFsFnSqGKuWG+LrUzYetB3Xoj2n+NKzERMk67yLDYyeMIts2Tz9eE9MhCuOT3BWWutX93eB7Bz
	ba1G0Vjho87famyTOtJ0WcdqYnL6Sy7ln5CzvnuhYS8tdayv+VLT/ad1C4MzSa7vs7KpKNhv0e7n/
	gfh1QUDyEOkYVZb9sv9GqyrL6855oZAKd5PuRn+3WJJWnNtVGXZeyhCpCHBRaLY/AbxdxwEYn5mAJ
	bTZCsqih2kd4LysyWmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twmfL-00000003xbv-1SlJ;
	Mon, 24 Mar 2025 18:36:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twmez-00000003xXl-3nGY
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 18:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=X4F3sqvTWUFr3hm2OdD/nyNotX8RIX6/b7P9siq4rRk=; b=O1
	ktSCBftk6ilHFHI8FsPU/AMeKO4wrvczxzcGq4nXakKm9e7dUZrW2uwOeycO6IoajlOuCHcT9ITm1
	CT7GrwHUOAwCtujspynPvj2k6kGpmUDJSLQxtiygO89/y9H7VqqA6JkRwAMraFHOi6pFGb0hgYqCg
	guyfF9TnKcsQ75s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1twmec-006y0k-WC; Mon, 24 Mar 2025 19:36:07 +0100
Date: Mon, 24 Mar 2025 19:36:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH net-next 07/13] net: macb: move HW IP alignment value to
 macb_config
Message-ID: <967fcb66-6a64-4e97-8293-a38b0ef1bc01@lunn.ch>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-7-537b7e37971d@bootlin.com>
 <45b3e613-90c6-4499-b50b-383106172184@lunn.ch>
 <D8OOPAXK16CI.3TE75O760JRSL@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D8OOPAXK16CI.3TE75O760JRSL@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_113629_942632_D1D3C68F 
X-CRM114-Status: GOOD (  21.58  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 24, 2025 at 06:49:05PM +0100, Th=E9o Lebrun wrote:
> Hello Andrew,
> =

> On Fri Mar 21, 2025 at 10:06 PM CET, Andrew Lunn wrote:
> > On Fri, Mar 21, 2025 at 08:09:38PM +0100, Th=E9o Lebrun wrote:
> >> The controller does IP alignment (two bytes).
> >
> > I'm a bit confused here. Is this hard coded, baked into the silicon?
> > It will always do IP alignment? It cannot be turned off?
> =

> Yes, the alignment is baked inside the silicon.
> I looked but haven't seen any register to configure the alignment.
> =

> Sorry the commit message isn't clear, it needs improvements.
> =

> >> 	skb_reserve(skb, NET_IP_ALIGN);
> >
> > Why not just replace this with
> >
> >         skb_reserve(skb, 2);
> =

> On arm64, NET_IP_ALIGN=3D0. I don't have HW to test, but the current code
> is telling us that the silicon doesn't do alignment on those:

This is part of the confusion. You say the hardware does alignment,
and then say it does not....

>    skb =3D netdev_alloc_skb(...);
>    paddr =3D dma_map_single(..., skb->data, ...);
>    macb_set_addr(..., paddr);
> =

>    // arm   =3D> NET_IP_ALIGN=3D2 =3D> silicon does alignment
>    // arm64 =3D> NET_IP_ALIGN=3D0 =3D> silicon doesn't do alignment
>    skb_reserve(skb, NET_IP_ALIGN);
> =

> The platform we introduce is the first one where the silicon alignment
> (0 bytes) is different from the NET_IP_ALIGN value (MIPS, 2 bytes).

This is starting to make it clearer. So the first statement that the
controller does IP alignment (two bytes) is not the full story. I
would start there, explain the full story, otherwise readers get the
wrong idea.

> >>     Compatible             |  DTS folders              |  hw_ip_align
> >>    ------------------------|---------------------------|--------------=
--
> >>    cdns,at91sam9260-macb   | arch/arm/                 | 2
> >>    cdns,macb               | arch/{arm,riscv}/         | NET_IP_ALIGN
> >>    cdns,np4-macb           | NULL                      | NET_IP_ALIGN
> >>    cdns,pc302-gem          | NULL                      | NET_IP_ALIGN
> >>    cdns,gem                | arch/{arm,arm64}/         | NET_IP_ALIGN
> >>    cdns,sam9x60-macb       | arch/arm/                 | 2
> >>    atmel,sama5d2-gem       | arch/arm/                 | 2
> >>    atmel,sama5d29-gem      | arch/arm/                 | 2
> >>    atmel,sama5d3-gem       | arch/arm/                 | 2
> >>    atmel,sama5d3-macb      | arch/arm/                 | 2
> >>    atmel,sama5d4-gem       | arch/arm/                 | 2
> >>    cdns,at91rm9200-emac    | arch/arm/                 | 2
> >>    cdns,emac               | arch/arm/                 | 2
> >>    cdns,zynqmp-gem         | *same as xlnx,zynqmp-gem* | 0
> >>    cdns,zynq-gem           | *same as xlnx,zynq-gem*   | 2
> >>    sifive,fu540-c000-gem   | arch/riscv/               | 2
> >>    microchip,mpfs-macb     | arch/riscv/               | 2
> >>    microchip,sama7g5-gem   | arch/arm/                 | 2
> >>    microchip,sama7g5-emac  | arch/arm/                 | 2
> >>    xlnx,zynqmp-gem         | arch/arm64/               | 0
> >>    xlnx,zynq-gem           | arch/arm/                 | 2
> >>    xlnx,versal-gem         | NULL                      | NET_IP_ALIGN

I'm not sure this table is useful. What might be more interesting is

     Compatible             |  architecture |  hw_ip_align | value of NET_I=
P_ALIGN

We can then see if there are cases when the 3rd and 4th column differ.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
