Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F5BFB5EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 04:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qrg1KThnck8hdvOc2n/cCO3LblMKhLIQ44+r4QPicHo=; b=V5k6KU6Vu8ddco
	vxeGTcLjLJ111t7nhZ4u97aV7A0ysCQawRN41MkxlncIxeNb7UiRegeHS6IyMNa8AT4PauOzHHSa1
	oxAyCXZ+N9Jme7bsbq3baE2N6EQaQ0PudTrzV0nXGKU4iNWu+b0x25lfhhxTWCSR36N5M8VU1wXEy
	ASTr5OZIAPZCO4Wlu3mTHsykDzbou0gWExidrM4QNA24dqwhBBjw5qBB1diRGLXZkoFvu2YPOIBfh
	7WpzzLyoRvHcZ/vkjE6xeo3CNkQIF3VSNgr5pS5RxCUFEFwN0ASkEUl7Zk1tpnYZmzdeSqXs43VBt
	Vbx3Xr/MWU4fO6Mh6G9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2MF2-00000005PJh-2e7l;
	Tue, 17 Mar 2026 04:41:16 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2MEw-00000005PJM-2x57
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 04:41:12 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-64c9a6d68e5so4515949d50.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 21:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773722468; x=1774327268; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ogeNrVUG6Iy92DtP+7CEyxu0EUyRup/ENaXgwpG9I2Y=;
        b=I4oHY7aBAh5ummHvcWb8P35V6+kMrQjbovBBaoG1YlzC8+jYsPlpLkIy8sxY9K+TmO
         eX/3HSSNEUuJmg9gdCRsfU8E5dN3eGTS0wPwuVRX17Ast5/OpGjIkZIrrnvp5+ZmyDOj
         +q3ERrN1cZ80Q7y7lrLqtm9arIzQaaec2NTSoZPf5EXmmaq+BPGGYfTp9daXSe1OdStr
         LayyVMSpqi/rpm+nVf5+Ep4Fo8LL2xjT3xMnaZPr4xv7orzqdexbU2eTpLiAtO6Z38Zy
         OdG6IAlD+CFkfQa+xSXf56JWm0owZAAVD/W6IoT4q5qzUPMxVc+uddeiKm1TIgW4Z5Q9
         Afrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773722468; x=1774327268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogeNrVUG6Iy92DtP+7CEyxu0EUyRup/ENaXgwpG9I2Y=;
        b=akO9WsaRJGoGdZKtoDDG/1v756yL1U5jXVuqrb07sVemFS4DAplWZ8cjcsBvytzx/9
         SATE+4SiAPIrI7oaBJuX43gf9KmWLkL6I/2nxLf5jiUN+gr5xxpIC/pH8GsRY2Ix39vl
         hvUiOcw7m3NUtjKbxd08HbqpYJfXQDuXuWDAH9QK8Yclt2s0cAmBPzlvTq38Sdxg65yN
         2ZzbTA3PONQ/JfErGWk+fnfZp682pEp5a8EgOSfZcfOKQ2Cq68FbijbMni2vw4++73Uc
         dfr+xDDtykRDhhMqLwzwrsixUA+nLinWKWpXtn9Su9QKkuYfp59wc4uTAMa+Nhjr1x0y
         7nhg==
X-Gm-Message-State: AOJu0YxJ+ausH43KeVcw7HdJ82VJGU4JeJCInl/aX5vlKv2RtCaq8lHP
	ge+1pERjy+dC0isDKEUWcJMts/N1T0CIUtLpn2jhbjHCqCzmDcd3geppw1YHjdI5a3o=
X-Gm-Gg: ATEYQzwYKyvHl5M2o/1/rXUG8g1tsEkOc+HxG75jIK16qNoLYacDw++bGQYkGaBSLI2
	DMLPPMHo7wk6AQ8JIV+hBOgjP+grAkvvaceSmWB0WK2hNXgRXHSfijigAyh1UeZo0BOA2NfIyet
	bY7oVFA3Vo7i/v1UWXt5s660IM8CK95XPd0+jkg+Pi2mIvKimP5LtIiHT1Ie1TD2JNytSRDtfxf
	jtuSfPh3mtg91Dn+xFO7accdQVxSptMtvo4s26siPdv22Er3nG4sel5uGXu/nnUNUAJPN1Je6fZ
	08gEQpexaNzBUG7DiD96jS0uaEFezL1mhXe65RggzB4DTVYz3M+gXa1HfGiEKNuI5Q59xlOy7iG
	O3P31Y8bhi22/EwHbsbzH2R21NDjeOQwQUnZHIXfGA5nwXX7XZjygPJhhUUfypqm2KsKXs50QRQ
	YxLgj3pwfL47zKOI9MGA3dpYbFwTiwfca0ENTGG+EK
X-Received: by 2002:a05:690e:11cb:b0:64e:7209:36a7 with SMTP id 956f58d0204a3-64e7209515fmr10210221d50.66.1773722468245;
        Mon, 16 Mar 2026 21:41:08 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a405c5sm6648267d50.2.2026.03.16.21.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 21:41:07 -0700 (PDT)
Message-ID: <d470846b-bd41-44a4-b9b5-51c7d4611e24@sifive.com>
Date: Mon, 16 Mar 2026 23:41:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] riscv: add userspace interface to voluntarily release
 vector state
To: daichengrong <daichengrong@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260317022232.11022-1-daichengrong@iscas.ac.cn>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20260317022232.11022-1-daichengrong@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_214110_786892_717D7AB3 
X-CRM114-Status: GOOD (  29.13  )
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

Hi,

