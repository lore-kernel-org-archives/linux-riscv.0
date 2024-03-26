Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CD0CD11DD
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 02:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCwJOuSC6JOLrJFnhpSq1jYFvvp5ktgBbOLJ9Gtd/1Y=; b=XeC2m6GL5Fe3tU
	KzIconKnEd2lCjDixhlLV5N2ivxUYx3vAShfwwUaUyolU82ZblN5XehenPHiTCfI8UfkuHWbrxrqp
	7ZNbNls3gsogP0Svs/DgiYPzYpbyBHcw+JyrSu/doH/SbunUzOKHWXysoknqcALQCce/tDQGUVRbW
	wwhwCIX6ukqYw/VaxhFnNv/YD4yIndFntmXgf0zWvmRxbDYctzuOLTh1MUB4qP5CSCHEwWcZj1I8N
	ZT+kzb5UnD0kaKggSVwSqFPcXTrm0KUsWQ0tUTEHF9gcCejUyJ2OuJeodeD2iIC7CsLraClfR5JhF
	2x0FxuL5P+JvSv1y8geA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rowcP-00000002md1-1klk;
	Tue, 26 Mar 2024 02:32:53 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rowcL-00000002mbx-1HpV
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 02:32:51 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-609ff069a40so56525017b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 19:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711420365; x=1712025165; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3TJqEDfvZDpiO+inDD3t7IOFIESs7RQEPRehNhXH0Y=;
        b=YCw9pVzQuriryVgb/me/df9HPG8Y6wBb2rtZD2KGwI2qKSyJfSFssjyI/0doyePQy7
         EGwhJNo0a4Te0jPZRjXwIY8HfrauBQltZCadZry+FRu4OGwYiQI79Dd2+AP4KxssyPNu
         GdTuz3ff/dJwVKaH6NW1Y5IUKiQcFCxD5yg3FFxr/OjerRU/NCXbMi0HbqRb7oroUay5
         OthJfm8Uhc6HoYYpbGfZg3nVEvk95Z2kXBXW1uIGtRjv/btkblXD3e7c2Dd8OjlsC6Gu
         6gG+CFOe1thz4/pCeYJtIZm057GNcysCfkLAsAoXnztWsWNSGBysvtn/7FRsTfLcEZLN
         mjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711420365; x=1712025165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3TJqEDfvZDpiO+inDD3t7IOFIESs7RQEPRehNhXH0Y=;
        b=Rd/tKhNya8ErQNJGSFQorVJ9OgG6HXpy2J89PIlEbqYlzDpEb80xiKx5t49S2IJ+u6
         sx3AkmnfN1cSKYc26lA4BAbdnN6thHKW25HtS0eKKPs3KXu3m+KdSVKe07aUXIqa8DTN
         M4v7ZW8J+d4wvibOV4ogGvuCuobJdYXEGjjy9TF8gFMXfjuI3CzoXgb/PXyJYuIu0KGU
         uIHEVvEf+hlMYJ3VjGWFF9WKEovxnvW7z2xr7j7K448WC6dTn+N6fDId1bUdmGnpylZI
         zIeJuE/RUb1EmW8Oz6IYFYzEtNQDDPIYTFkrbvirzGZz7bWvaHpeZ+ib7D/yXq9YKKAi
         A39w==
X-Forwarded-Encrypted: i=1; AJvYcCWnJMMda+xWa16xLyrFiZ1TC1o1ZGwiQhkWtGK+OXZBN52bWy/TcuED3lEEhq/RGEJlkHJYVqm4DqCZvlWGw/ibwOJyLvbXDJyKLSQ06o50
X-Gm-Message-State: AOJu0YyNkrqWq74smSzoZGBdJC4xr9j5qICtOavT5tV3LJkDMS2baKW8
	hnWCSsCd0v6xrPy5z1m3SU3N/QgAFRE6J+Q/5fVgYsygFkNBT2jltoMUsR3B8ro=
