Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1F7C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18/Vf9SgWzuus9RSCL2smcLFhHRZSPbLQixwJxM/+9I=; b=OzqxGncDLpOvx5
	mYzzYKuBpf9+apdQ+7ge/vHXpHXZq3+IpRGM9ku5K+WndErJ1sUUCAkaAhSxSvCw+ttdGTGLaT+cX
	oHdMKc0c3taxb3ffwtAU9Y09809yYW6PP8CdZnL6T7HAV+9Hj2QuqdbkwkqFEZnOijfZS4VPwfqsN
	gs0Ev4l4G4vWwGwX+DinCFnJ9Nzkw7g8S4BiOxlpxDT+BjaksuvlxylQX2NR6M3gQ5CqdWBRnS7/t
	e6D0OxWrqdCbRntrOX+2/tXxZnIY26fv5DhKJFMTclOlr0QQyF6KdwimTF4UOxBQmdMnIt4ghELi8
	CPqUjPm6MtW2/Z34TkxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Px-0000000DPu0-2zyh;
	Fri, 11 Jul 2025 01:19:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyNG-0000000D19G-1Qxg
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 21:00:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9C105C59C0;
	Thu, 10 Jul 2025 21:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A4CC4CEE3;
	Thu, 10 Jul 2025 21:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752181208;
	bh=MewW7/+o8jjvZCCPAiXzkcATxmHODd29D85iDo4C6/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cw0Po9jzlMUjPqWpMGa3JmmBs8qRn4ccQxsczXqp7qgR6aRRsHF+DE2bSDEwQQBP4
	 I0b0G/fSn3B7wsgm9pMdPjLO/IZc1SbO2D81ch1852sxjhGtQuUK5/+8r9JvFllG0s
	 Z7OYhhl15781l/ITp0MO26j7ZK6Sc7q5bmjdkQPM6yegffImghltyi/rJg/57P542s
	 ABRuHxHyoWse9e/GL2hh4AjgDy0mxvD0NAd2MBekD8PfWFupXjR7Z4NRsGWVh9uGL6
	 QxY+PWYQXib4cQNtLPsI24Hdwb1dkhsXRIZaZcmb3x67rQLmcG8v8erktQz/1oP3vs
	 baVNbw2mfKzrw==
Date: Thu, 10 Jul 2025 14:00:06 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: thead: th1520-ap: Correctly refer the parent
 of osc_12m
Message-ID: <aHAp1q9tLy465gnO@x1>
References: <20250710092135.61049-1-ziyao@disroot.org>
 <20250710092135.61049-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250710092135.61049-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_140010_424416_C6CDBC68 
X-CRM114-Status: GOOD (  16.28  )
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

On Thu, Jul 10, 2025 at 09:21:34AM +0000, Yao Zi wrote:
> The "osc_12m" fixed factor clock refers the external oscillator by
> setting clk_parent_data.fw_name to osc_24m, which is obviously wrong
> since no clock-names property is allowed for compatible
> thead,th1520-clk-ap.
> 
> Refer the oscillator as parent by index instead.
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index ebfb1d59401d..42feb4bb6329 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -582,7 +582,14 @@ static const struct clk_parent_data peri2sys_apb_pclk_pd[] = {
>  	{ .hw = &peri2sys_apb_pclk.common.hw }
>  };
>  
> -static CLK_FIXED_FACTOR_FW_NAME(osc12m_clk, "osc_12m", "osc_24m", 2, 1, 0);
> +static struct clk_fixed_factor osc12m_clk = {
> +	.div		= 2,
> +	.mult		= 1,
> +	.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc_12m",
> +						   osc_24m_clk,
> +						   &clk_fixed_factor_ops,
> +						   0),
> +};
>  
>  static const char * const out_parents[] = { "osc_24m", "osc_12m" };
>  
> -- 
> 2.50.0

Reviewed-by: Drew Fustini <fustini@kernel.org>

Thanks for fixing this. osc_12m now appears under osc_24m in
clk_summary.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
