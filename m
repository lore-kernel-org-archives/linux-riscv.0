Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1583D606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aJcbaoYQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.a=rsa-sha256 header.s=default header.b=YNYfiyZq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CBCtlXeUy+CCBW0gPFVIV27gozoNzo7aGkTb3Qn/1qA=; b=aJcbaoYQA1Fwm9FuNkBOL/gVok
	OpgS8PR4HdYf5S8z1HC3UYedZ2ZlKK7EKiAU5qDCRzQHMYEeIaB+49sSkXZNjN4p+rZgHB5LEF4B4
	FO6gR2duzmHfYQG0O4vZYToqnGV3NypEK7AgruutJOL+0fXXewle0SY8p9TN45+06PMeboxcJd1ON
	GyHnkb7GzfOA0IjPf5whiCv6dGGAHhSdfuir8w4n2D66WAY+UI6NMDQ1dGZI4KWY2yyO9wnFYxG09
	istnM4tljQpKoi44ALX+CGtoKPtMEb+9j1Ipu0KQM8eNhmoaKTHcCuUMf02FzrjzhewYLE1elpJmj
	zoLkIU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUvr-0000000A55V-3BaB;
	Thu, 12 Nov 2026 13:33:39 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUvo-0000000A53G-0JSq
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 13:33:38 +0000
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id RK6gx388N4vCDRUvcxe0qB; Thu, 12 Nov 2026 13:33:24 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id RUvaxtJZD3nNNRUvaxV3YV; Thu, 12 Nov 2026 13:33:23 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6af5c023
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=7vwVE5O1G3EA:10 a=JfrnYn6hAAAA:8
 a=SRrdq9N9AAAA:8 a=20KFwNOVAAAA:8 a=HaFmDPmJAAAA:8 a=dieMQkrgBA8TE_BiV8UA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=1CNFftbPRP8L7MoqJWF3:22
 a=nmWuMzfKamIsx3l42hEX:22 a=L5EjiQpGQaFGZdqT14z7:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xkqkpIt1plIFnGyOUK6a5uhEcdFmWHTHz+38OI/2VXQ=; b=YNYfiyZqmGVTl0GoZfbx6Nqy2U
	dvVh6v7SqvLKXSdykc4wDKN1OHmCl5PB0+kzx5VSwu6Qkiko0JdI5ZfA1MIJTTYbFEnnPDs9MzN7L
	+V3AnEE2ePPr8G52XJqGLbT+RXPQCC2FR+fuFXJRQj6ey+fh//6sjGpEEcMQ47dsrF6snYPNSJqWX
	P3T7nYVUTdVZzlkImTKoh4ccP5wUDtp9vAS1OiZUMqncDHLX8XbB5WO5CBHpdq8wbdxSTFGqX9M/V
	LWxxd3Hfa1fIj5l7gnU49Uhr+CaSmOPGs56N2MOi5cTH8ZdAc1qzbyidhySog+02CCgXpLOGbXeFp
	a39ycTjg==;
Received: from c-73-162-206-103.hsd1.ca.comcast.net ([73.162.206.103]:49516 helo=[10.0.1.180])
	by box5620.bluehost.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <re@w6rz.net>)
	id 1xRUvW-00000003BR4-1yMX;
	Thu, 12 Nov 2026 06:33:18 -0700
Message-ID: <34f2ff11-8156-4c32-91dc-e4576807cf3b@w6rz.net>
Date: Thu, 12 Nov 2026 05:33:16 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched: move stack_canary to the start of the
 randomizable region
To: Valentin Schneider <vschneid@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org,
 oliver.yang@linux.alibaba.com, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org
References: <20260509035014.2220372-1-tianruidong@linux.alibaba.com>
 <20261106160730.GJ1779021@noisy.programming.kicks-ass.net>
 <xhsmhy0b2ntmh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <xhsmhy0b2ntmh.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.162.206.103
X-Source-L: No
X-Exim-ID: 1xRUvW-00000003BR4-1yMX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-162-206-103.hsd1.ca.comcast.net ([10.0.1.180]) [73.162.206.103]:49516
X-Source-Auth: re@w6rz.net
X-Email-Count: 1
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBsCA0zpY7hR16Poqv0QBIFI1q7cQ7bpZGeb0EhGQBqf9oYNaTS14yweXSF7A1r83P9XUzaXIK18jqnFZqnmOA21p1Ba4O+zgncxhc1qegTeYqUTR8Nl
 5B7ho+HitGst6pm/BVGCRnCRUV+ottvqhht6cNdjYbhxrJqxPFOXR/Z2Kv7lapGFatc9QL76ROlfkUqWCzRc9e0lOl8hBSO8Yoo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_053336_206069_9D9BC5E1 
