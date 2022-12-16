Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812CFC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUya6fTnqsJeqHn7wR5rhLbidIC5Zjam1knXDWjMZCk=; b=vdHaPRra4vDNsk
	ueZBv98YzWrvdxonkGi9JhvKaDuUrIEAbO18P8zH8ucEjFVdK9jCzoUNeUF079aGd7i6zBmSJMi9x
	ZlU9WebNKT/yI4T8zV/Po9FwWHKuAtH+0FNzntHI9QbwrBqUOSq6jp2g0UoEyWj00hw6NdrLcR4+S
	nxIpw+5zqYI5Uso+Jt3NL6ZffSfZN5lSD2ir3KO3YDUwzh7+YrImvDSzI3Yjk3opMQb5p64uDImKR
	so4WsFa+Nbq6sz+UhACPxipTzSXCqisIZYIdhX2ajAW/TC1OZX/ifiUtyOc2xLJEqlgzWJuAb+RHQ
	s5dTj2UVRTixmH2BnEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68gj-00EOJh-TO; Fri, 16 Dec 2022 11:15:37 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68gh-00EOI5-B0
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 11:15:37 +0000
Received: by mail-lj1-x22a.google.com with SMTP id l8so1756546ljh.13
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 03:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNmN8YSKMj8sewHmvzrRIH5jM9zSiZZ/kn+ymwWEngE=;
        b=EVpOLThGVmDOAFHwste+9mKNye5vUKeVIh74RNp6XeKz8XddVc9K2rx8ZGTx/WY8pe
         YfH29ku09sCGD8k37Cys5pS2COm6I7OU6/4ITJxHwSmdbkJDTUI8U5fbudaeCdh7Kl5p
         vdyr+VK+A9dFD1bvxjM1fEM3CavybkuqMf661K9AYpxQ1jHRdYJQFh3al0taLwCz52xU
         giW5qCP6GnolIVNwlDskg70vMgkAh9sfQW9yVDQxSLWwbpKzQd68I9vn1Fy2AQs1npi/
         ssvazCNj4uevDXF6qweG8bFgD7auqEWvXOo1TTriQSwQO4mLlaPat0JRh68uYLNOIcRL
         n/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNmN8YSKMj8sewHmvzrRIH5jM9zSiZZ/kn+ymwWEngE=;
        b=xIN5WcUvNFkYkeoZBtSIr5WAxPGeD/e/+kOXxAyHWVPGretIyONyNw52gdCXotxv56
         xMvUu6a+fwq3RuRrfYifP/scZSTM1dTR4+E4EXfqEkl+/dmAi4CI9WIsEPMC7LRFSXAP
         773ZRNKa5FvfpQQXupBnwFZWoaoJl+oU93Pafnh7oFCq5ZvnRvAkFLIICaRn+jbPXQ4R
         eQoRN6YSp5MxsEvFE9oGx8MU9u9gjHASwsCV7KEewR23IFS2SNRgMFEe9ZsO3D8f590n
         N2k53tGFOLjutcgujlENny2TkmFFbBUlQiTMCKM61ETBYLH52wyexstTsQFecIZoib+I
         wWvQ==
X-Gm-Message-State: ANoB5plWZeiWQPhCcOINGLBU1JVdz6+B1GNyDqRHbih993F1f+U7JLkw
	62R75/vtzetmVNS5UlQI5Eyivw==
X-Google-Smtp-Source: AA0mqf5ZxNILozi/59eThvqaQDUVp7Rne/3dA+LV9B3+gi9zpnKCGbBvH4+liRRo6GkSgJCU7hemVA==
X-Received: by 2002:a2e:2a83:0:b0:279:c58a:817c with SMTP id q125-20020a2e2a83000000b00279c58a817cmr7758749ljq.39.1671189333181;
        Fri, 16 Dec 2022 03:15:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i5-20020a2ea365000000b002771057e0e5sm127207ljn.76.2022.12.16.03.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:15:32 -0800 (PST)
Message-ID: <994718d8-f3ee-af5e-bda7-f913f66597ce@linaro.org>
Date: Fri, 16 Dec 2022 12:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 5/9] dt-bindings: net: motorcomm: add support for
 Motorcomm YT8531
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
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-6-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216070632.11444-6-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_031535_433870_CE87EB97 
X-CRM114-Status: GOOD (  21.86  )
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

