Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87D4ECAA24
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 18:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFJdvYTysd4iPMBB6XFh7mOOJlWHr5lDI7iHiqLNeJI=; b=1z/Lo+J3dLz6rk
	Wod8QgLvEAgpSjhHVji4vMxADyM+yYhHt/KwgOunyBWMurSSqy3MWiYQb6dnTgg8VnsBy1+mlf6Bu
	E3Yv8XMOhYxqg5H7EeuHxbTq1O7Ee7rlU1GueTgBQjSu814tahBBBaD+oBXZSw5mc0cdhwzb+/Dpx
	mjICKvoIctiNHytMfyxyu+G8W6u4hBs0DAjnwu06Qd0hcXRizqpSf6Qqma8xwXzAzxlDEVQmxFFRj
	JoW6KRw058OrgvSgt/KFqTVue8yy9l2ZyU4nRhqkqz1YH3Ef5LFSmdkaY/NPQbYBNivnGXCKnekwO
	kzdfD3xNlbYBb+dc1CFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHj0-00183g-Ct; Thu, 25 Aug 2022 18:37:06 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHiw-0017Xf-JT
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 18:37:04 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C7F803FDE0
	for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 18:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1661452612;
	bh=dpAjbusN9yBD9N/QzCXa1x041iuJNs+syZnqbC+IIao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=EYEce1S2Xh3NG/f2iXGbPdH8B4uD7mjMdTGZUsDiDutNBXrgG8IjFhNyIhcmBfqKH
	 yzb7BSacwLRwP8MYq80ru5deh3tmWvzc7OhJma2+c8L0YPeCkKf2147DdL8/VkergO
	 8hHff57XoRIrGUuDCKP0xeQQ5xDmMilQekI4ICJrz8ex88CkO9NxT+DRinQZBO1OPz
	 azOl+7LEXDbo2RZPip9O77ofUSgPa//ldR0BS7G2PV0TwATtDzZ8ZTwNzitrdCvOpV
	 2CMdc9Z8oBFy39xXV1tlBZepMBdQ3kcY2oll2CBiXAekwEoL5MWT6Wm0VBnmbBUrM7
	 LQdLtat3GvoXg==
Received: by mail-wr1-f70.google.com with SMTP id d1-20020adfa341000000b0022571fbdfe2so1169097wrb.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 11:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=dpAjbusN9yBD9N/QzCXa1x041iuJNs+syZnqbC+IIao=;
        b=aCpTlkCRtKlrEFxaW4B28RLc00ntbvPiWF2EPf0yfIuQDJg1t9L/8hc8HQQLVTya60
         9v35dhLeA2/1hplpEi3WOuPNGPfiNeqzg0zpJtxYpc/enHvqYg6Mdq3+DlVGiARUJKK/
         3CDttFgPyd/QGhm0km6o0G00b+0m0gtvld6p4773u0qtjxLTYm13cI8uDtKwe7OmxdfD
         Ek4xkwsBYgAVtFqt1Hcmy5mkXvFzjAjDVkpUvcmDa9elDLut0GGDBvx9Nh9M8Unl9sBY
         TaZQgTeGExbn3Cu5cAt2KsCadOe1Nr/SteFKfrOkZT51gF+9iQ9j+Y81XnpXJIyNUTuw
         t1Og==
X-Gm-Message-State: ACgBeo0XBmO3NcAGl7iNNwDYjbjkbhgslmQrYiohhsUhzjSfrFm3AHvB
	jt9oTvcymIOB8aQs070J8S1FvWVq5veTUziuPiEbTYb/rbot00f2maoP9xU1DQ7cOZoAh8AU0W6
	XJfMj/NvaYoiCAalurwjrN/uDHYaqpEtE1MoxA6giZ1y1Gw==
X-Received: by 2002:a05:600c:3d0f:b0:3a5:eece:c061 with SMTP id bh15-20020a05600c3d0f00b003a5eecec061mr3126672wmb.74.1661452612259;
        Thu, 25 Aug 2022 11:36:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4LuVbPZRwE3Kvu/sLxz4WiXDcnE8lKeB5AJKOBKdr9/2gXIomWNDt5/HMCk1Ye4DwHolXA3w==
X-Received: by 2002:a05:600c:3d0f:b0:3a5:eece:c061 with SMTP id bh15-20020a05600c3d0f00b003a5eecec061mr3126655wmb.74.1661452611922;
        Thu, 25 Aug 2022 11:36:51 -0700 (PDT)
