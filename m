Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF0AC3600C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 20:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odJjJ8vhxzwISjWJrFDYvHyvJuGCIdSwGBLR3R/lRuw=; b=R0dj7W+DVWngl3
	ptPXIJkVkDgKzN1C935LW/wCEvXrp5gMmXHAwh0aSgyflK6b2Hqym+hg4EQa/1D0qU41KX3N8WZxZ
	jaMo3TL/XtVdmZd5glur7WtIy8JglF9PZcQ6LVqemLxOGmxhhBl8YIQQZBdk7/+dX2LmTuKsmCzo1
	Awz/fTFkkq7m6RFNsuq4MvGpBYYAlynlA0I3pEnmA06PafHFWYNJAYmb51nnSNzQt8NYlF1dG8fCA
	bwyWb508dly+B74V/MZfVnUeg9yePA9s/yLFoDvtnqiBETIvlZuc7XoRBAAq/hCLOOmL5eOIjy122
	ZdFC9+oZi7+GjUzIVU9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGDd-0000000EFtl-1tfT;
	Fri, 28 Mar 2025 20:22:21 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGDb-0000000EFsb-00DF
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 20:22:20 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54af09697f5so2457156e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 13:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743193337; x=1743798137; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wj+8bmV44ertfc1KXsCnlrp/qCwTX9DeMuvBdHVn6I=;
        b=RzJKWkHiH9bqTUctqktZP0582LLRmDZ4Ke6SnkrMAGsyqHAD0GmxCqLVRwtjAtNG5i
         w+SbA3NdvNSjKcdMKhojy8GYptQ/NBwZjMMUaJk2gR49j1kqA429wsnwaBXUJEWdqYuk
         1cXrAhTnMjWX8zVJUd2QnQU2tX0WiyuyObRg9KhpUl/wMQYkxK3nRug8dFGdBTBhYgNm
         C9BFUF+E/bohBskCJ1AGveH4Zg7SlxCzd7TtkNjR1Vj87rufImE8jh5mt4yg8ChyhgnN
         6Vpm1nu/x51/IillwVU+cTDIRYJOR2yz61cvO54Qjir2FaoLQ6I3trzz8L6S2zHCVBJ9
         Qx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743193337; x=1743798137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0wj+8bmV44ertfc1KXsCnlrp/qCwTX9DeMuvBdHVn6I=;
        b=Dj3ejGOQ3iyGO6V3a97TjYTrFmmgqBxPXTwKq8rzS/fcVBH5BwhH0f20ttlK747LQc
         f5F5+tOwb1BHEMI2i9IJ99QZQoNV9cVXsuWGsyZYZnavH3rAaET50bXIGn39YHJ8GoeD
         U9jv6b6ejWm+RkTAZv86KwjYkM7nSsIk35+x3fAKnpkcvDUYHNg/x9tEKsF9dLhR5SVl
         FOibeT+BFDz9vJLgBah2Eon2+RlbbfV8MbXx985sFoFzgWAO2TRbzfHUmragaVNU/ce4
         w8spyP0mCOA11nTUhlRU3Jq65q6BHSWA5tRCU9nSn317zkUnM711zyFu485UWFOhFb0s
         9Uxg==
X-Forwarded-Encrypted: i=1; AJvYcCV0RkRXFexgoCvc7cWWETtj6RmTSP+BBFZXXVtKWkCQFUyw2JToB11riEfc1e0zqCWLyseULhdGV5CRLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxJfiUitNNV8+UEDWznJ7AgJUCOxqZz8cVg0wJzjO10/XTvBce
	dzo8mfwD4IWglLZHpdXgACzeaCUNhVXqQPDKsMFm51x1+8lpwqf2
