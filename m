Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEA6C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 05:30:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C440207DD
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 05:30:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LPOG4ehW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEdhwIqX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C440207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eAr1qyOLt1x5paMpPp30gV/NRW9cCtU59YKDsxTPxIk=; b=LPOG4ehWKxgwMH4fH6e+xKruq
	VfNy3jyTa5Ms8rGPau2qNb8sYzhQlIkuZ/W0RbWZlkuOQWe1QhuimA+K/YZiIaVh5zmgf6QthTMIG
	3dnd1IYivQLbXMkVZLbNIicuGC9xa2QIYdOXdayZdbAU9tk/9W+v2e54aeQUYLBS0dYEWYAc0qCjd
	1DTVVWy2uDnMsRrX3Mgl/KF0BawGKK/KvzV7odt4ZFN9KnhdNt9YmK9wRde9RaHRXg5YMEuIw3yES
	EI5OUHu2fXXEP0n0ewiXB1tpOD/6LvHO7RyW/0rQ7r6AoUoEAGcn333ZJjzuuxopBexXvB1zs8I4e
	NHTtU8yCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxkrN-0003SE-K9; Tue, 21 Jul 2020 05:30:37 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxkrL-0003RT-EE
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 05:30:36 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 8so434152pjj.1
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 22:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4BDQCGagA0NpEa3cY5d8pyOcqpUidmjYVVUsO2rIpy0=;
 b=YEdhwIqX/LSZQJ60N8YqzVjHD4PW0DqTwHyRbKvM6amvhtCDDbMmPI1EsVCfnwkoCV
 1u9tl32h/rw5pCZN8vDiaiH7aCLe2bVmgVQlCXOVEBQhzgZ+npwes0jtV+ILb4VIdEbq
 0Caz8njRgPB/InhlLZ5JZrUEehXC+1mQbC7Mifx9yFKaJNqsE8Q8iIGDLT8ZiSQj5mZA
 TPmFUM+dbUtBXhwjcMEOwDfgxGngr/zOq0yo1kbrIQlEMQDEW0tayMmKKsl8t6c81V1I
 sQkywKkBoyXenMFGLaKGogXW5R04Lc5ic/WG4rVmwAP7Q0oEu2Rh3wy2Hy9OoUvmGByY
 6IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4BDQCGagA0NpEa3cY5d8pyOcqpUidmjYVVUsO2rIpy0=;
 b=shghmJU+KRf55m8saZbrwgDFFqmxTQafZjx6KGw7HVoW7sE1ti4eOJdEJWTqzxf0dH
 +9J77FW22lgVyROyANx/9TVunuEmNAuW0HZ+DdqnFgVDu2SY0E6Z7ORmY+nPLRvruK66
 o6QCvILOC297ibt2pN8wEQmOgkM6C2sFyg7wgtcyP3FxATV2BzQzRKIM4IFzxjMlzgeD
 SliSN18URKTAL+yB7NSeec2d3KUKx2sofPP4uZDOIPo9G1TeSEEpWGLodChA7bwCFF2O
 7n8Gl03rR/gXsR/dHkokmQ30aNpZDygsa3w1JR0aoQwuPetr8yb7pbh3Uqe2cu2n32HF
 LdoA==
X-Gm-Message-State: AOAM531LIw7JKI1NI/AHpyp7dcJ0W4jpQgd2S1caPRvUP8djf+RQ7I2a
 jd9ob/4fzj5sLTFUMbWljPb9XOEi
X-Google-Smtp-Source: ABdhPJyKPEVtEA4/LCzQMLH3bxoHGU4XQOANoPRjWXsydJIZc2/OF/VY8ia1/k1esHQBxDrm70RkXw==
X-Received: by 2002:a17:90a:a393:: with SMTP id
 x19mr2845260pjp.24.1595309433264; 
 Mon, 20 Jul 2020 22:30:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k71sm1515479pje.33.2020.07.20.22.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 22:30:32 -0700 (PDT)
Subject: Re: [PATCH 1/6] syscalls: use uaccess_kernel in addr_limit_user_check
To: Christoph Hellwig <hch@lst.de>
References: <20200714105505.935079-1-hch@lst.de>
 <20200714105505.935079-2-hch@lst.de> <20200718013849.GA157764@roeck-us.net>
 <20200718094846.GA8593@lst.de> <20200720221046.GA86726@roeck-us.net>
 <20200721045834.GA9613@lst.de>
 <eb470677-b569-a6f0-e63b-60149b54863a@roeck-us.net>
 <20200721052022.GA10011@lst.de>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <7fc565fe-411e-6a0b-8aaf-0bf808f0d6a9@roeck-us.net>
Date: Mon, 20 Jul 2020 22:30:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721052022.GA10011@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_013035_595143_1C5ADED5 
X-CRM114-Status: GOOD (  22.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/20/20 10:20 PM, Christoph Hellwig wrote:
> On Mon, Jul 20, 2020 at 10:15:37PM -0700, Guenter Roeck wrote:
>>>> -       if (CHECK_DATA_CORRUPTION(uaccess_kernel(),
>>>> +       if (CHECK_DATA_CORRUPTION(!uaccess_kernel(),
>>>>
>>>> How does this work anywhere ?
>>>
>>> No, that is the wrong check - we want to make sure the address
>>> space override doesn't leak to userspace.  The problem is that
>>> armnommu (and m68knommu, but that doesn't call the offending
>>> function) pretends to not have a kernel address space, which doesn't
>>> really work.  Here is the fix I sent out yesterday, which I should
>>> have Cc'ed you on, sorry:
>>>
>>
>> The patch below makes sense, and it does work, but I still suspect
>> that something with your original patch is wrong, or at least suspicious.
>> Reason: My change above (Adding the "!") works for _all_ of my arm boot
>> tests. Or, in other words, it doesn't make a difference if true
>> or false is passed as first parameter of CHECK_DATA_CORRUPTION(), except
>> for nommu systems. Also, unless I am really missing something, your
>> original patch _does_ reverse the logic.
> 
> Well.  segment_eq is in current mainline used in two places:
> 
>  1) to implement uaccess_kernel
>  2) in addr_limit_user_check to implement uaccess_kernel-like
>     semantics using a strange reverse notation
> 
> I think the explanation for your observation is how addr_limit_user_check
> is called on arm.  The addr_limit_check_failed wrapper for it is called
> from assembly code, but only after already checking the addr_limit,
> basically duplicating the segment_eq check.  So for mmu builds it won't
> get called unless we leak the kernel address space override, which
> is a pretty fatal error and won't show up in your boot tests.  The
> only good way to test it is by explicit injecting it using the
> lkdtm module.
> 

Guess I lost it somewhere. Are you saying the check was wrong all along
and your patch fixed it ?

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
