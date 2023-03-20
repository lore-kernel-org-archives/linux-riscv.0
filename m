Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C26AC7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 06:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJBpbnGwwkBiyUiu2UvxTWRUWpU+NKKoPTsoFYbSQDE=; b=LTc1Gs9ZgX9l81
	Po4CpbXpIVHoFynozrjzIP2V7pWsbNvkaMrBDcYILApTIRWD8Hk1VOM0JqupqTXQA9dPhY3YPASQ8
	Py9gy5gghQUK2u/xCqtWKpHk2Odg2YYHZ5HkdEwosXCybSpjhi2hBFcM7UFOtSFyj0zYisJ4Q1G6P
	go9PliBqY8gPiFh8TPss5T1S/51N5LZCvXrE/4Tf1I60ASBrbFa7LBChP9U9ulXI2va+pT7gJa53X
	OYCEaKeWj5GA7RtVJNnDP/9IbezefFnTBYvJBLRasQGZC2cFg+/TBcIiD9QycWm20Ke6pGgPEryg3
	eH52tSRBJ6Pz9KIHR3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9AC-008F07-1T;
	Mon, 20 Mar 2023 06:38:36 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe9A9-008EzY-05
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 06:38:34 +0000
Received: by mail-ed1-x52a.google.com with SMTP id cy23so42384835edb.12
        for <linux-riscv@lists.infradead.org>; Sun, 19 Mar 2023 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679294309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7XeoSe7UBuX/qyHKNlFZtj5mQnbrycYOrmZq1cWzw8=;
        b=og1arrjvv3V1NdTKTL6nqWdto4cJlvx1lJaOUNCZQU3G6Z+9CVFWBZwA9KKnSw9aCN
         AG75/Do04vm1Qf4H6oTVavstgAkPq6nCdoXdzjjkRh3Hnod3I/hA70S3G5qRXRazZ3ov
         eDALdS055/VHd+mWMubR9Dg5B1MNq1EfJKbUtmWmPaZzxSpEGUa9h5RCr/K9i48XzaJ3
         eA4n/AbtFz9gQv4nRpJZ1B2daPdP2um5KxxScW7XpjE76P2aZDJkuc+91Mze3/Uz0Mvk
         OLvcAyE258gGyChEZjewf1ULjk0gfkA/IEMNzI4ItXaPGyH+bLbNBtqEkQg0UvfJ77S8
         bz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679294309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7XeoSe7UBuX/qyHKNlFZtj5mQnbrycYOrmZq1cWzw8=;
        b=2L4GV9EoYKA9gVsKmZyVPeeZkOwRpw4OKXgTVv6ohWfO2H3xomIpMygqjMLm1VdVGN
         N0L3VbY8IFgO0mYqifzBLTJs9Zs+/G6rWeefkZVNcQQdwzp2Bdu+feMDQaBILBXII5Na
         acHJZMDKlqsMN1ESwO3jpZpgOCf+ugaAqSRz2a15i/7vWCR5brPxmv+Ta0chImw5Nuhu
         kqrLbwjIz72eZr8M32XqdTCandq55y1hyWan+IdxDH3WydgPFuRv4NL/t4d5AJuf8r0x
         J1L0HG4xixmBGv1FTbhfE/WZWOXLlt6YTe5UFCugBU5cMHMnJNt1vUx49xxiAdC+jwpH
         QfjQ==
X-Gm-Message-State: AO0yUKXfBYS7Mt1jxyzElM7AaAEbg+mVZsj3F01FyHO8Z9vpgNUaBfiU
	eMgxecdNhPxskuJjrD/4/GPR7w==
X-Google-Smtp-Source: AK7set8zaCmvCo/leOy8Mug11ajTRxSNFLkO0e1EhQz95/FxfjvSuWjkKWa7MhfAtVfj+tsoVUmaGQ==
X-Received: by 2002:a17:906:1f53:b0:931:91a:fa4f with SMTP id d19-20020a1709061f5300b00931091afa4fmr8592424ejk.41.1679294309064;
        Sun, 19 Mar 2023 23:38:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4428:8354:afb6:2992? ([2a02:810d:15c0:828:4428:8354:afb6:2992])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906300800b008e2dfc6382asm3967122ejz.125.2023.03.19.23.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 23:38:28 -0700 (PDT)
Message-ID: <f25cc55e-3405-4b17-fb45-5ae5eb36a404@linaro.org>
Date: Mon, 20 Mar 2023 07:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RESEND v6 1/2] dt-bindings: soc: starfive: Add StarFive syscon
 doc
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
References: <20230315055813.94740-1-william.qiu@starfivetech.com>
 <20230315055813.94740-2-william.qiu@starfivetech.com>
 <850bc37e-c6d1-2381-a851-965a4cbee8a0@linaro.org>
 <e38efd81-9c79-553b-7556-7aff30f6ec50@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e38efd81-9c79-553b-7556-7aff30f6ec50@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_233833_093635_9B499D68 
X-CRM114-Status: GOOD (  13.68  )
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

On 20/03/2023 06:54, William Qiu wrote:
> 
> 
> On 2023/3/19 20:27, Krzysztof Kozlowski wrote:
>> On 15/03/2023 06:58, William Qiu wrote:
>>> Add documentation to describe StarFive System Controller Registers.
>>>
>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>>> ---
>>>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 41 +++++++++++++++++++
>>>  MAINTAINERS                                   |  5 +++
>>>  2 files changed, 46 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>> new file mode 100644
>>> index 000000000000..ae7f1d6916af
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>>> @@ -0,0 +1,41 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: StarFive JH7110 SoC system controller
>>> +
>>> +maintainers:
>>> +  - William Qiu <william.qiu@starfivetech.com>
>>> +
>>> +description: |
>>> +  The StarFive JH7110 SoC system controller provides register information such
>>> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - starfive,jh7110-aon-syscon
>>> +          - starfive,jh7110-stg-syscon
>>> +          - starfive,jh7110-sys-syscon
>>> +      - const: syscon
>>
>> Does not look like you tested the bindings. Please run `make
>> dt_binding_check` (see
>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>>
>> ... or your PLL clock controller was not tested.
>>
>> Best regards,
>> Krzysztof
>>
> Hi Krzysztof,
> 
> I've already done`make dt_binding_check`, and get no error. So maybe PLL clock controller
> was not tested which I didn't add in this patch series. And PLL clock controller belongs
> to Xingyu Wu, I would tell him.

What's confusing you do not allow here clock controller.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
