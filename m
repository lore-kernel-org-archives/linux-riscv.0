Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF4BECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 12:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oX3HAUcMJLK8cHcC8thWQjzDxheoNR6/C7Y2wZPs9R8=; b=Ybr87me4NOeKQr
	L7Z3YGnN6/gVzJB7NaCmd3UMnoLod3z1NUWkz4HCBqSysZXDt2XPC2o380m4QCVIcuCera+QhL05O
	hSsRQsEofbxv3fGNcC7QeLz15v6eu1AE9krBVFU7shvyWFsy4x4qsOWb3mHGXpZQom5Mn3+nEvsqJ
	zusKbAmxmS03t5xWGDx/KGpochcbdg5d592pHsMuAn7LIV/LWxQt4Sld2UOsjgFRnFLZBZw6oyrS2
	44bF0lI0JkKixGXrbHCcUSlFARTLtkQHBHpH2tRCqyErO0TBYcsQ3Hu/XKkx+bJkMvEe7TOmXN8n2
	mgR2t+0bONhFTaPN8a8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oayvO-00BIMp-OJ; Wed, 21 Sep 2022 12:33:58 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oayvK-00BIJF-On
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 12:33:57 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MXd5b1YqHz14Qhw;
	Wed, 21 Sep 2022 20:29:39 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 20:33:46 +0800
Received: from [10.67.108.67] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 20:33:45 +0800
Message-ID: <7618e500-5368-f271-44f0-81fb43527389@huawei.com>
Date: Wed, 21 Sep 2022 20:33:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH -next 0/7] riscv: Improvments for stacktrace
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <peterz@infradead.org>,
	<mingo@redhat.com>, <acme@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <namhyung@kernel.org>,
	<jolsa@kernel.org>, <frederic@kernel.org>, <vincent.chen@sifive.com>,
	<ardb@kernel.org>, <mhiramat@kernel.org>, <rostedt@goodmis.org>,
	<keescook@chromium.org>, <catalin.marinas@arm.com>
References: <20220920151202.180057-1-chenzhongjin@huawei.com>
 <CAJF2gTRUh6RiMypEm=b=iJruXDWXoqXpXwn1YaUChgyJ0v2gxw@mail.gmail.com>
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <CAJF2gTRUh6RiMypEm=b=iJruXDWXoqXpXwn1YaUChgyJ0v2gxw@mail.gmail.com>
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_053355_188367_0A076044 
X-CRM114-Status: GOOD (  14.11  )
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

Hi,

On 2022/9/21 10:30, Guo Ren wrote:
> Some modifications are related to the patch series [1] [2], please take a look.
>
> [1] https://lore.kernel.org/linux-riscv/20220918155246.1203293-1-guoren@kernel.org/
> [2] https://lore.kernel.org/linux-riscv/20220916103817.9490-1-guoren@kernel.org/

I have tested my patch on your branches.

For the ftrace one it works properly and passed FTRACE_STARTUP_TEST.

For the entry one I proposed some advice in another reply, with that my 
patch also works well.


I'll post v2 patch which is totally dependent to yours. And after your 
patch applied, the stacktrace

may need to be updated again, for example, print the type of current 
unwinding stack.


Best,

Chen

> On Tue, Sep 20, 2022 at 11:15 PM Chen Zhongjin <chenzhongjin@huawei.com> wrote:
>> Currently, the stacktrace with FRAME_POINTER on riscv has some problem:
>>
>> 1. stacktrace will stop at irq so it can't get the stack frames before
>> irq entry.
>> 2. stacktrace can't unwind all the real stack frames when there is
>> k{ret}probes or ftrace.
>>
>> These are mainly becase when there is a pt_regs on stack, we can't unwind
>> the stack frame as normal function.
>>
>> Some architectures (e.g. arm64) create a extra stackframe inside pt_regs.
>> However this doesn't work for riscv because the ra is not ensured to be
>> pushed to stack. As explained in:
>> commit f766f77a74f5("riscv/stacktrace: Fix stack output without ra on the stack top")
>>
>> So, I choosed the method of x86 that, if there is a pt_regs on stack,
>> we encoded the frame pointer and save it. When unwinding stack frame,
>> we can get pt_regs and registers required for unwinding stacks.
>>
>> In addition, the patch set contains some refactoring of stacktrace.c to
>> keep the stacktrace code on riscv consistent with other architectures.
>>
>> Chen Zhongjin (7):
>>    riscv: stacktrace: Replace walk_stackframe with arch_stack_walk
>>    riscv: stacktrace: Introduce unwind functions
>>    riscv: stacktrace: Save pt_regs in encoded fp on irq entry
>>    riscv: syscall: Don't clobber s0 when syscall
>>    riscv: stacktrace: Implement stacktrace for irq
>>    riscv: stacktrace: Fix unwinding on ftrace_regs_call
>>    riscv: stacktrace: Fix unwinding on __kretporbe_trampoline
>>
>>   arch/riscv/include/asm/frame.h                |  45 +++++
>>   arch/riscv/include/asm/stacktrace.h           |  13 +-
>>   arch/riscv/kernel/entry.S                     |  23 +--
>>   arch/riscv/kernel/mcount-dyn.S                |   8 +
>>   arch/riscv/kernel/perf_callchain.c            |   2 +-
>>   arch/riscv/kernel/probes/kprobes_trampoline.S |   8 +
>>   arch/riscv/kernel/stacktrace.c                | 155 ++++++++++++------
>>   7 files changed, 195 insertions(+), 59 deletions(-)
>>   create mode 100644 arch/riscv/include/asm/frame.h
>>
>> --
>> 2.17.1
>>
>
> --
> Best Regards
>   Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
