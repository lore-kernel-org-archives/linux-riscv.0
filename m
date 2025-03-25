Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD88C36005
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 21:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGPB6/z/yodv6GJNxeWC/Ne/M8/RYRjelKNjtyR+FDs=; b=Lbwwp5gtWNJfOd
	98uUN1fJUfqrtT/jYq0+XI6E6DANrgH+aEgl1XdE+k41oBIHp4aaeCgwntN0IPoRy9Y5fP5O8NuK+
	E+2kx1lbZS0lxT4gpWWz8yTa486z9GM/twFDlPIzTFLODU4RXVRTAiUrLEEo+48JsQPxZlaYzak0j
	WrCQF5sDC8YAQJqZV4FrbVjy8edwHFayA+sBrdEn6/q1Y9fAIL/VpL7CynZih//2IpubB87pG8DyJ
	it2z7i9JR2b/WXYe2KG+kStCleAlCAnS05h4KKYG2g4QlJhx/qFeeqIwP4C2aZzgt4QYIUUPCbHix
	7HftFTXBPp4xZUo691dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txC99-000000076EF-0eAV;
	Tue, 25 Mar 2025 21:49:19 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txC97-000000076DX-0y8J
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 21:49:18 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3d439f01698so1015065ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 14:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1742939356; x=1743544156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3q3oNbCpD8Yr3ggdluYQ7Oxw70IpYfziH8ybf4Z46oM=;
        b=TUWY8SfFehhAhIacs9fMungeutWxDcFeCedsl8nLcToWCwGZd0PFun/yP0gPffFpnW
         +uF2Q3wOJacN06Iyh/d6yKVT6svA36qqirgqbudSE6uHY/ylZOsVR/PbhPmL1TMQNt/q
         QH/CksXPUnwyRI4B6fb/gpArfTysTKd7BNfBg/kGV8uT9zUeP7ysoLte4sMg15XXG8v2
         4TrQDN+MJVZjhE3W0Cgy9tZyOR4n99dQ+sybztREFTa1rYzjwGlJuD2GOXWjBm86sozh
         omlcPwNlYqIA/myUnB3KdjKlGomXCfLXGpZfN9vLiYedh/xTWO62AFl4KwL9SCoLWaql
         ZlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742939356; x=1743544156;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3q3oNbCpD8Yr3ggdluYQ7Oxw70IpYfziH8ybf4Z46oM=;
        b=CjI8kvJEoOvu4NYV8dsQJsHq0lKsREKl45yznqOEbRuqXKxz22bdpRpY//4migcFwu
         ez8bE9z1rTrLpzoIIbelL7WrRQqhB8iHvTm8GCCgnU724rwMPXBp+tmri/pwH54/NMyN
         ENsadh/shQkgBuS65SrDV+AuicOfSL6fLMYzuq3aHE12H5eabTjW9mFstV4Dd8PTzPRZ
         FNVbNqlIjEg1aiF6S8m7cbg37Vyz0S9vPIcp6gLxPlGX0jg3/eU2fwvNpS+iOaaSlGLv
         RfMhx5N6yzJNaoG5nxyb3VfLTUnj1CMI6AuojAVmNaJUT6Pw3g1a/JOk5xJp5g2ghRU1
         b0qA==
X-Forwarded-Encrypted: i=1; AJvYcCXEKQN+ZFpYrih1zaOkdiomjRPjOhmH4gDhoFeIrPtrrMVr9aj8udDGZhbiWl2RVidwOv12i7xYSetuww==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRf+9Zexpsd99wF66T1aefymrQX0QXVYlWKEmxCnBuPd3aOmuG
	PGWLShVznZlyqjM80L4dRGhitmgMs9QYzKFdLK/95rOS6PS/KeLuRr7iKU4b/NE=
X-Gm-Gg: ASbGncsHDwRPBZsoDrnj2d9XpFTmkq+8nUjwsjoWXZTZa/0rKWCdn+gLLZjm+IgL9lB
	h1GVA8do03kYm9FBRVtccSPXQfiyQkpnYdXqmwUG/H5qq+y5Ff3+RzRPasIQdUN4uNpnJ7+rj2Q
	tIyua+a1eN06M71pBjadYfMguqPLvhq6zCGDnlWX2uH9wmZIILVaHFEH9nHh8ameQMOcWeOmt44
	NuWwzDOFxX5zfDJiHlnwTd/VzLpYON79ZXUkHVdabCbx1LpDWIbYC/q9HGoUkl29VT8gEJpThbq
	wOGtJraPQfKeAv5iZKG2JLsGD1hOzI/E5InSq6vZIxtI8uHXhUvTW0edrq1L/g==
