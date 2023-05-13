Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C1AC77B7D
	for <linux-riscv@archiver.kernel.org>; Sat, 13 May 2023 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHyP7kYeWpSN+iiTZF4NYhpUX7Vcn70imIqiWSw6GKE=; b=UErevqKjpgc291
	4iFo0v61kASfcZZlHCkZt1DXe00PvDkVNgtmjRqasW+6Bjan+D1VrD7L84hhZGQhJcvMbGM0z0DZW
	znd1Fc1niygkcc3/HHiouiTGXR4Ys8TWJb4oRWc/KlFxeYOqvIwrXW1CwZqsnnA14tM2aBsSKC7g9
	rmze3Hsb70JV7G/WMmqouRMUyXui3TGsvcq/LiLmAi6U2GFsHafzs451U+wFrCDQL0D/66cBM0mXT
	wW0w+WtZYUvm0ipACdjt+/ZvqIUHJjwW/1fA8j8vb9yXkANqFIMSIqyh/dLL7QuFm1aiUan88aMVz
	TYvIvO0FmBKlNkHfq+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxtO1-00FVt9-11;
	Sat, 13 May 2023 17:50:29 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxtNy-00FVsO-0n
	for linux-riscv@lists.infradead.org;
	Sat, 13 May 2023 17:50:27 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50bc3088b7aso20858976a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 13 May 2023 10:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684000224; x=1686592224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X8d2KXRCGDR3c/BQhN0FBkqec9oklx/aHt7TQaWGLAE=;
        b=yqy+K5qOjT2HCUMgVZL5+yMNzrG3KIxCwUpr2HYmbWgn/pIpSv7MSlHYzEBaDSQN0F
         hcd0nFHL7GSn6kDMuSvLQJ3oIrbnrcpsfHWwnN+/5uMO9pZctvz4rBs5qQPhthQ0D4y5
         adkGcNDy37/0RSeb61daDvkdYQmhUomwp9pv4Mmpm5k66dL1S8n0UZJe17nOeKPkEG78
         TBLX1qlNGQzK478yaEIPa9wLscIOIHzhQWql64Ex5CyP29IL2wZXonctlKs/Q1RJNcYB
         vEsYD0eyKAq9YtSU6+PVaG3aNX3St3mMrAfUcKBagV5oPeuEGROMstunKotTRsBnMenS
         ++DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684000224; x=1686592224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8d2KXRCGDR3c/BQhN0FBkqec9oklx/aHt7TQaWGLAE=;
        b=e+m1DhzmRVPSMI4G8sPCoOlYCRBfeqBMInor/ppNnCOyajoR45MHYSaIXdxShqyldQ
         I2BARBHRXidUYpRpQX2TvxlKgzsLAyLra8pOdvfCkL/jLL46r5bWev6454+JHriRVa5w
         MGcc85t5sD0JIbbdKVYEpaGJ4MG2+H7Oko5bL9P9m48b1nUh94HFAXKEtcxDY8QAB6wU
         TEUwL6S47ubv7Tj8N/QPYRft6rYjcdaghcIz92j7pO086fF/CvExZaxhlB7j19VuiQT7
         K9FKMocpRWAFw3PhyoSaaesh+SVQ3vjzgUbXbSzojCnWeNENQwFTFccFRo49ethNdfgO
         J+AA==
X-Gm-Message-State: AC+VfDxAl0DRFjpN12pVFSUEP1uZQJcPG5/qjmj/XUOS1pVWt1QKK00v
	36zVD24QkZZb9eCkp9M6xqE7+3bfq4oT4+iyU5diAg==
X-Google-Smtp-Source: ACHHUZ5XkUMcRaZZmMQwIXdNF25tNNfnaVOKYKwuDAexzMiguHzUPXzwxlxCIgOBN3x+LkOTwpISHQ==
X-Received: by 2002:aa7:c744:0:b0:50d:89a3:d909 with SMTP id c4-20020aa7c744000000b0050d89a3d909mr19430241eds.30.1684000224482;
        Sat, 13 May 2023 10:50:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bc2d:23f8:43c2:2aed? ([2a02:810d:15c0:828:bc2d:23f8:43c2:2aed])
        by smtp.gmail.com with ESMTPSA id r9-20020a056402018900b0050dab547fc6sm5248943edv.74.2023.05.13.10.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 10:50:23 -0700 (PDT)
