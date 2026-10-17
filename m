Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B5DCC6B2A
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 07:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mPmyF2J4yopKvdWk9kHFoM9wpBgebxsL/2lubx99v8=; b=cL9+cgqyGLupWu
	1SCMMP6+cs1So1aLK0jw/Alwg/wSBp3Aty6ALKBUrh+5tApaCnc/ZI/+hq9MOu4Uq8R++nwVU8RKv
	rdqW1jjP9vDmH/55WKtfGgFSe7h4gmh101D8ydxooza5cark0AsRZaTyvChdQKm9ddaFPmq9pY8Km
	MdEPEqMm/j5r8FwBo2lG0lGbZy3WrZGLnb0mRtuCglSx0iNwUN+St9S4XMecu4zARrC9HSzfg5Nnh
	58k49C9gjEvuI6aYPRRtlRy3C7m4qrPFC7geU7GHFlzp2VeqH4Y4vljPTSFVGxnLhes/xGkDIm5rj
	alTE99rNB/IaKFJWdW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyzg-00000004X1U-1Dl0;
	Sat, 17 Oct 2026 07:38:16 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHyza-00000004X0l-2hgr
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 07:38:11 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-87ab6e5f91eso4611807b3.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 00:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792222689; x=1792827489; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCasw6zfd8tSyzVlQk06yRX68bH/qhEnUNxA1ny8p2U=;
        b=HW45zuWfpZ9Q9oPg2JEYmlTbp0ymUb8MTHVCfLACHdpph6SAWh4WL9wWGQ4t2eZfnq
         wj5eJcaVxt+gGHNd2PYcvsJwGyQkiaSpSFAArnmam9gg9j8CJLcq9BAOXiBX9E49SNxf
         OC/ZPC3/Xk6ZfTP9E52hAMo+46nk+aCFJCWawgu0WOLiN2DlwCeqXPDic/tZRG7oPTI1
         Ul3Y8limaeNy2YW6f2WwELTn6BWSuE2QHXfCmNWFxB/GRgM57bGLFSSynAC3hcpPFa9y
         A40/icIVosKC2VoUT64hTgJ9JYo6wA91T3G9G5CRswsbK8zC2dMJ0wcfCEKHiOzB2Mcy
         xcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792222689; x=1792827489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCasw6zfd8tSyzVlQk06yRX68bH/qhEnUNxA1ny8p2U=;
        b=vXem3PxR33zIyjn6hLA3OnPs93wgAp49Af0Ah5OYFsk2b5hULpTGu9VrKyXvAcoiTk
         nR4jrBJF1IFyCo16HpDVU1yrbH4uNydvaFBZCUseZXJBcWRdiNslOxsRXM4M/g9g7KBh
         8mK13UXjeqBXKvB6vQFFXq4DNWJYBOagz4wH4Sv10HhVCKf2PuxPZTrD9zzp/QyOMPpm
         cji/+HsAx/iSDLGr421U+AK+ZGFxh+ELJQlANVj+LlNP76NBXH2BDQCbxM9yq7A7PUxm
         Gb49HPb9V2mxFrPVlfINd1BlaYr1he/4EFs+HHxHzr+jRSP4V2sP37yZrqv0cu9dP5g1
         5oYg==
X-Forwarded-Encrypted: i=1; AKwUvBwWlnZhDvVkWxVEPcRAYYCUdTg0fsvH/8Jlk2rCBbXAcmdFUoOnLPzCZWGYbXQ3k3VrsJ26PVchwK06bA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJzvdtGKbrJ+Bne9Yl93eS5cqUzGvvDSvQufe9TCQ49fEZXciKo
	9qpz/cVT+OF4SaMbwyPI9UZqQ0ZQDP3nMHT05fe4BkNBOEGXpNrLheQ9hanVDe/J5NE=
X-Gm-Gg: AYBFou00Y0ZW+jxNkyYUVHxMPu1WOuWpl3FnQkJ+Lg3mgGk1rH0HdCjpU9WJBDuCaHS
	AsdpIB/c3Qcuu4RoBbADFjuUBWFIzJD3dwZsUmmAKolfHPXIU6Q+AD7OZ4WNh5kqlXdRi2ovNYx
	MoISNV+ht87UdnzgWoXxg0eLnSnRAUsiVW+p8aKOpWoKOwuU53pL+FDJUDpC8VAf0204RMzdoKM
	lUzV0sD3SbKqRU2PK79UfoniJPYRR38wq+Mxl36Cm8/L+Fbw98R+FBBZTq5dnGf/itG3V1W/XWD
	xnebzVgPmSWPbNtjYsVxDeBvGkZJjluSJgYqwiSqx4mya/PfSY/t+L2KZPam0RnWF6ZIDNRn0KT
	HThIrcLwy2Iy9qydb+AKq4rihkauGYnyVRnfjtY82HgH+z35OqQk1Swhi8rN2Wowp4fLBAV5H5h
	I+3AnPxGq+yb5wqt78W3KEtnuuTDK76Gjzu9q713tBG0pWZA3d9oe2bEf9WzMsPFj6uRIn4uuJM
	PaKPzLfJK2BvHkHVYCG
X-Received: by 2002:a05:690c:6507:b0:8b0:cd30:ce8f with SMTP id 00721157ae682-8b0f21b9faemr8264127b3.49.1792222688984;
        Sat, 17 Oct 2026 00:38:08 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e5889c2esm18352487b3.15.2026.10.17.00.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:38:08 -0700 (PDT)
