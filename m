Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F8EC04A95
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Oct 2022 12:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKWWfjSzF8WlguQuhLnHuBMZp1LzfqB+0nT1UbHjolc=; b=LeVI00ZoQqWXsR
	lKTLKJte4GJpz5p0SkNXzhT8PIzuCok8/sGkKcnVX3e8YghP5cxsT2w55W8mZtawMrR10KRWM2C0o
	udcUESbk7/tUwoydkHM7T+PODZWpz2cwhj/MGp06GaGMQbA/AaXgRqBIjKDmwIk1MJre+7OShCG4c
	koHO6akV3txSPEbjBXUWTbj112m3RnApgWgc/JuywuT8mxD+ylp6lQOi7ArGRnk/8JRTu3FZQNuo/
	pdyfwZx5gxeWkHRBFBd5h71HrwOJGzPH2/i131VYWKI5q0bYlVuwlW1YuJA3Y3oeJQrLn/K8ePFoR
	K5kV2c+sIhV6wS9AxfWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omDXS-00CZi6-GJ; Sat, 22 Oct 2022 12:23:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omDXP-00CZga-1c
	for linux-riscv@lists.infradead.org; Sat, 22 Oct 2022 12:23:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6502A60DE5;
	Sat, 22 Oct 2022 12:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE888C433C1;
	Sat, 22 Oct 2022 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666441413;
	bh=32yzXNpBtDdt3SRjly46VTH7IAm6cK3dN6rsTopAPks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dx60zoKiuo/+OPUi7OaO2iRz26IKWTwOvCuxtSKKG23C8hVeP3YshJEUgYDFW1mIn
	 EZv7I7dEIUuxZnTJmTXa7nlOx7cfavpApmeGzyw/zpQ/prP4GTH1O9vJP1X4uDx9qL
	 OdnhKdh9HTz787XTxO9lMoSHBPtrsUy6Ye7TyCpyFcKTS7C4HBm1mKxCsGmorOxx/H
	 A/H0UBChqQ0AzmtCEiIQqZxoooVjJcplzUOoFtOztbhnGjgR5vC+HpgGapUiHY4Iug
	 MiNqlpUFRlUZO/TXgZfYdNTIkwpKB0mFB7wOOBYkeLVDZEnCmaR+GZqYLxrLJjEHvU
	 QvvcQgicz/QrQ==
Date: Sat, 22 Oct 2022 13:23:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: icicle: Add GPIO controlled LEDs
Message-ID: <Y1PgwLMbZAr7hOhq@spud>
References: <20221020083854.1127643-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221020083854.1127643-1-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_052339_145406_AC0CCF74 
X-CRM114-Status: GOOD (  18.04  )
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

On Thu, Oct 20, 2022 at 10:38:54AM +0200, Emil Renner Berthing wrote:
> This adds the 4 GPIO controlled LEDs to the Microchip PolarFire-SoC
> Icicle Kit device tree. The schematic doesn't specify any special
> function for the LEDs, so they're added here without any default
> triggers and named led1, led2, led3 and led4 just like in the schematic.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Hey Emil,

I applied this with a a minor modification to the subject & a
s/This adds/Add/. Messing w/ my setup so no b4-ty mail, but it should be
here:
https://git.kernel.org/conor/c/0d814000ad3589bf4f69c9cb25a3b77bbd55ffec

Thanks,
Conor.

> ---
>  .../boot/dts/microchip/mpfs-icicle-kit.dts    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> index ec7b7c2a3ce2..11ba4417f11a 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> @@ -5,6 +5,8 @@
>  
>  #include "mpfs.dtsi"
>  #include "mpfs-icicle-kit-fabric.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>  
>  /* Clock frequency (in Hz) of the rtcclk */
>  #define RTCCLK_FREQ		1000000
> @@ -31,6 +33,34 @@ cpus {
>  		timebase-frequency = <RTCCLK_FREQ>;
>  	};
>  
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-1 {
> +			gpios = <&gpio2 16 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_RED>;
> +			label = "led1";
> +		};
> +
> +		led-2 {
> +			gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_RED>;
> +			label = "led2";
> +		};
> +
> +		led-3 {
> +			gpios = <&gpio2 18 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_AMBER>;
> +			label = "led3";
> +		};
> +
> +		led-4 {
> +			gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_AMBER>;
> +			label = "led4";
> +		};
> +	};
> +
>  	ddrc_cache_lo: memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x80000000 0x0 0x40000000>;
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
