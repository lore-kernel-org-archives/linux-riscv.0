Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC81C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 03:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2HHI915Fwpc2VtJu8TaRSBDkVGprFEzKgJ0BN5ppG8=; b=h47EnuyEIochwE
	GnTP7PZZbRqdyR9wHXg7y+aMzblZiRwCiVJrvP/2taJ3bjTdplhXYtFiiOQhtEsImDChyWYD85Idp
	ZgLN2PePLxDDWKKYfUrbXz8EyPJZ3gTTxKGIJuHCEwsvrdMtKcU7PBOmD+klniN5fP8kxJTnLediy
	ZRPU2un4ZkzWIYNjX3vFfdKWix/Bann++9CzohNiQs9ucqqjtDZMuYFKSobvnvf+wpc1jgoOl/w2y
	hnWAfKn3BMqscyLyzvqYIVUop46Ad+PDXXbgQO7byeQZYes5HflgsK791WS8hWqJYptvc49KxZmbW
	C4rgnmVAqaq9cO/GXWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oapyU-008Ptl-AD; Wed, 21 Sep 2022 03:00:34 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oapyP-008Ppz-JZ
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 03:00:32 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXNMz1WBSzlWcH;
	Wed, 21 Sep 2022 10:56:15 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 11:00:21 +0800
Received: from [10.67.108.67] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 11:00:21 +0800
Message-ID: <8b7093a5-291f-6c2f-e915-51b07d912ca1@huawei.com>
Date: Wed, 21 Sep 2022 11:00:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH -next 6/7] riscv: stacktrace: Fix unwinding on
 ftrace_regs_call
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
 <20220920151202.180057-7-chenzhongjin@huawei.com>
 <CAJF2gTSQAzqLcJSp4B=8vPTb10+TieZXDJPAigCBgm5iVYpdTg@mail.gmail.com>
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <CAJF2gTSQAzqLcJSp4B=8vPTb10+TieZXDJPAigCBgm5iVYpdTg@mail.gmail.com>
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_200030_165875_54CAEBBF 
X-CRM114-Status: GOOD (  11.59  )
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

On 2022/9/21 9:43, Guo Ren wrote:
> On Tue, Sep 20, 2022 at 11:15 PM Chen Zhongjin <chenzhongjin@huawei.com> wrote:
>> When unwinding on ftrace_regs_call, the traced function will be skipped
>> because ftrace_regs_caller doesn't save the fp and ra.
>>
>> Save the encoded fp so that we can get the pt_regs so that we can unwind
>> from ftrace_regs_call to the traced function.
>>
>> Also the pt_regs->status should be set as kernel mode.
>>
>> Stacktrace before this patch:
>>
>>   Call Trace:
>>    ...
>>    [<ffffffff0161a0e0>] handler_pre+0x30/0x4a [kprobe_unwind]
>>    [<ffffffff800bce92>] aggr_pre_handler+0x60/0x94
>>    [<ffffffff80006df0>] kprobe_ftrace_handler+0x13e/0x188
>>    [<ffffffff80008e7e>] ftrace_regs_call+0x8/0x10
>>    [<ffffffff80002540>] do_one_initcall+0x4c/0x1f2
>>    [<ffffffff8008a4e6>] do_init_module+0x56/0x210
>>   ...
>>
>> Stacktrace after this patch:
>>
>>   Call Trace:
>>    ...
>>    [<ffffffff016150e0>] handler_pre+0x30/0x4a [kprobe_unwind]
>>    [<ffffffff800bce96>] aggr_pre_handler+0x60/0x94
>>    [<ffffffff80006df0>] kprobe_ftrace_handler+0x13e/0x188
>>    [<ffffffff80008e82>] ftrace_regs_call+0x8/0x10
>> + [<ffffffff01615000>] empty_call+0x0/0x1e [kprobe_unwind]
>>    [<ffffffff80002540>] do_one_initcall+0x4c/0x1f2
>>    [<ffffffff8008a4ea>] do_init_module+0x56/0x210
>>    ...
>>
>> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
>> ---
>>   arch/riscv/kernel/mcount-dyn.S | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
>> index d171eca623b6..56a4014c392f 100644
>> --- a/arch/riscv/kernel/mcount-dyn.S
>> +++ b/arch/riscv/kernel/mcount-dyn.S
>> @@ -10,6 +10,8 @@
>>   #include <asm/asm-offsets.h>
>>   #include <asm-generic/export.h>
>>   #include <asm/ftrace.h>
>> +#include <asm/frame.h>
>> +#include <asm/csr.h>
>>
>>          .text
>>
>> @@ -97,6 +99,11 @@
>>          REG_S x29, PT_T4(sp)
>>          REG_S x30, PT_T5(sp)
>>          REG_S x31, PT_T6(sp)
>> +
>> +#ifdef CONFIG_FRAME_POINTER
>> +       li s0, SR_PP
>> +       REG_S s0, PT_STATUS(sp)
> Change another register.
>
>> +#endif
>>          .endm
>>
>>          .macro RESTORE_ALL
>> @@ -172,6 +179,7 @@ ENDPROC(ftrace_caller)
>>   #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>>   ENTRY(ftrace_regs_caller)
>>          SAVE_ALL
>> +       ENCODE_FRAME_POINTER
> Maybe the patch should merge with others, so separated make it hard to review.

Thanks for review!

Happy to see you have approved the ENCODE FP part.

The patches is separated just because I wanted to paste the call trace 
result in commit message.

I'll merge the ENCODE_FRAME_POINTER patches all together and do this in 
the cover.


Also noticed another email for your ongoing patches. I'll review them 
and reply later.


Best,

Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
