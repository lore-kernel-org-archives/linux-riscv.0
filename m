Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ADAC636CD
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FV2dIvElMBioDSdhwj9sW/FaDupNL0NYtOP2/I8vwqI=; b=yz3DXMyc2W/Uen
	0zcR80W8nc6bUT6eXC4QvW2fJrR8ViKE1Zobi524+QT5fS61/cPTSi8MqFpx64FOpgwap5rHh1cuY
	6xpsaAd3la6XlMrWleC8BTWyp4KR42apCNkwm36xU+GaNFUiQMa2OY/QmyaK4v7kfevNN6WjKqQ00
	/8lbRotZreR6RwlVlNc/NVyPN2uXtZ1WyIgFrVLbeVlMiV6xhjpjENDCzAV1Bv3rDnTZ3wZlVrrqE
	+T5hrKhfUte66GpUUsxSk4i3/pD1gu6hKHSHqBkCrZTqY1Pzs9B8T7sW5liHkqmCmVDza1fxj5DCl
	ggWSFTZK6ZmGSyLKD+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPK6Q-00BQMK-Hc; Tue, 07 Feb 2023 09:17:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPK6E-00BQF9-A8
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 09:17:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71FD81063;
	Tue,  7 Feb 2023 01:17:46 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.89.229])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F5BB3F71E;
	Tue,  7 Feb 2023 01:17:01 -0800 (PST)
Date: Tue, 7 Feb 2023 09:16:55 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Guo Ren <guoren@kernel.org>
Cc: Evgenii Shatokhin <e.shatokhin@yadro.com>, suagrfillet@gmail.com,
	andy.chiu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org,
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de,
	jpoimboe@kernel.org, linux@yadro.com
Subject: Re: [PATCH -next V7 0/7] riscv: Optimize function trace
Message-ID: <Y+IXB4xQ7ACQWC9U@FVFF77S0Q05N>
References: <20230112090603.1295340-1-guoren@kernel.org>
 <c68bac83-5c88-80b1-bac9-e1fd4ea8f07e@yadro.com>
 <CAJF2gTQm11px3mqyrNk1SRiJZud1yeY2avK99UX9KetWAGe5BA@mail.gmail.com>
 <Y+DOyqehZvBJlb8N@FVFF77S0Q05N>
 <CAJF2gTQ6U1vH79Mu53eQ-GVaFx36C-hEt9Qf6=_vAkHfmgFh1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQ6U1vH79Mu53eQ-GVaFx36C-hEt9Qf6=_vAkHfmgFh1Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_011714_473700_02CD7985 
X-CRM114-Status: GOOD (  20.76  )
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

On Tue, Feb 07, 2023 at 11:57:06AM +0800, Guo Ren wrote:
> On Mon, Feb 6, 2023 at 5:56 PM Mark Rutland <mark.rutland@arm.com> wrote:
> > The DYNAMIC_FTRACE_WITH_CALL_OPS patches should be in v6.3. They're currently
> > queued in the arm64 tree in the for-next/ftrace branch:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/ftrace
> >   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/
> >
> > ... and those *should* be in v6.3.
> Glade to hear that. Great!
> 
> >
> > Patches to imeplement DIRECT_CALLS atop that are in review at the moment:
> >
> >   https://lore.kernel.org/linux-arm-kernel/20230201163420.1579014-1-revest@chromium.org/
> Good reference. Thx for sharing.
> 
> >
> > ... and if riscv uses the CALL_OPS approach, I believe it can do much the same
> > there.
> >
> > If riscv wants to do a single atomic patch to each patch-site (to avoid
> > stop_machine()), then direct calls would always needs to bounce through the
> > ftrace_caller trampoline (and acquire the direct call from the ftrace_ops), but
> > that might not be as bad as it sounds -- from benchmarking on arm64, the bulk
> > of the overhead seen with direct calls is when using the list_ops or having to
> > do a hash lookup, and both of those are avoided with the CALL_OPS approach.
> > Calling directly from the patch-site is a minor optimization relative to
> > skipping that work.
> Yes, CALL_OPS could solve the PREEMPTION & stop_machine problems. I
> would follow up.
> 
> The difference from arm64 is that RISC-V is 16bit/32bit mixed
> instruction ISA, so we must keep ftrace_caller & ftrace_regs_caller in
> 2048 aligned. Then:

Where does the 2048-bit alignment requirement come from?

Note that I'm assuming you will *always* go through a common ftrace_caller
trampoline (even for direct calls), with the trampoline responsible for
recovering the direct trampoline (or ops->func) from the ops pointer.

That would only require 64-bit alignment on 64-bit (or 32-bit alignment on
32-bit) to keep the literal naturally-aligned; the rest of the instructions
wouldn't require additional alignment.

For example, I would expect that (for 64-bit) you'd use:

  # place 2 NOPs *immediately before* the function, and 3 NOPs at the start
  -fpatchable-function-entry=5,2

  # Align the function to 8-bytes
  -falign=functions=8

... and your trampoline in each function could be initialized to:

  # Note: aligned to 8 bytes
  addr-08		// Literal (first 32-bits)	// set to ftrace_nop_ops
  addr-04		// Literal (last 32-bits)	// set to ftrace_nop_ops
  addr+00	func:	mv	t0, ra
  addr+04		auipc	t1, ftrace_caller
  addr+08		nop

... and when enabled can be set to:

  # Note: aligned to 8 bytes
  addr-08		// Literal (first 32-bits)	// patched to ops ptr
  addr-04		// Literal (last 32-bits)	// patched to ops ptr
  addr+00	func:	mv	t0, ra
  addr+04		auipc	t1, ftrace_caller
  addr+08		jalr	ftrace_caller(t1)

Note: this *only* requires patching the literal and NOP<->JALR; the MV and
AUIPC aren't harmful and can always be there. This way, you won't need to use
stop_machine().

With that, the ftrace_caller trampoline can recover the `ops` pointer at a
negative offset from `ra`, and can recover the instrumented function's return
address in `t0`. Using the `ops` pointer, it can figure out whether to branch
to a direct trampoline or whether to save/restore the regs around invoking
ops->func.

For 32-bit it would be exactly the same, except you'd only need a single nop
before the function, and the offset would be -0x10.

That's what arm64 does; the only difference is that riscv would *always* need
to go via the trampoline in order to make direct calls.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
