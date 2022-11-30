Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2E2C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfGP65X3FUhGUCaDXVBkI42Jw9hmZy1O3eyG5C0U0NU=; b=3ZHvEtUYjc5evE
	pr2ecX3S7Kc878ZuRjDTTEvNl26cr7jeKA4zoZqNzh1VH4lQU2l+S3vGknVywKX41NJIcJpGaiDZe
	ssqFFdba2L0dIr1siD/LIaE7Hp55gNZzG2JELQmxA+3GD25hcu+BrClORYs9N28KWsSwGBptC0s2D
	5nhNk7+yg1ZKuy2xxA25KdDP3O0GseeZGSMHI0PQYpGOMsTUyFkStHnJB1yQF/N4pQJAvf1VuAVSj
	kNioC2VM3bJ+2hGcbj5XM5Rx/HmbY27iOZak6XjfdbULzVg+CKqnkCOtGbA0/ONmMEe2L/mSfTsUw
	OnSPL/AkGywgvPerbRBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0N4U-00GSnQ-D0; Wed, 30 Nov 2022 13:24:18 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0N1D-00GRHD-UG
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 13:20:57 +0000
Received: by mail-lj1-x233.google.com with SMTP id d3so20862500ljl.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 05:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j775fJtYiZtYgtZzcf7tx8CpBZLSxoSp8X/AC+Ipfjc=;
        b=AxMlx/VP3GmRPGBR91nj1J9zAtFpgsH/BossKJyGfj413DjN7jCtzPujQyxQo6utQZ
         6A2Rhwn2E34gEfwz+Jn4JS4xNilxbPz4p9JfF6WrFvwxWXqiOO2e7Roo5IcIds+X5Ck1
         XZQFM03zkwyxLdZgEZFxSDcoPkCCS1TcjtnC+JvCQDrALBxw123GzCJi9Og14IZFeHZh
         Dt5U4lzEhiTvP7l/I5CDhq09K+qlnRE/pmPXx5MhzpH2eTElu9Aosdxc2Wz89NQHPpZJ
         5P81tbm90OPsPa21xQ7n8YuIxgw5HoTdRVcWQ2U6iawFlspHE7jspaxpI8HTlYPwQGkB
         pdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j775fJtYiZtYgtZzcf7tx8CpBZLSxoSp8X/AC+Ipfjc=;
        b=P/oxnc64v3k6OzLhuzK2PKrVruXEUx2DZ6vTvqBF9zLzjC4j9w7Da3Rf5x5XrL8jdG
         0vw0YwSgmBfblcL/Hp+Wq8nbq5KJUaQ114nzBsd3gzLMPHrnif7r8fgNUCAshEndG5Fy
         Om/CjUJ1+JSHgtf0Qeg9S37tAq9zdkJ/nWV0je9IGiiqDse9FvucYM4qjoGDM2KtdIvJ
         Bs4F15CoOBi1pjv/7alQow9XdoeK9ZWqjhUBhYXYK2oITqPIZfqhGBACoZUXpDzUcwDc
         m3BI02rnE5UY2DHHWRU6f4Cs3uGvlpiyYHh9O9mJdojEUQpyd/CglZCY5wfOl4YW+/h2
         kfmg==
X-Gm-Message-State: ANoB5pl0fbRcc3lFrHostZacb9XWwfV3Fkj2dryGv9thFfazMd6X6XQm
	YbD+modz62F3f3h01Mjj/q18xA==
X-Google-Smtp-Source: AA0mqf4Wdt0K6czlFiXdA0enEjqbC7cGLCeCdGkYedrL2PAR0uAWoNRStPZvBTjW3+msDrN/LcSOeA==
X-Received: by 2002:a2e:9ec9:0:b0:279:c19f:a6d with SMTP id h9-20020a2e9ec9000000b00279c19f0a6dmr1518980ljk.37.1669814453832;
        Wed, 30 Nov 2022 05:20:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id r7-20020ac25f87000000b004971a83f839sm258676lfe.39.2022.11.30.05.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 05:20:53 -0800 (PST)
Message-ID: <8a8f502e-e0ed-d638-0b56-74edcbca2134@linaro.org>
Date: Wed, 30 Nov 2022 14:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive crypto
 driver
Content-Language: en-US
To: Jia Jie Ho <jiajie.ho@starfivetech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-6-jiajie.ho@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130055214.2416888-6-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_052056_049994_17D80788 
X-CRM114-Status: GOOD (  17.66  )
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

On 30/11/2022 06:52, Jia Jie Ho wrote:
> Add documentation to describe Starfive crypto
> driver bindings.

Please wrap commit message according to Linux coding style / submission
process:
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586


Subject: drop second, redundant "bindings".


> 
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> ---
>  .../bindings/crypto/starfive-crypto.yaml      | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/starfive-crypto.yaml
> 
> diff --git a/Documentation/devicetree/bindings/crypto/starfive-crypto.yaml b/Documentation/devicetree/bindings/crypto/starfive-crypto.yaml
> new file mode 100644
> index 000000000000..6b852f774c32
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/starfive-crypto.yaml

Filename based on compatible, so starfive,jh7110-crypto.yaml

> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/starfive-crypto.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive Crypto Controller Device Tree Bindings

Drop "Device Tree Bindings"

> +
> +maintainers:
> +  - Jia Jie Ho <jiajie.ho@starfivetech.com>
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-crypto
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    items:
> +      - const: secreg

Why do you need reg-names for one entry?

> +
> +  clocks:
> +    items:
> +      - description: Hardware reference clock
> +      - description: AHB reference clock
> +
> +  clock-names:
> +    items:
> +      - const: sec_hclk
> +      - const: sec_ahb

sec seems redundant, so just "ahb". The first clock then "hclk" or "ref"?

> +
> +  interrupts:
> +    items:
> +      - description: Interrupt pin for algo completion
> +      - description: Interrupt pin for DMA transfer completion
> +
> +  interrupt-names:
> +    items:
> +      - const: secirq
> +      - const: dmairq

Drop "irq" from both.

> +
> +  resets:
> +    items:
> +      - description: STG domain reset line
> +
> +  reset-names:
> +    items:
> +      - const: sec_hre

Drop "sec". Why do you need the names for one entry?

> +
> +  enable-side-channel-mitigation:
> +    description: Enable side-channel-mitigation feature for AES module.
> +        Enabling this feature will affect the speed performance of
> +        crypto engine.
> +    type: boolean

Why exactly this is a hardware (DT) property, not runtime?

> +
> +  enable-dma:
> +    description: Enable data transfer using dedicated DMA controller.
> +    type: boolean

Usually the presence of dmas indicates whether to use or not to use DMA.
Do you expect a case where DMA channels are provided by you don't want
DMA? Explain such case and describe why it is a hardware/system
integration property.

> +
> +  dmas:
> +    items:
> +      - description: TX DMA channel
> +      - description: RX DMA channel
> +
> +  dma-names:
> +    items:
> +      - const: sec_m

tx

> +      - const: sec_p

rx

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive-jh7110.h>
> +    #include <dt-bindings/reset/starfive-jh7110.h>
> +
> +    soc {
> +            #address-cells = <2>;
> +            #size-cells = <2>;

Use 4 spaces for example indentation.

> +

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
