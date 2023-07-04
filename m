Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B137EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 09:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xY4ZDTKqgIt5XAo/dnB+atY7n+b/5FlOPTsUcTqcfwY=; b=xgZUp/nsEJy6Vj
	HVXHWAf7WOLGPAiMQHBTjUMF/vqbImiT48aV5XTs2FfhIoR7tmnDAjVVysTVkEc/eL8vfUCLS/ITB
	au8a17z5jQsgMTNgau7oAP3KRb9kRH+rG96yrNn6BPmoM74ITAdgnwJiUEHsuV1A1WW4Uf4AS9Ip8
	lG42zeWOYx93NwBO0l94FcDg2k62N+xKB7TGSnKuDZuv1sVaUNpAMRM8Rwnu+23ILX2ZYrlXw3ElN
	upBpnWox52yvP6mfXwA3E0LXy8TBtGce5NlwGXM1JfmL9IdmdPZ6+PXae4vYGGasxKlwMEZpl7lIW
	Gwx4918uBUaxuxoPB3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcUP-00ClR6-1r;
	Tue, 04 Jul 2023 09:38:29 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcUM-00ClQ7-2n
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 09:38:28 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-992ace062f3so646239866b.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 02:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688463501; x=1691055501;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ERnzPIPRvWevLboQhEVq6zSzhxrqqEGbLmA9tpsiGI0=;
        b=irSJlz54V83Ic3w9B7kkZVmPaAKj8rOOaqqHxt4z2EndhT+6OFdL5rl1MkfCEmcUk+
         U2b3+TQaYECpAxUhcgDPZVbeP7cp3TFOAOkaJ+YG79KoF6emCpXHgWnalOOjl96k8AGO
         BChhV9m4pIftAdSk9Kp1xjUO6V2DN+iBtuL63QZ8cLHiYbO3Jv4Dy+MG4fJ3Y/JvkmxW
         mqL67qqV68/4OU3HY+83C8Poen6m1u0qJGosTpTvaiFR854RekzI3K1js02j3ikaa9WU
         Hesu4hGDWk+U1b7eVMifuWg7maaeU1ydnTd+JRFeYMTltdJ0/71rP0kIpgJELFgP9HlB
         hS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688463501; x=1691055501;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERnzPIPRvWevLboQhEVq6zSzhxrqqEGbLmA9tpsiGI0=;
        b=Airzjy8ciMEek6tFdT4pD5PMcP5BvQqumzqrEO1z3dSBYHhK1g2v2YPywECQGes4C8
         43jVCCqDJH+LzaKbMlg3BUWI2k3+qwo9OzWHTnsPX8M+6dYMsEtOZhf8Vlj9mUWgcIUM
         oA1tWWgT2eA5Bntm0VGDNnml3lO0jDktQm0V7JbIsudg7448F3UWgu70tCaRUXEDLV0/
         1IDUXJ88f6Wt/MmFKjQvU5Guu98plQ92+oVqhAFiK4Cvi9VFovDKA1Fm3nj4NFfpB4Li
         COnyqhH4aBsCKKUrW73dTO5f4xsidNry9MPa8lfwA3z4C91kdJkbfP93w+PwV2KRUG/N
         9q3Q==
X-Gm-Message-State: ABy/qLYIxexsM7Rj89eDFuKM2DTGE4n7EpZ0W1cb5EdOYCYQtZJJxRWn
	76/3w+47vPwfP+N0Gfqk6OV4IA==
X-Google-Smtp-Source: APBJJlExmWdalCwz4mhd46wIPBv+5Ajxdam8PI8PX4rD0du+csKdm67scVujAXZWR1HmZMfM3p/34Q==
X-Received: by 2002:a17:906:594b:b0:988:a632:774a with SMTP id g11-20020a170906594b00b00988a632774amr10860901ejr.27.1688463501122;
        Tue, 04 Jul 2023 02:38:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id e19-20020a170906249300b0098e4aef0791sm11602644ejb.66.2023.07.04.02.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 02:38:20 -0700 (PDT)
Message-ID: <1b65e8d1-d5e1-0d6b-1248-d9683be44db8@linaro.org>
Date: Tue, 4 Jul 2023 11:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND v1 1/2] dt-binding: spi: constrain minItems of clocks and
 clock-names
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230704092200.85401-1-william.qiu@starfivetech.com>
 <20230704092200.85401-2-william.qiu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704092200.85401-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_023826_923603_C8CFD334 
X-CRM114-Status: GOOD (  16.80  )
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

On 04/07/2023 11:21, William Qiu wrote:
> The SPI controller only need apb_pclk clock to work properly on JH7110 SoC,
> so there add minItems whose value is equal to 1. Other platforms do not
> have this constraint.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

I don't get why this is resent, but subject prefix is still wrong. It's
dt-bindings.

> ---
>  Documentation/devicetree/bindings/spi/spi-pl022.yaml | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-pl022.yaml b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
> index 91e540a92faf..42bb34c39971 100644
> --- a/Documentation/devicetree/bindings/spi/spi-pl022.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-pl022.yaml
> @@ -11,6 +11,7 @@ maintainers:
> 
>  allOf:
>    - $ref: spi-controller.yaml#
> +  - $ref: /schemas/arm/primecell.yaml#

This looks unrelated, so keep it as separate commit with its own rationale.

> 
>  # We need a select here so we don't match all nodes with 'arm,primecell'
>  select:
> @@ -34,12 +35,16 @@ properties:
>      maxItems: 1
> 
>    clocks:
> +    minItems: 1
>      maxItems: 2
> 
>    clock-names:
> -    items:
> -      - const: sspclk
> -      - const: apb_pclk
> +    oneOf:
> +      - items:
> +          - const: apb_pclk
> +      - items:
> +          - const: sspclk
> +          - const: apb_pclk

Are you sure that your clock is APB pclk in such case?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
