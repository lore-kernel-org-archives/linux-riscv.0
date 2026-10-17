Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04D1CC6B2A
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 07:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/K1N74P9x+pSJHaYRQVM1xjWf292a+2zJy22gPR/naY=; b=NXcFL4C2STitAy
	pGqsYQ7hMBsNNmohF56MUmjKGBhuH6FD0QGtSiQtU0WDH4mdd147drMg6F+mYAP/4dzpSypivG4IK
	3HH5UU8Lyjv+ziagzLEA3zD+N0anwUGMb1nPe0xcViQhmWaerVw2T+8fwNFaUTE199A1i68aTFtyu
	vtbn70/ju7S6wxbuOkV4//REg1w2a45znoGFiAi+pTM/+RSN+1ThLVJIHwX5eH5TsyS37bWYYXIy+
	1jnw1TY4+cCtp3PSXuY1iYesxRvaFucEX24vYBAEQRC8y+emgX/yA6zCyjwPVteXRDZKz3j0kzHUo
	qbXmpyg4mBR+hp/CdGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyoD-00000004Vq6-1umu;
	Sat, 17 Oct 2026 07:26:25 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyoB-00000004VpZ-0ulb
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 07:26:24 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6714595153cso1503967d50.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 00:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792221982; x=1792826782; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PcBQe8FM4jqkZp3iRfJbe9kW+y/urIO/htZpqOKaQ0Y=;
        b=O9el00s/hKzb1DCZtZ8ZRX1oXhFxlB8u3iuLoySrNDWh+bUMvNhGJbjxWT5hF5dbD2
         ovORCbP2d1YtSm6dqg2cglK9LbbRkBaaccBqbeub1kXvPTuDO5BZD2pGHPQEiaKd6DDw
         H9F2NrFNkD/92qdNxWkJ+NF6J5bVgmb8ITwFViR4Ado508LuAyhe4RrcLO77G72PWdC6
         vIDZaWL44S1MN+neZtLNYExu/7ci0y9nF+pi97GMmRcBfogtv4tUqUYWlG5hg6fkuQxg
         gsRtBQ0DGeohelUwTh3xwcgArnG0zyWOJKAf6ycM3OYdlOxUE6jqsz8TzwzJRAo/4kpy
         XwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792221982; x=1792826782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcBQe8FM4jqkZp3iRfJbe9kW+y/urIO/htZpqOKaQ0Y=;
        b=Xj2JPVgDpVm3POSlq8Xcw3MV5642itSZjVJeMKpdy7WUFBqunNeGGuCoe5zLIKfuJ9
         ObgNA9AFviqlwF7z6R1WO/yrKNg8vkhiXeuyZmn9jNQqqPrRPSs4bvSQk9h6nGmp2Mui
         G49R0eWIM/9nCxy+9iY3KpGaStjlGwPd/atKl71rD2UpLvN6uqit0NgbFKBdFlbCuit4
         Jtqfymg++tfx7DnUTSvq6y6Pd+fMmOCjxEWHjuyk+xQ2pJJtbwxqPABTjx40g/+e6xsK
         vvBJcQoFL0MSFYb2BbLcRZqFvTMC3nIc03GlidVp4uHMVUhCKpebI3Cm+pzTr/E3sVib
         JclA==
X-Forwarded-Encrypted: i=1; AKwUvBwLntuGpkcTaUa4jahm8jl2EEwvHdeOja2SYsZELdRK8xDDSflEqUuAXPo3Mv3PZW91cnlpSmMwJBUEIg==@lists.infradead.org
X-Gm-Message-State: AFq9FYI36yAgJtxBC3C0yxpskIyqDg4cJsHkaJvO1euw1mRR1f6u1sSm
	2mY78n7EOJFkZV0GkpG1PV3nqkBSax4FzzI7XZ/6ljnDeJvQVvpZjGnWXJpqk6l13HE=
