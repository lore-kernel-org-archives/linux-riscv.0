Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0498C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 18:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=orQvVi4qs5FOyWhCgFkmRR1eJEC+4IOqeCk/7InV/2c=; b=v3KZqG8Q5R9a3v
	8mqGuH9w38qKR5AJz0hLIieDFvIzb792KsUZ+ix+14iuluVotCxiCbB/29zqWhdXzXis/KgMpurEw
	P/s44Vkm4/ijXvd4rKFUPyCWLwipVAygZQEm8FncHP0z9nQ8ZuBPvb/rdIM5knOtNDVlKoyA4SSTG
	tiaxl+dzsEEKVmwsSEvJ0KdWZT30sXe/iPthkAWVhMvM7d2IvoG4oavxR5R3WaMP0yLUOyt/dDuKM
	uH5o0vBQYJDqQzeN32p/kOE9ynv9/0t4hX/VGUROT89y0WzvfsGmIIEWeqJ1yIS+KPFoBYJYeUfdb
	TZGR3qCuHU8fLXg1CILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigHf-008xZu-0W; Wed, 12 Oct 2022 18:16:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigHb-008xYx-VR
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 18:16:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 69220B8161D;
	Wed, 12 Oct 2022 18:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3302C433D6;
	Wed, 12 Oct 2022 18:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665598601;
	bh=njqsGfY/Ky3JVGMiS1t2SsK1cQbO3ajg+b5VYn5YLhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JAxG+GqtIRT+kWAS9WEr6WzSOwCaFxCxO7b05swAq0QvhU1Ot2RXPgVPxgPnAboc6
	 b0oiKsHhiPjh/TsvTlUUoVLosVFwEkvurobiMs+nBfYi3xKCsoqs6V9SlHl7NZ0RN0
	 /0sRjojU9BR42RRTMrf3b2YRriB/u+zRMrkicOJp7BV1pLnHYAzGJnCdNiklM/Axgq
	 JwWi5mGYGznLJemfk1nWyD8ZWMO9AmeaxplqCAcIH8YSfMss0HDfgmOUEW0Mb0pzWQ
	 DekmCLsJzMrLi4rI3Rd/p792Cm8jPIUyLxrALVTz7jA/RmiARn4HASy/PYuJ0hs56m
	 0WIlUaN1DadkQ==
Date: Wed, 12 Oct 2022 19:16:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Bin Meng <bin.meng@windriver.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: sifive unleashed: Add PWM controlled LEDs
Message-ID: <Y0cEhK+oDPpLiaFJ@spud>
References: <20221012110928.352910-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221012110928.352910-1-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_111644_323721_96F856DB 
X-CRM114-Status: GOOD (  20.00  )
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

On Wed, Oct 12, 2022 at 01:09:28PM +0200, Emil Renner Berthing wrote:
> This adds the 4 PWM controlled green LEDs to the HiFive Unleashed device
> tree. The schematic doesn't specify any special function for the LEDs,
> so they're added here without any default triggers and named d1, d2, d3
> and d4 just like in the schematic.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
> 
> Yes this board is old, but I'm trying to get rid of custom riscv patches in
> the Ubuntu kernel.

Old maybe, but some of us still have them ;)
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Twiddled the sysfs knobs a bit too so:
Tested-by: Conor Dooley <conor.dooley@microchip.com>

> 
>  .../boot/dts/sifive/hifive-unleashed-a00.dts  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index ced0d4e47938..900a50526d77 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -3,6 +3,8 @@
>  
>  #include "fu540-c000.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pwm/pwm.h>
>  
>  /* Clock frequency (in Hz) of the PCB crystal for rtcclk */
>  #define RTCCLK_FREQ		1000000
> @@ -42,6 +44,42 @@ gpio-restart {
>  		compatible = "gpio-restart";
>  		gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
>  	};
> +
> +	led-controller {
> +		compatible = "pwm-leds";
> +
> +		led-d1 {
> +			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
> +			active-low;
> +			color = <LED_COLOR_ID_GREEN>;
> +			max-brightness = <255>;
> +			label = "d1";
> +		};
> +
> +		led-d2 {
> +			pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
> +			active-low;
> +			color = <LED_COLOR_ID_GREEN>;
> +			max-brightness = <255>;
> +			label = "d2";
> +		};
> +
> +		led-d3 {
> +			pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
> +			active-low;
> +			color = <LED_COLOR_ID_GREEN>;
> +			max-brightness = <255>;
> +			label = "d3";
> +		};
> +
> +		led-d4 {
> +			pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
> +			active-low;
> +			color = <LED_COLOR_ID_GREEN>;
> +			max-brightness = <255>;
> +			label = "d4";
> +		};
> +	};
>  };
>  
>  &uart0 {
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
