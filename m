Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98308CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 22:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2d5kf5I34UvnMQj5+xl/JD5bN/aaOUL8JkUhI5Hk0EY=; b=H5Goj80SyBwsXi
	lFD/HbU3eE/bE//Q374OcaxTWNkN8fEoVvpP6mbef4ZvqhpKMI4Kf3Rqwfwwc/nv7VSWUlLN8hP+g
	ky05H4NQe/6qUwV4oty4qd823vDHg98abKIVWds4CC/YkZy4uf9eTrLYdM7srOQPSaUbEtL4l1ycT
	tHv98AfLZ4QmoLLuDJ9GS8oGvM4tsGd8Ex9u3aK7RlDV22wnzIWizKH9F7M2HWK02FM4Jiz3aMRUv
	Z3Kd6egWsjXl9ZLujNh14rASyMHSaQnc5AB4dbjhgMz4OtagBRBaDbjsC3li13/7+Ap4DLLb1HLFa
	qKmKu8A/laOA79iretqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo8hq-00000008rbK-3JRp;
	Mon, 18 Aug 2025 22:51:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo83P-00000008oFk-2QIn
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 22:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 179416111C;
	Mon, 18 Aug 2025 22:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5F0C116C6;
	Mon, 18 Aug 2025 22:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755555009;
	bh=Bnndge+CdaMWA2w0cdjnSJFewFl8QufFzBkVOdHPlqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQhSfeWvke9+s1pOY6ybbkJqgIdSS7Pg3jgxD7sShQx7c0lnHcfCkk/vHRX8ctRS6
	 Gy3XtPf0fGGIj25RMVs1WulRbJ6pE2j85ZMHSY3oJ4fGmynzgDhiVp/okuLzaM7rvY
	 KQOxD+WyPvoWf3KcOhO6rt489BEDN6CrTXdGzKO3QMcsTyn6D7Zb2gko7oTsnDrK+E
	 m16Xy8sKq9+hoREFKdU72en8FbRfL/MtgDoRdgO6/mIE40v3botYmwu9OWyCrWPKvi
	 7jJj4FYhETw/h59fA2eCrG4UeD48ToQkl6TMZ1QdvVpN3lw9BjZRoe1NW8Bteh1fvF
	 3dv4yUEOO6JSw==
Date: Mon, 18 Aug 2025 15:10:08 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: thead: Changes to TH1520 clock driver for
 disp
Message-ID: <aKOkwIqKi1QqSo8K@x1>
References: <20250816091113.2596048-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250816091113.2596048-1-uwu@icenowy.me>
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

On Sat, Aug 16, 2025 at 05:11:09PM +0800, Icenowy Zheng wrote:
> This patchset is my changes to the TH1520 clock driver, mainly for
> supporting the display controller.
> 
> The first patch is previously a dependency of this patchset before v3,
> but a rebase operation in v3 changed it and it's now pulled into this
> patchset.
> 
> The 2nd and 3rd ones are functionality additions, with the first one
> adding support for enabling/disabling PLLs (for DPU PLL) and the second
> one adding support for changing DPU dividers.
> 
> The 4th one is to address hang issues met when testing the DPU driver
> w/o clk_ignore_unused command line option.
> 
> The patchset is rebased atop the padctrl0 parent fix patchset (which
> contains refactor of ccu_gate) at [1] in v3.
> 
> [1] https://lore.kernel.org/linux-riscv/20250816084445.2582692-1-uwu@icenowy.me/
> 
> Icenowy Zheng (3):
>   clk: thead: add support for enabling/disabling PLLs
>   clk: thead: support changing DPU pixel clock rate
>   clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL
> 
> Michal Wilczynski (1):
>   clk: thead: Correct parent for DPU pixel clocks
> 
>  drivers/clk/thead/clk-th1520-ap.c | 153 +++++++++++++++++++++++-------
>  1 file changed, 121 insertions(+), 32 deletions(-)
> 
> -- 
> 2.50.1
> 

Thank you, I've applied this to thead-clk-for-next [1]:

c567bc5fc68c clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL
8fede7ff692c clk: thead: support changing DPU pixel clock rate
56a48c1833aa clk: thead: add support for enabling/disabling PLLs
c51a37ffea38 clk: thead: Correct parent for DPU pixel clocks

-Drew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-clk-for-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
