Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46FDCA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 01:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Cc3LyTXjMaajfmVp+BSqjkrZxJ0kI5DlTTwu6F7rwM=; b=bt2AiOLEXrJ2uw
	9GJ6CmZF9f5p3cnpE0tvrgJckJXCWRiwMpsg5z4f4IoJdsgqBBelux7wqxaiGWZv53+OauY6K8aMp
	bmyV9go7X9sXrDAOwIEP4GCn1jqKiE4Lrel3uBVCW5tC6ErR1i2HVhfFDAaGWBxZRiqSId/fep+bz
	SL5NU23GefH9USDDuYpmW8YxHdjK+OqThCtwHNSlpH6kyyFgGrXPsRDM7EUYNrvTrc5S23ABKk9HH
	KdgKzDYDlLFZSI7etCOEL/kBRWAsGowKkP/npXmBB7SgZjHNIbPaIblMU3H8NvSyoJp94Qex8ujLf
	7h/Qe7npws3k2e81JZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotrU-0000000FOp8-30C0;
	Thu, 21 Aug 2025 01:13:04 +0000
Received: from mail-106111.protonmail.ch ([79.135.106.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqBI-0000000EyGK-0gfb
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 21:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=protonmail3; t=1755724633; x=1755983833;
	bh=fqJHnlhrPYGz8GtkFmxOodoZHHUoB7YfZ5UqommjP5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IV5VEQVoGy8r89/AzX/0j0QXioXUzhM6gRPmmLQCN5UBQyJd24AztT62WANBwlsvF
	 OBIEqPQABTD3NE0h+j70ybfdc7j/+VZGoL/ejDfUT8Yr6kB5j148i5TFtgklrG9A0Y
	 teV9SLmemCWiCST6/rOdG1olNit3+JqXCJ00RDmdhWjcscyd4czJFOgaHuiqQ/AQdr
	 yz69iq22YKALJIsSH/YezhF5t0n1fNhGmNAkbp8rlWDBwDV1JEs2wEukhlIDYvSTpp
	 2qY8qgzNa2CzirJk1omn3J6sMLhOJP6I7cFcxcjXRSjiwJbiR0xeyyCov8bSYXhiL8
	 jfzP1tcP8eR8Q==
X-Pm-Submission-Id: 4c6fRC1YSqz2ScDC
Date: Wed, 20 Aug 2025 21:17:03 +0000
From: Elle Rhumsaa <elle@weathered-steel.dev>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Benno Lossin <lossin@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Drew Fustini <fustini@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v14 6/7] riscv: dts: thead: Add PWM controller node
Message-ID: <aKY7TwrE-k-LePza@archiso>
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
 <CGME20250820083547eucas1p265478a3c9cf55a71e4e4b7fcfc5aadae@eucas1p2.samsung.com>
 <20250820-rust-next-pwm-working-fan-for-sending-v14-6-df2191621429@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820-rust-next-pwm-working-fan-for-sending-v14-6-df2191621429@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_141716_350360_B65B0BB4 
X-CRM114-Status: GOOD (  10.92  )
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

On Wed, Aug 20, 2025 at 10:35:41AM +0200, Michal Wilczynski wrote:
> Add the Device Tree node for the T-HEAD TH1520 SoC's PWM controller.
> 
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> Tested-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 42724bf7e90e08fac326c464d0f080e3bd2cd59b..513dc6977b2633503515ad260913156fbe57d92f 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -493,6 +493,13 @@ uart2: serial@ffec010000 {
>  			status = "disabled";
>  		};
>  
> +		pwm: pwm@ffec01c000 {
> +			compatible = "thead,th1520-pwm";
> +			reg = <0xff 0xec01c000 0x0 0x4000>;
> +			clocks = <&clk CLK_PWM>;
> +			#pwm-cells = <3>;
> +		};
> +
>  		clk: clock-controller@ffef010000 {
>  			compatible = "thead,th1520-clk-ap";
>  			reg = <0xff 0xef010000 0x0 0x1000>;
> 
> -- 
> 2.34.1

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
