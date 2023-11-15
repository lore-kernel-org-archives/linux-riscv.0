Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8834FC55825
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7vh0VcYJ4tFqjmLLWHzRVV055c3wA/bnChs3Oo72f0=; b=fPL7MZB+yfm4w1
	VEPokEj9csCWAErPSJ+XT80xgN7rSpvk00mibVAGKVVuXSs2uRTG8E10gQUvy/aDJeWgh/6Py9zHs
	J47GKjNyfn6zV7Mgfxz9JaP6JP7Q+m/zHchuOtGhLACdSwPL06O8IVAbywin5IydkQejpLNW3jed7
	db/aTEmu2qwFYsMe4WogqEzMgdBWfJsTIj/DyejpVeCJ56DvT3n4DqIlc0jz8g/+99kO65uADUjVD
	H8keAPnmpnjSLxzzjNFD44oL/luudYRN1NCDMtYK4843N+UxAAXTiLUPcFlfu8VhTsQOVZLwwX0in
	OEoACHpeEzY3tSbME0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HJT-00166z-1H;
	Wed, 15 Nov 2023 14:56:19 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HJK-001658-1l
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 14:56:17 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7781bc3783fso447626885a.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Nov 2023 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700060169; x=1700664969; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LYw3fruZIKBrugWEfHGbBIIgQ3aQxIxn476R1I+MuSA=;
        b=CQnpQTGaOa4t6q5MlFp2nwL0l3tKSj9NNa/cTiXHb3THZB1EYRAdX3KcFSZmP7NwK8
         5RbGo0IAmLK0bcI9EudOgI/oN/O12IvNUIW7CuVdeQIS9pEnCK0Zi7HKu/3h4ZPER47/
         IU1PpiVFWEpE61/IHcPnEMfUUih6yEQaR/77S223XnWIBbF50Wk0I9RunzhQXK2vS9p0
         dwTq/abljBnqrrhbOXigjr3uEqXv6rknd/O+oUbH3ztZBcWE6XqdhYOFkwRisVPhOWV+
         jYmnJLLTEQ5A2FAMfBovawYoOJ2NgzUbpJjuU5HiunDit/UMb45WlakeEp2DkuMrdtoz
         SHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700060169; x=1700664969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYw3fruZIKBrugWEfHGbBIIgQ3aQxIxn476R1I+MuSA=;
        b=YaafEnqcSjan0H5NCnSqqoHJVteL9sRac3NqWUeTnMjfWnDrcalpZr60LgCsIVkw5x
         NxF/VyjvHs/JLxaPCMIiXAPp+XlAYwjvw+h+kChT1iO0tdT3ZC740489f34GFqzWPWtr
         vglAIosJOdUoHHTm3m5+T3DO4YlT6XYCobzKJ7lsGxVMdpE8fhLI/2eVh/zmYxIjm/o2
         SGum4B1uptr5qIAfmawXQUDoXXj+Hse/wAoZ7sQ41Q2PRcaphZmFSFHJQ7b4nzvvwjjI
         7GUvKZ1Olf0Fh6vpkwLmXoVRY25UUSXLiehl5cdDVB2oNkzu+q90k+vKp2wb+m4OjrFN
         0tDg==
X-Gm-Message-State: AOJu0Ywk7YxzHc5J1gc8MqMxo4XO4/DAky3olS05heeLMcapE+QRTVB2
	rg7WSYQhRWXCi0qyQ2t2J5t8Mw==
X-Google-Smtp-Source: AGHT+IEFDVpHtVlgAbPgy73wLGlEXNTNl5nwmSpyi2HRg/iYoL6oC5CTqnlesfwOxLkjsjcnzYKbBQ==
X-Received: by 2002:a05:620a:6185:b0:77a:2c0:eb27 with SMTP id or5-20020a05620a618500b0077a02c0eb27mr5878498qkn.74.1700060168693;
        Wed, 15 Nov 2023 06:56:08 -0800 (PST)
Received: from [172.25.81.170] ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id z10-20020a05620a260a00b0076f21383b6csm3509671qko.112.2023.11.15.06.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 06:56:08 -0800 (PST)
Message-ID: <80e28d77-4a0e-4827-91c0-951094176bbd@sifive.com>
Date: Wed, 15 Nov 2023 09:56:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: reset: Add binding for Sophgo CV1800B
 reset controller
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
 Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20231113005503.2423-1-jszhang@kernel.org>
 <20231113005503.2423-2-jszhang@kernel.org>
 <44f21244-5bf1-4e0f-80a9-6ec76d65eea4@linaro.org> <ZVTHMsXaPdHiuUOF@xhacker>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZVTHMsXaPdHiuUOF@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_065610_588631_B9C3FA1B 
X-CRM114-Status: GOOD (  22.17  )
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

On 2023-11-15 7:27 AM, Jisheng Zhang wrote:
> On Tue, Nov 14, 2023 at 10:12:35PM +0100, Krzysztof Kozlowski wrote:
>> On 13/11/2023 01:55, Jisheng Zhang wrote:
>> ...
>>
>>> diff --git a/include/dt-bindings/reset/sophgo,cv1800b-reset.h b/include/dt-bindings/reset/sophgo,cv1800b-reset.h
>>> new file mode 100644
>>> index 000000000000..28dda71369b4
>>> --- /dev/null
>>> +++ b/include/dt-bindings/reset/sophgo,cv1800b-reset.h
>>> @@ -0,0 +1,96 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>>> +/*
>>> + * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
>>> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_CV1800B_RESET_H
>>> +#define _DT_BINDINGS_CV1800B_RESET_H
>>> +
>>> +/*				0-1	*/
>>> +#define RST_DDR			2
>>> +#define RST_H264C		3
>>> +#define RST_JPEG		4
>>> +#define RST_H265C		5
>>> +#define RST_VIPSYS		6
>>> +#define RST_TDMA		7
>>> +#define RST_TPU			8
>>> +#define RST_TPUSYS		9
>>> +/*				10	*/
>>
>> Why do you have empty IDs? IDs start at 0 and are incremented by 1.
> 
> there's 1:1 mapping between the ID and bit. Some bits are reserved, I.E
> no actions at all. Is "ID start at 0 and increment by 1" documented
> in some docs? From another side, I also notice some SoCs especially
> those which make use of reset-simple driver don't strictly follow
> this rule, for example, amlogic,meson-a1-reset.h and so on. What
> happened?
> 
> And I'd like to ask a question here before cooking 2nd version:
> if the HW programming logic is the same as reset-simple, but some
> or many bits are reserved, what's the can-be-accepted way to support
> the reset controller? Use reset-simple? Obviously if we want the
> "ID start at 0 and increment by 1" rule, then we have to write
> a custom driver which almost use the reset-simple but with a
> customized mapping.

There are two possible situations. Either the reset specifier maps directly to
something in the hardware, or you are inventing some brand new enumeration to
use as a specifier.

In the first situation, you do not need a header. We assume the user will look
to the SoC documentation if they want to know what the numbers mean. (You aren't
_creating_ an ABI, since the ABI is already defined by the hardware.)

In the second situation, since we are inventing something new, the numbers
should be contiguous. This is what Krzysztof's comment was about.

For this reset device, the numbers are hardware bit offsets, so you are in the
first situation. So I think the recommended solution here is to remove the
header entirely and use the bit numbers directly in the SoC devicetree.

It's still appropriate to use reset-simple. Adding some new mapping would make
things more complicated for no benefit.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
