Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE5CC3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 11:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzGNUybRqUXQDtbiKamwHcfmpdaJde7XNTC5HI3ts1Q=; b=Oe+0OeaOBQrRJk
	jHTQ1+0n6wPQZOPX9Ix9zdeFVakHin2TDNg4XKvlSB929L4lIDFpcr+ob909wez8jpD2ns6fRRpOB
	LfUQFRpfWYrX4aY0SJ4ie30pUaFoXz6sEtxiKq3wu9yap+N+lFWpRNbbAp1J7PSjTWOsT0sNWIPeI
	tV8GGGBlrRO5mEnY8NXNOkJp0Nw2rTbbkC3STZ6FX65er/opoHRupWedJdtRSYMR/VWSVfruCp2in
	8f0wA40yuhVeLlmj5AgQ2yFmUAIFaXREPQgthOjnGMknrr42MK2K2Si9ZgzQYOlDrczsLBD7e5sYE
	ATInmZmmhftMSt7ECYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzag-00000000VVt-1rU5;
	Thu, 08 May 2025 11:39:02 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzZH-00000000VLu-0SKU
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 11:37:36 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-72ec4634414so592732a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 04:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746704254; x=1747309054; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cg8NwDyNFyKWIP/c9rQXDiR1cnoY6h6ESpb3NTgHnZE=;
        b=gLpwApHXUT0dZAnWQi3b6t1JLbB63b8LKszjy5odBy8TGUwLOyjwB/O6WMz/UbO+8b
         mANwhlzyhBPb6C9tOP3teO8/IKu6o66Vzud6hKWDvYf7H+tV7lrQaw297o9aWY7jCB7j
         /00ChfNDcSus+m5gHLlnQbDugY3jf/1EYWVM1yAfD1vXLKYur9rEUfbaSEOSRyhMI+jz
         PjvtWTAzR2jZZFhpmP7O3WXvyu5UVyuyoCRVAfqEpIX/Lc1lZ8BSHwueAH1Xr80Im4PS
         15hSPOnvzLrsG4uCLSA1rNV7skdWYBN7+bpBzxJi3Nr4C9ZXVzqmVFa6GmnsJAgpK8+4
         Nucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704254; x=1747309054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg8NwDyNFyKWIP/c9rQXDiR1cnoY6h6ESpb3NTgHnZE=;
        b=OqPBIv3pdOflDSu4TGSP/ZbdfOpjAcRUZLOGNGHgDk9dOJi9anKOJMt9AuBkcF3CoJ
         G7wTECTselo9tnl1b9mcwXNCTKWjrf84zvr3ss8ZgIEsGcAHyFcmp+2eHQ4N1QBXchGc
         wkRKmlHxUq/AvD8UeZL7UESx+VzHzwvBCvb+jDIWDuh5om+4g5+sWez3qCCBPcbAaU0p
         pA0PP/zbTEUYeCCaYr/KmgjRZk+xevz25I1MtN3nghS0X+ogBnl+bxPmpk4ORgBWGIP1
         uy4VBLejCghoXicAryn63sbR1XxtdxzFgNtaW72GtlTgaLvhVe3WLeYvZDqbvIEROXR3
         eyyA==
X-Gm-Message-State: AOJu0YxQqKIGR2UuakEwdeD/TQLxVlrGg6KuEEFeQyQu38ifB6rXsN7j
	gZL2xt3unluf+GSTTB6RFy+HkEPf78O7KSbXBwPTAoDp/xnOjT3FKT9gdmWsqk4=
X-Gm-Gg: ASbGncs6OwqLU0WLeov+tmhJ0WUVOpkuNJZlPUKvKevSEt/tkiiAo/SH46twQ52K46z
	aW+BugptBeCnsATyNzHKEuEYAXsaYaonYxHleFakXnEUf+FAKOBztHngH/rLQDWWZJ2/lSHPgRa
	fDx9VsYHoP9f4r1SNi6kVChoHec+V/WujlVW0KQnZTwV1zCxhHkPWIxzY+uyNFDlGPwAffx5N4n
	NQghgQ+4frr8fyQUTtL0HL3WVOJqxiQoznhty/UJVwJOY5AEQQ8crGR3TqipP2//kQfSaEid2BS
	ZjM6b/CwDvYhK1pwdOsDN+172hXiHhWwweD5EBVZQ5dbR2gwMOfwFyigtYhqBahbq6XMu3JxDV/
	dUexz
