Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD59CAC59F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 23:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCXuEudR1JLjpcHrvHr8sK8aGQFPAQR0+h43VqKdsQ4=; b=cU9X84sOOOEtyG
	tTWVsqRHXXKwv6WGAv+lIUSLZ8htDEX0Oiiv6kE3HZzEY61dc32zTwodPjUVU545FZ2ymE5zxLoJd
	oAbpVWjA8J2JEBpblACNPvnAJmKdkt95LZmm4DdHPiDX9dvVoxpu4dCZ8uSM6G+D41mBQOwHZYO8/
	tSPnar/uRnI4ju+PsiVkpE+KP+X6JQLoRnc9SluuoNYoYA+dg0RhdvpN8CyOfAkr4U4SULGbIIQGv
	mw5w92BjX/uGyEQUQ395wq4hbRP7O4Uqwzr1I+zkI07tCqVYsV9O5dKST16QrppA+BWCNUdeVo5ta
	Jz2z1M8NH7IwQHPZ3u8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz1lN-0000000Faxu-0wvB;
	Wed, 17 Sep 2025 23:40:37 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz1lK-0000000FawT-27lK
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 23:40:36 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-889b846c314so11913739f.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 16:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758152433; x=1758757233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4LnKnBe0mUrdxdcBF4M/llb4IeQlPfA2whttLuEB5Q=;
        b=X/1kMhwF29zPr8Dvj6/zryj+UjNh8BYukAFuWnAodVTCZ2UazeCRNhoYVcpsMKMlzh
         2OFwlQIyNqj+u/oRWpfAcfbAJJZQIqaMMy1qIQcDwYX6EnNbe3pqMBmqNjBgs1bQW5GL
         xHbYITLqvL6PtkrVWksGMB5sPUsw3AjVBnc4KS37V3MKWrWUTzTZi3thOyZB7oTo/jN8
         MwaVOmjL+xIzcx/0dlHrHULENuH717nPhETgp9pFaWc+uJcRQuV8afQbE6ZCznAAGPEW
         vAs/7cWM/OS0VbAcWOf3gB0CIhbJkHOQuFTP2WAcSXirJKGNdo1n7XFaFIIA+La30PoJ
         PU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758152433; x=1758757233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4LnKnBe0mUrdxdcBF4M/llb4IeQlPfA2whttLuEB5Q=;
        b=fnx4acAQpe7XxOLLV5qtiywFUPktAxSL+20zBuELXc0hBfbctuDOD8fcOIvBi80kfo
         Rz2NoZL7iFrdRWNntbePfAosxumQ26IQXV0XGLbt+VUMbYZE2qHSdJJBuDe+nM4+ghPv
         cLS2MKkWNARh8Edf6vQ0jeNhWRav6SujxJJLpUJxNnOQ2CErP9OS7m5q9UimVy7Fy970
         pC8tTOmORGw/YKzZ5nmjohc+Wo3QP2MWhNWnyljfXXXoV7qAycV4IA01D/bNSd0DlYyo
         ewfd2Hj0yUFJzwzSGaApbz/jUXOfp253l0ETG99mcy8kXUshi/QlofH7HA7JwnnKVZxN
         Kplw==
X-Forwarded-Encrypted: i=1; AJvYcCUwTdiNl+Sv1ETsPO8SDTEALLuA7EAPP9upOwIy0NBCkYUUZhmgi11HiMgqWayi6vGdC3d8JesbB8E1Xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiyFND8jM/NzG8s/Slzji9FCEl229eWcdE+WcA+9fNhZH/07YO
	uq+UsZxCpsBumst3t6lVJv+6KcdMitLkmOsVyjd8ndI8LVJj7MHkIAKQcADYUy4HELr7wV4Vrlv
	OAFG2
X-Gm-Gg: ASbGncvf6ZaG+1F3Eg6nHT4hWTilmegdRGRlwE43ORu3cevxjd6vyfZQ84WeajYkIzK
	4U4h4G0uP1XG8gMMoIYN7O+X0/ADXi/dmeRTDjJG103OhwT2C5kN3bSW6uCFWgnMteDsDwf+pbm
	5bGhDNH1OU4j6KdCmv1a/cyX9hkQPXpbFodKepUDfR4h6Knotrg2Ywom0C+dew/uwTXqzFnkKAs
	okDcbggL/8M+vFRsZT/lZJKYJByObdYwkE5QMFopJxvtFEwt2rPS6HqN5XfEPVfwRSYXiTKqIqs
	7J/crnzinVCdNlj5pO4An/UGlHljuim1YzUgtOYRmnjBr0rubkKHDKedLIg+p5mb5eDaA/Kue0/
	cqar0SXDxAZY5w+6MuhMRJpeSlBsvGPOoANwPWZDGelxOwCOIZAbNAQ==
