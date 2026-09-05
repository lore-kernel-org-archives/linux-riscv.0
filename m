Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE77C79F8B
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 22:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GA56WLqIeg3oLxUeikMeiADbWejDVhjhjHNhPfp4MJU=; b=H/x2skjpp5uaSp
	jgpj6ZTte2xPgF0msOWC1i6ASv+IQwNFI0ZVccVB++hDNj5Tot/0uu5pCSCN9tQsLLexnWHW5kzvF
	MUR7R67QaykOHOi7N4Z6cIrNrkbR+5O/0zprbmjE7GuN8//kHXa1iV/eIarD2t/P+6aLZ2wqc24q8
	1azymi36rW6CubHCSXTnrG3ojjaxCd85t65q8OwwBDsq2VFuKb6eXE1cdOprVHsTnDXFcEioESrZW
	A68WOPnvEuDy/Cp6TO0LOi4MGC8Dx5VM4oqxNQHovhs4czc8otkUk68skoQN/wh7FII7sTHZ5JpFx
	TOoxVl+O9SPTYT3/MIpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2yYD-00000004Rcq-1L8r;
	Sat, 05 Sep 2026 22:07:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2yYB-00000004RcZ-2fCd
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 22:07:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2926843770;
	Sat,  5 Sep 2026 22:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF281F00A3A;
	Sat,  5 Sep 2026 22:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788646069;
	bh=HV2wruqCLdbcGMXHglAtzJcwEp//cjsvhSFhrJ5SLX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dLWS2Q3g4i1xXVcGfStwz9rx94D/Vc3cl2ApEK+GbqBOUCERGKqkZ/tBnp73acSov
	 ettXpII6IsI+1fTdTrq71QhBmgamLEIS6WGb1G2yHCx3A1CAn7z2emkP7wbdMj64xj
	 tX6gvatgB5NQJcs2GnIlkPuLYsjGFiL8ZterC9DuwphOm3CI5gXB+eq3B88Xvi76CM
	 1R2ORP0RBu2t7yalThFddg3xW6VgUYvK3m9hNIhWL9mw7AEw3jrR5xoBG0MOX2znbp
	 z194CnrxIGNHVItevI4hhiyN7sc6XVG1S0IjPyqhngr1vshq3ehwFzYBsjMs8uUOrK
	 8ISuwpCLApBLA==
Date: Sat, 5 Sep 2026 22:07:46 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
	stable@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] clk: spacemit: k3: add CPU PLL rate tables
Message-ID: <20260905220746-GKC53903@kernel.org>
References: <20260903-k3-pll5-pll8-1800mhz-v4-1-afafd9cb47d9@linux.spacemit.com>
 <apmuG46sBg2rGzCD@aurel32.net>
 <DL67LEVCXFA5.39M5FO7JGKWZS@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DL67LEVCXFA5.39M5FO7JGKWZS@linux.spacemit.com>
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

Hi Aurelien, Troy,

On 11:24 Fri 04 Sep     , Troy Mitchell wrote:
> Hi Aurelien,
> 
> On Fri Sep 4, 2026 at 1:27 AM +08, Aurelien Jarno wrote:
> > Hi Troy,
> >
..
> >>  drivers/clk/spacemit/ccu-k3.c | 96 +++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 96 insertions(+)
> >
> > Thanks for the patch, it makes sense to add all the values, to support 
> > future firmware changes. The values match the ones in the vendor kernel.
> I forgot that you had a similar patch as well..
> 
> >
> >> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
> >> index 92b930d5ff30..950bf531c734 100644
> >> --- a/drivers/clk/spacemit/ccu-k3.c
> >> +++ b/drivers/clk/spacemit/ccu-k3.c
> >> @@ -29,15 +29,91 @@ static const struct ccu_pll_rate_tbl pll2_rate_tbl[] = {
> >>  	CCU_PLLA_RATE(3000000000UL, 0x0b3e2000, 0x00000000, 0xa0558c8c),
> >>  };
> >>  
> >> +/* Keep the firmware default as the first entry. */
> >>  static const struct ccu_pll_rate_tbl pll3_rate_tbl[] = {
> >> +	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
> >
> > Is it really necessary to put this entry first? I guess it's the current 
> > default frequency, but we have seen it can evolve. From my tests, the 
> > driver seems to just keep the value configured by the firmware 
> > independently from the table order, so I am not sure it's necessary.

I agree with Aurelien here, the default frequency isn't a solid stable settings,
which it may changes in the future

> I think keeping it first is necessary. If the current register settings do
> not match any entry in the table, ccu_plla_init() falls back to the first

Isn't it a bug if all frequencies added still couldn't cover all settings?
I'd simply suggest to bail out and yell loudly if there is a mismatch

I just don't like putting specific frequency at first one as default,
this logic is kind of fragile and tend to fail easily..

> entry:
> 
> 
> 	ccu_plla_update_param(pll, &pll->config.rate_tbl[0]);
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
