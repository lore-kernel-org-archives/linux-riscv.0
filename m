Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DE9C282D2
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 14:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMmNnt10hICp4MagZFhlRhqsdkUmQMDQ1alHf4l0fDY=; b=eXm2iNfLkF1+K1
	r1fq5S2KEO5kPsJmMQd86x9hd8PrwcX9724eLCPBqWVKoqplWxlajLgG/NA1G8Y9mzUv6RPAWupk4
	IKDuqsieaUTqng4a83JIMMH2ROs4JGkksyjip+oUzcFc3ytewLoLEw3IJ7iueVR90MDFM4jUJbGNK
	Omv++HJTlKOmlj4MP3KaOABRkjwhlqa1YTVLimLT6Vnl7hj8r9kHbW03Xr/PAm0x/RxgTQLZ9x0Do
	khuqmRbAANdiCPwjwd1CEgvkT54Ku2zSXAr4BdyTTJZKtlRvy4pbtmekb2ngf7HdAyTd4VFEdl0o+
	TsDeWjxiVj4lbtkJ0ryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTCI-00000004yXf-1MsC;
	Tue, 04 Mar 2025 14:24:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTCF-00000004yWw-0a78
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 14:24:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43bc2f816daso2881775e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 06:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741098273; x=1741703073; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KTwOJrqmamZnp6Bot/ZyUgvSrbVR9/Qa0k7QMOX2SR4=;
        b=YmYZqQBPNzXA+hx4+KRMOihbp9VatKUyLTE3xWIgI898dfNvdNC5TVXjTRXsM4vsuA
         hLEAXGW/KXZqsyqscpY/8SYHKBQzEhRs6ai+c0mzSKjAU3OCoqXEsVvuX3Qo8slzlD90
         MPy8jZtoYt47J3jMy8zozC4tbvIkLC8EKpuOk+0vb+FIpX0iFgSLTAosZp1WjLFKr+sI
         M7CHK5anYoVnrBlwXJVNX9x2rFeOcQW9f3tr3E2x3Oy1ngewZ8TesCjp11Rq8/yPHSS/
         UUBmZkrZJcIAgeKurbHXtTgdIUxENxx0Pz+YRmcUSuJfZgJGu6rJ2PatXsVa2bifpB5L
         vhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741098273; x=1741703073;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTwOJrqmamZnp6Bot/ZyUgvSrbVR9/Qa0k7QMOX2SR4=;
        b=KhNUPk18xehXeqDvZ9Z8mmq8FTrEUkP9Cu6FDZnj20QVYut3sES8Y1oRWLKPbtgGtE
         G3h6rXHvAyRj2GTZe58TpbKVg+Ckkzbx8EZ5nufREIKQ4GXqPflpgE5JBbkEN/DhzbIy
         vdBIZktt1+RTuD941MPPDS4wkh7BcUg1XTRx431gilzLPRo6HKvoJ5sIUMfQbkzY/DRp
         iEA9Q/BQz1rIJfg4wJBbd8cSqWMTif7lthgUbDiw6gRbDzWvTlAquOtcMu2Zq/wH8/Sv
         p6zxJzvPm+Xa4qLd+JZZSCiXRSegoEErbuU7fACM7kAJcDqlRVlDpG5bkO1l5HQrmf3p
         y8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD7NMnp7sULNIy1sKpj3KGo4rC3kjvrEIr1X9IAtTaidlolymHBhr927V0IEz8yQS15AJsdqKBECAx1g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+jgioP5YS/5GPUh234/5cu2sHyFJVZzCenFdFNYptPbGkaS4U
	9rPhaTbDngMfzfW1KX6nA7qBjo4GGe+5ANYMP8KLpuiMn/HzWYGWK1mzbZeyr4A=
