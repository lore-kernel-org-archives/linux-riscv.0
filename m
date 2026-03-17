Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663B2FB5EAF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 03:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TBQsawmaUQiO5CbLUVcavPrVQ7yIYDGYm/NbD3iR0vY=; b=0DHC+vDyOiSk2i
	vKeI0MSuVie0gxAaOpJNz+Wb/1JadjsTK+E5jvcBOf5Z/YBrWV10+f9zyBs1Cz6YAGppVXNnkxI6a
	QGYCCDHHVHh0ST51JRH0gb4gqNX7jXiA+MOhOjBG9oYoVWxPyfPT9pnnB37cqEAhgcMNvvNkHQjRc
	SHFsVXEgJgMopDzCi9t8xCJS6rS1AP/NP3r6PgMIJTCwsZzo+t5BMo9v83iL19X4GolwCjv5k9pxC
	ToemzR1vJ0Vpa6Va183+y+iUpO7F3MYgxzgUFoEJDsDXA6tIXW27uWCY6OUGbsrhCzdeia2Gl5MGl
	D+5SZDAw5elnh0QaOn3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LRP-00000005LWg-2NE0;
	Tue, 17 Mar 2026 03:49:59 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LRL-00000005LUk-3XG5
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 03:49:57 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-40ef10ec84cso3644176fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 20:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773719394; x=1774324194; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VINWEtY9aZvz9HaKBZW/WHE45MWpLM833fNP+ydNw4=;
        b=lzLBcAPYnTiT1ISF0rqDLliP4H64evqAf9iCHHeKm0m8d6Le0zErv6wHYHxzN4PDyF
         18GAV7a2HgPcE1KchOu3YobuEti0IESM6xy4FpE3o+C/UZf6sxSeMurtk5osV1wGEpQz
         Qgjsy7QWHfPgb2t3dt5Eae8KrHhA3XVj9YjFkmpnTMwHnmnSK3GtVO03IAfQUUMTkfLW
         VMPiWc4o/CPLQ/pdHPaF4QuRTXuI+J7Av3sn0a0L85nZOYw1Q4H0HI+N1pHfGAWafXhe
         1nc7lKAnWiz5YTKXez3oMaeMlgazBRhOYTPidKNldzmKKwYkDcEValsKg/QbFrOy9x+H
         wLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773719394; x=1774324194;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VINWEtY9aZvz9HaKBZW/WHE45MWpLM833fNP+ydNw4=;
        b=nl6RPLD5YUIu3A9kqZtdKV7DaE3pJ6JwEKDEy1iG3U1xeHez2TkdVct84ZCfzRihCl
         Toju2cvU1c1eeesmsr8R0WU0mEtss/gZimWVxuVV3jFZnHbU4+wQNNiFx8Wudu6FkjEM
         oAh6tkqYDsvmhZugfFkDEFZty/x6EzNco4vSYPhCFHxwz0Iqy5MYMTOFuTDEve+sX9iC
         iaTcuxDWlbfrVbzWWM27FtrNKiRYsZY3AuTpaFHvgyX5DxIscx7tFS5SiGfRFlsR+ZTA
         n64dtkZaDAy5LDBySJXNQ4CcemQr2Mes9UOYWNi3jAwUl1jkrwxf9gzkhuKWgwe4zV3k
         VEhg==
X-Forwarded-Encrypted: i=1; AJvYcCW/8viubXS0mjh2amVT/tpvbJQe3gP6lNaZhBHTTeOL6DiYYeK3K1CcSUEZ61pvorvDoXprXX3tFbHVFg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9EEb4ung9hLz/OtS2LAJ0k/y+gd8TZG/bee50lJPPgReW/q0w
	F8zznd14cdmlUcN+KcZMcioRJta2v4y2cEM7kNmn0kn3n1MY1si9qM/ReiFA5B+LAYs=
X-Gm-Gg: ATEYQzxY2Gf12Hf+Z1u2ILVb8UT6o/fvZl13tTaWU/pTXTZV55Q+HcXwfV3g9hs0RAl
	W2Pj3zSljYG13jnOyexD5iCnYixBL+C/6r8z4p02idTCbCLRhms21UgL3mKFwR2t7t40BEQG1wU
	s4663NtQZmfJcU073U00ebOPPLFvhR/m9un6dmDncvj7RRiMZPnodFFBImRFA19ExjmExGCTN1x
	5M/ZXyMP63Z8MmRHDBxWg2oznzu1DBKy9S3D6YuOlBd5zzjBPZVJ7ndtdlNJ7Bo+rBHuaebpU3l
	Kh5IzU/dx/xCiJr7LvgMwda5xokcuxoqjUlZvuigawGGYS0/byeh7blCwzVwzilmEEic8hkgWdP
	YBletb+VX6f6HmizGvKbEVDi9PbF+YS4sOb6dysk1D/c4Mw2Cx96LQIrhPU8ra7+HfLe9/HFul5
	F8PGBoGdEdXttlCwTeH310b732
