Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27FFC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZfoMGKCF8hSwHAwiDkvmO3uuUTCmq9BSi2tHpY+DiM=; b=ljM2l3bTkiQUWg
	DC/LRVaScOWE1lggbFQagf7AiIqQw7NZ9cyY/DWIarmkH9qmVVvKvxoPpxq2QDrDmvcXNEMRSs5Pe
	nAgMO2uyoJgkAij5SA3N0mwQMfJ2qCSvsicFJ8ykxIQNveWzloI5HJiNrc67GgW53uiGCQGey9oVN
	/G1dca28gITaJM4BBi7wc6g63sxevvKtLc+kIo0noJbeXDC3DT7rwNyMZYWb6UaqUv0N+YhnJ0zwN
	tgvh8jm71Gpib8rUEHt+9v0pqo/CZQBfIFhVz2tAeJ/0lVSPY73xSayGZ9wdnjKib4hWjiKH4U09y
	FKkBYxC/c+VtWSmWKfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peB01-008OC1-2N;
	Mon, 20 Mar 2023 08:36:13 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peAzx-008OBZ-0W
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 08:36:12 +0000
Received: by mail-ed1-x52f.google.com with SMTP id y4so43544657edo.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 01:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679301367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EXj7AxGe8a/AWVZK9V6ITMJ6vFa0cOONXWJXMR9eH6M=;
        b=ZQhU+h+p+BSi1x7xKlAkzSzjTnRY8ptpMPTRGk8YvWOgg0b+/aYcwerQJHi1ZHd+z8
         qwwCUJsC0K0/yb7Xz0Omts3aL/rg+/jOCtWGO6bmkSqbdBDqdYWbKnaK5bVubZ1pPEIN
         DZtvKYmzGG4xQEGvlN1f3HdYtKTlTRuYoz5gNPq6vI6yEp1xaV0B//MjZIeUZGyoxQkj
         kxgvWTmgAbJi1rHZqY5x4XAfCBilV1PCVogq5t1FTeeZHES5hKTDW/Z8JffY9w0MHtT+
         AzQxlbCK6yg/n32kMCwC6rDWc88qo52ruUtdU8okzrbqkNDmB1EnEd9yjCBzAkb6vvDO
         wF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679301367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EXj7AxGe8a/AWVZK9V6ITMJ6vFa0cOONXWJXMR9eH6M=;
        b=Gtyo2uFtXGgAvglxxsJhWijvSf7zY8/iS4kctcv+6rsQC8QT2354khDYYdZsSmGB5t
         XsaKrwqikDF0nCFVSOID233CXzjZlpklpD67x1Hf6oN/me5AJxSU71xb/4WjLx4ftgDv
         T7iSl9QXW4u1kO3i6e46b9XV3l2bS1vGkW6lF9vZ7yWA/I0AJTBIt1IJ5nDRM032eS0Z
         GnARqEGdqWw9C6sQ06lhd/QYZNZ99iOQH0fhiMRPqkDcnbrPqKFuuvJf445lh0o9f/MM
         erFzpgvHjnZDGfuNx1c/NX4jbTXugPCHas0uYE4hC+3MfkcVHKypW9mK/Ep94kIOI74j
         7CkQ==
X-Gm-Message-State: AO0yUKWN7w+gsoQZFQm++yrt8RYYwwi+Kfr8QlfL3Hg7NpNiKcbv3nHg
	zLZg/w8VLSwDCV5Dh7rtdYFEYA==
X-Google-Smtp-Source: AK7set+23hCkEkPd4JCHw6bubA3/j+6AoHuaXJw9oOpouh+B0Jv9DY4FNJBSb5CMIfZXywHy9tZ64w==
X-Received: by 2002:a05:6402:53:b0:4fb:4f1a:d4e1 with SMTP id f19-20020a056402005300b004fb4f1ad4e1mr10966091edu.37.1679301366716;
        Mon, 20 Mar 2023 01:36:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4428:8354:afb6:2992? ([2a02:810d:15c0:828:4428:8354:afb6:2992])
        by smtp.gmail.com with ESMTPSA id r29-20020a50d69d000000b004c2158e87e6sm4448985edi.97.2023.03.20.01.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 01:36:06 -0700 (PDT)
