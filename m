Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ECEC61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3jNaUDPO1LjWPGvE7EzSJJMXWYtu9aHOQ4TwkiGQHA=; b=PaRnrBGa7RnbqB
	Q2w95m28dy1rNOwNInq+QrHDdvcn3tJHTblzrbFGQ52ZZMmRlhgTAdv59KKS5tlRWsZseBQSVBrsN
	yrMVuabC7SWlNyqJb/e1gcezqL/HqGy8S60Yy+WlwKUlv9U9og7PUHAvUrcozQyQQuVusB5KslMAl
	cLLN8CSgBt7Ol4Sthgkj3WsVu+2t6VGCvBRjPrKUj7ILtQd3YTZCgRBe+mz+rRGlWySPb8ihc6zTB
	olT3L5Qmu6efUH1n0fTt9Ae75PZuMgEd5/G/zP3qbQd/Dx1vfikIBT0uBzZIaCuntrU08NrWB4gZo
	a2mAutgW+Zt4Zlyj3L1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVY0x-002bgR-Hl; Fri, 24 Feb 2023 13:21:31 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVY0u-002bfQ-79
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 13:21:29 +0000
Received: by mail-ed1-x531.google.com with SMTP id ee7so39603535edb.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 05:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZyflOORFuzAU5BULEoWaY0vuPe5ZUd6mweprOBGP7n4=;
        b=eEGf8AL+6iX6ix7igIArls0uX4woeA0Icw/G+F3GhaIH0WKf1pteL+EEp/5D5voScK
         QXJSbogrGgJb059hs7A0Dv7UMrG9AIajzfIAwo4bfpy8M0TiF8bv00PhDa9H0zxJgSEb
         520bsEZ1Cl92FhcSMTMskoZ3ZLuxA0IEnYdfiCWdjyOV395WmAjbDCzeE5cBgzOBa9ve
         36lKYVNVqORoRDhbXrxKrTzVHaBR7Pt98o5SWqpi+5p42MTb2GNFnjGCSHvdh9MBD1Ul
         gR7MuEowqHHhoSNgQiFW1mzH3nb6hGV38h4nF6qe6dt0Jn/xqBNjZr/ZSZOiYuJhMjPA
         TIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyflOORFuzAU5BULEoWaY0vuPe5ZUd6mweprOBGP7n4=;
        b=xZ54VaYUsREb4foHdXFARNlvaU1lbQi5NOeW1bDGlMTgl7oqhGDlGJXeNbmfSwtMK8
         9nQq5G+2bweqjiWSZcNQa6QO8By1L8k4TWRlRHJAY80IjgHIgzAS0zEqalcIm1B0oFtD
         bCS0jy4gkHn2BmX38OslZ7QNBMg8Zz9gXsGYe/oe40NuKwBN6MQqe0m13f2xcVW7CHid
         cG8guyTA4Dsp37flOIKmaODXPgz4sGC0xDYO+wx1qQ4MRiGeR5O/aBGaVlNHzZAYtIXD
         FOIK7swJEFEBd26jEjZlCx1+4a2EeK7nxprnvqMQh+ZjyoD88aPLC9+YXlPU/WJpK2tE
         zRmw==
X-Gm-Message-State: AO0yUKWKiIXlCTLHQoX0OoBRb91Za5xshhga8U0cUtvyq9vc7sEOtReB
	1B6qtEqNXOff0wcrcRRZxk0guJO8VQuni7bq
X-Google-Smtp-Source: AK7set+7MBWjsuB8yva8Fc5p8aC5aN5uYqqryTPqCXjxKK3H5HjlkWNP4KGkPHf5peiWVdp8nCUvCw==
X-Received: by 2002:a17:906:f212:b0:8a9:f870:d25b with SMTP id gt18-20020a170906f21200b008a9f870d25bmr22004320ejb.15.1677244883698;
        Fri, 24 Feb 2023 05:21:23 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id kx20-20020a170907775400b008b17de96f00sm9947077ejc.151.2023.02.24.05.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 05:21:23 -0800 (PST)
Message-ID: <6ebf87aa-4422-1f84-7e76-276ac4d884c3@linaro.org>
Date: Fri, 24 Feb 2023 14:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add reset
 items
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230221140424.719-1-walker.chen@starfivetech.com>
 <20230221140424.719-2-walker.chen@starfivetech.com>
 <1467f7c5-07eb-97db-c6f2-573a4208cc28@linaro.org>
 <d0984638-3f7f-7e4e-fe3e-5e1f88375dca@starfivetech.com>
 <36188e04-332f-e944-9c58-f6f2b74987da@linaro.org>
 <bd4301c5-d79f-6ba5-a840-95b733d2d44e@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bd4301c5-d79f-6ba5-a840-95b733d2d44e@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_052128_295743_C6E29F9E 
X-CRM114-Status: GOOD (  13.32  )
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

On 24/02/2023 14:09, Walker Chen wrote:
> 
> 
> On 2023/2/24 18:51, Krzysztof Kozlowski wrote:
>> On 24/02/2023 11:14, Walker Chen wrote:
>>>>>    resets:
>>>>> -    maxItems: 1
>>>>> +    maxItems: 2
>>>>
>>>> This breaks ABI and all other users. Test your changes before sending.
>>>
>>> I think 'minItems' should be added here. So like this:
>>> resets:
>>>   minItems: 1
>>>   maxItems: 2
>>>
>>> Other platform/users will not be affected by this.
>>
>> Which will allow two resets on all platforms. Is this correct for these
>> platforms? Do they have two resets?
>>
> In kernel 6.2, only two platforms use this DMA controller (see 'arch/arc/boot/dts/hsdk.dts' and 'arch/riscv/boot/dts/canaan/k210.dtsi').

What about all out-of-tree platforms, bootloaders and FW?

> There is one reset on k210, while there is no reset of DMA on hsdk at all.
> If here minItems with value 1 is added and the value of maxItems is changed to 2, after my testing,
> whether it is one reset or two resets, even no reset, there is no errors occur when doing dtbs_check,

Yeah, I know how this works.

> the DMA initialization shall not be affected either on their platforms.

I asked whether the hardware physically have two resets. dtbs_check
checks the DTS, not the hardware. You know allow two resets for each
other variant. What's more, you call first reset axi for all variants.
This does not look correct, e.g. k210.dtsi does not indicate this is axi
reset line but reset for entire block.

Thus your change should be constrained per your variant (min/max in
top-level, allOf:if:then allowing two lines for you, disallowing for
others).



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
