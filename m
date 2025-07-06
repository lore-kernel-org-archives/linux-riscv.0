Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D243C83030
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 00:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpYT5i3/a2B9qcPHHbMA0yttKIZzn/vT+MOqETOk+ro=; b=JBgQOOQJ+XaWRQ
	XTXLf3WKgpQZbFg+ottoZse+AhzWpCnypSVz2tC1YTYZgPis/cRg5dgVzn9ERYHyLv79V3tUl0HRy
	HP37XJtpx6BsQapZuethxwA4qkIg/utiMktyguGtCtMlBtUE2bLKNH958UEOxM9iznubi8RUSBRPN
	0fJQw5ofaBZmwI9CdrcMYLKURJ7VJhBVv+FKOT8WdffaZiKXZuf/MH7fQB04kN0n69o1jc4RuvAzX
	swyRRF9uq+uWhUewq4kX87NzBDWVCdJFk+1V9xQcbjI1XzGEGdlnxkxzb5na1Lb7jRFQIolQWr5LD
	tGoKLJTPoVbRB8n1mi1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYCwj-0000000HBh3-3xg7;
	Sun, 06 Jul 2025 00:09:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYCvW-0000000HBay-2feH
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 00:08:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D633446432;
	Sun,  6 Jul 2025 00:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881BEC4CEE7;
	Sun,  6 Jul 2025 00:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751760491;
	bh=uC1minF/xwR/V1v5iYqpAyv3Ym5sMrGVxIQWTllzRes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cn5YbIGv/LWgzDD/2gs1sB4MOBgTQ9kmN/yTMO/m/ydNNvX9NXIwRYu1SIRWiFM4H
	 R5qHXwhx9WhkvVMmiXnKlwz0oo5HX3AGuexgO5f7amECuv+gAoZ8v8TPwBza2ptSAL
	 0azXhLyXarYVS+FlF4GtSRCskeR2XPUlZqU8TOp/U5SZ9ZkxrvKsSTd4AGd9uK/iZh
	 RzHiDADc0DVNndkxeZuh7H0lBYaBEduxf/zu+PeP5YBcEHYmbs24QeZlQl4H4daH14
	 f46PLwfA12gizZVkO4VwkB0YhDmWaFCQLnniDlX/ZV2Hz9Lvm1wqz2x0fqOR1jgazH
	 lb0pUrQdtPevg==
Date: Sat, 5 Jul 2025 17:08:09 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: thead: th1520-ap: Correctly refer the parent for
 c910 and osc_12m
Message-ID: <aGm+adSNdTHyN7K1@x1>
References: <20250705052028.24611-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250705052028.24611-1-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_170814_718996_3FBD2272 
X-CRM114-Status: GOOD (  27.60  )
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

On Sat, Jul 05, 2025 at 05:20:28AM +0000, Yao Zi wrote:
> clk_orphan_dump shows two suspicious orphan clocks on TH1520 when
> booting the kernel with mainline U-Boot,
> 
> 	$ cat /sys/kernel/debug/clk/clk_orphan_dump | jq 'keys'
> 	[
> 	  "c910",
> 	  "osc_12m"
> 	]
> 
> where the correct parents should be c910-i0 for c910, and osc_24m for
> osc_12m.

Thanks for sending this patch. However, I only see "osc_12m" listed in
clk_orphan_dump. I tried the current next, torvalds master and v6.15 but
I didn't ever see "c910" appear [1]. What branch are you using?

I think it would be best for this patch to be split into separate
patches for osc_12m and c910.

> The correct parent of c910, c910-i0, is registered with
> devm_clk_hw_register_mux_parent_data_table(), which creates a clk_hw
> structure from scratch. But it's assigned as c910's parent by
> referring &c910_i0_clk.common.hw, confusing the CCF since this clk_hw
> structure is never registered.

I recall Stephen Boyd had the feedback when trying to upstream this
driver to avoid strings for parents and instead use clk_parent_data or
clk_hw pointers directly [2]. It was difficult to find alternitves to
parent strings in all instances.

> Meanwhile, osc_12m refers the external oscillator by setting
> clk_parent_data.fw_name to osc_24m, which is obviously wrong since no
> clock-names property is allowed for compatible thead,th1520-clk-ap.
> 
> For c910, refer c910-i0 by its name; for osc_12m, refer the external
> clock input by index. This eliminates these orphan clocks.
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index ebfb1d59401d..74da1a61e6f0 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -427,7 +427,7 @@ static struct ccu_mux c910_i0_clk = {
>  };
>  
>  static const struct clk_parent_data c910_parents[] = {
> -	{ .hw = &c910_i0_clk.common.hw },
> +	{ .index = -1, .name = "c910-i0" },

Stephen - would this use of a parent string be acceptable?

>  	{ .hw = &cpu_pll1_clk.common.hw }
>  };
>  
> @@ -582,7 +582,14 @@ static const struct clk_parent_data peri2sys_apb_pclk_pd[] = {
>  	{ .hw = &peri2sys_apb_pclk.common.hw }
>  };
>  
> -static CLK_FIXED_FACTOR_FW_NAME(osc12m_clk, "osc_12m", "osc_24m", 2, 1, 0);
> +struct clk_fixed_factor osc12m_clk = {
> +	.div		= 2,
> +	.mult		= 1,
> +	.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc_12m",
> +						   osc_24m_clk,
> +						   &clk_fixed_factor_ops,
> +						   0),
> +};

I think this hunk is a good fix for osc_12m. I applied the patch and
osc_12m no longer appears in clk_orphan_dump [3]. clk_summary now shows
osc_12m under osc_24m.

>  
>  static const char * const out_parents[] = { "osc_24m", "osc_12m" };
>  
> -- 
> 2.49.0
> 

[1] https://gist.github.com/pdp7/d00f0f4fe3fcf368ce253d606dc7b01f
[2] https://lore.kernel.org/all/91c3373b5b00afc1910b704a16c1ac89.sboyd@kernel.org/
[3] https://gist.github.com/pdp7/30e51ed013d4bedf0c6abc5717e0b6a5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