X-Gm-Gg: AYBFou2XFY/2pGFDS2ba04qfpGvHnCcJNhac02DFK8lL48yXCtGfkSonqnBFR9BJ5Og
	/SLQB6so2xONVzi2f1osd74Jwgxqr/AnO2OlCpv/JhiBDeVu8/Jg8jbMUAN6Qh6WRXRYi9B/tHS
	8WBOLB9A+hnyxhhAM7+7h7Uio8Qq4JcU+rrt2dTeUhcLN/vJdc+Im60AHke5MHx9Xu8GdueF5Kn
	Qxp4AAcde1c5muZ+gXrrFnd16sto6bjB9zi7NyYiay+eUwTIUUBQRQfi2JtvHWo1PXt4pMWB4uQ
	VIEyFiC1OyBe42kd08qyllmRfn10epE4upxUoHfEUkou1ZPHkUHX84khtIkRjs9PUWZ6EQVhLNL
	FmGJxSxCE0GkfYg8XQVgPc1H0mbjq44cwzbWqi2+engxGxBgGFN8PA1NZDiMEWPrtt2hOH/wxhg
	Q/cblsTynVx9RusIF9iqOWug6p2WubUnTITt8Ac21/uY6e5Xfq/YZ+of2H3gezDp+gWXtRaheqj
	pkt23vfr824/lmdPQzG+x790kgcD6g=
X-Received: by 2002:a05:690c:c017:b0:8ac:927:f7e5 with SMTP id 00721157ae682-8b0f20f4704mr6362897b3.10.1792221981874;
        Sat, 17 Oct 2026 00:26:21 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e591c51bsm18053947b3.34.2026.10.17.00.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:26:21 -0700 (PDT)
Date: Sat, 17 Oct 2026 02:26:20 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Guobin Zhang <guobin.zhang@intel.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: signal: protect regs->status RMW from concurrent
 preemption
Message-ID: <atMjHBJI9LoEve8-@Tao-Chiu's-Mac>
References: <20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_002623_276868_339A2952 
X-CRM114-Status: GOOD (  32.40  )
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

Hi Guobin,

On Fri, Aug 07, 2026 at 11:00:50AM +0800, Guobin Zhang wrote:
> __fstate_clean() performs a non-atomic read-modify-write (RMW) on
> task_pt_regs(current)->status to clear the FS bits. This RMW is
> unprotected - it runs with preemption enabled and IRQs on during
> signal delivery (setup_rt_frame -> fstate_save) and sigreturn
> (restore_fp_state -> fstate_restore).
> 
> If a reschedule IPI or timer interrupt triggers preemption between
> the load and store of this RMW, __switch_to_vector() calls
> riscv_v_vstate_set_restore() which modifies the VS bits of the
> same regs->status. When the preempted task resumes, it stores back
> the stale value captured before preemption, overwriting the VS
> update and restoring VS=DIRTY while TIF_RISCV_V_DEFER_RESTORE
> remains set - a combination that should never occur and leads to
> vector state corruption.
> 
> The race window:
> 
>   __fstate_clean (signal path)      set_restore (schedule path)
>   -----------------------------     -----------------------------
>   ld  a0, regs->status  // VS=DIRTY, FS=DIRTY
>                                      <- preempted (reschedule IPI)
>                                      regs->status VS = INITIAL
>                                      set TIF_RISCV_V_DEFER_RESTORE
>                                      <- resumed
>   andi a0, ~FS
>   ori  a0, FS_CLEAN     // stale a0 still has VS=DIRTY
>   sd   a0, regs->status // overwrites VS=INITIAL with VS=DIRTY
>   -> result: VS=DIRTY + DEFER -> ANOMALY
> 
> Fix by adding preempt_disable/enable around the RMW in
> __fstate_clean() and fstate_off(). riscv_v_vstate_set_restore()
> has the identical hazard: it is called from __restore_v_state()
> (sigreturn path) with preemption enabled, and it can race the same
> way against the scheduler's own call to riscv_v_vstate_set_restore()
> for the same task in __switch_to_vector(). Wrap that call site with
> preempt_disable/enable as well.

Thanks for finding this. Indeed, pt_regs->status updates are not safe in
preemptible context, since it is not atomic and can race with the
nesting context. This can result in vtype corruption since marking the
VS as DIRTY again will write the vtype used by the context saving code
into process's vstate when setting up the signal frame.

