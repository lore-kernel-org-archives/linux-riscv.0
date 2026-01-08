Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DE4D1D486
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0uoYMUgtpVyJwtT76QnvH4JZurgcbvEbM3otPUOfe4=; b=JbvDAsRFJW/TpV
	f3t5WX2+wYuWPWnfoZFxM1ndu1rTn/Zjau0d8mWBl/4QX60BkVJRnpT7it1dw/7VFDvUslgkbee1l
	yP6PKaO97NlPZdvwOZO/Ta4oj2zC0NiV9RMBKzbdegkJNdDR0qtBl062mRGD7dTgzp++zzRiFi+Or
	y0Pp1EdABlV/B5yV8QXt5DaHwW/OR0hvQFa2hTrA3iW+97U22M5tQZQE+yq/dKWQECCgxQ8kztw8+
	tz6q3y3EW1EvYmTo94UiAdIlPEiHZF+y/vOsWg+jHinvb7Py/9bWkAKUL6nNGFZVa/nqFPfIR6Yl/
	C/nMW73ZxPnpLAwlSHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduc7-00000000aaI-1KuD;
	Thu, 08 Jan 2026 18:20:03 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduc4-00000000aY6-2m7X
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 18:20:01 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-45391956bfcso2529716b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 10:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1767896399; x=1768501199; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ohc2giVuVn3JULq4s35HjI1BOKvAGS8MZPmPZF1eTvM=;
        b=ZQouD7TJLCeD8KRhPkqFoS4b2LUYG9VLgvxaIH7IS7AZGOoDTyXx2rsC11Eel3gSN8
         3kIeZz8FxH+82WeHMRvK7MDBZdKgfPCU0Pz0EuAzr0WP34+vFGCXzk9H3ekp1j+GkNLD
         CSExyj2nkTvvt059p+Syh9PWB1ToYIqbcbhkfRbmIdgqMNs0l/j4m/Y9/2KYCuX9ZxZQ
         Ryh0Vzy3T7afmUgMf1ojNKciPxA0HV9YA4NctIyauvqozr2edKL4Sn60d41c0m5XCEi4
         bLcY7gcHGOH3GFwlseo7fWNlDrdGIh0w0LG4zwIGSUcxpV9LASJ4ymmEPZOY0Eogxq/E
         GAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767896399; x=1768501199;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ohc2giVuVn3JULq4s35HjI1BOKvAGS8MZPmPZF1eTvM=;
        b=iYTVxUWBw4XC9P4Dyv7YbRvXK/hU0P5n57T98qIgpTtxcJA5bnXcGNYmlmZn2erLKh
         hpYhJxQbRxer8tPREKlDXW57T5pS2U3D44lExe5fqaBmgUokQdDpYVT2Lp+z/XxNFf5m
         2CZE0ItyDipf3SEH8EDbTqgUdxJhr56ey/K6KW1lb5o6pNU8Lx3Ce442aeqBuwGxSoQ7
         ebjy3pr/63ROjVyM8RrQ9lpkD9LE6gBhuWdTTcTbSeyktgqB+6konXPBrboNVDjhcKcL
         z1KdDBX5hdhwv9bl7M0LMh+he2Atx8U0Szyll+dgdZqZuXewCL3OZtJhNLBOn7WoG7Ze
         mXfg==
X-Forwarded-Encrypted: i=1; AJvYcCUhAlsiDKhsUPFajLQf8dYgvCKigpWByyYK1m0sHXgu1hR0x04ArlfasKzwo9/qzGNq+eDUl9rHXeGQgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwabQQBZYUYOtDkIlDBpa6LYhKM4G68/P/y+QqGFbHBY5FkeuQD
	rLf6WCcdwj/6LxSDCSIW+XXRdQuLw8kZSfzhz0bUMvtpjjaPJ5iL0y2hvSxabLo0h50=