On 16/12/2022 08:06, Yanhong Wang wrote:
> Add support for Motorcomm Technology YT8531 10/100/1000 Ethernet PHY.
> The document describe details of clock delay train configuration.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>

Missing vendor prefix documentation. I don't think you tested this at
all with checkpatch and dt_binding_check.

> ---
>  .../bindings/net/motorcomm,yt8531.yaml        | 111 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/motorcomm,yt8531.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/motorcomm,yt8531.yaml b/Documentation/devicetree/bindings/net/motorcomm,yt8531.yaml
> new file mode 100644
> index 000000000000..c5b8a09a78bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/motorcomm,yt8531.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/motorcomm,yt8531.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Motorcomm YT8531 Gigabit Ethernet PHY
> +
> +maintainers:
> +  - Yanhong Wang <yanhong.wang@starfivetech.com>
> +

Why there is no reference to ethernet-phy.yaml?

> +select:
> +  properties:
> +    $nodename:
> +      pattern: "^ethernet-phy(@[a-f0-9]+)?$"

I don't think that's correct approach. You know affect all phys.

> +
> +  required:
> +    - $nodename
> +
> +properties:
> +  $nodename:
> +    pattern: "^ethernet-phy(@[a-f0-9]+)?$"

Just reference ethernet-phy.yaml.

> +
> +  reg:
> +    minimum: 0
> +    maximum: 31
> +    description:
> +      The ID number for the PHY.

Drop duplicated properties.

> +
> +  rxc_dly_en:

No underscores in node names. Missing vendor prefix. Both apply to all
your other custom properties, unless they are not custom but generic.

Missing ref.

> +    description: |
> +      RGMII Receive PHY Clock Delay defined with fixed 2ns.This is used for

After every full stop goes space.

> +      PHY that have configurable RX internal delays. If this property set
> +      to 1, then automatically add 2ns delay pad for Receive PHY clock.

Nope, this is wrong. You wrote now boolean property as enum.

> +    enum: [0, 1]
> +    default: 0
> +
> +  rx_delay_sel:
> +    description: |
> +      This is supplement to rxc_dly_en property,and it can
> +      be specified in 150ps(pico seconds) steps. The effective
> +      delay is: 150ps * N.

Nope. Use proper units and drop all this register stuff.

> +    minimum: 0
> +    maximum: 15
> +    default: 0
> +
> +  tx_delay_sel_fe:
> +    description: |
> +      RGMII Transmit PHY Clock Delay defined in pico seconds.This is used for
> +      PHY's that have configurable TX internal delays when speed is 100Mbps
> +      or 10Mbps. It can be specified in 150ps steps, the effective delay
> +      is: 150ps * N.

The binding is in very poor shape. Please look carefully in
example-schema. All my previous comments apply everywhere.

> +    minimum: 0
> +    maximum: 15
> +    default: 15
> +
> +  tx_delay_sel:
> +    description: |
> +      RGMII Transmit PHY Clock Delay defined in pico seconds.This is used for
> +      PHY's that have configurable TX internal delays when speed is 1000Mbps.
> +      It can be specified in 150ps steps, the effective delay is: 150ps * N.
> +    minimum: 0
> +    maximum: 15
> +    default: 1
> +
> +  tx_inverted_10:
> +    description: |
> +      Use original or inverted RGMII Transmit PHY Clock to drive the RGMII
> +      Transmit PHY Clock delay train configuration when speed is 10Mbps.
> +      0: original   1: inverted
> +    enum: [0, 1]
> +    default: 0
> +
> +  tx_inverted_100:
> +    description: |
> +      Use original or inverted RGMII Transmit PHY Clock to drive the RGMII
> +      Transmit PHY Clock delay train configuration when speed is 100Mbps.
> +      0: original   1: inverted
> +    enum: [0, 1]
> +    default: 0
> +
> +  tx_inverted_1000:
> +    description: |
> +      Use original or inverted RGMII Transmit PHY Clock to drive the RGMII
> +      Transmit PHY Clock delay train configuration when speed is 1000Mbps.
> +      0: original   1: inverted
> +    enum: [0, 1]
> +    default: 0
> +
> +required:
> +  - reg
> +
> +additionalProperties: true

This must be false. After referencing ethernet-phy this should be
unevaluatedProperties: false.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
