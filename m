Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0376EC76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQDi9zlj2pHOQuAZLLsOzzQvqltfGtItokchLaXoUMo=; b=kbd6x3bS/7ej3v
	DiXc7lpqLk9saaGLH+A7wRZS4yrQ6x8954ekAQOjfA6h/bGfSsN7tMCSv2QaMh7osXxGQapI7+Jru
	nlMqOYNTf7Hot9c6yqB6WqR5uCNAf5dKEPmzfkEDlru8081a8LhvcGvCv6DynXAVj/bQD0Wd9N+/7
	o0KRwOglNcQhfF6sPLGnjXbXj1g9pMWiHQnkSy1vG/FqhpuikeCvOF2Ex/1Gmj6DceUXBPSWZWb+z
	DoSO9ERoR240iqr9WWEIT8f3PnZHRfmt5whjkmQhVf54Tjc9sxP9Icp3gZ05sQxe6YgRKO8egfKWG
	L8+5bmdSR/CF1Nlj9etw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7xJ-00EFmp-25;
	Tue, 28 Mar 2023 11:57:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7xH-00EFlX-0S
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 11:57:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id eg48so48460119edb.13
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680004654;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RG+eTwEqbkDSJBi1NatlM7PgeUa0/GUARHfUI0qPaV8=;
        b=GJU2xg/v51vJMedUtpVQWw0Y3xQD+5FOXKikQp26eG4k7VteW4qg1HM/hhw34M3JcH
         UxbYOC3owKvWuKZkLGmsPZpBMJaceloa/V72Zto+Mo5ogbwWUclIrgSgc7X3C/uEvAKE
         HhfcfkUwV6Vh3hwJdjiA+6CTEQ/UnJmHDQz9+7kKj7mLBCBi3gE1Q9x8N1VPrMkxKOZE
         qI5fam5Z0wDD52rk8DoQMe7TRWCEGH8625w6AuRrQiiPm6Ej2LIzCZSNhmmD3IDMjclg
         DFJKcbW9NNMQR3oUoOsCeM7dj0zJU5U8tlpVH6DnMstfqAGcL7750oCpEX2m7TrE3LlE
         DAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680004654;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RG+eTwEqbkDSJBi1NatlM7PgeUa0/GUARHfUI0qPaV8=;
        b=AsNvIdXU4/6BULxwMsSO39XDB/KFor8J5e+KIWx41o39c1rMg17eSZgAivhJM9dvtF
         TSOKuk/cWPv7S9aNly9TJFsTqIbzbCzJ2sMtqrhMqvhIE8RhnxNT22rxPt1Scxq5ptQj
         dRVIVyVkSUEfB7TBlOWhtICMrK1iFqUkrs1LFYeXJOPJjZHEPrRrXhdM3SqsiJL43mcl
         SYyHg7eQLPOtcGZWUSV+e1cf25806b5A9m/Wc8ThACk2si/2O07P04q89VsNCq3dXMns
         suIWjeQVWd2wVYirs8hFvqmdgMqnlfnWqqVUfm/19wtti+9nggxW8SGer4Be4DgxZ9AT
         E29w==
X-Gm-Message-State: AAQBX9cR0EF/yoic5A/NRGJsfIJ/P5E4+Bsw42TS7lfA981I5+gulloy
	OsxXhJ7zJj7XC1+r0ZvJ4WBGxpZFYf7rT2PZ6gc=
X-Google-Smtp-Source: AKy350Y9HnV0VgYg9E5b1ZGdqpAjJYGTnN7BA9rplW9wQdUyqK7zNB5omaIdn9MdcMPSZ20p6qilZw==
X-Received: by 2002:a17:906:8581:b0:93e:3127:fc28 with SMTP id v1-20020a170906858100b0093e3127fc28mr16432912ejx.39.1680004653763;
        Tue, 28 Mar 2023 04:57:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id fi9-20020a170906da0900b00931faf03db0sm14919700ejb.27.2023.03.28.04.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 04:57:33 -0700 (PDT)
Message-ID: <d216b729-fe96-1128-132f-7104a82f5463@linaro.org>
Date: Tue, 28 Mar 2023 13:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 4/6] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Jose Abreu <joabreu@synopsys.com>,
 Richard Cochran <richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230324022819.2324-1-samin.guo@starfivetech.com>
 <20230324022819.2324-5-samin.guo@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324022819.2324-5-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_045735_189187_8F93D508 
X-CRM114-Status: GOOD (  10.21  )
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

On 24/03/2023 03:28, Samin Guo wrote:
> From: Yanhong Wang <yanhong.wang@starfivetech.com>
> 
> Add documentation to describe StarFive dwmac driver(GMAC).
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>


> +  starfive,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to syscon that configures phy mode
> +          - description: Offset of phy mode selection
> +          - description: Shift of phy mode selection
> +    description:
> +      A phandle to syscon with two arguments that configure phy mode.
> +      The argument one is the offset of phy mode selection, the
> +      argument two is the shift of phy mode selection.
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - resets
> +  - reset-names

required: goes after properties:

Just like in example-schema.

*With* fix above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