On 2026-03-16 9:22 PM, daichengrong wrote:
> Vector registers in RVV can be large, and saving/restoring them on
> context switches introduces overhead. Some workloads only use
> vector instructions in short phases, after which the vector state
> does not need to be preserved.
> 
> This patch introduces a userspace-controlled mechanism:
> 
> - Userspace can declare that it no longer needs the vector state.
> - Kernel will skip saving/restoring vector registers during context
>   switch while the declaration is active.
> - If the thread executes vector instructions after releasing its
>   vector state, the kernel will revoke the declaration automatically.
> 
> This reduces unnecessary vector context switch overhead and improves
> performance in workloads with intermittent vector usage.
> 
> This is an RFC patch to solicit feedback on the API design and
> implementation approach.
> 
> Signed-off-by: daichengrong <daichengrong@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/processor.h |  1 +
>  arch/riscv/include/asm/syscall.h   |  2 ++
>  arch/riscv/include/asm/vector.h    |  7 +++++--
>  arch/riscv/kernel/process.c        |  1 +
>  arch/riscv/kernel/sys_riscv.c      | 12 ++++++++++++
>  scripts/syscall.tbl                |  1 +
>  6 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 4c3dd94d0f63..b59f1456918b 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -113,6 +113,7 @@ struct thread_struct {
>  	unsigned long envcfg;
>  	unsigned long sum;
>  	u32 riscv_v_flags;
> +	unsigned long riscv_v_release_flags;
>  	u32 vstate_ctrl;
>  	struct __riscv_v_ext_state vstate;
>  	unsigned long align_ctl;
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 8067e666a4ca..f6be37b01a67 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -121,4 +121,6 @@ asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
>  
>  asmlinkage long sys_riscv_hwprobe(struct riscv_hwprobe *, size_t, size_t,
>  				  unsigned long *, unsigned int);
> +// asmlinkage long sys_riscv_release_vector_register(uintptr_t);
> +asmlinkage long sys_riscv_release_vector_register(void);
>  #endif	/* _ASM_RISCV_SYSCALL_H */
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 00cb9c0982b1..4bccccc20cc3 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -309,6 +309,7 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
>  	if (__riscv_v_vstate_check(regs->status, DIRTY)) {
>  		__riscv_v_vstate_save(vstate, vstate->datap);
>  		__riscv_v_vstate_clean(regs);
> +		WRITE_ONCE(current->thread.riscv_v_release_flags, 0);
>  	}
>  }
>  
> @@ -325,8 +326,10 @@ static inline void riscv_v_vstate_set_restore(struct task_struct *task,
>  					      struct pt_regs *regs)
>  {
>  	if (riscv_v_vstate_query(regs)) {
> -		set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
> -		riscv_v_vstate_on(regs);
> +		if (!READ_ONCE(current->thread.riscv_v_release_flags)) {
> +			set_tsk_thread_flag(task, TIF_RISCV_V_DEFER_RESTORE);
> +			riscv_v_vstate_on(regs);
> +		}

This is a security bug, because it leaks the previous task's vector registers.

>  	}
>  }
>  
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index aacb23978f93..f1f36a3c7914 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -279,6 +279,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  		p->thread.ra = (unsigned long)ret_from_fork_user_asm;
>  	}
>  	p->thread.riscv_v_flags = 0;
> +	p->thread.riscv_v_release_flags = 0;
>  	if (has_vector() || has_xtheadvector())
>  		riscv_v_thread_alloc(p);
>  	p->thread.sp = (unsigned long)childregs; /* kernel sp */
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 22fc9b3268be..934ddc06858d 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -8,6 +8,7 @@
>  #include <linux/syscalls.h>
>  #include <asm/cacheflush.h>
>  #include <asm-generic/mman-common.h>
> +#include <asm/vector.h>
>  
>  static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>  			   unsigned long prot, unsigned long flags,
> @@ -78,6 +79,17 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
>  	return 0;
>  }
>  
> +SYSCALL_DEFINE0(riscv_release_vector_register)
> +{
> +	struct pt_regs *regs = task_pt_regs(current);
> +
> +	if (__riscv_v_vstate_check(regs->status, DIRTY))
> +		__riscv_v_vstate_clean(regs);
> +
> +	WRITE_ONCE(current->thread.riscv_v_release_flags, 1);

To avoid leaking register state at context switch, you must either:
  1) set the vector registers to some safe contents (e.g. the initial state) or
  2) set VS=off

So if RVV is used rarely enough that you are willing to pay the cost of a trap
when you next use it, this function can be as simple as:

  riscv_v_vstate_off(task_pt_regs(current));

> +	return 0;
> +}
> +
>  /* Not defined using SYSCALL_DEFINE0 to avoid error injection */
>  asmlinkage long __riscv_sys_ni_syscall(const struct pt_regs *__unused)
>  {
> diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
> index 7a42b32b6577..1d0a493b87c3 100644
> --- a/scripts/syscall.tbl
> +++ b/scripts/syscall.tbl
> @@ -302,6 +302,7 @@
>  
>  244	or1k	or1k_atomic			sys_or1k_atomic
>  
> +257	riscv	riscv_release_vector_register	sys_riscv_release_vector_register
>  258	riscv	riscv_hwprobe			sys_riscv_hwprobe
>  259	riscv	riscv_flush_icache		sys_riscv_flush_icache

You may also consider adding a flag to prctl(PR_RISCV_V_SET_CONTROL) instead of
a new syscall. So it would look something like:

  prctl(PR_RISCV_V_SET_CONTROL,
        PR_RISCV_V_VSTATE_CTRL_ON | PR_RISCV_V_VSTATE_CTRL_RESET);

(Arguably it is a bug that riscv_v_ctrl_set() doesn't call riscv_v_vstate_off()
for PR_RISCV_V_VSTATE_CTRL_OFF already.)

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
