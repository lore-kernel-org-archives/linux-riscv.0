Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EF2C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKWmCwve9PWd8IPE20ZnD1WwlwAG9hVLuT1TdQ+iHUE=; b=fawAe0Ayhj+tQp
	BpXOSr6ae3InWu1BLdnFT/1C2W/6kxkSTOA15M7UbEaIehPrKcTItjf+uktJs2koHFJ85n/s0iG1s
	DVu0y2egK5G9OloztEoP1vK7K409K9GHzgkaIpazO2alDqTq9szouEmns548pa1a2E5X0aNaNxNdj
	i+QPdBZRqN/f0jWkxWzgTRE6SHtFBigjNzMIg6gv8XLuO78ugOJ+LzigCCS7hyntGFXrxA6MA3ki+
	/uhIpoEd2hzXEaRgPX+PpnodfXO2NrWOzKOVRUPTEAmNbehzrQ/gTVBvIybKdcJyEP79GzIOj868i
	SMvnzyjavpXYjTt8iqtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA9kv-00DAJJ-OQ; Tue, 27 Dec 2022 13:12:33 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA9dk-00D71k-5U
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 13:05:27 +0000
Received: by mail-lj1-x230.google.com with SMTP id x11so13681284ljh.7
        for <linux-riscv@lists.infradead.org>; Tue, 27 Dec 2022 05:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ypp52Jl9epzjpr9pbWfQ6VvmlV2hnbQoOTkfbsiQ3I=;
        b=EoNAUxYY+zmf6Wsj+ariOLgHS1aIkJtMZ+xZEJof9u7wv2KLNKBzovaDAMLreyJZyh
         OOJADUWiItyv6TmJAgTkq8vDrIlqrjfuDNu56QgaQBw8A/Ca3poWSX1V7dHZilcoWbqs
         54IqPXsQ/+L8WbJcxsya75oBY4sE2o+b9vBIIbe8ysPikDoVO5qgllgUjCdTCHv6n7c8
         jdF/TO1DEoPRJqDBiN4dBKchNXRo6CqkS9lZwhZ+UaeKqKrHQ/bc6YBsYSUX0kpeMlVn
         VdJ5+GchDmVmXS0JkYY+6mUuFyZBW7pmrDlN8pC7dxyHYnw1CPEwJIGj8tFhWVtS1z0F
         LhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ypp52Jl9epzjpr9pbWfQ6VvmlV2hnbQoOTkfbsiQ3I=;
        b=KkI6tofK2NZVU5XwrIvZN6iD5SbHIBsulmj1O3aBZ00lMTdrfL2tz0kyPH2OHBqNuS
         farKiF3AgcU4I8j5YrH/MnBSuXhIP4VNJc075ECWD8LpYbPbjNZXje6Ub2DNoW/p9m7t
         7ri/oBW/xfIJEI9O/fkN516cJq7wYU2BxBlQg8ZD4xauW+X5BcNPfnSfQJw4oH4bi/t9
         OE7EDiIxTr376oaM0keXouHd52Y2wCF+9aWF1AF4jE5RhUKK4qk3la1YH10IJrcSOEJb
         V/BePAM2hgPz0gJLgHSjzT7XA1iQHfKRqr2QtazXlXZ/5xmGRH02ekPDWvY/eKckP+QV
         6/uA==
X-Gm-Message-State: AFqh2krRMEfBasOFdf4ItTnSjzjUrkSNvH89oNupxiDWzPmSIqA40PZZ
	rL0c5YShb65BhbU9MmXKQnGCZA==
X-Google-Smtp-Source: AMrXdXsrcaAyC6pf/voNWRFUuNfp7Hu/TWeVnY47/GLGkCGxBbKiCOmVDwvsMujUhs8TkrotZIovWg==
X-Received: by 2002:a2e:92cf:0:b0:27f:a604:22b8 with SMTP id k15-20020a2e92cf000000b0027fa60422b8mr4544273ljh.40.1672146306070;
        Tue, 27 Dec 2022 05:05:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u9-20020ac258c9000000b004bb8a796a6bsm2244389lfo.66.2022.12.27.05.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 05:05:05 -0800 (PST)
Message-ID: <fc5866ef-4eea-bc15-7cbe-d2e00c37e282@linaro.org>
Date: Tue, 27 Dec 2022 14:05:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: Add bindings for StarFive
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
References: <20221227122227.460921-1-william.qiu@starfivetech.com>
 <20221227122227.460921-2-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221227122227.460921-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_050508_989101_2E53F9BC 
X-CRM114-Status: GOOD (  18.96  )
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

On 27/12/2022 13:22, William Qiu wrote:
> Add documentation to describe StarFive
> designware mobile storage host controller driver.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

The subject is a bit redundant and not precise. No need to mention
"bindings" twice but "StarFive" is really too generic. Do you add now
all possible devices from StarFive? I see only one. Rephrase (use git
log to find examples).

> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../bindings/mmc/starfive,jh7110-mmc.yaml     | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> new file mode 100644
> index 000000000000..430dd5f24933
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/starfive,jh7110-mmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive Designware Mobile Storage Host Controller
> +
> +description:
> +  StarFive uses the Synopsys designware mobile storage host controller
> +  to interface a SoC with storage medium such as eMMC or SD/MMC cards.
> +
> +allOf:
> +  - $ref: synopsys-dw-mshc-common.yaml#
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-mmc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: biu clock
> +      - description: ciu clock
> +
> +  clock-names:
> +    items:
> +      - const: biu
> +      - const: ciu
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  starfive,syscon:

Name is not specific enough. What is syscon? Any syscon? This needs to
be specific.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      arg0:arg0 is syscon.

What is syscon?

> +      arg1:arg1 is syscon register offset, used to enable MMC function.

Describe the argument, not what it is used for, e.g. "offset of XXX YYY ZZZ"

> +      arg2:arg2 is used to enable the register shift of the MMC function.
> +      arg3:arg3 is used to enable the register mask of the MMC function.

That's not how the phandle array is described. Instead:

https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