X-Google-Smtp-Source: AGHT+IFpMRArRaXwHydUZLSvKndg2HWnCWbXGNLRVPG13dZ5KSxLwFXxZjOAnDNM2h6lSP0p5FmQNA==
X-Received: by 2002:a81:7704:0:b0:609:f87b:aad3 with SMTP id s4-20020a817704000000b00609f87baad3mr7200636ywc.31.1711420362724;
        Mon, 25 Mar 2024 19:32:42 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id x8-20020a026f08000000b0047921fd1201sm2540917jab.150.2024.03.25.19.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 19:32:42 -0700 (PDT)
Message-ID: <ea79a27b-43b6-4b6e-9ec5-621e96b97f87@sifive.com>
Date: Mon, 25 Mar 2024 21:32:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] riscv: nommu: remove PAGE_OFFSET hardcoding
To: Jisheng Zhang <jszhang@kernel.org>, Bo Gan <ganboing@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240325164021.3229-1-jszhang@kernel.org>
 <20240325164021.3229-2-jszhang@kernel.org>
 <37d456c1-f0bd-1a78-2d0c-350ca25c6b8d@gmail.com> <ZgIk2hmprnyGr_ce@xhacker>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZgIk2hmprnyGr_ce@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_193249_413595_B86F6A32 
X-CRM114-Status: GOOD (  18.96  )
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

On 2024-03-25 8:28 PM, Jisheng Zhang wrote:
> On Mon, Mar 25, 2024 at 03:46:01PM -0700, Bo Gan wrote:
>> On 3/25/24 9:40 AM, Jisheng Zhang wrote:
>>> Currently, PAGE_OFFSET is hardcoded as 0x8000_0000, it works fine since
>>> there's only one nommu platform in the mainline. However, there are
>>> many cases where the (S)DRAM base address isn't 0x8000_0000, so remove
>>> the hardcoding value, and introduce DRAM_BASE which will be set by
>>> users during configuring. DRAM_BASE is 0x8000_0000 by default.
>>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> ---
>>>   arch/riscv/Kconfig | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index 7895c77545f1..afd51dbdc253 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -247,10 +247,16 @@ config MMU
>>>   	  Select if you want MMU-based virtualised addressing space
>>>   	  support by paged memory management. If unsure, say 'Y'.
>>> +if !MMU
>>> +config DRAM_BASE
>>> +	hex '(S)DRAM Base Address'
>>> +	default 0x80000000
>>> +endif
>>> +
>>>   config PAGE_OFFSET
>>>   	hex

Another option would be to change this to:

  hex "DRAM Base Address" if !MMU

so the prompt is only visible for NOMMU, but we don't need a new symbol.

>>>   	default 0xC0000000 if 32BIT && MMU
>>> -	default 0x80000000 if !MMU
>>> +	default DRAM_BASE if !MMU
>>>   	default 0xff60000000000000 if 64BIT
>>>   config KASAN_SHADOW_OFFSET
>>>
>>
>> Thanks for this patch. I did something similar in my local nommu
>> linux-6.8 tree in order to run it on the S7 hart of JH7110. I have
>> another suggestion for you. Perhaps we should also make TASK_SIZE
>> configurable, and let it default to `0xffffffff if 32BIT && !MMU`
>> and `DRAM_BASE + DRAM_SIZE if 64BIT && !MMU`. Currently TASK_SIZE
>> is effectively `0xffffffff if !MMU`, which doesn't work if I run
>> rv64 linux-nommu with DDR that spans across 4G boundary.
> 
> I must admit that there's such nommu linux with 4GB DDR case in
> theory, but it doesn't exist in real world: who will make such
> strange platform ;) But anyway this improvement can be made when
> the patchset talking about TASK_SIZE_MAX is settled down.

This case is quite easy to hit with QEMU :) In fact I sent a patch making this
exact change:

https://lore.kernel.org/linux-riscv/20240227003630.3634533-2-samuel.holland@sifive.com/

It's not really related to TASK_SIZE_MAX. access_ok() is a no-op on NOMMU,
because you can't prevent userspace from poking the kernel anyway.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
