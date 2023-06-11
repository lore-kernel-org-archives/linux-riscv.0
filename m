Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546A6C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jun 2023 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfsZGcPx0msbzL2c3DfvihcHE6qARdeEXboCgRcZz/Y=; b=Oj4mQRIwUDEMwp
	wtshOVnCI/6jGTYMKd82TmlBq9WG0OubCMPo9pkrMVrFseUYB1FGM6a5hucGWOow09XpyFsEg0SYJ
	a+HUmqtlytTSkeNwhh/II/drb+vgq3Xv2HOLGbiM6T7zBla81Wz5CemE0AX8GkpDi4P5W6v0awBrk
	osW2ibpqMJ0eBfxqJne43T81m+RDCWACm4IpuwgBpCovpXqMmNt10jvT4s67Z/OtcmvjyA5khNK5g
	lUmYcLe+Cy0lpt+wnPMzg4B1LaoXSieJ5pOKXxSy+e8v97jzfJfXnF+Z60yBHYFVKmgIGx7h/seFJ
	x9khz2pUQTP71ovOGiGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8HfZ-000UQA-13;
	Sun, 11 Jun 2023 09:47:33 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8HfW-000UNL-07
	for linux-riscv@lists.infradead.org;
	Sun, 11 Jun 2023 09:47:31 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5149e65c244so4611933a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Jun 2023 02:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686476843; x=1689068843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IntEEcMbVJXLbajRNOwZboTq/1i67BALysa6LjImK+s=;
        b=aBYnS+VThRez9lznNmoyJRFgygrq8pGrQtYTP/2GSODlt++DFrf7QTtCV1GdBevEvj
         DqvDObSCdV/2fD4UyafoyrBFjfP3Ryj1C99E18MCyqA8g46ZoiruZwhi2Z+3PtLIIhbX
         cofRXISLK6gF3HEjLKFOdYxqnTFNe5OUveppumV9AWEwdvXwHoT45DP9dRhaHg6WlNNF
         yATbwjNlWE1Ys9fOtfczxaLCiYqRfuOVOtEbx7FPhX/yWM0dZsT7kaLTCQcouA9jod0W
         NOcy8JRNWESNDbj1q6JLTK+++II9rL8G1zpcbhrJAa903x3QJgodNE6yuC4jog6xWPl/
         +hOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686476843; x=1689068843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IntEEcMbVJXLbajRNOwZboTq/1i67BALysa6LjImK+s=;
        b=aBAQR3xf4GBHHd3vHAQo4b1rE5GtV6gg7dOBgIJbRdNDU/H46g2KI7W5skQAZlQmgx
         p6sDdpW2CZyiuVxWVKDiQ/ejV4k9TFXGMrgsVqquABnwRutT6LRR6jZ84AU0SFYt6/T9
         fgxkuolFczoFlp/1pRSrk1xID/0sTZC5iPd/YfpnHATfjxVPTH4pC+p0geWRV9PBNZ13
         zwb4vvIBlwoSPmgyxnUOKlYMyT9+/y+v8B+nbDu7shXb9MmXX2neOWrC7BDeC9kTg3ti
         ahDu5+wTqXMHxmRcvwAskqqcETopYw+ME6ORa0NbAf5yBejviaxcd4uSyng7yvLgrIbp
         OFKg==
X-Gm-Message-State: AC+VfDwj7sydk/E1dRTVu2nzW0MMROynwCb4Bimr44dkipidAY3+Xx3U
	vDqBvoBkxm/FVztvFpLienmKAg==
X-Google-Smtp-Source: ACHHUZ5lJ/s3LKjtd4cT7LjyGksIdUWZcHMOoBQ9KT88hyWBydYv1BVEo+MbrlPqC8iBaXlZBZlkZA==
X-Received: by 2002:aa7:dcc8:0:b0:50c:2215:317e with SMTP id w8-20020aa7dcc8000000b0050c2215317emr2727440edu.15.1686476843126;
        Sun, 11 Jun 2023 02:47:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id f9-20020a056402068900b0051495ce23absm3696998edy.10.2023.06.11.02.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jun 2023 02:47:22 -0700 (PDT)
Message-ID: <7e1c9011-241c-71e2-7318-499114d66218@linaro.org>
Date: Sun, 11 Jun 2023 11:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/3] dt-bindings: thermal: sun8i: Add binding for
 D1/T113s THS controller
Content-Language: en-US
To: Maksim Kiselev <bigunclemax@gmail.com>, linux-kernel@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li
 <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <20230610204225.1133473-1-bigunclemax@gmail.com>
 <20230610204225.1133473-2-bigunclemax@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230610204225.1133473-2-bigunclemax@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230611_024730_083624_D6323B42 
X-CRM114-Status: GOOD (  14.90  )
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

On 10/06/2023 22:42, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
> 
> Add a binding for D1/T113s thermal sensor controller.
> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>

One patchset per day, not multiple within 15 minutes.

> ---
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> index fbd4212285e2..001faa37fc27 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> @@ -16,6 +16,7 @@ properties:
>        - allwinner,sun8i-a83t-ths
>        - allwinner,sun8i-h3-ths
>        - allwinner,sun8i-r40-ths
> +      - allwinner,sun20i-d1-ths
>        - allwinner,sun50i-a64-ths
>        - allwinner,sun50i-a100-ths
>        - allwinner,sun50i-h5-ths
> @@ -61,6 +62,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - allwinner,sun20i-d1-ths
>                - allwinner,sun50i-a100-ths
>                - allwinner,sun50i-h6-ths
>  
> @@ -84,7 +86,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: allwinner,sun8i-h3-ths
> +            enum:
> +              - allwinner,sun8i-h3-ths
> +              - allwinner,sun20i-d1-ths
>  
>      then:
>        properties:
> @@ -103,6 +107,7 @@ allOf:
>              enum:
>                - allwinner,sun8i-h3-ths
>                - allwinner,sun8i-r40-ths
> +              - allwinner,sun20i-d1-ths
>                - allwinner,sun50i-a64-ths
>                - allwinner,sun50i-a100-ths
>                - allwinner,sun50i-h5-ths
> @@ -159,4 +164,17 @@ examples:
>           #thermal-sensor-cells = <1>;
>      };
>  
> +  - |
> +    thermal-sensor@2009400 {
> +          compatible = "allwinner,sun20i-d1-ths";


New compatible does not warrant new example. It's the same as previous.
Drop it.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
