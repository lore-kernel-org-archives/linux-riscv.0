Return-Path: <SRS0=RTcI=GM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18478C433DB
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jan 2021 23:14:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C809923975
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jan 2021 23:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C809923975
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=A3dL4GwAcyRAvm3orGelfHQiY+JFoi60GCNGPidxmY4=; b=0imdIiKg0eeJ+CtOpBXuAB8ml
	g5n4EK3WlNn2lrk3GwCMknM5h3KeoLQQYCE8td9I0D+5P0URZQ5gRK70qAtmds2JcfLjYfzY8p/eH
	vG1v1V/UMtMWfRaubcgqeR/EWP/Gn/dYvBl79LhiUs1xw8Bs2Ulri2dQ3eNH4HULIIwpFPQDNHlSr
	Hx4fNroYkf4kvKH4Mw/SGnAxgaxKsoz6NL/edCPdwuI3hB4Exb8M7GezgNPjoYB+GGkCpwr1HcLyw
	V18azzJIypb4JMqQWnaalKa2iNpu+JfVNidMK4J3NqliIWn0AMDeEC8aIki1NVBJmVUYknkQXJMgu
	8+6x+s1Hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyNQn-00077L-1A; Sat, 09 Jan 2021 23:14:01 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyMf5-00057T-0e
 for linux-riscv@lists.infradead.org; Sat, 09 Jan 2021 22:24:44 +0000
Received: by mail-pg1-x533.google.com with SMTP id n10so10023353pgl.10
 for <linux-riscv@lists.infradead.org>; Sat, 09 Jan 2021 14:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8jO6peNCFCsdIJiomlgSocSpgqixsztiGecX28LPTMM=;
 b=jBDRyKVr1NadYUtpXf3am3NBXSRL8pt04z1SJLMR+f9MAAYsAclHy15W3GAa6YJEHS
 x2DAxbKQbHWoFiF5kWlPFqabX6TibYROffrn6FltANWj5/PVwxrK+AzyL6VIGexZahi0
 a1vuap2bvnFE2vNe86FlA745AnGLLfUnwjVH9k0/Hcis1fCOLRVsay4UOHfF0yqbavw5
 H406OXVqhoce5rREf4/ZeyRHWngXeKlKfBmU0cI0pM2znU0hU9OE2Z3FrL8jcBVWNj1Y
 FGm3EnlT4c4PVWmOsPm8fJYXLLMGEvUMazZVg1uWp5VzO+BwCIfMMT/6Zdwrsy+9PmPa
 oypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8jO6peNCFCsdIJiomlgSocSpgqixsztiGecX28LPTMM=;
 b=bplgZB8I8KYSL7PSpKl5wTN4a71lXpiEcfOzYfTRkzPxSo5HLD5CXcXeXiy1QNP37r
 LGbx89XXHPPNQvnPLnonXuiaoC+0AxHpg9ed24sYy2AALIou19vwr4x+st5MB7brnb9c
 yiGwWLQpLI0N6uuTY80fAE9OFG8N3W8vBtOhJwNzTqlO+5tACDQQZ1NwnpgHl64JDVYP
 KEVm46PZElIhMANjGqhU7hnTiu4dmMQDx6uXM3MKKruXb+tabjl1H5wyqn9Jel1eZf85
 a6Zio0EQt+Y+NdGVd9MitjlPgj/F/LA5eGzSpmhXNkp24lg242Sj1WU7TdjfyLl5Rr3S
 nBGA==
X-Gm-Message-State: AOAM533Hqe8hLYjyTsxWdm0kLG6EPtlTHAYFZHdB61iluoA5i3ioBXKR
 za7oYvvR3XgDZx79XMOKnGSFkw==
X-Google-Smtp-Source: ABdhPJxUkd9awf3gYUoz2oeQlg2MhkDyB7jFFhDkaL5rB/Vs6DT33wHdiDnLCIbasQPaLsjffpNRUw==
X-Received: by 2002:a63:4c4b:: with SMTP id m11mr13323114pgl.20.1610231080612; 
 Sat, 09 Jan 2021 14:24:40 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t1sm9400479pju.43.2021.01.09.14.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 14:24:39 -0800 (PST)