> 
> Add WARN_ON_ONCE(preemptible()) to riscv_v_vstate_restore()
> to catch any future unprotected callers at development time.
> 
> Signed-off-by: Guobin Zhang <guobin.zhang@intel.com>
> ---
> Race: regs->status is shared between the FPU (SR_FS) and vector
> (SR_VS) state machines. Three call sites do a non-atomic RMW on it
> while preemptible: __fstate_clean()/fstate_off() in switch_to.h, and
> riscv_v_vstate_set_restore() as called from signal.c's
> __restore_v_state() (sigreturn path).
> 
> Cause: if the task is preempted between the load and the store, the
> scheduler's own switch_to() writes the other half of the same
> register word when switching this task back in. The task then
> resumes and stores its stale value, clobbering that write.
> 
> Fix: wrap each RMW with preempt_disable()/preempt_enable(). This is
> sufficient because the conflicting writer only runs via an actual
> context switch of this task, which preempt_disable() prevents.
> local_irq_disable() is not needed: no IRQ handler touches
> regs->status, so masking IRQs would add latency without closing any
> extra race.
> 
> Reproduced on Spacemit K1 hardware; not reproducible under QEMU/TCG
> (see commit message for the full race-window trace).
> ---
>  arch/riscv/include/asm/switch_to.h | 4 ++++
>  arch/riscv/include/asm/vector.h    | 2 ++
>  arch/riscv/kernel/signal.c         | 2 ++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 0e71eb82f920..fd0ceebd1c23 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -21,13 +21,17 @@ extern void __fstate_restore(struct task_struct *restore_from);
>  
>  static inline void __fstate_clean(struct pt_regs *regs)
>  {
> +	preempt_disable();
>  	regs->status = (regs->status & ~SR_FS) | SR_FS_CLEAN;
> +	preempt_enable();
>  }
>  
>  static inline void fstate_off(struct task_struct *task,
>  			      struct pt_regs *regs)
>  {
> +	preempt_disable();
>  	regs->status = (regs->status & ~SR_FS) | SR_FS_OFF;
> +	preempt_enable();
>  }

Ideally, we should guard the preemption at fstate_save and
fstate_restore level. This works because saving and restoring floating
registers are reentrant safe (not for the vector as we will get the
corrupted vtype).

Instead, I would prefer enclosing premption off region there, and have
fstate_{save,restore}_preempt_off() for code that is clearly run with
preemption off (the scheduler code and kernel_mode_fpu).

Something like:

+static inline void fstate_save_preempt_off(struct task_struct *task,
                               struct pt_regs *regs)
 {
        if ((regs->status & SR_FS) == SR_FS_DIRTY) {
@@ -44,7 +40,7 @@ static inline void fstate_save(struct task_struct *task,
        }
 }

-static inline void fstate_restore(struct task_struct *task,
+static inline void fstate_restore_preempt_off(struct task_struct *task,
                                  struct pt_regs *regs)
 {
        if ((regs->status & SR_FS) != SR_FS_OFF) {
@@ -53,14 +49,30 @@ static inline void fstate_restore(struct task_struct *task,
        }
 }

+static inline void fstate_save(struct task_struct *task,
+                              struct pt_regs *regs)
+{
+       preempt_disable();
+       fstate_save_preempt_off(task, regs);
+       preempt_enable();
+}
+
+static inline void fstate_restore(struct task_struct *task,
+                                 struct pt_regs *regs)
+{
+       preempt_disable();
+       fstate_restore_preempt_off(task, regs);
+       preempt_enable();
+}
+
 static inline void __switch_to_fpu(struct task_struct *prev,
                                   struct task_struct *next)
 {
        struct pt_regs *regs;

        regs = task_pt_regs(prev);
-       fstate_save(prev, regs);
-       fstate_restore(next, task_pt_regs(next));
+       fstate_save_preempt_off(prev, regs);
+       fstate_restore_preempt_off(next, task_pt_regs(next));
 }

 static __always_inline bool has_fpu(void)

 Thanks again for finding this and please let me know if you would like
 to send a revision for this.

 Cheers,
 Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
