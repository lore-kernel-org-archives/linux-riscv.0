Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3486C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 03:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gsp7h0aoaaAxv2Q7YImvP+qWrxdz3AAomZmcv5NHac8=; b=ljZjuZIC7Ub8RF
	qAgC34KP9LTSMvwDzqZWlop86GP6i3lLBOSO9Y9wXmYplGYwTk/5PSeycV3QFwZoHfK5iYq5+CPDD
	wgFlLTfLiA+cm8fZ6eWX2BGU/sDYM/utGmuO23jRIAJxRo/9IBzMX7dbUHqeeF/10kDlO8TnAtELl
	t5EvJsa0y85SGwXK/Yjdma5Y0+aJvy7EF7YbNujeJkeZ3F0GslkhT5zYaSUM//XCNij1Om8z95tGs
	TQB6gz2y7kuzfJ69j204tVK05M/Btw5ZOgl86EJenm9VvfCYnrRncLHQwSvWsf4yYHl5ac7JT4l3t
	U9dRPsTA6y7c0LkEX1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVjdY-00000008BzG-0FtV;
	Mon, 22 Jul 2024 03:22:56 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVjdT-00000008ByK-3rCu
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 03:22:53 +0000
Received: from [198.18.0.1] (unknown [121.237.44.107])
	by APP-05 (Coremail) with SMTP id zQCowAAH8DpS0J1m+dlMAA--.20976S2;
	Mon, 22 Jul 2024 11:21:55 +0800 (CST)
Message-ID: <273e2040-859e-439e-8b3d-b777bbec691e@iscas.ac.cn>
Date: Mon, 22 Jul 2024 11:21:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: add tracepoints for page fault
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240715101400.39103-1-zhuhengbo@iscas.ac.cn>
 <20240717082728.84401-1-zhuhengbo@iscas.ac.cn> <ZpuO7Du1L-m_I-GB@xhacker>
From: Zhu Hengbo <zhuhengbo@iscas.ac.cn>
In-Reply-To: <ZpuO7Du1L-m_I-GB@xhacker>
X-CM-TRANSID: zQCowAAH8DpS0J1m+dlMAA--.20976S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JrWkZFWrWrW5Zr1rtw4ruFg_yoW7tr18pF
	nrCFs8GF47Xr42vw4xXwnFyF15CanYkrWjgryak3yYva1IqryUAr4vg390yr17Arn0y3WI
	kF4Yyrya9r15uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9qb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjxUyn2-DUUUU
X-Originating-IP: [121.237.44.107]
X-CM-SenderInfo: x2kxxvpqje0q5lvft2wodfhubq/1tbiDAUGDGadstBrAwAAsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_202252_364262_C80CD29A 
X-CRM114-Status: GOOD (  17.14  )
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


On 2024/7/20 18:18, Jisheng Zhang wrote:
> On Wed, Jul 17, 2024 at 08:27:19AM +0000, Zhu Hengbo wrote:
>> Introduce page_fault_user and page_fault_kernel for riscv page fault.
>> Help to get more detail information when page fault happen.
> Just curious what's the expected usage? The mm subsystem has supported
> page faults perf software event, is it enough?


I think there will still be situations where we need to use debugfs for debugging in cases where perf is not available.

In fact, I am working to achieve parity in functionality for RISC-V with x86 and ARM.
In x86, there are both perf software events and tracepoints.


