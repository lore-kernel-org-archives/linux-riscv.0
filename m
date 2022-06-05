Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C0DC433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jun 2022 14:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFab78Phe0xu0FRrrKUcBzgLhJXCU0OVYIaoAa2IWtg=; b=jZG9o6ZMQq6EOu
	Tc15NlYqSZInHRU1B7VfX+sJx9UDYXk+zR6nVDE5gKh7qSlYxav8jQoLHNQi8iqkqxVmOgcj1L98E
	Qo2kUWFrjBWYtr0oKwv+1+piJQ0sPkCxYBjoswz3aUZ+F15cFQchS3Idt/GNSUSgSlhUyRw3nrvQ7
	i5DYkE439cwCJZWyp6mwo8Cc835TyrtBA7moOaakspk5Bcs2057tUOQbGanExm/DHkPWt3F4MHjp+
	t6alpdOVPBrrdZRq3o2h6nuv4swtaZb7YgN0QoEy2wS5QQbVckFKAGBPstxjIQC/Svp9tAXdqPVId
	Vyq+Vzg8aeOCIGG8u60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxrAO-00EdiP-7u; Sun, 05 Jun 2022 14:23:44 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxrAL-00Edhq-2C
	for linux-riscv@lists.infradead.org; Sun, 05 Jun 2022 14:23:42 +0000
Received: by mail-ot1-f45.google.com with SMTP id l9-20020a056830268900b006054381dd35so9054505otu.4
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jun 2022 07:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7/oQ7IZ5egFH+OJP2S8YphbstrwI+fledauf//tGjcw=;
        b=SsYhZIHxtrOiBwADRNmJDurEIaZkWyU2ra+z+SHrfv5g0Xr74AgyNpIiC32PqCkzz5
         8mTdbyM+a1BCf+tl1CR+Nb3YU0VvsBYHDLBJbAXRARtp+Lab6QFn0TH5ZSk0lwh5wCgo
         Yl0YqRsahnTmEaDybmVOfq+Y0vS4FW7KT+zDhomVIztibVThJdLoeh8UZbwAKwIRx6UW
         hhOM3sD33nIvULwDe5En15UbnZlkbhuxpUzWlOXXXGrLDI8vgublzfKtCkbiHRRJzhxo
         DUlmzohMm7Vb5dSt+5VwaOnAfNHYhD7vWQJNnky8AUagkbuxamfKBH6WAzvv6oI1yCj9
         Agzg==
X-Gm-Message-State: AOAM531nac76gETbPRTcISamHazq4M4dTXy+OIDf2i66MFzlyoO4S5l0
	R1DzJRupya/smomNoellxg==
X-Google-Smtp-Source: ABdhPJzH3dROMoziYUT0tlw5oSYBMNk6UzhmF/L+8NgEmJUvFsSOW5Z2havorxwbLEmKpsG8wvOSqw==
X-Received: by 2002:a05:6830:1bee:b0:60b:25bc:d8e1 with SMTP id k14-20020a0568301bee00b0060b25bcd8e1mr8118985otb.164.1654439019646;
        Sun, 05 Jun 2022 07:23:39 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:5fed:bdd:4931:91d5:7dbb:83fc])
        by smtp.gmail.com with ESMTPSA id x25-20020a9d4599000000b0060603221258sm6673566ote.40.2022.06.05.07.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 07:23:39 -0700 (PDT)
Received: (nullmailer pid 3445384 invoked by uid 1000);
	Sun, 05 Jun 2022 14:23:33 -0000
Date: Sun, 5 Jun 2022 09:23:33 -0500
From: Rob Herring <robh@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH RFC 1/2] dt-bindings: interrupt-controller: sifive,plic:
 Document Renesas RZ/Five SoC
Message-ID: <20220605142333.GA3439339-robh@kernel.org>
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220524172214.5104-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220524172214.5104-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_072341_146212_E2015FF9 
X-CRM114-Status: GOOD (  18.85  )
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

On Tue, May 24, 2022 at 06:22:13PM +0100, Lad Prabhakar wrote:
> Document Renesas RZ/Five (R9A07G043) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../sifive,plic-1.0.0.yaml                    | 38 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 27092c6a86c4..78ff31cb63e5 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -28,7 +28,10 @@ description:
>  
>    While the PLIC supports both edge-triggered and level-triggered interrupts,
>    interrupt handlers are oblivious to this distinction and therefore it is not
> -  specified in the PLIC device-tree binding.
> +  specified in the PLIC device-tree binding for SiFive PLIC (and similar PLIC's),
> +  but for the Renesas RZ/Five Soc (AX45MP AndesCore) which has NCEPLIC100 we need
> +  to specify the interrupt type as the flow for EDGE interrupts is different
> +  compared to LEVEL interrupts.
>  
>    While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
>    "sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
> @@ -57,6 +60,7 @@ properties:
>            - enum:
>                - allwinner,sun20i-d1-plic
>            - const: thead,c900-plic
> +      - const: renesas-r9a07g043-plic
>  
>    reg:
>      maxItems: 1
> @@ -64,8 +68,7 @@ properties:
>    '#address-cells':
>      const: 0
>  
> -  '#interrupt-cells':
> -    const: 1
> +  '#interrupt-cells': true
>  
>    interrupt-controller: true
>  
> @@ -91,6 +94,35 @@ required:
>    - interrupts-extended
>    - riscv,ndev
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: renesas-r9a07g043-plic
> +then:
> +  properties:
> +    clocks:
> +      maxItems: 1
> +
> +    resets:
> +      maxItems: 1
> +
> +    power-domains:
> +      maxItems: 1

Did you test this? The above properties won't be allowed because of 
additionalProperties below. You need to change it to 
'unevaluatedProperties' or move these to the top level.

> +
> +    '#interrupt-cells':
> +      const: 2
> +
> +  required:
> +    - clocks
> +    - resets
> +    - power-domains
> +
> +else:
> +  properties:
> +    '#interrupt-cells':
> +      const: 1
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.25.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
