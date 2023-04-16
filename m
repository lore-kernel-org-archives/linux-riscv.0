Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E590CC77B61
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Apr 2023 17:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/UV1IBd2DsNMz7GUXgTTN4Mw4xg1dbiEecD0Xg+Vq0=; b=CszIYFGrFdbc7y
	fYbJ4QYvL62SJaFFT2Defil6AhvLV5kLqZojQhp1LE74Tlu/YL+nkuzf4MBb5EG8Ivb2jxecJ/Pd0
	p0hEUOXwRSVjHnKhw+HThqMtbU225heeBQf2G0QzJwUHCWpYW/OwXN3P9NbD+Lomgpyh9i3qHT+PY
	A8FcvJvakigxnQc6aaLNkhKJKpUNgxJM7b8T3xCRWkHA2pzGrWkyJlMpwfIEHIipmoCe1+hamzLj8
	xz81wc1X6Pwng23BmlSnuxxpHkzwIIaYi5CP4S8bim/j92PKUQR+3+udAsqTdWeZnKkARKEyy45z3
	eLO7n/PMKuDTXPAqnIrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po6C2-00EBiC-0w;
	Sun, 16 Apr 2023 17:29:38 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po6Bz-00EBh8-1P
	for linux-riscv@lists.infradead.org;
	Sun, 16 Apr 2023 17:29:36 +0000
Received: by mail-ej1-x631.google.com with SMTP id u3so6386034ejj.12
        for <linux-riscv@lists.infradead.org>; Sun, 16 Apr 2023 10:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681666174; x=1684258174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ALGubGI9vcPFVNhBw3xYsBRMIAknnF9aicGsi1XUPLk=;
        b=sMuKVfCxr89Rs5nPX29H3CNTFQvBvR/XM4KqkDBiCu3zHbHhec+m6gNXeH8Zro6/hP
         AihhHjRPgDkJMjkI9u+4MLflks+a3mpVBvuGtxpTgNNGVTSObVXzkGGaz7a2JUv7qXlL
         ck4H9Pehfnd6zoAs7HLhocAskPw2zuiFDODfK63C8a+ttTQd2kG9jUvcK8TuiQfejL12
         Iyi6hcI7sHL7i7GHwwqVBigCeaPwPbl2UAZscjInSEvlGpRjCKkNjXCYYVhBTHAUrtwY
         up30+jmftwHc5xx/Vx/sX4QcSUcACPcmCemhZyfGVGReFJiD62AG5oi5XkFEDBOmFG0F
         Mr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681666174; x=1684258174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALGubGI9vcPFVNhBw3xYsBRMIAknnF9aicGsi1XUPLk=;
        b=h3vQoQZBYZRxAqdpOcpaKjiKeznwJVC8Dxx/D1oY22YhTVQjxcaxYNZz5Lusa/v+O6
         BCTuwzGtzcEsrFxAwFiAPpDJExuj5FYV4NNtJOGztjbhbQZUQNz45PE1gfXw0onBl6O1
         wEwa8cX58xhTPnyIhFg1krlmRladZJWI8rYt0C798B8XJi9ZGdF6eT13knG8j0YhUuzN
         zfSgdfK5PyOmv0J7K5+UAaWvihd9NJeXJunBhz/VEokFYc2qZaNktB+cE0Z6wvMILKuP
         BboNbK7DWRe3PifKFBAI9PwMtJFMdSPPVJUk/zj54bPI1Szkf2rY9oZR3AMie1ZA9VrL
         Tf9g==
X-Gm-Message-State: AAQBX9c/fc7M6kgVLeG66+Z53JBjxWVVrCzb/JQgPV/E560GS8rsNBt5
	7wr2QHUPLzTqgAD7wgTNB2zF3g==
X-Google-Smtp-Source: AKy350YFnbIUE8o83ZkVTdY4/9rW/e7dq7GqM6STdl/F8jdbMAVS3RxyoIDP9UaCahROrbK+1R6w/Q==
X-Received: by 2002:a17:907:2089:b0:947:a6d7:e2b4 with SMTP id pv9-20020a170907208900b00947a6d7e2b4mr4755130ejb.8.1681666173907;
        Sun, 16 Apr 2023 10:29:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id h20-20020a1709067cd400b0094a86ccb634sm5278610ejp.210.2023.04.16.10.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:29:33 -0700 (PDT)
Message-ID: <31c582a7-682a-330e-51d4-53b4a0c5f3a2@linaro.org>
Date: Sun, 16 Apr 2023 19:29:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
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
 <f0d82428-aaa5-3dd4-bc29-f1057fe749bc@linaro.org>
 <0c94aadf-fac3-d05c-1c54-ae8337526849@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0c94aadf-fac3-d05c-1c54-ae8337526849@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_102935_478548_C0EF4222 
X-CRM114-Status: GOOD (  16.48  )
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

On 13/04/2023 11:02, Changhuang Liang wrote:
> 
> 
> On 2023/4/13 16:41, Krzysztof Kozlowski wrote:
>> On 13/04/2023 04:34, Changhuang Liang wrote:
>>>>>>> +  lane_maps:
>>>>>>
>>>>>> Why did this appear? Underscores are not allowed. It looks like you
>>>>>> re-implement some standard property.
>>>>>>
>>>>>
>>>>> Will change to lane-maps.
>>>>> Yes, according to Vinod advice, lane mapping table use device tree
>>>>> to parse makes sense.
>>>>
>>>> Hm, I have a feeling that I saw such property, so you should dig into
>>>> existing and in-flight bindings.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>> A standard property? Like "clocks" or "resets"?
>>
>> Like lane-polarities now submitted to one MIPI.
>>
>> Anyway it does not look like a property of a board. You said it is fixed
>> per SoC, so it should be implied from the compatible. Otherwise please
>> explain in description and provide some rationale.
>>
>> Best regards,
>> Krzysztof
>>
> 
> This property is the only one used for this IP, I have compared this IP with
> other DPHY rx module, DPHY modules form the other manufacturers not have this
> configure.
> And we also have a SoC called JH7100. It DPHY rx module is the same as JH7110.
> But we don't do the upstream work on it. If it use this lane-maps will be 
> configure as "lane_maps = /bits/ 8 <0 1 2 3 4 5>;".

And JH7100 is different SoC, so you have different compatible. Again -
is this board specific? If not, looks like SoC specific, thus imply it
from compatible.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
