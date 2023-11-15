Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAFAC072A2
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 21:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rkIXXv/z1kwo3nWmSUfJXn6ZW2OAw8gfhKr0yQHJLUw=; b=CjVnLI6mEDDYX8
	gYv/mW8ns+5mWZIs/TCm2k4pU2EI3Ra0FEcyw2UWr3PfKnWQknGNPEkWMdb4sSHvK1+Lprm18340I
	/xEpOoUxN/bIfDhQMhimhOLHCmSGF6gWGo1x4JsLaqFcd8DIjv8CU9sieW+Uyf526XrdAA8YqURyJ
	XLfNY4zzdiVl+cUMOndjo8bLr0IgK/GP8Lx12i+pvDNu7H3tKIRgMIGsLfrEMdPv4ynr6f/0mPOsL
	t5CDRR6NXeIbopZMN9XFD+Ksyo3tcdyHJRpp2oZjk1FG4BHs4a6E4qqtSzn0oKlfaA899opjpduVz
	F9hthsZew/UPtRfLm1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Mzr-001ipr-1Q;
	Wed, 15 Nov 2023 21:00:27 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Mzo-001ip5-25
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 21:00:26 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-66d24ccc6f2so11656556d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Nov 2023 13:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700082019; x=1700686819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+WC2Zj75Zg21qI6EGfizkP9vCMfRFqtrZKpHL3RY1XU=;
        b=Q+PZHWHBmltfSbb+QxZoJ4riHfUto6kntVvYog1+0nKo9ie4y9HYHrwKP6jHy/buvn
         5oSfZW3U9omy42T+FlyajIoRa4wBx92AOsqcm8Eme9gpevRzsxC1cDZfjf4R+A3ffNY5
         wefyNX9J8wopFGISFwdQXiokxGXwihwaner9cuysLOaOH8N+z7D12qmHEoVsVSIEJ85L
         55FdF1X5D6MaDT8fCLW87UF1w7bfIeZM29UAZUD4NEdV3Jt6Prz3q6zgZZWJ0ey9/iFW
         Th9GF7Hm/q+eteGspaOYD4Dfj2cfDwIJqoIr2MOBHOKxRM4ma64GCsril8NwUWua7axl
         b9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700082019; x=1700686819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WC2Zj75Zg21qI6EGfizkP9vCMfRFqtrZKpHL3RY1XU=;
        b=Ec9ufJLVVPfBGH728qJXcUNWHoxIQbFUXRJB81w/Jx3wvw6brXMbBCko9fnwU9Rcjk
         M9j2g9OlI0ltFxieXXYJ8kVYEKYh0cYo5cG+d3bqNlNc/GWRZ4G37owh39nOXS4mg9aH
         GhidBDk1C56MBA3VemXHJgO6peTrNpxbPV5QZD115pRSt3KghoIB4Xk2Rn8fJVOdqx7E
         8l9DRIbph/uNsyZGw6GHnc1xfD9jo9gAl1KID7N4+S7LrwGU6iMk0t++5vYjzRiAskF8
         cv6BSBlMMSgJ2GWUyrDJpocuHewE/z1oLMUBafaLJubw3q4ZTC/wcTM7Y0CbiNvSlj8R
         uQvg==
X-Gm-Message-State: AOJu0Yz9HSTogT/QaDNaTXnO7ZJCakgjVgrD96DQ9NY+x11vgeA59b8s
	b5ach9E9Y9gdlf0PBv3cf4ZK8g==
X-Google-Smtp-Source: AGHT+IGyIImYCJRiaiOwlcbVtwJGIaV+IQj7+AdQbDrTjC7TSnYIQjxJqmJCtIYCcV19/TNVPE/C8A==
X-Received: by 2002:a05:6214:1706:b0:66d:6a92:16c2 with SMTP id db6-20020a056214170600b0066d6a9216c2mr11472607qvb.8.1700082019450;
        Wed, 15 Nov 2023 13:00:19 -0800 (PST)
Received: from [172.25.83.73] ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id j11-20020a0ce6ab000000b00655ec7bbfd0sm824726qvn.7.2023.11.15.13.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 13:00:18 -0800 (PST)
Message-ID: <42ad3f60-2755-4d3b-a766-8e4404f76a7c@linaro.org>
Date: Wed, 15 Nov 2023 22:00:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: reset: Add binding for Sophgo CV1800B
 reset controller
