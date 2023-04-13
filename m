Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F10C77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 08:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsiyKfid8l3zYtfw7uAYZ7HtA81KdQFil8v7InMbf/U=; b=1eZxrdHbofnJm+
	7lfDPYOb8onQSulylb19JQ6PcPE2HqSW+UAF/nUnXISiG17bZg+3AT3zZIOigtZBe/7uO4jPFXAYB
	CAuuZUlfuAFplah9ClDfhHwJQ16oCulbkgSESB4la8LzAHbhfrA+yivvts+t4Vkt4jK6MxI+5BqNF
	ZjLwJ6rvrihcl6HA0IBhHmraT8QlaU+sAgCDTm/ZL9Ef+jxdvQSaq9bXUQMfxeUvIZsLkJTaFv5wA
	t5ednKG2pfIGG83Zq3WAwS3JmZ1uPysgbh7iE/PKyYP0UI7bFLXeNVW+ORMeqcreD3tnzteuB/eTo
	29nUYGuVRgkGcdiAvMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsWL-005RTx-14;
	Thu, 13 Apr 2023 08:41:33 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsWI-005RPI-0J
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 08:41:31 +0000
Received: by mail-ej1-x62a.google.com with SMTP id sg7so46910505ejc.9
        for <linux-riscv@lists.infradead.org>; Thu, 13 Apr 2023 01:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681375285; x=1683967285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YiS7Xw21QmvVwpdnupwEjvYWlLbUE4ktfUHhlm6JOgE=;
        b=F3mLl0gwsnOMzwO1LNzFYYunfYUPEBGQSqbjGMGBJ3easv+cvP3SQNETEyZCbkETDE
         baYq60zQPa6LCLZlXHb/5/Nja7YloC60Rl6J92K2iR9c5+0OKWeTvqmIzFDqt53MbRCz
         l6otRVMxZDQ6obrBIq8Nps4mWafK4gXBBYLGhBOYJrfwGLQH5Oo1JCVzAPl4LpgSsj/c
         p8bSwJLo5T4lw2Edqno2ArBV/XrOOtLgMgllzYTCiQBc1YMUcE847WpoeFXIUkyRVxNg
         Zi6xRqNQ9IElsOxjEzLBLhoN7yD8gdCB1HByvnULBHHyrx9Z2+rSTMfCupGQ24tXLyMq
         Z7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681375285; x=1683967285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YiS7Xw21QmvVwpdnupwEjvYWlLbUE4ktfUHhlm6JOgE=;
        b=A3l/Fe3KJLpxa66f2/GahkF11I9nS5nYbUZBvdhV0++8ychnVUmHgJZ1hlVVJW3FrN
         ASJvwLhElyqiJl82CzcDTIINQytOT54F4AF3rZr/8B5ijuq2I9BnXbZ334E6xiadW0cA
         n7nP+UFIwQPArr6swLpxfH/F58PP9F2bCI5U0OIK/vaNoB93pRY4EiYY4wcaggquvI61
         h2Pe0SuwsmOs0of/PRYlGiZxy1CJpJekQUv6rUZh1Wlp3XWiJbd7vILN9XQ9/K5IayfE
         Qapx3PElVgGKJhJwc1pLvnsyTWaBEJiDa0XQ/PZhkukOrJeT7rOqg6FMY5IS4kfBWjuJ
         uaeQ==
X-Gm-Message-State: AAQBX9cmz8lzr98gc+L8fGLrXOpsQ1BRUvlrAB7K2X8yvhtxqhLyhw+O
	XuWeKNcb8WPpX3FRDs8opPbvRA==
X-Google-Smtp-Source: AKy350bmE9xQnGU95nbPNivIp2OLCSM++q4Lju3jiZDXhGN5bSr9CoB4c7u3UIn/8rWC80ung91WjA==
X-Received: by 2002:a17:906:4bca:b0:94a:3ff1:53ad with SMTP id x10-20020a1709064bca00b0094a3ff153admr1989086ejv.75.1681375285316;
        Thu, 13 Apr 2023 01:41:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7? ([2a02:810d:15c0:828:ec6f:1b33:ab3f:bfd7])
        by smtp.gmail.com with ESMTPSA id k13-20020a17090632cd00b0094e96e46cc0sm636865ejk.69.2023.04.13.01.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 01:41:24 -0700 (PDT)
Message-ID: <f0d82428-aaa5-3dd4-bc29-f1057fe749bc@linaro.org>
Date: Thu, 13 Apr 2023 10:41:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Content-Language: en-US
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jack Zhu <jack.zhu@starfivetech.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230412084540.295411-1-changhuang.liang@starfivetech.com>
 <20230412084540.295411-2-changhuang.liang@starfivetech.com>
 <8dd0dc63-e0df-8764-f756-da032d9d671c@linaro.org>
 <eb47b7c7-bdbb-92d9-ba39-604ce487f297@starfivetech.com>
 <f6a4fb28-d635-4d99-44bb-d929cb41eef2@linaro.org>
 <b34a8d59-34e4-8358-9d2b-367f4707ca7c@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b34a8d59-34e4-8358-9d2b-367f4707ca7c@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_014130_147540_0B4A0266 
X-CRM114-Status: GOOD (  10.38  )
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

On 13/04/2023 04:34, Changhuang Liang wrote:
>>>>> +  lane_maps:
>>>>
>>>> Why did this appear? Underscores are not allowed. It looks like you
>>>> re-implement some standard property.
>>>>
>>>
>>> Will change to lane-maps.
>>> Yes, according to Vinod advice, lane mapping table use device tree
>>> to parse makes sense.
>>
>> Hm, I have a feeling that I saw such property, so you should dig into
>> existing and in-flight bindings.
>>
>> Best regards,
>> Krzysztof
>>
> 
> A standard property? Like "clocks" or "resets"?

Like lane-polarities now submitted to one MIPI.

Anyway it does not look like a property of a board. You said it is fixed
per SoC, so it should be implied from the compatible. Otherwise please
explain in description and provide some rationale.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
