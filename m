Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC335C8303C
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 02:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9qXk9JIl5lT2Ya9b+x6+8gkYMJgIMRfTB+KpFiOrcA=; b=kes66/fhCUc4SO
	81kMUWlq+wSJzt7l+ULlHAUhh1V7kt76h106ENJGX+6GDtovmwYjPbSZDadyYtoD8GvoPuJ/3LSRf
	0uz3WP9bTbu5NnIHb0UaXwsbiqWok9kB5zj66pA7ihSybBMKncr4A9gtXR6DiZsugCAa3B3kj2mHz
	pPinGKSR/SAJorQf1mvUiMEgIs5Yc3RcHp3NM/Y5fzkTn5FsaJt3ZppdEjgW4NZuvuPvbixPiMgbK
	gRdA3Dj5PFlpjLtZE50Mf6iU2YFbAkH9PKh7senC3DYu4hDDMFgNi8aH82g2KLpcr+sMhp4pLKF/Y
	/Pt0U5OhJfxUT9PqWHYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYEng-0000000HGAO-0402;
	Sun, 06 Jul 2025 02:08:16 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYEnd-0000000HGA2-0our
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 02:08:15 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5CFED2307C;
	Sun,  6 Jul 2025 04:08:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HydFQqZyg1UX; Sun,  6 Jul 2025 04:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751767689; bh=qbb9qUQDN3f4Sd+pgIv8uMMRUnNZzrqkxxKE9i/HdpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nh6pRZBbZPbBVd6rlqgXn6VkyHqMJeBET1dH+mWBb7uE3Plod4Kf0xBby7O3n2UEm
	 MyDBuaKcAHw8RrGdnjsjCmXLZNCw+raNm12XtTiNj/bvgF86ItZPn54KRDEZuDz7s8
	 39D+UTmRY7mlezXftdI/JAL93Gpohpfyj+EovDfDmliH/mXnN6FVxHg7DVyBH59LUC
	 bIIQblzD/tfr9oSgkFdJ4pDKrBn9UOGpchrrXumQ4lKsdNSsw7hDKHSp34kAVEDwb0
	 +dUCQVhcG5viSTLTQsyqTUD6WBkZPLcleq7Nd8ubcpAn75el59BNU0ck6SyX9tm8qj
	 xQq9Qk8U6Wvfw==
Date: Sun, 6 Jul 2025 02:07:51 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: thead: th1520-ap: Correctly refer the parent for
 c910 and osc_12m
Message-ID: <aGnaZjMoWbW_FZfj@pie>
References: <20250705052028.24611-1-ziyao@disroot.org>
 <aGm+adSNdTHyN7K1@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aGm+adSNdTHyN7K1@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_190813_793079_A2540ADE 
X-CRM114-Status: GOOD (  37.39  )
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

On Sat, Jul 05, 2025 at 05:08:09PM -0700, Drew Fustini wrote:
> On Sat, Jul 05, 2025 at 05:20:28AM +0000, Yao Zi wrote:
> > clk_orphan_dump shows two suspicious orphan clocks on TH1520 when
> > booting the kernel with mainline U-Boot,
> > 
> > 	$ cat /sys/kernel/debug/clk/clk_orphan_dump | jq 'keys'
> > 	[
> > 	  "c910",
> > 	  "osc_12m"
> > 	]
> > 
> > where the correct parents should be c910-i0 for c910, and osc_24m for
> > osc_12m.
> 
> Thanks for sending this patch. However, I only see "osc_12m" listed in
> clk_orphan_dump. I tried the current next, torvalds master and v6.15 but
> I didn't ever see "c910" appear [1]. What branch are you using?

I think it has something to do with the bootloader: as you could see in
your clk_orphan_dump, the c910 clock is reparented to cpu-pll1, the
second possible parent which could be correctly resolved by the CCF,
thus c910 doesn't appear in the clk_orphan_dump.

But with the mainline U-Boot which doesn't reparent or reclock c910 on
startup, c910 should remain the reset state and take c910-i0 as parent,
and appear in the clk_orphan_dump.

