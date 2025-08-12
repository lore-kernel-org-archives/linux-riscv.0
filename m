Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBE6C87FCB
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 05:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdGCWnEHT7kDPHa1mipQvs0qg4SRTXFH7Y7hP9XPdPo=; b=JMOqwxByLS53uA
	xvvy+yprufpKa7FZZj82xaUzsMQ19v15mpOjx/7kGF8iFisrBIfqCQs2GtM4QOd5eruOh8J6D9Aps
	IN+ZIJeoM7v9J4gVSALkm8VRDYG6JIy4nnUQzjaQipPkuSTNwufYFqpzdYbUGhgq1uZvXlrO0KoxQ
	eNH9plLCW9SfAgsY3oXJC0a08HSdmBxUFQ3UNDmSn9RAH81dn7viP1GnoFew4DUOf04qDiWsdy91s
	DRr0JYRTi44cbCBhd7nZA/5J2KFIrqlCgD4gJRNMWRwEFJthr7JzbYXcRqlx8yrPDjaMblCKS9wXk
	vR7i9qP1qt8NXaH6ysug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhhE-00000009tTP-3M7V;
	Tue, 12 Aug 2025 05:37:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhAb-00000009pqF-3Ysr
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 05:03:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07A2260203;
	Tue, 12 Aug 2025 05:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E5CC4CEF5;
	Tue, 12 Aug 2025 05:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754975012;
	bh=0aASSGzPbsJlEgSlsZ6D6ZGfHF6ChcO7jQtZrFDV5KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSp4+2nOySu4amL/FumQIknZTTUfFptWOpc5GVzG7wtNvxA3J/v0qCh44l1uPF2eq
	 8qPCWXXAX9k615wImyzdn7xiKkBOBHxEAFuUwMxKWm1xz9zg7oau8dJmvsZLQxNydC
	 rqtM9Tr9/IhYVNjc6tInsaEflUiHJCJzMfeiPvEhPIhZewe3WQDg7qXZpS0lZH1gQA
	 EWYoVu4C0kdtQJEf/+KKCKzSfP9tR4wr1rmYIP9rYXXHnywpsXgDAwJysaWy0bTGnK
	 /GBQ1YYj/kuDSOYAObzfiPOAshVYXnl4miE5MJVb5ywa8VdqMEJyEKPFtjVitN2eq+
	 f68jsp3Rgzqgw==
Date: Mon, 11 Aug 2025 22:03:31 -0700
From: Drew Fustini <fustini@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] clk: thead: Correct parent for DPU pixel clocks
Message-ID: <aJrLI7RAAUBTgiEK@x1>
References: <CGME20250809170205eucas1p2da20fc85d38c98195d2ce36422592bee@eucas1p2.samsung.com>
 <20250809-fix_clocks_thead_aug_9-v1-1-299c33d7a593@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250809-fix_clocks_thead_aug_9-v1-1-299c33d7a593@samsung.com>
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
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Aug 09, 2025 at 07:02:00PM +0200, Michal Wilczynski wrote:
> The dpu0_pixelclk and dpu1_pixelclk gates were incorrectly parented to
> the video_pll_clk.
> 
> According to the TH1520 TRM, the "dpu0_pixelclk" should be sourced from
> "DPU0 PLL DIV CLK". In this driver, "DPU0 PLL DIV CLK" corresponds to
> the `dpu0_clk` clock, which is a divider whose parent is the
> `dpu0_pll_clk`.
> 
> This patch corrects the clock hierarchy by reparenting `dpu0_pixelclk`
> to `dpu0_clk`. By symmetry, `dpu1_pixelclk` is also reparented to its
> correct source, `dpu1_clk`.
> 
> Fixes: 50d4b157fa96 ("clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC")
> Reported-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Drew Fustini <fustini@kernel.org>

Thanks for the patch. I've been excited to see Icenowy and you working
on the graphics functionality.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
