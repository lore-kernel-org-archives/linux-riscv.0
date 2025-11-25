Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFF6CFD373
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 03:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tC4SnhtD6iajJvVrQ9FhMCWkqEC2zaswd3L4jU2ZNv4=; b=NavmrL+ZUa5sjg
	GEzlLj4QDcqxHMMnTFOcip+aI6AoOzE47LiWEMUxfXeaWii11YO5BKx+ca4kHpWRA+taEGU2HGy7o
	1gYLQ21Jvab8LN4En9L7IAjQ8HbTo8MKffKDBHxI5kp2lat74HmdQZajg67uF9kBEPCutoXxasxW0
	P+HpeCcNDK5yLL0kGqN/2XqTysXHFVLVLAjnDCMgtOA8xdvCTOXhYCXSflj34AfHNavjHf3G7ScQo
	fQDVV1Yf6zeanDNzvg8/NieKX3FUr8VueXTORCGXzzi2kZ7fb4N3PaKHIDy2PcfmODVdTjplvTrrF
	0zVU3yW4JyptAUm6XxdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNjbL-0000000CfTx-1z7M;
	Tue, 25 Nov 2025 03:20:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNjbK-0000000CfTW-0A5h
	for linux-riscv@bombadil.infradead.org;
	Tue, 25 Nov 2025 03:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0VBK8txUhXX972cBX82FbbqZE4dgLNKqqPbcfo9F7T4=; b=Aehh38qL0cmACQmShhthF6X/jh
	mslz1pNi31Wp/pjNrZ5S83u8wXViR1P8B7pQePIGrNAFGAf4+p2Ku9uYkS1kpC4pXmeVyD0cAnSUp
	xcIXs4Xid0IbDbtdUOHrkyD8TURaNNwWPpx3jPNVPcGBMLal7UwlhWBCT2XJsqJuAv+fNFX3QO8Qt
	m5EVogAOEz1/OIAjOJumxVjEu+zG9ITFw4/OXHazYPYbGYLlSFVHcFyEybL3lb7h9m9gpht5g6g95
	ZPPkE/kLrUCPx3KjuAOojdkKKKmBEcSz4XvM8B9R3JRHEtixt6gS0yTGQONarxJqWhMo6SMZCKUXn
	53J3lIBA==;
Received: from layka.disroot.org ([178.21.23.139])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNjbG-00000007vlQ-2RTa
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 03:20:20 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 28E9F25FF5;
	Tue, 25 Nov 2025 04:19:51 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FikJKz6zNPqU; Tue, 25 Nov 2025 04:19:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1764040790; bh=JR+sp99N2EqcRAaGQJ7HVli1aoDpzWzkW455mFGvkwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wht6FJHgmMPiddXI45FDaC6u6fM/uyw78Q4mHk13u5YB1X3qk9qjELN246jfQghI4
	 b1zLTfmim+dXFMyzeV6DbyCdleZpy40EQ+qsYu+FVBi7hLp9pyhCDSY7Z9vIoJwQoZ
	 PIzEQQyijaPTtRnpjJVxVY2qkD49MgFWcOFp4fApXx8pNXg71joxBLBHMKNhEHgzS7
	 uaG4DAmImlNjif1Hgs5jDKQuMIsK6LSeEEHXT5ulxwVclr2Ty7JuztZoHk0WUpGxUl
	 xOVFLcj66ulL65EAaffKdawSHOUnJmKpFeACOQqYyPxVnlYCHGcW0iLw9cJJw60DN5
	 +yao+mexO2oYQ==
Date: Tue, 25 Nov 2025 03:19:30 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH 2/7] clk: thead: th1520-ap: Poll for PLL lock and wait
 for stability
Message-ID: <aSUgQpd16Ud8xTx6@pie>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-3-ziyao@disroot.org>
 <aSTXQG5yIIGFjflG@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSTXQG5yIIGFjflG@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_032018_674253_10437A48 
X-CRM114-Status: GOOD (  23.83  )
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

On Mon, Nov 24, 2025 at 02:08:00PM -0800, Drew Fustini wrote:
> On Thu, Nov 20, 2025 at 01:14:11PM +0000, Yao Zi wrote:
> > All PLLs found on TH1520 SoC take 21250ns at maximum to lock, and their
> > lock status is indicated by register PLL_STS (offset 0x80 inside AP
> > clock controller). We should poll the register to ensure the PLL
> > actually locks after enabling it.
> > 
> > Furthermore, a 30us delay is added after enabling the PLL, after which
> > the PLL could be considered stable as stated by vendor clock code.
> > 
> > Fixes: 56a48c1833aa ("clk: thead: add support for enabling/disabling PLLs")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/clk/thead/clk-th1520-ap.c | 34 +++++++++++++++++++++++++++++--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> Thanks for working on this patch series.
> 
> [...]
> > @@ -299,9 +310,21 @@ static void ccu_pll_disable(struct clk_hw *hw)
> >  static int ccu_pll_enable(struct clk_hw *hw)
> >  {
> >  	struct ccu_pll *pll = hw_to_ccu_pll(hw);
> > +	u32 reg;
> > +	int ret;
> >  
> > -	return regmap_clear_bits(pll->common.map, pll->common.cfg1,
> > -				 TH1520_PLL_VCO_RST);
> > +	regmap_clear_bits(pll->common.map, pll->common.cfg1,
> > +			  TH1520_PLL_VCO_RST);
> > +
> > +	ret = regmap_read_poll_timeout_atomic(pll->common.map, TH1520_PLL_STS,
> > +					      reg, reg & pll->lock_sts_mask,
> > +					      5, TH1520_PLL_LOCK_TIMEOUT_US);
> 
> Is there a reason for the specific value of 5 uS polling delay?

No, it was picked randomly. A smaller value would reduce latency of
PLL enabling, and I could tune it more carefully by some testing. But
it's hard to predict how much improvement it will bring.

> > +	if (ret)
> > +		return ret;
> > +
> > +	udelay(TH1520_PLL_STABLE_DELAY_US);
> 
> Is it the case that the 30 uS delay after the lock bit is set is just so
> that it has the same behavior as the vendor's code? Or did you notice
> stability problems without this?

This aligns with the vendor code, and I haven't yet observed stability
issues without the delay. But I think it's more safe to keep the
behavior similar since it's hard to test all working conditions.

> Thanks,
> Drew

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
