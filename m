Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AD2C77B6C
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54MAp3V2jd8NFgNI0ow5vb3nXMvPyZOoB265x6/HTwA=; b=3vhswDCXvaqT8b
	w7GI0Oks4KiTlZwc/ZXSBMN6Lm4vkfZazInNNyzUt0skgkmLPK88xXNruVPphhEqerRDr52KbQkQi
	SGk4XEwh0iuXoedfFbzHxETZB4KqokfeFHvRCM0KuLo0f5Cm8yii2vkSsq52mGfuf5xaObm3usg5V
	JhwXUhv/UdlUA1O4eCCixeYMDNgilkjZ/1XB9/m7v8/QuIXRll23kR6FM6ncCYnd7WobrPiP8e426
	KR/M3rnLOFG4U+I5BkqqPfpKzjUNbcWC55ezRkR2p0oWVS4mVT9vCgWMZZ75rtJvgO0QHTYYtYsC8
	Mlht8yYPd9Bg0gYbKbeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUN7-008GPv-0s;
	Thu, 06 Apr 2023 18:30:09 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUN4-008GO2-1a
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 18:30:08 +0000
Received: by mail-ej1-x62c.google.com with SMTP id 18so3564929ejo.13
        for <linux-riscv@lists.infradead.org>; Thu, 06 Apr 2023 11:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680805802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8xOnV6tCyOvs2gyhgdBhfMQe4yUXu7o2kH7bC3OOGM=;
        b=b5iOLOQnrmb7I5cMr9PLoh+DDsoWrJ+Ww372OHESD7omSrAJR3M++5RGQVCCpEMnqV
         +ZPdYWfc0xJRascTYU+atPwFyQEhrdeBEsknBfAgsySMLj6L20we/1yAjDE/6rLxYHjy
         yxaS6JvdEk90suKMGRKGt3PD4FqAGSu9UfmsZiI28Hx3I4nmZYoAqHNT8DiNjLh4gwDI
         DTwKATnpSPviipdh3ORflYJW9yZh3A8emn00RrbRuNwrBCAfT7kk2ru1o5Ofzzy526W3
         PpFKlhgOvB+XXmGcaOTYhvCtapYcaJae29qE4dUeYQc1+s4f5zfr2GdPetEtghIFTSEZ
         pejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680805802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8xOnV6tCyOvs2gyhgdBhfMQe4yUXu7o2kH7bC3OOGM=;
        b=frfLhWqmZCs+L0KMuUdktWHeoxn6Q0CrNDQlNP8tHuKAHJ5CW+OtjMRjCmrY4vxSly
         3oqTkkczvtfNxz8Oi3Ph8NmRX6fRWNZ2fr+p2gdlfanCFo8nqQAFNsxiFHLZoGdYVoxS
         J5J4KCwUR1rP8CGLE+k+wIydOePYigCbAsxJv2vG+VRoHsee6PBUFR4wNSiB2dd0hQsS
         Pw+uIoixW6o6v/dmwe7ICbuER3l6vCYxjkY6rRV9ClLaFUoh8X+6qyqoayZN4nwoq99b
         NSA/C5P6qRT4Bk1uucK7MVbUgZQrbsunr81N2juZRT662DLggAPQaOy04qgpxpak64Mi
         GAUg==
X-Gm-Message-State: AAQBX9dui5aSvXP2odXkZXaLsIfjYd1p6AQBVyW5x+xr29z3okpIi7tT
	uxt3oXovZyuLSRf4ATC/F71hxQ==
X-Google-Smtp-Source: AKy350bJ8pSDWF8uwl4GVm21uI5EfXApiU2Dd5qO+ZXzcTAbihmplWOrQLDopnmNmkwgaLMJ391tAA==
X-Received: by 2002:a17:906:3b86:b0:8de:e66a:ece9 with SMTP id u6-20020a1709063b8600b008dee66aece9mr7792594ejf.24.1680805802128;
        Thu, 06 Apr 2023 11:30:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id fy29-20020a1709069f1d00b0093313f4fc3csm1124541ejc.70.2023.04.06.11.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 11:30:01 -0700 (PDT)
Message-ID: <833b68a5-263d-d293-4910-2ca50b43e60d@linaro.org>
Date: Thu, 6 Apr 2023 20:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 1/2] dt-bindings: soc: starfive: Add StarFive syscon
 doc
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
References: <20230406103308.1280860-1-william.qiu@starfivetech.com>
 <20230406103308.1280860-2-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406103308.1280860-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_113006_529332_2E99461B 
X-CRM114-Status: GOOD (  15.34  )
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

On 06/04/2023 12:33, William Qiu wrote:
> Add documentation to describe StarFive System Controller Registers.

Subject: drop second/last, redundant "doc". The "dt-bindings" prefix is
already stating that these are documentation files.

> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> new file mode 100644
> index 000000000000..0d0319426b67
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -0,0 +1,56 @@
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
> +  The StarFive JH7110 SoC system controller provides register information such
> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - starfive,jh7110-aon-syscon
> +              - starfive,jh7110-sys-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +      - items:
> +          - const: starfive,jh7110-stg-syscon
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    type: object

This should be rather specific schema, so $ref.

> +
> +  power-controller:
> +    type: object

Same problem.

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@10240000 {
> +        compatible = "starfive,jh7110-stg-syscon", "syscon";
> +        reg = <0x10240000 0x1000>;
> +    };
> +
> +    syscon@13030000 {
> +        compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
> +        reg = <0x13030000 0x1000>;
> +    };
Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
