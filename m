Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05EBC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 19:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqoe7dFmiOn4pbRoPyOMYES0O5Te9Fn2miAv0dbBXSg=; b=MkHynCsVfRfzND
	yqK4BLKYMhp5+3shRcRfQcndV7luPjCJHLrDbeGBlKwQ40LIlBfshvdQemd4ZRxu1xsiBmhPuFCm9
	FD4dfmhRrtLFp28zZjUlmkszyALaX3mZbrx9zXIJBHr22RBG0kpkhAQG0y/FuCw1chOaLqQuzcJzj
	5cnJ0xcdeSLHAlHCMLpTIP+TaWbp3PFsy7quO8yx1dkgsW1DFQ93sEZcm99Is5HWa0Um7eRNyVY8p
	430BcWFVU0S9NxV9O03+db5+WET24O54o5/7bhimFwZpX20wZPGc57NEGVeczXJa0gKME1kJ3ue5h
	9F9tI9hP6nESqd9QVIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxBn2-0024Ly-2H;
	Sun, 29 Oct 2023 19:49:40 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxBmy-0024Lc-38
	for linux-riscv@lists.infradead.org;
	Sun, 29 Oct 2023 19:49:38 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7dd65052aso35263957b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 29 Oct 2023 12:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698608974; x=1699213774; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iIRJr814e3OR0nk2N9sH0dhApvH5pHF8ARDZlJk6Fwc=;
        b=Q5kpaXCQWBlsQTcAN70e1VFVhyQPGBtltcHTR1AQnlICW6LygwoYzM6FCmMoZVBxqD
         rQWvVgnspC0nQ3psH41tuJSn5im3HJV12sF/+EBQoYuKOViq+MWEsl1WDDAcDT9ohMWB
         ILPy41LE4ILeVA7LHDarJf3z7kGsqXV7T0iVgduSrqjXc12nHcsP9iyB3GvuVyRFuX2c
         jh+jYVy0wn0YQERJDbsAZgEfqsZuW8RzkxwPjv+ceGURSY2rwqwixEbEiIzeqMQYq3iu
         0G9zWoKFBe+46Nljjbc0Okl8n0FGIK+NFUbQPwfLJF6gDJskKETJRHub0EZ5/r3U0u7o
         W2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698608974; x=1699213774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIRJr814e3OR0nk2N9sH0dhApvH5pHF8ARDZlJk6Fwc=;
        b=O6tBfJ/2vcEW4AWwhSlHQ/x6Hd7ry6DYZ+cRLaxWNjZGIr5ChMBV8KfR7bX0iwj/ez
         2+kZVhrWJkJ8p4rlPQKQ03YV7Hd0RE++F3BHf6ONuzv1nVR6e6FU/tiKhZqTAa/LeubL
         60EHueVH8/cZDj6mEqrmBr51jIIKPmwx5Ay3/BtuHC2u7YdYsVY4a/myQOUOYP5iVS4Q
         r4zoOUndsY+QELzR/L3LVV2RFV6qm4/+GnBCYsBglIOMvvbM0pCOAWd70nH69OQlIvS/
         aB/yIAZAhRF/OzlFcsPSTxMM//XRUFSr+EMVM6NbCOlA2/tCUrRqCRx5O23kNlEAq+wT
         oqHQ==
X-Gm-Message-State: AOJu0YyB/B18Ww7cBMS3CPNyJnhzdpu456RbCEi6EZLL/fDVLENbOjlf
	hLPjaQynGobUVrBICIr9W+WWFA==
X-Google-Smtp-Source: AGHT+IHhD0PPL40FE81BkfFJFGve9oVM2SM2kBkV+rwufWKdIlC26+qwcvLV/wrBtmblXUWlrVTe+Q==
X-Received: by 2002:a81:cf09:0:b0:5a7:b036:360c with SMTP id u9-20020a81cf09000000b005a7b036360cmr8054980ywi.23.1698608974637;
        Sun, 29 Oct 2023 12:49:34 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.2.33])
        by smtp.gmail.com with ESMTPSA id g8-20020a815208000000b005a23ab90366sm3384979ywb.11.2023.10.29.12.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 12:49:34 -0700 (PDT)
Message-ID: <680a2f25-59e7-4757-ba93-1de7fe1279e3@ventanamicro.com>
Date: Sun, 29 Oct 2023 16:49:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: riscv: Document cbop-block-size
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, apatel@ventanamicro.com,
 palmer@dabbelt.com, devicetree@vger.kernel.org, ajones@ventanamicro.com,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
References: <20231029123500.739409-1-dbarboza@ventanamicro.com>
 <20231029-kitten-provider-1602fa805c35@spud>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231029-kitten-provider-1602fa805c35@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_124937_033253_0D97BAF7 
X-CRM114-Status: GOOD (  19.91  )
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



On 10/29/23 11:53, Conor Dooley wrote:
> Yo,
> 
> On Sun, Oct 29, 2023 at 09:35:00AM -0300, Daniel Henrique Barboza wrote:
>> Following the examples of cbom-block-size and cboz-block-size,
>> cbop-block-size is the cache size of Zicbop (cbo.prefetch) operations.
>> The most common case is to have all cache block sizes to be the same
>> size (e.g. profiles such as rva22u64 mandates a 64 bytes size for all
>> cache operations), but there's no specification requirement for that,
>> and an implementation can have different cache sizes for each operation.
>>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> 
> Firstly, odd CC list. Please CC the output of get_maintainer.pl in the
> future.

Ops, my bad

> 
> IIRC, I mentioned defining this to Drew when he was add zicboz, but he
> didn't want to add it - although he seems to have asked you to document
> this. Drew, change of heart or am I not remembering correctly?
> I think he cited some interpretation of the spec from Andrei W that
> implied the Zicbop size would be the same as one of the other ones, but
> I cannot find that on lore atm.

The reason why I'm here is because I want to add Zicbop in QEMU riscv,isa.
I'm pushing a rva22u64 profile implementation there and Zicbop is mandatory
for it. In the process I added a riscv,cbop-block-size DT because, well,
if both Zicboz and Zicbom have their respective block-size DTs, then it's
expected that Zicbop also has one. Or so I thought.

Drew then replied in the QEMU ML [1] that riscv,cbop-block-size isn't
documented and we can't add it as it is. So here we are.

If riscv,cbop-block-size isn't needed because Zicbop will use the cache
block size of Zicboz or Zicbom, that works for me too - I'll add a note
in QEMU explaining why there's no riscv,cbop-block-size and everything
is fine. What we can't do is add stuff in the QEMU DT that's neither
documented nor acked in the DT bindings.


Thanks,


Daniel

[1] https://lore.kernel.org/qemu-riscv/20231028-2d6bf00dddc7bc4a25b32663@orel/

> 
> If Drew's okay with it, then I am too, so a conditional
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Cheers,
> Conor.
> 
>> ---
>>   Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> index 97e8441eda1c..1660b296f7de 100644
>> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> @@ -78,6 +78,11 @@ properties:
>>       description:
>>         The blocksize in bytes for the Zicbom cache operations.
>>   
>> +  riscv,cbop-block-size:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The blocksize in bytes for the Zicbop cache operations.
>> +
>>     riscv,cboz-block-size:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       description:
>> -- 
>> 2.41.0
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
