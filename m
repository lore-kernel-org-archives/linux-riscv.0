Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B242C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lrw1owsBb20hKKloAGFKHMJCXyB2LJgXs6FHgRXgVNs=; b=1nxpksi0RwNW+A
	ULeviQzvpBCUFviIYIbfVaHzgE7f52BUDZ0Gom1u7BQBGi37AVXhHo5sGo4rjkm4qE4al/SVnmTog
	qblwtma6t/CYN3/yI/hTE1ax3kQZe8tcdO34bLhzjbQOwkF+ll24HBfIRSE8UdYBb05/c62yAdhWy
	r+8jZDYWNWnn6kLAF5Wp90HmB7cPQ8NLPrrfKaJPpnSXU3vZ8PEiJM1YYyxtf1gBQ2K+x4q2xNNID
	K1Er+n1ebI30/IHKWPwFiDHQ6UC1IT6nv0KNf8U9lutM+vkqcI1gD/0PtLxiMQ9BVga57IpPRmS1O
	u0p7YqT/kQRtTYg5u6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPCz-001SZr-HP; Fri, 12 Aug 2022 07:35:53 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPCw-001SWw-Hf
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 07:35:51 +0000
Received: by mail-lj1-x22c.google.com with SMTP id l21so165760ljj.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 00:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=crf/lK1s1ldsW0Tw+pD5ZUVc6HtWvvcIF4KEVSHKYCs=;
        b=MfvFWerjwE77AMLPjqKIegxdoqhOqfeQHdlO/9wkZV8Ij6ZLgc2ol2zQPgQeWsj/cb
         73haqi/mTZaglW2d9895VCaJISlsrujvoqxmq0cOEDO7VkYXH6VUxmVTO4BoILtdY5vE
         UempconjzeH7i57ydpUcpD0RQ06+algfRdpTwWNf9x0xGVA1VtARrXXCiE60EHpSua3T
         isrJnW182uUbzmoNuVyGYw5kQ43DIkENrudblAvGJi2l5Hib86Dd9CqUlmbW1TaP7Jet
         TtxSbGSn6SfZNs/6oUI5PcdaZGBAqhrvTc3jQW181cTTgirqhvd30CEL2iHTqAP9kF7t
         sBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=crf/lK1s1ldsW0Tw+pD5ZUVc6HtWvvcIF4KEVSHKYCs=;
        b=sFPBkqj+VZ2e5baSktZNUEkhfwpIvzLeIDqVP1Yrzg1Fxb9JjqZtxf1ny6B7VJuR3z
         q/4rhIg/E8FZZvILW7qL2HvRAGinogSnhhQtOgxQT536LmYSLyv4puuVtYkTzFF1Hc/K
         pDFh9xLe73P0eIvuueT1TsvHoXtZs59IjYTyRYWT86fdcSub0dMqYN5uQQssVW03tDiT
         kz6KPI0IGSPqJOoNjP1RzPW+hFWITQqQ15hjbjs51EmEUUVOW3pQpIMJqJAKKsdSTCka
         FSNFfcUhYJqt07nesjWRmL6LZnRK9mbltql5BgGdSAuLv3dF9KZ/E7Jk03KRJWQOLC26
         Q8Ag==
X-Gm-Message-State: ACgBeo2jE3ZPzZOTO2fd4Y/R37xc3gtnmZbWscBKt9/nn3/m2lY5PVTW
	d61nERVIUeHaeZ+nVfdvywwlyA==
X-Google-Smtp-Source: AA6agR4psy2iVI6/fRchmfquS+bif8PW2q7V1EgYmOZnqcSeinMvmGjxODB1u3SfgOJboPsudN4f0w==
X-Received: by 2002:a2e:bf16:0:b0:25f:f90a:b856 with SMTP id c22-20020a2ebf16000000b0025ff90ab856mr866672ljr.473.1660289746838;
        Fri, 12 Aug 2022 00:35:46 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id p2-20020a05651211e200b0048af60faabcsm118423lfs.131.2022.08.12.00.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 00:35:46 -0700 (PDT)
Message-ID: <99b5bddb-4a09-a3ac-e01b-d0ae624ad2f8@linaro.org>
Date: Fri, 12 Aug 2022 10:35:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] dt-bindings: PCI: microchip,pcie-host: fix missing
 clocks properties
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-3-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811203306.179744-3-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_003550_615277_EE70E026 
X-CRM114-Status: GOOD (  17.65  )
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

On 11/08/2022 23:33, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Upgrading dt-schema to v2022.08 reveals unevaluatedProperties issues
> that were not previously visible, such as the missing clocks and
> clock-names properties for PolarFire SoC's PCI controller:
> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
>         From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> 
> The clocks are required to enable interfaces between the FPGA fabric
> and the core complex, so add them to the binding.
> 
> Fixes: 6ee6c89aac35 ("dt-bindings: PCI: microchip: Add Microchip PolarFire host binding")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/pci/microchip,pcie-host.yaml     | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> index edb4f81253c8..2a2166f09e2c 100644
> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> @@ -25,6 +25,31 @@ properties:
>        - const: cfg
>        - const: apb
>  
> +  clocks:
> +    description:
> +      Fabric Interface Controllers, FICs, are the interface between the FPGA
> +      fabric and the core complex on PolarFire SoC. The FICs require two clocks,
> +      one from each side of the interface. The "FIC clocks" described by this
> +      property are on the core complex side & communication through a FIC is not
> +      possible unless it's corresponding clock is enabled. A clock must be
> +      enabled for each of the interfaces the root port is connected through.
> +    minItems: 1
> +    items:
> +      - description: FIC0's clock
> +      - description: FIC1's clock
> +      - description: FIC2's clock
> +      - description: FIC3's clock
> +
> +  clock-names:
> +    items:
> +      enum:
> +        - fic0
> +        - fic1
> +        - fic2
> +        - fic3
> +    minItems: 1
> +    maxItems: 4

No need for maxItems.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
