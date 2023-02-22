Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936B5C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 09:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZD9MUdUkJ/SOLD70Ptn0QBTWEv1IYpRUdHxOwaPhr8=; b=k1I+bCCZuCRs2o
	Ipnwx7PFUwtAFT+yn76JKh+VSELwa3NcVbVERm4HYKDOaol1dPffJV0Bbcf9SzMIA9EfM4TiAiTjf
	fuRrsJa84RNEy/Qg/l9iITXJbxdsxqwrqH3ShaxYoZKS8+obDq9obrWa6dAUyyfDvxI7PZVThpwiy
	ykiF6nQFXGfL8oTdoP58WdJdmk+WdGKG9HcNEW++UP6JzSjBfVQWXmCU3FSpHNWehKHPVfNsGo0sJ
	avzH1cFqzrNvuuhSUnnN8X6sjKafpjlOq9aDPbTLTf1YgALDbXfduBCaxWRVEXLa9g019NpugeL7q
	91gv665MVcYSD/YWQhVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlAC-00BLj6-G8; Wed, 22 Feb 2023 09:11:48 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlA8-00BLdg-LK
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 09:11:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id o14so5466189wms.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Feb 2023 01:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B8Z3U2jSFOxoIFyiBCe5R2j9sYihkmbTptnAxMlSu9k=;
        b=Guc3YKP0FkFYEWhWdBCSSN0zrdl2JQXrvUuLCiNQTQq8oneRfQhi8KfYThizQPGgPq
         41rsV+y2ieepGqWwj8YZTKXzuRPPYsgRZiumZsdJdTkAJM0K5bVsXmV2wE9Am/sjtTSy
         /X3xu/u4rBl3khFTJEMlAvXbDMGHV9ZeFr03IcsTFdFnzzjhvfVSYZy/D0NeQuEteN5u
         dmGvQCO4rDK5JTvFMdobJkyMbXG0yz1BWfgdO+25ZW2Na89L2wfIDRjYwx6J/xs90CZs
         t/dwlogHtTmCB069/gcUOgjpCJ8OOdEMIBFUiXjIbZbxvpCxyewiGMK1CbnGJfUia+nZ
         9RJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8Z3U2jSFOxoIFyiBCe5R2j9sYihkmbTptnAxMlSu9k=;
        b=ckFMfZmWHRmXQmWmAuJqPNAhY4EnZB+0ZKuYjA9Jp77gwWfdiFPl2gmx6aM8zeNnUK
         Vdtu6Cwts4o6A1H9OCdk86P2nkwXApWr6Et4Nj2hRTyZTPeKVv2b/id+56Lpah+Yu54N
         FvDtYiOiBn2bUhZnZR5tPXp+UUe1EuDark04UvYXk8MbiW8dQc3MTWPMgF7d16BTiyha
         6cgZayqUn+PJmr1y6lVgzC/q6/nKtWggpZ8L3Kee5ZCTq5bBdjnA73RF7B/Evx/brl+8
         ZwogICDjuXWzvZ5VZPqlN4n32Ygg5LitzyTead+I1RGJOoK433UKwKJIm/s3MOBlkQKM
         fTBQ==
X-Gm-Message-State: AO0yUKXf2fc90lERof2DEV7QJ1rPruzWYmbZrbI2gEFneDWAiHSCafzi
	inzKsyfZ42v9wgwURVKSQPAuug==
X-Google-Smtp-Source: AK7set8D+S9eMMLXDr7nQ5Ht2tAf8yzghsq0dXfGhGWC+M/PZKU/R2/n5q0isJXiYis0IFxF5v9CMA==
X-Received: by 2002:a7b:ce96:0:b0:3da:2a78:d7a4 with SMTP id q22-20020a7bce96000000b003da2a78d7a4mr5879968wmj.21.1677057096462;
        Wed, 22 Feb 2023 01:11:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c314d00b003e2059c7978sm6879903wmo.36.2023.02.22.01.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 01:11:36 -0800 (PST)
Message-ID: <c0df5685-d0ef-705c-9684-86928dd68ab5@linaro.org>
Date: Wed, 22 Feb 2023 10:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: Add StarFive JH7110 PLL clock
 generator
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
 <20230221141147.303642-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221141147.303642-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_011144_749234_1DC4D0FC 
X-CRM114-Status: GOOD (  17.61  )
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

On 21/02/2023 15:11, Xingyu Wu wrote:
> Add bindings for the PLL clock generator on the JH7110 RISC-V SoC.

Just one sentence... not explaining anything around ABI break. Nope.

> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../bindings/clock/starfive,jh7110-pll.yaml   | 45 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 12 ++---
>  2 files changed, 52 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
> new file mode 100644
> index 000000000000..8fd18e6c2e9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 PLL Clock Generator
> +
> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-pll
> +
> +  clocks:
> +    maxItems: 1
> +      - description: Main Oscillator (24 MHz)

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/starfive,jh7110-crg.h> for valid indices.
> +
> +  starfive,sysreg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

That's not how the property is modeled... look at other code.

> +    description:
> +      the phandle to System Register Controller syscon node.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - '#clock-cells'
> +  - starfive,sysreg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pllclk: pll-clock-controller {
> +      compatible = "starfive,jh7110-pll";
> +      clocks = <&osc>;
> +      #clock-cells = <1>;
> +      starfive,sysreg = <&sys_syscon>;
> +    };
> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
> index 5e4f21ca0642..086a6ddcf380 100644
> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
> @@ -6,6 +6,12 @@
>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>  
> +/* PLL clocks */
> +#define JH7110_CLK_PLL0_OUT			0
> +#define JH7110_CLK_PLL1_OUT			1
> +#define JH7110_CLK_PLL2_OUT			2
> +#define JH7110_PLLCLK_END			3
> +
>  /* SYSCRG clocks */
>  #define JH7110_SYSCLK_CPU_ROOT			0
>  #define JH7110_SYSCLK_CPU_CORE			1
> @@ -198,11 +204,7 @@
>  #define JH7110_SYSCLK_TDM_TDM_INV		188
>  #define JH7110_SYSCLK_JTAG_CERTIFICATION_TRNG	189
>  
> -#define JH7110_SYSCLK_PLL0_OUT			190
> -#define JH7110_SYSCLK_PLL1_OUT			191
> -#define JH7110_SYSCLK_PLL2_OUT			192
> -


NAK. ABI break. You have entire commit msg to explain this and avoid
questions from reviewers.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