X-Received: by 2002:a05:6870:d406:b0:409:74c7:1cbb with SMTP id 586e51a60fabf-417b906d206mr9213737fac.7.1773719394528;
        Mon, 16 Mar 2026 20:49:54 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6ae0e3sm19148337fac.16.2026.03.16.20.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 20:49:54 -0700 (PDT)
Message-ID: <da8c8b57-6d5e-461a-83b3-9339a712aca4@sifive.com>
Date: Mon, 16 Mar 2026 22:49:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/15] mm/kasan: add document into
 kernel-parameters.txt
To: Baoquan He <bhe@redhat.com>
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org, andreyknvl@gmail.com,
 ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com
References: <20260225081412.76502-1-bhe@redhat.com>
 <20260225081412.76502-15-bhe@redhat.com>
 <f7054184-dca2-4c7c-9e2e-4a5e3e1c81da@sifive.com> <abjMP58VdUu_eElh@fedora>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <abjMP58VdUu_eElh@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_204955_975251_08C28C11 
X-CRM114-Status: GOOD (  26.03  )
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

On 2026-03-16 10:36 PM, Baoquan He wrote:
> On 03/12/26 at 07:53am, Samuel Holland wrote:
>> Hi Baoquan,
>>
>> On 2026-02-25 2:14 AM, Baoquan He wrote:
>>> And also remove the relevant description in dev-tools/kasan.rst
>>> which is hw_tags specificially.
>>>
>>> Signed-off-by: Baoquan He <bhe@redhat.com>
>>> ---
>>>  Documentation/admin-guide/kernel-parameters.txt | 4 ++++
>>>  Documentation/dev-tools/kasan.rst               | 2 --
>>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index cb850e5290c2..e0115fad9e60 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -2899,6 +2899,10 @@ Kernel parameters
>>>  	js=		[HW,JOY] Analog joystick
>>>  			See Documentation/input/joydev/joystick.rst.
>>>  
>>> +	kasan=		[KNL] controls whether KASAN is enabled.
>>> +			Format: off | on
>>> +			default: on
>>> +
>>>  	kasan_multi_shot
>>>  			[KNL] Enforce KASAN (Kernel Address Sanitizer) to print
>>>  			report on every invalid memory access. Without this
>>> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
>>> index a034700da7c4..eaae83fcb5e4 100644
>>> --- a/Documentation/dev-tools/kasan.rst
>>> +++ b/Documentation/dev-tools/kasan.rst
>>> @@ -129,8 +129,6 @@ Hardware Tag-Based KASAN mode is intended for use in production as a security
>>>  mitigation. Therefore, it supports additional boot parameters that allow
>>>  disabling KASAN altogether or controlling its features:
>>
>> The sentence above is now incorrect as well. I would recommend documenting the
>> parameter earlier in the "Boot parameters" section instead of removing it from
>> this document entirely.
> 
> Good catch and the suggestion is good to me. Thanks.
> 
> Is below change OK to you?
> 
> 
> From 317be48b9c1bf9d33b8d8fff5e401e3155531d81 Mon Sep 17 00:00:00 2001
> From: Baoquan He <bhe@redhat.com>
> Date: Tue, 17 Mar 2026 11:28:39 +0800
> Subject: [PATCH] mm/kasan: adjust documentation

I'd suggest something a bit more specific, maybe like "mm/kasan: document kasan=
for all modes".

> Content-type: text/plain
> 
> To reflect the change of kasan=on|off.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  Documentation/dev-tools/kasan.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index a034700da7c4..8e65bc04dbcd 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -103,6 +103,9 @@ Boot parameters
>  KASAN is affected by the generic ``panic_on_warn`` command line parameter.
>  When it is enabled, KASAN panics the kernel after printing a bug report.
>  
> +The generic ``kasan=off`` or ``=on`` command line parameter controls
> +whether KASAN is enabled (default: ``on``).
> +

This is in the middle of paragraphs describing the fault reporting options. I'd
suggest to move it to the beginning of the section.

With those fixes, you can add

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

>  By default, KASAN prints a bug report only for the first invalid memory access.
>  With ``kasan_multi_shot``, KASAN prints a report on every invalid access. This
>  effectively disables ``panic_on_warn`` for KASAN reports.
> @@ -127,9 +130,7 @@ modes below) support altering stack trace collection behavior:
>  
>  Hardware Tag-Based KASAN mode is intended for use in production as a security
>  mitigation. Therefore, it supports additional boot parameters that allow
> -disabling KASAN altogether or controlling its features:
> -
> -- ``kasan=off`` or ``=on`` controls whether KASAN is enabled (default: ``on``).
> +controlling its features:
>  
>  - ``kasan.mode=sync``, ``=async`` or ``=asymm`` controls whether KASAN
>    is configured in synchronous, asynchronous or asymmetric mode of


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
