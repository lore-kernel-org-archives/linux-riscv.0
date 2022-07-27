Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E074DC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mW04D32/Zn21mS/ekdJLDsVlqh+92DgonMMkJVBP3Hk=; b=vxlBUoJdNjC5yz
	DdJGhbFzk9AUGCXEKvWB6y0RdA4wj4Rf26DENvzOIFfPDufcFVX618boBZqYC9+vNIy0SvGrAScYZ
	FaSuP4QkH0wwCqHDjhMU5yGzGiqQQNPi2W388WJvpHcVsv9TywKZEmrY2jX4x2Nkzuvlb7TPNDXLb
	0bvmVDRQi6dXOkCZzjxCQTLX/E0UYBtDjeYF6qDEqOOndE8kapW7M7qSxsshfXg8rJRJszz5AVDBC
	BXQGDxka2H1yzSf3lXhKIDVdElLf08N2NWr6nRjVSbeX27a3bn9OBKofIKGHwhLjuTf+VHn+UqJDU
	I2sATsXEVw8Xx7w6kBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcnD-00BOhf-I9; Wed, 27 Jul 2022 08:53:23 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcnA-00BOcO-KF
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:53:21 +0000
Received: by mail-lj1-x22f.google.com with SMTP id z13so18675108ljj.6
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 01:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WT6Bf9Wd4u+/b76NZ7GFsefZqgMs6EzwTFrQjSlCe3w=;
        b=P2Xf23tKUaRyXof5W984HGD9Q13GEbmMRWtao19Yy6tXQymySJSoLwBl8IJu5ivoeW
         ZHAWQdljf+z/vec6k1AUBOC+6cCSWgo2AxWN6rzMP45tV3++m0ABQlibobCzXP5egc19
         sliU3eo/trQLpCikT4ArHN6v4p+iHZXjlB0VswATrBYX63mTGndF63tmFxasgkbJ6mlV
         nJIxVVo0e2MFB2uA1q32lpdasb/ZVBNcg9HU/25HKqdnn/iAmmygOJPjmaAx3rPcGoWX
         3wWFZmFVDT9icClBwCfQ7ChFFzGpYPE3rIu2GAQnYG0eM0kUdRwAfzemPWbWDNhl+Min
         1ZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WT6Bf9Wd4u+/b76NZ7GFsefZqgMs6EzwTFrQjSlCe3w=;
        b=joPXM9FO2CD4nxvj9bqTLIRvbod3rqu2D9LSsyB2LHhz9yqeKpwUGdv0bFuY2MONHL
         35CQmJeHej9C0p35NtqPRmFSdgLH0z5FcAMbYkXhNG0XW5oyKvViPQd7RzcAU13mOEFd
         GMwRij5TXjcnv5+J4qHG058U3omcHyl/FcSJDnjxMv8cvyq0+BgZgDEmsuiVdvAmUCai
         WoA3r/LxPfT3vHNFSlDmd9dBAsLBFYACJ1pX+CbQSIE43HpdR0FsUymhmyw1QZ9uwgwV
         cMdPL9rwScY2wLQll+ipoGVFFBGv6abmpIbT1z4QP1mebFvWUiZ1r1uWQ43/5xcfiYBs
         kpRw==
X-Gm-Message-State: AJIora8ofwdcg6vkASySspwgOYD3m2L3ABJprFWpGL3UhICZP/EOfazu
	o/8v4j/xfZL3WHUoZA/KFsROdQ==
X-Google-Smtp-Source: AGRyM1sGsKeiDwI8gtL3TJYG4H41ewonY4JOKjtqR9UyMESCXxgq6JLJOzIk0g47YQaVf+2cD3uWPA==
X-Received: by 2002:a2e:700d:0:b0:25d:d6fc:277f with SMTP id l13-20020a2e700d000000b0025dd6fc277fmr7357817ljc.52.1658911994144;
        Wed, 27 Jul 2022 01:53:14 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id f16-20020a05651c03d000b0025d67053f0dsm1789534ljp.135.2022.07.27.01.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 01:53:13 -0700 (PDT)
Message-ID: <952a85ec-d1e9-7c14-6404-bc087723252f@linaro.org>
Date: Wed, 27 Jul 2022 10:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/6] dt-bindings: arm: renesas: Ignore the schema for
 RISC-V arch
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Anup Patel <anup@brainfault.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_015320_695890_E4D245DF 
X-CRM114-Status: GOOD (  12.40  )
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

On 26/07/2022 20:06, Lad Prabhakar wrote:
> Ignore the ARM renesas.yaml schema if the board is RZ/Five SMARC EVK
> (RISC-V arch).
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index ff80152f092f..f646df1a23af 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -9,6 +9,15 @@ title: Renesas SH-Mobile, R-Mobile, and R-Car Platform Device Tree Bindings
>  maintainers:
>    - Geert Uytterhoeven <geert+renesas@glider.be>
>  
> +# We want to ignore this schema if the board is of RISC-V arch
> +select:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          items:
> +            - const: renesas,r9a07g043f01

Second issue - why not renesas,r9a07g043?


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