Received: from [192.168.123.94] (ip-084-118-157-002.um23.pools.vodafone-ip.de. [84.118.157.2])
        by smtp.gmail.com with ESMTPSA id k5-20020a05600c1c8500b003a5f3de6fddsm6392341wms.25.2022.08.25.11.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 11:36:51 -0700 (PDT)
Message-ID: <5f00ab85-d5ac-728d-2157-e70f2a46cc90@canonical.com>
Date: Thu, 25 Aug 2022 20:36:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/2] dt-bindings: riscv: sifive-l2: add a PolarFire SoC
 compatible
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Sagar Kadam <sagar.kadam@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <mail@conchuod.ie>
References: <20220825180417.1259360-1-mail@conchuod.ie>
 <20220825180417.1259360-2-mail@conchuod.ie>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220825180417.1259360-2-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_113703_112062_5BB6CFF1 
X-CRM114-Status: GOOD (  20.87  )
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

On 8/25/22 20:04, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The l2 cache on PolarFire SoC is cross between that of the fu540 and
> the fu740. It has the extra interrupt from the fu740 but the lower
> number of cache-sets. Add a specific compatible to avoid the likes
> of:
> 
> mpfs-polarberry.dtb: cache-controller@2010000: interrupts: [[1], [3], [4], [2]] is too long

Where is such a message written? I couldn't find the string in 
next-20220825 (git grep -n 'is too long"').

Why should a different number of cache sets require an extra compatible 
string. cache-size is simply a parameter going with the existing 
compatible strings.

I would assume that you only need an extra compatible string if there is 
a functional difference that can not be expressed with the existing 
parameters.

> 
> Fixes: 34fc9cc3aebe ("riscv: dts: microchip: correct L2 cache interrupts")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   .../bindings/riscv/sifive-l2-cache.yaml       | 79 ++++++++++++-------
>   1 file changed, 49 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> index 69cdab18d629..ca3b9be58058 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> @@ -17,9 +17,6 @@ description:
>     acts as directory-based coherency manager.
>     All the properties in ePAPR/DeviceTree specification applies for this platform.
>   
> -allOf:
> -  - $ref: /schemas/cache-controller.yaml#
> -
>   select:
>     properties:
>       compatible:
> @@ -33,11 +30,16 @@ select:
>   
>   properties:
>     compatible:
> -    items:
> -      - enum:
> -          - sifive,fu540-c000-ccache
> -          - sifive,fu740-c000-ccache

Why can't you simply add microchip,mpfs-ccache here?

> -      - const: cache
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sifive,fu540-c000-ccache
> +              - sifive,fu740-c000-ccache
> +          - const: cache
> +      - items:
> +          - const: microchip,mpfs-ccache
> +          - const: sifive,fu540-c000-ccache

Why do we need 'sifive,fu540-c000-ccache' twice?

Best regards

Heinrich

> +          - const: cache
>   
>     cache-block-size:
>       const: 64
> @@ -72,29 +74,46 @@ properties:
>         The reference to the reserved-memory for the L2 Loosely Integrated Memory region.
>         The reserved memory node should be defined as per the bindings in reserved-memory.txt.
>   
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: sifive,fu540-c000-ccache
> +allOf:
> +  - $ref: /schemas/cache-controller.yaml#
>   
> -then:
> -  properties:
> -    interrupts:
> -      description: |
> -        Must contain entries for DirError, DataError and DataFail signals.
> -      maxItems: 3
> -    cache-sets:
> -      const: 1024
> -
> -else:
> -  properties:
> -    interrupts:
> -      description: |
> -        Must contain entries for DirError, DataError, DataFail, DirFail signals.
> -      minItems: 4
> -    cache-sets:
> -      const: 2048
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - sifive,fu740-c000-ccache
> +              - microchip,mpfs-ccache
> +
> +    then:
> +      properties:
> +        interrupts:
> +          description: |
> +            Must contain entries for DirError, DataError, DataFail, DirFail signals.
> +          minItems: 4
> +
> +    else:
> +      properties:
> +        interrupts:
> +          description: |
> +            Must contain entries for DirError, DataError and DataFail signals.
> +          maxItems: 3
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sifive,fu740-c000-ccache
> +
> +    then:
> +      properties:
> +        cache-sets:
> +          const: 2048
> +
> +    else:
> +      properties:
> +        cache-sets:
> +          const: 1024
>   
>   additionalProperties: false
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
