Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB333D3CC9E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 01:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IU0PPtdMTQDCTd9jLSSQTRUSMsEGvI9HYGwYQAln5Qg=; b=e100RaqBjK7rem
	D3euXBInGNI+vKBg6OzVEM+XUvk266UwbNgwpGuKTzGm6fgvVRWYDS0fCnUDPl6k3MhenQPEA+nFR
	bNtGXRVF8k4TziA0a8XpfHrvJb/9T5oBi6AIhPYBVEiw6jbo9CD63lUypYVs+mVt/CsAM6LjDSExR
	AKX14+4ahY6+jXBe5tTj0VJ1rezGVc+6Yj2GtRvP+ZpEiTmGspiu8RfOvMYftJ7jZa8ARvpqKyZql
	yNQt+Bg9Z9CTaReJ24eMZh1GmPZF59VcJPhFnEcPIuo/pOMad9fkAVZ38YsoYJ/wAX2JGmtsznywM
	Un369mxd93uK9fqBLwCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCV9-0000000BSJM-00sT;
	Thu, 15 Jan 2026 01:50:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCV7-0000000BSIK-0aQv
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 01:50:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DEA443282;
	Thu, 15 Jan 2026 01:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92977C4CEF7;
	Thu, 15 Jan 2026 01:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768441814;
	bh=HT9KhvfEL51j6LmqfG+h7ryX8XjjUq1a+PKewitsH6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1FPZdxaNCMPPJy1rc/yLdWArPG1EzMZCTEVCGqrr5NFtdZYFIpwYzQX0os1fa3ml
	 Tzu3hptM7UCx4qZY+MqKUY8guAe1gFRHRGMdYqIv3fH/IyuPHHEP+Hnx1r/pa3z/dJ
	 6nQFZKCZVDaXUUH6HWnu504WBlo1BnGdhmC1pWinGoGEWFDqy+A0B1vFvUBkMCTho7
	 pRbp7HQqc4OXiGhRbN0jOHJYM2TVzUSpLOmESqgldLLrWhpe7qAG7QDusdkCmTNLI3
	 Lco+9zVE8TdGw7TlNJQtwCWNpoGHEY0ayoHP/2+xY16vAWuBmr9iuM9sPVy8d3DjSH
	 wMbNqZ/Ly0Lfg==
Date: Wed, 14 Jan 2026 17:50:13 -0800
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 0/7] Implement CPU frequency scaling for TH1520
Message-ID: <aWhH1aFUIieN4zVj@x1>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <aUWoSNI2mFaPARfI@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUWoSNI2mFaPARfI@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_175017_219939_C5EDC766 
X-CRM114-Status: GOOD (  22.77  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yao Zi <ziyao@disroot.org>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Yao Zi <me@ziyao.cc>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 19, 2025 at 11:32:24AM -0800, Drew Fustini wrote:
> On Thu, Nov 20, 2025 at 01:14:09PM +0000, Yao Zi wrote:
> > On TH1520 SoC, c910_clk feeds the CPU cluster. It could be glitchlessly
> > reparented to one of the two PLLs: either to cpu_pll0 indirectly through
> > c910_i0_clk, or to cpu_pll1 directly. This series fixes a bug in PLL
> > enabling code, supports rate change for PLL, and finally implements
> > frequency scaling support for c910_clk.
> > 
> > However, to achieve reliable frequency scaling, CPU voltage must be
> > adjusted together with frequency, and AON-firmware-based PMIC support
> > for TH1520 SoC is still missing in mainline. Thus PATCH 7 that fills OPP
> > table for TH1520 CPU and enables CPUfreq is only for testing purpose,
> > not intended for upstream (yet).
> > 
> > Testing is done on Lichee Pi 4A board, only operating points safe
> > to be used with the the default PMIC configuration are enabled in
> > devicetree. I've confirmed there's a performance gain when running
> > coremark and some building work compared to the case without cpufreq.
> > 
> > This series is based on next-20251120, thanks for your time and review.
> > 
> > Yao Zi (7):
> >   dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
> >   clk: thead: th1520-ap: Poll for PLL lock and wait for stability
> >   clk: thead: th1520-ap: Add C910 bus clock
> >   clk: thead: th1520-ap: Support setting PLL rates
> >   clk: thead: th1520-ap: Add macro to define multiplexers with flags
> >   clk: thead: th1520-ap: Support CPU frequency scaling
> >   [Not For Upstream] riscv: dts: thead: Add CPU clock and OPP table for
> >     TH1520
> > 
> >  arch/riscv/boot/dts/thead/th1520.dtsi         |  35 ++
> >  drivers/clk/thead/clk-th1520-ap.c             | 350 +++++++++++++++++-
> >  .../dt-bindings/clock/thead,th1520-clk-ap.h   |   1 +
> >  3 files changed, 379 insertions(+), 7 deletions(-)
> > 
> > -- 
> > 2.51.2
> > 
> 
> Applied to thead-clk-for-next, thanks!
> 
> [1/7] dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
>       https://git.kernel.org/fustini/c/5f352125f8a0

Conor - can I included this binding patch in my thead clk pull request
to Stephen?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