Another way to confirm the bug is to examine
/sys/kernel/debug/clk/c910/clk_possible_parents: without the patch, it
should be something like

	osc_24m cpu-pll1

c910's parents are defined as

	static const struct clk_parent_data c910_parents[] = {
		{ .hw = &c910_i0_clk.common.hw },
		{ .hw = &cpu_pll1_clk.common.hw }
	};

and the debugfs output looks obviously wrong.

There's another bug in CCF[1] which causes unresolvable parents are
shown as the clock-output-names of the clock controller's first parent
in debugfs, explaining the output.

> I think it would be best for this patch to be split into separate
> patches for osc_12m and c910.

Okay, I originally thought these are relatively small fixes targeting
a single driver, hence put them together. I'll split it into two patches
in v2.

> > The correct parent of c910, c910-i0, is registered with
> > devm_clk_hw_register_mux_parent_data_table(), which creates a clk_hw
> > structure from scratch. But it's assigned as c910's parent by
> > referring &c910_i0_clk.common.hw, confusing the CCF since this clk_hw
> > structure is never registered.
> 
> I recall Stephen Boyd had the feedback when trying to upstream this
> driver to avoid strings for parents and instead use clk_parent_data or
> clk_hw pointers directly [2]. It was difficult to find alternitves to
> parent strings in all instances.

Yes, especially the predefined clock types which always allocate a new
struct clk_hw, so one has to choose between filling the parent data
dynamically or using the parent's name.

> > Meanwhile, osc_12m refers the external oscillator by setting
> > clk_parent_data.fw_name to osc_24m, which is obviously wrong since no
> > clock-names property is allowed for compatible thead,th1520-clk-ap.
> > 
> > For c910, refer c910-i0 by its name; for osc_12m, refer the external
> > clock input by index. This eliminates these orphan clocks.
> > 
> > Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/clk/thead/clk-th1520-ap.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> > index ebfb1d59401d..74da1a61e6f0 100644
> > --- a/drivers/clk/thead/clk-th1520-ap.c
> > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > @@ -427,7 +427,7 @@ static struct ccu_mux c910_i0_clk = {
> >  };
> >  
> >  static const struct clk_parent_data c910_parents[] = {
> > -	{ .hw = &c910_i0_clk.common.hw },
> > +	{ .index = -1, .name = "c910-i0" },
> 
> Stephen - would this use of a parent string be acceptable?
> 
> >  	{ .hw = &cpu_pll1_clk.common.hw }
> >  };
> >  
> > @@ -582,7 +582,14 @@ static const struct clk_parent_data peri2sys_apb_pclk_pd[] = {
> >  	{ .hw = &peri2sys_apb_pclk.common.hw }
> >  };
> >  
> > -static CLK_FIXED_FACTOR_FW_NAME(osc12m_clk, "osc_12m", "osc_24m", 2, 1, 0);
> > +struct clk_fixed_factor osc12m_clk = {
> > +	.div		= 2,
> > +	.mult		= 1,
> > +	.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc_12m",
> > +						   osc_24m_clk,
> > +						   &clk_fixed_factor_ops,
> > +						   0),
> > +};
> 
> I think this hunk is a good fix for osc_12m. I applied the patch and
> osc_12m no longer appears in clk_orphan_dump [3]. clk_summary now shows
> osc_12m under osc_24m.

Thanks for the confirmation!

> >  
> >  static const char * const out_parents[] = { "osc_24m", "osc_12m" };
> >  
> > -- 
> > 2.49.0
> > 
> 
> [1] https://gist.github.com/pdp7/d00f0f4fe3fcf368ce253d606dc7b01f
> [2] https://lore.kernel.org/all/91c3373b5b00afc1910b704a16c1ac89.sboyd@kernel.org/
> [3] https://gist.github.com/pdp7/30e51ed013d4bedf0c6abc5717e0b6a5

Regards,
Yao Zi

[1]: https://lore.kernel.org/linux-clk/20250705095816.29480-2-ziyao@disroot.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
