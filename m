Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B154AC61DBD
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 02:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+guPjHorPXFsywNBSf8zOIVLbuJKgJ+G813yEPFdfI=; b=iY6Zaxpkj5iIgH
	Lh0nb3oqtfVHF0U7z18CQd77oAJQ+UnpItoXnkezmMwMHd9stKWjqrJwkcP3aTqkUUAw2xgmqo8BH
	e8sc+paOWcTSBOHy/d0lmew2GuHs45sVF8NHt2a0Y7mXk1Ie81iSwSJZeSGr1SqydnTZj1emoqIIx
	ZTdShb3OcIwFTI7bJHdpojgG2l6uEbLaS18a9URvIMyIXPwiFw0cExoOlDq2z6v2+V5wLBh1C6aRg
	6ZuV/Ad7sBf3CzodkJ6jfJCyCg6HdDjZRxpA9+c8uyiA89yef1u08akM2mLMAJZw0d/PrYrxlay3D
	1/c8IdfKGpfvwO3TP04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQ8K-00000003K1a-0tE6;
	Thu, 27 Aug 2026 02:46:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQ8H-00000003K0t-3Tg1
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 02:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=04LV//Qqu8AJccIRCStGRzmejSwdi5G60bO+SIOXoKQ=; b=amLerCpJ/Smpy9mCR2c6EZPLHv
	8uYNlnRnUKBmnI/Ik/B6ExblrZ0E0hP0t5flRLXUxlTF+bCL+0zEb7IaU7FHed2bHZoyz+yMLx5pW
	CubhHcNuReLflxAQkihRVcoCssPUMZXohqnEYx3yVGuyPYmb/jXd+dpuk9HAujgNRRX0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wzQ7t-001arp-R8; Thu, 27 Aug 2026 04:46:01 +0200
Date: Thu, 27 Aug 2026 04:46:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 11/12] riscv: dts: ultrarisc: Add Shenzhen Rongda M0
 board device tree
Message-ID: <db174bcd-3b21-464f-ab56-439d65e2a064@lunn.ch>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-11-61ab7aebe9e5@ultrarisc.com>
 <d93868e7-00c7-4251-9b23-8b3ed0535185@lunn.ch>
 <178779718359.1423015.16616466921659081322.b4-reply@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178779718359.1423015.16616466921659081322.b4-reply@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_194625_868044_1F347841 
X-CRM114-Status: GOOD (  20.73  )
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

On Thu, Aug 27, 2026 at 10:19:43AM +0800, Jia Wang wrote:
> On 2026-08-24 15:02 +0200, Andrew Lunn wrote:
> > > +&ethernet {
> > > +	phy-handle = <&phy0>;
> > > +	/*
> > > +	 * YT8531 RGMII timing on this board requires no PHY internal delays.
> > 
> > Please extend this sentence with an explanation why it needs no delay?
> > 
> > There are times this is correct, but it is also mostly wrong. Without
> > an explanation, i cannot say if this is correct or not.
> > 
> 
> Thanks for the review.
> 
> The DP1000 SoC integration provides the required TX and RX RGMII clock
> skew, so enabling the YT8531 internal delays would apply the delay twice.

Please take a read of

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

You need to make the MAC driver do the correct thing:

# There are a small number of cases where the MAC has hard coded
# delays which cannot be disabled. The 'phy-mode' only describes the
# PCB.  The inability to disable the delays in the MAC does not change
# the meaning of 'phy-mode'. It does however mean that a 'phy-mode' of
# 'rgmii' is now invalid, it cannot be supported, since both the PCB
# and the MAC and PHY adding delays cannot result in a functional
# link. Thus the MAC should report a fatal error for any modes which
# cannot be supported. When the MAC implements the delay, it must
# ensure that the PHY does not also implement the same delay. So it
# must modify the phy-mode it passes to the PHY, removing the delay it
# has added. Failure to remove the delay will result in a
# non-functioning link.

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
