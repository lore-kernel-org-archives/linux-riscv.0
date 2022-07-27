Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18025C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dq8X0B96owxecwMjWaB09vb37nIGgn0iclkR8NtC4Xc=; b=nw2+exZPa4L+FQ
	mZZZYthbQgVoeQq9qS8xbo12w/Xth0l/7wTQ8vEjfkB5GUv/7zioPXKnL+i5+XV2g4y39Y3Tax4yZ
	BtPf7+T5g6ZeBq88Q3bqxIDxLBWemAUjxwqGiu6oSnhN6m/+M5kizdepjzhBr+gBbPpvmUsjHUDbW
	TNqHg4WRE8mvKLcln45p+axJ511Cjwt21JfsapgP5ubyzWkOXKjqtSwAmdL+o/Uge01SZu08giJi8
	8kpRms35KAZg+2ALr0As4izzbUDOwmkU57TFAA2WqcYQLkQ4vwEcIkKIEakxSGjluBVATh5zHimhD
	6aPOPrdUtwEoyAl2wctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcl2-00BNJj-0P; Wed, 27 Jul 2022 08:51:08 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGckx-00BNGK-UN
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:51:06 +0000
Received: by mail-lj1-x231.google.com with SMTP id p21so11416187ljh.12
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 01:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1AeHnnhcT69ZrVfPR/zgIWRlaIcZ2YpF+8w0N1pOEoQ=;
        b=UQXl4JOAj4zgD6Ihx0+LdJYT+f3u0Hj1g8S16SQzNPc4kp2ueYOIOI3Cm7QqPHt8Pw
         g7uAjrSLRIZQT6bZhii3t7DvlV0kXlkxeNyc+J360ubmjy5/gFLPR6Al9HJqQMCkRMrf
         QNgfcip4vKmdFOUjZ8glPO+UXeYF1jnimpRQCWpZb+OqOrdpSRzXOc44mH68OPu/wSws
         X+e3nRT2016M+RZmay/TwhOMXw5URh3CU1HYWHVtvSJ7RX/0RDIaLwbkVuTGj0eWi4hD
         Zy0Xe2ww2VzQEXHcDlrCcFVG1rR/ExW2p+Q4pK30B9+MmB1uyx/OScDD+18eqlLkwJOo
         PsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1AeHnnhcT69ZrVfPR/zgIWRlaIcZ2YpF+8w0N1pOEoQ=;
        b=nkGR3K0j9xT19Tck5CfVs/Zk2iLlLdq5CUwOqsBXvtQip3z0htOcLG9nytosr/CPy+
         Q2tguNeDvA2EY8Z5GdLMe1eDxTVwGWIV3T/FMZykf+fcu4PVnyPuME4dTpt9gwgMn2nn
         A1AjKPP2D7XkAc6KZFjTIKA9ZR8vPrrLlhiTJoVSB4Wn+YHdHIKnEW8mhDaVOuyLazEN
         oSqyqH/RhByxPNQrHT5dfnEX3EXmg4QGHLs/4FMNu5zerlQJKdS6pBYnJYW4BH381kai
         tskr3XyviXbZpnVxXKmjCX4YNJdePfwQ0M90fQWbWyeXh9LaTMXj/vQxBKG+3w05LzLb
         tQFQ==
X-Gm-Message-State: AJIora8t/9m72dKZhvVyJHwjqyijZJvvE+a31pdVD3k73jF7zxgql+KL
	rzD8M1IjUSqr97MrYLMoqgLkZg==
X-Google-Smtp-Source: AGRyM1uAQEDdTmc0WVn0GQ7HOUPV1XPXnbWhkzm7wPSzMTpaVTeB4B2RlsFGYOin2XkzwgspWV2ayg==
X-Received: by 2002:a2e:98d5:0:b0:25e:c1b:f262 with SMTP id s21-20020a2e98d5000000b0025e0c1bf262mr3740065ljj.343.1658911861726;
        Wed, 27 Jul 2022 01:51:01 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id v7-20020a2ea447000000b0025d715bc088sm3754349ljn.0.2022.07.27.01.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 01:51:01 -0700 (PDT)
Message-ID: <7a02225c-5c7b-f342-e29e-995d1ae0f4e3@linaro.org>
Date: Wed, 27 Jul 2022 10:50:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/6] dt-bindings: arm: renesas: Ignore the schema for
 RISC-V arch
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Anup Patel <anup@brainfault.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726180623.1668-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_015104_018739_82EA5E4F 
X-CRM114-Status: GOOD (  13.80  )
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

On 26/07/2022 20:06, Lad Prabhakar wrote:
> Ignore the ARM renesas.yaml schema if the board is RZ/Five SMARC EVK
> (RISC-V arch).

Your commit msg says one, but patch ignores r9a07g043f01 which sounds
entirely different for non-Renesas people. Be a bit more clear.

> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index ff80152f092f..f646df1a23af 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -9,6 +9,15 @@ title: Renesas SH-Mobile, R-Mobile, and R-Car Platform Device Tree Bindings
>  maintainers:
>    - Geert Uytterhoeven <geert+renesas@glider.be>
>  
> +# We want to ignore this schema if the board is of RISC-V arch
> +select:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          items:

It is only one item, so I guess you wanted here enum.

Just like syscon is doing...

> +            - const: renesas,r9a07g043f01
> +
>  properties:
>    $nodename:
>      const: '/'


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
