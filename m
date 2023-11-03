Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F694C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 17:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzvoSJPTut7790yOiUGoN1hdN7KGJjI4Q4dtO5noi+U=; b=iumSQmlSCwYCPt
	WCv44rneufjKJyF5z1VdH6pyMYTNjVhhvzBLrYeUtqVfjDbpWGPVkNhYFKaVaPnSDb3FVcdhzRapq
	hFoWL798wJMHK40gl7HcYh/QPwbA3i41TJYdwdkoZkhj+yppNZz/vQeSRMpEooVuk5DdV5SRCsNPI
	GEHD4SFKtoZnQvfq7Ey/fwHOM5kFP3jcyebDJnbS9IDQZAOmwav+7F08AfOdWyjQ9hbHQs6/1kd8A
	Owm1Xv0yo6zeKpo5w+BuFLEnUKzWmg7/6q0vsh81jVFPHKjkB+kIcsszj96X+yCD3CREo4zREABJR
	YruaM3BPoMzrh+glrJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyy9L-00BtbH-38;
	Fri, 03 Nov 2023 17:40:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyy9E-00BtYi-35
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 17:40:02 +0000
Date: Fri, 3 Nov 2023 18:39:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1699033178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qpancX/28gXCzGHrLuqI+OuTt8bn2ik71FxH4aU2W0U=;
	b=TTtu7V9iiQg+l6FzI9McvuSQaYPMEV7sj9Gm2BuUMFJ4PA5njz5NRqizxRyfzKns1XEbqz
	/pegDwxbLwxQNZ1gtAfgIqOLAWz1plv+B2bPMrs7jS/dNE+ObRd1VVqN3dohyXNpt5XXXr
	e5NGceR0cPcAUE3OUa5/koWIbHD+k7qek02jm/JGWCw0oUKnYWNYXVDP0O7U9DQPvj6lbl
	TWVHC/4Ltg28Q+eHeVLl9QfqzaMTI6DpKBD8QEVpqbf+F76NLvePvBXz4BSj4kcYWLfTFf
	b1Br+U5lb1LOB34UuzUx+HPvzMBDg20Xaa2vvMxFS7GBLBrWQdJqYQ5NzC+BBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1699033178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qpancX/28gXCzGHrLuqI+OuTt8bn2ik71FxH4aU2W0U=;
	b=bt/ISU8UAo4AzRzKoPPy72WBnMKxI4E4RSHBpqqzzSREGdFwD8Z6epjmw7RWtOiWMUXiKX
	0s+vRRnaKRfY2oDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <20231103173936.OHevJ107@linutronix.de>
References: <20231031143521.441-1-jszhang@kernel.org>
 <20231031153242.k9tLdSby@linutronix.de>
 <ZUEiCUxcd11inlRP@xhacker>
 <20231031164411.9YRGasL-@linutronix.de>
 <ZUI5h6eIhTlPAmGh@xhacker>
 <20231102-spearman-overcrowd-a86bfb958609@wendy>
 <20231102155423.SyuAibSe@linutronix.de>
 <20231103-army-gloater-af710df04628@spud>
 <20231103082411.f_ZU1E7V@linutronix.de>
 <CALs-HstDSr6arKw+b-HWbEQAgQCNbicJv4H-UKAooa8VxcpnMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HstDSr6arKw+b-HWbEQAgQCNbicJv4H-UKAooa8VxcpnMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_103957_156514_25ABC9F8 
X-CRM114-Status: GOOD (  17.97  )
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

On 2023-11-03 10:19:49 [-0700], Evan Green wrote:
> Hi Sebastien,

Hi Evan,

> Could you elaborate a little on the rule violation here? The
> documentation for GFP_NOWAIT says:
> 
> > If the allocation is performed from an atomic context, e.g interrupt
> > handler, use ``GFP_NOWAIT``.
> 
> which seems like it basically fits my situation. If I do a search for
> GFP_NOWAIT to hunt for instances of allocating with interrupts
> disabled, I see at least the following examples (more available upon
> request):

We talk here about PREEMPT_RT. The early-CPU up or a SMP-function calls
happens in hardirq context with disabled interrupts. Always.
The sequence
	spin_lock_irq();
	kmalloc(, GFP_ATOMIC);

is fine because on PREEMPT_RT spin_lock_irq() does not really disable
interrupts and the spin_lock_t becomes a sleeping lock. See
	https://docs.kernel.org/locking/locktypes.html

The problem is that sleeping locks must be acquired in a context where
sleeping is not possible. And kmalloc() may need to acquire sleeping
locks. Therefore no memory allocations in IRQ-off sections.

> Finding the documentation that states this is illegal might help me
> understand what I should be doing instead. For example, I'm fuzzy on
> something that's disallowed when interrupts are disabled but ok in
> smp_callin().

smp_callin() is the SMP functions call so it is not okay. Having a
kworker would okay for instance. This however requires a fully setup
scheduler. Having the memory allocated upfront and passing to every CPU
would work fine, too.

> One option is to do all the allocations in
> check_unaligned_access_all_cpus(), and pass them in, but until I can
> find the rules it's hard to verify that's a correct fix. It's also a
> little clunky, and wouldn't apply to the hotplug path, so I want to
> make sure it's necessary and sufficient before embarking on that
> journey.

I don't know what it does and how often it needs to be done. The
question is would it be okay to do once on system boot or does it need
to be done each time the CPU goes up? Is it required to be the first
thing it does or can it be delayed to slightly later point in time?

> -Evan

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
