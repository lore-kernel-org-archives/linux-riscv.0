Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A84CAC5A5
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 02:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcMTs607Vh2WObQ5/Mex1E1ICnOlWdgEp6kGjN/bLPk=; b=ZYMHlQb/l7ah8/
	aJwj4l1BkwvRlSKEDfq2gIog7qFEeJWOCYytTqEINcPOa9rf1APLThpAVUNX+8PXYttU4HlL29YVz
	5hgNXJDXtiXE6OVaZn/AmJTv9kTx35INFvbrDxKYncs1IvrAmHQeuT3CrFKemxE1xltbAK1ng6MGF
	EFc5AJNiT1zT77UnhoqxGgU4yT3tdtOZf8HdTjd/WuJ1sf3zc0fIADSav0N+nycJ+JIqyQhpJLWJF
	eXnQmdZhfVSJtOoChzCNo4k6oMK+735mya6kiKiiiLvaltL8hk1c1mVytHq8M/VfytnMllVl1RRZ8
	E1Ox2hOEgTWynpA0yMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz4s0-0000000G5Ld-2pv8;
	Thu, 18 Sep 2025 02:59:40 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz4ry-0000000G5LI-26aw
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 02:59:39 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-408929699eeso1752455ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 19:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758164377; x=1758769177; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5szgNDrrDfA9r/y/UulQg5Y7n0+PRvqIyjOb+dac47k=;
        b=efggco6UriDjUk3UkW6/2rca9YRz7reJbO6ROXFGlVyl10XseMrSzSjqUHY/6y7HKo
         wtVaeAbDwtjbf0uZmUl04Ja9Ui3WUyn6Ug8cr9UcxYPRP5hYtTtuY3f/+Xgknw9KOQTh
         Dt3rqjncCARXEuWKIwj4QUfnwWQ7/R++H1PUTWkTZq4GCkdRxlwIPJfN13eELzfHTyaH
         odAe1m9KjsbqgPciAKLWY/+jQuWDL+SSdcmJ09AoyRBa8Lro7Uh9gkm9aONcSfKusVAk
         /l3jdahLoJpQCoRh7XHOjVe2foKKwTJjAkYr1tLslUf7pqd/MVUdIGK8aDsZizaGamXI
         P2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164377; x=1758769177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5szgNDrrDfA9r/y/UulQg5Y7n0+PRvqIyjOb+dac47k=;
        b=TgRp21H7TOlrvF0RWnL6pLXWhSzq3KcQAaGdgWW8s6jU2Pt6ybavwiL8riRybsegKz
         2Cg2QO2cDvMjtWlOJJDdB3yzOsze4pFcEVEgsolz2pHf6FEKjI/fNk4yPXFaAiwDLdND
         lVMlpsUMqp2BCl4m1vWUYMVgVOQY3tdgklVHuFYnXUJi/G3+v65mIAGD5mzxCLIN8Cl3
         lmepXnOvoEX1Dfg4GoUYW6lOs3gTzUAllw5ouC0JcZuSyeS8CQTLaJticdcFHqxTnil2
         mktT5iuDwgJEYo+vlFonhuEXVt31nxfTWweRvVhHs7Qh8yhOXGgpA6+ohdK2EpdELyTh
         IxGg==
X-Forwarded-Encrypted: i=1; AJvYcCXvYK4v32exDkab8f72tiK7rQmOQz6IlBJjyxngTcJHAGMSMfnGtO5/kgYUCc9n4WLcDcjch8YXq0YQ7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtSLOrxV4bUO7hQHLPHw9JYNXvG+UhV0lDjDG/f0F3ekPAoD6L
	baIiMRaI4pcqYn7s4QdBH9KIlTdG/yHgpEuSuRRsRLQxEj+4UFpaNnH5OGYmaL0ZXtY=
