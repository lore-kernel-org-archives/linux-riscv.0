Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5E8CEDD89
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRSbd+MzN9DzPWrC+kWlt06yfnQPjj8fxqI70wekXr0=; b=FXY+5QV379/yLl
	FTPvdP95eN+TY5uu0AxQ3QHhjRgBHV1cXzNGNf1ySd3v+d1YXRJIcv3goVI2FJDsZkXpnplL5LdAV
	f2jpfm4d+F++B5QSLprHCSGiK3cM6k+O4F8HKuSwpjUJogfLlgVpkdAIqfPSZ+Jct9IGD5bNahr9p
	GiDCRTwJMMHHMUQvR/SRsV1Ob4mFnb5LQPXuHFqZGK1S+411cXgJ6Nz7kz14sx3RnYI0Nvvl3g7g/
	HodtYjadc2gl226s8Q1165/zhneuu3iXKysoJsXixgFE66i4aCTpk+EpwxqHlAWqro3LMzXRu89UN
	sjkBe7JewgIUn6WhhB7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syWQ8-00000009LWF-1K2v;
	Wed, 09 Oct 2024 13:08:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWNi-00000009L0Y-1osQ
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 13:05:39 +0000
Date: Wed, 9 Oct 2024 15:05:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728479132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T7am4Xq3FF1ZP/UXdXnJGWmSInOHqTwnSQ0K6Ad/CZs=;
	b=pI0/eF6il+U8UScFEt49X+x94i9ahFGbOjQ03wX7Rd0PRXANnFosxu82PKP67YxQ2UNLSG
	JvGOuDieY+LFRCPGgzkURb39QVLYtLI2HWa6RUQbFUghWokVwpatFzbP/fE1ySIUaVpugF
	qiQMw+K8JAAycmtT5U3cDFceLQhSMltL7cZi1UcoWdwaRm6mvMhJBVYqob/vXaMnSomk2M
	D47ij+Ldv27aQaEPMj2n1fQr+amm7v8lffDDTvLUPGvpkiArOGRHwhbN0KZQo4QtLP2gJk
	4zDIK9QphIVIbMeROEgBoA1d5N283coHPvW3ZCp6EaxliTHoniBQyDdELTU0fQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728479132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T7am4Xq3FF1ZP/UXdXnJGWmSInOHqTwnSQ0K6Ad/CZs=;
	b=ItCAJJN3bJ2dRUIbLldK7UFjwgnjSPCOB0fG1tyE1+WeJ/X1Q9ebKi3ikph8AKo0D3sa6T
	rWQi3vDMrr944mCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, ankur.a.arora@oracle.com, efault@gmx.de,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] riscv: add PREEMPT_LAZY support
Message-ID: <20241009130530.2Sv2p0Eo@linutronix.de>
References: <20241009105709.887510-1-bigeasy@linutronix.de>
 <20241009105709.887510-4-bigeasy@linutronix.de>
 <20241009130307.GN17263@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241009130307.GN17263@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_060534_658290_873B9F14 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

On 2024-10-09 15:03:07 [+0200], Peter Zijlstra wrote:
> > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> > index 9c10fb180f438..8b5a5ddea4293 100644
> > --- a/arch/riscv/include/asm/thread_info.h
> > +++ b/arch/riscv/include/asm/thread_info.h
> > @@ -107,6 +107,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
> >   * - pending work-to-be-done flags are in lowest half-word
> >   * - other flags in upper half-word(s)
> >   */
> > +#define TIF_NEED_RESCHED_LAZY	0       /* Lazy rescheduling needed */
> >  #define TIF_NOTIFY_RESUME	1	/* callback before returning to user */
> >  #define TIF_SIGPENDING		2	/* signal pending */
> >  #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
> 
> So for x86 I shuffled the flags around to have the two NEED_RESCHED ones
> side-by-side. Not strictly required ofcourse, but...

I can shuffle them. I don't think the riscv camp will complain (saying
this for them to actual complain if so).

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
