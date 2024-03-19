Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8E9C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 03:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCIYF58sUbuxcXZLmfc1vDFdSXpL7YrkVU6HJ3f4V6w=; b=xST+JdEJ029cJ+
	n1DoROgiJ346zkSB5A4YtlWoW8OuoU8f9Z7caJGuPi1vP1IiBU+kHc4nKQksE+ieowigTLKJ91k98
	bmY7trGguv8krKPKbiwMQTnoVLCgsYMbZbgQV7DGvhnLCxqQRYA9JsyCFwmDkgnTffVEG/Bp7ul6n
	lA7kLz5gfZGNag/KLkihXS8vATfpZW319H52oOlIBj1hLMF4jaFxT0ibV+5ZxS0pEwSj+rQNC5HhP
	I4D4gwHhgMEBHClBj7HroNv4MWNRHWWuuzaXCgsLDzJnj0Rmt0UA0UgYAAIO9SsevDat5AA5pp5cr
	elLxRKVMfGIKQtEv9DZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmQ40-0000000B4Dl-3ePE;
	Tue, 19 Mar 2024 03:22:56 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmQ3x-0000000B4DI-0Ai1
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 03:22:55 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-690c1747c3cso46467036d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 20:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710818570; x=1711423370; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMw9a1z02q9ezrV1ZNQg91O+JjWFgILRbLm9d5yMuuc=;
        b=Zb70i7AntwVAeOTp3URK2zn8mN1+lxQ6ZxKuSQJFefykhJpE5XCThSAsY+JuMsTFXp
         I75xAx4Gzr0g1ACP0S7C1Gmr32kLRtSTCYUliyNQhhIsmxqhIq1VANPom9Oj19o2o5zP
         O9U/01DRkALcIv0Bv2nFxTVulI32hpzyTkfsXwJopW4nRT3seyrERK/Q7XCmWd54liDE
         2blgqQnemC0YuIttOow3K6mfGnBOSgeuWCrfLxywTf6wlMAb783l4GjyYn/uzOLi1mAx
         YmEzf6UHuPTCIUJUhKtzh+M2KlRi3s94RLcSQvHRgxqloJMN7+kc6Eqq2uJBBF6eEbyB
         pkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710818570; x=1711423370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMw9a1z02q9ezrV1ZNQg91O+JjWFgILRbLm9d5yMuuc=;
        b=i2BTV5gEntJYAVqF/vu4Ttcd4ilYdYSl2sdm68DeOZWjLN8O2Wc2LDxn3r7V7brSGD
         zYxcAn1iVZEp0WRq8C9v95u8szw3dF9eZhfkKxGCrxU0MALG8rnVA2yd1bf+9X7Xycqb
         tXf7glvX13hLSEkNNQkX0zqaRbz/TBJRNhPn84hdcqYmNQ2hW1LZEo0165VU7Q/oWXZt
         kq1zcbDw5kHjHoZ/8ChfSMOUyjOkYQ9DzDuSE6Vjig/frIQdinYTvG9D4oEu4AitVNZ+
         MYnXIMg4aa503zB2SuzQ+aHSLKdEJkM+GRUy3FzuzOsV1/uglaQWTB8d6s0tVatbJ/Vx
         dbnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqJKI1kjaSclQWN6W8BQCzSZAD4/QWUQZ2DWm1TteAglHeiqKosCSzdiYK9p7mKtba/Xr+ghEnGDOHksJAFWj2ee842wU/PP1w5kvGL4AK
X-Gm-Message-State: AOJu0YxEEk9t72U86l2o08e9WNEZtp4sJ+77kZhlj6yLdk9ew+9T79W6
	gSdiasOzvWfJkR3EZJ6WTU2gyQpjYVLQyo8FxVxS1wr47huU23IsS3UAYDb9r5k=
X-Google-Smtp-Source: AGHT+IG8Y3FR9B/B9mSnEIBCA8gr+6fLKtICJUUHKawjSCnnvGpGfdMy55hTxouwueL4wMN6IN5QSA==
X-Received: by 2002:a05:6214:c49:b0:696:20b8:cfc5 with SMTP id r9-20020a0562140c4900b0069620b8cfc5mr2771527qvj.6.1710818570458;
        Mon, 18 Mar 2024 20:22:50 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id jx5-20020a0562142b0500b0068f4520e42dsm6034517qvb.16.2024.03.18.20.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 20:22:50 -0700 (PDT)
Message-ID: <29f468c5-1aaa-4326-8088-e03a1d6b7174@sifive.com>
Date: Mon, 18 Mar 2024 22:22:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: dmaengine: Add dmamux for
 CV18XX/SG200X series SoC
