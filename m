Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC5BC48BC4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 09:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9oCqAdV937GyYLjZ8uZVN4G60VVBGPzFER5l/H/tR0=; b=Ze36KLZZQx1KvA
	5g3vE2GMX3cmUTko2XEMhYCBGpKVw8mbjSXaI4lAr96vTK495o107P4vov43lBHizTRJ84X73y4RG
	VSFWtXIdi8Py11SJiNYC8cnuIzlZzvxDWWdZvKPj90pHOysWxILrYhwWkZHNF39ZR1MTTmHdpR9AS
	3zZdTnK6Qj/IYpxczWrzv7tdxJzwlhBS0BHguStPfQNtgECBEVOjyomRI94Dj4E1XQ/9fLOBiSdcf
	9CvAyTpeLHH1oc8+ZXMp1IbSGifpX0bng9tlSSh7wrCAYcQhdcj3679m8IJGeDC3tXX48r3kEqaS+
	LpoUvh67pzWSmEtdz8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbGiT-000000054g7-3cbh;
	Sat, 17 Feb 2024 09:10:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbGiS-000000054fL-0HjI
	for linux-riscv@bombadil.infradead.org;
	Sat, 17 Feb 2024 09:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=grM+Hh3OEHfgYxcKYaDIFKM2iPilg2mZqTkblEBDEPA=; b=klMcyQMe5TW16bEuucC/rLXGO2
	1xU0GUFpckmalk7XDBpI5b6w1vJ3P+A4ZhxWIz3+pcQK4TMSvOA6BEUY0iP/nc3pUpbfQOuiTQN6I
	TQSHCiIRG9LQhT4V2iBsArF0NDIXKQLXexwDPgO4Q+d5NxJztt3U3/5t6+ja2/IAdmXl36FcR49Xm
	30GCKDCg/DKUXoSzT4jYyBMlFg9tdpwrbPrgUKbZSaXcvUU5Hwd3n/rR0FcrxMVOpvrf0y/iUo/3d
	QYUtCjQp+EnI1+cmhaLTwyT5hmi1vXFwLUCaEWN0wwpohmhZZW5DifM5l1E/6DoNtc+CI68Khf5jd
	EKoANdcA==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbGiH-00000000HRH-1Ayp
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 09:10:29 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5610cc8cc1aso3002187a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 17 Feb 2024 01:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708160999; x=1708765799; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grM+Hh3OEHfgYxcKYaDIFKM2iPilg2mZqTkblEBDEPA=;
        b=hM3khYAogbvggdRKMRUO6Bj7uIvxg+UCIs2MEEqG+OCcmLQQ0pFkPSh1Wa22EIyfdr
         5cYmEAkOicmzY2wG220VRo85cFR7lxGuj30fvnuZqnrdE9A2NZkjprVw5zFBLU3/LNGX
         yTltx5GMCdsRt9GEanxSMYX61AOXBCiVTFB6qX79mazry1w4Q9BZgWWm+xXwPCt6vTH+
         EEvtrCThBmnvxfmM3HnqC7Wqn6gEv1AA5lFFlKazvsRIuDQQWNc7QX4NI81OualejLsO
         4dr9wOt6c1vIOlp54my28z2HaUEx2RLMd6yZN7vzrDIiiRd6VWQAeDCCYp9fZv/eAtop
         MKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708160999; x=1708765799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grM+Hh3OEHfgYxcKYaDIFKM2iPilg2mZqTkblEBDEPA=;
        b=ree1LjvFJjrFUcoND3Qxta9277JzVZCAJ+hPuz01OaRPigR+PZEVbv/RSw6X6RmVQv
         vAuw62D60gOgAJGGXgInc8yBC6qu+TO3bMaTSxAu4hCrYKcl2use6O3vX+T4cbPUock4
         FE3RtjcWWpglTiqFqLd44SRI2VpWUPmx2D4h/OOIug0jTemIWKUiPvxuq85XqoPNErGQ
         ZCJDbP7qwAojW1oHjBM6uN5K3hxKvlxPnAlnylbvOy0NvO1cGfnZkB04qFRGZM5K+L8w
         Fe+pZuHZt85CiUdYG86eZXLe6MjhLVTmqIF4yNoDxNvQ2qsymG4RVB9arVSVlArb+a79
         G1BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUELjTp/OqA0sBl9Xpc4gJbH48c6+uoNrfhPhS2KS9AJbPjL2slnH7L9QOMOebDAhov8Kcy5KgfMig3cVzytT3U3Mwp7uMevy/gaExIBCrA
