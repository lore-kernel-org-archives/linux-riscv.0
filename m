Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F07C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 10:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8V11yE8/z4Qcl47njz2J+LbcuLAXpNjND6VkTGXqOs=; b=rNf8gt8EXjWS4w
	5Xw4sHvvbN9zqhxqqyzIyrwGyGGZpQ6R0kUOG6z6ZzRSVcp1PRMUck2iQzO82OURd3ioZwMp4iWbo
	bjjpsYndo8S73ZhbXY2L+yVVEJVhIM2fvg02V3m6RGvlOltCDoOqMyLRywttMsDDdPPgaODRibi4G
	++mZzmmeoxKTmcF/7RRzj1NvOCilx0auodZgXoNPuwS/RNbydnumT1vb02YBJCmGFswzHgA3NdNGo
	LZXlVnGHdFQj/+QKjBLNARFSjS1RTz653hELsDovX+NHb17Q9qch4BKgy5fufH144/pdc/Tggy5me
	XY/2r/iGkHIvMSSYgHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13ZS-00FhV7-U7; Fri, 02 Dec 2022 10:47:06 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13ZP-00FhTA-Mp
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 10:47:05 +0000
Received: by mail-lf1-x132.google.com with SMTP id d6so6780933lfs.10
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 02:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Vtg1LtCfjtyNCzyBNU5YXITjkmZBt3+mmKj+CQPVVc=;
        b=UD3RDKAs3ew754ylVfIQCZ/no50brGFS4qCHmlg5qAuU5YJ45sQ9/DYEWipoJDUrsd
         8oFBWNEhCsEvrcJOao509FHXeaRMLuWw5NWqR7TIY246o9UH4Q2SKQ+sK0hZYuZaFyYg
         XvTC2EHgY2NCB2+3Ovm5X+nF5pVBG69Cae63PobFnrLZBz7j6cHixXmFnhP55uLTiRt8
         UuXSCxnod/z2W+YT9S2M3LIpLk5jf3SaHjURYTzrpfJOZeGKFI+dpxFgbu26BKq+ODhK
         sYpsQU5mmVscmZ1pcPNSa+B8auqVN0HyyNBTosair3SGOq8wt47vDWbvAeDDdRb5zgSm
         BYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Vtg1LtCfjtyNCzyBNU5YXITjkmZBt3+mmKj+CQPVVc=;
        b=N41rKdOsWydFGc8qCNd8bgDRBVlVkM6Eesv0v8BvEpxc02/ap+dTNMmVMCxZBDwfcw
         wxqmGE3bBzO6YAqTOoipAaJYKk8HAwyhBfT9ITojf8KZVKIt5qOB7spq1/E8JPZnMk6N
         kCJbhvWTK36EpWjorQjIZNdRkA5xRbXhdbeQEOsOS5Kqrx8KfPwQOhhm8WxjvisXeF3i
         apkH9E/EZN4n9aO+2wWewRFj/pGwGGqTs1iIGXSsojaAwFtUanfV+sVaHNNc9MQupR+6
         gNq8TTyLA2KaOW6s8yVPs03wdTQ1P5n/acZkM3O1q6UuJ4BZBNhAFuq8YPkOf0WqRSYO
         qMoA==
X-Gm-Message-State: ANoB5pkPmlIGHp5vQY7S0GVQ2zifNlpf10dF9+mvFHvTLR6Kc2iwti1y
	dMdfoNFdhcEKU0vrIfzZwQhDWA==
X-Google-Smtp-Source: AA0mqf6gr/P7/w7zGPP1KlPQazaqNcuOmcl9Iu9U5TcIblGgOCA0ThAsves7sYSTqYRGj0mj2QSL+A==
X-Received: by 2002:ac2:4c27:0:b0:4a2:4df9:4cab with SMTP id u7-20020ac24c27000000b004a24df94cabmr24215355lfq.56.1669978021914;
        Fri, 02 Dec 2022 02:47:01 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bk37-20020a05651c23a500b002770eafaafbsm596033ljb.99.2022.12.02.02.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:47:01 -0800 (PST)
Message-ID: <cb8deb55-902a-0058-4764-a5f391f8de6d@linaro.org>
Date: Fri, 2 Dec 2022 11:46:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/3] dt-bindings: watchdog: Add watchdog for StarFive
Content-Language: en-US
To: "xingu.wu" <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org
References: <20221202093943.149674-1-xingyu.wu@starfivetech.com>
 <20221202093943.149674-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202093943.149674-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_024703_801948_8315C5A9 
X-CRM114-Status: GOOD (  16.72  )
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

On 02/12/2022 10:39, xingu.wu wrote:
> From: Xingyu Wu <xingyu.wu@starfivetech.com>
> 
> Add bindings to describe the watchdog for the StarFive SoCs.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../bindings/watchdog/starfive,wdt.yaml       | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
> new file mode 100644
> index 000000000000..ece3e80153a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml

Filename should be based on compatible. You do not allow here any other
models... If you intent and you are 100% sure you will grow with new
models, make it maybe a family-based name.


> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/starfive,wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive Watchdog
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"

Drop quotes.

> +
> +maintainers:
> +  - Samin Guo <samin.guo@starfivetech.com>
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Core clock
> +      - description: APB clock
> +
> +  clock-names:
> +    items:
> +      - const: core_clk

Drop _clk

> +      - const: apb_clk

Drop _clk

> +
> +  resets:
> +    items:
> +      - description: APB reset
> +      - description: Core reset
> +
> +  reset-names:
> +    items:
> +      - const: rst_apb

Drop rst_

> +      - const: rst_core

Ditto

> +
> +  timeout-sec: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - timeout-sec
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive-jh7110.h>
> +    #include <dt-bindings/reset/starfive-jh7110.h>
> +
> +    watchdog@13070000 {
> +            compatible = "starfive,jh7110-wdt";

Use 4 spaces for example indentation.

> +            reg = <0x13070000 0x10000>;
> +            interrupts = <68>;
> +            clocks = <&syscrg_clk JH7110_SYSCLK_WDT_CORE>,
> +                     <&syscrg_clk JH7110_SYSCLK_WDT_APB>;
> +            clock-names = "core_clk", "apb_clk";
> +            resets = <&syscrg_rst JH7110_SYSRST_WDT_APB>,
> +                     <&syscrg_rst JH7110_SYSRST_WDT_CORE>;
> +            reset-names = "rst_apb", "rst_core";
> +            timeout-sec = <15>;
> +    };
> +

Drop trailing line.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