Content-Language: en-US
To: Inochi Amaoto <inochiama@outlook.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>,
 Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <IA1PR20MB49536DED242092A49A69CEB6BB2D2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49532DE75E794419E58F9268BB2D2@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <IA1PR20MB49532DE75E794419E58F9268BB2D2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_202253_301397_966EF706 
X-CRM114-Status: GOOD (  19.74  )
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

On 2024-03-18 1:38 AM, Inochi Amaoto wrote:
> The DMA IP of Sophgo CV18XX/SG200X is based on a DW AXI CORE, with
> an additional channel remap register located in the top system control
> area. The DMA channel is exclusive to each core.
> 
> Add the dmamux binding for CV18XX/SG200X series SoC
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/dma/sophgo,cv1800-dmamux.yaml    | 47 ++++++++++++++++
>  include/dt-bindings/dma/cv1800-dma.h          | 55 +++++++++++++++++++
>  2 files changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml
>  create mode 100644 include/dt-bindings/dma/cv1800-dma.h
> 
> diff --git a/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml b/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml
> new file mode 100644
> index 000000000000..c813c66737ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800/SG200 Series DMA mux
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +allOf:
> +  - $ref: dma-router.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800-dmamux
> +
> +  reg:
> +    maxItems: 2
> +
> +  '#dma-cells':
> +    const: 3
> +    description:
> +      The first cells is DMA channel. The second one is device id.
> +      The third one is the cpu id.

There are 43 devices, but only 8 channels. Since the channel is statically
specified in the devicetree as the first cell here, that means the SoC DT author
must pre-select which 8 of the 43 devices are usable, right? And then the rest
would have to omit their dma properties. Wouldn't it be better to leave out the
channel number here and dynamically allocate channels at runtime?

Regards,
Samuel

> +
> +  dma-masters:
> +    maxItems: 1
> +
> +  dma-requests:
> +    const: 8
> +
> +required:
> +  - '#dma-cells'
> +  - dma-masters
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dma-router {
> +      compatible = "sophgo,cv1800-dmamux";
> +      #dma-cells = <3>;
> +      dma-masters = <&dmac>;
> +      dma-requests = <8>;
> +    };
> diff --git a/include/dt-bindings/dma/cv1800-dma.h b/include/dt-bindings/dma/cv1800-dma.h
> new file mode 100644
> index 000000000000..3ce9dac25259
> --- /dev/null
> +++ b/include/dt-bindings/dma/cv1800-dma.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +
> +#ifndef __DT_BINDINGS_DMA_CV1800_H__
> +#define __DT_BINDINGS_DMA_CV1800_H__
> +
> +#define DMA_I2S0_RX		0
> +#define DMA_I2S0_TX		1
> +#define DMA_I2S1_RX		2
> +#define DMA_I2S1_TX		3
> +#define DMA_I2S2_RX		4
> +#define DMA_I2S2_TX		5
> +#define DMA_I2S3_RX		6
> +#define DMA_I2S3_TX		7
> +#define DMA_UART0_RX		8
> +#define DMA_UART0_TX		9
> +#define DMA_UART1_RX		10
> +#define DMA_UART1_TX		11
> +#define DMA_UART2_RX		12
> +#define DMA_UART2_TX		13
> +#define DMA_UART3_RX		14
> +#define DMA_UART3_TX		15
> +#define DMA_SPI0_RX		16
> +#define DMA_SPI0_TX		17
> +#define DMA_SPI1_RX		18
> +#define DMA_SPI1_TX		19
> +#define DMA_SPI2_RX		20
> +#define DMA_SPI2_TX		21
> +#define DMA_SPI3_RX		22
> +#define DMA_SPI3_TX		23
> +#define DMA_I2C0_RX		24
> +#define DMA_I2C0_TX		25
> +#define DMA_I2C1_RX		26
> +#define DMA_I2C1_TX		27
> +#define DMA_I2C2_RX		28
> +#define DMA_I2C2_TX		29
> +#define DMA_I2C3_RX		30
> +#define DMA_I2C3_TX		31
> +#define DMA_I2C4_RX		32
> +#define DMA_I2C4_TX		33
> +#define DMA_TDM0_RX		34
> +#define DMA_TDM0_TX		35
> +#define DMA_TDM1_RX		36
> +#define DMA_AUDSRC		37
> +#define DMA_SPI_NAND		38
> +#define DMA_SPI_NOR		39
> +#define DMA_UART4_RX		40
> +#define DMA_UART4_TX		41
> +#define DMA_SPI_NOR1		42
> +
> +#define DMA_CPU_A53		0
> +#define DMA_CPU_C906_0		1
> +#define DMA_CPU_C906_1		2
> +
> +
> +#endif // __DT_BINDINGS_DMA_CV1800_H__
> --
> 2.44.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
