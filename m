Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4860C3600B
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 06:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bT5nmKARNDjy/v0HRxa72v7/e0Rj+t+p8P0a7ZWMdMA=; b=sFN8INyrwrcU/q
	HgdNG6fnbFEnUIzWFeTqNzVHd/fN62sTuQD9LJbzR4Djnp54W3ie4kglcApjsBk36NvocOHqrDV/c
	epQ0Vqk4WNozcqS0+KZBbkgwkBkjWkaEN9tcsOw7lMqhR2COz7xQDjOa2+qAUAxHWIG0c2P9eMDJx
	9N6QtNLRCZ+oRX9uRveLtDc6sm3mDsIpolHDWX+j9cD890oBJJo26DrL61hdL0U59F0UhgfIGIQe0
	sCGvCkosoS64MtXPjjuJd1wk6pZopXi/Z6iA/WExQQnNtDJ5FjBWc1886+AwzUtlfeEOzD5Fd9J8F
	Z6VtTGKynBQPszDYdURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbQg-00000002LB3-3MzD;
	Mon, 24 Mar 2025 06:36:58 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbF8-00000002JW4-0PDc
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 06:25:03 +0000
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7AA283434DF;
	Mon, 24 Mar 2025 06:25:00 +0000 (UTC)
Date: Mon, 24 Mar 2025 06:24:56 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 4/7] clk: spacemit: define existing syscon resets
Message-ID: <20250324062456-GYB18687@gentoo>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-5-elder@riscstar.com>
 <20250322162909-GYA15267@gentoo>
 <ee9fb4b7-7829-4eec-815c-1e269d6abc38@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee9fb4b7-7829-4eec-815c-1e269d6abc38@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_232502_159389_35FD93E5 
X-CRM114-Status: GOOD (  17.07  )
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

Hi Alex:

On 08:23 Sun 23 Mar     , Alex Elder wrote:
> On 3/22/25 11:29 AM, Yixun Lan wrote:
> > On 10:18 Fri 21 Mar     , Alex Elder wrote:
> >> Define reset controls associated with the MPMU, APBC, and APMU
> >> SpacemiT K1 CCUs.  These already have clocks associated with them.
> >>
> >> Signed-off-by: Alex Elder <elder@riscstar.com>
> >> ---
> >>   drivers/clk/spacemit/ccu-k1.c | 132 ++++++++++++++++++++++++++++++++++
> >>   1 file changed, 132 insertions(+)
> >>
> >> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> >> index 6d879411c6c05..be8abd27753cb 100644
> >> --- a/drivers/clk/spacemit/ccu-k1.c
> >> +++ b/drivers/clk/spacemit/ccu-k1.c
> > ..
> >> +static const struct ccu_reset_data apmu_reset_data[] = {
> >> +	[RST_CCIC_4X]	= RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
> >> +	[RST_CCIC1_PHY] = RST_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
> >> +	[RST_SDH_AXI]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
> >> +	[RST_SDH0]	= RST_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
> >> +	[RST_SDH1]	= RST_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
> >> +	[RST_SDH2]	= RST_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
> >> +	[RST_USBP1_AXI] = RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(4)),
> >> +	[RST_USB_AXI]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
> > ..
> >> +	[RST_USB3_0]	= RST_DATA(APMU_USB_CLK_RES_CTRL,	0,
> >> +				      BIT(9)|BIT(10)|BIT(11)),
> > 100 column if possible, also add one space between "BIT(9) | BIT(10) .."
> > continuous bits can just use GENMASK for short?
> 
> You'll notice that every place that has multiple bits in the mask
> also have a line break.  I kind of liked that as a way to highlight
> that fact (i.e., it goes beyond my preference for 80 columns).
> 
ok

> I will definitely add spaces, that was a mistake not to.
> 
> I will not define this with GENMASK().  In this case each bit
> represents a single reset, and so each one is significant on
> its own.  It is *not* a mask of contiguous bits, it's a set
> of bits that happen to have consecutive positions.
> 
ok

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
