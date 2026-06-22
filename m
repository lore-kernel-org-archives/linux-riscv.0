Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B32CD98F2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 14:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMYIhi/9xUdtLgev47QQtqy2R3Wkg6iUSaAPeFgld/Q=; b=tGTFhGPwL8M7yM
	F6R12qZy9hxdfIc3yYAue8K20uCG7ftsmJD+E4nR4qzb6n+aaL8UL/FGad/29FOGNytMIi0lBVgbk
	n7EAfIJitbNBScm77Tbuvh1IIKi3yoczkPBm9dt0CyObIwAp1DZwqWAwF3M6GggECg4MwKXy1Rr7h
	0lH9iRXaZbPhu+jhixyJyIT4OP2QNtl/qoScT/+oaTmHC/UalC20xe5g9APUPeBwHq4Y/18sSvdAn
	POIWxlmcWzUOMFtJtU2PusrYxQGDH64NLkF4eRdJWom0yxibKE6YGtLqCHRmNjL4MiXoKTfNXSFvt
	wRqDn0un256sE5RKk4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfPO-000000053Jn-2UCV;
	Mon, 22 Jun 2026 14:13:54 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfPK-000000053JQ-3N3R
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 14:13:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lhM0w5RwW/rGQWTCRisi1w9Hdy/5TctPsnbjJjiIjvk=;
	b=uMEuUwBPHg08rRjyCgP0rKJnC1ncdX6SmaEKX0WMKYgdm8OOAfZ4KJoki1AIHsMp5v72klxhA
	7SDqV9e12RYwsupLWhQbrhjiSLh/ufwTDxC6Dzr3FFPa1jP8g5ejwoN54VJjgIcOyi3RMmxWRyz
	PddlOySuwRgPfa5FIdTM5oU=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gkVLn2z0PzRhqk;
	Mon, 22 Jun 2026 22:04:33 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B20340569;
	Mon, 22 Jun 2026 22:13:36 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 22 Jun
 2026 22:13:35 +0800
Message-ID: <25072645-3981-4251-8364-ee793bfa8041@huawei.com>
Date: Mon, 22 Jun 2026 22:13:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/3] riscv: stacktrace: Implement
 arch_bpf_stack_walk() for BPF
Content-Language: en-US
To: Varun R Mallya <varunrmallya@gmail.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
	<memxor@gmail.com>, <bjorn@kernel.org>
CC: <alex@ghiti.fr>, <martin.lau@linux.dev>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
	<puranjay@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20260621144259.288135-1-varunrmallya@gmail.com>
 <20260621144259.288135-2-varunrmallya@gmail.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260621144259.288135-2-varunrmallya@gmail.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_071351_559030_EE3D23C8 
X-CRM114-Status: GOOD (  17.49  )
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

Hi Varun,

Thank you for implementing bpf exception for riscv64.

On 2026/6/21 22:42, Varun R Mallya wrote:
> This will be used by bpf_throw() to unwind till the program marked as
> exception boundary and run the callback with the stack of the main
> program.
> This is required for supporting BPF exceptions on RISC-V.
> This depends on the frame pointer unwinder, so it is only built under
> CONFIG_FRAME_POINTER, else falls back to the weak no-op.
> 
> Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
> ---
>   arch/riscv/kernel/stacktrace.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index b41b6255751c..a4c2411f4038 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <linux/export.h>
> +#include <linux/filter.h>
>   #include <linux/kallsyms.h>
>   #include <linux/sched.h>
>   #include <linux/sched/debug.h>
> @@ -102,6 +103,33 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>   	}
>   }
>   
> +void notrace arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp),
> +				 void *cookie)
> +{
> +	unsigned long fp, sp, pc;
> +
> +	fp = (unsigned long)__builtin_frame_address(0);
> +	sp = current_stack_pointer;
> +	pc = (unsigned long)arch_bpf_stack_walk;
> +
> +	for (;;) {
> +		struct stackframe *frame;
> +
> +		if (unlikely(!__kernel_text_address(pc)))
> +			break;
> +		/* pc belongs to the function whose frame pointer is fp */
> +		if (!consume_fn(cookie, pc, sp, fp))
> +			break;
> +		if (unlikely(!fp_is_valid(fp, sp)))
> +			break;
> +
> +		frame = (struct stackframe *)fp - 1;
> +		sp = fp;
> +		fp = READ_ONCE_TASK_STACK(current, frame->fp);
> +		pc = READ_ONCE_TASK_STACK(current, frame->ra);
> +	}
> +}
> +
>   #else /* !CONFIG_FRAME_POINTER */
>   
>   void notrace walk_stackframe(struct task_struct *task,

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
