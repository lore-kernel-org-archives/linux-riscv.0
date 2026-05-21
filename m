Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4A9CD4F3D
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 06:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTLDXqV15ffzGfYYSeKpR8YAxUh1k6SRFsbkXiK5Cow=; b=RB2LRQW9qDOqHj
	OL32Su/FP3ey0LYlcgF8GtIOijfCSuX5CHZmh8GFqX9Eh/TWB5x5FGCjnKAfEYMUpr+zlPeB/gwh6
	iygQMPebDp6Z7nOEf32eMCauJ/Khn/1SOe3w8ejPwu7Kzj2ervILJ+1fljSbnLasN3FGL9sHBIRE/
	wZcZMh8kelXIjqMJU6C+z4abUesDrJF8Mszniy30Ctxuri+6z1H1s5gqhip7OlvyY0WnZS6C3lm6j
	+Oa57kfx3pWkSZbMmUhaz8xkA7WqD4Jr4TA+vgX59GceEwwxfKAeTvyB6VJ9xK/7zSpA6gCAl1sEW
	6Y95xBvhMlcOxx8RaxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxDI-00000006rn7-33Mt;
	Thu, 21 May 2026 06:49:00 +0000
Received: from mail-yx1-xb142.google.com ([2607:f8b0:4864:20::b142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxDF-00000006rly-3UEf
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 06:48:59 +0000
Received: by mail-yx1-xb142.google.com with SMTP id 956f58d0204a3-6530287803cso5868969d50.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 23:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779346136; x=1779950936; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+A6cxApH+5sNlVYfEhEvEKn9bzG631q7W7KYWfcJkvU=;
        b=GdBLuVJc79rIz/Cijlbk1zzYRwv3ipM5qM5KguKy60d/yKdEIpXsc7JqQz3WzrUcHw
         CXubqzcYVNPN21ZGY1/kf+ZClB63qEsYGWPSTKhUKqJzhC8tpmy+y/GBhjBEhJcp7FZ4
         lbdgVcoMPmpgleGaa2DCxtXIxSFX87W+Lxo6INZF1vujmfbX5TePIfZyqwfArMVauoS6
         xJnvQi3HxxjKa4gYn9TZ1KlfAlUs/NKALVs3fcvCnTnIT4pxrjyhf8KFGWtzCUzP3sju
         elBTK2Js/1J0JeSLOyPzEXzuf445eTuD/0g0ub3RzrADm+V15WPLsHE2XEN0QkXlyhpC
         cNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779346136; x=1779950936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+A6cxApH+5sNlVYfEhEvEKn9bzG631q7W7KYWfcJkvU=;
        b=ZOR2Qs1p3XE4QtP9pBTa6gpWrqNweC6HDc5DpZRWRVyRY0P4ZNegEyQjv0hSay9iIx
         PfByLY5HJrPhpq/C7Tfuusa0/0+irUtVqu0CDLXdFwCePzG0SxiX6c7oW7HQjo52ctp5
         XKSc/f8/oGNrFPa6Yn1+eiJnltJIxSlKDPxSjieJIj7cHYoDxgTt+SpJo/8G1sm1UT/+
         ExUQR3MaGHOyVzUFrW355lWlYDm9INCzbHIv+ORxsNzWvELzNi+8DQ5P51H2rPCOfJje
         ac/GW32TmSZGpzw4ha6UHCpE1KDwzwlI08inUasZu1TMoPN95l1YivKqNmR2OKIJf+mf
         xObA==
X-Forwarded-Encrypted: i=1; AFNElJ+/28EM8BB9QVSUNrZvD+CXhX0lXgZdC7rqMqIJCvGxaj74nPT6nSE9FBb89NPPg97qVQQDAacLdDLWhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlliBAynfS0z8Ci1O5DqF0gjuuw3eW1RtthRUJca8WGbktsF1m
	9mpADIP1DEWSFrENUkouGMBpmMd28nn8fQwjbZ6h4OotiJQsUxWRhCnXRu9dfCxl3V0=
X-Gm-Gg: Acq92OG1tp4wjUx3AJ+rx0tUX+/KB0HytQdHUMsOuUN7KqUk+JZUxf/Hkeq+lfz/2bV
	ExUjTB+nt8UfL8Jv7PPDOMidh965NoXxAqf6r2aYrHzcmuzr8Kyt55UDI4CCPWescJYxW+OmFtU
	v5ATew1M0pAws/0rOAWeCMT8vZ2T/XylLA95pMi0bsJ3wA8rFioe4sNXt5uxiJNBCDnWctqHJoC
	BWpNNV4qQoCM2gPY7MtSEZZwaxbQleH4mrvfrlqTPRgk0bzDWDjNaQaHZ2FvN2vv84unMdbb9fX
	/VKneZXh52s0qyoueHkrZh+scb9Nq0mJUgWhxizyVkI3tQKnCS/vWB7i7nm3yAfujCCjZc8ZGzk
	gIO+okBgoYmMrD3gbSmiQyC35fkLc4mY7d5f6pTxqvWtw+ZNuZfkGn0RaHiK1/0f0nMA1Gy/aw2
	RAPt6AhTi5JUP+v/m80ghT+nzYaQtIdqAtlOXNN+MZ
X-Received: by 2002:a05:690e:1285:b0:64e:f106:60ea with SMTP id 956f58d0204a3-65eae27ab87mr1101526d50.44.1779346136273;
        Wed, 20 May 2026 23:48:56 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:f8e3:7ff3:dc2:1810])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0d8e7585sm10368092d50.9.2026.05.20.23.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 23:48:55 -0700 (PDT)
Date: Thu, 21 May 2026 01:48:55 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: 20260319073709.18562-1-daichengrong@iscas.ac.cn,
	daichengrong@iscas.ac.cn
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, samuel.holland@sifive.com
Subject: Re: [RFC PATCH] riscv: clarify vector state semantics on syscall and
 context switch
Message-ID: <ag6n7gz8KwIpTZz8@Tao-Chiu's-Mac>
References: <20260319073709.18562-1-daichengrong@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260319073709.18562-1-daichengrong@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_234857_883815_845D835B 
X-CRM114-Status: GOOD (  28.52  )
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

On Thu, Mar 19, 2026 at 03:37:09PM +0800, daichengrong wrote:
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
Hi daichengrong,

Good catch on spotting this optimization opportunity!

I have a patch series[1] that happens to be very similar as yours, but I
think your coding style make the code more readable (I like the way you
use _vstate_check for CLEAN on restore path).

Here are some issues where this patch breaks:
- first-use trap returns discarded vregs instead of zero'ed.
- ptrace gets stale vregs in PTRACE_SYSCALL
- context modifications through signal handler are dropped at syscall
  stops.

I will merge your patch into my v3 with all the above fixed. Hope that
sounds good to you!

[1]: https://lore.kernel.org/linux-riscv/20260402043414.2421916-2-andybnac@gmail.com/

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
We can skip discarding vstate here as it will be done in the restore path
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
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

Cheers,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
