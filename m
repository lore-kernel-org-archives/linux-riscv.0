Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64987CA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 20:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGjYc4pJDjFJkkgftd62i+M7PppHTatEvaWfPpKSqac=; b=tw7hmSYqaLH1yH
	a0uUrFyf0gpnZfZSyubtN920jw/8EqXRYE7cujnGpI721WmzuAP6vjwKSUuad/hrOd2R7r1lVPXtt
	CLKilsPyNxsYuXLNzUhoEuXVpwC287gXv++oiTS/N0lwtsSpzm30Y5L8d+5F/DpAftFUaVDtOnCPq
	/qijWXGz+gx4RGRUupLTTRzClYie6Vz3DlF27geGwpaLcRnGPorfHPyPi3zXm/lzII6/bUrWOM+rU
	ekPROia5vOY/XRL94yZYFUWTmUtkNYDn8Y60DswpGBRnO6MRRdHcyQTWlJ7JEGjUfH4L63I2DiKix
	lfsOnx+rb2X5s9L8LByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKpk-000000013Zo-0Rzk;
	Thu, 18 Sep 2025 20:02:24 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKpi-000000013ZU-08wU
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 20:02:23 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-88762f20125so126657139f.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 13:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758225741; x=1758830541; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6x/DmZz/Njy3XkRZzK24IecqRgfFtgXHR4AlKqnaji4=;
        b=Wcmk1VbdTmqqlxt2gLfPKbx9joDZyWABhtEkJU6W/GHdbJiYeBwCvCyiBtMz5+CW6v
         Z+/twNqmchAwLXj/ihkFdYPE0oCwDw41X/DqYhiUYzK0k5lvfXwf4I1IPh2wiXY8Iuh4
         9T9+9iNJaQ4i9Ycgu2BmUB36JoHvLEY9bm1o6R1r+BFtbgE27WIscKVbkaSZDEVQbRk2
         MxM7VsCKB6Elwt3mYUa54iaz222VfNj9IOpptK0SQLzUY49Qx5pIkdhpasnksjLhMNtM
         kOmCVi46SAwcn8vt/7nTa0DW3mvCPNz201EN11ljd2tR+BgDS50rrfhhyItWPmtU6a2Q
         hYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225741; x=1758830541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6x/DmZz/Njy3XkRZzK24IecqRgfFtgXHR4AlKqnaji4=;
        b=NiahPeHkRQyRUKSQ3oF52pV2tXT8Zq2eGxfHRKd+NM6NGRPHB5GNbAZkRbrgXQJMrG
         oartAgSYRX1M6zcj82jhSie/2rHSMwr2dV7v8nAQ0MouCm1nOgvGHor7qVMArgQSrJ1v
         jN08HUIVkl6br+4eH5DLCCJaoFcvyT80Gme1AufB6qjZXYXZbMOSl9p2j0UwLagQzROg
         BknmLr6369V5OwKstTKAApiHbdNzb7l2vxuBxD2yFThhYxsE3dk1tqBNOUxtODJ5bT52
         SXeuobsJwogwRQ+Q6oqIWklFAm6L/UKkYC+wJNnRAqxHYmtQEu0fPd1X+QP4oUqqCY5Y
         ua8g==
X-Forwarded-Encrypted: i=1; AJvYcCVCZGto2yZYbRQhk56hxC/Sz6M1hukg6QjyafDGVKaWvhybEMXkcbIP2fyKc72LlRlhE95Cs2xfEse+gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFeOodhcnFyL2OUrIpjx298ygROw9OUzRsVCyudq48Eo74dgl5
	a0xjINhe1f/j4G1tb40IW+jTHXVVd4zoyt+ku+GNZ30h2JfRLFffSbFjvtiCLedT364=
X-Gm-Gg: ASbGncs7Ethjiil5oPQ6qsNg2umqZOb2qBHtmSjEXAOlqvLwRadsoGDOoxO8+3cdn1V
	3lGe1BDFILEqz8m3w0iAi28+DGgwxWBAYUscq/5CrSpGU0co/GLwRDGLZ/0QMDuSRjEJV9W573R
	mH5wx7AvgCxwLty8Nzhmd+o2QPJCYs+RIGVE/Ek1myMFAvlM/kkQike0rX4RFv3qyW1o2sxFWNF
	We7dI/O+qjvUxHtcSknNGHk4iCv8LRYbgm4dDrFKZqO1HiBmCm3D9M6atzqAQZC9zdFoGD5wjFC
	JZnx28z3ZnAcjgwgdlzFFQrgV05lqj7tNVsuUYJk7mMvMd+OXrXFNziVQB0J4vWc2BW45i4PleR
	ET+LhOrB3EXdKwxSKDjQY1pPxKBO2PjhEzJiFvNqcl7pnc5wX+b8UAqz7ODZZweAcNzVXKZZ6Jy
	D9di5f
