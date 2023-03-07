Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9C8C678DB
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 09:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUxQFixfGXqNu22UtUnMCi7QmFtWsG+2NIZ/o1uRMv8=; b=NFOv+mAfv2AwRN
	r3teEVI+m9kEVD+GuwEtwHn6VE3H0mAwwKngI/gAnw/2m2SBqWB2Z4Z2eMwKxDT9lERdAyxVerb8H
	DkHe1bmIzoW85J9wfGNFphig3/1sAO8JoiODmOqULIC5h2q5fwkuWVyZEb919Zmnlh5ISFrZnJo/Z
	yGsPuI5/pBqPpup+vLISdfhSt3Lz3vXBEqGdS+l1o4vLMYcGWuYSWKPqU5WwpE97yX+sMA9lDtHOI
	MQck2EQCtPeeqrTEtk2NmCSoXv+xGyuTU4ZgQdZFKHfbDowYTN4WF7mZNT0NL6ZVII2VWANn3FlHo
	GfaOvJ03zRpdfZG2cBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTEl-00GpWE-08; Tue, 07 Mar 2023 09:03:59 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTEh-00GpVa-O0
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 09:03:57 +0000
Received: by mail-ed1-x52b.google.com with SMTP id cw28so49423690edb.5
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 01:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678179834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKx0mOkpRvRnCD/ymFwDwCwKvrzXqmFUgh9qzSW4PII=;
        b=nlg42fRs9OuoIq2xD+xUEYMEZSBK+LODPpSyr7N/ri7VyhxSZQ3xCqI0BoOFn5eTEl
         RuxaQv0qgZoAHX38sXj/b83UiUbDXYkKFpZo2eJZwJ3UjFeYuG6ziSALDog48COpvZ+w
         QJ8AdYBf6c23YgJ8LJDCqKoMDQcuTkprPZavXtf+vsTRIN/qhP2mEPQtMsPvZFFIHpCI
         Ug5xQ3ekBUF3Q9vjsx76uCOYoWzre5Tr2v/9Pe/rkHSQgXnrjTLah301lJvPcaope+ye
         Vtq/aefqJd1wJ6p+Vfeb/ZcaZ3/01p1QXEcrSECX7wtj9MbdTRsr33gEo0LhN0A5RDuO
         V+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678179834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sKx0mOkpRvRnCD/ymFwDwCwKvrzXqmFUgh9qzSW4PII=;
        b=J9I7vXUgBZJyoT69eQZTWhEEu9+j5BGD9ptf55kMtJE5aW1+lLHZf2dEnHe8aKWWzX
         EU17d41NVSAf66y//kKKn+U8wwl2xkDh6+jQTLAsXDut9gqkEJ2eOSKXMdLEIBLkl+NQ
         OUJFagJG28LrcAiBfCwyW/Q8HfEF5HOS/Za3ADjSmrEXLmth7sAnQ9u2bsQMDUcpcjrE
         ckvgj5FIws8u26TjJzV/YAkSWrcuEK7VFUQlOgU9GK4MEkMn9nNFyh+v8bpyqCVISNei
         sx6xvoJqFl2C+noVd3oh4x+GqZAHrWq6qhTYUGySoa0rhmt0CFjA2STTjizSaFBklLqR
         x+8w==
X-Gm-Message-State: AO0yUKVQt0eJjDD9T64oKLAid0o5QGYYIH77Q5RG+J5b0ov8My3uFHpV
	N4QbPs7J2OlbPhgOWv8i06Ruwg==
X-Google-Smtp-Source: AK7set/bUqwAq/6asQNaUsbcnghCIXoZCJWabHy9kZ1G907/38X/E3IF17xsoo9IDiWsPXCP2TfTrA==
X-Received: by 2002:a17:906:4783:b0:878:4497:380e with SMTP id cw3-20020a170906478300b008784497380emr17334260ejc.4.1678179834212;
        Tue, 07 Mar 2023 01:03:54 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3? ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id uk19-20020a170907ca1300b008cecb8f374asm5741155ejc.0.2023.03.07.01.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 01:03:53 -0800 (PST)
Message-ID: <b2b36909-b0b1-7507-3145-141eb5ec0f3f@linaro.org>
Date: Tue, 7 Mar 2023 10:03:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: snps,dw-axi-dmac: constrain
 resets items for JH7110 dma
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230306140430.28951-1-walker.chen@starfivetech.com>
 <20230306140430.28951-2-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306140430.28951-2-walker.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_010355_814284_ADE19815 
X-CRM114-Status: GOOD (  17.02  )
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

On 06/03/2023 15:04, Walker Chen wrote:
> The DMA controller needs two reset items to work properly on JH7110 SoC,
> so there is need to constrain the items' value to 2, other platforms
> have 1 reset item at most.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index ad107a4d3b33..d8b5439f215c 100644
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
> @@ -109,6 +108,23 @@ required:
>    - snps,priority
>    - snps,block-size
>  
> +allOf:
> +  - $ref: "dma-controller.yaml#"

Rebase your patches on something recent... I would argue that it should
be based on maintainer's (or linux-next) tree, but that would be too
good to be true.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - starfive,jh7110-axi-dma
> +    then:
> +      properties:
> +        resets:
> +          minItems: 2

What are the items expected here?

> +    else:
> +      properties:
> +        resets:

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
