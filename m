Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76062C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRvHyGeqgOBC5TS6zCCpFH6POqIlAYY72CxNCt5nSoo=; b=GJM4C9rl/yhf3t
	T0aMp2jejtOUQcmf9Yp4IuRCQnaCAEhTle7nAfQvyjU70PKHs6STYHER2Ns1MhNM2eLY6O3EIYTFN
	AmZHx3734JZ1P07p7F9Uwn+UeXgh/pztnxCV8dMvqU5QcCCfPlpQ9us9g2A7s6xL0Ha1kZwjgA02v
	HiX0b7pj6OEDSs7LID2hoxO+dHBz+w6k6L/DhpnKmO2M49nT8Rw3xsifFQaQ6uuq41Fr/GoVGF49a
	jRHLP4ai87XrvHx8KzpBTF7aDrDIBqbVsTzANFstSsKS48aM0eK732g/2A3Om0KNWrgHLWtwjGKgT
	CJfEafGRcF+yYGr/Ia7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYVQ-004ofo-LO; Mon, 30 Jan 2023 18:03:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYSc-004nYK-7P
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:00:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70FD316A3;
	Mon, 30 Jan 2023 02:55:27 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.13.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E89D93F71E;
	Mon, 30 Jan 2023 02:54:42 -0800 (PST)
Date: Mon, 30 Jan 2023 10:54:40 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Guo Ren <guoren@kernel.org>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org,
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de,
	jpoimboe@kernel.org, suagrfillet@gmail.com, andy.chiu@sifive.com,
	e.shatokhin@yadro.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next V7 1/7] riscv: ftrace: Fixup panic by disabling
 preemption
Message-ID: <Y9eh8DpjrmcLIQb5@FVFF77S0Q05N>
References: <20230112090603.1295340-1-guoren@kernel.org>
 <20230112090603.1295340-2-guoren@kernel.org>
 <Y7/6AtX5X0+5qF6Y@FVFF77S0Q05N>
 <CAJF2gTTqW5A8qS5CQEr=kakxKw5FaFRDswet6CnBGUDasNJnbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTqW5A8qS5CQEr=kakxKw5FaFRDswet6CnBGUDasNJnbQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_100054_394632_B5FBBD3B 
X-CRM114-Status: GOOD (  30.60  )
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

On Sat, Jan 28, 2023 at 05:37:46PM +0800, Guo Ren wrote:
> On Thu, Jan 12, 2023 at 8:16 PM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > Hi Guo,
> >
> > On Thu, Jan 12, 2023 at 04:05:57AM -0500, guoren@kernel.org wrote:
> > > From: Andy Chiu <andy.chiu@sifive.com>
> > >
> > > In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
> > > forming a jump that jumps to an address over 4K. This may cause errors
> > > if we want to enable kernel preemption and remove dependency from
> > > patching code with stop_machine(). For example, if a task was switched
> > > out on auipc. And, if we changed the ftrace function before it was
> > > switched back, then it would jump to an address that has updated 11:0
> > > bits mixing with previous XLEN:12 part.
> > >
> > > p: patched area performed by dynamic ftrace
> > > ftrace_prologue:
> > > p|      REG_S   ra, -SZREG(sp)
> > > p|      auipc   ra, 0x? ------------> preempted
> > >                                       ...
> > >                               change ftrace function
> > >                                       ...
> > > p|      jalr    -?(ra) <------------- switched back
> > > p|      REG_L   ra, -SZREG(sp)
> > > func:
> > >       xxx
> > >       ret
> >
> > As mentioned on the last posting, I don't think this is sufficient to fix the
> > issue. I've replied with more detail there:
> >
> >   https://lore.kernel.org/lkml/Y7%2F3hoFjS49yy52W@FVFF77S0Q05N/
> >
> > Even in a non-preemptible SMP kernel, if one CPU can be in the middle of
> > executing the ftrace_prologue while another CPU is patching the
> > ftrace_prologue, you have the exact same issue.
> >
> > For example, if CPU X is in the prologue fetches the old AUIPC and the new
> > JALR (because it races with CPU Y modifying those), CPU X will branch to the
> > wrong address. The race window is much smaller in the absence of preemption,
> > but it's still there (and will be exacerbated in virtual machines since the
> > hypervisor can preempt a vCPU at any time).
> >
> > Note that the above is even assuming that instruction fetches are atomic, which
> > I'm not sure is the case; for example arm64 has special CMODX / "Concurrent
> > MODification and eXecutuion of instructions" rules which mean only certain
> > instructions can be patched atomically.
> >
> > Either I'm missing something that provides mutual exclusion between the
> > patching and execution of the ftrace_prologue, or this patch is not sufficient.
> This patch is sufficient because riscv isn't the same as arm64. It
> uses default arch_ftrace_update_code, which uses stop_machine.
> See kernel/trace/ftrace.c:
> void __weak arch_ftrace_update_code(int command)
> {
>         ftrace_run_stop_machine(command);
> }

Ah; sorry, I had misunderstood here, since the commit message spoke in terms of
removing that.

As long as stop_machine() is used I agree this is safe; sorry for the noise.

> ps:
>  Yes, it's not good, and it's expensive.

We can't have everything! :)

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