X-Google-Smtp-Source: AGHT+IGJREoSnG46P/t20ngqdhpSB9tC4Fc2vmNOvK3IyD1PhX98abqWUE9cRzQMmElSLNeoAKXG8Q==
X-Received: by 2002:a05:6870:e24e:b0:2b7:f58d:6dcf with SMTP id 586e51a60fabf-2db5bee487fmr3754145fac.18.1746704253907;
        Thu, 08 May 2025 04:37:33 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5d0e551asm1394614fac.42.2025.05.08.04.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:37:33 -0700 (PDT)
Message-ID: <63f0d0c0-94cc-4397-9c8a-b8d117514fd9@riscstar.com>
Date: Thu, 8 May 2025 06:37:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] riscv: dts: spacemit: Add clock tree for SpacemiT K1
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250508111528.10508-2-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250508111528.10508-2-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_043735_417740_7E99894F 
X-CRM114-Status: GOOD (  18.85  )
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

On 5/8/25 6:15 AM, Haylen Chu wrote:
> Describe the PLL and system controllers that're capable of generating
> clock signals in the devicetree.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
> 
> This originates the 5th patch from previous "Add clock controller
> support for SpacemiT K1" series[1] with node names of system
> controllers and PLL reworked[2].
> 
> The patch is based on linux-spacemit/k1/clk-for-6.16. Yixun, please drop
> the previous version and pick this patch instead. Thanks for your work!
> 
> [1]: https://lore.kernel.org/spacemit/20250416135406.16284-1-heylenay@4d2.org/
> [2]: https://lore.kernel.org/spacemit/aBxF81yqPgHP5oA_@ketchup/

What you changed was that previously you used "system-control" for
syscon_apbc, pll, and syscon_apmu.  In this version, you name them
all "system-controller", consistently.  Meanwhile syscon_mpmu had
"system-controller" already.

For example:
     syscon_apbc: system-control@d4015000 {
is now:
     syscon_apbc: system-controller@d4015000 {

This looks good to me.  Thanks for updating it.

Reviewed-by: Alex Elder <elder@riscstar.com>

>   arch/riscv/boot/dts/spacemit/k1.dtsi | 75 ++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index c670ebf8fa12..85c9730dd082 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -3,6 +3,8 @@
>    * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
>    */
>   
> +#include <dt-bindings/clock/spacemit,k1-syscon.h>
> +
>   /dts-v1/;
>   / {
>   	#address-cells = <2>;
> @@ -306,6 +308,36 @@ cluster1_l2_cache: l2-cache1 {
>   		};
>   	};
>   
> +	clocks {
> +		vctcxo_1m: clock-1m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <1000000>;
> +			clock-output-names = "vctcxo_1m";
> +			#clock-cells = <0>;
> +		};
> +
> +		vctcxo_24m: clock-24m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "vctcxo_24m";
> +			#clock-cells = <0>;
> +		};
> +
> +		vctcxo_3m: clock-3m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <3000000>;
> +			clock-output-names = "vctcxo_3m";
> +			#clock-cells = <0>;
> +		};
> +
> +		osc_32k: clock-32k {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			clock-output-names = "osc_32k";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
>   	soc {
>   		compatible = "simple-bus";
>   		interrupt-parent = <&plic>;
> @@ -314,6 +346,17 @@ soc {
>   		dma-noncoherent;
>   		ranges;
>   
> +		syscon_apbc: system-controller@d4015000 {
> +			compatible = "spacemit,k1-syscon-apbc";
> +			reg = <0x0 0xd4015000 0x0 0x1000>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>   		uart0: serial@d4017000 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017000 0x0 0x100>;
> @@ -409,6 +452,38 @@ pinctrl: pinctrl@d401e000 {
>   			reg = <0x0 0xd401e000 0x0 0x400>;
>   		};
>   
> +		syscon_mpmu: system-controller@d4050000 {
> +			compatible = "spacemit,k1-syscon-mpmu";
> +			reg = <0x0 0xd4050000 0x0 0x209c>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		pll: clock-controller@d4090000 {
> +			compatible = "spacemit,k1-pll";
> +			reg = <0x0 0xd4090000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			spacemit,mpmu = <&syscon_mpmu>;
> +			#clock-cells = <1>;
> +		};
> +
> +		syscon_apmu: system-controller@d4282800 {
> +			compatible = "spacemit,k1-syscon-apmu";
> +			reg = <0x0 0xd4282800 0x0 0x400>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>   		plic: interrupt-controller@e0000000 {
>   			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
>   			reg = <0x0 0xe0000000 0x0 0x4000000>;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
