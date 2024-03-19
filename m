Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71CEC54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 04:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5aHJjluBTjPsotSR6Nd7Bhv3uF6OBXTQtFvlZpN4PhI=; b=r37Okmky/HP0KL
	r2AQybANwxOaSo+ht+XGJ39VPP0X2mywQaRfuSDlCUJfnoLau0A6cRWLE2kgZY1lU6zv3gaiDz2ct
	KAR+Hfd8V7aUaBfdYCuf4hznnwxjRu8wCYSB0Bgw1IAQVwE0adtZFlcxw9RwsPMBQRBu/xlGc6Cnq
	j9x2tGAnQ2CGOhrIMU036dPQduZBG4yYZ3AYBCv/AOI7t9fIRuH+3QZYdU3OCTCj2mXwZmYd1XBne
	d/NUpQmkwcJQW+Xym9GUy55uqgv2QstXPIthbSE5EVSON8b49vdxwz8fl4ESXox4XL1NZYgaRHAAW
	aMExB0JHWAxlmK2xQovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmR4j-0000000BDDL-118H;
	Tue, 19 Mar 2024 04:27:45 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmR4f-0000000BDCU-2qaa
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 04:27:43 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-dcc73148611so5471582276.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 21:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710822460; x=1711427260; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fSeo85Yh8XHxlmyjnlgCbtVU1rId28fL57bIXUgDgo=;
        b=XScmn6gwld9yFsS/4ac6F0VXFo+Gr1+da3ww1EJRiz4qMqoSJEyGAxqVqDcfuu6Epg
         HAfbhSPVTiVk2k1hAkQtdGAow0V/6PA2HOYs6fSqPomtfIHksi7Ig6FIhtYa7K2lfzMh
         +derj9BTYOCejqQsq2IcdUfhpFFrqUoYKeDw4vLcIQt62Ekra5ueq84MtEf7qv75/dMu
         XrbhReh+uOZPNtTVV9VhRbsZuwVqJ5npi1c5kc2ahXBP72Gl4mWZSSYCns4ROBsfAf48
         JS0zEarD6c4lbAWgrdpZIbE5ofncxg+4KnQ4oEWx6yIfqJ3GVzqG49yTeS+iNGhgZDga
         Nagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710822460; x=1711427260;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fSeo85Yh8XHxlmyjnlgCbtVU1rId28fL57bIXUgDgo=;
        b=JA6UlouaZivG93Hvk9LQX9/pKXRwnwd8UgS02OqOy6Id/wjPI0+K8jySGNX/Cp8wox
         p7IEYyaipXyIt6gzcWd+SJRCzqTUrDCR6mmLsCpR62c9fiXhvZuTnw7xfBQnJNgeQkzQ
         OtZsUU2Yz3YJzj5zo/eqRJAUGfI+kLfxNZnijnL91aYZB2NY4lWZjMD/qKgeO31j7/Zv
         tLR/jyJzptCZ1vR4HKNN9sdNmr6GOHOHM5kFF6Blpqs+6HA67gSgWBGyGCkRjo6xlgSZ
         L+16JpaxK0z123SWo0ThbWGBaz4SkdfgMlgwfAhpzc9popfi5ymZn0yXjRmebPog7qud
         NHLA==
X-Forwarded-Encrypted: i=1; AJvYcCWOjeWCGOn3uPORhvMWCxRyBD60ExFjncpOpM7vHT0GgP9zsUUJi7CbaR1vOgBVM+ruiYpncJBlEDXvqDIrzMBULeVE5M5U+55mRG1IMKDm
X-Gm-Message-State: AOJu0YztcUMeFhX9zl8NfUHBX2QEVrT22uFUNpfKA3UIG+QoGv+n/WWt
	HiKKLkmNe1XI39KG7SNPQkLQtC6IdvGwcUtuCIqqzz4b7SoSkHvrZqM7D5fRpTU=
