Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4D9C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 09:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jw3j4tnLQ1aucd4Rwu5Ji+SSOMJLMSZ8x9FEMG3TkV4=; b=hoaSlW0piit+dp
	7tc1qHPRuAUDWNrbblbIG3GjHyQgYQMI4yFzApjIO1KlytqwgKUbR8b8N20usaJkNSjUl556gRqF2
	TkZccwu8q1kZII35rEE91iHQeeiake8NgGdi6bOiOaiHQmq8u1+SsfQgTWhgXkKhbQaK3yhfUYPml
	iTmP9xU8hbsryRgDOaaZ6s93PxnwXacMJlAqgu2ESedBCVir2mAeUgUQO6PfH0kyEvtOLLmdLgRyF
	IrqP4StMnc23yX5NFmpCFpYin3lP5fBqNJLaGtxDWtxnPEo+jC6ueuH1cvEoWx/cME2GRSHHc9VhX
	ATshsYx/I89yXkccTtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pASTt-003Ytf-4R; Wed, 28 Dec 2022 09:12:13 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pASTf-003Yf9-VK
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 09:12:03 +0000
Received: by mail-lj1-x236.google.com with SMTP id n1so16013326ljg.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Dec 2022 01:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0iU0lEEi+NPvnevFz5v/nUd+nt+xlbi55hYpYeF8kv8=;
        b=ZlHAN2Qm4X+4bssNjlhgXwc8CTx1TnTGHd2REjIfdPyoL9XYLnoO+oTKZ/fYg1pl1z
         CvAkMwnXhkgNsRxLUHnxqCLoocXFQWx2oRKEKu+BfxTUhSZp9+k30JerybpCYMvryA3v
         yXSBC5GV9ZPP2pQKZVTkb6ERWgG69R2/C9hOItndq1BwS1E84D7Gm0Kd5Sa2xoGF/boQ
         98K6ZwvyeR+k5OZgL+E4SOSC+D5k8Ud0IUW7m042LRXXwONQ4b09Ec1MvyChTzf7HkNX
         QERdR8ekbUkw5pK3TLrJKviunp5SVGom7FGrukWB+F9T/aAKtw/Af/bNk+swft+on4fm
         KOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0iU0lEEi+NPvnevFz5v/nUd+nt+xlbi55hYpYeF8kv8=;
        b=SaX7E26oKgvUYEAntObJbR2UlXeYAIu8nEt46yjTDlk9OG8/WdHCYDpwtvz7dvRWXS
         MUyxH7wYYxVVy7PuArGmipTczoRGfb0a+vIWbtmrzl8y3iFVMW6Xl0LqLLQMEVHBJSBm
         S65u1/Ya1oUC+OBxO2LcVPZ9y8a5gXDjNEbHQncZyA0Z0k564JFrNr8DodCytcWAl2Xv
         oiG5Nrf6HY2IbFoGP5hhK+aTbsijicNa6N4DzLxSQPxCEdEpI4xA30e+a6fZH6UXYbcB
         BJiUY/1Q/p7lg1S3BwMOGDZiRi4NriQwYYSpAKzvqqd9UvhQhqJBeQz1DNgpioJ786vj
         3JJQ==
X-Gm-Message-State: AFqh2kqQBS3kbG92QCetly89l/heUihO7X2+/E0I22qnTXW3ijBveiGI
	1mtdGVnL0FCE8L7cEmt10yRbXA==
X-Google-Smtp-Source: AMrXdXsm9YuIsn0AG+RnQD6psOq8x79YYXxCot3n430np+AbdgZ3DeKWY9XoGdQCIRAveXW9tKysUA==
X-Received: by 2002:a05:651c:b0c:b0:27f:66ec:b57 with SMTP id b12-20020a05651c0b0c00b0027f66ec0b57mr12033879ljr.39.1672218706774;
        Wed, 28 Dec 2022 01:11:46 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f2-20020a05651c02c200b0027fc4f018a8sm711703ljo.5.2022.12.28.01.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 01:11:46 -0800 (PST)
Message-ID: <9b098bf9-59d7-e58d-aba3-a8055af053c6@linaro.org>
Date: Wed, 28 Dec 2022 10:11:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/9] dt-bindings: net: motorcomm: add support for
 Motorcomm YT8531
Content-Language: en-US
To: yanhong wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-6-yanhong.wang@starfivetech.com>
 <994718d8-f3ee-af5e-bda7-f913f66597ce@linaro.org>
 <134a2ead-e272-c32e-b14f-a9e98c8924ac@starfivetech.com>
 <c296cf6b-6c50-205d-d5f5-6095c0a6c523@linaro.org>
 <e03fb7bc-b196-bc8a-b396-fab8686d396b@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e03fb7bc-b196-bc8a-b396-fab8686d396b@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_011200_184193_1E2D8E6B 
X-CRM114-Status: GOOD (  10.77  )
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

On 28/12/2022 04:23, yanhong wang wrote:
> 
> 
> On 2022/12/27 17:52, Krzysztof Kozlowski wrote:
>> On 27/12/2022 10:38, yanhong wang wrote:
>>>>
>>>> This must be false. After referencing ethernet-phy this should be
>>>> unevaluatedProperties: false.
>>>>
>>>>
>>>
>>> Thanks. Parts of this patch exist already, after discussion unanimity was achieved,
>>> i will remove the parts of YT8531 in the next version.
>>
>> I don't understand what does it mean. You sent duplicated patch? If so,
>> please do not... you waste reviewers time.
>>
>> Anyway this entire patch does not meet criteria for submission at all,
>> so please start over from example-schema.
>>
> 
> Sorry, maybe I didn't make it clear, which led to misunderstanding. Motorcomm Inc is also 
> carrying out the upstream of YT8531, and my patch will be duplicated and conflicted 
> with their submission. By communicating with the developers of Motorcomm Inc, the part 
> of YT8531 will be submitted by Motorcomm Inc, so my submission about YT8531 will be withdrawn.

Are they going to apply the feedback received for this series?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
