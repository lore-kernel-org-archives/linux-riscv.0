Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DEE606A325
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 02:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mModSq+E;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PZZLU+cT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GSA3v2cgNtV/NTufhJawpLdtkklPBlpC12um9IUI3Mw=; b=mModSq+EtGDvJrFkzQY8LQbMpW
	a/ws6oAJcozLCy2L5PdMAnKgs5z0eqgtL7jgfg2A0ciJSqRSFCoxpRTRdD2vXNaE8vRB8OXQZEP7b
	lqL3PitCXvNwUL/ZbCQMy2VlcxvSUUHYe48L1gWrMN+VOOOIethrMFJTykkiO4roEsNMQxdSeBXQU
	naOnw6vU/3Ai+aiR3hgcbKIk9R7JK2ZJqXZ5ZAQ4w3LUygVE13NjhkNhkhqUB3Oe5e5teBwD3mrZN
	aGz2CIa1dCkf1xmhJWj9C8dz5uQVvHWdv2zNnffyvETvuUdxe6N8BmDdYOjWpBZZAafyCjJB6PBNf
	OQpnrXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbKr-000000028Ql-22zt;
	Tue, 10 Nov 2026 02:11:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbKq-000000028Q3-0uMJ
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 02:11:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA1BF458F4;
	Tue, 10 Nov 2026 02:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B971F008BD;
	Tue, 10 Nov 2026 02:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794276703;
	bh=7gGEU+F3OmTlWiYgAwa+KiEfjG9IR1QIEw8Ynm1GPns=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=PZZLU+cTxpjBQtlmyAy07GHEgXXaEoWOlVeUHazcItIUO8c/6eVpkHV3PEdd4Iecd
	 J0tYE+4cXQ/fOszmanmCgLX4D8DRp7x8RS00xHRsJOQe6ZsrVXTFOSLCwOLrR8bMpa
	 N1eeN9gaFhKXNyXOjsf9cIjkXNC5I/bY+JEDvup1RBYOVVcG+tLSErS7O9PLgfoxv8
	 5fXsDmJ/MBjYR5EmrmK64zuRN2VT6CSEoDqEQ29bYchRNIwpQcyw/kev03/NpOjw3Z
	 +kqsdvelenVZY+Q32vYR90ehYIiuKcu5Hl6V/CBiCW+dbYVaHarVSGTesVe5blewHQ
	 JE5ug/RLtB1iA==
Date: Mon, 9 Nov 2026 19:11:39 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Guobin Zhang <guobin.zhang@intel.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Andy Chiu <tchiu@tenstorrent.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: signal: protect regs->status RMW from concurrent
 preemption
In-Reply-To: <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>
Message-ID: <b9ec7243-d30c-34bf-057e-b422f9eeb205@kernel.org>
References: <20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026, Guobin Zhang wrote:

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

Thanks, queued for v7.4-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