X-Google-Smtp-Source: AGHT+IHgaLA2b2A4WmPe+4Rv2P3Jrxx3QjSR6PArx5q5wlgmR/45U+DUfpoQCzkEkaNfhEua0UrDTA==
X-Received: by 2002:a25:db85:0:b0:dc6:238e:d766 with SMTP id g127-20020a25db85000000b00dc6238ed766mr13124502ybf.2.1710822460000;
        Mon, 18 Mar 2024 21:27:40 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id w12-20020a02968c000000b004743bc59379sm2659823jai.59.2024.03.18.21.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 21:27:39 -0700 (PDT)
Message-ID: <b4863d37-2182-479d-8ca2-79951badfb8d@sifive.com>
Date: Mon, 18 Mar 2024 23:27:37 -0500
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
 <29f468c5-1aaa-4326-8088-e03a1d6b7174@sifive.com>
 <IA1PR20MB495363835DD4C6B0EA2DA224BB2C2@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <IA1PR20MB495363835DD4C6B0EA2DA224BB2C2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_212741_933827_B71EFCB3 
X-CRM114-Status: GOOD (  29.72  )
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

Hi Inochi,

On 2024-03-18 11:03 PM, Inochi Amaoto wrote:
> On Mon, Mar 18, 2024 at 10:22:47PM -0500, Samuel Holland wrote:
>> On 2024-03-18 1:38 AM, Inochi Amaoto wrote:
>>> The DMA IP of Sophgo CV18XX/SG200X is based on a DW AXI CORE, with
>>> an additional channel remap register located in the top system control
>>> area. The DMA channel is exclusive to each core.
>>>
>>> Add the dmamux binding for CV18XX/SG200X series SoC
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> ---
>>>  .../bindings/dma/sophgo,cv1800-dmamux.yaml    | 47 ++++++++++++++++
>>>  include/dt-bindings/dma/cv1800-dma.h          | 55 +++++++++++++++++++
>>>  2 files changed, 102 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml
>>>  create mode 100644 include/dt-bindings/dma/cv1800-dma.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml b/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml
>>> new file mode 100644
>>> index 000000000000..c813c66737ba
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml
>>> @@ -0,0 +1,47 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Sophgo CV1800/SG200 Series DMA mux
>>> +
>>> +maintainers:
>>> +  - Inochi Amaoto <inochiama@outlook.com>
>>> +
>>> +allOf:
>>> +  - $ref: dma-router.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: sophgo,cv1800-dmamux
>>> +
>>> +  reg:
>>> +    maxItems: 2
>>> +
>>> +  '#dma-cells':
>>> +    const: 3
>>> +    description:
>>> +      The first cells is DMA channel. The second one is device id.
>>> +      The third one is the cpu id.
>>
>> There are 43 devices, but only 8 channels. Since the channel is statically
>> specified in the devicetree as the first cell here, that means the SoC DT author
>> must pre-select which 8 of the 43 devices are usable, right? 
> 
> Yes, you are right.
> 
>> And then the rest
>> would have to omit their dma properties. Wouldn't it be better to leave out the
>> channel number here and dynamically allocate channels at runtime?
>>
> 
> You mean defining all the dma channel in the device and allocation channel
> selectively? This is workable, but it still needs a hint to allocate channel.

I mean allocating hardware channels only when a channel is requested by a client
driver. The dmamux driver could maintain a counter and allocate the channels
sequentially -- then the first 8 calls to cv1800_dmamux_route_allocate() would
succeed and later calls from other devices would fail.

> Also, according to the information from sophgo, it does not support dynamic 
> channel allocation, so all channel can only be initialize once.

That's important to know. In that case, the driver should probably leave the
registers alone in cv1800_dmamux_free(), and then scan to see if a device is
already mapped to a channel before allocating a new one. (Or it should have some
other way of remembering the mapping.) That way a single client can repeatedly
allocate/free its DMA channel without consuming all of the hardware channels.

> There is another problem, since we defined all the dmas property in the device,
> How to mask the devices if we do not want to use dma on them? I have see SPI
> device will disable DMA when allocation failed, I guess this is this mechanism
> is the same for all devices?

I2C/SPI/UART controller drivers generally still work after failing to acquire a
DMA channel. For audio-related drivers, DMA is generally a hard dependency.

