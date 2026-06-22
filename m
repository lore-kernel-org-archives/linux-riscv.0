Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B1ACD98F2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 11:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sqqSNxg/MyhRqThfBJp5kDElPhnUT4ybcuNQUbgShQ=; b=3LDjYDwWjeusJE
	KFnlP0MZesdyOvJhOiWutJVy8KUnXDTeLnCSU+h5hvuJ+nxO+fmNIVWhpXMtvGwxed7sqhNdWFLo1
	zp8Qm89Ly20gOT0H+8ZjA/en2FixENQTzQMrvlBB/Hl7Jvr5Hgi7G5/JFq5mgpVrn1oKyhWqeaVlC
	4+3r5mBSaj7IkXFHA/mxdGc3WEzlh+gylOHi1uxs+0qpxu+/bR7DYnPzlLcHnxWuilFpavqYmsnmD
	hmgrpEFyOrxUT44x6V80K0pAKkGBoxG4n6TVnVF6kjt59Y9/rUwwPmcZvYRDJgNvFK5YC0uhsY0EC
	TwY+uOqPV9lMvnwK0L0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbctp-00000004v4N-1OeT;
	Mon, 22 Jun 2026 11:33:09 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbctn-00000004v3e-3A5I
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 11:33:08 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782127982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y2+lA1bnMd2Lh85AAiAhj4GuJ60oJplGFxvTMy/uKps=;
	b=xnyQeoQRLp/re2VnewJZjik6EXVwMV032A5Xilrc7Lq34IsMg99UNLRY6lSYJW3Nr8vSEc
	ZUJ2SzQZ7JYUha0a8eYBSG5uhMx53SKn8/UGuUN/X76+SDxiShxzKglS65oVkQvW4X+qKO
	DnLb0DVNqLwBIdW7LeSe9WkOtEHRNGREUbCF6XiPlbNtUljAmuUZTLIog/Kze07/ifpRZn
	MZ52/IBT7A+ejf+oCHHVRnkuYSY9xjzZuuGXXFyRoTBbLWZiqFzM12VMmkjDcg2B5Hyy69
	OCd0b7faTcwhBYUW6lNlpyIQ+u4lpFKm7N57gCVV9B2oc6XRYbD+j7f5uL+nAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782127982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y2+lA1bnMd2Lh85AAiAhj4GuJ60oJplGFxvTMy/uKps=;
	b=iGVQ+jWqJbghN6nKav2b7KCiX/MklCy0FxIaf3CO2danyMO/lif5Q+c2MlIehSnjXB3UJT
	XLhLj2rIuZCqJsBw==
To: Vivian Wang <wangruikang@iscas.ac.cn>, Peter Zijlstra
 <peterz@infradead.org>, Guo Ren <guoren@kernel.org>
Cc: Kees Cook <kees@kernel.org>, arnd@arndb.de, palmer@rivosinc.com,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 mark.rutland@arm.com, bjorn@kernel.org, palmer@dabbelt.com,
 bjorn@rivosinc.com, daniel.thompson@linaro.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, stable@vger.kernel.org, Guo Ren
 <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
In-Reply-To: <2f32370b-63c1-4e8a-bf71-d40874b6bebb@iscas.ac.cn>
References: <20230702025708.784106-1-guoren@kernel.org>
 <202606191652.38297DE51@keescook> <ajeKPpg2rwadVPY4@gmail.com>
 <20260622082841.GW49951@noisy.programming.kicks-ass.net>
 <2f32370b-63c1-4e8a-bf71-d40874b6bebb@iscas.ac.cn>
Date: Mon, 22 Jun 2026 13:33:01 +0200
Message-ID: <87pl1ilsia.ffs@fw13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_043307_940299_CFD04197 
X-CRM114-Status: GOOD (  12.45  )
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

On Mon, Jun 22 2026 at 18:25, Vivian Wang wrote:
> On 6/22/26 16:28, Peter Zijlstra wrote:
>> I still don't understand it. This cannot fix anything. Consider:
>>
>>  EBREAK
>>  raw_spin_lock_irq(&your_lock)
>>  EBREAK
>>
>> So now the first 'works', but the second will crash. Additionally,
>> having the EBREAK context differ so dramatically between invocations
>> seems like a very bad deal to me.
>
> To spell it out, the problem that needs fixing is:
>
> -> BUG()
>    -> ebreak instruction
>       -> Breakpoint exception
>          -> do_trap_break()
>             -> irqentry_nmi_enter()
>             [ now in_nmi() / in_interrupt() ]
>             -> report_bug() returns BUG_TRAP_TYPE_BUG
>             -> die()
>                -> make_task_dead()
>                   -> panic() because we're in_interrupt()
>
> As such, currently on riscv all BUG() simply completely panic() the
> entire machine, rather than just killing the one task.
>
> How do you think this should be fixed? Here are some ideas but I'm not
> familiar with generic entry stuff:
>
>   * Should we irqentry_nmi_exit() before calling die() for BUG()?
>   * Should we move the GENERIC_BUG trap instruction to cause illegal
>     instruction exception instead, for which we can write a simpler
>     handler that doesn't need to care about the probe stuff?

Look at how x86 handles UD exceptions.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
