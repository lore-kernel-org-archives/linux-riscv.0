Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35327C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 08:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+08gIwR001q/4ENMOQdYW6UrGuJWFwHD4BoERaSdc/M=; b=PvrRDVqdCNv7ug
	rPfymcXq9oW2ip1AAMt9cVG5dfllU3xKsLAkqRLdhGT7i3dtHQjlv87r96pICA7HHcn1351FqKgqf
	0m4eaN7xCFQ7tTmDS4oTZi7P0p577QrRilX4QNE5GN3a/AQ+bcZDT1GiyyuCHrsdT/hHCm6vjOL9m
	i7Y4hH2z8dHsgtG+WZLc3AchclISEgHOjxjf1vy5toXKMlgJdENYbtZL/fpBnydEdOBKOW+bVFOtM
	KRr+lUrj7Gf1CKZHpQ9Dy7dla2xUPmXejflQd/PHejLU0LqgJwFC/dg9m/Ly6D6ujkW/1oO/2jXEq
	pkBG5UbQjUqui3mU450w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p110h-00EL5T-EB; Fri, 02 Dec 2022 08:03:03 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p110e-00EL1k-2H
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 08:03:02 +0000
Received: by mail-lf1-x12e.google.com with SMTP id b3so6245932lfv.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 00:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4IdzLY27aCfwCW+1kAuSU/YopF0MIss2eIYe4Dhln+A=;
        b=WwORmOy0PdSeZraQD4PW1wRX4DBbzps3+/13hXtqSupW3mVWggBYxzs0sl9NVLdSR3
         SGeEXsKV58pwrZTUo0xD9oQKZOAoWVgCQ/pDd8C5UW9UJfhur8r2tV9ZgOs9deGme9w6
         xdqGGLei8ZRlIT5wNI5qoPpnR9uRFUV2onDVarxh16nbs7nwN++8pES26K5EiXr3QsmL
         /dkCeM9ha1Z125/Xe/w8PXBjc6J3t8Q83TYtDlbJPVp8ObRJ3O8VCRW1e7cD792FgVv8
         imvViUQyi4yU/4nWID4wMVr5YpA+Xdsg+8PWWt8rISVt3C2AKZYvUYg7RdpybprTPHb0
         wWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4IdzLY27aCfwCW+1kAuSU/YopF0MIss2eIYe4Dhln+A=;
        b=Rf8TseMFiPiwxG40EX8KA8W0XcwvjrzXHi3SoiPZ42RVXuwf39bPFUMncP9AWU/GeF
         YIUGjcWAlnwnATnF3VISdMu/WjqhS0X6e1EedHuzpJyE5HOKL0X8QAF/WImhv0xYMI5j
         Xt6OdGuhom5zzTkmrMeo0dMeYhvj4CCL2VhcmXgw+61Bc23trq/sr0nNdjFKRJpeAR9K
         WwYJ+Q1h2W3Ig+f6CHtMsujQ6wzSmEZNcgwmo6sfk61Zl3dUiFYkO11NWlv9uAnYCzSY
         +aRkVafIJjF0SlHY2eGLnn4+w7m1zWnYUnaA0JpcqnizOhI03/iBPFBz6pSAKPV1ataA
         8oXQ==
X-Gm-Message-State: ANoB5pmyxKh2R7k2xfTi33Qtc70s4vOuc8YnUc6sPNSG3SVSzCeFl+Se
	W7SFH4kcW/jYTGLGZ6pvRFcePQ==
X-Google-Smtp-Source: AA0mqf70C1bJlKmKFjcvD7Qyc8TcS8FceaKeI5XTpRJUCRbVV4tThfx7ViN/h19grRUXplwWTc59zA==
X-Received: by 2002:a05:6512:4017:b0:4b1:be16:4a4a with SMTP id br23-20020a056512401700b004b1be164a4amr26683347lfb.0.1669968176004;
        Fri, 02 Dec 2022 00:02:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x31-20020a0565123f9f00b00497a32e2576sm940879lfa.32.2022.12.02.00.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 00:02:55 -0800 (PST)
Message-ID: <84d26a47-2d7a-bf7d-9e0b-fd9952262620@linaro.org>
Date: Fri, 2 Dec 2022 09:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 3/7] dt-bindings: net: Add bindings for StarFive dwmac
Content-Language: en-US
To: yanhong wang <yanhong.wang@starfivetech.com>,
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-4-yanhong.wang@starfivetech.com>
 <36565cc1-3c48-0fa8-f98b-414a7ac8f5bf@linaro.org> <Y4jl6awCMFgZsQGC@spud>
 <1d3f1334-b6bf-57cb-7f7e-48e3c08a5560@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1d3f1334-b6bf-57cb-7f7e-48e3c08a5560@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_000300_186999_1786EFE8 
X-CRM114-Status: GOOD (  12.61  )
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

On 02/12/2022 08:16, yanhong wang wrote:
> 
> 
> On 2022/12/2 1:35, Conor Dooley wrote:
>> On Thu, Dec 01, 2022 at 05:21:04PM +0100, Krzysztof Kozlowski wrote:
>>> On 01/12/2022 10:02, Yanhong Wang wrote:
>>>> Add bindings for the StarFive dwmac module on the StarFive RISC-V SoCs.
>>>
>>> Subject: drop second, redundant "bindings".
>>>
>>>>
>>>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>>>> ---
>>>>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>
>>> Drop oneOf. You do not have more cases here.
>>>
>>>> +      - items:
>>>> +          - enum:
>>>> +               - starfive,dwmac
>>>
>>> Wrong indentation.... kind of expected since you did not test the bindings.
>>>
>>>> +          - const: snps,dwmac-5.20
>>
>> Disclaimer: no familiarity with the version info with DW stuff
>>
>> Is it a bit foolish to call this binding "starfive,dwmac"? Could there
>> not be another StarFive SoC in the future that uses another DW mac IP
>> version & this would be better off as "starfive,jh7110-dwmac" or similar?
>>
> 
> The StarFive JH8100 SoC in the future that uses the same mac IP version, so call this binding "starfive,dwmac".

It's not a reason to make compatible generic.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
