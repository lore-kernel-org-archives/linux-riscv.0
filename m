Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2545C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 10:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACQRPXXLQDZ8yVNaasKdqt9KA+p89Tx04dNZ1ybL8hU=; b=kMG8sCuAzD+6iR
	S194he/b5GZMMfrcV9kVqxKBykqZrsptnJmeEYX4KP1yrCQffD6no1EJTGi4lBDwcJRZABpRAc4sE
	k0Fo4V7RLtLLWgdknp3dUEBDypetRFtCxIVIMIygB6OCnxlW07J+AIx8j4QnFBLY7LsgDVioFUl0v
	YDsHg7cH7CjSUNo77U+so7oYJdGvqvnX31I4WPB0utlJGRXh+RNxWD+oKauwW4kJ+0owscTMC9L4H
	jB+IUDRJ0hvnmr+F/+0ncY4VYBmUEpf4USN+UmxSxripKt4YNVud8sZpBRzb7C7k3J8/QEXdShyl9
	LH3lM8Ju7TysOSMxWCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8fOZ-006TbX-78; Fri, 23 Dec 2022 10:35:19 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8fEo-006Mxq-L7
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 10:25:16 +0000
Received: by mail-lf1-x135.google.com with SMTP id b3so6583914lfv.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Dec 2022 02:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qp7d3U94zoNgKH8Si35nk2bX1fIT5hDmVOTvD+2+xiI=;
        b=a3ULL3KPekXKim5IREGJDUsn1quNjynauNOaAghWct3ih2A4vxASjkyY6wPjt04RtX
         Q3AjFmIl7yo0PQ8hzApg7fj9xmTj1z635ssGsJ47EZawHIfne8i146+urbheMecDQH5S
         SvUd335pD022tMegpq9jS8Ej5SA3af3lsSaQJpkNZLHZpQ2d4NQIPEdGZPXDPDyXIcUD
         7mkhis/VlcF2dZ3yM8aA14gu0DsfD9/QgT6JQUIDVMZNnhWxycAne2BGhieDPq/eVK/y
         r52AGEFWG8n+iS8dFQHahkDolvqcA90Izkog4mRVps/eGTZB3A2U/cyfhRPBhcjbDimv
         BwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qp7d3U94zoNgKH8Si35nk2bX1fIT5hDmVOTvD+2+xiI=;
        b=K9+fF/CFieFpeJXjTee4mmb4jBdEGdp+WrHMQ9es+I1Ve1RSOVeE+oakDI39F95wXQ
         7lXP6lKWYNcUyFPw6G2TgtZVtsQvgiPFNMnB8iiTYz7Sw6g/4KDDA44ZDuTR/cAawXnY
         JIu14UiKhHkhJ2MuVEWY8egYppc846gv6XBKdpM40+ZcwCQhP4KSbRqFRD1XRt3Sp3Bt
         FRz+vsyQicI2KBwQLBB7/CZjvw9RKD4qS96grI5a9AFXLOLBvwHsI7bCCiLX9mQypTPZ
         YxPawGAVqqth3pxjOD+sSvtyIzqqmptHmVdRVyb2PM1wtzqpiEhL/NKqCkkui8T1kEyY
         kg8Q==
X-Gm-Message-State: AFqh2ko6p3XpXpVRfMPr2OW6dM2iiXqUS1NBs0bFJAYu+nURWDRM4rl8
	aOfFrkBHer0O9O58yOeAtvhvnQ==
X-Google-Smtp-Source: AMrXdXtmvRecxvsCwLnWMZT22Fb49dhaElQD52LdPUWmeeJ8sDPLBSeNLZ4a44nht9Y4xxtkSEfCvw==
X-Received: by 2002:ac2:5589:0:b0:4b5:5c9b:18c with SMTP id v9-20020ac25589000000b004b55c9b018cmr2361943lfg.34.1671791112607;
        Fri, 23 Dec 2022 02:25:12 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m14-20020a056512358e00b004a4754c5db5sm471219lfr.244.2022.12.23.02.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 02:25:12 -0800 (PST)
Message-ID: <179e66a8-c6c0-6d3e-4f4a-6b884f532572@linaro.org>
Date: Fri, 23 Dec 2022 11:25:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/3] dt-bindings: timer: Add timer for StarFive JH7110
 SoC
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org
References: <20221223094801.181315-1-xingyu.wu@starfivetech.com>
 <20221223094801.181315-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223094801.181315-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_022514_839175_46E1DF69 
X-CRM114-Status: GOOD (  17.28  )
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

On 23/12/2022 10:47, Xingyu Wu wrote:
> Add bindings for the timer on the JH7110
> RISC-V SoC by StarFive Technology Ltd.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586


> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../timer/starfive,jh7110-timers.yaml         | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml b/Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml
> new file mode 100644
> index 000000000000..fe58dc056313
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/starfive,jh7110-timers.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive Timers


Not enough, really not enough. Describe the hardware.

> +
> +maintainers:
> +  - Samin Guo <samin.guo@starfivetech.com>
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-timers

Why plural "timers", not "timer"? The module is usually called timer -
see other hardware that type.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: timer channel 0 interrupt
> +      - description: timer channel 1 interrupt
> +      - description: timer channel 2 interrupt
> +      - description: timer channel 3 interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: timer0
> +      - const: timer1
> +      - const: timer2
> +      - const: timer3

I would just drop the names, not really useful. Unless you plan to add
here some generic interrupt (like you did for clock-names)?

> +
> +  clocks:
> +    items:
> +      - description: timer channel 0 clock
> +      - description: timer channel 1 clock
> +      - description: timer channel 2 clock
> +      - description: timer channel 3 clock
> +      - description: APB clock
> +
> +  clock-names:
> +    items:
> +      - const: timer0
> +      - const: timer1
> +      - const: timer2
> +      - const: timer3
> +      - const: apb
> +
> +  resets:
> +    items:
> +      - description: timer channel 0 reset
> +      - description: timer channel 1 reset
> +      - description: timer channel 2 reset
> +      - description: timer channel 3 reset
> +      - description: APB reset
> +
> +  reset-names:
> +    items:
> +      - const: timer0
> +      - const: timer1
> +      - const: timer2
> +      - const: timer3
> +      - const: apb
> +
> +  clock-frequency:
> +    description: The frequency of the clock that drives the counter, in Hz.

Why do you need it? Use common clk framework to get that frequency.

Also, sort the nodes somehow, e.g.
compatible/reg/clocks/clock-frequency/interrupts/resets.


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - clock-frequency
> +
> +unevaluatedProperties: false

Did you test the binding?


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
