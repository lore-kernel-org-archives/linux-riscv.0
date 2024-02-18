Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1ABC48BC4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Os/3bTkW9ecLrK6GokIhdfgBJ0Wl2RSggtOrqi6WE+I=; b=oLarpmsv4LA3Bp
	UWVnBKzFy084/mYzIA8g5jnmkgtcJDGG4hJKrBBG6/VHgUN3j5uH6zb5Q4bFYBQyUf2Q9bh1O1SgH
	aQtz1Gw/6JZ4t1Zax40/sQp/al90+Wn33WdwPOZEfd5S+HhDotflkLZGsrmBbCfbGn03EF7f6KB5T
	FTBx7xdy9dHcsuVWuM+cVvtv4I/SbJ/VntJXS/VBWxTewoyZIjYi9saeFCFX57jaSFbf2exgkE96b
	gzJmkUvlhRWTRNyAjwOxj+llYJftPG9Wx1mOJ5nJMe1BT1NI/FAjscE1dPUt83m63aWt5b/qCxv09
	VaSNoQ3UoQtKbalkTiwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbjRg-00000007z22-3Z5I;
	Sun, 18 Feb 2024 15:51:12 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbjRZ-00000007z0v-471j
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 15:51:10 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3c15bef14c3so11778b6e.2
        for <linux-riscv@lists.infradead.org>; Sun, 18 Feb 2024 07:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708271461; x=1708876261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Idc8kDtuOgl4UHmKMS/zN8wguVju2Qvv8mSJbJg11b8=;
        b=aVQ7uPAIQexSaDzUK/7xNOazvZfFm98vYMMSE/pLNQ+Vs5usph/sp4oPGKNikV9KVJ
         XO0gUIJ0naRVC2o9QA7OthdNsVx/WZblRRR1xGjntj16dgenvMb8CzbTDUKHDd89hXE3
         kKsj7Fdg5TyFSKJS+Y0rufXlROUQrnrHCg1QMu2/RO7oKBKI/ObeSHDEwMf2V2BI4EQx
         zhKHHfStWFyg61HiKNboHpRBWDEXTk13sqw1Pr7BYzOmoffivCfdLyDe1Q9CQal4edIJ
         G6Nu4M3z1Mv8hZVL/O/l77wdu4UzvUsCl+8siqk6bPgAt9kixmhxfAK5c+OuZg03pzK3
         cfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708271461; x=1708876261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Idc8kDtuOgl4UHmKMS/zN8wguVju2Qvv8mSJbJg11b8=;
        b=HK6kdBwqF9GWxrw3Gs1GkTFn6mbpg9BFOBK0eiFKNdaSaRoVvs69xQhRk5Sot3AGja
         xTsv28WekpjZCfALjoBi+1wkON7uHdMiSL1+eCgQyLT8UudrHSQcoHQvIaNgeDNBaAF2
         Oh+6/aLQubdrEDqBlGiLquwf2f8MxlyT8dYult2h/ReOn4idE3auP4WMOeJqtq2Rd/f5
         nGSmJNaOoP2PAEL780GdjSyZKzoos0BQkhjZjwrOFkb4TRruzCCjrytXUJ9a6aFpMrW/
         THtPrWUHUV5A+Z6uNB0BpJYhk8GQBtshxOcP9D1G7IyZmw8sgTKY9JYoR8AOoRLaAVuc
         QqLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRfCK5ncq5qrAZB2XrmDhAaFYiNRkDuodxooDqfNCspcac77SmFPP0lSAZN4aH9CIx1gv5S9FXE7aHUUYNc+hjHY/F55cZiMsAm0maWCpC
X-Gm-Message-State: AOJu0Yx6tWQTw3YY0kinPQZLJBaaFckOUk8txBYm4pupj95hhbi2L7FQ
	kDpJFt2cVVC0BqoHXMYq2dhRUymOwMrf6CV2LMaKoZS7UxQyWbxP+n/+TdE8VUM=
