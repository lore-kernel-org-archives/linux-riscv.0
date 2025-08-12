Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585CBCA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 06:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7BHap3Ef5Gg0Q86WIjH884Xg40G/wVck0bXiHMabx0=; b=TwAVXEf5wMaNbG
	Hay0q0VTX5xq4j4RVwUriMcQDPak+9LnHworK4ReYhrC79LE7VMjbwI7y+vN9Kl9XIDSfiwXaqrKD
	VK3TQXhQylkYf484vgdDgXZwquciVbtDhBTZJ2+yX0bK2WJX7YAoDT6prFgauqhiv9wOOaLqwOgOu
	dMxMINznARXtAiD+NL/XIbCiz982yxReO1JyXpVtMU70uV+ktQWotG+xiih4KEyr85f0l4++NGM1H
	RL0MaljoJbcv7jhckDcyC71Cf+yh2kinYdisu2gNN5SanfZue+GzOPo/Ib5PB2Z0qqWhoGeLR351J
	fbP0SbKUsAzZt5WcEM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliQ4-0000000A1ES-3EoU;
	Tue, 12 Aug 2025 06:23:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliQ2-0000000A1E4-3HEr
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 06:23:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42445461E5;
	Tue, 12 Aug 2025 06:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075A0C4CEF9;
	Tue, 12 Aug 2025 06:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754979814;
	bh=+k1CSGuOSQu6VaDbQe3Z/6qqFzAm2XnBn6VGpEr2LGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DbR/eZ0+RhRtHn0wn4PERYKfBeN0hr5I6DGe7Q9aXpRR6LF9/Uuu15H6A1PG7YNEH
	 LrZnYys28OD/oGh0vXAD7vjr5AbxcYD2jlswFbFWUeH2Jatvunt3Rk2UTJAyPpIrt+
	 a1WhzZ/DU2rZ4kSa02BJXh3FnBYXX7aRLhyylpFpdj7HqXT6z5xckESqxur8qgpDdV
	 ONFLjHTe/Oan6a39MJkc7Q9LUP9vUtck2qkNGQMoGGvyK/DsnYIATWASWqFtJ83rx4
	 j0uyg9pkYVB2lB2pJb9ioa3Ules/l6OEZ2Cp7j+o3FuaJ6rWkBvzwtU5pfaS5uxysl
	 Te2p0G24SbSrg==
Date: Mon, 11 Aug 2025 23:23:32 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: thead: th1520-ap: set all AXI clocks to
 CLK_IS_CRITICAL
Message-ID: <aJrd5EaI9pdSvD5/@x1>
References: <20250812054258.1968351-1-uwu@icenowy.me>
 <20250812054258.1968351-4-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250812054258.1968351-4-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_232334_838779_EA416F86 
X-CRM114-Status: GOOD (  13.10  )
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

On Tue, Aug 12, 2025 at 01:42:57PM +0800, Icenowy Zheng wrote:
> The AXI crossbar of TH1520 has no proper timeout handling, which means
> gating AXI clocks can easily lead to bus timeout and thus system hang.
> 
> Set all AXI clock gates to CLK_IS_CRITICAL. All these clock gates are
> ungated by default on system reset.
> 
> In addition, convert all current CLK_IGNORE_UNUSED usage to
> CLK_IS_CRITICAL to prevent unwanted clock gating.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 42 ++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 20 deletions(-)

Thanks for working on the display controller. I'll review the series but
I wanted to point out a simple error first:

>  static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, BIT(5), 0);
>  static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, BIT(13), 0);
> +static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, BIT(5), CLK_IS_CRITICAL);
> +static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, BIT(13), CLK_IS_CRITICAL);

The compiler complains about redefinition of npu_axi_clk and cpu2vp_clk.
I've fixed it up by removing the old lines with '0' flags, but I'm
noting in case there is another revision.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
