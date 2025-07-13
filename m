Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF47DC83F17
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jul 2025 19:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgV/zAmx+nEqQHWgXA0TZlIKDZlBkKR7BvjjNnQSHEk=; b=QIpPyxE8Ja2nbO
	AFxOnVvPWI4jQI6PC2kAXheZHBF7O0PoK7K1wD5NXwnx9q5VE7qLax0A7pfwq6k//tVILJCf0OU0L
	/gZpFdM8zlqUqEqS34ionOLl49VtzyL/X2PJZyeY2RedVJfdHaJ2YSKleHwxFw3mxL5j/oy3zMYHW
	cqb4C5j+Q/INB0t87ms6o8H2MQohLMqHLWro0tHkVyfiuMhnjrL3rpLnMlA/xUjZyghTWvdylWaFV
	csCnhByFIAh1ijiC4OTUzP9d/82ymebs6lczJgR8OPll82oRGMlPnNpcE5OAec8qWoIDpEmq8eEn7
	OtD9XOeqMoW93UgF1Gaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub2pZ-00000000ZGb-3TtH;
	Sun, 13 Jul 2025 19:57:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub2pW-00000000ZEj-3rr8
	for linux-riscv@lists.infradead.org;
	Sun, 13 Jul 2025 19:57:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E7E05C561D;
	Sun, 13 Jul 2025 19:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA785C4CEE3;
	Sun, 13 Jul 2025 19:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752436663;
	bh=7MhP7Eqd6lgawO40n7WyV/A2Nja9gmD0SILlAqtyncA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOZ+B6YOOeI5xoYoJ9T+4exP4IdtHlNv4716nRx564DAv2sr/JZd1HhRl/qxWtvgk
	 UgdlDMwqD6+3abg3eLTVIBLDl0jN14ndsCsMadyVryFL2oGRp4v5PYyB5Zn8moLERf
	 zJLFhtN8BSJNINr5WbtMltmB+1pu3xXbhdKlCU585v4ilSlqGGnnysaYHBGWgBOnF9
	 V0JFNtxg3mACUmeU1h9iF2AoqbcAs1vOMz0fwdT0vEyb38wt8ozxp+yuQEme56mes0
	 n2IS6U0GWP9MxLMMV2jEVEpPmYYI0WVI9v8vkyKbASyOb6QHd5YNcyL6uQjA15BII2
	 ebDM3o8W2Iqlw==
Date: Sun, 13 Jul 2025 12:57:42 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: thead: th1520-ap: Correctly refer the parent
 of osc_12m
Message-ID: <aHQPtjB9FjIsCYHW@x1>
References: <20250710092135.61049-1-ziyao@disroot.org>
 <20250710092135.61049-2-ziyao@disroot.org>
 <aHAp1q9tLy465gnO@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aHAp1q9tLy465gnO@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_125746_999533_1C1CA169 
X-CRM114-Status: GOOD (  19.14  )
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

On Thu, Jul 10, 2025 at 02:00:06PM -0700, Drew Fustini wrote:
> On Thu, Jul 10, 2025 at 09:21:34AM +0000, Yao Zi wrote:
> > The "osc_12m" fixed factor clock refers the external oscillator by
> > setting clk_parent_data.fw_name to osc_24m, which is obviously wrong
> > since no clock-names property is allowed for compatible
> > thead,th1520-clk-ap.
> > 
> > Refer the oscillator as parent by index instead.
> > 
> > Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/clk/thead/clk-th1520-ap.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> > index ebfb1d59401d..42feb4bb6329 100644
> > --- a/drivers/clk/thead/clk-th1520-ap.c
> > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > @@ -582,7 +582,14 @@ static const struct clk_parent_data peri2sys_apb_pclk_pd[] = {
> >  	{ .hw = &peri2sys_apb_pclk.common.hw }
> >  };
> >  
> > -static CLK_FIXED_FACTOR_FW_NAME(osc12m_clk, "osc_12m", "osc_24m", 2, 1, 0);
> > +static struct clk_fixed_factor osc12m_clk = {
> > +	.div		= 2,
> > +	.mult		= 1,
> > +	.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc_12m",
> > +						   osc_24m_clk,
> > +						   &clk_fixed_factor_ops,
> > +						   0),
> > +};
> >  
> >  static const char * const out_parents[] = { "osc_24m", "osc_12m" };
> >  
> > -- 
> > 2.50.0
> 
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> 
> Thanks for fixing this. osc_12m now appears under osc_24m in
> clk_summary.
> 
> Drew

Thank you for the patch. I've now applied it to thead-clk-for-next as
commit d274c77ffa20 [1].

Drew

[1] https://github.com/pdp7/linux/commit/d274c77ffa202b70ad01d579f33b73b4de123375

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
