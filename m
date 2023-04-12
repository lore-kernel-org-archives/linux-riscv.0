Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E691FC77B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 08:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XF+PebxPuriyIyuSbXIf7+pm9Z+Hn9Z4TZm471QzI/k=; b=elqHyP3ijq3DAC
	X3F07dxgXhwcxie1iXP6FTLm4JlolciqXUWSx8OVrlQWLHolfILzLzPd9HSY7UOuxwogbu/bD++OK
	RatWqEBomBpmCgeECDoevz4Sjwy/qM3ZdbUc4hREeOnRFp8CaZNxLOfU5URz96HM7tEHlnBeil02J
	2QZfPHNYANG26/Voz0PclxitHAysgMYJPHztgPx4MOOS8BYF4dVbtfPezCdl0ZIl3YyfbCk9O2ouE
	wiQPXNS6HILzvH9+iSuPhc2U6W63+0Yaa5ZBkYJXB2TYr+bIswa5CzkjzOpHaf9iWsVdrRi+L+zFB
	iHqcRv9LSSNi0hkcqunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVuM-002Gfv-2y;
	Wed, 12 Apr 2023 08:32:50 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVuK-002GfO-07
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 08:32:49 +0000
Received: by mail-ej1-x636.google.com with SMTP id q23so17337706ejz.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Apr 2023 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681288366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXiGiAF3mJm/6hgfCTKaagk5zrHngr0ItbqxTgvmii8=;
        b=C/51NnDG3cTMi1zIIBdXnNwtu+5/H+Te65ByqDIe1Dqfva8pHREGnFaHn/9lMjxBEu
         sBZQiMhtPvgDpe2ZtVfYQRmIus4pbBZMnWTOl47ORd9oEJ8XGCAAb4XJ6I1AfdxS1ves
         3+rkSCLvC3SAPC5fF4nON0+qETWahP3+Apns3D5IvEmCT5VlggcPsZ+nFCYwpkOnqRhd
         cpvGtxqmHFHZV+eN4oyLUCCpVUKHXnHcKCbBe5zVImZzc10PVVSWz8bghARPUZX6iCFc
         qCZwb2Igfu73AYiIuAe3MixuQgC8IE4Dir6LD/sBpy0RUjdPoO581HJvkuTLTT3Wsm/X
         ehoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681288366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXiGiAF3mJm/6hgfCTKaagk5zrHngr0ItbqxTgvmii8=;
        b=DjPGpYQsT0c0C8gwme/WRQNh62vy7BxWE9ER4o1BnPnV+03OLDpKLoAJhD0Xdv0yQV
         FYR73hdYB9BBCmDLitUGzTMrycW9Be8P0T66npz+TsUa8NBnfd3sS9DjFLSKeuk1gGOt
         4Y8P4CNHQzkGVpcorjA+eIvfX+lPDbdGLAihpxkymeGaNEjT9Ki4baJvzed/bU+Np0Qu
         a3e9/wV98wSFp4pr/aYl2makn1mjcHV/rqqpIKgx0zXJEDuyFdpR+aHktzN2nh3KkHmO
         crlQAAk86LGixyw+LiyXRJ1+7BfQxKqYQge+2+Kyto38Rl4k4rHDRZkBBiLwXhCuD4qA
         8HDQ==
X-Gm-Message-State: AAQBX9dL712NzXGH4lMPoqfR+LL2DXbAE0f17AK8oy1wWRCUCMXx47r/
	lWpZqtx59tGcCebewuE+edWdWQ==
X-Google-Smtp-Source: AKy350aonQuINRVoZBdNIRp5k/+iTxbe085iISMQDF1/o+RSzs78iZn4aQ4I9E5uICTAMMyjmj6qNw==
X-Received: by 2002:a17:906:c78a:b0:947:eafc:a738 with SMTP id cw10-20020a170906c78a00b00947eafca738mr5025769ejb.60.1681288366167;
        Wed, 12 Apr 2023 01:32:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id rv12-20020a1709068d0c00b0094e5fd589f9sm427786ejc.19.2023.04.12.01.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 01:32:45 -0700 (PDT)
Message-ID: <a22dff0a-56e6-be1b-10b2-ce3b31f420c5@linaro.org>
Date: Wed, 12 Apr 2023 10:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 5/7] dt-bindings: usb: Add StarFive JH7110 USB Bindings
 YAML schemas
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Mason Huo <mason.huo@starfivetech.com>
References: <20230406015216.27034-1-minda.chen@starfivetech.com>
 <20230406015216.27034-6-minda.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406015216.27034-6-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_013248_094541_175C0CDE 
X-CRM114-Status: GOOD (  18.55  )
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

On 06/04/2023 03:52, Minda Chen wrote:
> StarFive JH7110 platforms USB have a wrapper module around
> the Cadence USBSS-DRD controller. Add binding information doc
> for that.

That's one of the most redundant subjects I saw. You basically used four
words for one meaning. These are not exactly synonyms, but they all are
either imprecise or meaning the same.

Subject: drop second/last, redundant "Bindings YAML schemas". The
"dt-bindings" prefix is already stating that these are bindings.



> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> ---
>  .../bindings/usb/starfive,jh7110-usb.yaml     | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> new file mode 100644
> index 000000000000..c8b30b583854
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/starfive,jh7110-usb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 wrapper module for the Cadence USBSS-DRD controller

What do you wrap here? Are you sure this is a wrapper? I think this is
just USB controller?

> +
> +maintainers:
> +  - Minda Chen <minda.chen@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-usb
> +
> +  reg:
> +    items:
> +      - description: OTG controller registers
> +      - description: XHCI Host controller registers
> +      - description: DEVICE controller registers
> +
> +  reg-names:
> +    items:
> +      - const: otg
> +      - const: xhci
> +      - const: dev
> +
> +  interrupts:
> +    items:
> +      - description: XHCI host controller interrupt
> +      - description: Device controller interrupt
> +      - description: OTG/DRD controller interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: host
> +      - const: peripheral
> +      - const: otg
> +
> +  clocks:
> +    items:
> +      - description: lpm clock
> +      - description: stb clock
> +      - description: apb clock
> +      - description: axi clock
> +      - description: utmi apb clock
> +
> +  clock-names:
> +    items:
> +      - const: lpm
> +      - const: stb
> +      - const: apb
> +      - const: axi
> +      - const: utmi_apb
> +
> +  resets:
> +    items:
> +      - description: PWRUP reset
> +      - description: APB clock reset
> +      - description: AXI clock reset
> +      - description: UTMI_APB clock reset
> +
> +  reset-names:
> +    items:
> +      - const: pwrup
> +      - const: apb
> +      - const: axi
> +      - const: utmi
> +
> +  starfive,stg-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:

Same problem as for other patches.

> +        - description: phandle to System Register Controller stg_syscon node.
> +        - description: register offset of STG_SYSCONSAIF__SYSCFG register for USB.
> +    description:
> +      The phandle to System Register Controller syscon node and the offset
> +      of STG_SYSCONSAIF__SYSCFG register for USB.
> +


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
