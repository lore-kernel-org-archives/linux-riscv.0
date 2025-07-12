Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76576C83F1B
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jul 2025 00:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1UnyNKG6qgv4EDsOyEXsZ2sED3Qgh8DS6r1xoEub0g=; b=XUC3YeRcrTfob+
	sH4jekYJkuJT3IjZCk3oP5LCPS8w65d+qJDFsNpUBQroD6XJCydHFNaQoJfRWUsN7LmSHDKfCkJCo
	JHXybomTJqRWDURalLUipWLpW6jSTNW0PDtHG68TDCGUhCJPFsWtwsxKxzVIc/k8x+NifWIk3XBzD
	md71bVQIaS1dSA3fsRBRtGRDulZ1cA/HLbq84eDgI9U4Uir/fRc7QPGkXQHO07fJs6D8CgD/tWgXr
	NFBItNDX2BgSlxz9isEzNOhbH+/XEN8eM/uiCg3YeReWdwhWj72Dh1iCPpyeyzp1UkrEEtx72xKfc
	CTQiXdtJ3g+3siK0PSPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaOGv-0000000G6q7-1aJI;
	Sat, 12 Jul 2025 00:39:21 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaOGs-0000000G6pe-10UT
	for linux-riscv@lists.infradead.org;
	Sat, 12 Jul 2025 00:39:19 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B51AD25E98;
	Sat, 12 Jul 2025 02:39:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvgAh5k0tLQJ; Sat, 12 Jul 2025 02:39:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1752280752; bh=2uVl7Jvt7/k3szvxIdckbwyBUW1Ah4/1BZwU4PoRXeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CTQjscM8BNKA3GC6R/AXLuyXE7H5Faqtfne5VJn9JIs4g3H4sfqvKfQMlCdIIAMff
	 X46bydD4raVYVMaAduo4ZxoP7YjyZ3pc9pz8GCbjFACQRPUr1NNpIEEgpY8pHWnWvy
	 3dyKjBlsWleprqixoiHOwtdfE0t5BulGse9bUTRYtJgsV7+SgEME5Frt5Wx6HRSEzC
	 UJOEa6L432XU9tYuNQcqYjjoCXiaqoEnXAgnGhaqDmd1G2T5s5QJm38CsepTzixA2n
	 KGYdb0Ej0KcZ72fEnS0dannl/4zzjrSRnpr6NFhxaf0t+ayibyozHORjnHFed9zJJU
	 0lH/oJNraOd5A==
Date: Sat, 12 Jul 2025 00:39:00 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: thead: th1520-ap: Correctly refer the parent
 of c910-i0
Message-ID: <aHGupCeNsA-Q31kh@pie>
References: <20250710092135.61049-1-ziyao@disroot.org>
 <20250710092135.61049-3-ziyao@disroot.org>
 <aHDQv81WqlYzzpL4@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aHDQv81WqlYzzpL4@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_173918_692024_67425B64 
X-CRM114-Status: GOOD (  23.04  )
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

On Fri, Jul 11, 2025 at 01:52:15AM -0700, Drew Fustini wrote:
> On Thu, Jul 10, 2025 at 09:21:35AM +0000, Yao Zi wrote:
> > The correct parent of c910, c910-i0, is registered with
> > devm_clk_hw_register_mux_parent_data_table(), which creates a clk_hw
> > structure from scratch. But it's assigned as c910's parent by
> > referring &c910_i0_clk.common.hw, confusing the CCF since this clk_hw
> > structure is never registered.
> > 
> > Refer c910-i0 by its name instead to avoid turning c910 into an orphan
> > clock.
> > 
> > Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  drivers/clk/thead/clk-th1520-ap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> > index 42feb4bb6329..41ed72b1a915 100644
> > --- a/drivers/clk/thead/clk-th1520-ap.c
> > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > @@ -427,7 +427,7 @@ static struct ccu_mux c910_i0_clk = {
> >  };
> >  
> >  static const struct clk_parent_data c910_parents[] = {
> > -	{ .hw = &c910_i0_clk.common.hw },
> > +	{ .index = -1, .name = "c910-i0" },
> 
> Thanks for the patch. Unfortunately, I chatted with Stephen about this
> on irc and we need to avoid using strings in clk_parent_data. I'm trying
> to see how to correctly assign the pointer in the c910_parents[] after
> c910_io_clk has been registered.

If we stop using *_register_mux() for all the muxes, the problem should
go away: the key cause is that *_register_mux() always allocates a new
clk_mux structure, which in turn contains a new clk_hw structure.

We could avoid the ccu_mux structure, instead defining clk_muxes
directly and register them with devm_clk_hw_register(), for example,

	static struct clk_mux c910_i0_clk = {
		.reg		= 0x100,
		.mask		= BIT(0),
		.shift		= 1,
		.hw.init	= CLK_HW_INIT_PARENT_DATA("c910-i0",
							  c910_i0_parents,
							  &clk_mux_ops,
							  0),
	};

	c910_i0_clk.reg += base;
	ret = devm_clk_hw_register(dev, &c910_i0_clk.hw);

(not tested, just for demostration)

Now no new clk_hw structure is created and we could refer to muxes by
its hw member when defining other clocks.

> Thanks,
> Drew

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
