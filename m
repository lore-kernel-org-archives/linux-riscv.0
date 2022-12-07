Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362DBC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 02:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:CC:References:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6BPDhpAWt5eYR2snZ9ghjQdjxc26gohrZgZr5XjInQA=; b=i1FlxFLHYlb7lVvIenUG6fLEwm
	mQ3W5U4+hUWEqHKrJ3epDiLvR4lNa1UeP+cWt6sumaFh3f04VtWvYkyZi8fKgYaRvjJOpQvW/sRLj
	dFb6nYEgrL2u1Q/iyzZUB5+eiMiB7bJtlQCTpT4rdjp3k9iji2gMQDqpe2Pj2Qkdyu11AoU3mT1fj
	Q1iBZF3VL9y82qbTPIav91ndynB0iGsSAZn8uxJJiZLkecyTzl10C6RD7Rn1L76mEUlWImBE2xCkX
	nYs5Mt8R6iVpzVo6+cMYC4hrFDQt2eC6TvjxMEmOXq1ZeR3s1L0zndtB9TsvUAaoN71sxwKWwxeam
	xFqZh3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jlb-008AAk-SO; Wed, 07 Dec 2022 02:02:35 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jlX-0089zy-EE
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 02:02:34 +0000
Received: from dggpemm100009.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NRgWN1B6tzJqJV;
	Wed,  7 Dec 2022 10:01:36 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemm100009.china.huawei.com (7.185.36.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Dec 2022 10:02:24 +0800
Subject: Re: [PATCH] riscv: stacktrace: Fix missing the first frame
To: Conor Dooley <conor@kernel.org>
References: <20221205132936.493245-1-liushixin2@huawei.com>
 <Y49qvHb3LVas1cvO@spud>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Changbin Du
	<changbin.du@intel.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
From: Liu Shixin <liushixin2@huawei.com>
Message-ID: <e3bace03-b0eb-9e58-f39e-6ecf8589491c@huawei.com>
Date: Wed, 7 Dec 2022 10:02:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <Y49qvHb3LVas1cvO@spud>
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_180232_267032_A463FA46 
X-CRM114-Status: GOOD (  19.32  )
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



On 2022/12/7 0:15, Conor Dooley wrote:
> On Mon, Dec 05, 2022 at 09:29:36PM +0800, Liu Shixin wrote:
>> When running kfence_test, I found some testcases failed like this:
>>
>>  # test_out_of_bounds_read: EXPECTATION FAILED at mm/kfence/kfence_test.c:346
>>  Expected report_matches(&expect) to be true, but is false
>>  not ok 1 - test_out_of_bounds_read
>>
>> The corresponding call-trace is:
>>
>>  BUG: KFENCE: out-of-bounds read in kunit_try_run_case+0x38/0x84
>>
>>  Out-of-bounds read at 0x(____ptrval____) (32B right of kfence-#10):
>>   kunit_try_run_case+0x38/0x84
>>   kunit_generic_run_threadfn_adapter+0x12/0x1e
>>   kthread+0xc8/0xde
>>   ret_from_exception+0x0/0xc
>>
>> The kfence_test using the first frame of call trace to check whether the
>> testcase is succeed or not. Patch a7c5c7e8ff78 skip first frame for all
>> case, which results the kfence_test failed. Indeed, we only need to skip
>> the first frame for case (task==NULL || task==current).
>>
>> With this patch, the call-trace will be:
>>
>>  BUG: KFENCE: out-of-bounds read in test_out_of_bounds_read+0x88/0x19e
>>
>>  Out-of-bounds read at 0x(____ptrval____) (1B left of kfence-#7):
>>   test_out_of_bounds_read+0x88/0x19e
>>   kunit_try_run_case+0x38/0x84
>>   kunit_generic_run_threadfn_adapter+0x12/0x1e
>>   kthread+0xc8/0xde
>>   ret_from_exception+0x0/0xc
>>
>> Fixes: a7c5c7e8ff78 ("riscv: eliminate unreliable __builtin_frame_address(1)")
> This fixes tag is not right, did checkpatch not warn about it?
Yes, there are no warn. Maybe it's because I do have this commit in my local repository.
I confused the original commit with my local commit.

Thanks for your reminder. I'll fix it as soon as possible.
> The correct fixes tag would be:
> Fixes: 6a00ef449370 ("riscv: eliminate unreliable __builtin_frame_address(1)")
>
> Maybe consider automating the creation of fixes tags, like so:
> git log -1 --format='Fixes: %h (\"%s\")'
Thanks, it seems to be convenient.

>
> Thanks,
> Conor.
>
>> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
>> ---
>>  arch/riscv/kernel/stacktrace.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
>> index 08d11a53f39e..5fe2ae4cf135 100644
>> --- a/arch/riscv/kernel/stacktrace.c
>> +++ b/arch/riscv/kernel/stacktrace.c
>> @@ -30,6 +30,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>>  		fp = (unsigned long)__builtin_frame_address(0);
>>  		sp = current_stack_pointer;
>>  		pc = (unsigned long)walk_stackframe;
>> +		level = -1;
>>  	} else {
>>  		/* task blocked in __switch_to */
>>  		fp = task->thread.s[0];
>> @@ -41,7 +42,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>>  		unsigned long low, high;
>>  		struct stackframe *frame;
>>  
>> -		if (unlikely(!__kernel_text_address(pc) || (level++ >= 1 && !fn(arg, pc))))
>> +		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc))))
>>  			break;
>>  
>>  		/* Validate frame pointer */
>> -- 
>> 2.25.1
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