X-Google-Smtp-Source: AGHT+IFj7uKpDfJR5Iim77+HbZSnDjrxpbs+tP0WU77QjYNPslcMwQz6BHnLAD6zLR0ygkvZ39o04g==
X-Received: by 2002:a05:6e02:4401:20b0:3d1:4a69:e58f with SMTP id e9e14a558f8ab-3d5c20b2c25mr15007025ab.2.1742939356043;
        Tue, 25 Mar 2025 14:49:16 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbdcfeffsm2556607173.30.2025.03.25.14.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 14:49:15 -0700 (PDT)
Message-ID: <a20d5849-770e-420d-b707-83a50c37810b@sifive.com>
Date: Tue, 25 Mar 2025 16:49:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] riscv: dts: Add EIC7700 pin controller node
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>,
 Min Lin <linmin@eswincomputing.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, =?UTF-8?B?6bKB546J5p6X?=
 <luyulin@eswincomputing.com>, =?UTF-8?B?5a6B5a6H?=
 <ningyu@eswincomputing.com>, Lin Feng <fenglin@eswincomputing.com>
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
 <20250325141311.758787-4-emil.renner.berthing@canonical.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250325141311.758787-4-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_144917_275242_32547240 
X-CRM114-Status: GOOD (  13.71  )
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

On 2025-03-25 9:13 AM, Emil Renner Berthing wrote:
> Add node for the pin controller on the ESWIN EIC7700 SoC and gpio-ranges
> properties mapping GPIOs to pins.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  arch/riscv/boot/dts/eswin/eic7700.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> index 9cef940f07e4..7226647919b7 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -312,6 +312,13 @@ porta: gpio-port@0 {
>  					<324>, <325>, <326>, <327>, <328>, <329>, <330>,
>  					<331>, <332>, <333>, <334>;
>  				gpio-controller;
> +				gpio-ranges = <&pinctrl  0 12  1>,
> +					      <&pinctrl  1 14 12>,
> +					      <&pinctrl 13  1  4>,
> +					      <&pinctrl 17 32  1>,
> +					      <&pinctrl 18 40  5>,
> +					      <&pinctrl 23 51  7>,
> +					      <&pinctrl 30 68  2>;
>  				ngpios = <32>;
>  				#gpio-cells = <2>;
>  			};
> @@ -320,6 +327,9 @@ portb: gpio-port@1 {
>  				compatible = "snps,dw-apb-gpio-port";
>  				reg = <1>;
>  				gpio-controller;
> +				gpio-ranges = <&pinctrl  0 70  3>,
> +					      <&pinctrl  3 79  7>,
> +					      <&pinctrl 10 89 22>;
>  				ngpios = <32>;
>  				#gpio-cells = <2>;
>  			};
> @@ -328,6 +338,7 @@ portc: gpio-port@2 {
>  				compatible = "snps,dw-apb-gpio-port";
>  				reg = <2>;
>  				gpio-controller;
> +				gpio-ranges = <&pinctrl 0 111 32>;
>  				ngpios = <32>;
>  				#gpio-cells = <2>;
>  			};
> @@ -336,9 +347,15 @@ portd: gpio-port@3 {
>  				compatible = "snps,dw-apb-gpio-port";
>  				reg = <3>;
>  				gpio-controller;
> +				gpio-ranges = <&pinctrl 0 143 16>;
>  				ngpios = <16>;
>  				#gpio-cells = <2>;
>  			};
>  		};
> +
> +		pinctrl: pinctrl@51600080 {
> +			compatible = "eswin,eic7700-pinctrl";
> +			reg = <0x0 0x51600080 0x0 0xff80>;

Per the TRM, the MMIO range is 2M-128B large, so the size should be 0x1fff80.
Other than that, the rest looks good (especially, the GPIO ranges match what I
have), so:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

> +		};
>  	};
>  };


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
