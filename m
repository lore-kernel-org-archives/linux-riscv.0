Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8680FC47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 10:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I/jBZuIvp4SuFGki31mm4s70SG4+oVHFMjLYR+AQhVk=; b=VZ/tffLbzFZfe/pmCvpFgl75s0
	i4zNJM5IU191hM6uHsrgNxofO/JiuQNcezDkXaTIuT9c2w5exoRb8EHIUB7u0mBexdqsBllYtVMEf
	QbLqu+kF2LmcoUxDqb56zVOn7q5/MWsL70NuS7188rbbnxtJO5qsQFvmH1v7sAaGXR8iM4BfeAj5h
	n8glW/t6LMcyNgWfieZiKtCt26LU+8XixIWfnsBhoHTBLkFmvWSbvMkQgzS6FXis+IqYADCtBM+M6
	6mRrdu2EStAmyYqkDJCj429Ryej3cHfVmtd4ywvPfjLq1MhIzAXb6zIoIBIkMPj641Z0t850AA4Ta
	nIS8AdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPgZH-00BfF9-1j;
	Tue, 16 Jan 2024 10:21:15 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPgZD-00BfEW-0k
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 10:21:13 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EEE973F272
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 10:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1705400459;
	bh=xU+S+uXFFj2cwv3uk43aNu2KbGErrv7KCMlpZ+iS0ZQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kpHNPqFejZke64zOWf2zxi+lbiuNCMCJojW0Ct0GdDMO+82GoqKeG34bOH8oxcKqK
	 6My5kg/DyaEhpprQPMI7WVQ2LSGB6iIGFdld7SrlG30lCDPhGfhD2jL7k20ryjWXCK
	 czdIe8uq6lPuyU48nRCrsEhOKdySM/lcO86X4+1LPXnDYI9WpG6xRuxSyIck0Jz/na
	 P7ZtEsTF7Jrn+zx/0HNhBEosloaR0mcY6YUEfLh1FdUy2dOzWvvEzHT4gw8PdJCjon
	 IiOkT02FbqdFkzt4eSsnDUUWh9OvD+hzR1tIOS71JTqDgj6O5PPm78UfxdB0ACHxxZ
	 oL2Osk49yWyWQ==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-78330275051so1026518485a.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 02:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705400458; x=1706005258;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xU+S+uXFFj2cwv3uk43aNu2KbGErrv7KCMlpZ+iS0ZQ=;
        b=B7JPKultydMGW3fUCUYWS29VAoxXgr7LIyzqX+7PC0KgYnGfKa3iQ+srMbtTJ4WWj5
         alhXsWhMuwki/FL1pNC9cY6wIUcu2Xqff9cq/xLEAvmTAlqrq1lJI4TyzDk3k0tlTuX0
         InViFz5aWSfCsCzZeQ+4eUerp4jCxHvab63/EwSXtJqJl3HFX5hD+KMNt1Ez8eQ/uL/f
         sbU1XyFiTj0n7MIJMf1C4NMI9OVHAK4h6VoH5ZwtKhWui6Vowt+fKqliz/j/o28cImp6
         BzE2H5gshUuYt7sBcvy9d+rrLhIXuMqXaCEZnPDrt4G9jVRUwJu9sgQJFlp2B/TCHEpu
         K7QQ==
X-Gm-Message-State: AOJu0YxdajqUw2p1hcwpOTVwRBs24q1Cda9xizzTdpWX91Cz51NV3zSq
	0KYYm553MVjNDwfca/05XO9k6t7tO2tbJMHIbf2FV+hz0x8kvX7rZaWDVxVp+Q3vsoQHxLWGt8D
	hEW8cmcrLbUtfXdZL+3JBRwh2ZNnP9tV8n1JciTPVuURT9pPlMCQdVTHpPhmlqOkXqMIy
X-Received: by 2002:a05:622a:314:b0:42a:9f3:f98f with SMTP id q20-20020a05622a031400b0042a09f3f98fmr59864qtw.31.1705400458726;
        Tue, 16 Jan 2024 02:20:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyHQK1zxeZizu8qJrW9Hsx4AGxq9c2N/E+5X7YH8Yr1ZSbWwOhH277LwZ3NAq14oAPDip5nwCUUFeB0BgriaE=