X-Gm-Gg: ASbGncsighS3l3kne9uLDzbnTqPT6N6CKFWWc7hudkwuwe1aexkRMqcXXOJe93/orhS
	kXjTjpJ0Sq7Tk7TZoDH59qV/oS0gMuB+f+ZFQ1tm99+tRJRaNCyq2Ug7Skc1QndditFeTKEfZf4
	3kwlC7ppJFlrA8hc+h9kdQ9bE4WKAmJOm5bAjTvtnA+LoOJLLKsC7Z9fQuDJhyYUpLvH2RYBQ6x
	YIXHvTlgrrbHVNbrnDn7Qb5jXs8UNUt2ZsrbfOLTLA0lrR7H/keDy/tB3OXR+4ar6LspMxtFHTy
	ce8s/j/yX9CsKTEweBi132utNFD9DjN1cErZgUOCOFVmJ8metVcGBb5XTYSj4VFY5aM1TQUPMKw
	kzsdEYkhbAemcCNClA3FrL6oom+qUFA==
X-Google-Smtp-Source: AGHT+IE4u4FzN8OB5WtN6BsBdAIoYyWb07aOVKhGmzjbmccuBZV4PXNpyJk39F0lyANDcUCWp1u0sg==
X-Received: by 2002:a05:6512:a8c:b0:549:91db:c14b with SMTP id 2adb3069b0e04-54b10dbcc7cmr211591e87.8.1743193336898;
        Fri, 28 Mar 2025 13:22:16 -0700 (PDT)
Received: from ?IPV6:2001:678:a5c:1202:4fb5:f16a:579c:6dcb? (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957fa73sm411017e87.140.2025.03.28.13.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 13:22:16 -0700 (PDT)
Message-ID: <dfc8ee31-2f81-4895-a11d-413641daf8c0@gmail.com>
Date: Fri, 28 Mar 2025 21:22:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] riscv: Add runtime constant support
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Pasha Bouzarjomehri <pasha@rivosinc.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>,
 Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
References: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
 <20250319-runtime_const_riscv-v10-2-745b31a11d65@rivosinc.com>
 <cc8f3525-20b7-445b-877b-2add28a160a2@gmail.com> <Z-b9xGX7SaPgQq15@ghost>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <Z-b9xGX7SaPgQq15@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_132219_048958_29A5DB72 
X-CRM114-Status: GOOD (  18.25  )
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

On 3/28/25 20:51, Charlie Jenkins wrote:
> On Fri, Mar 28, 2025 at 04:42:42PM +0100, Klara Modin wrote:
>> Hi,
>>
>> On 3/19/25 19:35, Charlie Jenkins wrote:
>>> Implement the runtime constant infrastructure for riscv. Use this
>>> infrastructure to generate constants to be used by the d_hash()
>>> function.
>>>
>>> This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
>>> constant' support") and commit e3c92e81711d ("runtime constants: add
>>> x86 architecture support").
>>
>> This patch causes the following build failure for me:
>>
>> fs/dcache.c: Assembler messages:
>> fs/dcache.c:157: Error: attempt to move .org backwards
>> fs/dcache.c:157: Error: attempt to move .org backwards
>> fs/dcache.c:157: Error: attempt to move .org backwards
>> fs/dcache.c:157: Error: attempt to move .org backwards
>> fs/dcache.c:157: Error: attempt to move .org backwards
>> make[3]: *** [scripts/Makefile.build:203: fs/dcache.o] Error 1
> 
> Thank you for the report, this seems like a binutils issue potentially.
> I will look into it. Here is a minimally reproducible example:
> 
> 886 :
> .option push
> .option norvc
> 	nop
> 	nop
> .option pop
> 887 :
> 888 :
> .option push
> .option norvc
> .option arch,+zba
> 	nop
> 	nop
> .option pop
> 889 :
> .org	. - (887b - 886b) + (889b - 888b)
> .org	. - (889b - 888b) + (887b - 886b)
> 
> Removing the ".option arch,+zba" fixes the issue but that shouldn't
> matter...

I tried again with GCC 14.2 and 12.4 (with the same binutils version) 
after Alex's answer and couldn't see the issue with these. I got the 
same result with your example. If I invoke `as` directly it doesn't 
happen either.

The issue might be with GCC 15 then?

Regards,
Klara Modin

> 
> - Charlie
> 
>>
>> The value of CONFIG_RISCV_ISA_ZBKB doesn't seem to have an impact. Reverting
>> the patch on top of next-20250328 resolved the issue for me. I attached the
>> generated fs/dcache.s.
>>
>> Please let me know if there's anything else you need.
>>
>> Regards,
>> Klara Modin
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
