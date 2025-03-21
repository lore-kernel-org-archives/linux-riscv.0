Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F1DC36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 21:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihzcJ3vgoER+Tyf6A1uZhTZ8eVe0XZYj5cSQN1Sp2J4=; b=x0TcciXxQLznPe
	p0krhL8gEun7djczvwzMYbkn5herBYXDsBQlhpt79ny48PIdpqTVE9De5AmPN0OV4OjML3dcV0a7L
	Vwm5WyAIMFbOoCnOV2l/pQGcvMjVaHg7j5kb7l6xhSBxpPsToV0/DGvk77BRyV2QV2PlU/PtMl54J
	qam8gmlQTHTtxx7Hye2bSJACeUCwVKdc5RAGH1ntLb9dLa0R8vqn9GgBftC+uaWbYH2ZSBy8FnxiP
	bJjQgGPAWEG+NKtfgS5gms1ZL/071Xe2hYmVZtf6kuZr62oQrhH9mKHFKc6uuiFylDcPYIwu2xvam
	SneFT9GNCRaHVysWuWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjak-0000000GJ3X-0LJi;
	Fri, 21 Mar 2025 21:07:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjZX-0000000GIup-3ioj
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 21:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=buUh30Oz9yzO2/ro6EDCpMmAZW/F4GUFW3had039J1M=; b=NG
	8RHjTH4PsYo7d4kavqAQLOQu8x9oErOGpm34Sd5TXukty8lLPiNgrEE+3S1bWeqc0SdxWsnzznxA8
	uq0KJxz55GYICV0LFFn4KCuU71h7ZgLIuC9rC2LyVeloigEBWrzWCsM8S1HzVpG9SNfj+m2ZTmv12
	xBE77m5deunc41w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvjZK-006ehx-5I; Fri, 21 Mar 2025 22:06:18 +0100
Date: Fri, 21 Mar 2025 22:06:18 +0100
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
Message-ID: <45b3e613-90c6-4499-b50b-383106172184@lunn.ch>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-7-537b7e37971d@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321-macb-v1-7-537b7e37971d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_140631_922331_C7D6552C 
X-CRM114-Status: GOOD (  10.64  )
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

On Fri, Mar 21, 2025 at 08:09:38PM +0100, Th=E9o Lebrun wrote:
> The controller does IP alignment (two bytes).

I'm a bit confused here. Is this hard coded, baked into the silicon?
It will always do IP alignment? It cannot be turned off?

> 	skb_reserve(skb, NET_IP_ALIGN);

Why not just replace this with

        skb_reserve(skb, 2);

> The NET_IP_ALIGN value is arch-dependent and picked based on unaligned
> CPU access performance. The hardware alignment value should be
> compatible-specific rather than arch-specific. Offer a path forward by
> adding a hw_ip_align field inside macb_config.
> =

> Values for macb_config->hw_ip_align are picked based on upstream
> devicetrees:
> =

>     Compatible             |  DTS folders              |  hw_ip_align
>    ------------------------|---------------------------|----------------
>    cdns,at91sam9260-macb   | arch/arm/                 | 2
>    cdns,macb               | arch/{arm,riscv}/         | NET_IP_ALIGN
>    cdns,np4-macb           | NULL                      | NET_IP_ALIGN
>    cdns,pc302-gem          | NULL                      | NET_IP_ALIGN
>    cdns,gem                | arch/{arm,arm64}/         | NET_IP_ALIGN
>    cdns,sam9x60-macb       | arch/arm/                 | 2
>    atmel,sama5d2-gem       | arch/arm/                 | 2
>    atmel,sama5d29-gem      | arch/arm/                 | 2
>    atmel,sama5d3-gem       | arch/arm/                 | 2
>    atmel,sama5d3-macb      | arch/arm/                 | 2
>    atmel,sama5d4-gem       | arch/arm/                 | 2
>    cdns,at91rm9200-emac    | arch/arm/                 | 2
>    cdns,emac               | arch/arm/                 | 2
>    cdns,zynqmp-gem         | *same as xlnx,zynqmp-gem* | 0
>    cdns,zynq-gem           | *same as xlnx,zynq-gem*   | 2
>    sifive,fu540-c000-gem   | arch/riscv/               | 2
>    microchip,mpfs-macb     | arch/riscv/               | 2
>    microchip,sama7g5-gem   | arch/arm/                 | 2
>    microchip,sama7g5-emac  | arch/arm/                 | 2
>    xlnx,zynqmp-gem         | arch/arm64/               | 0
>    xlnx,zynq-gem           | arch/arm/                 | 2
>    xlnx,versal-gem         | NULL                      | NET_IP_ALIGN

I don't remember seeing any other driver doing anything like
this. That often means it is wrong....

      Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