To: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
 Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20231113005503.2423-1-jszhang@kernel.org>
 <20231113005503.2423-2-jszhang@kernel.org>
 <44f21244-5bf1-4e0f-80a9-6ec76d65eea4@linaro.org> <ZVTHMsXaPdHiuUOF@xhacker>
 <80e28d77-4a0e-4827-91c0-951094176bbd@sifive.com>
 <20231115-upward-unsworn-7746e0aeb5dd@squawk> <ZVTgfzeK6GkKpArK@xhacker>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZVTgfzeK6GkKpArK@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_130024_692915_31C5DC86 
X-CRM114-Status: GOOD (  23.13  )
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

On 15/11/2023 16:15, Jisheng Zhang wrote:
> On Wed, Nov 15, 2023 at 03:02:21PM +0000, Conor Dooley wrote:
>> On Wed, Nov 15, 2023 at 09:56:07AM -0500, Samuel Holland wrote:
>>> On 2023-11-15 7:27 AM, Jisheng Zhang wrote:
>>>> On Tue, Nov 14, 2023 at 10:12:35PM +0100, Krzysztof Kozlowski wrote:
>>>>> On 13/11/2023 01:55, Jisheng Zhang wrote:
>>>>> ...
>>>>>
>>>>>> diff --git a/include/dt-bindings/reset/sophgo,cv1800b-reset.h b/include/dt-bindings/reset/sophgo,cv1800b-reset.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..28dda71369b4
>>>>>> --- /dev/null
>>>>>> +++ b/include/dt-bindings/reset/sophgo,cv1800b-reset.h
>>>>>> @@ -0,0 +1,96 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>>>>>> +/*
>>>>>> + * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
>>>>>> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef _DT_BINDINGS_CV1800B_RESET_H
>>>>>> +#define _DT_BINDINGS_CV1800B_RESET_H
>>>>>> +
>>>>>> +/*				0-1	*/
>>>>>> +#define RST_DDR			2
>>>>>> +#define RST_H264C		3
>>>>>> +#define RST_JPEG		4
>>>>>> +#define RST_H265C		5
>>>>>> +#define RST_VIPSYS		6
>>>>>> +#define RST_TDMA		7
>>>>>> +#define RST_TPU			8
>>>>>> +#define RST_TPUSYS		9
>>>>>> +/*				10	*/
>>>>>
>>>>> Why do you have empty IDs? IDs start at 0 and are incremented by 1.
>>>>
>>>> there's 1:1 mapping between the ID and bit. Some bits are reserved, I.E
>>>> no actions at all. Is "ID start at 0 and increment by 1" documented
>>>> in some docs? From another side, I also notice some SoCs especially
>>>> those which make use of reset-simple driver don't strictly follow
>>>> this rule, for example, amlogic,meson-a1-reset.h and so on. What
>>>> happened?
>>>>
>>>> And I'd like to ask a question here before cooking 2nd version:
>>>> if the HW programming logic is the same as reset-simple, but some
>>>> or many bits are reserved, what's the can-be-accepted way to support
>>>> the reset controller? Use reset-simple? Obviously if we want the
>>>> "ID start at 0 and increment by 1" rule, then we have to write
>>>> a custom driver which almost use the reset-simple but with a
>>>> customized mapping.
>>>
>>> There are two possible situations. Either the reset specifier maps directly to
>>> something in the hardware, or you are inventing some brand new enumeration to
>>> use as a specifier.
>>>
>>> In the first situation, you do not need a header. We assume the user will look
>>> to the SoC documentation if they want to know what the numbers mean. (You aren't
>>> _creating_ an ABI, since the ABI is already defined by the hardware.)
>>>
>>> In the second situation, since we are inventing something new, the numbers
>>> should be contiguous. This is what Krzysztof's comment was about.
>>>
>>> For this reset device, the numbers are hardware bit offsets, so you are in the
>>> first situation. So I think the recommended solution here is to remove the
>>> header entirely and use the bit numbers directly in the SoC devicetree.
>>>
>>> It's still appropriate to use reset-simple. Adding some new mapping would make
>>> things more complicated for no benefit.
>>
>> Further, I think it is fine in that case to have a header, just the
>> header doesn't belong as a binding, and can instead go in the dts
>> directory.
> 
> Hi Samuel, Conor,
> 
> thanks a lot for the suggestion!

There is actually a thing here I missed. If this is a reset-simple
driver with dedicated SoC-specific compatible, you could want to have a
binding header to have IDs. This way later you can easily replace the
driver with another implementation, which does no rely on 1-1 mapping to
reset bits.

Therefore the reset-simple could be the exception where reset-bits could
have a meaning as binding header.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
