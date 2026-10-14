Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F46BCC6B1D
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOPJKZbxf4JefZ/1OaEm7Q0uipPfxSWhGeOdfHSnq9s=; b=PiwklgSfgYfmMk
	nCtNPPu/ddXT1AxHxhmR4kcl8w32g1W8k6TQYuOaK9qb4VOy65QzuaqLIgC+tw3JGq3SrkHTPYJhl
	QKRlCYFu5tKRfZG88xNbSd7euSFoLiLfjwKCx3lIEoDfcQmFUtJjCS68KlS14hWEUnmMxxBxL6UCh
	GxeHJAwc3FWrwjLY/hPU/kG+Oc1a7hiPEIz9HtWDeCmP/fmfNGKPsYOqfbNbiv4VSxURx/8401aen
	8yON4aKrFlAMS7yYCXKIW8YEetLvFFL7vUWuAnSrczoaj9atd+NwKZ11VDxUROMtWi2+OCDU7Nnjw
	WKdveRwELbwydbaddP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGykK-0000000FXdO-0ajT;
	Wed, 14 Oct 2026 13:10:16 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyk8-0000000FXUf-07Gi
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 13:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791983397; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=NfvwyHiH13gScZyLRyJ1bRdwmOqWUvSNVK5u+We9JrM=;
	b=nVApR24lNUio3MO1VMJAVTLF6/Q3A9A6w6r57Y3L+hEiV25hAVqsdha6zDl5Ex5Mh3h+l40e5wjIiROewB+fioyrryQyomoxvIQIr9enpxouJK9W2CyCLImrbFAGCiORrNF4saX3JvFTmMm8wfUGCBxS6tnyvVO/8msTZaa02yc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0XCp3Qsf_1791983391;
Received: from 30.246.161.148(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XCp3Qsf_1791983391 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 Oct 2026 21:09:54 +0800
Message-ID: <3bd83dc6-1206-4af2-bfcf-5894b1029907@linux.alibaba.com>
Date: Wed, 14 Oct 2026 21:09:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] riscv: stacktrace: switch to frame-pointer based
 unwinder
To: Martin Kaiser <martin@kaiser.cx>
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, oleg@redhat.com, rostedt@goodmis.org,
 mhiramat@kernel.org, mark.rutland@arm.com, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, james.clark@linaro.org, jpoimboe@kernel.org,
 jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, joe.lawrence@redhat.com,
 shuah@kernel.org, mpdesouza@suse.com, oliver.yang@linux.alibaba.com,
 zhuo.song@linux.alibaba.com, jkchen@linux.alibaba.com,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, live-patching@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
 <20260914092648.51254-6-xueshuai@linux.alibaba.com>
 <as6SEF4v6wt5GmVD@nb282.user.codasip.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <as6SEF4v6wt5GmVD@nb282.user.codasip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_061005_611388_9A61130D 
X-CRM114-Status: GOOD (  22.95  )
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