X-Gm-Gg: ASbGnctSLsHufzoRY/iHgpEYeuT/sHpWnbQ4+uaXlgZScgekTL16cA924D4BsMf0srf
	R5Uc1i/aFZPD4Vuj2dbRMt80/KInV57Q8nn02FnmwRT+Flvs1juYrpuC3BqUAIK+jh3Soerx9KR
	ddNFKkJgjmQFljjDqjXhSxrm8GToNHlILja7xsB2V+09R4SsOlafvFtsES46/UIXCoJMa0ns8PR
	5Vk/jJDSxRPhz4MVmXMun/THz04jjlrO40kdJu91JQ4+JffAyV92nvP9bn/9oTTE726FS/ucpdS
	zdamIeswx6sz7AC8FiD9ia1+akYFi0JIR5CuS66IWnSWvYa0eJ4bdCLV3+o+UcSYJ8DU//CD+Gy
	7RLGA6HL7iugpxqHZgvRkYqb4f+Y6RYpkZN4c7zh9P2795hFoVAODHKxwnDHA2IWgtYsIf02ZD5
	wG9b/c
X-Google-Smtp-Source: AGHT+IEQLSK+9pHMwlUU8ixZlncSUSA8tIOFByfMAjDBZy5wDSD6GkAsXBMax/RAtzqwjY2ctqPlRA==
X-Received: by 2002:a05:6e02:380e:b0:423:fdc4:4e39 with SMTP id e9e14a558f8ab-4241a5784damr64016625ab.27.1758164377462;
        Wed, 17 Sep 2025 19:59:37 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3b017664sm448915173.17.2025.09.17.19.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 19:59:36 -0700 (PDT)
Message-ID: <f7e12797-ea17-4e92-bd25-cc562c66d2a7@riscstar.com>
Date: Wed, 17 Sep 2025 21:59:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
 <20250917231520-GYA1269891@gentoo.org>
 <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
 <20250918001632-GYA1270371@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918001632-GYA1270371@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_195938_790638_A0CB63F2 
X-CRM114-Status: GOOD (  22.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/17/25 7:16 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 18:40 Wed 17 Sep     , Alex Elder wrote:
>> On 9/17/25 6:15 PM, Yixun Lan wrote:
>>> Hi Alex,
>>>
>>> On 17:07 Wed 17 Sep     , Alex Elder wrote:
>>>> Add support for the SPI controller implemented by the SpacemiT K1 SoC.
>>>>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---
>>>>    .../bindings/spi/spacemit,k1-spi.yaml         | 94 +++++++++++++++++++
>>>>    1 file changed, 94 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
>>>> new file mode 100644
>>>> index 0000000000000..5abd4fe268da9
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
> ..
>>>> +
>>>> +  spacemit,k1-ssp-id:
>>>> +    description: SPI controller number
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> could you explain a little bit why this vendor specific property should
>>> be introduced? I took a look at the code, and didn't get the reason
>>> behind.. or what's the problem of simply using "pdev->id"?
>>
>> This property was carried over from the vendor code.  It is
> inherit from vendor code isn't a valid reason
> 
>> optional, and if it isn't specified, the platform device ID (-1)
>> will be used.  It's just intended to provide a well-defined ID
>> for a particular SPI controller.
>>
> while looking at the code, it seems you can use alias to map specific id
> to the spi controller, it even can do non-linear map, something like
> 	spi0 = &spi3;
I've never used this before, but yes, it looks like it's exactly
what I want.  I'll just get rid of the "spacemit,k1-ssp-id" DT
property entirely.  Easy.

> plese check of_alias_get_id()
> 
> note, I haven't actually verified on board, just look through the code
> 
>>> we should really be careful to introduce vendor specific property..
>>
>> If there were a standard way of doing this I'd love to use it.

Looks like you have told me the standard way of doing this.

Thank you.

					-Alex

>>
>> And if it isn't necessary, please just explain to me why.  I
>> have no problem removing it.
>>
> on the opposite, please have explicit good reason to introduce vendor
> speifici property, and if there is generic way, then we shouldn't do it
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
