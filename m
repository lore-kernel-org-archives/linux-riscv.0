Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74F7CD98EE
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 06:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ajXzkvc8iIF+vcKVjdV/J8gofe6QUM8HOjU+SEPUM8=; b=1bFvNx7iS1tyg1
	O2NxLgrKpG9vlGneC3WodxA4vIJrHGJHscGiRmefDwL4ttODKV+cwu1XFM32LWX7AlnHnLynsfVhP
	O4s5e7woTTWLBD2wochIP4Pp1i2qg5pcqkEzvnOHy3bbhG+wsYimQqUTmLXlrtN71khttVQAjD/72
	uMeaB57aCWpBy8aclxJBH0hGTRpcT88i8389xL4gfRGiCqq9NcUqbbWSoyfW1dcJ6UJuWL5q7FaMg
	Yhayxf2wliWq1z3XLJdXWbu41j4XFgXf0oRmVbgk66DV8jgR2mBFO2pZcijHpv5G+KWJWyNnBVxsw
	oLxbdkILSe09WS+6MuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjhk-0000000Gi1O-1bTy;
	Wed, 17 Jun 2026 06:24:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZjhj-0000000Gi14-0Sqv
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 06:24:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DEE1240261;
	Wed, 17 Jun 2026 06:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D9A1F000E9;
	Wed, 17 Jun 2026 06:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781677489;
	bh=ZbiAl6cAwQ/MIX03T60qFrsPF1kk2r70Bmoo7yfgync=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HWjCVcik3IrZo1k9iWr7XPH5NB6V05qGX6TdOBXcO+CF+76Ai79MbEY1S4ysZLQir
	 JXCB4/li8KQp293/RTngIiph+hiAD1QRmF2U1by1zz8SRmAQutYcRWZIuKTEhVEHXD
	 B1PVaDzhT3CBd5EzXOx50BAY8Ok3f+N2WnMfIAw59tLGktorFQDBOaY6s/WDnSxgaK
	 yTE4gGKWSys46XGUKvy2auhC66oAAW2diwmrNKwmLjJVHIFstOiG3GX1h5dMdD8KzD
	 WaRqdAQzFXof0C8YQfi3cPU7KmlXUPdLxRNq5cy+jrhywfrMP3gnAk8yWwgrnGWRRx
	 0m9ON/B1GtgHA==
Message-ID: <dda194a3-aa0f-4284-882d-7bfd0317edb1@kernel.org>
Date: Wed, 17 Jun 2026 16:24:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: hwprobe: Avoid uninitialized read in
 hwprobe_get_cpus()
To: Mark Harris <mark.hsj@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260612045502.70850-1-mark.hsj@gmail.com>
 <77749c92-ac8a-4074-bb59-59dbbd3d84f2@kernel.org>
 <CAMdZqKEpxT3vzE97LbaxP9grg5wi3aeArzgdyORHyGz=ZsDe0g@mail.gmail.com>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <CAMdZqKEpxT3vzE97LbaxP9grg5wi3aeArzgdyORHyGz=ZsDe0g@mail.gmail.com>
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

On 16/6/26 1:53 pm, Mark Harris wrote:
> Michael Ellerman wrote:
>>
>> On 12/6/26 2:55 pm, Mark Harris wrote:
>>> When cpusetsize < cpumask_size(), hwprobe_get_cpus() did not fully
>>> initialize its copy of the cpu mask, which could cause non-deterministic
>>> results from the riscv_hwprobe syscall on a system with more than 8 CPUs
>>> when the supplied cpu mask is empty.  Address this by fully initializing
>>> the cpu mask.
>>>
>>> Signed-off-by: Mark Harris <mark.hsj@gmail.com>
>>> ---
>>>    arch/riscv/kernel/sys_hwprobe.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>
>> This should have a fixes tag, I think it's:
>>
>> Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
> 
> Yes, that looks correct.
> 
>>
>>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
>>> index 1659d31fd288..caf6762427c8 100644
>>> --- a/arch/riscv/kernel/sys_hwprobe.c
>>> +++ b/arch/riscv/kernel/sys_hwprobe.c
>>> @@ -450,6 +450,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
>>>        if (cpusetsize > cpumask_size())
>>>                cpusetsize = cpumask_size();
>>>
>>> +     cpumask_clear(&cpus);
>>>        ret = copy_from_user(&cpus, cpus_user, cpusetsize);
>>>        if (ret)
>>>                return -EFAULT;
>>
>> cpus is on the stack, and is copied back out at the end of the function,
>> so this looks like it could be a stack info leak.
>>
>> But the copy back is also bounded by cpusetsize, so in fact there is not
>> any leak of uninitialised stack out to userspace:
>>
>>           ret = copy_to_user(cpus_user, &cpus, cpusetsize);
>>           if (ret)
>>                   return -EFAULT;
> 
> It can leak 1 bit of information from the kernel stack.  For example
> with 16 CPUs, all online, if a 1-byte 0x00 mask is supplied, the
> caller can determine whether the second (uninitialized) mask byte is
> zero or non-zero due to the cpumask_empty(&cpus) check.
Oh yep, because the caller can observe if cpus was/wasn't overwritten 
with the cpus_online_mask.

I guess that counts as an info leak, it doesn't let an attacker 
reconstruct actual values from the stack, but a zero/non-zero check 
could be useful in theory.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
