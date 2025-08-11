Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E906C87FD2
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 06:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OG6P3U9UUpQ6f3oA+kobO7PGC9FPQYnE/jtn85DE1FU=; b=JNqTJtjTXfWNUh
	QGbj91hnszDHCAPHzhr2LIEooyfKfiU7D+WKWo08e3XpqXZaKNFpNxfnRBfar0IlwMJCBoEHlMPqu
	YnMWmsxMOeTay+MYfib1MWFGWoOSdiEDOxYdyL6ETAT/kec7xyz0AIilYxWof7fUdP7pjS1XaiFLN
	8n7wC2JtND8aONGeWn5W0VYOzjJavHuuXrd4R5gRm8rFK5JYgtIfcPLATJrUHwcwbCbSDNEgVI8Fu
	dIujK2eW6/LhNEf1599LRwpVT+fGIXGVL3xa2d1pzZkmAoRogPab4Mgo+NXS3x5yDJ3/xeRFn3Vtn
	WeI89slAxf4bRLF4ShtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulMG5-00000006cnI-0XYi;
	Mon, 11 Aug 2025 06:43:49 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulMFV-00000006ceJ-3J0W
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 06:43:14 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-af99942ba4cso51804166b.0
        for <linux-riscv@lists.infradead.org>; Sun, 10 Aug 2025 23:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754894592; x=1755499392; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GDk12v2vJL34l7+873CbL1ksmxiNCrMWuEVM/GTIuU8=;
        b=Bv/dnHaj1xZm2jgInEYCUfQq9Pt4/EfPcNwLi/AY4Cmm+uPgQ/RUcLoduq+shdvSaZ
         54e7S4xwuJNC275apLqWnfxnDq0vqymnxZ2iHSxzegXSK8jnPxGA6ALkE8VaCTOA4AoD
         oSbg6AzLxN46701YHkrBNKC/uJE0pE2pE++zsOTM5G0MaDGQXLt+b+7YINzD52Kcw1Sk
         pDuwmmYQIyr939uTeBrwcn9OBQSgBdSPpcKhyrUe3wFtfefhFuX1dNCzAy3A1+uYSOn2
         52sdI5ehhj+BZFr1JXj29gZPcVqqquVtQvnL5BaTNQsVmqJ6OQYTgVsGo088UwERzrpu
         7VTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754894592; x=1755499392;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDk12v2vJL34l7+873CbL1ksmxiNCrMWuEVM/GTIuU8=;
        b=Dr3HA7GrjV2ssPemxUnrhkf4PXJI140ykw1b+Q3D6kQttKmgcTOOYgidJiEgOv5JCL
         /bmAgD0l6bZknxyZWBVvqhm1rBOJAJF+AD/wTfx6ZHddd/w++B+PxlUf8CNswsuQcAvJ
         hIIouPIOkhHLfaVh/1ctM/aPy7Pk7XrVUAOkpugBBEZxqnbklxIY9eHxpnTPZHIP7Smj
         eu/kyRDpeiF3YRTaARuiQZtx80qkHBoDry1t+Q6wz8LK2Olc2Zpoql05NMAyeK45Vy/B
         9NXb7mmaU0kG+NcntT735MoyPd3I7/PdcvbP5nhMvwH1dINeKpXc0UKs8vd5JYhIMEJq
         lc6g==
X-Gm-Message-State: AOJu0YwULIJrwUEhxBauNyysZGu6FTXpLer4EjseapvBUkwY5hZ0x2Fj
	dxQn59eIjINFpYD0lRkZrgXgtDpgEM80xf+9l6vMDLViZcc7R7RIS4gu2ytzBQUmNDA=
X-Gm-Gg: ASbGncslwC9miizzwMVtsPxBqVVOhX9b0n3Cm2UdOaZDDT8gBV5/hfhQdFegmE6/txo
	RSyb9m8YO7LYFe1rEd+X/EMQ6z2z24ZiCwt+fcqKAQRVCKduWRHjrzVsA06zbjUMEkasbdXD+JK
	LSXwkErLI/0+H2w+vH6I7qS1yYnJ4C5vndiwmUipz5To3cQmTPoWq/0TCr43Akgm5OfiMf51aHZ
	rQ59A/o3iGmvtKxJIduz8HfjDJsf9+aWoA2x3qDrgT4RGqkHMJHNmyl39L+/OXZ+fyhT2r72YGP
	qg6sbBHsUy1buSVrfA3e1lDc7gTycpswnjp1cuRg+3mxLCF0spXogSMYGK+c+o0Uz9tunUvMg7a
	t0ifS9FjWF6wIlUtt5Bon8hOjVoLwmvwaMo9/mkH7rMU=
