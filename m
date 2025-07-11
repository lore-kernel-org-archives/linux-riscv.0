Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A8EC83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 09:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evnOglJ5krvsVRnkdjMGwcHyPCeNazrBpQzXNB4yyZA=; b=rBgfUAx4BJwEJn
	iSx+igITiCMKigMSJcihL5m0OAykn3Aj7g/SNfHF1789loKYKpk6Hg4qUq7VeZ8s1lU4cEBOavUsG
	TyFNmKQt7USgjptLt/u/ISuFVo5A1zkRFaQgos8rIjkUiYqn4mMlr9e1Sn1HTpyRIa0Yb9vC4GSY3
	yIWrUEpUADHs6nAnxcm22RJwpA/PjtzJtPmtJaLtr5JSxvdKKiChkplyqC+tja3nW9cGshs9X74Aa
	Ib2ty1+8V+Indy89wazhZgdObMWE6plfgPdJTuLFtcCMsXpuR3wYmxQAbI2zp0f1gho09Tv4SKjOW
	/IgBOgpDpzEUzleznS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAVm-0000000EOdJ-37Ai;
	Fri, 11 Jul 2025 09:57:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9UQ-0000000EDSU-02i2
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 08:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 292D061441;
	Fri, 11 Jul 2025 08:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF37C4CEED;
	Fri, 11 Jul 2025 08:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752223936;
	bh=aF+JJEZsequpHm+YtISush4RgOCy6i5U0IrNZGWxTnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DaKvlyOglpBFvzsRfEvLY6I3+fF0FHnGZTK5n6yuk/bg8DCaKFBekxMMrxdp5IBGB
	 fwQX53KyGSnL8Ye1cgY5dUhaGx/TaDKOt+HmorActcomy9lGgzbWi9ca8PkFGq/AJX
	 P+2MNI2mkBjXd7kfN8mDExxziQ9uQFxczWf+7VBh6SV2Xk7ASIWtzXh47KLImImvw6
	 /VN7fYVz9RfrY1pUZKApj62nuPOouEdDbcBMfsnaq3TsscHARkaNK6PCtc5tI28zJf
	 Usc4vJEx+6Ci3oB9a95+xnpWzPLB6tERsgOYu9Q1qCyl0NQaQ1uO+tCfroVvmV86dp
	 lvdoXo53URgZA==
Date: Fri, 11 Jul 2025 01:52:15 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: thead: th1520-ap: Correctly refer the parent
 of c910-i0
Message-ID: <aHDQv81WqlYzzpL4@x1>
References: <20250710092135.61049-1-ziyao@disroot.org>
 <20250710092135.61049-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250710092135.61049-3-ziyao@disroot.org>
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

On Thu, Jul 10, 2025 at 09:21:35AM +0000, Yao Zi wrote:
> The correct parent of c910, c910-i0, is registered with
> devm_clk_hw_register_mux_parent_data_table(), which creates a clk_hw
> structure from scratch. But it's assigned as c910's parent by
> referring &c910_i0_clk.common.hw, confusing the CCF since this clk_hw
> structure is never registered.
> 
> Refer c910-i0 by its name instead to avoid turning c910 into an orphan
> clock.
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index 42feb4bb6329..41ed72b1a915 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -427,7 +427,7 @@ static struct ccu_mux c910_i0_clk = {
>  };
>  
>  static const struct clk_parent_data c910_parents[] = {
> -	{ .hw = &c910_i0_clk.common.hw },
> +	{ .index = -1, .name = "c910-i0" },

Thanks for the patch. Unfortunately, I chatted with Stephen about this
on irc and we need to avoid using strings in clk_parent_data. I'm trying
to see how to correctly assign the pointer in the c910_parents[] after
c910_io_clk has been registered.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
