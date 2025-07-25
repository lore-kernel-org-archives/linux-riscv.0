Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47FCC87FCC
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 01:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65lV2sfUpIiPbofd01FlWU7uHybHs5sNk21yXRz9PCY=; b=sGMhhknXSjZpK+
	bpgxlX0tsPjhDQHjcqsoX3j858FvTWiaM/dS85egsLVvs+B8ch8gXQX8xZO7KBonAWkSHfy3tWhPI
	tClUXdtNoaGVt9wlq/gnoO6neuUOvsUhOHQMLF/LT85wCZvhuZd9J2vyZGLVZTMIEdCMMVE3RTjpx
	O1puWanfqAytuOWFfYRFY2nKRiSA/lgiOOKQ8vezjl/ZKwwvgNKc8pKs2Qe+kJeyVV3oKv1WU6rtJ
	MWYs6XXBx93c684f+iNWtAtSbxkjPnCutRhiVZ3fLYslp9uVzHGRNuA6Fzn5MfNu1KcmZ9V5Qh1ps
	T0Un3LOr9jbm+l/PleWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf74f-00000008oK1-3itl;
	Fri, 25 Jul 2025 01:18:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf73m-00000008oED-1tMP
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 01:17:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9091A601EA;
	Fri, 25 Jul 2025 01:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A8CC4CEED;
	Fri, 25 Jul 2025 01:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753406236;
	bh=MnFJ7F8dY8RvB8dXoNRYk2Dv6tZAdeeE7q2scZZoEqo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=o+aJSYfpF5TboYnl9G/eoK+bTmhLeJ66iWVe6BHwQs3bR/2tvsw9pQxqOpyt0EOw2
	 TR+gdWEvAmJfeENxYksaR7BmiI4XrAvoEULKXdbWDm2dxTG46REvQdPhjgS4S3qaiu
	 0j9I2mS9GM//n0dGFnc+7f3FMdJ+u1Bc7g9v7KAbQCRDP8KD0RrIJD+IBXF5NqQFI1
	 EXfKIEqY1uQMhAUY1IdgJO95MPT+5mwsfTHzxNbM6DN7n/QHnOFz7+s+mOt20WEbQE
	 0vxfdpXeVLCMFrNzaKs8lLosT4jCFDObiDSRtGeW6R35BG9oAD3iEj581vNe6K8GyH
	 BM0yjnIR2/5mg==
MIME-Version: 1.0
In-Reply-To: <20250623-rust-next-pwm-working-fan-for-sending-v5-8-0ca23747c23e@samsung.com>
References: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com> <CGME20250623180907eucas1p10c0ca6b667debcc8139402d97e4ef800@eucas1p1.samsung.com> <20250623-rust-next-pwm-working-fan-for-sending-v5-8-0ca23747c23e@samsung.com>
Subject: Re: [PATCH v5 8/9] riscv: dts: thead: Add PVT node
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To: Albert Ou <aou@eecs.berkeley.edu>, Alex Gaynor <alex.gaynor@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, =?utf-8?q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Boqun Feng <boqun.feng@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>, Fu Wei <wefu@redhat.com>, Gary Guo <gary@garyguo.net>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Trevor Gross <tmgross@umich.edu>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Thu, 24 Jul 2025 18:17:15 -0700
Message-ID: <175340623531.3513.5896709502242556676@lazor>
User-Agent: alot/0.11
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

Quoting Michal Wilczynski (2025-06-23 11:08:56)
> Add PVT DT node for thermal sensor.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 26996422e1efe5d2dde68819c2cec1c3fa782a23..bef30780034e06b07aa29b27b0225ea891a4b531 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -669,6 +669,17 @@ padctrl_aosys: pinctrl@fffff4a000 {
>                         thead,pad-group = <1>;
>                 };
>  
> +               pvt: pvt@fffff4e000 {

Node name should probably be 'thermal-sensor@fffff4e000' then.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
