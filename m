Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAF3C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctwrOcMkAGuwhtLqSx5Og6EKpSVPuSqzhmbTsg3YFos=; b=Uh/WVtiaeeUcIN
	2C5gUPw3SvasbMXhZXc0uWYd6I6jAnWkAWF6oR3tOj+loB24r+5g/KacRBoixHdRaWFTEOJHByyMD
	ugL6FPV/Ch3+Jqksb5mw1GsCHciPSCwnCZJRMAVcWfaY4w0sSa3AN4VCzCAp3Vr7Jwoq/KJPJduHp
	r5vyLFhuC7xBOPn3TSP/d2WOVybBt/SPnITNrLmpbv0NPgwN3pSO72rgCnfgaFi0IILdY3TT0fT6a
	tRloPok0sxDjNvgGqkx+3h4/Gswp8l6e5MKChVCSGq1UVhoKNTz+ni20uoutcij92g8DC/48G+aMx
	UCvoTkJfLc8ZBjxjLs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZar0-00000006RnD-0rRH;
	Thu, 01 Aug 2024 18:48:46 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZaqw-00000006Rm2-3g1a
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 18:48:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D3851C0002;
	Thu,  1 Aug 2024 18:48:36 +0000 (UTC)
Message-ID: <032452c1-321a-486d-ae7b-46d7fb48578b@ghiti.fr>
Date: Thu, 1 Aug 2024 20:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] riscv: Re-introduce global icache flush in
 patch_text_XXX()
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240730135921.156508-1-alexghiti@rivosinc.com>
 <0719e155-0a07-4878-87e3-cd96fed7a1dd@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <0719e155-0a07-4878-87e3-cd96fed7a1dd@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_114843_085838_BBB509D6 
X-CRM114-Status: GOOD (  17.68  )
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

Hi Samuel,

On 01/08/2024 19:32, Samuel Holland wrote:
> Hi Alex,
>
> On 2024-07-30 8:59 AM, Alexandre Ghiti wrote:
>> commit edf2d546bfd6 ("riscv: patch: Flush the icache right after
>> patching to avoid illegal insns") mistakenly removed the global icache
>> flush in patch_text_nosync() and patch_text_set_nosync() functions, so
>> reintroduce them.
>>
>> Fixes: edf2d546bfd6 ("riscv: patch: Flush the icache right after patching to avoid illegal insns")
>> Reported-by: Samuel Holland <samuel.holland@sifive.com>
>> Closes: https://lore.kernel.org/linux-riscv/CAHVXubh8Adb4=-vN4cSh0FrZ16TeOKJbLj4AF09QC241bRk1Jg@mail.gmail.com/T/#m800757c26f72a1d45c240cb815650430166c82ea
> Shouldn't this use the permalink for the specific message, not the thread?


I never paid attention to that, but the permalink is shorter so I'll 
change that, thanks


>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   arch/riscv/kernel/patch.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
>> index ab03732d06c4..91edfd764ed9 100644
>> --- a/arch/riscv/kernel/patch.c
>> +++ b/arch/riscv/kernel/patch.c
>> @@ -205,6 +205,9 @@ int patch_text_set_nosync(void *addr, u8 c, size_t len)
>>   
>>   	ret = patch_insn_set(tp, c, len);
>>   
>> +	if (!ret)
>> +		flush_icache_range((uintptr_t)tp, (uintptr_t)tp + len);
> This patch was based on an old tree from before
> https://git.kernel.org/riscv/c/47742484ee16 removed the "tp" variable. While it
> still compiles because flush_icache_range() is a macro that discards its
> arguments, it will be confusing to anyone reading the code.


Hmmm not the first time I hear this :) Sorry, I prepared the patch a 
couple of weeks ago and the rebase on 6.11-rc1 did not complain, I do 
that right now and send a new version tomorrow.

Thanks,

Alex


>
> Regards,
> Samuel
>
>> +
>>   	return ret;
>>   }
>>   NOKPROBE_SYMBOL(patch_text_set_nosync);
>> @@ -237,6 +240,9 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
>>   
>>   	ret = patch_insn_write(tp, insns, len);
>>   
>> +	if (!ret)
>> +		flush_icache_range((uintptr_t) tp, (uintptr_t) tp + len);
>> +
>>   	return ret;
>>   }
>>   NOKPROBE_SYMBOL(patch_text_nosync);
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