X-Google-Smtp-Source: AGHT+IH5Ia06wxmm99cv33bY0baM2MmODAlEl3RzPF2cL4hY1LNf+MZF/EoTF1/TFOE6KV6P7E2YRw==
X-Received: by 2002:a05:6602:1693:b0:887:2a8c:9226 with SMTP id ca18e2360f4ac-8ade617c22bmr125297339f.16.1758225740767;
        Thu, 18 Sep 2025 13:02:20 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a46b2f3405sm111352939f.1.2025.09.18.13.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 13:02:19 -0700 (PDT)
Message-ID: <88623738-4279-45f3-bcbc-7a69f5c3d0d0@riscstar.com>
Date: Thu, 18 Sep 2025 15:02:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
To: Rob Herring <robh@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, broonie@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
 <20250917231520-GYA1269891@gentoo.org>
 <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
 <20250918195716.GA2521514-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918195716.GA2521514-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_130222_326530_8C679634 
X-CRM114-Status: GOOD (  21.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/18/25 2:57 PM, Rob Herring wrote:
> On Wed, Sep 17, 2025 at 06:40:31PM -0500, Alex Elder wrote:
>> On 9/17/25 6:15 PM, Yixun Lan wrote:
>>> Hi Alex,
>>>
>>> On 17:07 Wed 17 Sep     , Alex Elder wrote:
>>>> Add support for the SPI controller implemented by the SpacemiT K1 SoC.
>>>>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---
>>>>    .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
>>>>    1 file changed, 94 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>>>> new file mode 100644
>>>> index 0000000000000..5abd4fe268da9
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>>>> @@ -0,0 +1,94 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: SpacemiT K1 SoC Serial Peripheral Interface (SPI)
>>>> +
>>>> +maintainers:
>>>> +  - Alex Elder <elder@kernel.org>
>>>> +
>>>> +description:
>>>> +  The SpacemiT K1 SoC implements a SPI controller that has two 32-entry
>>>> +  FIFOs, for transmit and receive.  Details are currently available in
>>>> +  section 18.2.1 of the K1 User Manual, found in the SpacemiT Keystone
>>>> +  K1 Documentation[1].  The controller transfers words using PIO.  DMA
>>>> +  transfers are supported as well, if both TX and RX DMA channels are
>>>> +  specified,
>>>> +
>>>> +  [1] https://developer.spacemit.com/documentation
>>>> +
>>>> +allOf:
>>>> +  - $ref: /schemas/spi/spi-controller.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - spacemit,k1-spi
>>> one enum is effectively equal to const..
>>
>> OK.  That's an easy fix.
>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: Core clock
>>>> +      - description: Bus clock
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: core
>>>> +      - const: bus
>>>> +
>>>> +  resets:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  dmas:
>>>> +    items:
>>>> +      - description: RX DMA channel
>>>> +      - description: TX DMA channel
>>>> +
>>>> +  dma-names:
>>>> +    items:
>>>> +      - const: rx
>>>> +      - const: tx
>>>> +
>>>> +  spacemit,k1-ssp-id:
>>>> +    description: SPI controller number
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> could you explain a little bit why this vendor specific property should
>>> be introduced? I took a look at the code, and didn't get the reason
>>> behind.. or what's the problem of simply using "pdev->id"?
>>
>> This property was carried over from the vendor code.  It is
>> optional, and if it isn't specified, the platform device ID (-1)
>> will be used.  It's just intended to provide a well-defined ID
>> for a particular SPI controller.
>>
>>> we should really be careful to introduce vendor specific property..
>>
>> If there were a standard way of doing this I'd love to use it.
> 
> The standard way is we don't define made up device indices in DT. Well,
> except /aliases allows you to do that.

Yes, Yixun already pointed out using the aliases node to
accomplish this.

I'm still not clear why or when something like this is needed
though.  I presume it's so we can say "SPI 3 is always the one
that's exposed on the GPIO block" or something.

					-Alex



> 
> Rob


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
