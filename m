Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A2AC7619A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 08:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CPq/EulPGQnapOj/Z7rD2GxBWklrrpw2/ncM9CqCfo=; b=vHzSiq5HeGdiHb
	p7M4fjpwcxDdipqgLMrVqwFu8v0eLHCEEo08HmECS63jHGiIr1oCFU5eF0oaecX6++hEIC/Ztr6pb
	nTJJGfZd+k2Y8s6ZYzZwycPrqPZ/Zaiev3eRe3aWZlwKnqR7uUciRQUYPESH1B98axQtTZ+ve8k7N
	1YLK2ewypo7FAOavzkdOdOX45LEKgGUyUCRpeb+pNZXNB4U+h7R+tPuVfxvQyYl0zOqUO6suXKz/m
	7+WzvSmO9n/bXQ953uVxmb+RxYNGG6cghZH+pR+Z2TFhOXQUKW+y7iV6MtMt4gaWyrEs3VcjvphiK
	ElJ3BOz/u/iwbafB5O7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVwe-002H8i-1B;
	Wed, 12 Apr 2023 08:35:12 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVwb-002H7c-2u
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 08:35:11 +0000
Received: by mail-ej1-x635.google.com with SMTP id ud9so26622469ejc.7
        for <linux-riscv@lists.infradead.org>; Wed, 12 Apr 2023 01:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681288508;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoGluq/J5303QEsfmSr2iQw9kmdWUed7sT0pHVPfXtg=;
        b=I3dy17S7m2Vab1t0U+AGdFNZsDwDtgsJFXI5Jlt8+Fq3CCTOSOk9aw+7wV4OLzQVE4
         DSTZOLwPrSBUZOYzFkbXMKLUGC45las/eApfBkCzJUZ46gJITnmIbD5vKp2llVNKaWOD
         LBZRzQCcPUG7/fRCEPBFHIedYZ+nfCHf4/2bJ/QAgVXi8GwaCoj8d9hury4TUpGzM0eQ
         LD9XbLgPpHAgwDMv701nn5YDVckB5mXBZBlCvXDUSfBDrR8sugEegXnfO+cFlT7oEhd3
         ZpbejePdOv5lU6rNSCeaozsMu50LVV9y5tSweiLThhzSwXkHrR/4sdrkalzk0D191TsK
         Q9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681288508;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yoGluq/J5303QEsfmSr2iQw9kmdWUed7sT0pHVPfXtg=;
        b=DRlZsKZqqMS/EOMuRsE8j4IYZ+D5inWb1d0atmTg0NSZbyLB/uvwi8QeaxDm4jdssQ
         uWAKW0qRVyYRR+MTz0j3DS1fhbZUxE26bEInWFlPd005WcMWigggcr+4hb6O7x26FOgW
         FrThcze250SUfJDCVWJbjaWJuiwJeashYnlDTtGi3RQPI6WitzYmL0VX6MD2A+3AZJjT
         gqrIXmWp+D5lCQ0cKc4TPt9VR7IvnPvryf5OhuvuOfb5LGN2bVLIjpTeIP2GLBX8SxEx
         h+ka/is7K73yyQGf1dCuYBLrwuQZzM+iSfad1ro1liS9KhE7UgeHdK/S8Pro+CFwCw2Q
         s9/g==
X-Gm-Message-State: AAQBX9epwUy1A25+Z/sGFodlAg0u3JSx5v8ozeuw1dYUmdZN2hkujd+2
	pFeaiR3Iy+UrhTQqJGewNwJqJA==
X-Google-Smtp-Source: AKy350ZF0tWwKgLIPhrVEdP4KEaeMRw0Kd5VxKsy15GudE93E4tkyqAIy7bUV5T2axpZPp5BerwaLw==
X-Received: by 2002:a17:906:e2c6:b0:947:a6d7:e2b4 with SMTP id gr6-20020a170906e2c600b00947a6d7e2b4mr5434302ejb.8.1681288508144;
        Wed, 12 Apr 2023 01:35:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id tg12-20020a1709078dcc00b0094a473988b9sm4173113ejc.27.2023.04.12.01.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 01:35:07 -0700 (PDT)
Message-ID: <cb97cf01-2dfd-7f93-2048-e05a806d468f@linaro.org>
Date: Wed, 12 Apr 2023 10:35:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 1/7] dt-bindings: power: Constrain properties for
 JH7110 PMU
Content-Language: en-US
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-2-changhuang.liang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411064743.273388-2-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_013510_066375_55900884 
X-CRM114-Status: GOOD (  16.14  )
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

On 11/04/2023 08:47, Changhuang Liang wrote:
> When use "starfive,jh7110-pmu-dphy" compatible, do not need the reg and
> interrupts properties.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/power/starfive,jh7110-pmu.yaml        | 14 ++++++++++++--
>  include/dt-bindings/power/starfive,jh7110-pmu.h    |  3 +++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
> index 98eb8b4110e7..ffb4406c2e56 100644
> --- a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
> +++ b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
> @@ -8,6 +8,7 @@ title: StarFive JH7110 Power Management Unit
>  
>  maintainers:
>    - Walker Chen <walker.chen@starfivetech.com>
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
>  
>  description: |
>    StarFive JH7110 SoC includes support for multiple power domains which can be
> @@ -17,6 +18,7 @@ properties:
>    compatible:
>      enum:
>        - starfive,jh7110-pmu
> +      - starfive,jh7110-pmu-dphy

You do here much more than commit msg says.

Isn'y DPHY a phy? Why is it in power?

>  
>    reg:
>      maxItems: 1
> @@ -29,10 +31,18 @@ properties:
>  
>  required:
>    - compatible
> -  - reg
> -  - interrupts
>    - "#power-domain-cells"
>  
> +if:

Put it under allOf (in this place). Will save you one re-indentation later.

> +  properties:
> +    compatible:
> +      contains:
> +        const: starfive,jh7110-pmu
> +then:
> +  required:
> +    - reg
> +    - interrupts
> +
>  additionalProperties: false
>  
>  examples:
> diff --git a/include/dt-bindings/power/starfive,jh7110-pmu.h b/include/dt-bindings/power/starfive,jh7110-pmu.h
> index 132bfe401fc8..0bfd6700c144 100644
> --- a/include/dt-bindings/power/starfive,jh7110-pmu.h
> +++ b/include/dt-bindings/power/starfive,jh7110-pmu.h
> @@ -14,4 +14,7 @@
>  #define JH7110_PD_ISP		5
>  #define JH7110_PD_VENC		6
>  
> +#define JH7110_PD_DPHY_TX	0
> +#define JH7110_PD_DPHY_RX	1
> +
>  #endif

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