X-Google-Smtp-Source: AGHT+IGpG5QWBCuxjBn8lkRYjkYkSzvGJ4BaudTpOzokDNqUOytSRhvV4L83yjG40igjSuF63eeWHg==
X-Received: by 2002:a17:907:7e8e:b0:ae3:5d47:634 with SMTP id a640c23a62f3a-af9e1ceff40mr304544866b.9.1754894591880;
        Sun, 10 Aug 2025 23:43:11 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0766e2sm1960618866b.27.2025.08.10.23.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Aug 2025 23:43:11 -0700 (PDT)
Message-ID: <d3e028da-20d4-4b6c-92c2-4d594c308716@linaro.org>
Date: Mon, 11 Aug 2025 08:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] reset: thead: Scope TH1520 reset driver to VO subsystem
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
References: <CGME20250810211419eucas1p173e5fefcfaae437d8b5531d1406ff6a6@eucas1p1.samsung.com>
 <20250810-fix_reset_2-v1-1-b0d1900ba578@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250810-fix_reset_2-v1-1-b0d1900ba578@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_234313_861617_BA957908 
X-CRM114-Status: GOOD (  25.90  )
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
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/08/2025 23:14, Michal Wilczynski wrote:
> The reset controller driver for the TH1520 was using the generic
> compatible string "thead,th1520-reset". However, the current
> implementation only manages the resets for the Video Output (VO)
> subsystem.
> 
> Using a generic compatible is incorrect as it implies control over all

Depends, it does not need to imply that.

But in general this is why we ask - and writing bindings have it
documented - to post COMPLETE bindings.

> reset units on the SoC. This could lead to conflicts if support for
> other reset controllers on the TH1520 is added in the future like AP.
> 
> To ensure correctness and prevent future issues, this patch renames the
> compatible string to "thead,th1520-reset-vo". The device tree bindings,
> the th1520.dtsi file, and the driver itself are updated to use this new,
> more specific compatible. The device tree node label is also renamed
> from 'rst' to 'rst_vo' for clarity.
> 
> Fixes: 30e7573babdc ("dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller")

That's not a commit from the current RC. Where is cc stable?

> Reported-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml | 6 +++---
>  arch/riscv/boot/dts/thead/th1520.dtsi                           | 6 +++---
>  drivers/reset/reset-th1520.c                                    | 2 +-

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> index f2e91d0add7a60e12973c216bb5a989857c3c47c..f84c5ae8bc3569cb1d4e8f07999888ea26e175d0 100644
> --- a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> @@ -16,7 +16,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> -      - thead,th1520-reset
> +      - thead,th1520-reset-vo

No, don't rename the compatible. That's ABI break and this was ALREADY
released.

That's a NAK because you break ABI for not important reason - style.

>  
>    reg:
>      maxItems: 1
> @@ -36,8 +36,8 @@ examples:
>      soc {
>        #address-cells = <2>;
>        #size-cells = <2>;
> -      rst: reset-controller@ffef528000 {
> -        compatible = "thead,th1520-reset";
> +      rst_vo: reset-controller@ffef528000 {

Drop the label. Why is it here in the first place?

> +        compatible = "thead,th1520-reset-vo";
>          reg = <0xff 0xef528000 0x0 0x1000>;
>          #reset-cells = <1>;
>        };
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 42724bf7e90e08fac326c464d0f080e3bd2cd59b..9cc2f1adf489ac432b2f3fbb06b655490d9e14b3 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -235,7 +235,7 @@ aon: aon {
>  		compatible = "thead,th1520-aon";
>  		mboxes = <&mbox_910t 1>;
>  		mbox-names = "aon";
> -		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
> +		resets = <&rst_vo TH1520_RESET_ID_GPU_CLKGEN>;
>  		reset-names = "gpu-clkgen";
>  		#power-domain-cells = <1>;
>  	};
> @@ -500,8 +500,8 @@ clk: clock-controller@ffef010000 {
>  			#clock-cells = <1>;
>  		};
>  
> -		rst: reset-controller@ffef528000 {
> -			compatible = "thead,th1520-reset";
> +		rst_vo: reset-controller@ffef528000 {
> +			compatible = "thead,th1520-reset-vo";
>  			reg = <0xff 0xef528000 0x0 0x4f>;
>  			#reset-cells = <1>;
>  		};
> diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
> index 7874f0693e1b427a094a68f2b6d783985e789bf8..05ed11972774618df4512b7c9f9f12e71455e48b 100644
> --- a/drivers/reset/reset-th1520.c
> +++ b/drivers/reset/reset-th1520.c
> @@ -116,7 +116,7 @@ static int th1520_reset_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id th1520_reset_match[] = {
> -	{ .compatible = "thead,th1520-reset" },
> +	{ .compatible = "thead,th1520-reset-vo" },

NAK, actual ABI break.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
