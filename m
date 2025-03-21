Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C69C36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 20:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6o4tn0wZxl1T/1NurXJ0wwli/lahvja3WLjA+gSi1rE=; b=Nm6DJTJ8HNFzzo
	pvIKuY+RHGj/t892BU3kE7GVKzTrA4wK3k6kc5KnzB4MotSewjd/dpVC07ArpApTxF0xwT3mR59iD
	jE7rK2x9L8qMCj/FL0FAbsO/rod/DxypZf3byosTmK9H77vVbkc58R13Scsm44f1QANIz8VjZtdJB
	+aN2SRX8TuORRog3wYCVXkgMIZSgm/2B8Ne51LIinrmyK0Qxy15Z+DYV+bC2h45WxCztcbO2Xo4hB
	ymEfjJf7GOBlll/W2OSsBIq1b6/RKa9D0gGAdB2YNoOpNaglMGez22S1KcNCPR7uizF9ghh6WfG9k
	3EKZMNLD86Jev2VF0CRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjJf-0000000GFPO-0Fb1;
	Fri, 21 Mar 2025 20:50:07 +0000
Received: from [156.67.10.101] (helo=vps0.lunn.ch)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjJb-0000000GFMP-4AYK
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 20:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yFzOysCPLuMjK3qzNNnYKx7eqzyb8A3svd4W9fSzPuQ=; b=TGFtRI8spN1abBT9KlSGFueqQh
	6/YP2EDo6BjswLesT6nGpeMQ9l84PUNmOlDHSQO43O70iL0m5u383PDralyj13qYDcr5D7CjO2NAZ
	RltzmllqpVOG9toqHbT8+tzjdJcPirCbfOYaqh9GGwj5dM49R26FCx00XWpFfKRnRsoQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tvjJA-006eT6-Hj; Fri, 21 Mar 2025 21:49:36 +0100
Date: Fri, 21 Mar 2025 21:49:36 +0100
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
Subject: Re: [PATCH net-next 01/13] dt-bindings: net: cdns,macb: add Mobileye
 EyeQ5 ethernet interface
Message-ID: <2dbbd6c0-84d0-4846-a48d-31891f395c7c@lunn.ch>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-1-537b7e37971d@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321-macb-v1-1-537b7e37971d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_135004_031364_199F21C5 
X-CRM114-Status: UNSURE (   4.52  )
X-CRM114-Notice: Please train this message.
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

>            - atmel,sama5d2-gem         # GEM IP (10/100) on Atmel sama5d2 SoCs
>            - atmel,sama5d3-gem         # Gigabit IP on Atmel sama5d3 SoCs
>            - atmel,sama5d4-gem         # GEM IP (10/100) on Atmel sama5d4 SoCs
> +          - mobileye,eyeq5-gem        # Mobileye EyeQ5 SoCs
>            - cdns,np4-macb             # NP4 SoC devices
>            - microchip,sama7g5-emac    # Microchip SAMA7G5 ethernet interface
>            - microchip,sama7g5-gem     # Microchip SAMA7G5 gigabit ethernet interface

These are kind of sorted. Maybe put mobileye after microchip?

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
