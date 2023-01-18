Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7306C32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+D+axX4GQ32Ej2prN0ddMyJoBOqm6tCyz0JroHlsGE=; b=0LH6+ALob8zs2u
	kzCuNIf0z6Gb4kaMHngABbggZmJadR2WsGohziPQgCjehwQrcC0NTlVTmlQsYc194bz9PZaf/mk+j
	VAx+zZEO8opymRlwqRtTNFa3uNarWSJkEJW+0o+umvgXLnuc0Sc9LpokwdKgUcZaFves6ZvBdCXFd
	EkFHJSqxobogMklD3v1iu0/vZ2LNX9LBRnbcUZg2H/ULVyQ9bFy96O10TgYXhUIQv4/sXgBeo1+2m
	VbEZjmIMe+H1Y7hoo5HJMfF7jUM62FIpTO7AXXquU3o+Kz/8r3Tf9XIR4uWxsBPgwDaiGJ+xpW0Ef
	BMpEkMfS+g50yZLHw4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAiz-001guQ-Ut; Wed, 18 Jan 2023 15:51:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAgz-001fsM-Qx
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 15:49:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id o17-20020a05600c511100b003db021ef437so1839645wms.4
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 07:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zZKLrjDE6gNxqEyqtKQtAvgreZnol5CzLZ53Y6iptjQ=;
        b=DlobVO+fkH8lmWsg1Xbf+Les5HoBiix+EaSOkIu5MwtszuT9dbvx5yOdyy679QZS7H
         CgPzbDI2fqg6KzaW9TiPApqEfeZG3Stt6b1sMjK6A8u1y6ydyF+/E0c8h8xH6g/UN/WG
         sTmOzb/K64HbvxlGd1RvxKQmH+BSoaJlt1k6dOirDf01+HFJdZPCdvv9YjuYqusHZUPv
         gYo7DFQ19DZmUNThj8aJBEc2NsecSdoOrJdc5fjupVNSRfI+3b+8kB7LxraGqDeVZMR9
         UHp7s/tTfKavPWZOipGA+yzU4HQGkBAuQi9JxOd9PxN3pU6hmk+64iKMMQcs4OVIzuAx
         ZGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZKLrjDE6gNxqEyqtKQtAvgreZnol5CzLZ53Y6iptjQ=;
        b=a59w2ZpmpQP7d/ACEVsKCVzDHLcSpm4i+Oy8le1tU+uLVQ/ZBX9sJiXDPNMvdDl+10
         4DLtaEOKQGbvY1KTYOLfIFFlnZi83F6rK1cNbkyVxyXJhMwCa6ju78NG75y51MMpyUne
         msRFeI/2xNQsgLQ9SGx4YG0XEBxWNP6c27mXq4o32ow1OkprYCve4t1sHVlcIyZiHIQu
         RYWicrG9kpVqNjguiW1Q0h0OBbFv8+YcVb0cv/UdCWSew4t4kp4RxFgwWLjVbD2cIzAa
         N82DGKg8IIh48C1LdmhE71JraYM4p5TGLVw4U+Bv12mCIC5LR+9Ko2dKDhNnCjAQNfE1
         t6ow==
X-Gm-Message-State: AFqh2koLrcoplO335u+hpq+Z7nodpuBqv4ep4L4eZDvI9RRw1L9FT1Nq
	iUubc6dencpbvsyon6KWxqlYPQ==
X-Google-Smtp-Source: AMrXdXvUXPw/cK446ap5ID8iRUgB13K9qZXkhy+nek/O84uQWg7WqzMIXywLZvU1ZWBitD0vM9ljLA==
X-Received: by 2002:a05:600c:511f:b0:3d0:bd9:edd4 with SMTP id o31-20020a05600c511f00b003d00bd9edd4mr7080861wms.0.1674056975399;
        Wed, 18 Jan 2023 07:49:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b11-20020a05600018ab00b002be2279f100sm5447471wri.96.2023.01.18.07.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 07:49:35 -0800 (PST)
Message-ID: <102db6ae-742b-ea20-076e-386a0284a185@linaro.org>
Date: Wed, 18 Jan 2023 16:49:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 4/7] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Yanhong Wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-5-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118061701.30047-5-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_074937_980166_C33BE3C0 
X-CRM114-Status: GOOD (  16.63  )
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

On 18/01/2023 07:16, Yanhong Wang wrote:
> Add documentation to describe StarFive dwmac driver(GMAC).
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>


Subject is poor. You miss device prefix and it's not correct sentence.

"Add support for XYZ"
or better:
"Add XYZ"


> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 113 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  3 files changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index baf2c5b9e92d..8b07bc9c8b00 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -91,6 +91,7 @@ properties:
>          - snps,dwmac-5.20
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
> +        - starfive,jh7110-dwmac
>  
>    reg:
>      minItems: 1
> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> new file mode 100644
> index 000000000000..eb0767da834a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 StarFive Technology Co., Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 DWMAC glue layer
> +
> +maintainers:
> +  - Yanhong Wang <yanhong.wang@starfivetech.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - starfive,jh7110-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - starfive,jh7110-dwmac
> +      - const: snps,dwmac-5.20
> +
> +  clocks:
> +    items:
> +      - description: GMAC main clock
> +      - description: GMAC AHB clock
> +      - description: PTP clock
> +      - description: TX clock
> +      - description: GTXC clock
> +      - description: GTX clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: pclk
> +      - const: ptp_ref
> +      - const: tx
> +      - const: gtxc
> +      - const: gtx
> +
> +  resets:
> +    items:
> +      - description: MAC Reset signal.

Drop trailing dot

> +      - description: AHB Reset signal.

Ditto

> +
> +  reset-names:
> +    items:
> +      - const: stmmaceth
> +      - const: ahb

You have two resets. Why do you change them to three for all variants?
It's not explained in commit 2/7, so this is confusing.

> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +unevaluatedProperties: true
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