X-Gm-Gg: AY/fxX4Imoqtn18IjEAk5X0mcynJ8pz9J2SBj7wmXecRqfzj/c1fjS5HQhX9GCP4y/p
	X0Gy5K4hh+GPEuKLLMK3dx5gCTwtOWfJqFgSjHodfrOELX+5PXMNfzwGrBco+qliP1qiG8S824y
	v6+8t6/D9dqIxf17wGvgCV2Ksd4FR0NSpTQbKP8XQO4PqIlyWF+kiIMeDxOfX9Y4kLZnjIjgs5z
	j/OV8AEwQIcRbp5GXsAH+ZWtl6XZTW9m5ZesB5pFv8ijjnU/fY3NZiR6D3AO8ub9EsbvVO6Jb90
	DFIQmCQsQbSNORQ7XQ2lIxNnnNDa3kYKq/Wzp1EsK2IDTBkJNwc2SBqPWt2TmDXYNo0WoCZD8zc
	0MRxam12YQNo0H56+X7H6xYHp5luoHTVEViF9dSJ4sIKYGzwji9KJce3r3voMePFpYgMvfetqer
	DwwuZJJpMpG5jwBRKWWZn9q1VuKqc=
X-Google-Smtp-Source: AGHT+IG+bYw5aa5qXAocgfxdFotOTyw3i8NWk0A08WmZ4RTMKQzSHU4xstgqw3nYJD/MtZ0mMoVZ9w==
X-Received: by 2002:a05:6808:6508:b0:453:746a:c61c with SMTP id 5614622812f47-45a6bf00314mr3342680b6e.66.1767896399198;
        Thu, 08 Jan 2026 10:19:59 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.86])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e2e8fb1sm3613666b6e.21.2026.01.08.10.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 10:19:58 -0800 (PST)
Message-ID: <77f9a001-7f0a-4c29-abcb-501e875da117@sifive.com>
Date: Thu, 8 Jan 2026 12:19:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley
 <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
 <20260108-k3-basic-dt-v3-10-ed99eb4c3ad3@riscstar.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260108-k3-basic-dt-v3-10-ed99eb4c3ad3@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_102000_718083_0917DF46 
X-CRM114-Status: GOOD (  14.05  )
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

On 2026-01-08 6:26 AM, Guodong Xu wrote:
> SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
> Add nodes of uarts, timer and interrupt-controllers.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v3: Remove "supm" from the riscv,isa-extensions list.
> v2: Remove aliases from k3.dtsi, they should be in board DTS.
>     Updated riscv,isa-extensions with new extensions from the extensions.yaml
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 548 +++++++++++++++++++++++++++++++++++
>  1 file changed, 548 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..be9335fba32cb9e81915b2b91cf08c55a5e96809
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> [...]
> +
> +		simsic: interrupt-controller@e0400000 {
> +			compatible = "spacemit,k3-imsics","riscv,imsics";

style: missing space after comma

> +			reg = <0x0 0xe0400000 0x0 0x00200000>;
> +			interrupt-controller;
> +			#interrupt-cells = <0>;
> +			msi-controller;
> +			#msi-cells = <0>;
> +			interrupts-extended = <&cpu0_intc 9>, <&cpu1_intc 9>,
> +					      <&cpu2_intc 9>, <&cpu3_intc 9>,
> +					      <&cpu4_intc 9>, <&cpu5_intc 9>,
> +					      <&cpu6_intc 9>, <&cpu7_intc 9>;
> +			riscv,num-ids = <511>;
> +			riscv,num-guest-ids = <511>;
> +			riscv,hart-index-bits = <4>;
> +			riscv,guest-index-bits = <6>;
> +		};
> +
> +		saplic: interrupt-controller@e0804000 {
> +			compatible = "spacemit,k3-aplic", "riscv,aplic";
> +			reg = <0x0 0xe0804000 0x0 0x4000>;
> +			msi-parent = <&simsic>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			riscv,num-sources = <512>;
> +		};

Does the chip also have M-mode IMSIC and APLIC instances? Those need to be
represented in the devicetree as well, for M-mode firmware to access them, just
like the CLINT below.

Regards,
Samuel

> +
> +		clint: timer@e081c000 {
> +			compatible = "spacemit,k3-clint", "sifive,clint0";
> +			reg = <0x0 0xe081c000 0x0 0x0004000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> +					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> +					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> +					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> +					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> +		};
> +	};
> +};
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
