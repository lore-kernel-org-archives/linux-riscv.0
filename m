Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AEACA0EFA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 01:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1ghD18ekP9tHQ5FINF3AQTFn4ITAP1x7T7V7yoOHFQ=; b=xHDD0v2LH/8hUT
	+KfhHsyf5dspbsMs4xlzx9tbs/6uetWDxmtwir/5ZneeMk2vONiQj1S4y8wI2J16pYeuXuVCFCEJ5
	uXJXRa1hzMUBmomohXKtBhYSyyzQuITHgjWJhZngQEs0yr63mG7/1tqqeCnHJQ08Nz7kwK/uduSGf
	tpIKH9vcdBGB7EK05unTyZPeM6zuHqTpWqJPZ13R3ownYrTaQmb8R4TIzfWGgzWNR8zsmgoD+y66o
	Vy/k+EwlDnSxaqG9AFjvpG8Y2bekT3Gr9xRQ++v5YjTgw5ac0P/lZ2ikA2SE4cVOKmo3QXRyU93Yk
	MsmPbFNCzPjcNtHn347A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotrT-0000000FOo9-49Oq;
	Thu, 21 Aug 2025 01:13:03 +0000
Received: from mail-106112.protonmail.ch ([79.135.106.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqAa-0000000Ey7S-3Gr3
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 21:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=protonmail3; t=1755724588; x=1755983788;
	bh=GrowVB5MF8RNBNwUOvZofvnxbDvD4JbTvirhxl7xE1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kQMm3rIGRtZ2UZDa8nH+6paX7zsLGP4rBuWwjsRup9hpRLmC7MdxUGJiLuKiHXNyg
	 381gxbXrkDWdURQuBRW2Rtdz25GeipS++Qku5zR8LXB3NnWP92XxfjukSHyG94mvbP
	 7/1kzFc5I0YKW134r5YJmxF8tgRWHUZQyxjAFVgY1Y04h3bsAHC35w2aFBaXEWtSU2
	 L5P5BsmFAOjYg8ZE5hBfX21ZlDsjBJep2fJF1suNlJsEWoScDzTLVuyKk1/iAVMMDO
	 XG3BtLXtq19i/BBpah2h1URvK0wKAC1jq9LLSR22IqSuaDOAGo7HyD6DIg6QObofRO
	 ZRNnOsICam4fg==
X-Pm-Submission-Id: 4c6fQJ4sXMz2ScCq
Date: Wed, 20 Aug 2025 21:16:19 +0000
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
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v14 5/7] dt-bindings: pwm: thead: Add T-HEAD TH1520 PWM
 controller
Message-ID: <aKY7IzAg0IX4UfWW@archiso>
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
 <CGME20250820083546eucas1p2cc370ae89e7a87e3f3b9266967501b44@eucas1p2.samsung.com>
 <20250820-rust-next-pwm-working-fan-for-sending-v14-5-df2191621429@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820-rust-next-pwm-working-fan-for-sending-v14-5-df2191621429@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_141632_983961_3E64ECD7 
X-CRM114-Status: GOOD (  13.80  )
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

On Wed, Aug 20, 2025 at 10:35:40AM +0200, Michal Wilczynski wrote:
> Add the Device Tree binding documentation for the T-HEAD
> TH1520 SoC PWM controller.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../devicetree/bindings/pwm/thead,th1520-pwm.yaml  | 48 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 49 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml b/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..855aec59ac53c430adc849271235686e87b10e6c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/thead,th1520-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD TH1520 PWM controller
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    const: thead,th1520-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: SoC PWM clock
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      pwm@ffec01c000 {
> +          compatible = "thead,th1520-pwm";
> +          reg = <0xff 0xec01c000 0x0 0x4000>;
> +          clocks = <&clk CLK_PWM>;
> +          #pwm-cells = <3>;
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d79dc21f22d143ca8cde6a06194545fbc640e695..a64027f441e8e23c579b469b2451b514e5d2802c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21732,6 +21732,7 @@ F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
>  F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
>  F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> +F:	Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
>  F:	Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
>  F:	arch/riscv/boot/dts/thead/
>  F:	drivers/clk/thead/clk-th1520-ap.c
> 
> -- 
> 2.34.1

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
