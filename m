Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9E31075273
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 07:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7YIuBAzrynUMiYwxmW9MNi3T2FlU6q/wqFy+YcG4AA=; b=fwd1PNSiiVAcEX
	Nty3tdJb3BW4bdh2hkk42o2YJe7B71FhbWkXpT7ebkSBkKFRxgI51Uhgu22Z6vhLGBlnWTVYqOJm9
	AVldq4JImx8Bd74wUKxNkZiYSw2Nhdx2BM8zHjh2ucN+5Sj13qi8SkWBmkHjbJkmFr0FBiHIAEsgp
	KjZReyZIOdLMqyvdZNf3kjppF4OAPOTt6fXizPN94SBrwBqoWbdM5WRkmiVVEOf2Rm0jtVN0A4OwX
	Nr3Eh9sNexOi8cIc7KoaJexlUjRUyaZTEgnBQBDDkImbiOL1/E9pwYiZWqfjCVD8IfShAUzadxNml
	/xko+sXNfiIEt68Wz1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w388Z-0000000ABQ3-48e0;
	Thu, 19 Mar 2026 07:49:47 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w388W-0000000ABPD-3miL
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 07:49:46 +0000
Received: from [198.18.0.1] (unknown [121.237.245.153])
	by APP-05 (Coremail) with SMTP id zQCowAA3zRCSqrtpbTjYCg--.53955S2;
	Thu, 19 Mar 2026 15:49:39 +0800 (CST)
Message-ID: <855121c0-7830-434e-a62c-da855722ccca@iscas.ac.cn>
Date: Thu, 19 Mar 2026 15:49:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] riscv: add userspace interface to voluntarily release
 vector state
To: Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260317022232.11022-1-daichengrong@iscas.ac.cn>
 <d470846b-bd41-44a4-b9b5-51c7d4611e24@sifive.com>
Content-Language: en-US
From: daichengrong <daichengrong@iscas.ac.cn>
In-Reply-To: <d470846b-bd41-44a4-b9b5-51c7d4611e24@sifive.com>
X-CM-TRANSID: zQCowAA3zRCSqrtpbTjYCg--.53955S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFWUXF1kGF4xCry8JF45GFg_yoW3Ww1rpF
	s8CFZ3GFW8GF1xZ3sFvw48Xr4rG3sYgw13Cr47Ga47A3W3KrZYgrnrKa4DZF4DJFyrC3Wj
	9FWY9r1kCw45AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkI
	ecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
	Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	bedgtUUUUU=
X-Originating-IP: [121.237.245.153]
X-CM-SenderInfo: pgdluxxhqj201qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_004945_516251_935D1DBC 
X-CRM114-Status: GOOD (  31.24  )
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