On 10/14/26 4:18 AM, Martin Kaiser wrote:
> Thus wrote Shuai Xue (xueshuai@linux.alibaba.com):
> 
>> From: Wang Han <wanghan@linux.alibaba.com>
> 
>> Replace the open-coded frame-pointer walker in arch_stack_walk() with a
>> robust kunwind state machine, modelled on arch/arm64/kernel/stacktrace.c
>> and retargeted to the RISC-V {fp, ra} frame record convention. The new
>> walker tracks stack bounds, consumes frame records monotonically,
>> understands the metadata pt_regs records added in the previous frame
>> record metadata patch, and recovers return addresses replaced by
>> function graph tracing and kretprobes.
> 
>> This commit introduces arch_stack_walk_reliable() but does not yet
>> select HAVE_RELIABLE_STACKTRACE; that is done in a follow-up Kconfig
>> patch so this commit can be reviewed and bisected as a pure unwinder
>> replacement. Until that Kconfig change lands, livepatch is not yet
>> enabled and arch_stack_walk_reliable() has no in-tree caller.
> 
>> Three related callers are updated to keep the same frame-record
>> assumptions everywhere:
> 
>>    * Function graph tracing: the old RISC-V unwinder matched function
>>      graph return-stack entries by the saved return-address slot. That
>>      was consistent with the static mcount path, but not with the dynamic
>>      ftrace path where the parent slot is ftrace_regs::ra. Use the
>>      architectural frame pointer as the function graph return-address
>>      cookie, matching the kunwind walker.
> 
>>    * Perf callchains: route kernel callchain collection through
>>      arch_stack_walk() so perf sees the same frame-pointer unwind
>>      behaviour as dump_stack() and the upcoming livepatch path.
> 
>>    * dump_backtrace() / __get_wchan() / show_stack(): these now go
>>      through arch_stack_walk(); the explicit "Call Trace:" header is
>>      moved into dump_backtrace() to preserve the original output.
> 
>> The non-frame-pointer fallback walker is kept untouched for
>> !CONFIG_FRAME_POINTER builds.
> 
>> Assisted-by: Qoder:Qwen-3.8-MAX-Preview
>> Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>> ---
>>   arch/riscv/kernel/ftrace.c         |   6 +-
>>   arch/riscv/kernel/perf_callchain.c |   2 +-
>>   arch/riscv/kernel/stacktrace.c     | 561 ++++++++++++++++++++++++-----
>>   3 files changed, 473 insertions(+), 96 deletions(-)
> 
>> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
>> index be8b685144174..0facd824c911d 100644
>> --- a/arch/riscv/kernel/ftrace.c
>> +++ b/arch/riscv/kernel/ftrace.c
>> @@ -245,7 +245,8 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
>>   	 */
>>   	old = *parent;
> 
>> -	if (!function_graph_enter(old, self_addr, frame_pointer, parent))
>> +	if (!function_graph_enter(old, self_addr, frame_pointer,
>> +				  (void *)frame_pointer))
>>   		*parent = return_hooker;
>>   }
> 
>> @@ -267,7 +268,8 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
>>   	 */
>>   	old = *parent;
> 
>> -	if (!function_graph_enter_regs(old, ip, frame_pointer, parent, fregs))
>> +	if (!function_graph_enter_regs(old, ip, frame_pointer,
>> +				       (void *)frame_pointer, fregs))
>>   		*parent = return_hooker;
>>   }
> 
> 
> Are these two changes fixing a bug in the current code (that is independent
> from the rest of this patch)?
> 
> Without your changes, function_graph_enter_regs writes a struct ftrace_ret_stack
> with retp == the saved ra.
> 
> And the only place where retp is fetched and checked is
> 
> function_get_true_parent_ip
>     ftrace_graph_ret_addr(..., (uintptr_t *)ftrace_regs_get_stack_pointer(fregs));
> 
> The stored retp is checked against the stack pointer.
> 
> Your changes store fp instead of ra, this seems the right thing to do. (And
> it's in line with other archs.)
> 
> Should those two changes be in a separate patch (that can be backported to
> stable kernels)?

Hi, Martin,

Thanks for the sharp question.

You are right that the stored cookie is broken. What
ftrace_graph_func() passes as retp is &arch_ftrace_regs(fregs)->ra,
i.e. the slot inside the transient ftrace trampoline frame, which is
popped as soon as the callback returns. That has been the case since
35e61e8827ee8 ("riscv: ftrace: Make function graph use ftrace
directly") introduced ftrace_graph_func() in v6.8. (The code was
copied from arm64's ftrace_graph_func(), but arm64 passes
(void *)frame_pointer there - see 41705c4262aac for the current
shape.)

Since distro kernels only ever use the dynamic path, the net effect
is that the shadow stack is never consulted during unwinding:
whenever the function graph tracer is running, dump_stack(), perf
callchains and __get_wchan() report return_to_handler instead of the
real caller.

I will split these two changes into a separate patch and cc stable.

Thanks.
Shuai

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
