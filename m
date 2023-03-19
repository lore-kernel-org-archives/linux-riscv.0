Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32D5C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Mar 2023 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1dCaR/6X9VL1eATShbEMux/KjvF4DRcWGbO5xLWj1c=; b=1eyYecuHpUvmf1
	7oxVnURn4c75i25V77SEE9YZFn1dZ9WbcncKDPSDEg5wYgqyki2fBCPu5OC7IFTxwjuzgTO/9Ngk4
	+HssTltOXal5o/BxgHN0Da9MWyH7p3TFvnYiKQFVAQnf4uiFiNDFqI+mQLrj3iPJu01i0C1X0XFqP
	BiE7q6+CJVr/kstH1tMkZaz19C9EavrZCqc6yLCn/ZvtzDfUT392XUCMgpVqkIgsnf9TiJmePZwTZ
	SftkZeSNTt1hFyrqvS7buJDyfoZ08UUMEGVLWFHEnSqzVrYlIwAkpZzcXaXBmydNS80TX1PgAFdGn
	A5drCo/LiMmg+DqWkHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pds9o-006gxj-25;
	Sun, 19 Mar 2023 12:29:04 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pds9l-006gx1-2t
	for linux-riscv@lists.infradead.org;
	Sun, 19 Mar 2023 12:29:03 +0000
Received: by mail-ed1-x533.google.com with SMTP id y4so36963807edo.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Mar 2023 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679228940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j+O52D/DV4YgwqI2JOZWwPGBcydQvd8bbC9f6R3xUAY=;
        b=d6mMatByqBvvw9nV/5nVC3nV+LZkLVWCQ02kayCz3j4h/dxzFQzDkCLxYQy0KC/WfT
         0QobqY056ZHkhLgWHaG1xLa7ef5yTFtYXmtwmDQr8CkJp64w1rcQa3fE7vUH3omf+5Gi
         SBt/5xq6XIa8vDgFiyq4TUNOV/M1S+Nzn7h34itm18QnZAO01WgwnNKZQ8w9XkHufo2q
         ssFZyAHWqRsUIj5fO9jVy7zgcZZmf7ZDmNDBM5+jYIPN5DatiKgfNOEdwenvrG8GKMNT
         HCacgmlBDvNqSAB2vQfZ3QYLQ8a34MW246jkM/NDQHkFQYwnbq8c+EXVEAK4+VwGtram
         Gw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679228940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+O52D/DV4YgwqI2JOZWwPGBcydQvd8bbC9f6R3xUAY=;
        b=SHH0NHriCy4H8A/BVYRsdjAKI8RJAeH/sNObpmnQGZR10uRV7yHoEncvIHfaSR36AH
         VVwqEJ52VZ+Po/PBMDgj0+Sj6ots19ErT170SgvPHtrZ6RQmj4Z3jGevJKw2nMmXk2bc
         lnR4JZpjmLobVZ3obEN4Iy8fDvb+682gEzwxlH0AUMDfF+k7AK6RdBkLVzG+HLdKlG8k
         8U0tzN8xvR/I1JRqVBKYTbyno0YeEHtPJ5HT2nnI84NdI8YYF5wNS7KOEXJSas3bBxDb
         wz/qOaoy1468Jlj5dGL4XhUhefqFIOnOFUdP7gAiJ/cd6FamQ25as4EAW1Vd3vHyUKuk
         379Q==
X-Gm-Message-State: AO0yUKWaNegqZyFqKuGDe77Lp+4KP0blptlrNFtihCHsUbc7B0GA8Kdc
	37thyzIFS6Tm/Ol6yxNDFTv+xg==
X-Google-Smtp-Source: AK7set94owjWJlViRmiDbyyh8a8jp6CCdztcsXHhVWObolmpVvjrHsBmCzRtr9vz4WkLaB2DLCdndw==
X-Received: by 2002:a17:906:6953:b0:931:c6ba:8619 with SMTP id c19-20020a170906695300b00931c6ba8619mr6028801ejs.72.1679228940261;
        Sun, 19 Mar 2023 05:29:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id qx20-20020a170906fcd400b008eaf99be56esm3262695ejb.170.2023.03.19.05.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:28:59 -0700 (PDT)
Message-ID: <1f352445-4677-e33b-be14-c76bd7ffa188@linaro.org>
Date: Sun, 19 Mar 2023 13:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/6] dt-bindings: soc: starfive: syscon: Add optional
 patternProperties
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
 <20230316030514.137427-4-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316030514.137427-4-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_052902_005907_510D1677 
X-CRM114-Status: GOOD (  15.25  )
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

On 16/03/2023 04:05, Xingyu Wu wrote:
> Add optional compatible and patternProperties.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 39 ++++++++++++++++---
>  1 file changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> index ae7f1d6916af..b61d8921ef42 100644
> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -15,16 +15,31 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - starfive,jh7110-aon-syscon
> -          - starfive,jh7110-stg-syscon
> -          - starfive,jh7110-sys-syscon
> -      - const: syscon
> +    oneOf:
> +      - items:
> +          - enum:
> +              - starfive,jh7110-aon-syscon
> +              - starfive,jh7110-stg-syscon
> +              - starfive,jh7110-sys-syscon
> +          - const: syscon
> +      - items:
> +          - enum:
> +              - starfive,jh7110-aon-syscon
> +              - starfive,jh7110-stg-syscon
> +              - starfive,jh7110-sys-syscon
> +          - const: syscon
> +          - const: simple-mfd
>  
>    reg:
>      maxItems: 1
>  
> +patternProperties:
> +  # Optional children
> +  "pll-clock-controller":

It's not a pattern.

Anyway should be clock-controller

> +    type: object
> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
> +    description: Clock provider for PLL.
> +

You just added these bindings! So the initial submission was incomplete
on purpose?

No, add complete bindings.

>  required:
>    - compatible
>    - reg
> @@ -38,4 +53,16 @@ examples:
>          reg = <0x10240000 0x1000>;
>      };
>  
> +  - |
> +    syscon@13030000 {

No need for new example... Just put it in existing one.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
