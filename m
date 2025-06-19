Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF454C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 21:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROBXF5sX76EdKGG9jswnAt8pwoHA8qCrV1tN/8WGs5M=; b=NrT8FF7sd0rxTm
	vfGWhnB3M+wXu8M/VqE3KBXhZGyjd3cKvI8yJSngV81rcIHpHFi3e1sZVIg2w8tAYwM6Gf7Rw1bSt
	NelipNGX5bLNtobuWp1cCWl639wxR9SfsnmuupKGrr0bt8yyC2K7C1TSiZAxEkf2uvVTZ21EPjPgs
	0kj0YGTZ+/5UG5uouDgsdDmUlGDfMjhG9K3Sa9cLIj5m90Zu3EmBbQPCshtf4nn7lihVCTGB1DaTv
	EefanG1ma6koFbEqBOh7yGHuEgjT3U9lbLf3e7X/rsgpLpEcsekpdoFiutvjpCq6o/40tnA/UCn6w
	rK16c+jaB5DrmHvgfoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSN6B-0000000EK2V-2PuL;
	Thu, 19 Jun 2025 21:47:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLNo-0000000EAFg-07tk
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 19:57:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C1E35C66FA;
	Thu, 19 Jun 2025 19:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88289C4CEEE;
	Thu, 19 Jun 2025 19:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750363030;
	bh=ibWzxSUcPdGpnUffjV9oSw3Mgv/hOA1CQ+xqnIiMa/A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=g7jPXHykDJy4xCaKiVKrMn/tusr/gawzeCFHZsc615sMC0WdBFcbe0OEa/N2TwOU/
	 8cCrH8oAjJGS25DqiggSTogcvqHVrqG3TX2l/vfNry2tD22ByRLNj/3wo7br5XAs27
	 LbzPlS6RZBVgJ/aeKgQXXsKfz5ghIbHtulZDVyt/l4IVyTkWIXfwHi49CqD++c/KEm
	 ILBSgtmDHnclzgrdvUrpKTudmpzrPXV24U7LJ6smnPjOzyKzH1/Dine16SudrOKCaf
	 xFTD3rTebrWRDONzLhLiL2HHOSafqYpf6frftNckvxweqvVKY+Ee52uOZd32SnAOuF
	 0X3uMOw0XlNdg==
MIME-Version: 1.0
In-Reply-To: <20250618-rust-next-pwm-working-fan-for-sending-v4-5-a6a28f2b6d8a@samsung.com>
References: <20250618-rust-next-pwm-working-fan-for-sending-v4-0-a6a28f2b6d8a@samsung.com> <CGME20250618122808eucas1p1734efef72b723602969465d6cd0c01d2@eucas1p1.samsung.com> <20250618-rust-next-pwm-working-fan-for-sending-v4-5-a6a28f2b6d8a@samsung.com>
Subject: Re: [PATCH v4 5/9] clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUSED
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To: Albert Ou <aou@eecs.berkeley.edu>, Alex Gaynor <alex.gaynor@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Boqun Feng <boqun.feng@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>, Fu Wei <wefu@redhat.com>, Gary Guo <gary@garyguo.net>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Trevor Gross <tmgross@umich.edu>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Thu, 19 Jun 2025 12:57:09 -0700
Message-ID: <175036302986.4372.15656426260486761164@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_125712_144774_DAFA4953 
X-CRM114-Status: GOOD (  12.27  )
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

Quoting Michal Wilczynski (2025-06-18 05:27:38)
> Probing peripherals in the AON and PERI domains, such as the PVT thermal
> sensor and the PWM controller, can lead to boot hangs or unresponsive
> devices on the LPi4A board. The root cause is that their parent bus
> clocks ('CLK_CPU2AON_X2H' and the 'CLK_PERISYS_APB' clocks) are
> automatically gated by the kernel's power-saving mechanisms when the bus
> is perceived as idle.
> 
> Alternative solutions were investigated, including modeling the parent
> bus in the Device Tree with 'simple-pm-bus' or refactoring the clock
> driver's parentage. The 'simple-pm-bus' approach is not viable due to
> the lack of defined bus address ranges in the hardware manual and its
> creation of improper dependencies on the 'pm_runtime' API for consumer
> drivers.
> 
> Therefore, applying the'`CLK_IGNORE_UNUSED' flag directly to the
> essential bus clocks is the most direct and targeted fix. This prevents
> the kernel from auto-gating these buses and ensures peripherals remain
> accessible.
> 
> This change fixes the boot hang associated with the PVT sensor and
> resolves the functional issues with the PWM controller.
> 
> Link: https://lore.kernel.org/all/9e8a12db-236d-474c-b110-b3be96edf057@samsung.com/ [1]
> 
> Reviewed-by: Drew Fustini <drew@pdp7.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
