Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E479EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 18:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vk9NTl6u6vb1KDFfp+lDlzIaK4SXVW3N0CCA3+9W9KA=; b=P+6TvSuedcBP5t
	X3gB2FAZnmuA3QIrjyvLRDI8bR3JkHQ7dQqHdZoop4Vtfw4MrVduro20NdUR5wqg43tHrjWajmNcr
	3+vuz7Jlu1SSBO813eS5pIF7Eb8N49wjq7e97Z8b1reLAEhIH0ESBtQ3FIkJIJtNUvJEOF4DcB9af
	Fn0C0RlZugrHPF5PJn9yJvgl10gwfRmidKhIiQMJEKZH9PFlg/eF8kN3zKXTIrx+uPvTwPJ/xao9R
	Oh9wmb6n79n4keMZFnBO8zocseA+QZmcY1bfDX00Yw8pV15r17m9ku2uNBYoOoYavCWcjK4O4R7ux
	+aBN1Itg21SMEc43o6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q98oi-008rBu-11;
	Tue, 13 Jun 2023 18:32:32 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q98ob-008rAV-0f
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 18:32:30 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so13830465a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 11:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686681141; x=1689273141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IwQxZn6vCIOOod2WsqOS2iKK2dM5ILhVhEaw91jN+A=;
        b=g2x7nF958tTd0yUf6gMMWTZS7MXebEz/qJW0elxmWSc87Fy4YCx1ZGdo+z6qymqABN
         txZwoSEz2hg7Y0m2797wXOMCphi9mDkHsGIO/DqBcXJmRg1cFzYVm+rqTJ+p7H0nnsew
         SUB65kKWg4ET7UtQEmFm4fux3OG45w2OJ352q9LwWFJ5WmcaH7RxSFGnko3e1+L3BQ7l
         JUBMjAhqM2na6yTPxr+juOQz1hqkhuD5a48C6QOMOGSKOP/ssbWx/zHZ5MK2hPnj8hu7
         8GRHGbjwXjNGRKu817QyRD1kJ3CxbqQM7prUEBvmv/+yTuvL5NgOMYhcgtGCB4kf7MRd
         0Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686681141; x=1689273141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IwQxZn6vCIOOod2WsqOS2iKK2dM5ILhVhEaw91jN+A=;
        b=E8tzF+kjZO8MS3YR1J6hukd98/AT6TQn+XjusVyawBxCjR4wSniyB2DE7fWn1fimAS
         26obK8gICIzb3cWGVy8eULrJ7t99hlma2pgt4tL7GN4DPhoE36khvYny6BvX8TurJ6XF
         XOt3+ePIVu2Q2unjx80+LWUaRd3JcpaouzODJ5aqi/FYyNhbTP6/Mu552MntC9YRc1+B
         Kq14Zq49TRGSjKZYOj/h6p8lMPCiCiUq2bEP3YG+l8crO87uZrak3rF1ouumUOoLKavR
         QrgPB3OMG1/zXH59ilQW7h1Zoyg7eWmFNxyUWCyBesi0AlXEub67X/SJ/SzZBklJ0IwX
         qsrg==
X-Gm-Message-State: AC+VfDyfpcXLgPImSMKUJ1LRfoZbLyLLd8PDRLLCt/RRyVepp7kBvKWN
	hVGOxcoUw9xainl/HCUkM6bTNQ==
X-Google-Smtp-Source: ACHHUZ5vGVgTt9sy0qQTKp7+KaWUCWD8M2YRj/4q3fqu6qZXExsSGxGeMKWet0UvuiJIoHRwNhGNDg==
X-Received: by 2002:a05:6402:27c9:b0:506:bbf8:5152 with SMTP id c9-20020a05640227c900b00506bbf85152mr9960734ede.9.1686681141344;
        Tue, 13 Jun 2023 11:32:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d22-20020a50fb16000000b005149c7b1f49sm6647150edq.64.2023.06.13.11.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 11:32:20 -0700 (PDT)
Message-ID: <bdd464a1-2279-9019-a19b-4aab5dd6045c@linaro.org>
Date: Tue, 13 Jun 2023 20:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-3-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230613125852.211636-3-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_113225_245593_890D1BAD 
X-CRM114-Status: GOOD (  17.22  )
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

On 13/06/2023 14:58, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> new file mode 100644
> index 000000000000..a81190f8a54d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 SoC system controller
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The StarFive JH7110 SoC system controller provides register information such
> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: starfive,jh7110-sys-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +      - items:
> +          - enum:
> +              - starfive,jh7110-aon-syscon
> +              - starfive,jh7110-stg-syscon
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
> +    type: object
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-aon-syscon
> +    then:
> +      required:
> +        - "#power-domain-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@10240000 {
> +        compatible = "starfive,jh7110-stg-syscon", "syscon";
> +        reg = <0x10240000 0x1000>;

Extend example - add clock controller, add power-domains to STG (since
it has them, as you claim in the binding).

Make this one example complete.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
