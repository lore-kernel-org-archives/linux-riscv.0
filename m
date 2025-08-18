Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D44CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 13:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jqj8EjOw3gKeDB4v7w3ktACInnGnyrokndLzwX4dxjc=; b=IsOXVgXd9qLbbt
	Tk74HPJcwAyzxQjrXP2DR3eMlvMjTBLYxerUhJRm9qkxPCTyLF0IgwHhlvAdXYIHNb73vOK+L2y3i
	vbk6MWQZXaNZ/aN3MNQ8TRVAIqAbLF0uApI57nmgvqBpmd9IuDAj4MZdCOiV+EOCrl6fc7nWZm/qI
	58xZ4Nv7M3CWufalHPXGCvSNUsfBwxunOtUTUba2zzdRL6E/z/I9at9bKq2beBuR39tRZi9IelYTK
	x83Jf48g1NEPmp+Ap1qUX3THqCZU5h5Xtm+D9PFNvIaeudf+hx+Q286x+G+WQWtfktWk5eg0yXq5T
	VrZN1oPvcm1HpX07eWFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo098-00000007dtv-1msR;
	Mon, 18 Aug 2025 13:43:34 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unzbk-00000007PIz-3dO0
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 13:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755522486;
	bh=s8YclNR8beo4nWkkZUjnovn1goim6RIxNT6d2tnjL/s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=KTF0ZmbZZcLnmrdiokOxKonJKRDPuK3ldJN39AXjBl05dQGjorzbBYxT+Z7AUjeiu
	 CDdXKglwU0ci+Qz02k2fkW+u8nVBCITCqICJFT91NNNQuc/YFuqLUY9jMfmpT00yYE
	 NYQVrCfiuHCbPgHK6LEeL4z7ts+9I92lCXKM/x3c=
X-QQ-mid: zesmtpip2t1755522484tf2d46652
X-QQ-Originating-IP: /v1dWevNYr4qGYbGv6tjmtqkcrChCHifqsQeMmx0+5s=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Aug 2025 21:08:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14735046647836716306
EX-QQ-RecipientCnt: 16
Date: Mon, 18 Aug 2025 21:08:00 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Haylen Chu <heylenay@4d2.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v3 3/3] clk: spacemit: fix i2s clock
Message-ID: <2CB30FE47E82A003+aKMlsDlLnLqh2fC0@troy-wujie14pro-arch>
References: <20250818-k1-clk-i2s-generation-v3-0-8139b22ae709@linux.spacemit.com>
 <20250818-k1-clk-i2s-generation-v3-3-8139b22ae709@linux.spacemit.com>
 <aKL6ormE1N72fwVG@ketchup>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aKL6ormE1N72fwVG@ketchup>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N2bAIxLK0eln80JCKSJv13qkBZf4ZOHw9t6e3977sV8zdayvYp8Z3QQv
	rM2Aj17hri94+TrhvtdYQWNDE7irGpCDMlF2nhO5DfqpyvpQ4Y76QpDr3hHXH7RV+piyU9D
	PdDPMWUHqfdPNt9inkUivBKkSzJcDG2PdDZuj6JV40DafR0Dz4KBobm3wL5wYgTTdAq6Kkv
	714qePlH4J15u9zolEDFCvAVKCA222A6s8lpTOUKBJnZPgBz7xmllNjiPwcGCwrP8hnLFdM
	RIKSIbaSpBQyXprUGKXnOQKanOTDlV1wJrvfJOGnUgKWvHN/GGt7ReeX+5VZRrr4DwN73/4
	lT98bivxcvE048Ofm8SjPzRCULtku19bOjrWo4QVAzESvhOpM56PkGKos1rirvkGPnrnxgh
	koPY4z/Qr3CvzW+iQWVSs3+LHb1pak6MV8x4iONfpMVej0nelei2xe/Px5Pl7jnT6BbTpiP
	6kFiFNm446y/ap37JXPaEl52NzXKYsf6LON5zmRXc/aih09muUNUCdMkJQMogWtAgKJNhb3
	xH1sjfZELHnPmo+l8rtDNkGj6MBOHSMmiMPyD886pb4kaRNc1IB96gEvarlRurxMD3eIS7s
	occyzG3kOeVoBDXurftGwSHMh9+yPLNZekXLUa86CY7GUdBIKMDIQ01qvEAgGaj+Fg3bZxy
	WdbyLuzM4N4K5akGwlrree76qNA290eNd50mMU0wJ8R45qIoRurdBNkRDVtfW4y4wETCigu
	fN8fbDpUIvtcLGWP12OLztxprXYTMBLqjwkX2ChJ7tJCPeCSn1KtSinFx0j/6bYznZ30Bbp
	g5X3CeEilEygDSVhfscq30nA14ZXLScGWtaXHsOh6NaUxoFSLQys/vFjnipeYzMdt47PcSi
	gbxGIM27Lra8FiiFzv895WE1c0dzExxp5yBi+GaflwLkaV1w7//1vbMbFr7/GFadsPNfBp1
	HH6UvI/Fs2rvak2u8wiJmZe4esMRpKfTBcuSgxqhGtmLKkcYqsTBjcH9VVTWAjSYPf8Sn2h
	6hG1PC2aD60DDCT/dlsCflASjFcazmIkOD7dUd0koC0/5gSeVoNuD69kHEiIC1Ewk/yvFzD
	p2q53UjnbS/
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_060906_054466_FA14DA9D 
X-CRM114-Status: GOOD (  31.55  )
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

