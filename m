Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEABCA0EFF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 01:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhI41oZLNXN9wte5NwoUkA0dKmOgJGpgf1znmUMDAE4=; b=y7wUjtJkfYIL4l
	gCFvnGjiGgefPUKG+Ql1DGyZSyK/30aYY9KbFc6vsjKgLUarUoHj5xcUNUjOvr4KR4/tAV22rpdBE
	ywuf40vYn99lJXR2Dre9tNXgxgLDjC2CplpszjlVQIXncthay2OdZEEvVe+MY6yjfYCWdLUsz8sG5
	0lFLmDhZMFHgmu7ZhcFDu8V5cUPoE5odUHzYw0/YOV1AakQ5s08L5jQa++Rf4sD8lWXwaJzibMxZw
	o7GpkS/SpLOpaZhysQGv9UH21bzsE2tReSMqjPiOX6Ca35FXRX8IDar0VuxYYHHPfOsCCYA2ClQdF
	z/1Z5e2WbBkorFzhdM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotrV-0000000FOpb-2GRi;
	Thu, 21 Aug 2025 01:13:05 +0000
Received: from mail-244106.protonmail.ch ([109.224.244.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqCT-0000000EyMV-3kfc
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 21:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=protonmail3; t=1755724706; x=1755983906;
	bh=JSAu0mbSO2Oo3ckHfGpNPMrfRcVmm1IBIVSUbO2haro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mRLvGFFVkHAjPY6dW6j4TC3cu15UDw7jn+8RL+wwYwFZnPibfP9rIdPa5JoSZqdeW
	 hTwbO0p0XfJIKGVSKxmHOvoxIF5tgYrdKTw+wA5DVRCApljOBOZiHvHn5nd79Q4Xps
	 ifGPh8vOhsgomfFKt0jegcZgLAuYJZmNeLAWlI96R3J6sBOzhVUCNc0LY3UKKkLggO
	 SQNWmv3GezO8JbPcImZhi80xrGooKo2tKBq1NaMkG4D7r3BuSzwGbgkbdrRerZgJNV
	 VUbbzhV+5ABBsao24jlN85kZOkSq4tRBTNL8D8h7UrlAklZtkQ7c+VoUnwdqrh9IPF
	 thz5dnIvz+tmQ==
X-Pm-Submission-Id: 4c6fSc1kpbz2ScPD
Date: Wed, 20 Aug 2025 21:18:18 +0000
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
Subject: Re: [PATCH v14 7/7] riscv: dts: thead: Add PWM fan and thermal
 control
Message-ID: <aKY7mnaQwZtgqryR@archiso>
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
 <CGME20250820083548eucas1p2a40775d53dfd9f8608671cc20003fd7d@eucas1p2.samsung.com>
 <20250820-rust-next-pwm-working-fan-for-sending-v14-7-df2191621429@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820-rust-next-pwm-working-fan-for-sending-v14-7-df2191621429@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_141830_081278_3EFDE99C 
X-CRM114-Status: GOOD (  13.24  )
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

On Wed, Aug 20, 2025 at 10:35:42AM +0200, Michal Wilczynski wrote:
> Add Device Tree nodes to enable a PWM controlled fan and it's associated
> thermal management for the Lichee Pi 4A board.
> 
> This enables temperature-controlled active cooling for the Lichee Pi 4A
> board based on SoC temperature.
> 
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> Tested-by: Drew Fustini <fustini@kernel.org>
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

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
