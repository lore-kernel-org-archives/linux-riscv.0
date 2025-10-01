Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB788CAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 20:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUM64H0iXKESw2JXx10rhS3xQcwn89GkixzQS5/LzaA=; b=BNzU3pa6IGxKYd
	886TdLgvJ6aUwOIc7SzUoxFPJJfQGeTae+F4LelWsQH13Vto2lGzPtRmrRQAHdpUD8qTRyo2EBya2
	cc6u46EjZ2qHJTtkLdE+DJLXujkyki7JmYzLBySEuJZEhUqWlKcmHKNniJxvtkeJ2WSNOmJE5TCXV
	Bt8bkQak3uDetM3mguELwrRKA2332pOx+E9Tz2qq0YHXU0QLiUtNm3lM+7Ho7PmeGJS64Nc9xvoRf
	8RXz9I3i4DAQmP6mVS/VVyzPjiFicmCw2IxSZHxjxEJfQ90HwnnPUXGvMXOD9ZoyovIVnE5h4oY5Q
	lztRDT2C+lH9xvpB2Thg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43vD-00000008y24-2RKm;
	Wed, 01 Oct 2025 20:59:35 +0000
Received: from mx-out2.startmail.com ([145.131.90.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43vA-00000008y0t-32y4
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 20:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=startmail1; t=1759352369;
	bh=8dfCwcgkSDoAftKvUS9KyrBMUlCrd2D7DWmwBmaRRbU=;
	h=Date:From:To:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To:From:Subject:To:Date:
	 Sender:Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:
	 List-Unsubscribe:List-Unsubscribe-Post:Autocrypt;
	b=VLHTImUaYmGsqK6+nUVqXxljt6D0gCXGdthsOzZkJf1d1FZ6lAdejKxrGy//fMxnp
	 AUa1isgj6G05rsLrRfxvBF0AAHdg1MYBTQrxgeMTsNEHqglmdkMYLnhoH64WLXAGN8
	 fJ3zQG+fRc78/Xs8WAfNAeggjnUkFhSMsjsCjvvB80WAh07+fBpi1Bq/RZCLDdSz0B
	 Bcr7g56tFMcIgz496CPwxw/f3WbPGPotmGh5BHZpxKurH83JaJ3EYb75TklzkQd61u
	 WHpuaJH7NywGWRqRjT0DbKyNrNuo9DCg90CDe9FzHo1l1fXVpCa4J1ghNXDD4to+lm
	 NaLONDU3z4n3A==
Date: Wed, 1 Oct 2025 20:59:26 +0000
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
Subject: Re: [PATCH v15 5/7] dt-bindings: pwm: thead: Add T-HEAD TH1520 PWM
 controller
Message-ID: <aN2WLimu68NyqxJG@archiso>
References: <20250930-rust-next-pwm-working-fan-for-sending-v15-0-5661c3090877@samsung.com>
 <CGME20250930122735eucas1p1c49ed11a4a48155c123ead6aec4b64a2@eucas1p1.samsung.com>
 <20250930-rust-next-pwm-working-fan-for-sending-v15-5-5661c3090877@samsung.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250930-rust-next-pwm-working-fan-for-sending-v15-5-5661c3090877@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_135932_902249_17A300EB 
X-CRM114-Status: GOOD (  14.31  )
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

On Tue, Sep 30, 2025 at 02:20:36PM +0200, Michal Wilczynski wrote:
> Add the Device Tree binding documentation for the T-HEAD
> TH1520 SoC PWM controller.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Drew Fustini <fustini@kernel.org>
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
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
> 
Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
