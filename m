Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA1BC77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 06:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eh7G5GGf7KrUc4E8AKHpKh+l54FDxo6tEaa2u0Ybtck=; b=c9N0z4K6z2QnSp
	t1Ot+nKafVXLRTN+9ZyP5Qdv8XSXlV7MWRVNQnpAnDoL+zl4LvqXvQ+yEiGfCVclShD8RYXl1WapE
	/QYtdxfPKO5MHOuhMz+lfoYtMpMMOxTb42/9pMyhJbVkgj8bMoguEWy9470chJP4CRFFtyiTUMPfJ
	YGW3O1/EIQ8/kZBhz/yWKA26aBNV3x3CviKU3T5JgoiW/VKB8cZdyRlNHIEztdofkUxH6yK2RiUm7
	tSUzfg3B2/1G6kAHyP91p6a0lpC2OGQggtPLUSmsq2er1bRfPfSGrRCJSowT4E3TIW5oKYe7vypTI
	D7XzVOY2yguJEc2B6Hog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvBS6-00CgP4-0b;
	Sat, 06 May 2023 06:31:30 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvBS3-00CgNs-0f
	for linux-riscv@lists.infradead.org;
	Sat, 06 May 2023 06:31:28 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so33419234a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 23:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683354683; x=1685946683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LAtZBzGq/K371lgu2uGriXQv86Ola8BpEn4aIcDi9OQ=;
        b=m9MzzgGRrTGwMDNjRn1SfcbtC0bE+JN12uUt+jLjTrZ5ZuHakyZdEdbV94qNFvLFuq
         RimCyEsemP3RchBaz3DsuHMr3+ZTrJgSHMFUSKsWV4Ys2bqrTW8S/K0m0u0N5W3MG7p3
         mKIoXzBNZ0e6fAww/isJIycI4nDbmKgRkBGukwyu5lFGyTCDIQByg/yFU0uVeD4lJZ40
         gvvj3v/qs3HZw7bMnIs7o+YE0HAuENH8DdwaAPBTgvYyOAFopBidrA8NTrVz1tyiUp/J
         WiLabHKJYfOHPTpzMWZACHM83Qe38692dzkEjQMPEbmmGJqEp69MwDOfyICxCCR6PA8A
         rkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683354683; x=1685946683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAtZBzGq/K371lgu2uGriXQv86Ola8BpEn4aIcDi9OQ=;
        b=QLZVx4ZicK0oMvC3bMdIikd33BTpqDh+csUUn4KEEGpUemcOZLwdta+v1cdpwEwBz/
         4v5xP9JJiyG8Vxx8cu57L+i2+cbpNDLeECcACQwrA1oxAJLDaJYIi+TGA7zfVE+35Mu5
         YXw/2aCO5pFhxu+m/TD3Nz6OqDDQLh0jFHf4y8tjQ/45t0JvSfF4sg72oZMX6A9h9MzZ
         /M1sSGOehVpuTa/6JtpVmUE5nldRjIWqg82xJQE5S3MjK7o0vZxClJ6xgpg3LjaTr2Cx
         4GJ4Wlzz0gqEykmZObflluXuLRaCQmzSczs0W9I1gixcB1eJ7FD2OGWkJjxApEMP2syP
         B4sw==
X-Gm-Message-State: AC+VfDyZ8BKP1nhJvku6ilO/GnMNKHi/EUOrquY7RJgYyWZv/x/G2+3z
	C/S6TAfk2qei6dClw+qMQEHGTw==
X-Google-Smtp-Source: ACHHUZ6pZsEivEFSme4odojv7RRMViKRqgoDTFoMhFVUH8QIGY17Kx6qZrjLonbVuVyerntCZm25VQ==
X-Received: by 2002:a05:6402:4405:b0:50b:2088:3533 with SMTP id y5-20020a056402440500b0050b20883533mr4681883eda.1.1683354683120;
        Fri, 05 May 2023 23:31:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:efe5:7c03:a10a:7a40? ([2a02:810d:15c0:828:efe5:7c03:a10a:7a40])
        by smtp.gmail.com with ESMTPSA id r12-20020a056402018c00b0050bcaedc299sm3664387edv.33.2023.05.05.23.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 23:31:22 -0700 (PDT)
Message-ID: <9e7b265d-bfe5-f583-2357-d8e342bcf982@linaro.org>
Date: Sat, 6 May 2023 08:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 vkoul@kernel.org, linux-phy@lists.infradead.org
References: <3ed72340-accc-4ad1-098f-4a2eb6448828@linaro.org>
 <482e812a-05dd-105c-189c-e926b4be9d28@starfivetech.com>
 <089e24d1-588a-4a56-f00b-0b35d1d99295@linaro.org>
 <ea5b5534-8fc2-7c84-a011-c1b42c6ed7a0@starfivetech.com>
 <1ac26c1a-1726-515d-6598-849a07ed0b86@linaro.org>
 <5adda0ad-965c-fbf0-878c-9d41d28b5c39@starfivetech.com>
 <86693969-59bf-5bcc-42a3-b6e94a0d6f3e@linaro.org>
 <fcfc8ba4-40a7-da43-3375-712bd7e7f4d5@starfivetech.com>
 <20230504-worshiper-ongoing-5581e1f2c2c4@wendy>
 <2f473307-2219-61a4-fa66-5848fe566cf0@starfivetech.com>
 <20230505-magician-poet-724c96020c2f@wendy>
 <ba6a1a47-d3b1-ee16-4785-f5c61d593127@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ba6a1a47-d3b1-ee16-4785-f5c61d593127@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_233127_283688_5F17BE2A 
X-CRM114-Status: GOOD (  19.87  )
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

On 06/05/2023 03:45, Changhuang Liang wrote:
> 
> 
> On 2023/5/5 20:38, Conor Dooley wrote:
>> On Fri, May 05, 2023 at 09:29:15AM +0800, Changhuang Liang wrote:
>>
>>> But if keep this "starfive,jh7110-aon-syscon" compatible. Which .yaml match to
>>> it? Use this series dt-bindings or syscon series dt-bindings.
>>
>> There is no syscon series anymore, it's part of the PLL series now:
>> https://lore.kernel.org/linux-clk/20230414024157.53203-1-xingyu.wu@starfivetech.com/
>>
>> I don't really care what you, Walker & Xingyu decide to do, but add the
>> binding in one series in a complete form. It's far less confusing to
>> have only have one version of the binding on the go at once.
>>
> 
> Hi, Krzysztof and Conor
> 
> Due to the current aon pmu needs to be adjusted, it affects the syscon in PLL series.
> So It's inevitable to change syscon in PLL series.
> 
> My current idea is PLL series don't add the aon_syscon node. I will add it in my
> aon pmu series in next version like this:
> 
> aon_syscon: syscon@17010000 {
> 	compatible = "starfive,jh7110-aon-pmu", "syscon";
> 	reg = <0x0 0x17010000 0x0 0x1000>;
> 	#power-domain-cells = <1>;
> };
> 
> In my opinion, the first we add "starfive,jh7110-aon-syscon" because "syscon" can 
> not appear alone in the compatible. If we have "starfive,jh7110-aon-pmu", this
> "starfive,jh7110-aon-syscon" is not a must-be need.
> 
> Do you agree with doing so.

Sorry guys, I don't know what you talk about. I have no clue what are
PLL and aon series. More over I don't understand what is complicated
here... all SoCs follow the same rules and similar way of development.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
