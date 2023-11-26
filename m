Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A76DC4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 00:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9Fy8NQCVDcaM9N5dyVZf8MneVkaysPV6W7iLV7m35E=; b=XS+jNA283Y8Qsc
	U8kSnYMvBQ4t5o34/exjX3xb/HLXVs0jcFg1rTmsp5KZJrPn3cnrvOFjtq+CMOW1umL8SDU5/weaJ
	8pk83PzKF55U6jJ2HyttS5KZ8ZdIkjzrI041DXrtIUz60v0W3pENAQnJq8kg/5ONqmhKAI0lbfoLc
	uVVKqx98XC2hBeFnC4AvvwL0A27MdjkM+uUufPiB+GHfF6N1ZMoFSMDk4dVxb0JYehm5am9Gq4xAb
	DTVL1drrQMZ+cumECG+TSK2UvPoegxMPy1vys5VETR70z+CwBr7JZrttMbu0OTjhQSW32Ks2zseZ7
	9ZkIVdRWr222tIo7jRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r72fc-009yxn-2p;
	Sun, 26 Nov 2023 00:06:44 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r72fa-009yxP-0H
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 00:06:43 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7b3840dff10so50698339f.0
        for <linux-riscv@lists.infradead.org>; Sat, 25 Nov 2023 16:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700957200; x=1701562000; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZyjHH024UtJYC8nd5F0O4jycJThUYyuQjeJaYfroYQ=;
        b=Y336g7cVfvitlrVBe+Ho/UnAZqPrmRot9iFbzS0tEbp7fG8w7yATccM64kX73DK/Lm
         gyFkjUXAgNjfp05UuCbbd9MsmCVEh4ZrKc4QOGT8xkewvJN1kqgPD6L/+zRCYLyy1bOF
         WPoZyetytgzc+E3FKtWcH39CXEQfae1GkbGmFEZjjuauR0vjgkTbf1YGIhBhq4IdbTav
         CTZCP12PQN38n4vO9qqK2NXncCDkjHMXb5PHYuYpS7jYs00Q5t509s4QE04ZsDTXP5qP
         eZF+Qs5JyJTbpf7c4Pwi/a+lr9ufJ8fdexqoUU281QV8xEYTMwrQG1UV4o2HcIzlh9Ks
         q6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700957200; x=1701562000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZyjHH024UtJYC8nd5F0O4jycJThUYyuQjeJaYfroYQ=;
        b=K204YdioFozt+eFPXeXANvoXESiPrfqh0MZgAL4AF4d7vfBrl9oxEjuNt45xkel2RU
         gFIvtyLJ9ZqDui+7TttlCAqF7w3GE2Vl0+cZIHYayrOq3VTSITY/sDeft2iNSSTYLyNk
         qZHGkVUWzBn6CAi9NnXAQj4j6FzRLVb3O4Nt4E5acIznQn7y8Kx3muZmE1i0kl3vNM5U
         vwVZRVWqBsLxTxInXmV55V5Igv3fpprr9gjRbrD4V+J29mWXeJsTbOH4auEYFZwt5hiW
         xI7XK+t8z381m8ssGfxWim7aTnqwwBIOIlDbzGM6AfQ2WSJvay7yvXaYkrVjlJCW07Sl
         zy4A==
X-Gm-Message-State: AOJu0YxttI+8UnEWug3QhVpLU7GrhSpuxU49l0sZc7gEFp6ntSQdY6OT
	Pj2ueLc6BBEdVqbk4vQpApRpZg==
X-Google-Smtp-Source: AGHT+IHE9BSfvxwbGgqEygc0h8j2GlFdwRFUv/TXF2ue/ukhihc8koozSoNApEJTTPospumyntOOgQ==
X-Received: by 2002:a5e:8614:0:b0:7b3:84f4:f003 with SMTP id z20-20020a5e8614000000b007b384f4f003mr3186196ioj.19.1700957200239;
        Sat, 25 Nov 2023 16:06:40 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:169:4685:f118:f646? ([2605:a601:adae:4500:169:4685:f118:f646])
        by smtp.gmail.com with ESMTPSA id m7-20020a02cdc7000000b004667006c370sm1564707jap.76.2023.11.25.16.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 16:06:39 -0800 (PST)
Message-ID: <17d0646b-bcd5-48ff-a55c-d5cf88cdd015@sifive.com>
Date: Sat, 25 Nov 2023 18:06:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix SMP when shadow call stacks are enabled
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Nam Cao <namcaov@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org
References: <20231121211958.3158576-1-samuel.holland@sifive.com>
 <20231123-vision-nuttiness-b75be703f162@wendy>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231123-vision-nuttiness-b75be703f162@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_160642_199985_872DDC3D 
X-CRM114-Status: GOOD (  20.16  )
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

Hi Conor,

On 2023-11-23 8:06 AM, Conor Dooley wrote:
> On Tue, Nov 21, 2023 at 01:19:29PM -0800, Samuel Holland wrote:
>> This fixes two bugs in SCS initialization for secondary CPUs. First,
>> the SCS was not initialized at all in the spinwait boot path. Second,
>> the code for the SBI HSM path attempted to initialize the SCS before
>> enabling the MMU. However, that involves dereferencing the thread
>> pointer, which requires the MMU to be enabled.
>>
>> Fix both issues by setting up the SCS in the common secondary entry
>> path, after enabling the MMU.
> 
> I'm curious, mostly because I do not know much about the implemtnation
> of the shadow call stack, but does it actually work correctly when the
> kernel is built without mmu support?

I imagine it would work. The SCS implementation is purely software; it stores
the return address in a stack at `gp` instead of with the rest of local
variables at `sp`.

The problem here is that we are passing a pointer between CPUs with different
views of the virtual address space (i.e. the boot CPU sees the kernel at
0xffffffff80000000 while the CPU being brought up sees it at its physical
address), and then dereferencing it. If there is no MMU support, then the
virtual address space is identity mapped on all CPUs, and there is no problem.

Regards,
Samuel

>> Fixes: d1584d791a29 ("riscv: Implement Shadow Call Stack")
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>>  arch/riscv/kernel/head.S | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>> index b77397432403..76ace1e0b46f 100644
>> --- a/arch/riscv/kernel/head.S
>> +++ b/arch/riscv/kernel/head.S
>> @@ -154,7 +154,6 @@ secondary_start_sbi:
>>  	XIP_FIXUP_OFFSET a3
>>  	add a3, a3, a1
>>  	REG_L sp, (a3)
>> -	scs_load_current
>>  
>>  .Lsecondary_start_common:
>>  
>> @@ -165,6 +164,7 @@ secondary_start_sbi:
>>  	call relocate_enable_mmu
>>  #endif
>>  	call .Lsetup_trap_vector
>> +	scs_load_current
>>  	tail smp_callin
>>  #endif /* CONFIG_SMP */
>>  
>> -- 
>> 2.42.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
