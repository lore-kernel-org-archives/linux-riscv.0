Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD39C678D4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 14:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myHqDpxPrQS+tyMQzzWyHjeRymM1BZYFQBcvXVSKGNo=; b=DX3N6BL28JRrVh
	Qx/FUs+6kHvphDvBzNHg6S7dtrDkcbXvuc4gIWBZThTu0R2BbUu63Gp88m+39Yt2D5C/PFl+Z5a8S
	Eg3tZtmj34PCnQGsIlsQ4QZLqppn638BZTtoLeurHE8uupO8OfQAe42qZ+sQMyjiXaWR0CtSJ1nlb
	1kkyrkXm6PfueH9frH4D/MVVGOu3PoM1xdz+j9bJORvFRJAY6U+iZoOCw49dHmuELzBm04g2JfE2K
	MKpyFimkDGaHgAD1z9/wzsZA8AQ4kc4jt/2usNz7etoTZCxBT6XmuQmwng3zGXhqEQjdAawuYrDNE
	AVbsMCmOzmfAwevoJKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBef-00DA1w-7p; Mon, 06 Mar 2023 14:17:33 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAXs-00CoCd-Od
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 13:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FQqcuORaXLfMiKxDrJIZ8q68OPExEvTNfqCIywjvNAs=; b=T3EsYv0/u6FJJLnFYiWK90J/eP
	t4hbyBL5ORJv/DSLRiTTqkkGS1gf/Qu/O9gATSBVksRA+tPgjTB/UVzBC0oE8wGAprl2JoWgtnb77
	8dl32tz7yYUErAxgYRpbHlq//h2HkALXTjx5EeDjJQbJJF/ZxAsYkshyf95tl4Oh3XSY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pZAXk-006Z5s-Pg; Mon, 06 Mar 2023 14:06:20 +0100
Date: Mon, 6 Mar 2023 14:06:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Guo Samin <samin.guo@starfivetech.com>, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: Re: [PATCH v5 08/12] net: stmmac: starfive_dmac: Add phy interface
 settings
Message-ID: <52822ce5-0712-48e5-81e0-c6ac09d6a6ee@lunn.ch>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-9-samin.guo@starfivetech.com>
 <CAJM55Z-3CCY8xx81Qr9UqSSQ+gOer3XXJzOvnAe7yyESk23pQw@mail.gmail.com>
 <bc79afab-17d1-8789-3325-8e6d62123dce@starfivetech.com>
 <CAJM55Z8zYUQc33r9tJB1du-FSp+uDf40720taMuGTuPcPU+aZg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z8zYUQc33r9tJB1du-FSp+uDf40720taMuGTuPcPU+aZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_050628_816770_B43D34DA 
X-CRM114-Status: UNSURE (   9.67  )
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

> Ugh, you're right. Both the syscon block, the register offset and the
> bit position in those registers are different from gmac0 to gmac1, and
> since we need a phandle to the syscon block anyway passing those two
> other parameters as arguments is probably the nicest solution. For the
> next version I'd change the 2nd argument from mask to the bit position
> though. It seems the field is always 3 bits wide and this makes it a
> little clearer that we're not just putting register values in the
> device tree.

I prefer bit position over mask.

But please fully document this in the device tree. This is something a
board developer is going to get wrong, because they assume MAC blocks
are identical, and normally need identical configuration.

I assume this is also a hardware 'bug', and the next generation of the
silicon will have this fixed? So this will go away?

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
