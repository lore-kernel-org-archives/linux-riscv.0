Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF4BC47088
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 07:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JgDnSaIcSEY2Wkh7+5d9sRYNtyComumARnOTsPfMuwA=; b=yuJrj0h4o2Zwcd
	yNcYALNDovgDsltv+LWo23kFaymg6qUsUeq0IcIRthDGUEK90a6bvlYonaxiO+14QELBcivD+3AV6
	ASQfFMdOZsp4iKvylojdYz+ZT+OA1UBmA+ZUThR2h0EfAjk9RHPRyJA4qf7+F2ftKay7zrmkY03cx
	KvPMgvA0SZGDLdsWtjF4QblvzIzddojwo4sIN6H3/P6VTPzLxHJ9++92ftNey2v0bYz1jKv2clZhi
	lILJTASFtyKO7ExH4dt9Alu+UdP/pXanVsXIQolfUwRkW4PeSyJaJFAN1NKPOwdBwuivJEinbwO0p
	WHTRJZvt9Csvirc16B6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25wN-00FZyb-Uk; Mon, 05 Dec 2022 07:31:03 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25wL-00FZwK-Kg
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 07:31:03 +0000
Received: by mail-lf1-x12b.google.com with SMTP id b13so6238129lfo.3
        for <linux-riscv@lists.infradead.org>; Sun, 04 Dec 2022 23:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ic6F8QFCJK13ebf9asWvu6VyveRvaroZzcFBrpHB3Nc=;
        b=Qq4IFm0i4P/LFoDZKUn2+/rtTIoRv5thuIbrz0XBnAyu3AEn7V2FNqZoUTfzaGV+gy
         BY72zOHlUP/wv1LSN/dyZJLQkhGOu5n6q43ypzUObe4hAGjjiGuyhxa8JPWr8ZzNQZZe
         ytN3Dhh4aPVxiitji9JQse26dzXnYQnRfN6ZeYJSKyz9wP8+513YDHI5sX/ds5IDb10E
         V8at/+WnV1FgKjbfkOjpB1GewQys8cDF0mWGh1S/QNBz7p94cNvD/K/l/15R4U8gV+3T
         f8DYACT+Jj/X22clRfhvJGMTjcKKc16vfMmPQ2XGo5W7u5LvORxeyRcngkImmvm0MBbE
         LBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ic6F8QFCJK13ebf9asWvu6VyveRvaroZzcFBrpHB3Nc=;
        b=HeYIQN+6XfGXBVbi/ynuzHQGqkMIhVDiL2AvO7SlhFUU/Us5Ao/fhS7m1/0meZC0Ir
         nlLxtErOhypmqAjBe9OnJ7fp45ZrorkyE/BuR6kyP6Uy4msIOPvTbfsBQ6JfPCwZa3wq
         7mr7l0VCVXSH2+/MuuJzd2g10sHvyw1xPGVwgfn8y9gYYkVJgIuRvi31WccYbPDqkkvC
         GNNRlX2ujsJdETvWCH3WgElgIqjFpUB6lrO4+2mPeJbc5v1Fyw7JHVGNvIAjf+oDBeil
         xIEqqC2jt5QU8JZQ6vuqS9vZxqlk4CWdZDcuHOab02HfUCE7bHxTKEhpR0hw+3GRN6Gc
         5H1g==
X-Gm-Message-State: ANoB5pnRTiiinwT9Sw/OkEKGdVa8RzWPbQgzKYqxFj1G3/Sy0/nQx/bg
	quT3beU2YptPiU4RQQRIz5K94w==
X-Google-Smtp-Source: AA0mqf4PVweKhUkPQ+6ewoxxuSwatBKT8xqhq+m8lOVYNmSqJASY6f8sMB6+9CprV3sdvonxsW9kEA==
X-Received: by 2002:ac2:50c9:0:b0:4b5:7dd6:4df5 with SMTP id h9-20020ac250c9000000b004b57dd64df5mr138521lfm.410.1670225456216;
        Sun, 04 Dec 2022 23:30:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t26-20020a056512031a00b004a03fd4476esm2027492lfp.287.2022.12.04.23.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 23:30:55 -0800 (PST)
Message-ID: <d6f3d8ac-4fbe-40ca-299b-046973cd0b25@linaro.org>
Date: Mon, 5 Dec 2022 08:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 1/3] dt-bindings: watchdog: Add watchdog for StarFive
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org
References: <20221202093943.149674-1-xingyu.wu@starfivetech.com>
 <20221202093943.149674-2-xingyu.wu@starfivetech.com>
 <cb8deb55-902a-0058-4764-a5f391f8de6d@linaro.org>
 <e0551ed7-2208-6d08-235b-993702f0d89b@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e0551ed7-2208-6d08-235b-993702f0d89b@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_233101_726023_61E06578 
X-CRM114-Status: GOOD (  12.12  )
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

On 05/12/2022 04:49, Xingyu Wu wrote:
> On 2022/12/2 18:46, Krzysztof Kozlowski wrote:
>> On 02/12/2022 10:39, xingu.wu wrote:
>>> From: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>
>>> Add bindings to describe the watchdog for the StarFive SoCs.
>>>
>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>> ---
>>>  .../bindings/watchdog/starfive,wdt.yaml       | 77 +++++++++++++++++++
>>>  1 file changed, 77 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml b/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
>>> new file mode 100644
>>> index 000000000000..ece3e80153a0
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/watchdog/starfive,wdt.yaml
>>
>> Filename should be based on compatible. You do not allow here any other
>> models... If you intent and you are 100% sure you will grow with new
>> models, make it maybe a family-based name.
> 
> First, thank you for your reply. We have some other SoCs like JH7100 would use
> this watchdog driver, but we now use JH7110 as our main release chip.
> As you say, should we use "starfive,jh71xx-wdt.yaml" as filename?

starfive,jh7110-wdt.yaml
I would say because you do not expect any other models (const for
compatible, not enum)

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
