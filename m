Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7DDCD98C7
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQ5hwdH0OreZfocbFAHJ+qMyOYohr0Ojt+FJUdM1qBg=; b=wxBsMu6idxJZ5C
	gFLO0CXMT/vsuK0hk8OeQKdjcTjN1l7piTeZDoIklyIYpL3xbbKXblIrbZ/W2lfHAREPOTWcrdnX0
	YP/kTCwTKeoUrvnwL7WfPNQk9zY5DMpVDvWPmB2s3mwlS1K7l9SgwAYzMRLDz8V8y5lrgeH2dU2qd
	CAN6VEsYkQso7e4rUpj1e4QNJpyUnqWpEzVn1/GVxhbfrOUNo1s5YRHMRZ2ymPSv9j4I9KMYBJNRc
	zU7EuZh7+RYLNA2Nogrdet2VD9F3hzkgpdnpHXFw8+4PTMLu60QxPum7+IiPpTH7DFZ5VI46S1AM2
	9zqJZJ/Xc6PbsAdDagaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXi4h-00000009kDA-1fzO;
	Thu, 11 Jun 2026 16:16:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXi4g-00000009kD2-39HH
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 16:16:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6E85600AF;
	Thu, 11 Jun 2026 16:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B981F00893;
	Thu, 11 Jun 2026 16:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781194569;
	bh=ispvM4Q1Ggnm8889SXeeYvZPGC3+zHE+n3czS8EYm2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ehRzGA2lQarFmgX8gF5038NNeXEgJurNOPqMmvvBY456EmnxM5xAkNuWheMDp57AK
	 2xdCL3APtW/oR9Rs4E2HJcqpr8f0PGzMf/fIDeh5LczbxdmxwtT+m9lh49Jxm06weG
	 zXpxotEqPNgPJ/qhe2qzfJq1t3HhUjhZlOXqRORi7/lvTSfcC7PSVMPGWNuwV8Qmxk
	 qYhhlYI7LrMJkC92aLcMLv4jLoz4SR/4fbZGGolja3wFcdGfvlj7MzCdJKgjxbsnF4
	 mmazuljZMD1QQNiOjuV59ZqwRWSOsUpsCZu8Ha/rGpnuosawUUNjHiwSk+dSOSYCNn
	 LLhzVqC9usU4g==
Date: Thu, 11 Jun 2026 09:16:08 -0700
From: Drew Fustini <fustini@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH v2] riscv: defconfig: thead: enable PCA953X GPIO driver
Message-ID: <airfSHk5h/u/d2O/@x1>
References: <CGME20260608074116eucas1p15c0f84c280d8645d778e42777bd238d1@eucas1p1.samsung.com>
 <20260608074104.2198409-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608074104.2198409-1-m.szyprowski@samsung.com>
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

On Mon, Jun 08, 2026 at 09:41:04AM +0200, Marek Szyprowski wrote:
> Enable PCA953X GPIO driver to properly probe Wifi pwrseq driver on
> LicheePi4a board.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - copile GPIO_PCA953X as a module
> v1:
> https://lore.kernel.org/all/20260603082132.3200787-1-m.szyprowski@samsung.com/
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 08445df56006..a51a423d53f4 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -174,6 +174,8 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
>  CONFIG_GPIO_DWAPB=y
>  CONFIG_GPIO_SIFIVE=y
>  CONFIG_GPIO_SPACEMIT_K1=y
> +CONFIG_GPIO_PCA953X=m
> +CONFIG_GPIO_PCA953X_IRQ=y
>  CONFIG_POWER_RESET_GPIO_RESTART=y
>  CONFIG_SENSORS_SFCTEMP=m
>  CONFIG_CPU_THERMAL=y
> -- 
> 2.34.1
> 

I have applied this to my riscv-config-for-next branch:

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=riscv-config-for-next&id=fb266bbe9aef17d547db468a1a7187b59ed33e9a

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
