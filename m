Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BA3C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 21:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+aZZBXjMp2M0Fw+Tgi6LPELIQOrJDjlc66Oq3B74hQ=; b=r7taHywaRHvJeL
	3fx9UsnfVbbOWgxTNnGGI9WKb4a/XVtNtHxJlGuvI5TjYAlY/OMgtPt9jZUaji4tBrLfqP9NWvZf1
	igKMPl64oESHkyAxUWQHhdhgFDuA0NEHIgNMQCntFuQHjaNItBCoX4yrJsAWMhPu+xlxQGzKUi4GY
	RkFFLA6LTMUZP5/r2Qm/mFbMPWc99F6NMRrfX99+nNDiC8LLjPQG2Xwiu4bQDoZ0e0Sdnwz85dgp0
	1zcaYnCOsM3lnihYsvkRMtRx8TOlyWzD45o2PC+alltj8QLvlMgU/47V5alclfzIKINtCM+Z97e2m
	DaM7bzMG1N/7RqXVGSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5wNn-002ucj-Bq; Mon, 27 Jun 2022 21:34:59 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5wNj-002ubc-Pw
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 21:34:57 +0000
Received: by mail-lj1-x236.google.com with SMTP id bn8so12574953ljb.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 14:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=r50n64wyDXc98klCxenqB007ebeUTjgGTq3cHnewLs4=;
        b=eTl8RIM33/VhG6tyN0u1F7fh7bD9vwV9Nzl/DTA5Ny2T+C6Zz9CjWOXxw7tIRCfdSF
         JYJ+vK6VW6ow6XLR5ZnJoODpvohnt2Z+3t+vZDZHvM57s96TKZNFnlBSRDHDoYRnNnyQ
         N0k44RLYsM83fxNhFomNU3IiMDIB4LHzbT4UomKmLLPc0fcxeMBuZkZoILf+4d9CFzu5
         UGEjxpB5ZDTuXmtB4swbT0dDHmqosyfnMddfaHNphkAj8y6jxGlSDFIcL0nXRbbh3k9b
         NayiDEFJxxACHU3nhoe6LL8qnnNmGMIoh2ujOpxj9PuVm+6S9FPq9eujRABge7XAKiJx
         lZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r50n64wyDXc98klCxenqB007ebeUTjgGTq3cHnewLs4=;
        b=Oa2q6auKSE46U3dsRv2ni9E6SPIKYXoBkwf0u7yCMVZtKTlj9G6ttiheBUVh6Zt10h
         n/3kjs8C/7EYxZv2+tOWGeJEqDLo/8d9RjmQJn4L3ctZgoCJ1LC/0CP8XccgazvQ7nHR
         pGfOy23PF6vmHP2PrlSwT7FbAsHuYPW6IGpvWg8XHUVKaipttI/IlDRH6wEGX0cTRt/E
         871FR4E4KeClXzuWCpsw2xS1PwYexdvCSoewPhw2kC/46WwXypGDaDNbXGjxkTen2gC8
         FwmHPOQrJB+U6dFeodBMnAFmPBnVIXPOW3OqqFic8zk+uMmUtWgzv5wB9P3UCgbsOTwI
         ltyQ==
X-Gm-Message-State: AJIora8pdtkv2kUwsNqDi3A1ggLDmHqr1nRpkMLFnlrQqJsOfjQRYZ0l
	d5TluBilNdsAZzIVci+w3i0=
X-Google-Smtp-Source: AGRyM1s2Xww9mZJQuItbTSCpLvPnTOre5lxdTZAquDOY9Sz5QQprbSClbPdC4vgd++PPS48AGvyOcw==
X-Received: by 2002:a2e:702:0:b0:253:bc1a:8a8c with SMTP id 2-20020a2e0702000000b00253bc1a8a8cmr7961986ljh.128.1656365693778;
        Mon, 27 Jun 2022 14:34:53 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id y1-20020ac24461000000b0047fb3ea0659sm1929044lfl.292.2022.06.27.14.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 14:34:53 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:34:50 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 05/16] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Message-ID: <20220627213450.ukqai4bsjzcwhnlp@mobilestation>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-6-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220627194003.2395484-6-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_143455_881430_A4539473 
X-CRM114-Status: GOOD (  24.17  )
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

On Mon, Jun 27, 2022 at 08:39:53PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
> controller, but according to the documentation & devicetree it has 6
> interrupts rather than the standard one. Add a custom compatible that
> supports the 6 interrupt configuration which falls back to the standard
> binding which is currently the one in use in the devicetree entry.
> 
> Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58

I believe what you've got here is the per-channel IRQs, which is
activated for the DW AXI DMAC by setting IP-core synthesize parameter
DMAX_INTR_IO_TYPE=1 (CHANNEL AND COMMONREG). That's why there are six
IRQ signals and six DMA-channels available.

Seeing such setting isn't the Canaan k210 specific, but is the DW AXI
DMA controller common property, what would be right in this case is to
unconditionally extend the number of IRQs in the DT-bindings schema.

Please note the DW AXI DMAC driver currently doesn't support the
per-channel IRQs. So most likely the DMA will only work with using the
channel 0 only.

-Sergey

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 35 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 4324a94b26b2..bc85598151ef 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -18,9 +18,13 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - snps,axi-dma-1.01a
> -      - intel,kmb-axi-dma
> +    oneOf:
> +      - items:
> +          - const: canaan,k210-axi-dma
> +          - const: snps,axi-dma-1.01a
> +      - enum:
> +          - snps,axi-dma-1.01a
> +          - intel,kmb-axi-dma
>  
>    reg:
>      minItems: 1
> @@ -33,9 +37,6 @@ properties:
>        - const: axidma_ctrl_regs
>        - const: axidma_apb_regs
>  
> -  interrupts:
> -    maxItems: 1
> -
>    clocks:
>      items:
>        - description: Bus Clock
> @@ -92,6 +93,22 @@ properties:
>      minimum: 1
>      maximum: 256
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: canaan,k210-axi-dma
> +
> +then:
> +  properties:
> +    interrupts:
> +      maxItems: 6
> +
> +else:
> +  properties:
> +    interrupts:
> +      maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -105,7 +122,7 @@ required:
>    - snps,priority
>    - snps,block-size
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> @@ -113,12 +130,12 @@ examples:
>       #include <dt-bindings/interrupt-controller/irq.h>
>       /* example with snps,dw-axi-dmac */
>       dmac: dma-controller@80000 {
> -         compatible = "snps,axi-dma-1.01a";
> +         compatible = "canaan,k210-axi-dma", "snps,axi-dma-1.01a";
>           reg = <0x80000 0x400>;
>           clocks = <&core_clk>, <&cfgr_clk>;
>           clock-names = "core-clk", "cfgr-clk";
>           interrupt-parent = <&intc>;
> -         interrupts = <27>;
> +         interrupts = <27>, <28>, <29>, <30>, <31>, <32>;
>           #dma-cells = <1>;
>           dma-channels = <4>;
>           snps,dma-masters = <2>;
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