Message-ID: <90f24883-4653-d099-14cc-38e2ecbbd189@linaro.org>
Date: Sat, 13 May 2023 19:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 2/6] dt-bindings: riscv: add riscv,isa-extension-* property
 and incompatible example
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
References: <20230508-hypnotic-phobia-99598439d828@spud>
 <20230508-sneeze-cesarean-d1aff8be9cc8@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508-sneeze-cesarean-d1aff8be9cc8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_105026_299203_8D32585C 
X-CRM114-Status: GOOD (  22.65  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 08/05/2023 20:16, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> This dt-binding is illustrative *only*, it doesn't yet do what I want it
> to do in terms of enforcement etc. I am yet to figure out exactly how to
> wrangle the binding such that the individual properties have more
> generous versions than the generic pattern property.
> This binding *will* generate errors, and needs rework before it can
> seriously be considered.
> Nevertheless, it should demonstrate how I intend such a property be
> used.
> 
> Not-signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 61 ++++++++++++++++++-
>  1 file changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 405915b04d69..cccb3b2ae23d 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -100,6 +100,15 @@ properties:
>        lowercase.
>      $ref: "/schemas/types.yaml#/definitions/string"
>      pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
> +    deprecated: true
> +
> +  riscv,isa-base:
> +    description:
> +      Identifies the base ISA supported by a hart.
> +    $ref: "/schemas/types.yaml#/definitions/string"

Drop quotes.

> +    enum:
> +      - rv32i
> +      - rv64i
>  
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false
> @@ -136,8 +145,32 @@ properties:
>        DMIPS/MHz, relative to highest capacity-dmips-mhz
>        in the system.
>  
> +  riscv,isa-extension-v:
> +    description: RISC-V Vector extension
> +    $ref: "/schemas/types.yaml#/definitions/string"

Drop quotes.

> +    oneOf:
> +      - const: v1.0.0
> +        description: the original incarnation
> +      - const: v1.0.1
> +        description: backwards compat was broken here
> +
> +patternProperties:
> +  "^riscv,isa-extension-*":

Are all these -i/-m/-a extensions obvious/known to RISC-V folks? I have
no clue what's this, so the question is: do they need some explanation
in the bindings?

> +    description:
> +      Catch-all property for ISA extensions that do not need any special
> +      handling, and of which all known versions are compatible with their
> +      original revision.
> +    $ref: "/schemas/types.yaml#/definitions/string"

Drop quotes.

> +    enum:
> +      - v1.0.0

Your example should not validate here... you have there v2.0.0 and v1.0.1

> +
> +oneOf:
> +  - required:
> +      - riscv,isa-base
> +  - required:
> +      - riscv,isa
> +
>  required:
> -  - riscv,isa
>    - interrupt-controller
>  
>  additionalProperties: true
> @@ -208,4 +241,30 @@ examples:
>                  };
>          };
>      };
> +
> +  - |
> +    // Example 3: Extension specification
> +    cpus {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        cpu@0 {
> +                device_type = "cpu";
> +                reg = <0>;
> +                compatible = "riscv";
> +                riscv,isa-base = "rv64i";
> +                riscv,isa-extension-i = "v1.0.0";
> +                riscv,isa-extension-m = "v1.0.0";
> +                riscv,isa-extension-a = "v1.0.0";
> +                riscv,isa-extension-f = "v1.0.0";
> +                riscv,isa-extension-d = "v1.0.0";
> +                riscv,isa-extension-c = "v2.0.0";
> +                riscv,isa-extension-v = "v1.0.1";
> +                mmu-type = "riscv,sv48";
> +                interrupt-controller {
> +                        #interrupt-cells = <1>;
> +                        interrupt-controller;
> +                        compatible = "riscv,cpu-intc";
> +                };
> +        };
> +    };
>  ...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