X-CRM114-Status: GOOD (  29.88  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/9/26 03:15, Valentin Schneider wrote:

> On 06/11/26 17:07, Peter Zijlstra wrote:
>> On Sat, May 09, 2026 at 11:50:14AM +0800, Ruidong Tian wrote:
>>> @@ -848,9 +848,15 @@ struct task_struct {
>>>   
>>>   	int				on_cpu;
>>>   	struct __call_single_node	wake_entry;
>>> -	unsigned int			wakee_flips;
>>> +
>>> +#ifdef CONFIG_STACKPROTECTOR
>>> +	/* Canary value for the -fstack-protector GCC feature: */
>>> +	unsigned long			stack_canary;
>>> +#endif
>>> +
>>>   	unsigned long			wakee_flip_decay_ts;
>>>   	struct task_struct		*last_wakee;
>>> +	unsigned int			wakee_flips;
>>>   
>>>   	/*
>>>   	 * recent_used_cpu is initially set as the last CPU used by a task
>>> @@ -1060,10 +1066,6 @@ struct task_struct {
>>>   	pid_t				pid;
>>>   	pid_t				tgid;
>>>   
>>> -#ifdef CONFIG_STACKPROTECTOR
>>> -	/* Canary value for the -fstack-protector GCC feature: */
>>> -	unsigned long			stack_canary;
>>> -#endif
>>>   	/*
>>>   	 * Pointers to the (original) parent process, youngest child, younger sibling,
>>>   	 * older sibling, respectively.  (p->father can be replaced with
>> This seems exceedingly random; and very prone to also randomly breaking
>> as task_struct is further modified.
>>
>> Why not do something a little more structured; like so?
>> until someone smarter can come with a risc-v specific improvement
> See :-)
>
> How's this? I fluffed the changelog and added a comment to that
> stack_canary helper
>
> ---
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Fri, 6 Nov 2026 17:07:30 +0100
> Subject: [PATCH] riscv, sched: move stack_canary to thread_info
>
> task_struct keeps growing over time. On architectures that compute the
> per-task stack canary offset from asm-offsets.h and pass it to the
> compiler via -mstack-protector-guard-offset=, this growth eventually
> pushes stack_canary beyond what the target ISA can encode.
>
> On RISC-V, canary loads are emitted as
>
>      ld	t0, TSK_STACK_CANARY(tp)
>
> where TSK_STACK_CANARY must fit into a 12-bit signed immediate, i.e.
> [-2048, 2047].  Once stack_canary sits past byte 2047 of task_struct,
> the build fails with
>
>      cc1: error: '<N>' is not a valid offset in
> 	'-mstack-protector-guard-offset='
>
> On RISC-V, CONFIG_STACKPROTECTOR_PER_TASK depends on !RANDSTRUCT, thus
> stack_canary does not benefit from being in the task_struct randomized
> region.
>
> Move the RISC-V stack_canary to thread_info, and introduce an access macro
> to point to the right stack_canary location. Other archs are unaffected.
>
> Not-signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
> Not-signed-off-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---
>   arch/riscv/include/asm/stackprotector.h |  4 ++--
>   arch/riscv/include/asm/thread_info.h    | 16 ++++++++++++++++
>   arch/riscv/kernel/asm-offsets.c         |  7 +++----
>   drivers/misc/lkdtm/bugs.c               |  4 ++--
>   include/linux/sched.h                   |  6 +++++-
>   kernel/fork.c                           |  2 +-
>   6 files changed, 29 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
> index 43895b90fe3f6..b56e49ce0580e 100644
> --- a/arch/riscv/include/asm/stackprotector.h
> +++ b/arch/riscv/include/asm/stackprotector.h
> @@ -15,8 +15,8 @@ static __always_inline void boot_init_stack_canary(void)
>   {
>   	unsigned long canary = get_random_canary();
>   
> -	current->stack_canary = canary;
> +	tsk_stack_canary(current) = canary;
>   	if (!IS_ENABLED(CONFIG_STACKPROTECTOR_PER_TASK))
> -		__stack_chk_guard = current->stack_canary;
> +		__stack_chk_guard = tsk_stack_canary(current);
>   }
>   #endif /* _ASM_RISCV_STACKPROTECTOR_H */
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 55019fdfa9eca..b3a1e1ddbfb0e 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -73,6 +73,9 @@ struct thread_info {
>   	 */
>   	unsigned long		a0, a1, a2;
>   #endif
> +#ifdef CONFIG_STACKPROTECTOR
> +	unsigned long		stack_canary;
> +#endif
>   #ifdef CONFIG_RISCV_USER_CFI
>   	struct cfi_state	user_cfi_state;
>   #endif
> @@ -86,6 +89,19 @@ struct thread_info {
>   #define INIT_SCS
>   #endif
>   
> +#ifdef CONFIG_STACKPROTECTOR
> +/*
> + * The canary is loaded via
> + *
> + *   ld	t0, TSK_STACK_CANARY(tp)
> + *
> + * This imposes a 2047 byte (12-bit signed immediate) limit for the stack_canary
> + * offset, which is a RISC-V specific limit. Because of that, we keep the
> + * stack_canary high up in task_struct, in thread_info itself.
> + */
> +#define tsk_stack_canary(p) ((p)->thread_info.stack_canary)
> +#endif
> +
>   /*
>    * macros/functions for gaining access to the thread information structure
>    *
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index a75f0cfea1e9f..eb694e1215bbb 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -49,7 +49,9 @@ void asm_offsets(void)
>   	OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
>   	OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
>   #endif
> -
> +#ifdef CONFIG_STACKPROTECTOR
> +	OFFSET(TSK_STACK_CANARY, task_struct, thread_info.stack_canary);
> +#endif
>   	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
>   #ifdef CONFIG_RISCV_USER_CFI
>   	OFFSET(TASK_TI_CFI_STATE, task_struct, thread_info.user_cfi_state);
> @@ -88,9 +90,6 @@ void asm_offsets(void)
>   	OFFSET(TASK_THREAD_F30, task_struct, thread.fstate.f[30]);
>   	OFFSET(TASK_THREAD_F31, task_struct, thread.fstate.f[31]);
>   	OFFSET(TASK_THREAD_FCSR, task_struct, thread.fstate.fcsr);
> -#ifdef CONFIG_STACKPROTECTOR
> -	OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
> -#endif
>   
>   	DEFINE(PT_SIZE, sizeof(struct pt_regs));
>   	OFFSET(PT_EPC, pt_regs, epc);
> diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
> index 2761685cf4f87..977ee75842490 100644
> --- a/drivers/misc/lkdtm/bugs.c
> +++ b/drivers/misc/lkdtm/bugs.c
> @@ -247,9 +247,9 @@ static noinline void __lkdtm_REPORT_STACK_CANARY(void *stack)
>   	for (i = 1; i < 16; i++) {
>   		canary = (unsigned long *)stack + i;
>   #ifdef CONFIG_STACKPROTECTOR
> -		if (*canary == current->stack_canary)
> +		if (*canary == tsk_stack_canary(current))
>   			current_offset = i;
> -		if (*canary == init_task.stack_canary)
> +		if (*canary == tsk_stack_canary(&init_task))
>   			init_offset = i;
>   #endif
>   	}
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index e4f6323d78555..b7702fefed635 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1083,7 +1083,7 @@ struct task_struct {
>   	pid_t				pid;
>   	pid_t				tgid;
>   
> -#ifdef CONFIG_STACKPROTECTOR
> +#if defined(CONFIG_STACKPROTECTOR) && !defined(tsk_stack_canary)
>   	/* Canary value for the -fstack-protector GCC feature: */
>   	unsigned long			stack_canary;
>   #endif
> @@ -1697,6 +1697,10 @@ struct task_struct {
>   	randomized_struct_fields_end
>   } __attribute__ ((aligned (64)));
>   
> +#if defined(CONFIG_STACKPROTECTOR) && !defined(tsk_stack_canary)
> +#define tsk_stack_canary(p) ((p)->stack_canary)
> +#endif
> +
>   #ifdef CONFIG_SCHED_PROXY_EXEC
>   DECLARE_STATIC_KEY_TRUE(__sched_proxy_exec);
>   static inline bool sched_proxy_exec(void)
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 5efceb8d58a78..878d586bda256 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -964,7 +964,7 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
>   	clear_syscall_work_syscall_user_dispatch(tsk);
>   
>   #ifdef CONFIG_STACKPROTECTOR
> -	tsk->stack_canary = get_random_canary();
> +	tsk_stack_canary(tsk) = get_random_canary();
>   #endif
>   	if (orig->cpus_ptr == &orig->cpus_mask)
>   		tsk->cpus_ptr = &tsk->cpus_mask;

I'm seeing this build failure on RISC-V with gcc 16 and CONFIG_SCHED_CLASS_EXT=y. The build does not fail with gcc 14. I've tested 
the proposed patch with gcc 16 and it builds and boots (on real hardware) just fine. So for what it's worth:

Tested-by: Ron Economos <re@w6rz.net>

Also re-adding the RISC-V folks.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