X-Gm-Message-State: AOJu0Yzt7+B7gx2JI4EfUZRAU2eQ+GWDuKRpQ1NboFM6oDkuoB2+S/st
	4gEPbV7zw9hQX7WHCV5KKY8PyYE1XnYJCVqEFMQrGig0MlpRj9pfkf4v42a0pX4=
X-Google-Smtp-Source: AGHT+IGmCpmknfNZYAI0KiLnL6RowT6ESctrkL1vpDjJ2pzGN+enJV5oFxQ2haHvp3b/ntai7sehQw==
X-Received: by 2002:aa7:d355:0:b0:564:3231:bd09 with SMTP id m21-20020aa7d355000000b005643231bd09mr336914edr.13.1708160998689;
        Sat, 17 Feb 2024 01:09:58 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id ev24-20020a056402541800b0056163b46393sm729306edb.64.2024.02.17.01.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 01:09:58 -0800 (PST)
Message-ID: <d655b72e-3094-4b6b-bee8-9677b7c987ce@linaro.org>
Date: Sat, 17 Feb 2024 10:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] dt-bindings: cache: Add SiFive Extensible Cache
 controller
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Eric Lin <eric.lin@sifive.com>, Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20240216000837.1868917-1-samuel.holland@sifive.com>
 <20240216000837.1868917-4-samuel.holland@sifive.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240216000837.1868917-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_091027_086363_E187DC08 
X-CRM114-Status: GOOD (  10.89  )
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

On 16/02/2024 01:08, Samuel Holland wrote:
> From: Eric Lin <eric.lin@sifive.com>
> 
> Add YAML DT binding documentation for the SiFive Extensible Cache
> controller. The Extensible Cache controller interleaves cache blocks
> across a number of heterogeneous independently-programmed slices. Each
> slice contains an MMIO interface for configuration, cache maintenance,
> error reporting, and performance monitoring.
> 
> +allOf:
> +  - $ref: /schemas/cache-controller.yaml#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - sifive,extensiblecache0
> +
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sifive,extensiblecache0
> +      - const: cache
> +
> +  "#address-cells": true

const or enum: [1, 2], depending on the addressing you need here.

> +  "#size-cells": true

ditto

> +  ranges: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  cache-block-size:
> +    const: 64
> +
> +  cache-level: true

5 is acceptable? I would argue this should be even const.

> +  cache-sets: true
> +  cache-size: true

Some constraints on any of these?

> +  cache-unified: true
> +
> +patternProperties:
> +  "^cache-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: false

What is this object supposed to represent? Add description.

> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      cache-block-size:
> +        const: 64
> +
> +      cache-sets: true
> +      cache-size: true
> +      cache-unified: true

cache-level

> +
> +      sifive,bm-event-counters:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        default: 0
> +        description: Number of bucket monitor registers in this slice
> +
> +      sifive,cache-ways:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Number of ways in this slice (independent of cache size)
> +
> +      sifive,perfmon-counters:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        default: 0
> +        description: Number of PMU counter registers in this slice
> +
> +    required:
> +      - reg
> +      - cache-block-size
> +      - cache-sets
> +      - cache-size
> +      - cache-unified
> +      - sifive,cache-ways
> +
> +required:
> +  - compatible
> +  - ranges
> +  - interrupts
> +  - cache-block-size
> +  - cache-level
> +  - cache-sets
> +  - cache-size
> +  - cache-unified
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cache-controller@30040000 {
> +        compatible = "sifive,extensiblecache0", "cache";
> +        ranges = <0x30040000 0x30040000 0x10000>;
> +        interrupts = <0x4>;

You use hex as interrupt numbers on your platforms?

> +        cache-block-size = <0x40>;
> +        cache-level = <3>;
> +        cache-sets = <0x800>;

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
