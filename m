Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F371606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 23:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=baG7CHeZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=GJL5H5B/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zKvy8yCLddXeq30WkTY5Wd1clj43QTZstlBYWj1dxYA=; b=baG7CHeZAZYcZ8WczeHu5ufVH0
	QivrWiPw6k3VUu4NgULisclP4qpnTbnBuFoUhana7Xl8RyxJAsuWWQULPJjhRW6sGuqDmWvZ6yEt4
	1XAziOo445MLKj5gexCtNxS0wQ7ZnF5mkKFpHC/OWhSINLgbNo/HYB3YJW+EiI2shXnlw+ZW20W7D
	2iCH4+IsjO+2XcQKe5k13xZBKKfxgmWcJXRoedJkmZd+zyGTaHWVj+03pVX5cvoSNHHXN4h9YnD3E
	CxEeDw7caL5tspufVCrYQIJQTnUs5bs44QCgio4hZZZ0YGDpdZ7ZctOW9td3YZ1wIlEIOzsZdkoh7
	FAbdPoTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK1pw-0000000F8nx-32aN;
	Thu, 22 Oct 2026 23:04:40 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK1pq-0000000F8nR-17wg
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 23:04:39 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-82380b0f55dso110617a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 16:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792710273; x=1793315073; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jSu0BLMuA7L43aT6T2KcW7Fkv7IJTbKPBRbS3rQaZjo=;
        b=GJL5H5B/UZa0KZBLZ1itPhGZnqCtq172Pm0PKbzmPKXcfHeOCzpIbcDaxxl4liUux9
         rQGv+HjKc53KKZRl7QUHMEpgfoQKHHXZcWNf8BOkgcsblCF6xZxECmaZXU1OtIbrhCvX
         2eItW4gTQQ9DH4MOmf5KsiwrPq6YTSMdXMGxDAtktN1OjdLyOMbjXNWEUov8Ll6hoUAF
         4NXL5VMDmixVNTTQkKdJNboRUrKicdLvGRLSyQDOxGgmQOPArR+sEinjQeNcm1fkhaRl
         AzJEDxSO7zNxMZ8uaMvzenSUVtJrzFtcVRiqKUfxJG/za2OcoyGW4MVCn8Xra4Pebsis
         IIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792710273; x=1793315073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSu0BLMuA7L43aT6T2KcW7Fkv7IJTbKPBRbS3rQaZjo=;
        b=SbRnZvdZkZYmMD1Aee6p6kp4lv1NsXA4kK5tLznfxW4y2n9SoLmswfaLQnJ35byn2A
         jRfgYzp6+384kFc7YfBNGTVT6YXeWHWcHro8cYnaqov8+LrmIAvTZcDKmVpvMl8h4oD4
         IhFqCM17d1wWravUvzNyBRKdAttyDpemMWWY5irPbEwGuAPojkPkryVDqLwkut76xDib
         VXJlUibDJopcZ7OBRwVobZ8n7GF/W4j1YBUQg2pXDpyyv5A3Spe2aM2ao/vLb+RR3CmS
         ZjqDuOQcUhwSC79EaO3TLFMRX6okGLg/SO4U3zo/654Y8lQtyLpuAwhcQ3b113IeFlgx
         lZXg==
X-Forwarded-Encrypted: i=1; AKwUvBzRQrYmvemOWi/Laps0W01i7RPuzUTTDYDqkf+n6n4cPDhn4T2RipMecey+a36FkY7XCeznjKl8bndhhA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIDGeqJYsbjkAbplFWDKrp6WltHP+Vr6BTN06myetHaI4fIhgob
	LKPxhQs8U9zMewdJOqV0qZbh8e1ZlLkhZHrFWHd7a8pDJ1elNGc8DQNEWROSyEknz/iC2bsVePq
	PBuXMK4U=
X-Gm-Gg: AYBFou0z+TgbmDy3ygZaydJ87keG/KsH4oZCgL5PeDl2K1TszQD8QY+G7ifhE6qvk26
	jYOydbo0rwhbCT3R4yAF7xy7DvDBB9TBF2vS6LN2ebd0BPKq1KahuLTqpFonKhQo7RpvIcV7Arq
	9GiMfW1uF+yGR2taLNBG44L5nxZVTZIc87j9GUEdrM9UGOT9cbeIDZ8d1TCIMwqK0TsyhM/K3xU
	Q8jNRIXK+BtQQ6yqf6j6nQYgHPNo6zyEfLVzW3svhAhpBIip5LNe+yGSPsVRrDk0h9v2CX2grvL
	i+DnQ1z+f+bD5V95YxixXzAVcWyw2+mdJdiBO+q2nG3iMH51tk5qIwB6BiEhlNnt26myY482kL0
	kKR2mRpRTbBFn6c+9+WuY/z20FR0oGxLpPwSlwejaa2SLWLg07pDddSgW1gg0yXLArHv+i8V7ZN
	1yZmo8PnCwEPm+rNmQ5rVjxH/IsWMNQhAkSlK0Zt0isGtgpJPT7d+1y6UoHCxx1dckC0JOBr0+c
	jpYLOTzx2IlvHvpsoyFwId3JUtprJhBgaqzDpx0MnCNAgc3EbczCZxm2bA6tDo8XX8=
