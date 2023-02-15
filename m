Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC94C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 13:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSDz4xPMLmTKu9haehWx6RA0uXNsby8iznCSt8TL0q4=; b=GcmvPFFlNBe57l
	aOQDL3bknnVjWgetE1nzKsBgdiGHShw05RaDNAhWV+zKkh5cdOwEjmKiVYlxv93stA5cuAiNfQ1w3
	rwq60Ara4XBqqURcy4LXTQqRP6nwpIU6SvVyqC75VeUhCrxiOL8hpxaf1IspEgIuvXZGPB/Vyrw7Y
	vJsn/25ItNoUMsm5gdGhrpPmP7hCIOQ48a+BwbOBMwTygfxYVfrCGG13YdBWz4x/+Eqqjp0IEARM2
	buF1OcsZ6XsEeBzhFpLOH0EpugXnXDMEZnLvZ98A3uvrCo9JrXbwh9Wx2sMxSF4xOIq8bSBpNhFoC
	rKREFmXHdCpy3JHtpsYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHQS-005u0R-T6; Wed, 15 Feb 2023 13:02:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHQQ-005tzd-RV; Wed, 15 Feb 2023 13:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eRF7KZGWyAp2wUobvfy12AosGt3ryJM8iRWImzBIITg=; b=cS94lxxHZcrUCuuGzYJ4htZ3/i
	LRXjsPFxOuWozRskJ5HLCWJMzSKKOAjWg8iAvoZlC9ErfbMrfsXA5UG2gU5cXJFIL7nnAMSYZR1mq
	/bayB1PBehfeF237Nz6izZaVXSiuxAmvC5rci4ueLCEv9o6iji+GV2N+YbLdwQSBrccY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pSHPz-0053H4-FB; Wed, 15 Feb 2023 14:01:51 +0100
Date: Wed, 15 Feb 2023 14:01:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 07/12] dt-bindings: net: Add StarFive JH7100 SoC
Message-ID: <Y+zXv90rGfQupjPP@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
 <Y+e74UIV/Td91lKB@lunn.ch>
 <586971af-2d78-456d-a605-6c7b2aefda91@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <586971af-2d78-456d-a605-6c7b2aefda91@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_050218_908312_6BD8B167 
X-CRM114-Status: GOOD (  21.74  )
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

On Wed, Feb 15, 2023 at 02:34:23AM +0200, Cristian Ciocaltea wrote:
> On 2/11/23 18:01, Andrew Lunn wrote:
> > > +  starfive,gtxclk-dlychain:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: GTX clock delay chain setting
> > 
> > Please could you add more details to this. Is this controlling the
> > RGMII delays? 0ns or 2ns?
> 
> This is what gets written to JH7100_SYSMAIN_REGISTER49 and it's currently
> set to 4 in patch 12/12. As already mentioned, I don't have the register
> information in the datasheet, but I'll update this as soon as we get some
> details.

I have seen what happens to this value, but i have no idea what it
actually means. And without knowing what it means, i cannot say if it
is being used correctly or not. And it could be related to the next
part of my comment...

> 
> > > +    gmac: ethernet@10020000 {
> > > +      compatible = "starfive,jh7100-dwmac", "snps,dwmac";
> > > +      reg = <0x0 0x10020000 0x0 0x10000>;
> > > +      clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
> > > +               <&clkgen JH7100_CLK_GMAC_AHB>,
> > > +               <&clkgen JH7100_CLK_GMAC_PTP_REF>,
> > > +               <&clkgen JH7100_CLK_GMAC_GTX>,
> > > +               <&clkgen JH7100_CLK_GMAC_TX_INV>;
> > > +      clock-names = "stmmaceth", "pclk", "ptp_ref", "gtxc", "tx";
> > > +      resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
> > > +      reset-names = "ahb";
> > > +      interrupts = <6>, <7>;
> > > +      interrupt-names = "macirq", "eth_wake_irq";
> > > +      max-frame-size = <9000>;
> > > +      phy-mode = "rgmii-txid";
> > 
> > This is unusual. Does your board have a really long RX clock line to
> > insert the 2ns delay needed on the RX side?
> 
> Just tested with "rgmii" and didn't notice any issues. If I'm not missing
> anything, I'll do the change in the next revision.

rgmii-id is generally the value to be used. That indicates the board
needs 2ns delays adding by something, either the MAC or the PHY. And
then i always recommend the MAC driver does nothing, pass the value to
the PHY and let the PHY add the delays.

So try both rgmii and rgmii-id and do a lot of bi directional
transfers. Then look at the reported ethernet frame check sum error
counts, both local and the link peer. I would expect one setting gives
you lots of errors, and the other works much better.

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
