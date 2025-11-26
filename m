Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75376D10F5D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uz+0LWqpF1tFqRWVzxe4bYc3k1R66G0JYnH2HDaIkuU=; b=ybD08fm42WCf1j
	xk6Vvdrh2x+qgDp+0aJ3PgYBBfT377aoZQJWEGi/hPLPoN0JNH1iLHBuGb36VzLMAgD1wQdasGk10
	Zwq0eyX2iOZ/jgD7AYHU2zKXemyfGFkF+zuWRGN/JSHqUr9lEoTb0m3F5LEsKhSzUpm3mumhR9+UU
	p7pgR5aX5VE6oVfxo5Pw+SvX71rq/+BHguOgWfG0JliwZ7PeK8FelltbYaz3eQTmbN0T72d96mkuV
	NsL/RKJgfvsa54X89xzA1UEmkZb/8M/sGa5H4GfgxZ/cYZ9pOX6bmlBIsmLzUKYkATDaAhv10oJTW
	YnjtYANTfn2KQsDML0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGfw-0000000F7UC-1uIE;
	Wed, 26 Nov 2025 14:39:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGfv-0000000F7Tr-2BCm
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 14:39:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BE86601E0;
	Wed, 26 Nov 2025 14:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85AFC116C6;
	Wed, 26 Nov 2025 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764167958;
	bh=nF7QOjL2tZfYPd115SN2AbpXYN+ynEk7LVbGs6fObcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjSFI0mcgThDQuF2A2LehUyl/MZp8hUHlBHrfmMOnIbYjZj6Ta8Sgfb3VQs/Bue9d
	 rtpxE4W6QRebr8vuBh+UJONFnDv/n/METct1yOQxn6d9Y87Az2/Xrcs1H3tw6Ie085
	 V/69DscxIyqvhcwudiGfZE0AvIp35yIhToeSyiM5axi7McwA2t+RnLLBGIZmWxeeGJ
	 qQq+2YhfGtwRiG3HndafWCDLz+q/eW726k/ZscqbpHzG2i7Rh5FuRgOuykUbsikNwT
	 ViBy88RfI5b0sncXOwko2QoeiB9p3obyd20100jjb5FhlSfIEw1YQ32+l3JekP1OU3
	 jhnq1cIrfksJA==
Date: Wed, 26 Nov 2025 08:39:11 -0600
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 2/7] clk: thead: th1520-ap: Poll for PLL lock and wait
 for stability
Message-ID: <aScRD64dGZGxndNL@gen8>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-3-ziyao@disroot.org>
 <aSTXQG5yIIGFjflG@x1>
 <aSUgQpd16Ud8xTx6@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSUgQpd16Ud8xTx6@pie>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 25, 2025 at 03:19:30AM +0000, Yao Zi wrote:
> On Mon, Nov 24, 2025 at 02:08:00PM -0800, Drew Fustini wrote:
> > On Thu, Nov 20, 2025 at 01:14:11PM +0000, Yao Zi wrote:
> > > All PLLs found on TH1520 SoC take 21250ns at maximum to lock, and their
> > > lock status is indicated by register PLL_STS (offset 0x80 inside AP
> > > clock controller). We should poll the register to ensure the PLL
> > > actually locks after enabling it.
> > > 
> > > Furthermore, a 30us delay is added after enabling the PLL, after which
> > > the PLL could be considered stable as stated by vendor clock code.
> > > 
> > > Fixes: 56a48c1833aa ("clk: thead: add support for enabling/disabling PLLs")
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > ---
> > >  drivers/clk/thead/clk-th1520-ap.c | 34 +++++++++++++++++++++++++++++--
> > >  1 file changed, 32 insertions(+), 2 deletions(-)
> > 
> > Thanks for working on this patch series.
> > 
> > [...]
> > > @@ -299,9 +310,21 @@ static void ccu_pll_disable(struct clk_hw *hw)
> > >  static int ccu_pll_enable(struct clk_hw *hw)
> > >  {
> > >  	struct ccu_pll *pll = hw_to_ccu_pll(hw);
> > > +	u32 reg;
> > > +	int ret;
> > >  
> > > -	return regmap_clear_bits(pll->common.map, pll->common.cfg1,
> > > -				 TH1520_PLL_VCO_RST);
> > > +	regmap_clear_bits(pll->common.map, pll->common.cfg1,
> > > +			  TH1520_PLL_VCO_RST);
> > > +
> > > +	ret = regmap_read_poll_timeout_atomic(pll->common.map, TH1520_PLL_STS,
> > > +					      reg, reg & pll->lock_sts_mask,
> > > +					      5, TH1520_PLL_LOCK_TIMEOUT_US);
> > 
> > Is there a reason for the specific value of 5 uS polling delay?
> 
> No, it was picked randomly. A smaller value would reduce latency of
> PLL enabling, and I could tune it more carefully by some testing. But
> it's hard to predict how much improvement it will bring.

Okay, I was just curious. I think it is okay to stick with that current
value if it is working correctly.

> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	udelay(TH1520_PLL_STABLE_DELAY_US);
> > 
> > Is it the case that the 30 uS delay after the lock bit is set is just so
> > that it has the same behavior as the vendor's code? Or did you notice
> > stability problems without this?
> 
> This aligns with the vendor code, and I haven't yet observed stability
> issues without the delay. But I think it's more safe to keep the
> behavior similar since it's hard to test all working conditions.

Okay, that seems reasonable to play it safe.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
