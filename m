Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4C5E77184
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 20:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzwU0ZhoriDyGkA7PyEuAKxf1iFgZs/kJ3sylGSvO/c=; b=cljOA97IE1olCn
	ZVM3v+lQgMJlSQEamzjGsmq8vgeTbjKYCEMaNHw5MBSUOhXHnuPP91uE/j6GlWlNI2L5fmYzXxJDY
	0yGmFKCUgMryZKrk2ZcUa/jIkozj2fYNeCIf0zs1j93UPol4JPZ89AHbiYXLRx4FU/JEG4vB7GNRV
	BWyM32E9vlRKcagyN19MMbgjvxnmMc7uY0G+1IT4mr/PiMI7oS9kzEHPhcNnudNJkyVVsu4cf24YL
	g7MGEh/m+/R+RxETJTQEKmU+7BFV2iqrnvIC7asVzeAhUZcR89++/hYKUfkx6vUeXa+tIdND71phc
	c2h5Syy3Bc9b4n/k4esg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe6h-0000000Ejq3-1ZxW;
	Tue, 17 Dec 2024 20:23:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe1K-0000000Eixv-2o7X
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 20:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8AEA5C3268;
	Tue, 17 Dec 2024 20:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95226C4CED3;
	Tue, 17 Dec 2024 20:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734466697;
	bh=WqBSFi5dlx+V6nrhrCvfQCAjauoEpLpIzfVp6evH3Lo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JJUdjVEZSODD/Z9pjznX0/NkViuND7fcMywxRNmQVxycfudHSkkA8t7H3cHfNWtMW
	 YaKymrcWgh1HemVkyggV5Jp5Rh2JjzCBsGizhD6+TMB65OfOP929u56DaOKS6W5TBp
	 CNK5nWYNX/YpwkTpGs+DK92mr1AttJHUygOwXr2as2/lCKTleYhYouNpsxozgb/G6f
	 vs8dZjZnsHTFbIXs7Ezsg+hSJjhRXsyCxEcy2NXWQV+B/Cp34C5PgpKq3ThA5l69WC
	 2enxud4S5hdqSkIJAX/bth/Wm5yVKmgoEF6oFJGMD1AKB52cjIfA0rKVFrnotvN0eq
	 8CNjp572Xyqmw==
Message-ID: <2c0e701d9fcf69090daf8c4087c87d2a.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241210083029.92620-1-bigunclemax@gmail.com>
References: <20241210083029.92620-1-bigunclemax@gmail.com>
Subject: Re: [PATCH v2] clk: thead: Fix TH1520 emmc and shdci clock rate
From: Stephen Boyd <sboyd@kernel.org>
Cc: bigunclemax@gmail.com, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Yangtao Li <frank.li@vivo.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: bigunclemax@gmail.com
Date: Tue, 17 Dec 2024 12:18:15 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_121818_753449_42695F2C 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

Quoting bigunclemax@gmail.com (2024-12-10 00:30:27)
> From: Maksim Kiselev <bigunclemax@gmail.com>
> 
> In accordance with LicheePi 4A BSP the clock that comes to emmc/sdhci
> is 198Mhz which is got through frequency division of source clock
> VIDEO PLL by 4 [1].
> 
> But now the AP_SUBSYS driver sets the CLK EMMC SDIO to the same
> frequency as the VIDEO PLL, equal to 792 MHz. This causes emmc/sdhci
> to work 4 times slower.
> 
> Let's fix this issue by adding fixed factor clock that divides
> VIDEO PLL by 4 for emmc/sdhci.
> 
> Link: https://github.com/revyos/thead-kernel/blob/7563179071a314f41cdcdbfd8cf6e101e73707f3/drivers/clk/thead/clk-light-fm.c#L454
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
