Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87195C636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 22:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcRv8vLoH0edR9gI7WpUbNKzmzax0JFo5Gne93JtthA=; b=UKETlG/ROWPEDI
	eiLq04D3X8sRNWiqLjlkVTP3KklFVttfxZg6H8Q+Q/GuOd+tnuK/0oxyoaLzO+eSpwvRZnXAjz0RI
	9vmf8Ek+mOVr2YSlKCC/6s5zyGIqUft45CTYGOKxp3GR0XIAOd64u+IS9h2WIgsDiKu/hgqc8zZTX
	aNiIlEcIq/X6q2jHAyDa4L+Ndsuol+lIOCaK9UVj2wxqZVFV00jXI5pqUT9uNaCRbGJ96GLbZMGZp
	3iYcFEh8TiyAb+RxMnHZbZJZJox65yDHTQL88aQbPOXxhu5Dw4YJWc2nTFF84pcZPfQV5KSTftDqp
	3BGrUUdi2ZtyrHeO5kNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUawt-009xKZ-Ma; Tue, 21 Feb 2023 22:17:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUawr-009xJv-0j
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 22:17:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58733611E3;
	Tue, 21 Feb 2023 22:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDBFC433EF;
	Tue, 21 Feb 2023 22:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677017839;
	bh=bs1akhKjv3J4NmgD6apUPLidQ9TEW782FUgeyLThyxA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=C+6QWIYGa1uLXRUxWQg7WY9brhFOOPrRR8c9ih5Y6tzBubrze2OOYnpKlCp45vK4d
	 kFhnNQqNod0heMGMtlamwIfY1Q33DssADqtXcAOYAc/O7iyaaRmwZIb/Fxvi0utuy1
	 DkE2dL29TGy9GA80R9+GfHrQNeviPT8NQBNYrh1iWissJtOgff5AMtLpGsUl/sXZch
	 HRJz51hvEv0wqVF+gTuD/lrmw/z/eCLzNLt7BFxJD5r5TncYdKrgfNG2tyi2Re2SIz
	 ytkMmDBiJx62wHzB6DFj6r0ptT+huSMbu370vRq6dqKcZadSpCVaD/ChCte0A4ivVE
	 4tuolzr56XuJw==
Message-ID: <72953dc9371b87da8d03c63633d7d9dd.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <Y+5z8skN2DuvxDEL@spud>
References: <20221220005054.34518-1-hal.feng@starfivetech.com> <20221220005054.34518-8-hal.feng@starfivetech.com> <Y6JB37Pd5TZoGMy4@spud> <7a7bccb1-4d47-3d32-36e6-4aab7b5b8dad@starfivetech.com> <Y6tSWB2+98a8k9Qw@spud> <5cf0fe71-fd17-fb28-c01e-28356081ba76@starfivetech.com> <Y+5z8skN2DuvxDEL@spud>
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system clock and reset generator
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, Hal Feng <hal.feng@starfivetech.com>
Date: Tue, 21 Feb 2023 14:17:17 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_141721_156843_6827D163 
X-CRM114-Status: GOOD (  31.42  )
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