If each board has 8 or fewer DMA-capable devices enabled in its DT, there is no
problem. If some board enables more than 8 DMA-capable devices, then it should
use "/delete-property/ dmas;" on the devices that would be least impacted by
missing DMA. Otherwise, which devices get functional DMA depends on driver probe
order.

Normally you wouldn't need to do "/delete-property/ dmas;", because many drivers
only request the DMA channel when actively being used (e.g. userspace has the
TTY/spidev/ALSA device file open), but this doesn't help if you can only assign
each channel once.

Regards,
Samuel

>>> +
>>> +  dma-masters:
>>> +    maxItems: 1
>>> +
>>> +  dma-requests:
>>> +    const: 8
>>> +
>>> +required:
>>> +  - '#dma-cells'
>>> +  - dma-masters
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    dma-router {
>>> +      compatible = "sophgo,cv1800-dmamux";
>>> +      #dma-cells = <3>;
>>> +      dma-masters = <&dmac>;
>>> +      dma-requests = <8>;
>>> +    };
>>> diff --git a/include/dt-bindings/dma/cv1800-dma.h b/include/dt-bindings/dma/cv1800-dma.h
>>> new file mode 100644
>>> index 000000000000..3ce9dac25259
>>> --- /dev/null
>>> +++ b/include/dt-bindings/dma/cv1800-dma.h
>>> @@ -0,0 +1,55 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>>> +
>>> +#ifndef __DT_BINDINGS_DMA_CV1800_H__
>>> +#define __DT_BINDINGS_DMA_CV1800_H__
>>> +
>>> +#define DMA_I2S0_RX		0
>>> +#define DMA_I2S0_TX		1
>>> +#define DMA_I2S1_RX		2
>>> +#define DMA_I2S1_TX		3
>>> +#define DMA_I2S2_RX		4
>>> +#define DMA_I2S2_TX		5
>>> +#define DMA_I2S3_RX		6
>>> +#define DMA_I2S3_TX		7
>>> +#define DMA_UART0_RX		8
>>> +#define DMA_UART0_TX		9
>>> +#define DMA_UART1_RX		10
>>> +#define DMA_UART1_TX		11
>>> +#define DMA_UART2_RX		12
>>> +#define DMA_UART2_TX		13
>>> +#define DMA_UART3_RX		14
>>> +#define DMA_UART3_TX		15
>>> +#define DMA_SPI0_RX		16
>>> +#define DMA_SPI0_TX		17
>>> +#define DMA_SPI1_RX		18
>>> +#define DMA_SPI1_TX		19
>>> +#define DMA_SPI2_RX		20
>>> +#define DMA_SPI2_TX		21
>>> +#define DMA_SPI3_RX		22
>>> +#define DMA_SPI3_TX		23
>>> +#define DMA_I2C0_RX		24
>>> +#define DMA_I2C0_TX		25
>>> +#define DMA_I2C1_RX		26
>>> +#define DMA_I2C1_TX		27
>>> +#define DMA_I2C2_RX		28
>>> +#define DMA_I2C2_TX		29
>>> +#define DMA_I2C3_RX		30
>>> +#define DMA_I2C3_TX		31
>>> +#define DMA_I2C4_RX		32
>>> +#define DMA_I2C4_TX		33
>>> +#define DMA_TDM0_RX		34
>>> +#define DMA_TDM0_TX		35
>>> +#define DMA_TDM1_RX		36
>>> +#define DMA_AUDSRC		37
>>> +#define DMA_SPI_NAND		38
>>> +#define DMA_SPI_NOR		39
>>> +#define DMA_UART4_RX		40
>>> +#define DMA_UART4_TX		41
>>> +#define DMA_SPI_NOR1		42
>>> +
>>> +#define DMA_CPU_A53		0
>>> +#define DMA_CPU_C906_0		1
>>> +#define DMA_CPU_C906_1		2
>>> +
>>> +
>>> +#endif // __DT_BINDINGS_DMA_CV1800_H__
>>> --
>>> 2.44.0
>>>
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
