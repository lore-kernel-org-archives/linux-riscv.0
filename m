Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1769FA3741
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 22:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QjJf5sZt8rqTjSSjcHVYYopeA9fWZL3QNbyGqVlGJMY=; b=SKToTNHmrZyPklrF9jv5TlZ8WC
	ZuMQwkONTkjEzE1wIUd+n7OBA7WNtE8u9zEd8GdlqpBOljYjUDJvkJYO6BbPLGnTSvYN/xtwLZOsd
	RaSXrXHjM3NFbT+ruQMkdPVmRQGi7AqDBJmFqG9LYYmsAYB0qLTJAYuKXZMOKhb2U9xoBO9iu66h7
	jtKJ8qgxbuhL94PGycfKIcpxaL/mn45rgKxdNvbqMJ2YQz997QjnENllEuQ+K6u3oEFkVEmCCVdEf
	KlO3atR7MZRo31fvNoAvFCmPFl1Ss/mkgDQBuhhgINlraJ0TdtKE4NiaVJ1B2nBGTty5JXEEO81Ki
	3ztzcwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooY8x-003Byn-Hj; Fri, 28 Oct 2022 22:48:03 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooY8u-003BxM-R9
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 22:48:02 +0000
Received: by mail-pg1-x530.google.com with SMTP id q71so6013900pgq.8
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 15:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUbdrJIexM2PmxhWqwHeRbpmJO2wc72laJAHiT+SdrY=;
        b=SXhC0xT0j1O3099HzLxYhiDHa0sl/KIFOG53mQzJmSQbCJ1VIp02ViUAjZ4gJ73sY4
         T156y9oNY0K7tsJbRJysN7MKJFoRWhWmDZdqulVJe1c51T6qBf9krTbEf6R1hyVVSyJ9
         m9bfFrOBxREcd6U39/u7VuQMqm/RMhABTEF0Qo2emZ2VPwtCkNg0YZaCKZ3NZUyRSP8L
         wesUOl7ThlMVpv4jloQhhkC6tEjaf1vNeTc9g/5JnnVOyZQl2eAIR9rFHdiybQ46NeL8
         hzJln7utJvAkvtP2TW4A2WyzGXhotujxdM+7sqCXGHF7Hfsd9Vdheton1YV9RAowc9ZI
         gNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUbdrJIexM2PmxhWqwHeRbpmJO2wc72laJAHiT+SdrY=;
        b=Zezm1EYj8QHPa1WKfNUG6lBBKpJrr9LOX70iXGe7kVW7z3gS/1VvNl7QhofjNfqc8G
         8gYv6NwIfC36s3igIGVmYIjE93RxcbrAiV8w6l7Tq8t3rZrkPMBupDkuX70swjbCC9eU
         DenjQT/w5qBHiBlazh19g6hbwlwUYZ88umRgVuclnrGur43UISmVy3zRE1o7shghckaG
         LawCChkNQ/7iKxbV+pMBforXMgOTzmPGHmXx1PU9LgxSKBNmESHfm8IfXdebBwnJz3Uj
         UEphvxLZMJN13yHbuxxiKutLnAjX5rrYxdhr4b5ij9+tpmA5vhlBT82y+gV6+2qDSUCx
         cKng==
X-Gm-Message-State: ACrzQf2OpGmqPwlqvPLVYiI4rufKVr3Cjl4hJOc8cxsQ62gNeMMJjWZM
	VQS+epVTYMgccGOlUv4V97aXHShaqn8oPA==
X-Google-Smtp-Source: AMsMyM5wcdv4vaAvLa/8L59ro1q5+Z6ez29oP4z6iKYbz+sl1LRtZmebdPWN2bVwnC6jdfsXR0fnZQ==
X-Received: by 2002:a63:5a1b:0:b0:461:9934:6f62 with SMTP id o27-20020a635a1b000000b0046199346f62mr1606820pgb.266.1666997278953;
        Fri, 28 Oct 2022 15:47:58 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q6-20020a17090a178600b00210c84b8ae5sm2992406pja.35.2022.10.28.15.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 15:47:58 -0700 (PDT)
Date: Fri, 28 Oct 2022 15:47:58 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Oct 2022 15:42:40 PDT (-0700)
Subject: Re: [PATCH v1] riscv: dts: sifive unleashed: Add PWM controlled LEDs
In-Reply-To: <20221012110928.352910-1-emil.renner.berthing@canonical.com>
CC: linux-riscv@lists.infradead.org, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, alexandre.ghiti@canonical.com,
  bin.meng@windriver.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: emil.renner.berthing@canonical.com
Message-ID: <mhng-a36f2ace-57aa-4bd0-811d-c3aaa3018969@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_154800_898659_04F538B4 
X-CRM114-Status: GOOD (  19.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 12 Oct 2022 04:09:28 PDT (-0700), emil.renner.berthing@canonical.com wrote:
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

IMO fixing stuff for old boards is great, particularly if they're broken 
upstream but supported by distro kernels -- that's kind of a messy spot 
to be in.

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
