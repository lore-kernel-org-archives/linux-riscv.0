Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F5EC001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 10:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0KGKtZ/Xem4FfdSLT+OFxUv1FPsbA+PN5F+KgvjWCTs=; b=4Ua6K/pZyDg9sN
	c9gGg3xRFS04JhS/pZ48CVzmauUeq0fY116ZzYhJQolFIn02trz8gMc+oe88ozSMvZtEnkbZd9HuB
	+Zor0pzYFrNmlr5mw8BYed31wffYcg+ubBcSwNsDflyMN20tG8hGSJgCz8VuQlP3QGq1bVa7+QiPj
	X4zGmNQ2yaXzVDq7qDTFBqMY8KMG1LiHeadA8/Hh+spdwpTpXR+LZumPvBN3cOhHlFwv3AGyl3eSI
	Tw25QnDTYeiPPh6qr5TqKC0p8InsoHnhKr7eKkKTw9Htq4VBULaEl/nJtTUJqD6ySrc72DKxYI5Xu
	zYjhzJJTvtmAD0uEKTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4qE-006pU3-1V;
	Wed, 19 Jul 2023 10:55:34 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM4qB-006pMv-2k
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 10:55:33 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f9fdb0ef35so11500623e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689764125; x=1692356125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVxXZfOtxak8iBVRDb2c9fmyjvpQOuKAzeNKIUJfojo=;
        b=HeVH4aqAbGSTlrakuKCfBsU+kcA3+5vAw/2F2XZ2oKt4WdOKQWlwy96CAB1sZy2WU4
         8qvnhQiLGswTExx5lvoyoLk9HoK5mtEiqeLYGnDidaOStp2zs9rhLdZEtYr1RYBuNInE
         czVr7Mq22nDyuHb/uyyj9p5JJQtEUj9MUChLeLMvmGt68Pf5kpvesh/6Cytqoi8powab
         pju96pfebtbnLVIn6qNYf6YbWElvAJNANr+F4laUWMyJ2D0pQvwrs2s9tX2d/JsKn6b+
         8J+YOtt68Xg3TitlkpEoYxJkP9wP5Vs94/8nAP5jnZX1Fkk5Q70FIz9afn0/kMP7jTcj
         ixPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689764125; x=1692356125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVxXZfOtxak8iBVRDb2c9fmyjvpQOuKAzeNKIUJfojo=;
        b=Ei/i346MkgG2w8adXfiWEbvlv9UhPU+DAHhZC6yCA9KWzYu9ERsHBbRvlQDRUkyDsc
         8jMhg7Md92loAxks8M1DQHwHjuUQJMTevezSujALIvtb5psHOXZbYuMVzjNnLAd5SdNs
         6Ezo44wARoFJ1Uy8HyC0AOPoGqtkA/eC5zxfX6JIr9EE/EXV4ObEB1dz3ZtSN+bphalb
         PAU7wC0btwPD0rOjOFMycyj1+AdcL4m/g6fWrbKmr/cYatbMGfmLrT/PEF2iSum9rDgI
         MEOaS8F08TftEawWx+zqubi0Koh+4KbXgLGE4wxBAaGaDQOoJGynDAtec/AVlDlvr5MY
         Fj6g==
X-Gm-Message-State: ABy/qLYYPovoknCt3+5xtsslt+Puz6TnHuJL8h8S0HYFUGz2R/v8OAW+
	HwhFlMNsQ2jvTnpzreJIPVWy3w==
X-Google-Smtp-Source: APBJJlH1QRK+S6KRTvEUqv/cdRVknog7MADGQ8rYn1gGhl1iDVu/AuB3WpeY+yiLkKU5yEqoT9rncw==
X-Received: by 2002:a05:6512:3d89:b0:4f9:6528:fb15 with SMTP id k9-20020a0565123d8900b004f96528fb15mr13939510lfv.12.1689764125474;
        Wed, 19 Jul 2023 03:55:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id be1-20020a0564021a2100b0051e2549c4f9sm2526983edb.47.2023.07.19.03.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 03:55:25 -0700 (PDT)
Message-ID: <6b452a82-4fc1-bb0e-2475-755d699db1ee@linaro.org>
Date: Wed, 19 Jul 2023 12:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 5/9] dt-bindings: PLDA: Add PLDA XpressRICH PCIe host
 controller
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mason Huo <mason.huo@starfivetech.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Kevin Xie <kevin.xie@starfivetech.com>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
 <20230719102057.22329-6-minda.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719102057.22329-6-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_035531_888117_96E8FCFC 
X-CRM114-Status: GOOD (  15.06  )
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

On 19/07/2023 12:20, Minda Chen wrote:
> Add PLDA XpressRICH host controller dt-bindings. Both Microchip
> PolarFire SoC and StarFive JH7110 SoC are using PLDA XpressRICH
> PCIe host controller IP.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../pci/plda,xpressrich-pcie-host.yaml        | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml b/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml
> new file mode 100644
> index 000000000000..10a10862a078
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/plda,xpressrich-pcie-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PLDA XpressRICH PCIe host controller
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +  - Minda Chen <minda.chen@starfivetech.com>
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-bus.yaml#
> +  - $ref: plda,xpressrich-pcie-common.yaml#
> +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: plda,xpressrich-pcie-host
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#interrupt-cells"
> +  - interrupts
> +  - interrupt-map-mask
> +  - interrupt-map
> +  - msi-controller

Your common schema should require properties which it defines. Here you
should require only difference or new properties.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +            #address-cells = <2>;

Use 4 spaces for example indentation.

> +            #size-cells = <2>;
> +            pcie0: pcie@12000000 {


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
