Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A5CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 10:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGWPrDvWQouC8JJzLlRQ/Yms8bj1Dquooi9Jc5fhGaM=; b=oY/joP00EXECSu
	9n2ypCf4GlkZs0C5+Xsn1EZpJVpXJrU13ZY3JHVcU9YQB5ueQA3Sj3RcjwMBKxj0jUiW/QCrkHNWN
	lkTVKLb/DSAHpaMqYlq66t5sXAkBioTZmA+L5cHMF/td3I1Vgyx2B5USsa1M9/u7xCl2TmVXJSkLh
	kBAzRAOeIA2wED1mL4r3+22jJnUwbVfJCCLRPrg2dBmG3zaCuwODXPI8hrB2bBPD/7v7IGlfmZgY5
	uwXgh5SYtT6s9Qnb5wqF2MS4atKwoQ3rhVpAC1dOI6gwSOmUyBdtcBdDnuCfBNEFRYtuvvksek611
	2EB4n6weSZrL8e7KP2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Ddc-00C57r-K0; Mon, 19 Dec 2022 10:44:52 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7DdX-00C51R-EN
	for linux-riscv@lists.infradead.org; Mon, 19 Dec 2022 10:44:49 +0000
Received: by mail-lj1-x233.google.com with SMTP id g14so8616412ljh.10
        for <linux-riscv@lists.infradead.org>; Mon, 19 Dec 2022 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DmjevszxUCHQTpFoG42/dWmGvxvU2NY1rLLfgP/zAYQ=;
        b=xk6bLMxZNZBEzQrCU6p5cVw1ASvxpJqWRDfaGf+X56qYU19GLYXZBYPM0lH4Yxf8JL
         WdKiOqSDQVbRhc7Va39RDQC21wP+cBx2VqOQOWswUn3jMpH6qFZuBnYUjXn38HKk8Mfo
         z+eTjr0UhVr28cJsXjBrQ62bysYvDCjyLqa0RrvJJN/zJkODjvVD0xm1g3dfibJAYGKq
         dGBCrqZ4mKEfCZh9riBPZ2kg4JIFMnR6NbyB/A6FMessjnuiwmFM8wYC6ISbiJZIBH6D
         98OYIoIHmcVxTkC4W6BjbTjrZUzt3X8yQwHimgmy0O0wzYXSBEZXGttM03jGeMJ1TOTG
         ww0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmjevszxUCHQTpFoG42/dWmGvxvU2NY1rLLfgP/zAYQ=;
        b=c1NuaxXm4ddJd3zpT0dq0IHzMdsGOLBN3PXqKbM2F5+jjyew9iBf/EfsDscCLOSL2T
         pEV4/qwNUp6qqlxLFKESC1hApSCobsqAMBamRBKc2D0yaAZrfmm5ec+etZXpGcURdjk+
         f0iqOvjk31cW+NPWnxyu7q/TG4bBrbvC5/Lh6m1JpMa6ffi3qSJ0s6ZwMg8ndgeKDzkb
         FvPUUNqtAktCfeDYObVLhxkSAJH134gT67w63tisA4jfr2mt+K/o9bUCFMG0qByf2Um4
         Lip8pCeRJzrbIXcn8PMuwhCVTqnfgbbu+nKY2RcLw3n2Cl1j+JA/BR//3QQdey75l6Ad
         8/Qg==
X-Gm-Message-State: AFqh2kriJzRS/6xmnVr8ygRtX6xk5AqtE9Et1qMDeL4mtdpQhUgM/gaV
	zJsXOct0JxHhb5Bjq/pP/ABEefMtnM4jjXih
X-Google-Smtp-Source: AMrXdXs2ly9js0eSHV7X+rrGPhAfnPRWaalB/tSrvhSQbapLry3medMrQ2c5Xs+1XwcJCBV8NNeaIg==
X-Received: by 2002:a05:651c:54f:b0:27f:66ec:b5d with SMTP id q15-20020a05651c054f00b0027f66ec0b5dmr3509135ljp.33.1671446683970;
        Mon, 19 Dec 2022 02:44:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f2-20020a2e3802000000b0027a099ad7efsm714252lja.35.2022.12.19.02.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 02:44:43 -0800 (PST)
Message-ID: <c906603f-bf84-06d4-3e9c-bd4ab748591d@linaro.org>
Date: Mon, 19 Dec 2022 11:44:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Add watchdog for StarFive
 JH7110
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org
References: <20221219094233.179153-1-xingyu.wu@starfivetech.com>
 <20221219094233.179153-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221219094233.179153-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_024447_526286_3D0252AB 
X-CRM114-Status: GOOD (  14.11  )
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

On 19/12/2022 10:42, Xingyu Wu wrote:
> Add bindings to describe the watchdog for the StarFive JH7110 SoC.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../watchdog/starfive,jh7110-wdt.yaml         | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
> new file mode 100644
> index 000000000000..a7bfe0751928
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/starfive,jh7110-wdt.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/starfive,jh7110-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive Watchdog
> +
> +maintainers:
> +  - Samin Guo <samin.guo@starfivetech.com>
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +

You miss watchdog.yaml. I asked to drop the quotes (so the " character),
not the $ref. Please keep the $ref: watchdog.yaml and use
unevaluatedProperties at the end (instead of additionalProperties).


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
