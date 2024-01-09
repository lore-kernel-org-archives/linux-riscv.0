Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D640C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 08:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlU5nzn3DiAY2FwROAGq4ejxrR+GDbl8Xp+ggkz8PIs=; b=tFLx5PPIlv4p0C
	jDnLdxrCNO5e/gnweazXInDhVngrYLNvl5+g3L0G74kTYaR5zcSU+Sxr8UidYiur7T/er5mPUx0Nx
	CgPQlJRiqyR6Wji3+McDR9umJKJCFZNcOzw/4N5qyeXctXroynmNsWMZPM2IEfsLmlTHwN+SQepH9
	939kG/q9cr19OInQF0jfNPp7pkI+mCJnCtL0Xxjgitm+I2fcfoazsS9TFTr9SJw721IpcCiN5Ok6/
	DjXnII6IsHCfUH4hY1irLKtqM7oGqSlIs3wj1sNKhD7ZHSd0vwVDgVdLOPsaDP8PNZyJOjkkNW/w/
	F1feO2qxn46q8vqj0lOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN7ut-007QH5-2Q;
	Tue, 09 Jan 2024 08:56:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN7uq-007QGY-1V
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 08:56:58 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-557d554ca30so1465824a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 00:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704790615; x=1705395415; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dKgg+2GKDq0kk13iBUWOueil8El7qTEVKxEgShYbxp0=;
        b=mU72QsxFpeTWaWWCFaV03aVMbnTkqeYLA62boanILmyZcJdCv7/YGktlFU9Uz5lUbT
         yFoluF39PyhM9SJO/6G3xzgRrWMzhHEC5oENYRotwJ7ybGyqCf1Vh9S3uYh7+OQvT93R
         nAOQhTua8T2e+9cL5zAvfdhRDeZwArA/TcphSSxfVd04f+l1c5ocx6dIdXpBN9/lukmM
         r7o2I7LmBfANo8IqqgkpsBHriijpAGd9dzMMe7PQTiy8YAtvDrHnInrrnG/MtNguyoHj
         YsV4Pnbj3eMQj4VniG9k327H0NGSus7COM80+UMKGDUhX+lJqJtLx5XmKKRXz8q18I1n
         paPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704790615; x=1705395415;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKgg+2GKDq0kk13iBUWOueil8El7qTEVKxEgShYbxp0=;
        b=smCn3JLwwnSOZmA75y6ePactNEFHiGheM+/lZBcViGQg4JPPsPxmcU3Gssy+7jpDkq
         GrgGUhSYpQ4lWvigmYxiz7vu5VUYrtwnGnC2ORry0xEL9pcdYFx45akfUQzjUYngP+aP
         WPRo5ZA8yc0wQAiV+szV6FA/nQEpBWU5kltL4YExxlO8WL1QW6IB+9VtGgVcqnT1LmVO
         VryqffP+vomEohyDQx5TNuv4ibH6aBvX6974YuaDG5Nmaxx3+25yvbeTsBMGaSN8JI8C
         HKyoF3LwY9R9a44tR/wihVbjwePzd/thX++jHuqQ8WcAqBEs3R4HJtSGxmv4FMVbCk/n
         yraw==
X-Gm-Message-State: AOJu0Yxzc1SyqCgo7XxY5To4GwLtfzX5z/WM5HLEH4m6N6VYoJGzvtWR
	wljk1DqDsBejr/jO8+3dFlKV7oaPj8yhBQ==
X-Google-Smtp-Source: AGHT+IHz0TCqQDlwZDW4omWfm9Y62o1hS7WWo/zdgnbnHxIsvEXfeJD05+IQaIfaMNkuInmcLf7qHg==
X-Received: by 2002:a50:8a95:0:b0:557:1b28:3c70 with SMTP id j21-20020a508a95000000b005571b283c70mr2908170edj.29.1704790614707;
        Tue, 09 Jan 2024 00:56:54 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id es13-20020a056402380d00b00557535489adsm733350edb.37.2024.01.09.00.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 00:56:54 -0800 (PST)
Message-ID: <60abfdcc-3d61-4df1-b77b-23d4a5d26a46@linaro.org>
Date: Tue, 9 Jan 2024 09:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] dt-bindings: soc: sophgo: Add Sophgo system
 control module
To: Chen Wang <unicorn_wang@outlook.com>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
 inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1704694903.git.unicorn_wang@outlook.com>
 <acebc88db3e5fcd2a2607b56842af7443a6e1289.1704694903.git.unicorn_wang@outlook.com>
 <cc7cc943-7242-4fd1-9b56-3ece0a418e05@linaro.org>
 <MA0P287MB2822E54A6DD36F914DB56E98FE6B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <1e1ef0a0-6639-4a4d-9b4e-50bcee3fb3c5@linaro.org>
 <MA0P287MB2822C1F51E9F03137EF42093FE6A2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <MA0P287MB2822C1F51E9F03137EF42093FE6A2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_005656_575799_EFC55D00 
X-CRM114-Status: GOOD (  16.79  )
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

On 09/01/2024 09:52, Chen Wang wrote:
> 
> On 2024/1/9 3:36, Krzysztof Kozlowski wrote:
>> On 08/01/2024 08:20, Chen Wang wrote:
>>> On 2024/1/8 15:03, Krzysztof Kozlowski wrote:
>>>> On 08/01/2024 07:48, Chen Wang wrote:
>>>>> From: Chen Wang <unicorn_wang@outlook.com>
>>>>>
>>>>> Add documentation to describe Sophgo System Controller for SG2042.
>>>>>
>>>>> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> ---
>>>>>    .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     | 34 +++++++++++++++++++
>>>>>    1 file changed, 34 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..1ec1eaa55598
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
>>>>> @@ -0,0 +1,34 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-sysctrl.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Sophgo SG2042 SoC system controller
>>>>> +
>>>>> +maintainers:
>>>>> +  - Chen Wang <unicorn_wang@outlook.com>
>>>>> +
>>>>> +description:
>>>>> +  The Sophgo SG2042 SoC system controller provides register information such
>>>>> +  as offset, mask and shift that can be used by other modules, such as clocks.
>>>> "offset, mask and shift" is not a register information stored in
>>>> syscons. Are you really sure, that your system controller hardware
>>>> stores offsets of some other registers?
>>>>
>>>> Show as some example of such offsets, masks and shifts provided by this
>>>> hardware.
>>> The system control module is defined here:
>>> https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/system-control.rst.
>>> It contains some registers related to pll and gates.
>> I do not see there registers providing shifts and offsets... just values.
>>
>>> Some other clocks registars are defined in
>>> https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/clock.rst.
>>>
>>> memory-map is defined in
>>> https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/mmap.rst
>>
>> Please fix the wording because it does not make sense. System controller
>> does not provide register information. Your datasheet provides register
>> information.
> 
> Could it be that what I said "that can be used by other modules, such as 

modules as Linux modules should not be involved in this description.

> clocks." may cause misunderstanding. I plan to change it to "The Sophgo 
> SG2042 SoC system controller provides register information such as 
> offset, mask and shift to configure related modules such as clock." Is 
> this better?
> 

Still does not make sense. To provide "offset" means that some other
hardware reads sophgo module to get the value of offset. That's not the
case here.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
