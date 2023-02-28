Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5185C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 15:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WcKbGOncF/Fb/dS9I7jGznNV0Rx2YWBYsuUvhE7UEvM=; b=MRtHZCS3zxHDCw
	FNMF6F0sxJ+VvwA1unLi3Ntkh7n6lOcmEGVZzUhEKiN69FO0EzKvOTGL7bjZlfPUoyMJPUE89G4AN
	GsUNzkIcn0Kw89iKpObq6IGl7YScOwdr+C7IBon8ScEl7t4AeWR0h9gkvIr7Opb7XgvLO9f9hJ7Ix
	shg9EVR9wzivpw910a1VzEfC3vQrmb+dIilQ8lFvua1lzQ4ZKDbqG3Es+WXUGf/WovgCyUIaN9UlD
	95Ip+EYNQvCJE2HSHd108lhCqWOu9vjAiALTaDfwREvI0EOOnH3m0PSiJSAYCcUWWbZvF0zE7sciP
	VZ1+usVezGdQes2UEn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX23D-00DfCJ-FX; Tue, 28 Feb 2023 15:37:59 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX23A-00DfBk-Re
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 15:37:58 +0000
Received: by mail-ot1-f53.google.com with SMTP id 32-20020a9d0323000000b0069426a71d79so201781otv.10
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 07:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiGxUIZlhBoSVJeBkYFENOg4GIwTPCWwmZd3MMsJWhQ=;
        b=egUhG4JWPM+8le7KGnAg48js7GK3FLAOqCyv6MIUNyH8XGgUOYpezbBLwV7r55oigG
         XogKkr/Hnu/7/tlXynba2Frd7vt92UrXoYLlmp0+Yrjbg7kDNLF2nTjbRiPVdhk93TEC
         GLU9SmkzqVAIHlBN3yb3C1sOXWOSOwDZkpg03nFwPhFbyNWMYxCVj7ReNQKJ+6wS4bF3
         u8s5/VBNez44Gnd+G+WO5otPJvdvV/vk5TI6ErV4+UE/PzFBVNQ0+/AXTVt+g8term2i
         GB7e54zYNAddTRwJJlXpc/r/RHeX81MkPbXcpzDWblNZWFe0//v9jaH21kCdjVwPVKku
         Wxnw==
X-Gm-Message-State: AO0yUKWKSedeBMhxuIcZ8G9UyVOYiiWMJMMvJmRrvajSTeeqgM8rpzSu
	C+rGjoMu6L7GvRu1FqX89g==
X-Google-Smtp-Source: AK7set+FQZfJKzMSvooj0J0L2qXGToOzW6Emupz5aqZutC3zQGwWlbQGMFREATBJh3CAD4IfO/nfVQ==
X-Received: by 2002:a05:6830:4122:b0:693:daa8:ea82 with SMTP id w34-20020a056830412200b00693daa8ea82mr2201143ott.13.1677598673203;
        Tue, 28 Feb 2023 07:37:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id do11-20020a0568300e0b00b0068bcef4f543sm3834723otb.21.2023.02.28.07.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:37:52 -0800 (PST)
Received: (nullmailer pid 3296057 invoked by uid 1000);
	Tue, 28 Feb 2023 15:37:52 -0000
Date: Tue, 28 Feb 2023 09:37:52 -0600
From: Rob Herring <robh@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: snps,dw-axi-dmac: constrain
 minItems/maxItems of resets for JH7110 DMA
Message-ID: <20230228153752.GA3292255-robh@kernel.org>
References: <20230227131042.16125-1-walker.chen@starfivetech.com>
 <20230227131042.16125-2-walker.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230227131042.16125-2-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_073756_937528_9AC83556 
X-CRM114-Status: GOOD (  15.86  )
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

On Mon, Feb 27, 2023 at 09:10:40PM +0800, Walker Chen wrote:
> The DMA controller needs two reset items to work properly on JH7110 SoC,
> so there is need to change the maxItems' value to 2 and add minItems
> whose value is equal to 1. Other platforms do not have this constraint.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 25 ++++++++++++++++---
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index ad107a4d3b33..4ed0a6b7ca69 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -12,14 +12,12 @@ maintainers:
>  description:
>    Synopsys DesignWare AXI DMA Controller DT Binding
>  
> -allOf:
> -  - $ref: "dma-controller.yaml#"
> -
>  properties:
>    compatible:
>      enum:
>        - snps,axi-dma-1.01a
>        - intel,kmb-axi-dma
> +      - starfive,jh7110-axi-dma
>  
>    reg:
>      minItems: 1
> @@ -58,7 +56,8 @@ properties:
>      maximum: 8
>  
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>  
>    snps,dma-masters:
>      description: |
> @@ -109,6 +108,24 @@ required:
>    - snps,priority
>    - snps,block-size
>  
> +allOf:
> +  - $ref: "dma-controller.yaml#"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - starfive,jh7110-axi-dma
> +    then:
> +      properties:
> +        resets:
> +          minItems: 1
> +          maxItems: 2

A given platform should not have a variable number of resets. This also 
does nothing because you just duplicated the top-level constraints. If 
you have 2, then you want just 'minItems: 2'.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