X-Google-Smtp-Source: AGHT+IFIMlPua7p/TY9YMSKjXsZOBX/5j6z1IJQ7nS5dT8sO4hABWq+/kl4R3zdjJi/vT1pYQ+i8NA==
X-Received: by 2002:a05:6602:6c10:b0:86d:9ec7:267e with SMTP id ca18e2360f4ac-89d1a7c97eamr718446339f.4.1758152433403;
        Wed, 17 Sep 2025 16:40:33 -0700 (PDT)
Received: from [10.211.55.5] ([131.212.251.230])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a46fea3353sm31238739f.12.2025.09.17.16.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 16:40:32 -0700 (PDT)
Message-ID: <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
Date: Wed, 17 Sep 2025 18:40:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
 <20250917231520-GYA1269891@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250917231520-GYA1269891@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_164034_798254_C26DD66E 
X-CRM114-Status: GOOD (  22.29  )
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

On 9/17/25 6:15 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 17:07 Wed 17 Sep     , Alex Elder wrote:
>> Add support for the SPI controller implemented by the SpacemiT K1 SoC.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
>>   1 file changed, 94 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>> new file mode 100644
>> index 0000000000000..5abd4fe268da9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>> @@ -0,0 +1,94 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SpacemiT K1 SoC Serial Peripheral Interface (SPI)
>> +
>> +maintainers:
>> +  - Alex Elder <elder@kernel.org>
>> +
>> +description:
>> +  The SpacemiT K1 SoC implements a SPI controller that has two 32-entry
>> +  FIFOs, for transmit and receive.  Details are currently available in
>> +  section 18.2.1 of the K1 User Manual, found in the SpacemiT Keystone
>> +  K1 Documentation[1].  The controller transfers words using PIO.  DMA
>> +  transfers are supported as well, if both TX and RX DMA channels are
>> +  specified,
>> +
>> +  [1] https://developer.spacemit.com/documentation
>> +
>> +allOf:
>> +  - $ref: /schemas/spi/spi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - spacemit,k1-spi
> one enum is effectively equal to const..

OK.  That's an easy fix.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Core clock
>> +      - description: Bus clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: bus
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  dmas:
>> +    items:
>> +      - description: RX DMA channel
>> +      - description: TX DMA channel
>> +
>> +  dma-names:
>> +    items:
>> +      - const: rx
>> +      - const: tx
>> +
>> +  spacemit,k1-ssp-id:
>> +    description: SPI controller number
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> could you explain a little bit why this vendor specific property should
> be introduced? I took a look at the code, and didn't get the reason
> behind.. or what's the problem of simply using "pdev->id"?

This property was carried over from the vendor code.  It is
optional, and if it isn't specified, the platform device ID (-1)
will be used.  It's just intended to provide a well-defined ID
for a particular SPI controller.

> we should really be careful to introduce vendor specific property..

If there were a standard way of doing this I'd love to use it.

And if it isn't necessary, please just explain to me why.  I
have no problem removing it.

>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - interrupts
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +
>> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
>> +    spi3: spi@d401c000 {
> label not needed for DT example

OK.

>> +        compatible = "spacemit,k1-spi";
>> +        reg = <0xd401c000 0x30>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        clocks = <&syscon_apbc CLK_SSP3>,
>> +                 <&syscon_apbc CLK_SSP3_BUS>;
>> +        clock-names = "core",
>> +                      "bus";
>> +        resets = <&syscon_apbc RESET_SSP3>;
>> +        interrupts-extended = <&plic 55>;
>> +        spacemit,k1-ssp-id = <3>;
>> +        dmas = <&pdma 20>,
>> +               <&pdma 19>;
>> +        dma-names = "rx",
>> +                    "tx";
> ..
>> +        status = "disabled";
> ditto, drop it

OK.  Thanks a lot for your quick review.  I'll wait a bit
(probably until Monday) before I send an update.

					-Alex

>> +    };
>> -- 
>> 2.48.1
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
