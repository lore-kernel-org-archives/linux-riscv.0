Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89220D111A8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 20:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FzMW7Nv8LbKc1Eg5ZLPhQBqNpFvbVdSbRkWtpr/EkQ=; b=TJG6zpB68A7Sxt
	ZEN1rJ5MFHsqW/3fGIM2uSAniSvEp8CMFM2GBDA/ebx+ZJLjbPQY/o35dTsG6o0nTYxOyp08eRlH6
	mFhA5ku86CI07pgzv6wA4V/LwWRhIrMRW9ufxdDLCEvv+5NG6NGkmkA35muERTXoARLEdBGV6yyy1
	zvMsfajF1dwRM1HDwIeBfjthojAgCJI3BuixctOgunSHHTYCk1XuWeRX/EVbfSm6i0z/+KnTE0vBh
	u60KKc30f487D5Oep+AopCQZvvL1ld4Ib56SsLhtB4GOFxG8TgVeLw7IK2M079Moqbi5Rq6vas5Z4
	yjhJv3vYaBxXinBvC+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOigp-0000000HCcP-1R9t;
	Thu, 27 Nov 2025 20:34:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOigm-0000000HCc4-1l0i
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 20:34:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4726E436CA;
	Thu, 27 Nov 2025 20:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99949C4CEF8;
	Thu, 27 Nov 2025 20:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764275643;
	bh=iaUkQzHWoFtelBiaVO6hPpyfUhchc6MEcbKNHDj+YO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfAQPPNrkwDVGw1LMaEzzsxYcumtf2XjM0DixGYbmPfpXORU9ijySXiOMMY5bM3x5
	 cKGV3KOAC1wchviAmtEagCtsi1DFDsbi1xtvLxzVZ/lCo8wyaPwSMBOLxAO4vH5/vw
	 cO/hxQYAtt62LYFyXXXDpinq6jreqVvkRuVa/HV93Nu83g9LI+8JnxJ7XgF2Dxa+Qc
	 Ucn6o148G+8yHwZhgVsVqlAvKJpLJay2xm41q9DO1TGff5Z+PBCeJYLEPFJSIhvVXH
	 ARAAMl/Sq6a3H85AjcpxC3JC5MPS7QFFD/+qi5T6FSuuCltobAZqCqjRycKQGclY5K
	 fDnL/MsLvN9FQ==
Date: Thu, 27 Nov 2025 14:33:58 -0600
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 6/7] clk: thead: th1520-ap: Support CPU frequency scaling
Message-ID: <aSi1tlmBdZ5fZHqR@gen8>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-7-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-7-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_123404_498703_4292CD5B 
X-CRM114-Status: GOOD (  13.97  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 20, 2025 at 01:14:15PM +0000, Yao Zi wrote:
> On TH1520 SoC, c910_clk feeds the CPU cluster. It could be glitchlessly
> reparented to one of the two PLLs: either to cpu_pll0 indirectly through
> c910_i0_clk, or to cpu_pll1 directly.
> 
> To achieve glitchless rate change, customized clock operations are
> implemented for c910_clk: on rate change, the PLL not currently in use
> is configured to the requested rate first, then c910_clk reparents to
> it.
> 
> Additionally, c910_bus_clk, which in turn takes c910_clk as parent,
> has a frequency limit of 750MHz. A clock notifier is registered on
> c910_clk to adjust c910_bus_clk on c910_clk rate change.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 148 +++++++++++++++++++++++++++++-
>  1 file changed, 146 insertions(+), 2 deletions(-)
[...] 
> +/*
> + * c910_clk could be reparented glitchlessly for DVFS. There are two parents,
> + *  - c910_i0_clk, dervided from cpu_pll0_clk or osc_24m.

Typo: 'derived' instead of 'dervided'.

[...]

Unless there are other comments that require changes, I can fix up the
typo when applied.

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
