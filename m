Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CA6C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCOZ10qv5ISGo2QGIZJeAclbbcE+tEh0YPDWJrwXvhU=; b=NmGT3IMhjKEIWJ
	t9PJu9mWO8RctcEPtXOk/1HMuyiEX/78rowZtd6fN42dXYkdOwTOFonYO51+KyLMDWUkhKK3wNZXA
	Tx3ICOPUDGVAK7SVOCyjJ4V3fvXdf0rMLH4s9Kz8x3XQdstgmDV8qKlrGVAynY95IjYJd3oHrwd80
	0NrKPDuGACYO8nls64F0x6Qt9SdEr9c+90NUGKoDGGQ6Ee6SHqMpkA9544HTjfg9GV82Kxp5eNTws
	0R72KgUc3tuEgq0prMwMVQ+455ID7XyEsDvZmUgfODC8EgtNZlzxON/+Pp8uh5IscD+oCAxwVuDGA
	5/J5wd1fS+0ivMvj0Dqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Orj-00HKjy-I7; Wed, 30 Nov 2022 15:19:15 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Org-00HKeO-3g
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 15:19:13 +0000
Received: by mail-lf1-x12e.google.com with SMTP id g12so27479772lfh.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 07:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NAnnNP3FJD8yHHEakUZDxebfp+jA14IglPNt9dTJ29Q=;
        b=EMlF8HMgqsdjrvzll7BrBDBmJmGihxjYLZCUiG/vbjBXUv6VDRSeCtSKRUpghAKck9
         e1qMnktaJ3RXB6PR/wskp8mO+CYurPrQ9AGb0sKTvmUj7bMvrSGVp24qhjYONMPnEmW6
         tb6m5LSsZBQzNQhVjpkI7rZDqyWTKO67l+o4ivPDI5iA1RNxvl2LI9kTZdi8TD+lf4Xb
         wMHG4MRFhQUP03Ws1uTQ12n5i6VXJuO/h9as3BKWVhC2IHpXvvfXhp7BnHuAqiSBR4hq
         R0FNpsKKgDpQ4YWMw9wI9qKrMj5KJhgBzO3pJ298tWVpbNKQAixfEnjkKrMSKuTmVoQX
         RqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAnnNP3FJD8yHHEakUZDxebfp+jA14IglPNt9dTJ29Q=;
        b=DyW2/yOag5E7HXXDCCjI5hjM36zkiJUfI/Z2LAOkRau7Nr8n7JVBrBegRkDwNhzTWD
         54IUz8bvEoW5/1OQ6oLJ5WaeK4pWbo1W4rsrpToJzd+7voIMnbIycnvRxTdUrb6v5R6A
         16L4HeFc/DxRLE05w0C179lXRHodk+FA14U4qgY9Dk4HlPkjV/PjxxkmC/q6LoC8vIor
         nHDr/4kiVA3O5y0OVgo0LO3DNjE8UH4Cd3DxVS3oNGpHuNgfNiUeHfn/7wz2JLpu8QXN
         fy3cz78eIfAWoqx8Xo2nQqXFjl8hWWZK6T9oshj2juM7EBWEn52b9aro9d/TeEkvx547
         mfbw==
X-Gm-Message-State: ANoB5pm1oq7kUYaXrsXKGbi02DTTm1f3864mFd+4X7eWE9QfCCR5NXDT
	wXTGpfMDoBdy7dRbGW2RVxu96w==
X-Google-Smtp-Source: AA0mqf4mhWj9u/l0qavenny180wF5efk0eMx9EmZ4SdnUEoccoCC6OpQuOTQIvcaaTDGlXTeCgGtcw==
X-Received: by 2002:a05:6512:3b06:b0:4aa:8cd:5495 with SMTP id f6-20020a0565123b0600b004aa08cd5495mr14587966lfv.254.1669821548231;
        Wed, 30 Nov 2022 07:19:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s21-20020a056512203500b004ab98cd5644sm289679lfs.182.2022.11.30.07.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 07:19:07 -0800 (PST)
Message-ID: <9183bac6-121e-0027-a88b-d77d5c9a077e@linaro.org>
Date: Wed, 30 Nov 2022 16:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-10-hal.feng@starfivetech.com>
 <1d62f95f-0edc-afd4-abb4-37fadc0b6a47@linaro.org>
 <72b3d10e-5a8e-ed42-6808-f53773913422@starfivetech.com>
 <768c2add-4c1f-0b36-5709-dbcdd560f504@starfivetech.com>
 <1fb1474b-ec13-e83a-973e-bd9e9a86cb44@linaro.org>
 <98d1bac7-8af5-f481-59b2-d58ca4c228ee@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <98d1bac7-8af5-f481-59b2-d58ca4c228ee@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_071912_188610_38CB2932 
X-CRM114-Status: GOOD (  14.51  )
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

On 30/11/2022 16:12, Hal Feng wrote:
> On Wed, 30 Nov 2022 12:48:30 +0100, Krzysztof Kozlowski wrote:
>> On 30/11/2022 10:47, Hal Feng wrote:
>>> On Fri, 25 Nov 2022 14:41:12 +0800, Hal Feng wrote:
>>>> On Mon, 21 Nov 2022 09:47:08 +0100, Krzysztof Kozlowski wrote:
>>>>> On 18/11/2022 02:06, Hal Feng wrote:
>>>>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>>>>
>>>>>> Add bindings for the system clock and reset generator (SYSCRG) on the
>>>>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>>>>
>>>>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>>>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>>>>
>>>>> Binding headers are coming with the file bringing bindings for the
>>>>> device, so you need to squash patches.
>>>>
>>>> As we discussed in patch 7, could I merge patch 7, 8, 9, 10 and add the
>>>> following files in one commit?
>>>>
>>>> include/dt-bindings/clock/starfive,jh7110-crg.h
>>>> include/dt-bindings/reset/starfive,jh7110-crg.h
>>>> Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>>> Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>>>
>>> Hi, Krzysztof,
>>>
>>> Could you please give me some suggestions?
>>
>> You can keep aon and sys split. First add one of them with their own
>> headers. Then add second with their own defines.
> 
> You mean split patch 7 and patch 8 into sys part and aon part
> respectively? There are totally five regions (sys/aon/stg/isp/vout)
> for clocks and resets in JH7110. If we do that, there will be 5
> headers for JH7110 in either clock or reset directory finally. Is
> that OK if there are too many headers for just one SoC?


Sorry, I lost the track of what patches you have. The comment was -
bindings include both the doc and headers. You want to split some, some
merge, sorry, no clue. I did not propose splitting headers...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