X-Received: by 2002:a05:6830:b14:b0:814:b62d:3122 with SMTP id 46e09a7af769-84fb135c9c0mr429298a34.22.1792710273153;
        Thu, 22 Oct 2026 16:04:33 -0700 (PDT)
Received: from localhost ([68.203.12.10])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbb382c62sm432420a34.1.2026.10.22.16.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 16:04:32 -0700 (PDT)
Date: Thu, 22 Oct 2026 18:04:31 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Guobin Zhang <guobin.zhang@intel.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: signal: protect regs->status RMW from
 concurrent preemption
Message-ID: <atqWfyAobkl6TXCN@Tao-Chiu's-Mac>
References: <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_160434_322323_5A8204AC 
X-CRM114-Status: GOOD (  36.73  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 07:24:25PM +0800, Guobin Zhang wrote:
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
> Fix by adding preempt_disable/enable in fstate_save() and
> fstate_restore(), which covers the RMW in __fstate_clean(), and
> around the RMW in fstate_off(). Add fstate_{save,restore}_preempt_off()
> for code that already runs with preemption disabled (the scheduler and
> kernel_mode_fpu).
> 
> riscv_v_vstate_set_restore() has the identical hazard: it is called
> from __restore_v_state() (sigreturn path) with preemption enabled, and
> it can race the same way against the scheduler's own call to
> riscv_v_vstate_set_restore() for the same task in __switch_to_vector().
> Wrap that call site with preempt_disable/enable as well.
> 
> Add WARN_ON_ONCE(preemptible()) to riscv_v_vstate_restore()
> to catch any future unprotected callers at development time.
> 
> Suggested-by: Andy Chiu <tchiu@tenstorrent.com>
> Signed-off-by: Guobin Zhang <guobin.zhang@intel.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
> regs->status is shared between the FPU (SR_FS) and vector (SR_VS) state
> machines, and is updated with plain read-modify-write. When such an RMW
> runs preemptible on the current task, the scheduler may update the other
> field of the same word in between (e.g. riscv_v_vstate_set_restore() in
> __switch_to_vector() on switch-in), and the stale store then clobbers
> it, leaving VS=DIRTY with TIF_RISCV_V_DEFER_RESTORE set.
> 
> v2 follows Andy's suggestion: preemption is disabled at the
> fstate_save()/fstate_restore() level, which is fine because the FPU
> register save/restore itself is reentrant-safe, and new
> fstate_{save,restore}_preempt_off() variants are used by callers that
> already run with preemption disabled (__switch_to_fpu() and
> kernel_fpu_{begin,end}()). fstate_off() and the
> riscv_v_vstate_set_restore() call in __restore_v_state() are wrapped
> directly.
> 
> local_irq_disable() is not needed: no IRQ handler touches regs->status.
> 
> Reproduced on Spacemit K1 hardware; not reproducible under QEMU/TCG.
> ---
> Changes in v2:
> - Disable preemption at the fstate_save()/fstate_restore() level and add
>   fstate_{save,restore}_preempt_off() for the scheduler and kernel_mode_fpu
>   (Andy Chiu)
> - Drop preempt_disable() from __fstate_clean()
> - Link to v1: https://patch.msgid.link/20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com
> ---
>  arch/riscv/include/asm/switch_to.h  | 30 ++++++++++++++++++++++++------
>  arch/riscv/include/asm/vector.h     |  2 ++
>  arch/riscv/kernel/kernel_mode_fpu.c |  4 ++--
>  arch/riscv/kernel/signal.c          |  2 ++
>  4 files changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 0e71eb82f920..709831688ef3 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -27,11 +27,13 @@ static inline void __fstate_clean(struct pt_regs *regs)
>  static inline void fstate_off(struct task_struct *task,
>  			      struct pt_regs *regs)
>  {
> +	preempt_disable();
>  	regs->status = (regs->status & ~SR_FS) | SR_FS_OFF;
> +	preempt_enable();
>  }
>  
> -static inline void fstate_save(struct task_struct *task,
> -			       struct pt_regs *regs)
> +static inline void fstate_save_preempt_off(struct task_struct *task,
> +					   struct pt_regs *regs)
>  {
>  	if ((regs->status & SR_FS) == SR_FS_DIRTY) {
>  		__fstate_save(task);
> @@ -39,8 +41,8 @@ static inline void fstate_save(struct task_struct *task,
>  	}
>  }
>  
> -static inline void fstate_restore(struct task_struct *task,
> -				  struct pt_regs *regs)
> +static inline void fstate_restore_preempt_off(struct task_struct *task,
> +					      struct pt_regs *regs)
>  {
>  	if ((regs->status & SR_FS) != SR_FS_OFF) {
>  		__fstate_restore(task);
> @@ -48,14 +50,30 @@ static inline void fstate_restore(struct task_struct *task,
>  	}
>  }
>  
> +static inline void fstate_save(struct task_struct *task,
> +			       struct pt_regs *regs)
> +{
> +	preempt_disable();
> +	fstate_save_preempt_off(task, regs);
> +	preempt_enable();
> +}
> +
> +static inline void fstate_restore(struct task_struct *task,
> +				  struct pt_regs *regs)
> +{
> +	preempt_disable();
> +	fstate_restore_preempt_off(task, regs);
> +	preempt_enable();
> +}
> +
>  static inline void __switch_to_fpu(struct task_struct *prev,
>  				   struct task_struct *next)
>  {
>  	struct pt_regs *regs;
>  
>  	regs = task_pt_regs(prev);
> -	fstate_save(prev, regs);
> -	fstate_restore(next, task_pt_regs(next));
> +	fstate_save_preempt_off(prev, regs);
> +	fstate_restore_preempt_off(next, task_pt_regs(next));
>  }
>  
>  static __always_inline bool has_fpu(void)
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index 00cb9c0982b1..da1559bcee36 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -315,6 +315,8 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
>  static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
>  					  struct pt_regs *regs)
>  {
> +	WARN_ON_ONCE(preemptible());
> +
>  	if (riscv_v_vstate_query(regs)) {
>  		__riscv_v_vstate_restore(vstate, vstate->datap);
>  		__riscv_v_vstate_clean(regs);
> diff --git a/arch/riscv/kernel/kernel_mode_fpu.c b/arch/riscv/kernel/kernel_mode_fpu.c
> index 0ac8348876c4..03d847fbfcf6 100644
> --- a/arch/riscv/kernel/kernel_mode_fpu.c
> +++ b/arch/riscv/kernel/kernel_mode_fpu.c
> @@ -14,7 +14,7 @@
>  void kernel_fpu_begin(void)
>  {
>  	preempt_disable();
> -	fstate_save(current, task_pt_regs(current));
> +	fstate_save_preempt_off(current, task_pt_regs(current));
>  	csr_set(CSR_SSTATUS, SR_FS);
>  }
>  EXPORT_SYMBOL_GPL(kernel_fpu_begin);
> @@ -22,7 +22,7 @@ EXPORT_SYMBOL_GPL(kernel_fpu_begin);
>  void kernel_fpu_end(void)
>  {
>  	csr_clear(CSR_SSTATUS, SR_FS);
> -	fstate_restore(current, task_pt_regs(current));
> +	fstate_restore_preempt_off(current, task_pt_regs(current));
>  	preempt_enable();
>  }
>  EXPORT_SYMBOL_GPL(kernel_fpu_end);
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 59784dc117e4..6f6f3315bc09 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -123,7 +123,9 @@ static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
>  	 * to avoid getting the vstate incorrectly clobbered by the
>  	 *  discarded vector state.
>  	 */
> +	preempt_disable();
>  	riscv_v_vstate_set_restore(current, regs);
> +	preempt_enable();

Just a quick note for Paul that my v6 vctxopt series will conflict with
the above code, can be fixed by including __riscv_v_vstate_clean() to the
preemption off region. I can also respin the unmerged patches if that
makes things easier.

>  
>  	/* Copy everything of __sc_riscv_v_state except datap. */
>  	err = __copy_from_user(&current->thread.vstate, &state->v_state,
> 
> ---
> base-commit: 075b74841bd0065a3bda3440873c747938e69b68
> change-id: 20260807-vector_fpu_regs_status_rmw_fix-b51fa4a453d8
> 
> Best regards,
> --  
> Guobin Zhang <guobin.zhang@intel.com>
> 

Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
