Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30199D6E2DD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Su4nWOnQqcjYGakNwOG3UDnhr2dFkABr7Wg+Pvi4BE=; b=UPh6iTiZ0kb3YX
	dfJVR5kxq8VgTmPDJIXLp5opXkkTLuCHP7noTCFIjZyyswGMnLcxWgI6/4aEem+3Jlyn9As7j5TJV
	9KCi4o8VRCjaOGGGcfAlOciTAVhr9qybhqrYyNFCImk1f7vl8r+hai0WuyVoOTkx9zljrH+kB1Nk/
	7fNvGiwN4qQuH4lzsYipi17tjruA7/V8CG04QTjtDUW16/lJsnxp2Qj8zDTOerDwA0se7s3UjKKAW
	GwZ9z/6iq2WlgLoeiWhBJJ+7caroBB10ovc/6fb2i3WJXu2MnVHBqLAb3y6W47AzVT65C2kdc6bE8
	USOompRVq3j23svHY2Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgQG-0000000EoJA-2gCP;
	Wed, 20 Nov 2024 08:50:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgQE-0000000EoHn-123g
	for linux-riscv@lists.infradead.org;
	Wed, 20 Nov 2024 08:50:51 +0000
Date: Wed, 20 Nov 2024 09:50:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732092647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Oe9wHru8jR91xqwNVUEM0jNj172x93463fWxP69UVU=;
	b=IBZejzyXTEybKdyqYcth8IMRNhFugumdnp9FOv6mFRVSH1+XfGomM0HOBlsB8/VZ5FanSq
	KBakqRuuJwjqMLFjzVuqFDJom//QDTQIgvzFlCP81srSGVhIwzv+qX8EQTAh6aKnzNNbfm
	NMKQkYvP3ZQaBPr/xoSXu+r3tK4FG7fEYBllTp1H94LxDZEb7J/hGu9mPh+HhL2HqczE0/
	loi3mC4WEfy5p9Wn5nl3qieXyLNYpltAAFR6THGHUtBeezXvc6/m3TYBjSV4kWT69lzDap
	Kz1tcALMSNTFFMrmIgz1Z4P2WjMmJHf3pdj1fgi0Ex1/o4+inQw44iHDr9w3WQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732092647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Oe9wHru8jR91xqwNVUEM0jNj172x93463fWxP69UVU=;
	b=3SFs9zG/TnFK0RNywoKEqmPzmDkdUJiG2BU+LsI5+xY0wE3dHr2tHuesls1xJuOHaAzI8E
	Su+TrfWHvfvQ+YBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Andreas Schwab <schwab@suse.de>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Celeste Liu <coelacanthushex@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix sleeping in invalid context in die()
Message-ID: <20241120085045.LJ5b7oh9@linutronix.de>
References: <20241118091333.1185288-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241118091333.1185288-1-namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_005050_420254_B73CAC68 
X-CRM114-Status: UNSURE (   9.05  )
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

On 2024-11-18 10:13:33 [+0100], Nam Cao wrote:
> die() can be called in exception handler, and therefore cannot sleep.
> However, die() takes spinlock_t which can sleep with PREEMPT_RT enabled.
> That causes the following warning:
> 
> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 285, name: mutex
> preempt_count: 110001, expected: 0
> RCU nest depth: 0, expected: 0
> CPU: 0 UID: 0 PID: 285 Comm: mutex Not tainted 6.12.0-rc7-00022-ge19049cf7d56-dirty #234
> Hardware name: riscv-virtio,qemu (DT)
> Call Trace:
>     dump_backtrace+0x1c/0x24
>     show_stack+0x2c/0x38
>     dump_stack_lvl+0x5a/0x72
>     dump_stack+0x14/0x1c
>     __might_resched+0x130/0x13a
>     rt_spin_lock+0x2a/0x5c
>     die+0x24/0x112
>     do_trap_insn_illegal+0xa0/0xea
>     _new_vmalloc_restore_context_a0+0xcc/0xd8
> Oops - illegal instruction [#1]
> 
> Switch to use raw_spinlock_t, which does not sleep even with PREEMPT_RT
> enabled.
> 
> Fixes: 76d2a0493a17 ("RISC-V: Init and Halt Code")
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: stable@vger.kernel.org

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

The die_lock() is probably do let one CPU die at a time. On x86 there is
support for for recursive die so if it happens, you don't spin on the
die_lock and see nothing. Not sure if this is a thing.

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