X-Received: by 2002:a05:622a:314:b0:42a:9f3:f98f with SMTP id
 q20-20020a05622a031400b0042a09f3f98fmr59852qtw.31.1705400458380; Tue, 16 Jan
 2024 02:20:58 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jan 2024 02:20:57 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240116041054.11641-2-nylon.chen@sifive.com>
References: <20240116041054.11641-1-nylon.chen@sifive.com> <20240116041054.11641-2-nylon.chen@sifive.com>
Mime-Version: 1.0
Date: Tue, 16 Jan 2024 02:20:57 -0800
Message-ID: <CAJM55Z9ZbmbPKaJ8LJ5KyoCW9fAEJaT3Q4PbcadwLNCq1NXbxA@mail.gmail.com>
Subject: Re: [v6 1/3] riscv: dts: sifive: unleashed/unmatched: Remove PWM
 controlled LED's active-low properties
To: Nylon Chen <nylon.chen@sifive.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, 
	u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com, 
	aou@eecs.berkeley.edu
Cc: zong.li@sifve.com, vincent.chen@sifive.com, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, nylon7717@gmail.com, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_022111_683239_2CA7195C 
X-CRM114-Status: GOOD (  15.48  )
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

Nylon Chen wrote:
> This removes the active-low properties of the PWM-controlled LEDs in
> the HiFive Unmatched device tree.
>
> The reference is hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf[1].
>
> Link: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf [0]
> Link: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf [1]
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Co-developed-by: Zong Li <zong.li@sifve.com>
> Signed-off-by: Zong Li <zong.li@sifve.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  8 ++++----
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
>  2 files changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 900a50526d77..11e7ac1c54bb 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -49,7 +49,7 @@ led-controller {
>  		compatible = "pwm-leds";
>
>  		led-d1 {
> -			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
> +			pwms = <&pwm0 0 7812500 0>;
>  			active-low;
>  			color = <LED_COLOR_ID_GREEN>;
>  			max-brightness = <255>;
> @@ -57,7 +57,7 @@ led-d1 {
>  		};
>
>  		led-d2 {
> -			pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
> +			pwms = <&pwm0 1 7812500 0>;
>  			active-low;
>  			color = <LED_COLOR_ID_GREEN>;
>  			max-brightness = <255>;
> @@ -65,7 +65,7 @@ led-d2 {
>  		};
>
>  		led-d3 {
> -			pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
> +			pwms = <&pwm0 2 7812500 0>;
>  			active-low;
>  			color = <LED_COLOR_ID_GREEN>;
>  			max-brightness = <255>;
> @@ -73,7 +73,7 @@ led-d3 {
>  		};
>
>  		led-d4 {
> -			pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
> +			pwms = <&pwm0 3 7812500 0>;
>  			active-low;
>  			color = <LED_COLOR_ID_GREEN>;
>  			max-brightness = <255>;
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index 07387f9c135c..b328ee80693f 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -51,8 +51,7 @@ led-controller-1 {
>  		compatible = "pwm-leds";
>
>  		led-d12 {
> -			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
> -			active-low;
> +			pwms = <&pwm0 0 7812500 0>;

Here you remove the active-low property, but you don't above. I'm not sure
what's the right thing to do, but I would have expected the same change in both
places.

/Emil

>  			color = <LED_COLOR_ID_GREEN>;
>  			max-brightness = <255>;
>  			label = "d12";
> @@ -68,20 +67,17 @@ multi-led {
>  			label = "d2";
>
>  			led-red {
> -				pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
> -				active-low;
> +				pwms = <&pwm0 2 7812500 0>;
>  				color = <LED_COLOR_ID_RED>;
>  			};
>
>  			led-green {
> -				pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
> -				active-low;
> +				pwms = <&pwm0 1 7812500 0>;
>  				color = <LED_COLOR_ID_GREEN>;
>  			};
>
>  			led-blue {
> -				pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
> -				active-low;
> +				pwms = <&pwm0 3 7812500 0>;
>  				color = <LED_COLOR_ID_BLUE>;
>  			};
>  		};
> --
> 2.42.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
