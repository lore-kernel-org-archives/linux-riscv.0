Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF30C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 09:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rez1ZxomeuDrf6EdU3AXsGU3Exo21vbxhR89EXMkd1E=; b=v2Pj3SaeKkDx6e
	71JdB7W5UOfpzAcuMY+jDFDXM+YeX6I3Vdf7KcYxa4I3K0tl2peumH+B0plgKuntR3O1Z9Wksu/jx
	PZ4XHQHHdNUOHz6PdtlmCs77d2JVImCbpVpp4CqRxo/Odyuk/mghraz+3UTmHtLsv03cHruv3CTo+
	a0/7iVRBraeASZkaRVxHpJ38GmNPoBAgHQSBqCObnP3vesavZ/ob6j93SMMcD+VoHU0K0s3nFkvH5
	/1t1dnQ1Qb2POyQlTNcwv1c7KtbmasjJoaB3Ipjy0vF9rZJ0mHrjgBntdF9hqLHSuTSQVp8+nCCRb
	Kxt9gIfz0temgF2o2DIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOyEn-007xt5-SS; Mon, 06 Feb 2023 09:56:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOyEk-007xs6-QI
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 09:56:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD3F1113E;
	Mon,  6 Feb 2023 01:57:13 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.91.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB16D3F71E;
	Mon,  6 Feb 2023 01:56:28 -0800 (PST)
Date: Mon, 6 Feb 2023 09:56:26 +0000
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
Message-ID: <Y+DOyqehZvBJlb8N@FVFF77S0Q05N>
References: <20230112090603.1295340-1-guoren@kernel.org>
 <c68bac83-5c88-80b1-bac9-e1fd4ea8f07e@yadro.com>
 <CAJF2gTQm11px3mqyrNk1SRiJZud1yeY2avK99UX9KetWAGe5BA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQm11px3mqyrNk1SRiJZud1yeY2avK99UX9KetWAGe5BA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_015634_916781_3F47CCA1 
X-CRM114-Status: GOOD (  20.65  )
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

On Sat, Feb 04, 2023 at 02:40:52PM +0800, Guo Ren wrote:
> On Mon, Jan 16, 2023 at 11:02 PM Evgenii Shatokhin
> <e.shatokhin@yadro.com> wrote:
> >
> > Hi,
> >
> > On 12.01.2023 12:05, guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > The previous ftrace detour implementation fc76b8b8011 ("riscv: Using
> > > PATCHABLE_FUNCTION_ENTRY instead of MCOUNT") contain three problems.
> > >
> > >   - The most horrible bug is preemption panic which found by Andy [1].
> > >     Let's disable preemption for ftrace first, and Andy could continue
> > >     the ftrace preemption work.
> >
> > It seems, the patches #2-#7 of this series do not require "riscv:
> > ftrace: Fixup panic by disabling preemption" and can be used without it.
> >
> > How about moving that patch out of the series and processing it separately?
> Okay.
> 
> >
> > As it was pointed out in the discussion of that patch, some other
> > solution to non-atomic changes of the prologue might be needed anyway.
> I think you mean Mark Rutland's DYNAMIC_FTRACE_WITH_CALL_OPS. But that
> still needs to be ready. Let's disable PREEMPT for ftrace first.

FWIW, taking the patch to disable FTRACE with PREEMPT for now makes sense to
me, too.

The DYNAMIC_FTRACE_WITH_CALL_OPS patches should be in v6.3. They're currently
queued in the arm64 tree in the for-next/ftrace branch:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/ftrace
  https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/ 

... and those *should* be in v6.3.

Patches to imeplement DIRECT_CALLS atop that are in review at the moment:

  https://lore.kernel.org/linux-arm-kernel/20230201163420.1579014-1-revest@chromium.org/

... and if riscv uses the CALL_OPS approach, I believe it can do much the same
there.

If riscv wants to do a single atomic patch to each patch-site (to avoid
stop_machine()), then direct calls would always needs to bounce through the
ftrace_caller trampoline (and acquire the direct call from the ftrace_ops), but
that might not be as bad as it sounds -- from benchmarking on arm64, the bulk
of the overhead seen with direct calls is when using the list_ops or having to
do a hash lookup, and both of those are avoided with the CALL_OPS approach.
Calling directly from the patch-site is a minor optimization relative to
skipping that work.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
