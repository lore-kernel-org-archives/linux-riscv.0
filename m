Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AC2CE79CE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 13:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U45bV4rJSCfnT5B9eQ8Gov9FEMys/ukuud2PuFsVnW4=; b=AxsVHNW0EFhkBV
	o2AO0sD6QwXwy2xO8qYb55Y9UkDiRP/RjYe0ny3kV85K+ddJULeDIAZw44RhUbkogAvqE+a9lbX8p
	PdhkJrlitAani2BITxRu66iyUhfmFK/kKTX+CMy0CN/TYqfbmpVxlmrX6J5b5BlxM/TLNNMOTHnT6
	SsB2h5GT25yPXtzu1MB2JJxg2Btm+8RADZSrbFRmqzmaguKv4jhitGKaKbkpqus/EKYK0qXrlYohO
	9ACEc4t5tqJblIgeUMynCm8eu8rFAy6Ym7q4npvpd914nrvYnPr+2HcZgAtVvW/ORvn6XBX7QWhxU
	FuPigo4TNpBdKjPsPb2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwxH-0038m8-25;
	Wed, 20 Sep 2023 13:09:23 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiwxE-0038l4-2a
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 13:09:22 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52e5900cf77so8538957a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 06:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695215358; x=1695820158; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=270Wv+j/EwaXulOu1WjjWayYksd1Jqq5ecQjbVvwBS8=;
        b=jCzH2Og3kitT0fmgRnm5N6BW3kMCLy5DK7+xG2JxzldOp6RhCA+gy9EravuCzeyaYC
         upsQ2EkPg2YT/s9JBPk3GnmGXhlxEzvre4/lsIlIMWI8NwtVWlCMC1UXWdLBFBQqDWQ3
         XVL2wK0dgw6T8aTpNoEB84UY5KUj04GB1AUBv1mMRn6voBYUo9a3lEJzmBY83jpt2OfF
         s6l7SsmEwniV2ZtcSyf+R3c6eGLFDYzkGV/Y7Syof7CTnKqz39SZSAjbpY2aiu6sn7mu
         yEjvWk2VjUVl7i7tKXZWVLh7fhUXMbQa9mfwhmv9DZeB0Eugc6o+6zE1iVZhda0YxYkK
         UpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695215358; x=1695820158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=270Wv+j/EwaXulOu1WjjWayYksd1Jqq5ecQjbVvwBS8=;
        b=uexUUiRJe8T9bPiswyxOKYBPFV7y/1DXfMHkVOynWhvVEkkcNoyrIMmIVz9YRp067e
         J3V7Jwhxc7ynVDr6Y7R3y4WggnNNlUCpPPLX1F+S1iT4Iaf+CmrjS2npnvhz2o7Q6Vln
         kVDMz/Yv9Tbo73v0GWga3KU97QDb1eSpjjp1Qrko24t5Hle8cMqN9gAT0CBwECkCSZ8b
         bjZXzkMDTFU8dctf5xThA6xVRBcO6WplWzBsWhBQOqdbXPgn/hjBx7gdP5KyjBTPWI0u
         4NHHh78vT13IVPQ62HX3keayFlSOk1T83XDmj057irKvK1JIWBzRRQ8i7nSQHl/M/74H
         qUIw==
X-Gm-Message-State: AOJu0YwR2wvY5Ad6agNVOfNDQgC0iGZ6CN8mpRENHgmLUkgYRt4DXp/d
	suNq6KAXjJCtNt8WxmUwFnXupA==
X-Google-Smtp-Source: AGHT+IH297j9ktrdQwrQLmNMBcLuT4NjDCohRQHwALOPnweXJcwlZz2yapKIbPE04mbFmOYfOuw6FQ==
X-Received: by 2002:a05:6402:b35:b0:52f:2a38:1f3 with SMTP id bo21-20020a0564020b3500b0052f2a3801f3mr2081318edb.2.1695215358664;
        Wed, 20 Sep 2023 06:09:18 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id by6-20020a0564021b0600b0052a198d8a4dsm8786806edb.52.2023.09.20.06.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 06:09:17 -0700 (PDT)
Message-ID: <3172861a-4f13-363c-e3af-c7047899501b@linaro.org>
Date: Wed, 20 Sep 2023 15:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, evicetree@vger.kernel.org,
 emil.renner.berthing@canonical.com, guoren@kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org, xiaoguang.xing@sophgo.com,
 Chen Wang <wangchen20@iscas.ac.cn>
References: <66b988f0-39fc-2ed3-8f38-151d6a3c9e52@linaro.org>
 <IA1PR20MB49536BFE1254ADEE0E795A26BBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20230920-8503c6365655d3ef3dadfd53@fedora>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230920-8503c6365655d3ef3dadfd53@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_060920_839033_C1366BA6 
X-CRM114-Status: GOOD (  19.19  )
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

On 20/09/2023 14:58, Conor Dooley wrote:
> On Wed, Sep 20, 2023 at 08:40:07PM +0800, Inochi Amaoto wrote:
>>> On 20/09/2023 14:15, Inochi Amaoto wrote:
>>>>> On 20/09/2023 08:39, Chen Wang wrote:
>>>>>> From: Inochi Amaoto <inochiama@outlook.com>
>>>>>>
>>>>>> Add two new compatible string formatted like `C9xx-clint-xxx` to identify
>>>>>> the timer and ipi device separately, and do not allow c900-clint as the
>>>>>
>>>>> Why?
>>>>>
>>>>
>>>> If use the same compatible, SBI will process this twice in both ipi and
>>>> timer, use different compatible will allow SBI to treat these as different.
>>>> AFAIK, the aclint in SBI use the same concepts, which make hard to use the
>>>> second register range. I have explained in another response.
>>>
>>> What is a SBI? Linux driver? If so, why some intermediate Linux driver
>>> choice should affect bindings?
>>> Best regards,
>>> Krzysztof
>>>
>>
>> SBI (Supervisor Binary Interface) is defined by riscv, which is an interface
>> between the Supervisor Execution Environment (SEE) and the supervisor. The
>> detailed documentation can be found in [1].
>>
>> The implement of SBI needs fdt info of the platform, which is provided by
>> kernel. So we need a dt-bindings for these devices, and these will be
>> processed by SBI.
>>
>> [1] https://github.com/riscv-non-isa/riscv-sbi-doc
> 
> Yeah, this is the unfortunate problem of half-baked bindings (IMO)
> ending up in OpenSBI (which likely means they also ended up in QEMU).
> This T-Head stuff is coming across our (metaphorical) desks, so we are
> obviously going to try to do things correctly. I may end up speaking to
> Anup later today, if I do I will point him at this thread (if he hasn't
> seen it already).

If the OpenSBI started to work with some half-baked-bindings before
proper review, it's their loss. If we do not push back on such stuff,
how our review can ever matter?

Anyway, firmware/SBI/whatever parsing compatible twice is not really a
reason to model same thing with two different compatibles. Assuming of
course this is the same thing.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
