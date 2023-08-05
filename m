Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE000C001DE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 21:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQhtZp0o/KkUNCezGmX5T2LZHcF7nP62Z8bLGwKmV0I=; b=bS5o38q+liEGUH
	h0eGCbrxK9hAwdWETplTNeLkLqumTLQoFp7gVZZK6NStqxHlpXOiqK+G0zS8oM1eO59R9opCdcnIk
	Wcy/gesOSTQPI22epKo+PamPK8NchBNUl2BAJaUcWJ43Ge8QUB4kb3D1Vu+q0D99K2fSueJ62k0r2
	/0Xh1sFeqpb9ZhiIntWe6bX/IRBAPARqipbDLRqqyRmoDunQfpGZQAovjQrQfcR8hAVixkkI7hONr
	D0QjqS3XfFeD8AFoeBoKl/8ARNxNEKJMPJv/veyxRd3t43pfvbWSDrG3sMv2hnw66X6tVnSvOh49H
	i1cVaJSq8hx14a8vEs7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSOPc-00EZ3c-2d;
	Sat, 05 Aug 2023 21:02:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSOPZ-00EZ34-23
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 21:02:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so12998195e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Aug 2023 14:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691269325; x=1691874125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KbvfI0fLsFlB/xRYqDFhF1GRIPCNZdIym6zPJmUh4vQ=;
        b=LOtzuv3SuN0B4PkixubrxbsOeLlUbqyMJc3yJCvIpzuydQG9bdGn7jY3D32/rIXdmt
         ztkBsdLiqkz6W5SZfAf6c3heNK87LTPVi9E/tMyaO+iEPYSYOblRVDac0jDsxpvTo4WG
         URfWY0b/QgIIIEyMzFXV763mY5KgOfmRLIdkn444n2dZGt0IklB3OpeyHjNV719v4szo
         IWNIDTd9PW6+fymfIIBrF+FM3IZ0UtvivblDOSX28RvlBhzVokwT/lf+ME+lb/2fYpRr
         fe7iG1zrIdUm2uCIvFXA8yjqAuifuZ0I0gJddzRZUOiSeWS4snSu3QmyWI4nzwG3KHsV
         RGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691269325; x=1691874125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KbvfI0fLsFlB/xRYqDFhF1GRIPCNZdIym6zPJmUh4vQ=;
        b=YBXaebOv381GtQEfhhMLQEQMwEWnEfLpqkX7fJzcnQ5O3T3ZxgP9pd97E5NT3s6THE
         UjwK3ueLFYTAjTlvYTtaq9PhsH0j37PkGQp2IETBpBclEjGKqBzJ75A6t2SYmR7Tvo3W
         YGMlSs5qUMfqpF6i+abKtyNUhryeX6Uy7DwQOZhSsV6ALWj4/MLVUYqEMGkn5hocESlR
         rMkRYM8sg6DurfVvAEG3qj+iMnYV8ULJX8kLeWNQn2t2o85Uvw7p5/JUKoTKlaCoBh+1
         Lz7WQcYZ0nf+c0+RefzoxY0xr8I9aeDD2dB6+Z7jb2J0Up1ypqoBLUr+NCAU64pzD2Lf
         qPAw==
X-Gm-Message-State: AOJu0YyqWJvpNa2U7NDa6mxjOAV2DCj+EJcgIFAMksTB0azHrb8jdzC3
	sCv1QGN9g6y/QMKfxx0hCSGL9g==
X-Google-Smtp-Source: AGHT+IE63dFNf2CGjHbciT/HZuHu+h2YzjvFPIM0aIWKNMwJ2fvnAGhmQ7btvX284ZjXv1M6dmsSQQ==
X-Received: by 2002:a05:600c:364f:b0:3fe:4900:db95 with SMTP id y15-20020a05600c364f00b003fe4900db95mr3609592wmq.37.1691269325144;
        Sat, 05 Aug 2023 14:02:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id z10-20020a5d640a000000b003178dc2371bsm5503421wru.7.2023.08.05.14.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 14:02:04 -0700 (PDT)
Message-ID: <37a636dd-fbd8-d475-8814-e0cc6d5cc812@linaro.org>
Date: Sat, 5 Aug 2023 23:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: snps,designware-i2s: Add
 StarFive JH7110 SoC support
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-riscv@lists.infradead.org
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
 <20230802084301.134122-3-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230802084301.134122-3-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_140209_682066_A38FD286 
X-CRM114-Status: GOOD (  11.72  )
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

On 02/08/2023 10:42, Xingyu Wu wrote:
> Add the StarFive JH7110 (TX0/TX1/RX channel) SoC support in the bindings
> of Designware I2S controller. The I2S controller needs two reset items''

Thank you for your patch. There is something to discuss/improve.

>  
>    resets:
>      items:
>        - description: Optional controller resets
> +      - description: controller reset of Sampling rate
> +    minItems: 1
>  
>    dmas:
>      items:
> @@ -51,6 +75,17 @@ properties:
>        - const: rx
>      minItems: 1
>  
> +  starfive,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to System Register Controller sys_syscon node.
> +          - description: I2S-rx enabled control offset of SYS_SYSCONSAIF__SYSCFG register.
> +          - description: I2S-rx enabled control mask
> +    description:
> +      The phandle to System Register Controller syscon node and the I2S-rx(ADC)
> +      enabled control offset and mask of SYS_SYSCONSAIF__SYSCFG register.
> +
>  allOf:
>    - $ref: dai-common.yaml#
>    - if:
> @@ -66,6 +101,66 @@ allOf:
>        properties:
>          "#sound-dai-cells":
>            const: 0

You need to constrain clocks and resets also for all other existing
variants.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: snps,designware-i2s
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +        resets:
> +          maxItems: 1
> +    else:
> +      properties:
> +        resets:
> +          minItems: 2
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-i2stx0
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5

Also maxItems

> +        clock-names:
> +          minItems: 5

Also maxItems

What about resets? 1 or 2 items?

> +      required:
> +        - resets
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-i2stx1
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 9
> +        clock-names:
> +          minItems: 9

resets?

> +      required:
> +        - resets
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-i2srx
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 9
> +        clock-names:
> +          minItems: 9

resets?

> +      required:
> +        - resets
> +        - starfive,syscon
> +    else:
> +      properties:
> +        starfive,syscon: false
>  
>  required:
>    - compatible

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
