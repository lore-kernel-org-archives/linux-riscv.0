Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76CFC3A5A7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yV+dhh+A+GJUD8hrll8PgOn8nOnaGgJLSPtqVkPAbFY=; b=sz0EXp96nj3Vu5
	oJ/mEjF25/6FdQDUTvHdaiAeYKztv9mSCjs8GtuVsWEOSkAiT4+dkaSwrLKvEg0bnbhxDDayCsrwJ
	JGkJQQom3xCTbS9HtTzHXdnWSx3JCXWLfBTh5xZfpOYYNnOz9IM253cabTkISyjgAhq8Vst+0p09l
	eFDxe+x1NvnDvGmvCvyAOdQyB/toSfU3Qy6fKB5olihjL6lYB7OHzEgM2iRAGI8KMmekNn4HBY1bA
	zemai3TlNT8GZTZGLe6r/zqlLhEocH65iP7bQbXbabaNpMSAxMJLOfoBKmcO34oawhESNC1Gp+OZW
	wHn0vXTyJj9FaBGDvoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cng-00AXUq-QC; Thu, 08 Dec 2022 09:02:40 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Ckd-00AUdh-Ss
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 08:59:33 +0000
Received: by mail-lf1-x12b.google.com with SMTP id p36so1008295lfa.12
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 00:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tydSjWpRvASEylrj7lgLwaBMTJwOnmS8BCH73tzadaI=;
        b=Zl46YC9PXbJa4rPKgDfkUEVbAm3F2rHn9Tx7G9B7riEQ8IKFz0vBBD9+ZbwX3eY8VQ
         z/cBDve1xXeuXR91tDVVecjVZsnhxs7Qq/tWJdMdwwgDz6gHvURIqRP14MTst3+Le/Ey
         iwoFGxxrkA5tF3lvavhQWnKpneuBlhKhY2F9Z1QKZxQFwNcofGXGE69wO8owSGTqcdnV
         7jjqFdvPckkUehotlwG7r/diYDP+BH8XywBE4gcJhHgvtbZt3vw4n3571FCgfY0sxOgx
         tkbHfNYcmsdBSJ/j4akFW9O+AnU0zSkmum9SZ5JAaAhocyFdLaV6WEWb3BGGEsjKc7+p
         ULaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tydSjWpRvASEylrj7lgLwaBMTJwOnmS8BCH73tzadaI=;
        b=xNiQ2SfPoKuH5V6QnTYtjp+vOoJ2m66yITJCX9QZzW8w4xftUiP0D8yda1oBjfNAcX
         wE5A5N6qwTJSr02ykttxWypeuqDricvDt903S03maKgXOKK4JZ8LF0o7QdCZKuu5pVuB
         Fl3FKgTRJgKROoCiveb8MHhbebNdib4fbpfONizoQrELvZx6hVX4z3SPNT9daIe3ebKg
         bwAyLhgqt3yaI+ka8lA/5P/ccYuJRdLKzlV4OpT4Sz/VW6qT1V8YU0K73+TJUO6YQ51m
         b1+7PRyQ5y9BBb9wJaATgy7NleI4u7EwbH5a0YgvTX82Y+UeJQLxpypvwejN5x6YsG7F
         xBuQ==
X-Gm-Message-State: ANoB5pn4L8aNF0nE5OiKT9IontKjyR2KjdOw7Wkc63SG5lEd/4D3trZd
	xZUhXPLwt5kkxQrrmLuTkyJ6+A==
X-Google-Smtp-Source: AA0mqf557QBudXkUTrEdl0SSFEXGqPr0sabFkkGlQnXdACcs3ThYOLOVf1i14U7d4+89QLusHaeEdg==
X-Received: by 2002:a05:6512:a84:b0:4b5:827:3cac with SMTP id m4-20020a0565120a8400b004b508273cacmr19243928lfu.154.1670489968832;
        Thu, 08 Dec 2022 00:59:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u17-20020a05651c131100b00279f213302bsm1400931lja.57.2022.12.08.00.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 00:59:28 -0800 (PST)
Message-ID: <d0226fa9-9253-72fc-2fb0-5bfbbcba5d86@linaro.org>
Date: Thu, 8 Dec 2022 09:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RESEND PATCH v2 1/3] dt-bindings: power: Add starfive,jh71xx-pmu
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
References: <20221208084523.9733-1-walker.chen@starfivetech.com>
 <20221208084523.9733-2-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208084523.9733-2-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_005932_055283_8F049AF3 
X-CRM114-Status: GOOD (  13.30  )
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

On 08/12/2022 09:45, Walker Chen wrote:
> Add bindings for Power Management Unit (PMU) on the StarFive JH71XX SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../bindings/power/starfive,jh71xx-pmu.yaml   | 45 +++++++++++++++++++
>  .../dt-bindings/power/starfive,jh7110-pmu.h   | 17 +++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml

Filename matching compatible, so:
starfive,jh7110-pmu.yaml


>  create mode 100644 include/dt-bindings/power/starfive,jh7110-pmu.h
> 
> diff --git a/Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml b/Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml
> new file mode 100644
> index 000000000000..f308ae136a57
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/starfive,jh71xx-pmu.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/starfive,jh71xx-pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH71xx Power Management Unit
> +
> +maintainers:
> +  - Walker Chen <walker.chen@starfivetech.com>
> +
> +description: |
> +  StarFive JH71xx SoCs include support for multiple power domains which can be
> +  powered on/off by software based on different application scenes to save power.
> +
> +properties:
> +  compatible:
> +      - enum:

Wrong indentation.

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +          - starfive,jh7110-pmu
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#power-domain-cells"
> +

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
