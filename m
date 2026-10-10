Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE29CA6004
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 03:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PR+72p6amX7a4RGiorDXT04fwyDyFlquvXuIs9HbMwI=; b=aXCnu+f1PF5Kj+
	NUEscfaVduE6K/fUGN1U7Pv/noib7E0KSjoS1RSeuVFKu9VbJ7UkCHHYzE0E+EW3jKZ4nD19ZoykX
	2J9lGG087vj8GGOxe6mW1ApGTfQSzvULeSRsobVTzlEYHkZywA2FQbSJBiWd9RvXKc7eZs0Mv3d0/
	cwAlsn4cwlvQqXCNUv6A/EBJ/Vwj4434kOg2mW/uTk19ouHpm3KW9YryB0GcJmrESvffajsh5keFq
	6W8hGbebgczDwNtxiFJAp09dFCurKnD3d8hkDkeFr1mwV3wTOB+WprSUP06YKcpT85N+NHx8bHobA
	h3ewgOYt+y/XzlgBvLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFNvH-00000007TUw-3Z1T;
	Sat, 10 Oct 2026 03:38:59 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFNvE-00000007TU3-1k6C
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 03:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791603530; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=SBB6AWvERMNQNcnv8IpcOyFkUIlmwIKsnK5k1h4Id5s=;
	b=A7q/o2AvOzEhw+XVOO+FKT/EhKev/5wGvR/VpaRI9XdOIHZBcd1UW+dbdK0h45sB7wCUdNjd3SXx/jaB6FwkBHmtKKkp6k1TZG4AnvnuTJJwNPdAnAUOyeJ09kfc++FAYP5CM51jh3dlCAMgIHK6CpzBoaulHpYCWiupwm3Y4Yc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=35;SR=0;TI=SMTPD_---0XCUukT6_1791603526;
Received: from 30.246.161.155(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XCUukT6_1791603526 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 10 Oct 2026 11:38:47 +0800
Message-ID: <2650577a-a359-495c-a6bf-47a825e9282a@linux.alibaba.com>
Date: Sat, 10 Oct 2026 11:38:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] riscv: stacktrace: switch to frame-pointer based
 unwinder
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, oleg@redhat.com, rostedt@goodmis.org,
 mhiramat@kernel.org, mark.rutland@arm.com, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, james.clark@linaro.org, jpoimboe@kernel.org,
 jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, joe.lawrence@redhat.com,
 shuah@kernel.org, mpdesouza@suse.com, oliver.yang@linux.alibaba.com,
 zhuo.song@linux.alibaba.com, jkchen@linux.alibaba.com, martin@kaiser.cx,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, live-patching@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
 <20260914092648.51254-6-xueshuai@linux.alibaba.com>
 <20261009185904.82385-1-kmehltretter@gmail.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20261009185904.82385-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_203857_173398_C8BB96F2 
X-CRM114-Status: GOOD (  21.27  )
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



On 10/10/26 2:59 AM, Karl Mehltretter wrote:
> On Mon, Sep 14, 2026 at 05:26:46PM +0800, Shuai Xue wrote:
>> +noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
>> +				      void *cookie, struct task_struct *task,
>> +				      struct pt_regs *regs)
>> +{
>> +	struct kunwind_consume_entry_data data = {
>> +		.consume_entry = consume_entry,
>> +		.cookie = cookie,
>> +	};
>> +
>> +	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs);
>> +}
> 
> Hi Shuai Xue,
> 
> With this patch and FRAME_POINTER enabled, return_address() returns the
> caller one level further up than asked for.
> 
> return_address() in arch/riscv/kernel/return_address.c skips level + 3
> entries from arch_stack_walk(). The arm64 original skips level + 2. The
> third entry exists on mainline because the walk starts inside
> walk_stackframe() and first reports the return into arch_stack_walk().
> With 5/7 the walk starts at the caller of arch_stack_walk(), so
> level + 3 now skips a real caller. CALLER_ADDR1 and up are built on
> return_address(). The irqsoff tracer and the preemptirq tracepoints use
> them.
> 
> A KUnit test that calls ftrace_return_address() from
> leaf() <- middle() <- outer() <- check() returns:
> 
>               af32da41b032   with series   with series, level + 2
>    level 0    middle         outer         middle
>    level 1    outer          check         outer
> 
> The change to level + 2 has to depend on FRAME_POINTER. Without it the
> series keeps walk_stackframe() and the result is the same as on
> mainline. There, level + 2 makes return_address(0) return an address
> inside return_address().

Hi, Karl,

Nice point. Thank you for the thorough review and the KUnit test.
The analysis is spot on, and your table matches my reading of the code
exactly.

> 
> The same extra entry makes stack_trace_save() start one frame too early
> on mainline. 5/7 fixes that. I have a small fix for it on mainline,
> meant for stable kernels, which conflicts with 5/7. I would post it with
> you in Cc. Tell me if you would rather take the return_address.c change
> into 5/7 first.

Please go ahead with your mainline/stable fix for the
stack_trace_save() off-by-one as an independent patch. You are right
that this is a separate mainline bug: stack_trace_save() hardcodes
.skip = skipnr + 1, i.e. it expects the first entry reported by
arch_stack_walk() to be the return into stack_trace_save() itself, and
mainline's walk_stackframe() breaks that contract by reporting the
return into arch_stack_walk() first. A 7-patch series is not a vehicle
for stable, so the minimal fix is the right approach there.

Please keep me in Cc when you post it, I will review and test it.

> 
> Tested with clang 22 and the series applied on 52318cf0fa6e. The
> "with series" column is the same on QEMU's virt machine and on a
> BeagleV Ahead (TH1520). Everything else ran on QEMU only.

Thanks again for testing on real hardware (BeagleV Ahead) in addition
to QEMU, that is much appreciated.

Best regards,
Shuai Xue



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
