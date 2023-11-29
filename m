Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE438C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 20:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLolXrHUrDTj3gF+KBuPeMv2EJYdMCpwQpAzbrzGu88=; b=fF1I36+NjARbYM
	w2spkjAR7VGQ/zkRg7O+gCqHFNIc1w2xGL/3O6zRe+llbokNzEY6hK7MXdpaDP3aBdT3cTlcR83Gt
	THu5kkogq3A23u/3WT6qPlWO/Vc9ka4X7hbPHA1QXCCOxGNapm6zGmrZHqhSjyT23Nh7kjocUU56t
	Vo9ILz5TMQX1mO/ZvJQjs40yn/QTVPQ76iurO7F7ZDE7qLD8W4A+HqmBINc9CYGZAXzvxe1rBhXq2
	XQWYqC4Zu2HLtzCQFoZU+dmAfJSbIpUgn36QbzVMFpZAcj25PutRKNlVnCNYxlN3loCHIJGpqksSi
	aXW/Pg7RJcayXrcJj4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8QkA-009D7M-1v;
	Wed, 29 Nov 2023 20:01:10 +0000
Received: from smtpout.efficios.com ([167.114.26.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Qk7-009D4v-0T
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 20:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1701288054;
	bh=gURHk+F8I/B5qgEFhrTj6bvW+61mibfmAZ8NGFKftRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OH9niDeIBd0DjmAc5qNoWQTFhzi/2fIRejCFBUs8qs3LNdUZvNSey2gc7Sl9R4qpW
	 poQgVCF5eSYDo3VrPFCgEiFsiKYfm4h10fVbkLQSGIwu7v1skE+2jxa70ppPsWEEqA
	 yTzUNMqWSNaZXmDJLm8jxj2Ygk3bBioP462nfJ5jttf1BPIZR7fQWUDB6cLQhmk41a
	 KG7i9EvcdtxzO2/gWw24AwgQHR4S1Ey3Qu/iGvckJch5ZkPZk9TiFxZY8gXXGXFTOL
	 2Cs9E+ogCtQViwmqZmX35fLCOewOSbUboKaav10J35CoEc0fd8yBZc1cqadGgh4sjk
	 bvuQ2FH6CbF0Q==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4SgVYy1HMKz1dw0;
	Wed, 29 Nov 2023 15:00:54 -0500 (EST)
Message-ID: <53aac2ac-46ae-46b8-9fdf-34527b79a63b@efficios.com>
Date: Wed, 29 Nov 2023 15:00:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] membarrier: riscv: Provide core serializing command
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>
Cc: paulmck@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, mmaas@google.com, hboehm@google.com,
 striker@us.ibm.com, charlie@rivosinc.com, rehn@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231127103235.28442-1-parri.andrea@gmail.com>
 <20231127103235.28442-3-parri.andrea@gmail.com>
 <91ab0210-07f9-42c4-af7f-a98799250cf7@efficios.com> <ZWYDtB/otYvTMZWd@andrea>
 <0a84c0e0-2571-4c7f-82ae-a429f467a16b@efficios.com> <ZWeDF0eHyOc/b9UJ@andrea>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <ZWeDF0eHyOc/b9UJ@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_120107_269163_29436F79 
X-CRM114-Status: GOOD (  16.35  )
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

On 2023-11-29 13:29, Andrea Parri wrote:
>>> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
>>> index 217fd4de61342..f63222513076d 100644
>>> --- a/arch/riscv/mm/context.c
>>> +++ b/arch/riscv/mm/context.c
>>> @@ -323,6 +323,23 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>>>    	if (unlikely(prev == next))
>>>    		return;
>>> +#if defined(CONFIG_MEMBARRIER) && defined(CONFIG_SMP)
>>> +	/*
>>> +	 * The membarrier system call requires a full memory barrier
>>> +	 * after storing to rq->curr, before going back to user-space.
>>> +	 *
>>> +	 * Only need the full barrier when switching between processes:
>>> +	 * barrier when switching from kernel to userspace is not
>>> +	 * required here, given that it is implied by mmdrop(); barrier
>>> +	 * when switching from userspace to kernel is not needed after
>>> +	 * store to rq->curr.
>>> +	 */
>>> +	if (unlikely(atomic_read(&next->membarrier_state) &
>>> +		     (MEMBARRIER_STATE_PRIVATE_EXPEDITED |
>>> +		      MEMBARRIER_STATE_GLOBAL_EXPEDITED)) && prev)
>>> +		smp_mb();
>>> +#endif
>>
>> The approach looks good. Please implement it within a separate
>> membarrier_arch_switch_mm() as done on powerpc.
> 
> Will do.  Thanks.
> 
> As regards the Fixes: tag, I guess it boils down to what we want or we
> need to take for commit "riscv: Support membarrier private cmd".  :-)

I'm not seeing this commit in the Linux master branch, am I missing
something ?

> FWIW, a quick git-log search confirmed that MEMBARRIER has been around
> for quite some time in the RISC-V world (though I'm not familiar with
> any of its mainstream uses): commit 1464d00b27b2 says (at least) since
> 93917ad50972 ("RISC-V: Add support for restartable sequence").  I am
> currently inclined to pick the latter commit (and check it w/ Palmer),
> but other suggestions are welcome.

Supporting membarrier private expedited is not optional since Linux 4.14:

see kernel/sched/core.c:

                 membarrier_switch_mm(rq, prev->active_mm, next->mm);
                 /*
                  * sys_membarrier() requires an smp_mb() between setting
                  * rq->curr / membarrier_switch_mm() and returning to userspace.
                  *
                  * The below provides this either through switch_mm(), or in
                  * case 'prev->active_mm == next->mm' through
                  * finish_task_switch()'s mmdrop().
                  */
                 switch_mm_irqs_off(prev->active_mm, next->mm, next);

Failure to provide the required barrier is a bug in the architecture's
switch_mm implementation when CONFIG_MEMBARRIER=y.

We should probably introduce a new
Documentation/features/sched/membarrier/arch-support.txt
to clarify this requirement.

Userspace code such as liburcu [1] heavily relies on membarrier private
expedited (when available) to speed up RCU read-side critical sections.
Various DNS servers, including BIND 9, use liburcu.

Thanks,

Mathieu

[1] https:/liburcu.org


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
