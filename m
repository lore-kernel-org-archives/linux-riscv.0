Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA37CAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 21:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcbblCr9ByV0Mbj9JHyzkJPJ13N/X4amqyBomUK9ZNA=; b=4a0DVb/dnAeuhl
	CptLnD9uWa+YmKzNFESKQA3mLMfrUa7B0cVGDXxmK4cGeIfd3Wpmj+IfO+pwIH7oC3Wam2SC9yWw/
	c5Hfjt+nqG7dAloovs1noINsracAPbn0VrQR4oBPwhIDwVTjdl5ZctNPAYze9GSpGpSA/F20zPTgN
	ZHxfQfBvcERL6K+PbvsVtm2gTI4G6V5GMfc7Ft4gvWroiAeXjmDz0PMw7lKUT0Ll3c2FPgmMwaaR4
	S6C0YV0j0F3tTVWSf4jKt9gxXDOTIa+S2H2KydbUVk5E/ZFpyd0yBoyjMh6M8H1EiXhnokWBFP4ML
	l59Lc89kpSemMgAuN8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43w2-00000008yFk-4BMB;
	Wed, 01 Oct 2025 21:00:27 +0000
Received: from mx-out1.startmail.com ([2a02:22a0:bbb6:1d00::1001:2525])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43vz-00000008yDy-3BgU
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 21:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=startmail1; t=1759352421;
	bh=omvTbOOO6blAUUDT41IFfrpds2YN8KtJB4Y6/99fD5w=;
	h=Date:From:To:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To:From:Subject:To:Date:
	 Sender:Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:
	 List-Unsubscribe:List-Unsubscribe-Post:Autocrypt;
	b=YldTa0CJfdILoG1R5UcB0m6FtP3D4DDAlJ73Y1Xuinh+ita5kCpIMX4EchAJB9aEH
	 lAuc0FXIc54G0gW/3bKtk8k6nMbPB+bZ3qvNumahjoD0OmJ9ZJE36VCNb9cKr5kmpN
	 GpLL4EzyVi2dflE0SOHMN8/aEVVWD5QZVKjqV5Jhqttw+bccaX7YP8jAP4HD389D5q
	 ULlps7z09UAXJ51SOOfwrgE2RRu0lZLfroaZVOp8Pn9SjBCdLfxjKFZl+O3WrP51D6
	 /63Sbrlh71hKJZ4REUum7ZXVOZO0mCmEFE3keiYw+CNAD0qo2jhIP9sqwUt4k3SJQN
	 DZsXzwQuDjGug==
Date: Wed, 1 Oct 2025 21:00:18 +0000
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
Subject: Re: [PATCH v15 7/7] riscv: dts: thead: Add PWM fan and thermal
 control
Message-ID: <aN2WYmcYHHZSccPm@archiso>
References: <20250930-rust-next-pwm-working-fan-for-sending-v15-0-5661c3090877@samsung.com>
 <CGME20250930122738eucas1p2ee9244532b39860f982fd7daa4cf788e@eucas1p2.samsung.com>
 <20250930-rust-next-pwm-working-fan-for-sending-v15-7-5661c3090877@samsung.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250930-rust-next-pwm-working-fan-for-sending-v15-7-5661c3090877@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_140023_938968_CE0C97DE 
X-CRM114-Status: GOOD (  13.83  )
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

On Tue, Sep 30, 2025 at 02:20:38PM +0200, Michal Wilczynski wrote:
> Add Device Tree nodes to enable a PWM controlled fan and it's associated
> thermal management for the Lichee Pi 4A board.
> 
> This enables temperature-controlled active cooling for the Lichee Pi 4A
> board based on SoC temperature.
> 
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> Tested-by: Drew Fustini <fustini@kernel.org>
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 67 +++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index 4020c727f09e8e2286fdc7fecd79dbd8eba69556..c58c2085ca92a3234f1350500cedae4157f0c35f 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -28,9 +28,76 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <1000>;
> +			thermal-sensors = <&pvt 0>;
> +
> +			trips {
> +				fan_config0: fan-trip0 {
> +					temperature = <39000>;
> +					hysteresis = <5000>;
> +					type = "active";
> +				};
> +
> +				fan_config1: fan-trip1 {
> +					temperature = <50000>;
> +					hysteresis = <5000>;
> +					type = "active";
> +				};
> +
> +				fan_config2: fan-trip2 {
> +					temperature = <60000>;
> +					hysteresis = <5000>;
> +					type = "active";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map-active-0 {
> +					cooling-device = <&fan 1 1>;
> +					trip = <&fan_config0>;
> +				};
> +
> +				map-active-1 {
> +					cooling-device = <&fan 2 2>;
> +					trip = <&fan_config1>;
> +				};
> +
> +				map-active-2 {
> +					cooling-device = <&fan 3 3>;
> +					trip = <&fan_config2>;
> +				};
> +			};
> +		};
> +	};
> +
> +	fan: pwm-fan {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fan_pins>;
> +		compatible = "pwm-fan";
> +		#cooling-cells = <2>;
> +		pwms = <&pwm 1 10000000 0>;
> +		cooling-levels = <0 66 196 255>;
> +	};
> +
>  };
>  
>  &padctrl0_apsys {
> +	fan_pins: fan-0 {
> +		pwm1-pins {
> +			pins = "GPIO3_3"; /* PWM1 */
> +			function = "pwm";
> +			bias-disable;
> +			drive-strength = <25>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
>  	uart0_pins: uart0-0 {
>  		tx-pins {
>  			pins = "UART0_TXD";
> 
> -- 
> 2.34.1
> 

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
