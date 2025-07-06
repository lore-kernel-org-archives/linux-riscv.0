Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0718FC83F05
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 04:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXlldDQcU14wM/UyP6C8Mx+pCSESvc8JZwZ7/RJigic=; b=UoIg6GMcv5QjT5
	pItiljoQY/C1nKRMpmteuhKBdF2mbvnFOuXRV3gplDvFNgDljCL9+gRvGcLcnR4s6YB7whl7yNgow
	rcTT7zJ08Y0VKlioXWLj+zWo/q2+70ziW+NjuJEfh8z5RXN0erGLoWH/ltdLQdkePF9CZzZpuvg/W
	i1Uv21xIVoKmIGW06nMyohC/Zj2T3Eh6yom+mGgvO6VSY6cnREk8YyoZSbPUtyoqGf3BAzzIcU0li
	76nioiZE9eFqOxQblIhtA+o2YfjOdZm2hWu6wYebvW7a8IPnAzqOiTm5uZua8EsVVOOZ8O9DhI+1O
	szdPkQvkBIODn5psvKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYHIL-0000000HO9U-0PKl;
	Sun, 06 Jul 2025 04:48:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYH2K-0000000HMR0-3vef
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 04:31:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DACEBA52EEB;
	Sun,  6 Jul 2025 04:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62568C4CEEF;
	Sun,  6 Jul 2025 04:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751776291;
	bh=Hq5aQNa3aom6TCoSy+iVuy9sh/cxbUw9rIyDrG1A4iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wq+2YEcPd7G1gYvqBSjPaEehRIX2ybqq3vogU8k/KQD0bdw+3478AEfjiystxqsuz
	 0jtPrrJxX1yzsvCfZG8ZGgHrVPZj4qsiOI6CEdOxaT9hKVb47McfMTfxiB/1mIEt9n
	 3ZzjM6lapSiMXemeEa6gYBH7FjG8hpJC5SaufnWuR7Q8Iu6WhAACwsRgMmUw+NiN8L
	 TQuZfMfOhNGyqjB4y6To7jJ3vQgL+ZMhyv+pQqWoDlkMgTQjKSO/PvYlYmx6k49Y3w
	 /UxdHQujj3I+rsNKhTmpVKrdp1gUTBnLbRMf3HLn8uqLOotcfeGkQhSHWWSH/AAJ4x
	 ZcSeoVMyEd47g==
Date: Sat, 5 Jul 2025 21:31:29 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: thead: th1520-ap: Correctly refer the parent for
 c910 and osc_12m
Message-ID: <aGn8IVkWQJjHMfCT@x1>
References: <20250705052028.24611-1-ziyao@disroot.org>
 <aGm+adSNdTHyN7K1@x1>
 <aGnaZjMoWbW_FZfj@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aGnaZjMoWbW_FZfj@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_213133_126372_87FB2D7D 
X-CRM114-Status: GOOD (  30.61  )
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

On Sun, Jul 06, 2025 at 02:07:51AM +0000, Yao Zi wrote:
> On Sat, Jul 05, 2025 at 05:08:09PM -0700, Drew Fustini wrote:
> > On Sat, Jul 05, 2025 at 05:20:28AM +0000, Yao Zi wrote:
> > > clk_orphan_dump shows two suspicious orphan clocks on TH1520 when
> > > booting the kernel with mainline U-Boot,
> > > 
> > > 	$ cat /sys/kernel/debug/clk/clk_orphan_dump | jq 'keys'
> > > 	[
> > > 	  "c910",
> > > 	  "osc_12m"
> > > 	]
> > > 
> > > where the correct parents should be c910-i0 for c910, and osc_24m for
> > > osc_12m.
> > 
> > Thanks for sending this patch. However, I only see "osc_12m" listed in
> > clk_orphan_dump. I tried the current next, torvalds master and v6.15 but
> > I didn't ever see "c910" appear [1]. What branch are you using?
> 
> I think it has something to do with the bootloader: as you could see in
> your clk_orphan_dump, the c910 clock is reparented to cpu-pll1, the
> second possible parent which could be correctly resolved by the CCF,
> thus c910 doesn't appear in the clk_orphan_dump.
> 
> But with the mainline U-Boot which doesn't reparent or reclock c910 on
> startup, c910 should remain the reset state and take c910-i0 as parent,
> and appear in the clk_orphan_dump.

Ah, thanks for the explanation. I'm on an old build:

U-Boot SPL 2020.01-g55b713fa (Jan 12 2024 - 02:17:34 +0000)
FM[1] lpddr4x dualrank freq=3733 64bit dbi_off=n sdram init
U-Boot 2020.01-g55b713fa (Jan 12 2024 - 02:17:34 +0000)

I would like to run mainline but I have the 8GB RAM LPi4a. Does mainline
only work for the 16GB version right now?

> Another way to confirm the bug is to examine
> /sys/kernel/debug/clk/c910/clk_possible_parents: without the patch, it
> should be something like
> 
> 	osc_24m cpu-pll1
> 
> c910's parents are defined as
> 
> 	static const struct clk_parent_data c910_parents[] = {
> 		{ .hw = &c910_i0_clk.common.hw },
> 		{ .hw = &cpu_pll1_clk.common.hw }
> 	};
> 
> and the debugfs output looks obviously wrong.

Thanks, yeah, without the patch I also see:

==> c910-i0/clk_possible_parents <==
cpu-pll0 osc_24m

> 
> There's another bug in CCF[1] which causes unresolvable parents are
> shown as the clock-output-names of the clock controller's first parent
> in debugfs, explaining the output.

Thanks for that fix. I now see '(missing)' for c910 too when I apply
that patch:

root@lpi4amain:/sys/kernel/debug/clk# head c910/clk_possible_parents
(missing) cpu-pll1

> 
> > I think it would be best for this patch to be split into separate
> > patches for osc_12m and c910.
> 
> Okay, I originally thought these are relatively small fixes targeting
> a single driver, hence put them together. I'll split it into two patches
> in v2.

I think the osc_12m is good as-is but I'm not sure what Stephen will
think about using the string "c910-i0" in c910_parents[]. I think
splitting it up will make discussion go faster.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
