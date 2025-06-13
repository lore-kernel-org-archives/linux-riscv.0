Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632DEC71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4dPzoOGRQy539VZ8eYTRuC7iHZT/9vuIP+OUxTMP3jo=; b=oezd7KWI0RRzYF
	k9nkv7XcMskgQRkzJ4kCfbIpgnoPpHWqN4HOlzoYZoCjruA0V6kBwqDM0vo9Jo8W2XjIhKphmTuRG
	JuOfowDXUy4PrE6kZG1kUmksbCwPxaEXRrVvjNshAJ/0AYYAGjMFalsrujvEsg9TopdHX7nHoradN
	PoTD3wC2ptRqQKiVEYSezB0lUFi13+geoprAVVDuMdfxw49uCZYC69t9lsbXT0xYvBblvRQSkeVUR
	tNYCZphdE+5oKLe9GYbqjKfZ2wIkaJY0uNbekgYZnmdWeDVBMyN9LY20XybXiC4bx63grhF8AnMoY
	SDtUDR24wJsWPfIn1PgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6VE-0000000GuCg-3ros;
	Fri, 13 Jun 2025 15:39:36 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4Md-0000000GU0v-27lI
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 13:22:36 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A915E3422ED;
	Fri, 13 Jun 2025 13:22:33 +0000 (UTC)
Date: Fri, 13 Jun 2025 13:22:27 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Vivian Wang <uwu@dram.page>
Cc: Guodong Xu <guodong@riscstar.com>, vkoul@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, drew@pdp7.com,
	emil.renner.berthing@canonical.com, inochiama@gmail.com,
	geert+renesas@glider.be, tglx@linutronix.de,
	hal.feng@starfivetech.com, joel@jms.id.au, duje.mihanovic@skole.hr,
	Ze Huang <huangze@whut.edu.cn>, elder@riscstar.com,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 5/8] riscv: dts: spacemit: Add dma bus and PDMA node for
 K1 SoC
Message-ID: <20250613132227-GYB135173@gentoo>
References: <20250611125723.181711-1-guodong@riscstar.com>
 <20250611125723.181711-6-guodong@riscstar.com>
 <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_062235_569791_2005FEA0 
X-CRM114-Status: GOOD (  17.01  )
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

Hi Vivian, Guodong,

On 11:06 Fri 13 Jun     , Vivian Wang wrote:
> Hi Guodong,
> 
> On 6/11/25 20:57, Guodong Xu wrote:
> > <snip>
> >
> > -			status = "disabled";
> > +		dma_bus: bus@4 {
> > +			compatible = "simple-bus";
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> > +				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
> > +			ranges;
> >  		};
> 
> Can the addition of dma_bus and movement of nodes under it be extracted
> into a separate patch, and ideally, taken up by Yixun Lan without going
> through dmaengine? Not specifically "dram_range4", but all of these
> translations affects many devices on the SoC, including ethernet and
> USB3. See:
Right, we've had an offline discussion, and agreed on this - have *bus
patches separated and let other patches depend on it.

But seems Guodong failed to do this or just sent out an old version
of the PDMA patch?

> 
> https://lore.kernel.org/all/20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn/
> https://lore.kernel.org/all/20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn/
> 
> (I haven't put eth{0,1} under dma_bus5 because in 6.16-rc1 there is
> none, but ideally we should fix this.)
> 
> DMA address translation does not depend on PDMA. It would be best if we
> get all the possible dma-ranges buses handled in one place, instead of
> everyone moving nodes around.
> 
I agree

> @Ze Huang: This affects your "MBUS" changes as well. Please take a look,
> thanks.
> 
> >  
> >  		gpio: gpio@d4019000 {
> > @@ -792,3 +693,124 @@ pwm19: pwm@d4022c00 {
> >  		};
> >  	};
> >  };
> > +
> > +&dma_bus {
> >
> > <snip>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
