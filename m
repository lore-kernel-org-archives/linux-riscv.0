Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4ABBC98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 04:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCRJaFTHmVJM59B9SSOknrPaNAlMAnJhiplQVBhA1jM=; b=rosN6MfXZLxxb9
	l7PD5J3TNK1YqQBqG1sYcehSFQeWWs7f/CyWHqppP10Lfp7XXG/XCiI/1nOQm+eTc8MoAQN22Tibk
	utkOPs7+CawWjTTELOAG4NhW6HMwiJtp35bQJxU1hBgDfV7erlUC1LH9gdKfdbdTPXuxpP/CIUA4Z
	3ChvaxqvJXgNbDcON02CErlSSOSSjYRfxsF5PmOuFoTiBzstV0zxqimTMkzhoeKEejD77Rp8PQqnu
	xxfp1n8+MMSVZLc1+cSByxu1iNeeRv0KGRf/EQ1PVC942w1so8SVlz5hinK1lUCMwYDrNWs/2JFrO
	0VwNFGY3vGLNjvkjZTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xdG-0000000CcNX-19ol;
	Fri, 25 Sep 2026 04:33:58 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xdD-0000000CcMy-2L7l
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 04:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=7hQ11hEZQrpBkoI/YAXz3ZjiMto8X2wVm1c+8n1Ybso=; b=BJHQrLaX1bNEXN49+vdvDEqUPK
	hNZ6qD/0aUTH5S3mmoT2ussX7XsJkxg0glr8SrMIwHUgc1ON7zXjuxULhoiQzlVCQoIkevMM4jAPz
	Km2+xT9x1DfvHx1zbwRxI2QnvcGyn1+bVXJVVuNzdU8MawUb2INqoYd3IzJ6aO1FJPY6CHmCtHrgk
	tGmfx+QjpEvKpZjRhuodeHNdGjUIfQ/K0ko5EAFi4fTGFgFnsM5JmdCTzTdequFvNSwIcaq+MSiTO
	EWhOMjXuT5HeYtk+tfFPG9vKLOx2rI08TTX9afcAqZ8GW3y9JiPnL4IGrvxOvytGhtpGHvhnY0B6F
	9nE/aJRQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x9xd8-00000009gVM-24Fa;
	Fri, 25 Sep 2026 06:33:50 +0200
Date: Fri, 25 Sep 2026 06:33:50 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Guobin Zhang <guobin.zhang@intel.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: signal: protect regs->status RMW from concurrent
 preemption
Message-ID: <arX5rpNRRk8r2Nve@aurel32.net>
Mail-Followup-To: Guobin Zhang <guobin.zhang@intel.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_213355_633096_88140959 
X-CRM114-Status: GOOD (  23.49  )
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

On 2026-08-07 11:00, Guobin Zhang wrote:
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

Han Gao pointed me to this patch as a possible fix to the issue I 
encountered on the SpacemiT K1 [1]. So far, my first tests show
that it either fixes the issue or at the bare minimum hides it.

As you also mention that you reproduced the issue on the Spacemit K1 
hardware, can you please tell me if the bug appeared with similar 
symptoms?

Thanks
Aurelien

[1] https://lore.kernel.org/spacemit/apSYF5x1Tu7PlyL1@aurel32.net

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
