Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F6DC83030
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 20:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kOD2WYNROfpQR7K8ZTWf8R1nU7Ny+Ab3ezimpucgfw=; b=dHDY/MMIjxVIAB
	KHAg5/IRjWoaeNyyOeTGwSOgVJHjwS2179vz+7crrpLurXqxJ8M3KwjJktIaGktYQIZa6TdbDB9TA
	ORGVNSXNxM+JMn9+frhUHXxJJ2r6mnXEwmL0la+LrqsVIYh3tFY8dDzk3g6kD83BP+7b14vQ5fH6+
	i3PdNvX/0j+tSRfDQMJOZb/vIHWWXbCF6kCFEh993/3EAOXJBu+69Olo8dgJvRn/fx2Ze/cm8KQeu
	4DjXujeb4hPE1eK2ZOqu89eS0ln1Hhq7JYCO0Zw5hPmJk5wuiD9FqGhN726EMrPT4/p8rC5X06Z7R
	2Fd1+6ndWYUQjGynBySg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWL69-00000003OjM-0keE;
	Mon, 30 Jun 2025 20:27:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWL66-00000003Oih-49sJ
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 20:27:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3C79A5361D;
	Mon, 30 Jun 2025 20:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FFEC4CEE3;
	Mon, 30 Jun 2025 20:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751315245;
	bh=mm6D6rN9YCLi05ZkS4Yr8AiNEs/PMDAf3hD+0ETdEvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9/a6/NxFgycREwnlDhrZgtvp8pAFZImQNec5/c/twV2DgQ0znTyfrop3lQKZeZ7h
	 fgQ39nnpkRhWhAyw5J5AKzgtDzpQvA8Z6tMKD+u2aCTt3+GoDm8ccE4Xg5Q9i1qZUL
	 +AD2WCWeY8ARVpccuvjwuKYMzBHzXkqT3laSqVLK03++8wYeeec8cBrN+EjhvUvlLZ
	 T9RKDw2/uEOdkpuEHNebR6fa64ajz0bL7erRyjy6bsF3BlvXYHo+XO1du383Eg2Cjc
	 pjDM2rlbVJL/SPYAj2u0PIRbIwo4D6mqHolSxIp6xoG2RrlsNvRZAJD3WF1ySGItIF
	 otdth+1F2/mOQ==
Date: Mon, 30 Jun 2025 13:27:23 -0700
From: Drew Fustini <fustini@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Benno Lossin <lossin@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 8/9] riscv: dts: thead: Add PVT node
Message-ID: <aGLzK8wTFcWuR4Zv@x1>
References: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com>
 <CGME20250623180907eucas1p10c0ca6b667debcc8139402d97e4ef800@eucas1p1.samsung.com>
 <20250623-rust-next-pwm-working-fan-for-sending-v5-8-0ca23747c23e@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623-rust-next-pwm-working-fan-for-sending-v5-8-0ca23747c23e@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_132727_167570_35743C53 
X-CRM114-Status: GOOD (  15.62  )
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

On Mon, Jun 23, 2025 at 08:08:56PM +0200, Michal Wilczynski wrote:
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
>  			thead,pad-group = <1>;
>  		};
>  
> +		pvt: pvt@fffff4e000 {
> +			compatible = "moortec,mr75203";
> +			reg = <0xff 0xfff4e000 0x0 0x80>,
> +			      <0xff 0xfff4e080 0x0 0x100>,
> +			      <0xff 0xfff4e180 0x0 0x680>,
> +			      <0xff 0xfff4e800 0x0 0x600>;
> +			reg-names = "common", "ts", "pd", "vm";
> +			clocks = <&aonsys_clk>;
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		gpio@fffff52000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0xff 0xfff52000 0x0 0x1000>;
> 
> -- 
> 2.34.1
> 

The PVT sensor is useful for more than just the fan so I'm okay with
taking this even though the PWM driver has yet to be accepted. I have
applied this patch to thead-dt-for-next [1] as commit c31f289 [2].

The required clk driver fix has been applied to thead-clk-for-next [3]
as commit 0370395 [4], so PVT sensor will be able to be tested in next.

Thanks,
Drew

[1] https://github.com/pdp7/linux/commits/thead-dt-for-next/
[2] https://github.com/pdp7/linux/commit/c31f2899eab084b3557e9f9e10fc7898113ef18d
[3] https://github.com/pdp7/linux/commits/thead-clk-for-next/
[4] https://github.com/pdp7/linux/commit/0370395d45ca6dd53bb931978f0e91ac8dd6f1c5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