Date: Sat, 17 Oct 2026 02:38:07 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Guobin Zhang <guobin.zhang@intel.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:  riscv: signal: protect regs->status RMW from concurrent
 preemption
Message-ID: <atMl3yQ0seD_N0g4@Tao-Chiu's-Mac>
References: <20260807-vector_fpu_regs_status_rmw_fix-v1-1-0c16848b60db@intel.com>
 <arX5rpNRRk8r2Nve@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arX5rpNRRk8r2Nve@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_003810_702583_2D45089A 
X-CRM114-Status: GOOD (  34.39  )
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

Hi Aurelien,

On Fri, Sep 25, 2026 at 06:33:50AM +0200, Aurelien Jarno wrote:
> Hi Guobin,
> 
> On 2026-08-07 11:00, Guobin Zhang wrote:
> > __fstate_clean() performs a non-atomic read-modify-write (RMW) on
> > task_pt_regs(current)->status to clear the FS bits. This RMW is
> > unprotected - it runs with preemption enabled and IRQs on during
> > signal delivery (setup_rt_frame -> fstate_save) and sigreturn
> > (restore_fp_state -> fstate_restore).
> > 
> > If a reschedule IPI or timer interrupt triggers preemption between
> > the load and store of this RMW, __switch_to_vector() calls
> > riscv_v_vstate_set_restore() which modifies the VS bits of the
> > same regs->status. When the preempted task resumes, it stores back
> > the stale value captured before preemption, overwriting the VS
> > update and restoring VS=DIRTY while TIF_RISCV_V_DEFER_RESTORE
> > remains set - a combination that should never occur and leads to
> > vector state corruption.
> > 
> > The race window:
> > 
> >   __fstate_clean (signal path)      set_restore (schedule path)
> >   -----------------------------     -----------------------------
> >   ld  a0, regs->status  // VS=DIRTY, FS=DIRTY
> >                                      <- preempted (reschedule IPI)
> >                                      regs->status VS = INITIAL
> >                                      set TIF_RISCV_V_DEFER_RESTORE
> >                                      <- resumed
> >   andi a0, ~FS
> >   ori  a0, FS_CLEAN     // stale a0 still has VS=DIRTY
> >   sd   a0, regs->status // overwrites VS=INITIAL with VS=DIRTY
> >   -> result: VS=DIRTY + DEFER -> ANOMALY
> > 
> > Fix by adding preempt_disable/enable around the RMW in
> > __fstate_clean() and fstate_off(). riscv_v_vstate_set_restore()
> > has the identical hazard: it is called from __restore_v_state()
> > (sigreturn path) with preemption enabled, and it can race the same
> > way against the scheduler's own call to riscv_v_vstate_set_restore()
> > for the same task in __switch_to_vector(). Wrap that call site with
> > preempt_disable/enable as well.
> > 
> > Add WARN_ON_ONCE(preemptible()) to riscv_v_vstate_restore()
> > to catch any future unprotected callers at development time.
> > 
> > Signed-off-by: Guobin Zhang <guobin.zhang@intel.com>
> > ---
> > Race: regs->status is shared between the FPU (SR_FS) and vector
> > (SR_VS) state machines. Three call sites do a non-atomic RMW on it
> > while preemptible: __fstate_clean()/fstate_off() in switch_to.h, and
> > riscv_v_vstate_set_restore() as called from signal.c's
> > __restore_v_state() (sigreturn path).
> > 
> > Cause: if the task is preempted between the load and the store, the
> > scheduler's own switch_to() writes the other half of the same
> > register word when switching this task back in. The task then
> > resumes and stores its stale value, clobbering that write.
> > 
> > Fix: wrap each RMW with preempt_disable()/preempt_enable(). This is
> > sufficient because the conflicting writer only runs via an actual
> > context switch of this task, which preempt_disable() prevents.
> > local_irq_disable() is not needed: no IRQ handler touches
> > regs->status, so masking IRQs would add latency without closing any
> > extra race.
> > 
> > Reproduced on Spacemit K1 hardware; not reproducible under QEMU/TCG
> > (see commit message for the full race-window trace).
> > ---
> >  arch/riscv/include/asm/switch_to.h | 4 ++++
> >  arch/riscv/include/asm/vector.h    | 2 ++
> >  arch/riscv/kernel/signal.c         | 2 ++
> >  3 files changed, 8 insertions(+)
> 
> Han Gao pointed me to this patch as a possible fix to the issue I 
> encountered on the SpacemiT K1 [1]. So far, my first tests show
> that it either fixes the issue or at the bare minimum hides it.
> 
> As you also mention that you reproduced the issue on the Spacemit K1 
> hardware, can you please tell me if the bug appeared with similar 
> symptoms?
> 

I have a reproducer on this bug and can reliablely catch it on K3. The
code runs in a loop that does the following things:

1. dirtify FS by executing a fp instruction
2. configure vstate as e8 m1
3. load bytes into v5
4. trigger a signal handler by executing ebreak
5. vector save using the loaded v5

The signal handler verifies if it comes from the ebreak, otherwise it is
the vstate corruption. Run multiple threads per core to increase the
context switch rate.

This should hit the problem pretty soon, as corrupting lmul to m8 would
cause the vector save from v5 trap immediately. With the fix the problem
no longer occurs.

Cheers,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
