Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF0BC83F11
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 11:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ju2lYIudyrtz48aQJTbViuXL9NMkOr2iL/Gw5IrkrM=; b=eTksbODyACKrbP
	/uWRzJ9doQeQnRjxL9saMjsoLUBURsM0OFriRqacj1t4QxdRJLJItwp/8RusUVV8COywqyoJoiq3J
	/8lqDbapQ11+uTPw2A4QkO5U0RbL3NrsLo+K5/RgtRc9x+HmgoyijQq8h0mYgiMYFu93um6zB3aYF
	lK8tQ+ct9t0JnwqPQQjoS7XgFzJ2XPLATKYVH53+Sj8eNs3DJYgdrd3OU0yYR7R8OKWbexiFuZw/e
	VS0Fl2A9f8ZLRYzgqhHPelZQYVpNxVwawfs4Fg8ZyLGNOgpZnnX8Ix4ybJ98el0MdCkXCdUlzUR2c
	NQ7LAfuY1dS70Uw2PMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaaph-009WHI-2P;
	Mon, 28 Aug 2023 11:55:01 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaape-009WGV-2J
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 11:55:00 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c93638322so649893766b.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 04:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693223695; x=1693828495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CghXjnmhGYaNTmxkJrC++UaP4UDjN3m0O5QjItGpeIc=;
        b=FLPoTEzxDi6uOfWWH09o0o9SH8DdilxsokEm2h8931d9lRjd96++Imf45kvcbTTawO
         qdCGqNn3kmPh0RxE+l2HwR6TRppG0MvrZ+0T1752zyAhB2aX7AVMDWIR1MbkGQ1cdOwk
         JNyhISkKYitk6ZG8NQUPH1KO7dzHtcy/gzCexqWFDGD0yRWt1LHZmqsLLCB7rdeiS4jx
         nkWI8CoZ4LQGDxZg1EukxvAO4pNOnww15Mzyymnp3gTvWLIM3EJ/qZbvDCGmBZ1aD/C4
         mbiLB189yyBoubboogEOBklW8Vt74Me9UvRGxdHZGcDqcxrQTgdTHhOtN5uLZdddy22V
         DOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693223696; x=1693828496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CghXjnmhGYaNTmxkJrC++UaP4UDjN3m0O5QjItGpeIc=;
        b=kG4t3x4g71ShtdviZS7fxopv102YZUwascler1CoP4e8WYgX0PLWKNLznbGWwmzG6/
         gAomiuMwHbI2gzmsc7qDoojwy7IK1fzUNdtdftFZwTC2Mk1PD/geTOZstUQdb81why7l
         UUOJ2ZsjIjyDuSeq25EgRmsPxSR5gcwVQacYIFKzElDPirSkjK4JmO5fL/WBBzpZUvEk
         02JMGYCf1mVyAlY76wg/YeBR7MIGw8z9HeVjeAT+2miuWDBJBnCus3vtmsJV470Pu5r6
         h7mvj8eFthdtG7NSm2e/cz0XryTuB0E9VeVEtaS8msN4p9pONVnZVb/XCM7vcBeCwTXd
         nAgw==
X-Gm-Message-State: AOJu0Yz9BNe9/wamMsELmyXJwkrp412dUk4UcK+cwlaNzSKOOfv6fEjM
	Pv07GLwwsPnemKYN2zCP7zMDhUnVfrPojPKqZ20=
X-Google-Smtp-Source: AGHT+IGSevbzv9y6W2qDDFwFBahmZ75ulPmjKvMSfcsIPU4w5/uFCsjEOezSMRpGXMsPleyd3tO+uQ==
X-Received: by 2002:a17:907:2c43:b0:9a5:ae8a:6e0b with SMTP id hf3-20020a1709072c4300b009a5ae8a6e0bmr3032324ejc.24.1693223695598;
        Mon, 28 Aug 2023 04:54:55 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id k6-20020a17090646c600b009a168ab6ee2sm4513777ejs.164.2023.08.28.04.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 04:54:55 -0700 (PDT)
Message-ID: <3a5e343c-a0cc-8d1b-eadc-82c3d038aaa1@linaro.org>
Date: Mon, 28 Aug 2023 13:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [-next v1] riscv: dts: starfive: visionfive 2: Enable usb0 and
 fix tdm pins sort order
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230828115239.16012-1-hal.feng@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230828115239.16012-1-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_045458_760966_5FC5E079 
X-CRM114-Status: GOOD (  15.35  )
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

On 28/08/2023 13:52, Hal Feng wrote:
> usb0 was disabled by mistake when merging, so enable it.
> tdm_pins node should be sorted alphabetically.
> 
> Fixes: e7c304c0346d ("riscv: dts: starfive: jh7110: add the node and pins configuration for tdm")
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 49 ++++++++++---------
>  1 file changed, 25 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index d79f94432b27..382dfb5e64e4 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -440,30 +440,6 @@ GPOEN_ENABLE,
>  		};
>  	};
>  
> -	uart0_pins: uart0-0 {
> -		tx-pins {
> -			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
> -					     GPOEN_ENABLE,
> -					     GPI_NONE)>;
> -			bias-disable;
> -			drive-strength = <12>;
> -			input-disable;
> -			input-schmitt-disable;
> -			slew-rate = <0>;
> -		};
> -
> -		rx-pins {
> -			pinmux = <GPIOMUX(6, GPOUT_LOW,
> -					     GPOEN_DISABLE,
> -					     GPI_SYS_UART0_RX)>;
> -			bias-disable; /* external pull-up */
> -			drive-strength = <2>;
> -			input-enable;
> -			input-schmitt-enable;
> -			slew-rate = <0>;
> -		};
> -	};
> -
>  	tdm_pins: tdm-0 {
>  		tx-pins {
>  			pinmux = <GPIOMUX(44, GPOUT_SYS_TDM_TXD,
> @@ -497,6 +473,30 @@ GPOEN_DISABLE,
>  			input-enable;
>  		};
>  	};
> +
> +	uart0_pins: uart0-0 {
> +		tx-pins {
> +			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
> +					     GPOEN_ENABLE,
> +					     GPI_NONE)>;
> +			bias-disable;
> +			drive-strength = <12>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		rx-pins {
> +			pinmux = <GPIOMUX(6, GPOUT_LOW,
> +					     GPOEN_DISABLE,
> +					     GPI_SYS_UART0_RX)>;
> +			bias-disable; /* external pull-up */
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};


What is fixed in this hunk? Order of nodes is just a style, not a bug
needing backports.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
