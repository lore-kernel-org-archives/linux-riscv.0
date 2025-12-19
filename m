Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCECFE66882
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 19:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBxESjW/qM7xzydo01+0HmvmmxYev19xMW6ngIcL4FQ=; b=NOKjd0nj9Pyr07
	PkNKTF/ExirI683EXIJ1tbj6sjgf2scM6GXt2VIkhKMIOgWgd8n5tgyrDfISQzPZX6BU16j5CTwmJ
	FsjJL6PFke5IdGBnHZJGKbyjPRHo+VAIyxZLmFmQM6g/U52qwoVDFcMJYIoDom7X7Be3UnQhwm/hh
	sGS1wDBN55oubz5BWB174ktBuJDX/i9hwvckjc/B07l91Aj9yNAKGiminhaLMsWdcHbXMr5/QUMsn
	BegegXzcuiKMN98tis3NwQX8C0Cxejq1NqrrJVv82x4eXBa1Gd0gtPvBa5u4TRBvfHMFUIpqGDnMy
	y1skKe2qfqeMaxrzHg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgDF-0000000AtXS-3Sp5;
	Fri, 19 Dec 2025 19:32:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWgDD-0000000AtX5-2t8E
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 19:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 89153444AA;
	Fri, 19 Dec 2025 19:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227CDC116B1;
	Fri, 19 Dec 2025 19:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766172746;
	bh=dxdW68X2kvLQgIr4oNlWMogIiBjhXtoI9Gpq80I84oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2Hk/sUSg4OqBlDtU58XABw0wWGbLVpkC2I8FBz9kZo0dTu6zsCwm+ICKhyWBm9Wo
	 Ujn72u37NBQmzYsiyI1avGwf2y8P0OdLCFSY7VEFgu8C9OeXhGvHfO1Bv8JosjqLdD
	 LSVEaNb9NOX32DcFw6Sveko/O3UJYx/p48+PdXp/3uYxrqq1oXJP2AwSOXK3Pj9IZb
	 opuTk7YvtGsNKsPHzrK2XZFx2fkaZFGmgOZi3+O4fWpVQelsUvMlVYCYewmUO5EDxM
	 UcXbIUo6skcH1CjiL5IFUoTlbuCTVnXxpmWATECg26ZW9wP6cFatZo+dznw6sZz2l+
	 UG4+aUp7gy+0A==
Date: Fri, 19 Dec 2025 11:32:24 -0800
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 0/7] Implement CPU frequency scaling for TH1520
Message-ID: <aUWoSNI2mFaPARfI@x1>
References: <20251120131416.26236-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_113227_769788_2D5E2153 
X-CRM114-Status: GOOD (  18.40  )
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

On Thu, Nov 20, 2025 at 01:14:09PM +0000, Yao Zi wrote:
> On TH1520 SoC, c910_clk feeds the CPU cluster. It could be glitchlessly
> reparented to one of the two PLLs: either to cpu_pll0 indirectly through
> c910_i0_clk, or to cpu_pll1 directly. This series fixes a bug in PLL
> enabling code, supports rate change for PLL, and finally implements
> frequency scaling support for c910_clk.
> 
> However, to achieve reliable frequency scaling, CPU voltage must be
> adjusted together with frequency, and AON-firmware-based PMIC support
> for TH1520 SoC is still missing in mainline. Thus PATCH 7 that fills OPP
> table for TH1520 CPU and enables CPUfreq is only for testing purpose,
> not intended for upstream (yet).
> 
> Testing is done on Lichee Pi 4A board, only operating points safe
> to be used with the the default PMIC configuration are enabled in
> devicetree. I've confirmed there's a performance gain when running
> coremark and some building work compared to the case without cpufreq.
> 
> This series is based on next-20251120, thanks for your time and review.
> 
> Yao Zi (7):
>   dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
>   clk: thead: th1520-ap: Poll for PLL lock and wait for stability
>   clk: thead: th1520-ap: Add C910 bus clock
>   clk: thead: th1520-ap: Support setting PLL rates
>   clk: thead: th1520-ap: Add macro to define multiplexers with flags
>   clk: thead: th1520-ap: Support CPU frequency scaling
>   [Not For Upstream] riscv: dts: thead: Add CPU clock and OPP table for
>     TH1520
> 
>  arch/riscv/boot/dts/thead/th1520.dtsi         |  35 ++
>  drivers/clk/thead/clk-th1520-ap.c             | 350 +++++++++++++++++-
>  .../dt-bindings/clock/thead,th1520-clk-ap.h   |   1 +
>  3 files changed, 379 insertions(+), 7 deletions(-)
> 
> -- 
> 2.51.2
> 

Applied to thead-clk-for-next, thanks!

[1/7] dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
      https://git.kernel.org/fustini/c/5f352125f8a0
[1/7] clk: thead: th1520-ap: Poll for PLL lock and wait for stability
      https://git.kernel.org/fustini/c/892abfbed71e
[2/7] clk: thead: th1520-ap: Add C910 bus clock
      https://git.kernel.org/fustini/c/b436f8a82aaa
[3/7] clk: thead: th1520-ap: Support setting PLL rates
      https://git.kernel.org/fustini/c/238cc6316a88
[5/7] clk: thead: th1520-ap: Add macro to define multiplexers with flags
      https://git.kernel.org/fustini/c/5dbee3503771
[6/7] clk: thead: th1520-ap: Support CPU frequency scaling
      https://git.kernel.org/fustini/c/30441a56b1d1

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