X-Google-Smtp-Source: AGHT+IGjRnlgLzgomv6lW4SHDhuTS8wreb750yO93dETmAN5zA0BYgY7Hc8/Ofnz0yFKKnfSR5f2mQ==
X-Received: by 2002:a05:6808:2f17:b0:3c0:39ed:4384 with SMTP id gu23-20020a0568082f1700b003c039ed4384mr14131122oib.20.1708271461437;
        Sun, 18 Feb 2024 07:51:01 -0800 (PST)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id kr19-20020a0562142b9300b0068f5565ba1asm1262117qvb.88.2024.02.18.07.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 07:51:01 -0800 (PST)
Message-ID: <3c2f1c61-89b4-4103-ac45-a2a541de215e@sifive.com>
Date: Sun, 18 Feb 2024 09:50:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] dt-bindings: cache: Add SiFive Extensible Cache
 controller
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Eric Lin <eric.lin@sifive.com>, Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20240216000837.1868917-1-samuel.holland@sifive.com>
 <20240216000837.1868917-4-samuel.holland@sifive.com>
 <d655b72e-3094-4b6b-bee8-9677b7c987ce@linaro.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <d655b72e-3094-4b6b-bee8-9677b7c987ce@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_075106_086129_B26063C4 
X-CRM114-Status: GOOD (  15.46  )
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

Hi Krzysztof,

On 2024-02-17 3:09 AM, Krzysztof Kozlowski wrote:
> On 16/02/2024 01:08, Samuel Holland wrote:
>> From: Eric Lin <eric.lin@sifive.com>
>>
>> Add YAML DT binding documentation for the SiFive Extensible Cache
>> controller. The Extensible Cache controller interleaves cache blocks
>> across a number of heterogeneous independently-programmed slices. Each
>> slice contains an MMIO interface for configuration, cache maintenance,
>> error reporting, and performance monitoring.
>>
>> +allOf:
>> +  - $ref: /schemas/cache-controller.yaml#
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - sifive,extensiblecache0
>> +
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: sifive,extensiblecache0
>> +      - const: cache
>> +
>> +  "#address-cells": true
> 
> const or enum: [1, 2], depending on the addressing you need here.
> 
>> +  "#size-cells": true
> 
> ditto
> 
>> +  ranges: true
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  cache-block-size:
>> +    const: 64
>> +
>> +  cache-level: true
> 
> 5 is acceptable? I would argue this should be even const.
> 
>> +  cache-sets: true
>> +  cache-size: true
> 
> Some constraints on any of these?

Thanks for the feedback. I will add the various constraints in v2, though some
constraints will be somewhat loose as the topology is highly configurable.

>> +  cache-unified: true
>> +
>> +patternProperties:
>> +  "^cache-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: false
> 
> What is this object supposed to represent? Add description.

I will add a description in v2.

This object represents a single slice of the cache. Requests from clients are
interleaved between cache slices depending on the client, the address, etc.

Since there is no strong relationship between client (i.e. CPU) and cache slice,
the next-level-cache property must point to the top-level EC node, not a slice.

>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +
>> +      cache-block-size:
>> +        const: 64
>> +
>> +      cache-sets: true
>> +      cache-size: true
>> +      cache-unified: true
> 
> cache-level

I will add this in v2. It seemed redundant since the value cannot differ between
slices.

Regards,
Samuel

>> +
>> +      sifive,bm-event-counters:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        default: 0
>> +        description: Number of bucket monitor registers in this slice
>> +
>> +      sifive,cache-ways:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: Number of ways in this slice (independent of cache size)
>> +
>> +      sifive,perfmon-counters:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        default: 0
>> +        description: Number of PMU counter registers in this slice
>> +
>> +    required:
>> +      - reg
>> +      - cache-block-size
>> +      - cache-sets
>> +      - cache-size
>> +      - cache-unified
>> +      - sifive,cache-ways
>> +
>> +required:
>> +  - compatible
>> +  - ranges
>> +  - interrupts
>> +  - cache-block-size
>> +  - cache-level
>> +  - cache-sets
>> +  - cache-size
>> +  - cache-unified
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    cache-controller@30040000 {
>> +        compatible = "sifive,extensiblecache0", "cache";
>> +        ranges = <0x30040000 0x30040000 0x10000>;
>> +        interrupts = <0x4>;
> 
> You use hex as interrupt numbers on your platforms?
> 
>> +        cache-block-size = <0x40>;
>> +        cache-level = <3>;
>> +        cache-sets = <0x800>;
> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