>> Signed-off-by: Zhu Hengbo <zhuhengbo@iscas.ac.cn>
>> ---
>> Changes in v2:
>> - Add print instruction point info
>>
>> Simple test go below:
>>
>> root@riscv-ubuntu2204 ~ # bin/perf list | grep exceptions
>>   exceptions:page_fault_kernel                       [Tracepoint event]
>>   exceptions:page_fault_user                         [Tracepoint event]
>>
>> root@riscv-ubuntu2204 ~ # bin/perf record -e exceptions:page_fault_kernel -e exceptions:page_fault_user
>> [ perf record: Woken up 1 times to write data ]
>> [ perf record: Captured and wrote 0.091 MB perf.data (19 samples) ]
>>
>> perf report tracepoint:
>> perf     563 [007]   115.824363:   exceptions:page_fault_user: user page fault, address=0x7fff94cf6400 epc=0x55558632808e cause=0xd
>> perf     563 [007]   115.824441:   exceptions:page_fault_user: user page fault, address=0x7fff94c75400 epc=0x55558632808e cause=0xd
>> perf     563 [007]   115.824518:   exceptions:page_fault_user: user page fault, address=0x7fff94bf4400 epc=0x55558632808e cause=0xd
>> perf     563 [007]   115.824907: exceptions:page_fault_kernel: kernel page fault, address=0x7fff94bf5000 epc=fault_in_readable cause=0xd
>> perf     563 [007]   115.825238:   exceptions:page_fault_user: user page fault, address=0x7fff94bf4408 epc=0x5555863281bc cause=0xf
>> perf     564 [000]   116.247999:   exceptions:page_fault_user: user page fault, address=0x7fff94b73400 epc=0x55558632808e cause=0xd
>> perf     564 [000]   116.248558:   exceptions:page_fault_user: user page fault, address=0x7fff94af2400 epc=0x55558632808e cause=0xd
>> ---
>>  arch/riscv/include/asm/trace/exceptions.h | 66 +++++++++++++++++++++++
>>  arch/riscv/mm/fault.c                     | 15 ++++++
>>  2 files changed, 81 insertions(+)
>>  create mode 100644 arch/riscv/include/asm/trace/exceptions.h
>>
>> diff --git a/arch/riscv/include/asm/trace/exceptions.h b/arch/riscv/include/asm/trace/exceptions.h
>> new file mode 100644
>> index 000000000000..ff258da2f45f
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/trace/exceptions.h
>> @@ -0,0 +1,66 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Tracepoints for RISC-V exceptions
>> + *
>> + * Copyright (C) 2024 ISCAS. All rights reserved
>> + *
>> + */
>> +
>> +#if !defined(_TRACE_PAGE_FAULT_H) || defined(TRACE_HEADER_MULTI_READ)
>> +#define _TRACE_PAGE_FAULT_H
>> +
>> +#include <linux/tracepoint.h>
>> +
>> +#undef TRACE_SYSTEM
>> +#define TRACE_SYSTEM exceptions
>> +
>> +TRACE_EVENT(page_fault_user,
>> +	TP_PROTO(struct pt_regs *regs),
>> +	TP_ARGS(regs),
>> +
>> +	TP_STRUCT__entry(
>> +		__field(unsigned long, address)
>> +		__field(unsigned long, epc)
>> +		__field(unsigned long, cause)
>> +	),
>> +
>> +	TP_fast_assign(
>> +		__entry->address	= regs->badaddr;
>> +		__entry->epc		= regs->epc;
>> +		__entry->cause		= regs->cause;
>> +	),
>> +
>> +	TP_printk("user page fault, address=%ps epc=%ps cause=0x%lx",
>> +			(void *)__entry->address, (void *)__entry->epc,
>> +			__entry->cause)
>> +);
>> +
>> +TRACE_EVENT(page_fault_kernel,
>> +	TP_PROTO(struct pt_regs *regs),
>> +	TP_ARGS(regs),
>> +
>> +	TP_STRUCT__entry(
>> +		__field(unsigned long, address)
>> +		__field(unsigned long, epc)
>> +		__field(unsigned long, cause)
>> +	),
>> +
>> +	TP_fast_assign(
>> +		__entry->address	= regs->badaddr;
>> +		__entry->epc		= regs->epc;
>> +		__entry->cause		= regs->cause;
>> +	),
>> +
>> +	TP_printk("kernel page fault, address=%ps epc=%ps cause=0x%lx",
>> +			(void *)__entry->address, (void *)__entry->epc,
>> +			__entry->cause)
>> +);
>> +
>> +#undef TRACE_INCLUDE_PATH
>> +#undef TRACE_INCLUDE_FILE
>> +#define TRACE_INCLUDE_PATH asm/trace/
>> +#define TRACE_INCLUDE_FILE exceptions
>> +#endif /*  _TRACE_PAGE_FAULT_H */
>> +
>> +/* This part must be outside protection */
>> +#include <trace/define_trace.h>
>> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
>> index 5224f3733802..22874074c5bc 100644
>> --- a/arch/riscv/mm/fault.c
>> +++ b/arch/riscv/mm/fault.c
>> @@ -22,6 +22,10 @@
>>  
>>  #include "../kernel/head.h"
>>  
>> +
>> +#define CREATE_TRACE_POINTS
>> +#include <asm/trace/exceptions.h>
>> +
>>  static void die_kernel_fault(const char *msg, unsigned long addr,
>>  		struct pt_regs *regs)
>>  {
>> @@ -215,6 +219,15 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
>>  	return false;
>>  }
>>  
>> +
>> +static inline void trace_page_fault(struct pt_regs *regs)
>> +{
>> +	if (user_mode(regs))
>> +		trace_page_fault_user(regs);
>> +	else
>> +		trace_page_fault_kernel(regs);
>> +}
>> +
>>  /*
>>   * This routine handles page faults.  It determines the address and the
>>   * problem, and then passes it off to one of the appropriate routines.
>> @@ -235,6 +248,8 @@ void handle_page_fault(struct pt_regs *regs)
>>  	tsk = current;
>>  	mm = tsk->mm;
>>  
>> +	trace_page_fault(regs);
>> +
>>  	if (kprobe_page_fault(regs, cause))
>>  		return;
>>  
>> -- 
>> 2.34.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
