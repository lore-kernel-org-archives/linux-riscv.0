Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7603FC64ED6
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlVNf2rPCtzg7n1wkahx2tfQEqfp6cKqs8t9aYms3Uw=; b=BHYJKQPSiJO12N
	10dEupXUoUb3x86xkeZD6FvillWhHXcfapGnQJzhtDdud3lzjvBBBBXx576zgUPTjc9IeTanlT5Tt
	B2QjZwdkTMIXzEi0eWpKTCdOKbyKxRg5jS5g9jDHUefDJ2kut8c58uiJ+hP4NnyOMpPHATfPN0NRe
	ETOYyQCFBkkeC7/6y66CkkGTvtzt0xcsv/5f2CNje8CDCYjOWVhhTVO9cyn0nSW+Tjg86S6lEbWW+
	pgPy1t9+LWVer9J8NU7dAgZaPpDQqfXsSwZEeAsZCRWJSSuFm6h1MzluzKN8LJJ1BCNAiceFSmqHj
	s09uUIory4tElwWm5H4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbYP-009ZqH-GC; Thu, 16 Feb 2023 10:31:53 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbYM-009Zog-TI
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 10:31:52 +0000
Received: by mail-ej1-x634.google.com with SMTP id qw12so4084593ejc.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 02:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ix4RsbCrDFK7MIuT9pOLARGn8u4bBU4cosvDF8Y/JA8=;
        b=feD5D45mQMyuejZs5iuOhsBp99NaR5hgAQ8+z4JZ2lO5/EYInsZCZn0Ou3fyEUNpnW
         qTJqzSUUZ1+GMmO8W0VerVKTxOTTzaCCMfPwu053PybDXJZkpuTIIMSL3ReXaYTPdPlA
         krB/xjONxBwP5XJg+pPB/rYv3m2cJwmOP2IlsPm7FEAIM2xaOys0XQbSeIDhEoDBAgsV
         gTvglcWD/UMFWeW/aHDamQBNu/LJmquL7Dg908NUVnrqgE5IACTjKjpyzCUvXZSz20a7
         1cxiZIY/3sM6SNamSq79tg1NqbVQq28ZOUxmv+Li5xt8hEv1uPxpSXSCVWyqcoCKiQpK
         L8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ix4RsbCrDFK7MIuT9pOLARGn8u4bBU4cosvDF8Y/JA8=;
        b=CZfqy96na1EaKOjl0y8a6wubDGDvCeiAMUzRVwpoX7mrP1+kMfQ6f1IjW7Y+wNZ/5v
         VOPYeYhaK864A7nHM8BQVBLODL3BPfXyQqC/pKOVDDC3ioYP7u1t5fOJKicr0jmCUgps
         /OFJkaZ+OFXNEaMOvC4MYt77mn8U0C+BwRCRzUCkujXraOffadeecOIvoEWfKQHRLZAX
         NC5lcQIWPCs66hn3LhU4p709Ggcfdx3m3Ho3q3/a+3d/uzjSNz3Y8BMEtpfjQbTC36ED
         y1sGpt6Rt/HrRX4F0uf74nR5p3EoLGsc/Um0eHtPu+5rGShnbm82DtNu+LbKWaO28bxC
         tzyQ==
X-Gm-Message-State: AO0yUKUFbsDml3htYmzJjQT0sjNG1BWWKY8pcbJ+0KtXHYYB36brFL/Q
	AosWe1qAn0ruvdOxV+3B1sQFbg==
X-Google-Smtp-Source: AK7set/2E+cbvHdhmkKFbg9OvPtxyGjHcWKjb4JdXvmp5/HA2el/r2zqC/sHNFvf3bGj2LLdFGImig==
X-Received: by 2002:a17:907:764f:b0:88a:7037:855e with SMTP id kj15-20020a170907764f00b0088a7037855emr6326555ejc.9.1676543507189;
        Thu, 16 Feb 2023 02:31:47 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id pj21-20020a170906d79500b008b1268476dcsm622935ejb.108.2023.02.16.02.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:31:46 -0800 (PST)
Message-ID: <8388695b-98f9-223b-1e15-86aaefec2d6f@linaro.org>
Date: Thu, 16 Feb 2023 11:31:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: William Qiu <william.qiu@starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com>
 <41bcc545-6eda-6c30-c600-d97ef009abf2@linaro.org> <Y+4Fbrz8EYIGyjVj@wendy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y+4Fbrz8EYIGyjVj@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_023150_979054_628174B7 
X-CRM114-Status: GOOD (  14.60  )
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

On 16/02/2023 11:29, Conor Dooley wrote:
> On Thu, Feb 16, 2023 at 11:23:00AM +0100, Krzysztof Kozlowski wrote:
>> On 15/02/2023 12:32, William Qiu wrote:
>>> Add documentation to describe StarFive System Controller Registers.
>>>
>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>>> ---
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - starfive,jh7110-stg-syscon
>>> +          - starfive,jh7110-sys-syscon
>>> +          - starfive,jh7110-aon-syscon
>>
>> Maybe keep them ordered alphabetically?
>>
>>> +      - const: syscon
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    syscon@10240000 {
>>> +        compatible = "starfive,jh7110-stg-syscon", "syscon";
>>> +        reg = <0x10240000 0x1000>;
>>> +    };
>>
>> Keep only one example. All others are the same.
> 
> With these fixed:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> @Krzysztof, I assume the location of the binding is okay with you since
> you didn't object to it & I suppose this one is up to me to apply if so.

Yeah, generic sysreg devices go to soc. If their primary functions were
different (e.g. clock controller which also is syscon), then they should
go to respective directories, but it's not the case here, I think.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
