Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23272C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ztpYXruYj6GFvpxoWDYyOLwYLdW6Ijt/LFNPHDIfr3s=; b=zaWLi3Tz8Dbo5iXzMtzQKwiHop
	yA6ik6YluAQwjW3Fod9C5a52PYmZAi3bVlFc3cpB916I32RwSEdUDMRZflHUXuXoJEkk3iqM0xcWx
	SDrswPWYp8JiXv8YFwa8UMcnTlZRXXYKsVhrEfgq/UrFse01IAHHxEQYWCHndhsFLVxyTjw7ERbwW
	HBjrOhHZET9uLDgHO6VFFbbexPBIHtlQpCR0yXxjv9KSevm1A/ori3u9sN5E58ASezbAKLOnLir4e
	bwGpeUkDao8HCKlcYN3RqQ8UmIY/JxIG2YCcd86/VlpEYbvyekdunvbfnKsL5KFHc7QwRhNtcVJMm
	sBdjE0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGI8-00000003HFa-05Ar;
	Mon, 01 Jul 2024 12:37:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG8j-00000003CAB-2FX2
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:28:16 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8A9FC3F8DE
	for <linux-riscv@lists.infradead.org>; Mon,  1 Jul 2024 12:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1719836888;
	bh=XIOnEi79dUQpzl7QQQTZmx9xHf9Cr/nC34IURbqE7D8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kytsu62T+EjQnXrMafO11Udeqd8Kllk5De6YEZugvHdTxhO4jTRpLiY+aLMryIb6y
	 fXPfE7LF6AL157HWQVnD1GgN4aQXuakndmhpy8LbAmxGfbPBQfZNwlBiJSMX0NxFiK
	 ybNYVEsS6rDj3xfGxxGjB1B+nZycmCDnaOatXC+k33/bhHAkt++6QUWKIeODLPRrVY
	 /nPbvLyrvg5EHdogCdnRTdBzD083RvbwSKuwWBEBPpfmXxpC2ZW6283apsS5zqF39f
	 SCMg158MRTXTs4xwT1qFR7Xo2iHQUIdr88pCqPYPUlDXMee3ywZKgJCrq1qxAoy0ld
	 5wDbXpRaBH2Yg==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4464c9fd2d6so37239491cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 05:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719836887; x=1720441687;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XIOnEi79dUQpzl7QQQTZmx9xHf9Cr/nC34IURbqE7D8=;
        b=ikxyOyqLXytlxO6j0+x6U7icuXPgC7Q2si9UkHoWJQgsfBoRk9+QAq34T6n9LapBS7
         H93u5Lj8ayGn8vJ7mfmiaKgPwz5tCKIUFmLZfvxXOY+RjnIqgtYfNFZgX8nqQ2TGYCyc
         WEBjFkuxlXyFYmzZ4NOVsUGCY05ZtiYd0GqcQbx+PNKVJbRLaNcoWqI+AfI0SMhEIMn9
         /utPx0eoi8pvldxQac658jmCPQuIbVZcDYADVwiwXo4oe054VHzaaM0hwlOXM71If/gQ
         yo2kD8x4Q43poMtRbg0qTU6D/k1+ae/euDyXVY3t4pXPowIslrW8Ru+alxFJxE4DI1SQ
         A2TA==
X-Forwarded-Encrypted: i=1; AJvYcCXtq6Tpua/b0nAaMimeSRjI6Stf0E9Zq+1jrbVNimrUxtH/TqS7iTCQSRm4x5W2sdLHkbULKDkYPrbmkDTeDA2EzBtm/+fiTKp4LYTnAeXq
X-Gm-Message-State: AOJu0YzZnWYEzVPGR6m2E9PIfbF3Nwk7aybnlsmmTR1WAyHop1wEXhpl
	FQH6Q1K0Lo6tmOObLrMZMtSVbLlXXkixRcuA0/uDNHe2r1dq1P4MHh4kd30IvdPk4k9rsExTYxF
	IVqCsOBToaDvLVOKmZw4FmrE8RwqGALPvIiz7xBdn0BBbZQsTtnrWua1A+lA3rOSL/JkfXKP9/P
	nAQjvvwg52f9Z8mq8ilYSSImIIb9wmEi3vYqLu7zr8xDlb6p38qYq9ehMM
X-Received: by 2002:a05:622a:1315:b0:440:4d76:a601 with SMTP id d75a77b69052e-44662e01f5emr71560071cf.38.1719836886756;
        Mon, 01 Jul 2024 05:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpnjnCYapSxCfnHKI4LW4UY47IpWjXvS1GBTcCwjrqBR3Xsc8QzASxrYVXTeUN3nnAN7DiP+Wp7P0LX5N6eF8=
X-Received: by 2002:a05:622a:1315:b0:440:4d76:a601 with SMTP id
 d75a77b69052e-44662e01f5emr71559781cf.38.1719836886269; Mon, 01 Jul 2024
 05:28:06 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Jul 2024 12:28:05 +0000
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240627115236.618-2-naoki@milkv.io>
References: <20240627115236.618-1-naoki@milkv.io> <20240627115236.618-2-naoki@milkv.io>
Mime-Version: 1.0
Date: Mon, 1 Jul 2024 12:28:05 +0000
Message-ID: <CAJM55Z_NaimQJkoykU1+THY_WqNMVsvENpJHJYFPTD3YuXOMnw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] riscv: dts: starfive: enable heartbeat LED for
 Milk-V Mars
To: FUKAUMI Naoki <naoki@milkv.io>, kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_052814_176955_F734BB81 
X-CRM114-Status: GOOD (  15.60  )
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

FUKAUMI Naoki wrote:
> Milk-V Mars has a green LED to show system load[1]. This patch enables
> a green LED as a heartbeat LED.
>
> Signed-off-by: FUKAUMI Naoki <naoki@milkv.io>
>
> [1] https://github.com/milkv-mars/mars-buildroot-sdk/blob/dev/linux/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtsi#L79
>
> Changes in v3:
> - add default-state = "on" to turn LED on at U-Boot (not enabled yet)
> Changes in v2:
> - reorder properties in led-0
> ---
>  arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> index 5cb9e99e1dac..5cae7a5d2f86 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> @@ -4,11 +4,25 @@
>   */
>
>  /dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>  #include "jh7110-common.dtsi"
>
>  / {
>  	model = "Milk-V Mars";
>  	compatible = "milkv,mars", "starfive,jh7110";
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			default-state = "on";
> +			function = LED_FUNCTION_HEARTBEAT;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};

Hi Naoki

Thanks for adding the other boards too. As mentioned previously [1] boards
should not add functions to LEDs unless the hardware clearly defines a function
for them, and nothing on these boards mention that it should be a heartbeeat.
As you said on IRC userland can easily add whatever function they want.

Also please add a cover letter when you're sending multiple patches.
Eg. use git format-patch --cover-letter

/Emil

[1]: https://lore.kernel.org/linux-riscv/CAJM55Z_j8gWFyKvsiu-oGDV7Hacr4Amt5FdkHdjKnhZwZgxncA@mail.gmail.com/

>  };
>
>  &gmac0 {
> --
> 2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
