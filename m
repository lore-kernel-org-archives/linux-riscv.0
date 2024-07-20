Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D250EC3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 10:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hFy0WQbiCNFNPdWzThQpyqIX/2xDuA3UUIkBCuuT2A=; b=nc5hKfPM0JxY8V
	Ej8i487qVIFMHy+8nb5ES16ClWO6miHfdu9qDXMQlKQ5kFvq0oKoPiaJloKAL/Y780jBUf82aGB0J
	sjqXcMFFmgq8m9Zqz1TAI1Uk14lan5TzqeASpeUzKv404E+aCSwK4a7nssLG6PKCyAT4eVNW6L7v1
	FXcnUioKRX9JNp39WQLavxidDvSjULwZ051Qn9dfGxkR5WBO5ARxGcHSIyZRdv7i8N8ypwf0OmqRZ
	oO9a/oYyl1xbZa+wMV7T/2M4yJBI4dRjpzfj95wa5nrEw7hpfcAMl0qmFcyyJ9BYd/kUw9W31l9ck
	NotPW7Ym5D615pc9n8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV7OX-00000004vfJ-3P9W;
	Sat, 20 Jul 2024 10:32:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV7OT-00000004ve9-3O5m
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jul 2024 10:32:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E133ECE0138;
	Sat, 20 Jul 2024 10:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42204C2BD10;
	Sat, 20 Jul 2024 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721471566;
	bh=no/gchey9dA5kKh7DZHwzN7x/LS5bd0amWk45TC0q7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xy9vauJshyR5q9vr91qVrTnhjzabpUPzwwaph9Roklj6vKyFQKl50URKVpwk/nDmh
	 IoPjT+3lB5B7JUNIjUogPU4RFi/WGab2Av/AjW2eBo6W+fkqKr5xmrwSHC00pczwAn
	 WK0Fxn1sFwSVKJoPpmaIZ2ZnzdmJzjPRnCzc56BX3ouJR4T0moB6TZog2kqiDSOHN0
	 RVKWRcuxxqchQmp5zULFdfzlRN6Be32qM/UeBMvAXSQVX6IcbyJ99ocP/VgdIbSY91
	 9cb1+ksIYETXHh5iF4ififYMEzkSpoOuGtq/1DjgPz0wR50sqsKDkKzuSBsDRzT2cs
	 VYdK/gj5lYagw==
Date: Sat, 20 Jul 2024 18:18:20 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Zhu Hengbo <zhuhengbo@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: add tracepoints for page fault
Message-ID: <ZpuO7Du1L-m_I-GB@xhacker>
References: <20240715101400.39103-1-zhuhengbo@iscas.ac.cn>
 <20240717082728.84401-1-zhuhengbo@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240717082728.84401-1-zhuhengbo@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_033250_231426_FA8D965D 
X-CRM114-Status: GOOD (  23.29  )
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

On Wed, Jul 17, 2024 at 08:27:19AM +0000, Zhu Hengbo wrote:
> Introduce page_fault_user and page_fault_kernel for riscv page fault.
> Help to get more detail information when page fault happen.

Just curious what's the expected usage? The mm subsystem has supported
page faults perf software event, is it enough?