Quoting Conor Dooley (2023-02-16 10:20:34)
> Hey Hal!
> 
> On Thu, Feb 16, 2023 at 10:42:20PM +0800, Hal Feng wrote:
> > On Tue, 27 Dec 2022 20:15:20 +0000, Conor Dooley wrote:
> > > On Mon, Dec 26, 2022 at 12:26:32AM +0800, Hal Feng wrote:
> > >> On Tue, 20 Dec 2022 23:14:39 +0000, Conor Dooley wrote:
> > >> > On Tue, Dec 20, 2022 at 08:50:50AM +0800, Hal Feng wrote:
> > >> > > From: Emil Renner Berthing <kernel@esmil.dk>
> > >> > > 
> > >> > > Add bindings for the system clock and reset generator (SYSCRG) on the
> > >> > > JH7110 RISC-V SoC by StarFive Ltd.
> > >> > > 
> > >> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > >> > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > > 
> > >> > > +  clocks:
> > >> > > +    items:
> > >> > > +      - description: Main Oscillator (24 MHz)
> > >> > > +      - description: GMAC1 RMII reference
> > >> > > +      - description: GMAC1 RGMII RX
> > >> > > +      - description: External I2S TX bit clock
> > >> > > +      - description: External I2S TX left/right channel clock
> > >> > > +      - description: External I2S RX bit clock
> > >> > > +      - description: External I2S RX left/right channel clock
> > >> > > +      - description: External TDM clock
> > >> > > +      - description: External audio master clock
> > >> > 
> > >> > So, from peeking at the clock driver & the dt - it looks like a bunch of
> > >> > these are not actually required?
> > >> 
> > >> These clocks are used as root clocks or optional parent clocks in clock tree.
> > >> Some of them are optional, but they are required if we want to describe the
> > >> complete clock tree of JH7110 SoC.
> > > 
> > > Perhaps I have a misunderstand of what required means. To me, required
> > > means "you must provide this clock for the SoC to operate in all
> > > configurations".
> > > Optional therefore would be for things that are needed only for some
> > > configurations and may be omitted if not required.
> > > 
> > > From your comment below, boards with a JH7110 may choose not to populate
> > > both external clock inputs to a mux. In that case, "dummy" clocks should
> > > not have to be provided in the DT of such boards to satisfy this binding
> > > which seems wrong to me..

I agree. We don't want there to be "dummy" clks in DT. It should never
be required.

> > 
> > Please see the picture of these external clocks in clock tree.
> > 
> > # mount -t debugfs none /mnt
> > # cat /mnt/clk/clk_summary
> >                                  enable  prepare  protect                                duty  hardware
> >    clock                          count    count    count        rate   accuracy phase  cycle    enable
> > -------------------------------------------------------------------------------------------------------
> >  *mclk_ext*                             0        0        0    12288000          0     0  50000         Y
> >  *tdm_ext*                              0        0        0    49152000          0     0  50000         Y
> >  *i2srx_lrck_ext*                       0        0        0      192000          0     0  50000         Y
> >  *i2srx_bclk_ext*                       0        0        0    12288000          0     0  50000         Y
> >  *i2stx_lrck_ext*                       0        0        0      192000          0     0  50000         Y
> >  *i2stx_bclk_ext*                       0        0        0    12288000          0     0  50000         Y
> >  *gmac1_rgmii_rxin*                     0        0        0   125000000          0     0  50000         Y
> >     gmac1_rx                          0        0        0   125000000          0     0  50000         Y
> >        gmac1_rx_inv                   0        0        0   125000000          0   180  50000         Y
> >  *gmac1_rmii_refin*                     0        0        0    50000000          0     0  50000         Y
> >     gmac1_rmii_rtx                    0        0        0    50000000          0     0  50000         Y
> >        gmac1_tx                       0        0        0    50000000          0     0  50000         N
> >           gmac1_tx_inv                0        0        0    50000000          0   180  50000         Y
> >  *osc*                                  4        4        0    24000000          0     0  50000         Y
> >     apb_func                          0        0        0    24000000          0     0  50000         Y
> >  ...
> > 
> > The clock "gmac1_rgmii_rxin" and the clock "gmac1_rmii_refin" are
> > actually used as the parent of other clocks.
> 
> > The "dummy" clocks
> > you said are all internal clocks.
> 
> No, what I meant by "dummy" clocks is that if you make clocks "required"
> in the binding that are not needed by the hardware for operation a
> customer of yours might have to add "dummy" clocks to their devicetree
> to pass dtbs_check.

They can set the phandle specifier to '<0>' to fill in the required
property when there isn't anything there. If this is inside an SoC, it
is always connected because silicon can't change after it is made
(unless this is an FPGA). Therefore, any and all input clocks should be
listed as required. If the clk controller has inputs that are
pads/balls/pins on the SoC then they can be optional if a valid design
can leave those pins not connected.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