Hi Haylen,

I accept all ur suggestions and I'll send v4 ASAP.

Thanks for ur review!

                - Troy

On Mon, Aug 18, 2025 at 10:04:18AM +0000, Haylen Chu wrote:
> On Mon, Aug 18, 2025 at 05:28:22PM +0800, Troy Mitchell wrote:
> > Defining i2s_bclk and i2s_sysclk as fixed-rate clocks is insufficient
> > for real I2S use cases.
> > 
> > Moreover, the current I2S clock configuration does not work as expected
> > due to missing parent clocks.
> > 
> > This patch adds the missing parent clocks, defines i2s_sysclk as
> > a DDN clock, and i2s_bclk as a DIV clock.
> > 
> > A special note for i2s_bclk:
> > 
> > From the definition of register, The i2s_bclk is a non-linear,
> > discrete divider clock.
> 
> No, it IS linear. It just comes with a 1/2 factor according to your code
> (I'm assuming there's a typo in the table below).
> 
> > In calculus and related areas, a linear function is a function whose
> > graph is a straight line, that is, a polynomial function of degree
> > zero or one. (From Wikipedia)
> 
> > The following table shows the correspondence between index
> > and frequency division coefficients:
> > 
> > | index |  div  |
> > |-------|-------|
> > |   0   |   2   |
> > |   1   |   4   |
> > |   2   |   6   |
> > |   2   |   8   |
> 
> Index = 2 appears twice in the table. Is this a typo?
> 
> > From a software perspective, introducing i2s_bclk_factor as the
> > parent of i2s_bclk is sufficient to address the issue.
> > 
> > The I2S-related clock registers can be found here [1].
> > 
> > Link:
> > https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb
> > [1]
> > 
> > Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> > Co-developer: Jinmei Wei <weijinmei@linux.spacemit.com>
> > Suggested-by: Haylen Chu <heylenay@4d2.org>
> > Signed-off-by: Jinmei Wei <weijinmei@linux.spacemit.com>
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  drivers/clk/spacemit/ccu-k1.c    | 29 +++++++++++++++++++++++++++--
> >  drivers/clk/spacemit/ccu_mix.h   |  2 +-
> >  include/soc/spacemit/k1-syscon.h |  1 +
> >  3 files changed, 29 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> > index 7155824673fb450971439873b6b6163faf48c7e5..b2c426b629a37a9901bbced26fc55c5f1b34eba5 100644
> > --- a/drivers/clk/spacemit/ccu-k1.c
> > +++ b/drivers/clk/spacemit/ccu-k1.c
> 
> ...
> 
> > + * i2s_bclk is a non-linear discrete divider clock.
> > + * Using i2s_bclk_factor as its parent simplifies software handling
> > + * and avoids dealing with the non-linear division directly.
> > + */
> 
> And thus this comment is wrong and misleading. Suggest something like,
> 
> 	Divider of i2s_bclk always implies a 1/2 factor, which is
> 	described by i2s_bclk_factor.
> 
> > +CCU_DIV_GATE_DEFINE(i2s_bclk, CCU_PARENT_HW(i2s_bclk_factor), MPMU_ISCCR, 27, 2, BIT(29), 0);
> 
> >  static const struct clk_parent_data apb_parents[] = {
> >  	CCU_PARENT_HW(pll1_d96_25p6),
> > @@ -756,6 +777,10 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
> >  	[CLK_I2S_BCLK]		= &i2s_bclk.common.hw,
> >  	[CLK_APB]		= &apb_clk.common.hw,
> >  	[CLK_WDT_BUS]		= &wdt_bus_clk.common.hw,
> > +	[CLK_I2S_153P6]		= &i2s_153p6.common.hw,
> > +	[CLK_I2S_153P6_BASE]	= &i2s_153p6_base.common.hw,
> > +	[CLK_I2S_SYSCLK_SRC]	= &i2s_sysclk_src.common.hw,
> > +	[CLK_I2S_BCLK_FACTOR]	= &i2s_bclk_factor.common.hw,
> >  };
> >  
> >  static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
> 
> Best regards,
> Haylen Chu
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