> 
> Signed-off-by: Zhu Hengbo <zhuhengbo@iscas.ac.cn>
> ---
> Changes in v2:
> - Add print instruction point info
> 
> Simple test go below:
> 
> root@riscv-ubuntu2204 ~ # bin/perf list | grep exceptions
>   exceptions:page_fault_kernel                       [Tracepoint event]
>   exceptions:page_fault_user                         [Tracepoint event]
> 
> root@riscv-ubuntu2204 ~ # bin/perf record -e exceptions:page_fault_kernel -e exceptions:page_fault_user
> [ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 0.091 MB perf.data (19 samples) ]
> 
> perf report tracepoint:
> perf     563 [007]   115.824363:   exceptions:page_fault_user: user page fault, address=0x7fff94cf6400 epc=0x55558632808e cause=0xd
> perf     563 [007]   115.824441:   exceptions:page_fault_user: user page fault, address=0x7fff94c75400 epc=0x55558632808e cause=0xd
> perf     563 [007]   115.824518:   exceptions:page_fault_user: user page fault, address=0x7fff94bf4400 epc=0x55558632808e cause=0xd
> perf     563 [007]   115.824907: exceptions:page_fault_kernel: kernel page fault, address=0x7fff94bf5000 epc=fault_in_readable cause=0xd
> perf     563 [007]   115.825238:   exceptions:page_fault_user: user page fault, address=0x7fff94bf4408 epc=0x5555863281bc cause=0xf
> perf     564 [000]   116.247999:   exceptions:page_fault_user: user page fault, address=0x7fff94b73400 epc=0x55558632808e cause=0xd
> perf     564 [000]   116.248558:   exceptions:page_fault_user: user page fault, address=0x7fff94af2400 epc=0x55558632808e cause=0xd
> ---
>  arch/riscv/include/asm/trace/exceptions.h | 66 +++++++++++++++++++++++
>  arch/riscv/mm/fault.c                     | 15 ++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 arch/riscv/include/asm/trace/exceptions.h
> 
> diff --git a/arch/riscv/include/asm/trace/exceptions.h b/arch/riscv/include/asm/trace/exceptions.h
> new file mode 100644
> index 000000000000..ff258da2f45f
> --- /dev/null
> +++ b/arch/riscv/include/asm/trace/exceptions.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Tracepoints for RISC-V exceptions
> + *
> + * Copyright (C) 2024 ISCAS. All rights reserved
> + *
> + */
> +
> +#if !defined(_TRACE_PAGE_FAULT_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_PAGE_FAULT_H
> +
> +#include <linux/tracepoint.h>
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM exceptions
> +
> +TRACE_EVENT(page_fault_user,
> +	TP_PROTO(struct pt_regs *regs),
> +	TP_ARGS(regs),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned long, address)
> +		__field(unsigned long, epc)
> +		__field(unsigned long, cause)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->address	= regs->badaddr;
> +		__entry->epc		= regs->epc;
> +		__entry->cause		= regs->cause;
> +	),
> +
> +	TP_printk("user page fault, address=%ps epc=%ps cause=0x%lx",
> +			(void *)__entry->address, (void *)__entry->epc,
> +			__entry->cause)
> +);
> +
> +TRACE_EVENT(page_fault_kernel,
> +	TP_PROTO(struct pt_regs *regs),
> +	TP_ARGS(regs),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned long, address)
> +		__field(unsigned long, epc)
> +		__field(unsigned long, cause)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->address	= regs->badaddr;
> +		__entry->epc		= regs->epc;
> +		__entry->cause		= regs->cause;
> +	),
> +
> +	TP_printk("kernel page fault, address=%ps epc=%ps cause=0x%lx",
> +			(void *)__entry->address, (void *)__entry->epc,
> +			__entry->cause)
> +);
> +
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH asm/trace/
> +#define TRACE_INCLUDE_FILE exceptions
> +#endif /*  _TRACE_PAGE_FAULT_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 5224f3733802..22874074c5bc 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -22,6 +22,10 @@
>  
>  #include "../kernel/head.h"
>  
> +
> +#define CREATE_TRACE_POINTS
> +#include <asm/trace/exceptions.h>
> +
>  static void die_kernel_fault(const char *msg, unsigned long addr,
>  		struct pt_regs *regs)
>  {
> @@ -215,6 +219,15 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
>  	return false;
>  }
>  
> +
> +static inline void trace_page_fault(struct pt_regs *regs)
> +{
> +	if (user_mode(regs))
> +		trace_page_fault_user(regs);
> +	else
> +		trace_page_fault_kernel(regs);
> +}
> +
>  /*
>   * This routine handles page faults.  It determines the address and the
>   * problem, and then passes it off to one of the appropriate routines.
> @@ -235,6 +248,8 @@ void handle_page_fault(struct pt_regs *regs)
>  	tsk = current;
>  	mm = tsk->mm;
>  
> +	trace_page_fault(regs);
> +
>  	if (kprobe_page_fault(regs, cause))
>  		return;
>  
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
