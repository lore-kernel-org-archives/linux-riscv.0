Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E023C55ABF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpfsdmlO5zqZ/eewEOd4S3JGpmBIKlBz30qPEus42iw=; b=johePSQ6AzXHjh
	bGsjMyM0/DEbYdFhnV/ewUvGlRvvwlPtCrxleOJJxLDgbFp2Yo+mZqFqySMZQu8DzDgN2h0g1aWgF
	lRcAYYoxAWxGiFFIKuWQ6WgqZdCYqAVBpLfy9uKLUwt69S2rq7jh/a0DgzcaiKfoXjACZ6819/7gs
	8LoB4kqiFdQvKwrGeRr3C4jjQYj3GrlXpuBs8SiYFPGDLop8zvJalcTftHYvmpBE84VlGOVBxJVtt
	dtCEtMSNT2VYr0Ti5SgLWWiOjJDNr0lyK/arzWZp5laIlym4TXr4PqQz9u313W7ldCnaSj6cVZMe+
	lv5L8JPBMVHjHClc+7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQKN-0000000EWgv-2deS;
	Fri, 20 Feb 2026 13:13:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQKK-0000000EWga-0eEQ
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 13:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=63PZ5ikUAAIUS3H+LncoEFZzYKIrjKtt3if4XIt6msc=; b=0CuWvvNpbCYIP7ytGRFlaGjNy9
	7Li+Do5DI9p9LJ1rh9vWN7+ON6VDwnZ8sV6WUOk2CQ1jgRULJlNFRmLgtQxcJVHUXY0LGqU9+u3oo
	/0tEbSMWJ+xOaBkGWDBhHukhLN2/awYRgH+eDEl6t8hYK5DjyOiBqBcpClVQQYEZkp9Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtQK5-0084O8-IN; Fri, 20 Feb 2026 14:13:33 +0100
Date: Fri, 20 Feb 2026 14:13:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Max Hsu <max.hsu@sifive.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 3/5] net: macb: Add support for SiFive FU740-C000
Message-ID: <45821cd4-214c-43c0-ab2d-bbf34d9ec911@lunn.ch>
References: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
 <20260220-fu740-v1-3-c8af54130c58@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260220-fu740-v1-3-c8af54130c58@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_051349_877262_A2720C34 
X-CRM114-Status: UNSURE (   8.01  )
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

On Fri, Feb 20, 2026 at 04:27:07PM +0800, Max Hsu wrote:
> Add a distinct configuration for the SiFive FU740-C000 ethernet
> controller to comply with the SiFive IP versioning guidelines.

We are in the merge window at the moment, so net-next is closed.

As requested, please reword the commit messages to replace the SiFive
guidelines with the generic DT guidelines. And repost when net-next
reopens.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

The Subject line also needs to indicate which tree this is for.

    Andrew

---
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
