Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AC0C83F1A
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 00:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ejjFr4Q2i7iucUzdeO1ucoBs3FJK6kIXWAKsGf+iWY=; b=o59tiddDNt4EOM
	uhFWc7LAhR92hgZVo5VMuqXO+dkGxl38shEPRvlrZvDru0LW1Frt1f8/1JWR4qDKAdIlqIaN54uuA
	Zmu11KV0g9HDUVkamkNsbzakZD5FtFaV9sCBEgm6juhoeM70tVkdT+WKsBLXfSwJ60gGGNv1CYAPh
	T1rdq+PFEmorVBeTGMDLellHRboBug/f3VxDGGnlGoc1KeSNyX+QslL+XeFvbffKfx9fnvgbStZyB
	jIh0betqs922u7aWdG1jRZL5njDnFoa++/Mo7oxDisPYZpkNHrfR9jVn7S+gfwy+g3+QF4/kL/JeU
	1Bbmyrifx58PQ7IRtoBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueN0r-00000003iEq-0oD3;
	Wed, 23 Jul 2025 00:07:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueN0o-00000003iER-48V5
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 00:07:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48E745C552C;
	Wed, 23 Jul 2025 00:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C438DC4CEEB;
	Wed, 23 Jul 2025 00:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753229228;
	bh=T1uMkldXB60o/GHBIhUkrUgZ400UoTd0hvAVPNTV9ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVj8/JYZUEDetgHxhIHVqgIK0ZRtqkmctDXvOOHBi7tCxiclLISeODTJ4LvOiJsEw
	 mFH5c2MlJXA1THON4u2Or7reHLvLQqFW5oZa3MtGNaDvtMwQH4y1wbooVj2fy8TeKS
	 bCpnfKPasQpjB+K3jgJhIvozcDXDs+r48J1+FuCrI856C3wtwydwPIbzRW1nclcfOB
	 xVYnmWe7CBuYdM1yCdduVD1qwjH3PfXycg2pu88nET9VKfen+tqcdyWXXqbHMoQWj1
	 9E0s3szUZwu6huiwCd+Dfjq4RkFhP10qObqmWAyoWhpRHxXkb6VOoEGxp8yiMl7TB+
	 SEyYyDRXe8gaA==
Date: Tue, 22 Jul 2025 17:07:07 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: thead: th1520-ap: Describe mux clocks with
 clk_mux
Message-ID: <aIAnq5jWARhj8XuO@x1>
References: <20250722080535.60027-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250722080535.60027-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_170711_066465_7C8B3ACF 
X-CRM114-Status: GOOD (  15.39  )
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

On Tue, Jul 22, 2025 at 08:05:36AM +0000, Yao Zi wrote:
> Mux clocks are now described with a customized ccu_mux structure
> consisting of ccu_internal and ccu_common substructures, and registered
> later with devm_clk_hw_register_mux_parent_data_table(). As this helper
> always allocates a new clk_hw structure, it's extremely hard to use mux
> clocks as parents statically by clk_hw pointers, since CCF has no
> knowledge about the clk_hw structure embedded in ccu_mux.
> 
> This scheme already causes issues for clock c910, which takes a mux
> clock, c910-i0, as a possible parent. With mainline U-Boot that
> reparents c910 to c910-i0 at boottime, c910 is considered as an orphan
> by CCF.
> 
> This patch refactors handling of mux clocks, embeds a clk_mux structure
> in ccu_mux directly. Instead of calling devm_clk_hw_register_mux_*(),
> we could register mux clocks on our own without allocating any new
> clk_hw pointer, fixing c910 clock's issue.
> 
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
> 
> This replaces the second patch in v2 of series "Fix orphan clocks in
> clk-th1520-ap driver".
> 
> Note that the c910's issue cannot be reproduced with vendor U-Boot,
> which always reparents c910 to its second parent, cpu-pll1. Another way
> to confirm the bug is to examine
> /sys/kernel/debug/clk/c910/clk_possible_parents, which obviously doesn't
> match c910's definition. There's another patch[1] explaining and fixing
> the issue that the unknown parent isn't shown as "(missing)" in debugfs.

Reviewed-by: Drew Fustini <dfustini@kernel.org>

Thank you for refactoring the c910_i0 parent fix without using strings
in the parent data.

Before: 

==> /sys/kernel/debug/clk/c910/clk_possible_parents <==
osc_24m cpu-pll1

After:

==> /sys/kernel/debug/clk/c910/clk_possible_parents <==
c910-i0 cpu-pll1

The system still boots okay without clk_ignore_unused and peripherals
like serial, emmc and ethernet are functional.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