On 3/17/26 12:41, Samuel Holland wrote:
> Hi,
> 
> On 2026-03-16 9:22 PM, daichengrong wrote:
>> Vector registers in RVV can be large, and saving/restoring them on
>> context switches introduces overhead. Some workloads only use
>> vector instructions in short phases, after which the vector state
>> does not need to be preserved.
>>
>> This patch introduces a userspace-controlled mechanism:
>>
>> - Userspace can declare that it no longer needs the vector state.
>> - Kernel will skip saving/restoring vector registers during context
>>   switch while the declaration is active.
>> - If the thread executes vector instructions after releasing its
>>   vector state, the kernel will revoke the declaration automatically.
>>
>> This reduces unnecessary vector context switch overhead and improves
>> performance in workloads with intermittent vector usage.
>>
>> This is an RFC patch to solicit feedback on the API design and
>> implementation approach.
>>
>> Signed-off-by: daichengrong <daichengrong@iscas.ac.cn>
>> ---
>>  arch/riscv/include/asm/processor.h |  1 +
>>  arch/riscv/include/asm/syscall.h   |  2 ++
>>  arch/riscv/include/asm/vector.h    |  7 +++++--
>>  arch/riscv/kernel/process.c        |  1 +
>>  arch/riscv/kernel/sys_riscv.c      | 12 ++++++++++++
>>  scripts/syscall.tbl                |  1 +
>>  6 files changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>> index 4c3dd94d0f63..b59f1456918b 100644
>> --- a/arch/riscv/include/asm/processor.h
>> +++ b/arch/riscv/include/asm/processor.h
>> @@ -113,6 +113,7 @@ struct thread_struct {
>>  	unsigned long envcfg;
>>  	unsigned long sum;
>>  	u32 riscv_v_flags;
>> +	unsigned long riscv_v_release_flags;
>>  	u32 vstate_ctrl;
>>  	struct __riscv_v_ext_state vstate;
>>  	unsigned long align_ctl;
>> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
>> index 8067e666a4ca..f6be37b01a67 100644
>> --- a/arch/riscv/include/asm/syscall.h
>> +++ b/arch/riscv/include/asm/syscall.h
>> @@ -121,4 +121,6 @@ asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
>>  
>>  asmlinkage long sys_riscv_hwprobe(struct riscv_hwprobe *, size_t, size_t,
>>  				  unsigned long *, unsigned int);
>> +// asmlinkage long sys_riscv_release_vector_register(uintptr_t);
>> +asmlinkage long sys_riscv_release_vector_register(void);
>>  #endif	/* _ASM_RISCV_SYSCALL_H */
>> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
>> index 00cb9c0982b1..4bccccc20cc3 100644
>> --- a/arch/riscv/include/asm/vector.h
>> +++ b/arch/riscv/include/asm/vector.h
>> @@ -309,6 +309,7 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
>>  	if (__riscv_v_vstate_check(regs->status, DIRTY)) {
>>  		__riscv_v_vstate_save(vstate, vstate->datap);
>>  		__riscv_v_vstate_clean(regs);
>> +		WRITE_ONCE(current->thread.riscv_v_release_flags, 0);
>>  	}
>>  }
>>  
>> @@ -325,8 +326,10 @@ static inline void riscv_v_vstate_set_restore(struct task_struct *task,
>>  					      struct pt_regs *regs)
>>  {
>>  	if (riscv_v_vstate_query(regs)) {
>> -		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
>> -		riscv_v_vstate_on(regs);
>> +		if (!READ_ONCE(current->thread.riscv_v_release_flags)) {
>> +			set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
>> +			riscv_v_vstate_on(regs);
>> +		}
> 
> This is a security bug, because it leaks the previous task's vector registers.
> >>  	}
>>  }
>>  
>> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>> index aacb23978f93..f1f36a3c7914 100644
>> --- a/arch/riscv/kernel/process.c
>> +++ b/arch/riscv/kernel/process.c
>> @@ -279,6 +279,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>>  		p->thread.ra = (unsigned long)ret_from_fork_user_asm;
>>  	}
>>  	p->thread.riscv_v_flags = 0;
>> +	p->thread.riscv_v_release_flags = 0;
>>  	if (has_vector() || has_xtheadvector())
>>  		riscv_v_thread_alloc(p);
>>  	p->thread.sp = (unsigned long)childregs; /* kernel sp */
>> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
>> index 22fc9b3268be..934ddc06858d 100644
>> --- a/arch/riscv/kernel/sys_riscv.c
>> +++ b/arch/riscv/kernel/sys_riscv.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/syscalls.h>
>>  #include <asm/cacheflush.h>
>>  #include <asm-generic/mman-common.h>
>> +#include <asm/vector.h>
>>  
>>  static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>>  			   unsigned long prot, unsigned long flags,
>> @@ -78,6 +79,17 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
>>  	return 0;
>>  }
>>  
>> +SYSCALL_DEFINE0(riscv_release_vector_register)
>> +{
>> +	struct pt_regs *regs = task_pt_regs(current);
>> +
>> +	if (__riscv_v_vstate_check(regs->status, DIRTY))
>> +		__riscv_v_vstate_clean(regs);
>> +
>> +	WRITE_ONCE(current->thread.riscv_v_release_flags, 1);
> 
> To avoid leaking register state at context switch, you must either:
>   1) set the vector registers to some safe contents (e.g. the initial state) or
>   2) set VS=off
> 
> So if RVV is used rarely enough that you are willing to pay the cost of a trap
> when you next use it, this function can be as simple as:
> 
>   riscv_v_vstate_off(task_pt_regs(current));
> 
Yes, I agree that this is a security issue, as it could potentially
leak vector register contents from a previous task.

However, in the current implementation, once a task executes a system
call, its user vector state is immediately discarded by the kernel.
There is therefore no need for an additional system call to explicitly
drop vector state from user space.

The root cause lies in how the kernel tracks the state after discard.
Currently, after riscv_v_vstate_discard(), the vector state is marked
as DIRTY instead of INIT. This causes the context switch logic to
treat the registers as containing valid user data, resulting in
unnecessary save and restore operations on registers that no longer
hold meaningful user information.

Specifically, this may lead to restoring stale or constant values
into a different task, which is the underlying source of the potential
data leakage.

The patch[1] I recently submitted addresses
this by marking the vector state as INIT after discard. This ensures
that the scheduler correctly skips saving/restoring invalid vector data
and prevents leaking contents from a previous task.

>> +	return 0;
>> +}
>> +
>>  /* Not defined using SYSCALL_DEFINE0 to avoid error injection */
>>  asmlinkage long __riscv_sys_ni_syscall(const struct pt_regs *__unused)
>>  {
>> diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
>> index 7a42b32b6577..1d0a493b87c3 100644
>> --- a/scripts/syscall.tbl
>> +++ b/scripts/syscall.tbl
>> @@ -302,6 +302,7 @@
>>  
>>  244	or1k	or1k_atomic			sys_or1k_atomic
>>  
>> +257	riscv	riscv_release_vector_register	sys_riscv_release_vector_register
>>  258	riscv	riscv_hwprobe			sys_riscv_hwprobe
>>  259	riscv	riscv_flush_icache		sys_riscv_flush_icache
> 
> You may also consider adding a flag to prctl(PR_RISCV_V_SET_CONTROL) instead of
> a new syscall. So it would look something like:
> 
>   prctl(PR_RISCV_V_SET_CONTROL,
>         PR_RISCV_V_VSTATE_CTRL_ON | PR_RISCV_V_VSTATE_CTRL_RESET);
> 
> (Arguably it is a bug that riscv_v_ctrl_set() doesn't call riscv_v_vstate_off()
> for PR_RISCV_V_VSTATE_CTRL_OFF already.)
> 
> Regards,
> Samuel


[1] https://lists.infradead.org/pipermail/linux-riscv/2026-March/087677.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
