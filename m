Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85260C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhZeKLGXub9NM6KqMMJ+cjF3TYMnjmuI1Ktv9SU3TKw=; b=GxzmaMmFFGIqmL
	+G31WZvqzWCKtr/pCzIgdVPt61S9gjZaZCt64a1vlvAIiLShXIN4edZuHULzERLE6lfQrJBWiEVXj
	TOZ8v6LPN5lu8Y7DOIbCwqZ/R6XCHSlKDTYFTOZoaIwl0SMDuim5CsA1KBv58BnGKxC3vrPBIeOKw
	0ffk0YGTbr2RFLUaAoClp4iNlAHK4nrutNGwwYGAk00K4jK0Y2pxIzgiVfpcIqpVa0jsvkCXJtpQK
	J9Uitg0MdB5Sl0hGUi7F4hXDdA7QvbZXWY9I3Nm7n4/kCdzfuEa7mfCu+ESzW85UjPOhjSTn374NO
	WRaRTL87WsOPYSiwTD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6mR-00Dxgt-Dt; Mon, 21 Nov 2022 13:24:11 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox6mO-00DxfO-TY
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 13:24:10 +0000
Received: by mail-wr1-x429.google.com with SMTP id e11so6919776wru.8
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 05:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LJ8G4Vlx63n7xBM1es556I3FKQ+mU4sDRzPoRdCeX0=;
        b=kd74NXQh18wXsJRyAWwjOEZo6k21PuwDdsL4ZmNCSg8eLPjALRuiX3ZSZ5RiPInHwR
         ObrJ3F6rZaax9BBwPZ/cvOeJc/ZhxFdPBuWApa+uEQBY4ySZcH21fNOOgG9TV+srlhDK
         sJY+fpmEVh/moUjqN9GhrBjkFat4UZ8IPCrZJcTuBV4VqYDooAI7toY9pkzEJnVlkZWj
         qUmdWlYDENIMiVkRQwvaCWjmxPhzMpVE2mkYaJ/24jawnIMbzkaIv0uj21BSneaHWECg
         gpmHNhIRtXHe3dnyAW2YWKDFkDqeOKdHhwnrRqZAbHOXP2OpS8mCCYsDgrBvNp1LaXvE
         p7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LJ8G4Vlx63n7xBM1es556I3FKQ+mU4sDRzPoRdCeX0=;
        b=POAPWY+FQUb9ZbY4f4RyIsx41SAIo36W/0cCq5tojNd+yJkeuW/lZORK6JgnHkwaT3
         Pi7TuA8B8eAsTseJdLyt3swELmQN5k8Z2qO335XpaSPHjW/G7nlsvPJzdJXD8dl8MIEv
         WPOZn17UB4GPh6uOchuQyCWX+4x9Q5bLJlFHe6P05Tr5EIuTRMwjNWzUzUMGr4amGy4n
         tvDQhrzl4nHe9PxFyrkKksFGj2oACr+ZT7ean9JDAQ5u1aA3XA/u50gjUqP+yqGy03re
         07eLojydmm8/oUT0E1lSmCM5EgMGsP8kUEhQP/uHwvQw8bkaJzZYCJld202xak9QO1gl
         Cpqg==
X-Gm-Message-State: ANoB5plWUy9kW18J+jDxAZVt+z5WKq2DcAFfqW5fNzc4yVS6trDAwEOt
	ovWmqFpTyxOOLs0dEcBE2XtLWw==
X-Google-Smtp-Source: AA0mqf751Fr4N3/875Urx0i7J1CeHvrpttXLjJgI9qnKrrIfoaIeZRF5J+hyjNgMQMilcVeGAzzvMw==
X-Received: by 2002:adf:e98b:0:b0:241:dbf1:dad with SMTP id h11-20020adfe98b000000b00241dbf10dadmr363012wrm.130.1669037046505;
        Mon, 21 Nov 2022 05:24:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003c6f3e5ba42sm20242257wmg.46.2022.11.21.05.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 05:24:05 -0800 (PST)
Message-ID: <7815f518-c764-a3d8-cde6-89c1f17c2329@linaro.org>
Date: Mon, 21 Nov 2022 14:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 10/14] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Hal Feng <hal.feng@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-11-hal.feng@starfivetech.com>
 <8153973d-e8ad-e47a-3808-bbcdbfd169a5@linaro.org>
 <CAJM55Z9ouj=jD2Otx3fK4W1wgnPjecUgFuKksw5CmU6SraM_Nw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJM55Z9ouj=jD2Otx3fK4W1wgnPjecUgFuKksw5CmU6SraM_Nw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_052409_046124_F88B4FAD 
X-CRM114-Status: GOOD (  13.59  )
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

On 21/11/2022 12:38, Emil Renner Berthing wrote:
> On Mon, 21 Nov 2022 at 09:49, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 18/11/2022 02:06, Hal Feng wrote:
>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>
>>> Add bindings for the always-on clock and reset generator (AONCRG) on the
>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>
>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>> ---
>>>  .../clock/starfive,jh7110-aoncrg.yaml         | 76 +++++++++++++++++++
>>>  1 file changed, 76 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>>> new file mode 100644
>>> index 000000000000..afbb205e294f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>>> @@ -0,0 +1,76 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-aoncrg.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: StarFive JH7110 Always-On Clock and Reset Generator
>>> +
>>> +maintainers:
>>> +  - Emil Renner Berthing <kernel@esmil.dk>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: starfive,jh7110-aoncrg
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Main Oscillator
>>> +      - description: RTC clock
>>
>> Real Time Clock clock? :) I don't think the input to clock controller is
>> the output of RTC...
> 
> The description is bad, but even the documentation calls it "clk_rtc"
> even though it's really an optional input from a 32k oscillator.

Then description should match reality, not documentation. Documentation
is often poor, so if possible better to extend it.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