Message-ID: <8c5a7421-2948-674d-91a0-9cafe336401b@linaro.org>
Date: Mon, 20 Mar 2023 09:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/6] dt-bindings: soc: starfive: syscon: Add optional
 patternProperties
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
 <20230316030514.137427-4-xingyu.wu@starfivetech.com>
 <1f352445-4677-e33b-be14-c76bd7ffa188@linaro.org>
 <45221a1c-dc01-2759-3e32-658636625529@starfivetech.com>
 <a6b9bab2-4151-c811-85ff-2424866e21d8@linaro.org>
 <ce674ea9-41ec-2862-c39c-207f0b6c45a2@starfivetech.com>
 <a65697f4-0a75-23e2-517c-2784b0c382bc@linaro.org>
 <2eb0380e-bbb7-83fd-3916-9bdd8b068334@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2eb0380e-bbb7-83fd-3916-9bdd8b068334@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_013609_241331_3EEAB16E 
X-CRM114-Status: GOOD (  13.67  )
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

On 20/03/2023 09:26, Xingyu Wu wrote:
> On 2023/3/20 15:40, Krzysztof Kozlowski wrote:
>> On 20/03/2023 08:29, Xingyu Wu wrote:
>>> On 2023/3/20 14:37, Krzysztof Kozlowski wrote:
>>>> On 20/03/2023 04:54, Xingyu Wu wrote:
>>>>> On 2023/3/19 20:28, Krzysztof Kozlowski wrote:
>>>>>> On 16/03/2023 04:05, Xingyu Wu wrote:
>>>>>>> Add optional compatible and patternProperties.
>>>>>>>
>>>>>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>>>>> ---
>>>>>>>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 39 ++++++++++++++++---
>>>>>>>  1 file changed, 33 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>>>>> index ae7f1d6916af..b61d8921ef42 100644
>>>>>>> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>>>>> @@ -15,16 +15,31 @@ description: |
>>>>>>>  
>>>>>>>  properties:
>>>>>>>    compatible:
>>>>>>> -    items:
>>>>>>> -      - enum:
>>>>>>> -          - starfive,jh7110-aon-syscon
>>>>>>> -          - starfive,jh7110-stg-syscon
>>>>>>> -          - starfive,jh7110-sys-syscon
>>>>>>> -      - const: syscon
>>>>>>> +    oneOf:
>>>>>>> +      - items:
>>>>>>> +          - enum:
>>>>>>> +              - starfive,jh7110-aon-syscon
>>>>>>> +              - starfive,jh7110-stg-syscon
>>>>>>> +              - starfive,jh7110-sys-syscon
>>>>>>> +          - const: syscon
>>>>>>> +      - items:
>>>>>>> +          - enum:
>>>>>>> +              - starfive,jh7110-aon-syscon
>>>>>>> +              - starfive,jh7110-stg-syscon
>>>>>>> +              - starfive,jh7110-sys-syscon
>>>>>>> +          - const: syscon
>>>>>>> +          - const: simple-mfd
>>
>> BTW, this also looks wrong. You just said that clock controller exists
>> only in few variants. Also, why sometimes the same device  goes with
>> simple-mfd and sometimies without? It's the same device.
> 
> Oh yes, If modified to:
> 
> oneOf:
>       - items:
>           - enum:
>               - starfive,jh7110-aon-syscon
>               - starfive,jh7110-stg-syscon
>           - const: syscon
>       - items:
>           - const: starfive,jh7110-sys-syscon
>           - const: syscon
>           - const: simple-mfd
> 
> Or:
> 
>      - minItems: 2
>        items:
>          - enum:
>              - starfive,jh7110-aon-syscon
>              - starfive,jh7110-stg-syscon
>              - starfive,jh7110-sys-syscon
>          - const: syscon
>          - const: simple-mfd
> 
> 
> Which one is better?

If aon and stg are not supposed to have children, then only the first is
correct. It's not which is better, the second is not really correct in
such case.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
