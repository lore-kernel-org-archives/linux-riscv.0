Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450FCCD343F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 01:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vuOG6YgY2tIN7bsZEj0MMhid+avN196Hdt8g5BkiAfQ=; b=z6IXh4uCIJ9l+t
	EnKKAjBS9OjpC+8mBIn11UNZX/h9yc0rj3XoiFWXhup50OGcNlGP1NLzDTMXicd2VBtqEK0KpjW9y
	LE4hj99J/yG8UHCg2zdtpVuIlbru6JQM1codzkzL1a6MUa4350yOxDBHjEWU43kGox2vRYLIgRPY9
	AdWLW0/LQvc+KDoXa2Ie5FhNbs5+UPk+ihQOtIl9ctwgqUKQRm8ih0/mhU5DetQuDPT5qlKZjVoh5
	k/pqJlnrgxwggH0vc4Kgq4HyHj9CZEWgbZEZ+LBmh0EAR+8SiLI0bMNArLvcclW4zhcCBlECTPam9
	zQd5ozzP7iuL2kTakHIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLAF2-00000005Iop-1lU2;
	Fri, 08 May 2026 01:43:00 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLAEw-00000005Io3-272i
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 01:42:58 +0000
Received: from [198.18.0.1] (unknown [121.237.245.103])
	by APP-03 (Coremail) with SMTP id rQCowAC32eCUP_1pVDldEA--.6803S2;
	Fri, 08 May 2026 09:42:44 +0800 (CST)
Message-ID: <7ba2f4b7-8475-4ec3-ab31-58b332bda47e@iscas.ac.cn>
Date: Fri, 8 May 2026 09:42:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] riscv: clarify vector state semantics on syscall and
 context switch
Content-Language: en-US
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260319073709.18562-1-daichengrong@iscas.ac.cn>
From: daichengrong <daichengrong@iscas.ac.cn>
In-Reply-To: <20260319073709.18562-1-daichengrong@iscas.ac.cn>
X-CM-TRANSID: rQCowAC32eCUP_1pVDldEA--.6803S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr4fAFWUCr18Xr1kCF43Awb_yoWrtr1fpr
	Z8Gr4ak3yUJF4xZr92gw48XFZ5C395G3y5Ar98C3yUCFy5Gr9akFn3t3yqvFWDAFy0kFyj
	va1jq34kZa1DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
	6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07
	bopBhUUUUU=
X-Originating-IP: [121.237.245.103]
X-CM-SenderInfo: pgdluxxhqj201qj6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_184254_925676_AF5078A6 
X-CRM114-Status: GOOD (  26.48  )
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



On 3/19/26 15:37, daichengrong wrote:
> The RISC-V vector specification states that executing a system call
> causes all caller-saved vector registers (v0-v31, vl, vtype) and vstart
> to become unspecified.
> 
> Currently, after calling riscv_v_vstate_discard(), the vector state 
> may still be marked as DIRTY, which can mislead the context switch 
> logic into treating the registers as containing valid user data.
> 
> This patch clarifies and tightens the kernel-side semantics:
> 
> 1. On syscall entry, the kernel checks the vector state via mstatus
>    and discards it if necessary. After discard, the state is explicitly
>    set to INIT instead of DIRTY, indicating that the vector registers
>    no longer contain meaningful user data.
> 
> 2. During context switch, the vector state is interpreted as follows:
>    - INIT: no valid user data is present, so vector register data does
>      not need to be saved.
>    - non-INIT (e.g. DIRTY): vector register data must be saved.
> 
> 3. On restore, if the state is INIT, the vector registers are treated
>    as invalid and are not restored from memory. Instead, they are
>    overwritten with a known initial value to avoid potential data
>    leakage from a previous task.
> 
> This aligns the kernel's vector state tracking with the architectural
> "unspecified" semantics while ensuring correct lazy context switching
> and preventing cross-task data leakage.
> 
> Signed-off-by: daichengrong <daichengrong@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/vector.h | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 00cb9c0982b1..93c68a549b72 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -298,8 +298,9 @@ static inline void __riscv_v_vstate_discard(void)
>  static inline void riscv_v_vstate_discard(struct pt_regs *regs)
>  {
>  	if (riscv_v_vstate_query(regs)) {
> -		__riscv_v_vstate_discard();
> -		__riscv_v_vstate_dirty(regs);
> +		if (!__riscv_v_vstate_check(regs->status, INITIAL))
> +			__riscv_v_vstate_discard();
> +		riscv_v_vstate_on(regs);
>  	}
>  }
>  
> @@ -315,19 +316,17 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
>  static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
>  					  struct pt_regs *regs)
>  {
> -	if (riscv_v_vstate_query(regs)) {
> +	if (__riscv_v_vstate_check(regs->status, INITIAL))
> +		__riscv_v_vstate_discard();
> +	else if (__riscv_v_vstate_check(regs->status, CLEAN))
>  		__riscv_v_vstate_restore(vstate, vstate->datap);
> -		__riscv_v_vstate_clean(regs);
> -	}
>  }
>  
>  static inline void riscv_v_vstate_set_restore(struct task_struct *task,
>  					      struct pt_regs *regs)
>  {
> -	if (riscv_v_vstate_query(regs)) {
> +	if (riscv_v_vstate_query(regs))
>  		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
> -		riscv_v_vstate_on(regs);
> -	}
>  }
>  
>  #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE

Hi all,

Just a gentle ping on this patch.

I would also like to add some additional motivation from the RISC-V vector spec, which may help clarify the rationale behind this change.

The spec states:

During a context restore, the context need only be loaded from
memory if the status is Clean (it should never be Dirty at restore).
If the status is Initial, the context must be set to an initial
constant value on context restore to avoid a security hole, but
this can be done without accessing memory.

This indicates that the architectural Initial vector state is treated
specially during restore: instead of reloading vector register contents
from memory, the state can be restored by resetting it to the defined
initial value.

The motivation of this patch is related to this behavior. Allowing
userspace to explicitly release vector state when it is no longer needed
may help reduce unnecessary vector context restore overhead on later
context switches. It may also help avoid repeatedly reinitializing the
vector state when applications frequently enter and exit syscalls without
actually requiring vector state preservation across those transitions.

The original RFC discussion and motivation can be found here:

https://lists.infradead.org/pipermail/linux-riscv/2026-March/087678.html

If there are other preferred or more suitable mechanisms for allowing
userspace to voluntarily relinquish ownership/control of vector state,
I would also be very interested in further suggestions or discussion.

Thanks.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