Date: Sat, 09 Jan 2021 14:24:39 -0800 (PST)
X-Google-Original-Date: Sat, 09 Jan 2021 14:24:38 PST (-0800)
Subject: Re: [PATCH 1/2] riscv: Add dump stack in show_regs
In-Reply-To: <30626a12-5cb5-c113-ab6c-9fdc3c598c70@huawei.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-965396e3-01db-4be9-bc1d-1da8cb0127f0@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_172443_150822_69B2280C 
X-CRM114-Status: GOOD (  18.89  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 14 Dec 2020 03:52:19 PST (-0800), wangkefeng.wang@huawei.com wrote:
> hi Palmer, kindly ping...

Sorry, it looks like I missed this because it's all threaded together.  I'm not
really sure what you're trying to do here: you've got three patch sets in one
thread, one of which seems to be a v2 of only a single patch.

Do you mind sending out a standalone version of this?

>
> On 2020/11/24 19:20, Kefeng Wang wrote:
>> Like commit 1149aad10b1e ("arm64: Add dump_backtrace() in show_regs"),
>> dump the stack in riscv show_regs as common code expects.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>> NOTE: The patches based on
>> https://patchwork.kernel.org/project/linux-riscv/list/?series=383349
>>
>>   arch/riscv/include/asm/bug.h        |  1 +
>>   arch/riscv/include/asm/stacktrace.h |  2 ++
>>   arch/riscv/kernel/process.c         |  9 ++++++++-
>>   arch/riscv/kernel/stacktrace.c      | 10 ++++++++--
>>   arch/riscv/kernel/traps.c           |  3 ++-
>>   5 files changed, 21 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
>> index d6f1ec08d97b..d3804a2f9aad 100644
>> --- a/arch/riscv/include/asm/bug.h
>> +++ b/arch/riscv/include/asm/bug.h
>> @@ -85,6 +85,7 @@ do {								\
>>   struct pt_regs;
>>   struct task_struct;
>>
>> +void __show_regs(struct pt_regs *regs);
>>   void die(struct pt_regs *regs, const char *str);
>>   void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr);
>>
>> diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
>> index 470a65c4ccdc..3450c1912afd 100644
>> --- a/arch/riscv/include/asm/stacktrace.h
>> +++ b/arch/riscv/include/asm/stacktrace.h
>> @@ -13,5 +13,7 @@ struct stackframe {
>>
>>   extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>>   				    bool (*fn)(void *, unsigned long), void *arg);
>> +extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
>> +			   const char *loglvl);
>>
>>   #endif /* _ASM_RISCV_STACKTRACE_H */
>> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>> index 19225ec65db6..e41b733abeaa 100644
>> --- a/arch/riscv/kernel/process.c
>> +++ b/arch/riscv/kernel/process.c
>> @@ -18,6 +18,7 @@
>>   #include <asm/unistd.h>
>>   #include <asm/processor.h>
>>   #include <asm/csr.h>
>> +#include <asm/stacktrace.h>
>>   #include <asm/string.h>
>>   #include <asm/switch_to.h>
>>   #include <asm/thread_info.h>
>> @@ -39,7 +40,7 @@ void arch_cpu_idle(void)
>>   	local_irq_enable();
>>   }
>>
>> -void show_regs(struct pt_regs *regs)
>> +void __show_regs(struct pt_regs *regs)
>>   {
>>   	show_regs_print_info(KERN_DEFAULT);
>>
>> @@ -69,6 +70,12 @@ void show_regs(struct pt_regs *regs)
>>   	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
>>   		regs->status, regs->badaddr, regs->cause);
>>   }
>> +void show_regs(struct pt_regs *regs)
>> +{
>> +	__show_regs(regs);
>> +	if (!user_mode(regs))
>> +		dump_backtrace(regs, NULL, KERN_DEFAULT);
>> +}
>>
>>   void start_thread(struct pt_regs *regs, unsigned long pc,
>>   	unsigned long sp)
>> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
>> index 48b870a685b3..76dadf6d396b 100644
>> --- a/arch/riscv/kernel/stacktrace.c
>> +++ b/arch/riscv/kernel/stacktrace.c
>> @@ -101,10 +101,16 @@ static bool print_trace_address(void *arg, unsigned long pc)
>>   	return true;
>>   }
>>
>> +void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
>> +		    const char *loglvl)
>> +{
>> +	pr_cont("%sCall Trace:\n", loglvl);
>> +	walk_stackframe(task, regs, print_trace_address, (void *)loglvl);
>> +}
>> +
>>   void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
>>   {
>> -	pr_cont("Call Trace:\n");
>> -	walk_stackframe(task, NULL, print_trace_address, (void *)loglvl);
>> +	dump_backtrace(NULL, task, loglvl);
>>   }
>>
>>   static bool save_wchan(void *arg, unsigned long pc)
>> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>> index ad14f4466d92..570eb078b1e1 100644
>> --- a/arch/riscv/kernel/traps.c
>> +++ b/arch/riscv/kernel/traps.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/module.h>
>>   #include <linux/irq.h>
>>
>> +#include <asm/bug.h>
>>   #include <asm/processor.h>
>>   #include <asm/ptrace.h>
>>   #include <asm/csr.h>
>> @@ -66,7 +67,7 @@ void do_trap(struct pt_regs *regs, int signo, int code, unsigned long addr)
>>   			tsk->comm, task_pid_nr(tsk), signo, code, addr);
>>   		print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
>>   		pr_cont("\n");
>> -		show_regs(regs);
>> +		__show_regs(regs);
>>   	}
>>
>>   	force_sig_fault(signo, code, (void __user *)addr);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