X-Gm-Gg: ASbGnctDss7ofvjJ2h2tpoViIsfOfa+lmeuwUAjNbkeKFcXIo1lfXOJLEsqr0d8T5e4
	4TAQIWlsAnS/N2XuQbZvbvrVK45XXdED409ikOVeehgOcRg/OuHotdQim2iSBNUC/dDpxlmZuzr
	+I84vGzo7A+9TbD18JBZEZ2Lv5v15Z+GdgQqjPhBGBIw/YEtjlAT1YTZ7BFsVfB6eBVzKg8pOSa
	XE/nFDwLqOm06CmVkwUbR/ZSwpK1dodWG1Y49HNNQs9D4mNiaoBkOA9il0P3dGlhBOEWA/KFYZ1
	IwEAMbhS2P27xEB126doIdVlRaOXifqkpUtX9MYqmS5tGzJMcDOfQ2Ad+KSr961h
X-Google-Smtp-Source: AGHT+IFj9ezRvL/GLf1WAnJfc8xPWJf43URunIbh41dUWBZ8qbLw/49jjj+OZEUxoVFQ7GuZnOV0Tw==
X-Received: by 2002:a05:600c:1c1c:b0:439:9a5a:d3bb with SMTP id 5b1f17b1804b1-43bcb9314b0mr10869245e9.2.1741098273370;
        Tue, 04 Mar 2025 06:24:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a28b285sm200979005e9.33.2025.03.04.06.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 06:24:32 -0800 (PST)
Message-ID: <31806087-fbe3-4631-9de7-7eb48955cf4e@linaro.org>
Date: Tue, 4 Mar 2025 15:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] dt-bindings: firmware: thead,th1520: Add support
 for firmware node
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, jszhang@kernel.org, ulf.hansson@linaro.org,
 m.szyprowski@samsung.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250303145901.446791-1-m.wilczynski@samsung.com>
 <CGME20250303145918eucas1p10f64b2ce75e395ce208439307daa8a8f@eucas1p1.samsung.com>
 <20250303145901.446791-2-m.wilczynski@samsung.com>
 <edb3dd6e-8b56-42b3-8bb2-8ed7ad186b75@kernel.org>
 <8dcdd2ec-e4b6-4fc0-be50-12fe187cd5e0@kernel.org>
 <99fcf36f-7fed-43e8-a94f-47563ab00fc6@samsung.com>
 <377951ad-341f-4e19-a582-a534567dc466@kernel.org>
 <08e5ffb9-2187-42b6-8090-9922b349fe2a@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <08e5ffb9-2187-42b6-8090-9922b349fe2a@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_062435_197681_EE1058E1 
X-CRM114-Status: GOOD (  10.31  )
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

On 04/03/2025 08:52, Michal Wilczynski wrote:
> 
> 
> On 3/4/25 08:45, Krzysztof Kozlowski wrote:
>> On 04/03/2025 08:43, Michal Wilczynski wrote:
>>>
>>>
>>> On 3/3/25 18:46, Krzysztof Kozlowski wrote:
>>>> On 03/03/2025 18:42, Krzysztof Kozlowski wrote:
>>>>> On 03/03/2025 15:58, Michal Wilczynski wrote:
>>>>>> The kernel communicates with the E902 core through the mailbox
>>>>>> transport using AON firmware protocol. Add dt-bindings to document it
>>>>>> the dt node.
>>>>>>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>
>>>>>
>>>>> How is this possible? That's v1 and I never review outside of mailing list.
>>>>>
>>>> OK, I found v5:
>>>> https://lore.kernel.org/all/20250219140239.1378758-4-m.wilczynski@samsung.com/
>>>>
>>>> so is this the same?
>>>
>>> Yeah, I thought by splitting the patchset and creating new sub-series I
>>> should start versioning from v1 again, and leave that bigger patchset as
>>
>> What was unclear in my "keep versioning and keep changelog"? How this
>> can lead to "start new versioning"?
> 
> OK, my bad misunderstood you. I don't want to spam too much so maybe I
> should wait if there will be any comments before re-sending with the proper
> changelog and version.

Just provide changelog as response to your cover letter.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
