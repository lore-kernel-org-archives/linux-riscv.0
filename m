Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD862C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 17:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSV2T5Q58Wbzh/UWELgpsqV1TFhL70JsLI+coP1AQmA=; b=R6kZmc9gIUf5WX
	8Ls0YbGdAvNRzVRsW1SgYJHHDYho4vpgOFLJ3Yb7n62UCYSynB7Vi5npp957kr/bXz7gObMbDsDWJ
	15w7QLr6xcLhdh98a8G7d+mlc8vqax1m97lXH9hGcMoLjPHQ/nOhzY5ioR1iB79MsyJkAOaXGO3BB
	gOJjVaZaWyPIpUk15OVNM7w/OfrJbwXW4Mi95v1km6jhmF8wZKUIpOpI0VMpGzO/cZVyHDJaNJ7+/
	1hBIGQJlOnfgIs6VYLyC1hdLxRF3WB7HDClCs5+qdxclbcP3IXkqwYCJ3Z4PFCS1tG41Rjvr/awoZ
	tC7pE1DxmcI0rZHf8XZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXlw-004Smy-Cf; Mon, 30 Jan 2023 17:16:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXl3-004SXY-Io
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 17:15:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B29516F2;
	Mon, 30 Jan 2023 03:18:01 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.13.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D51EA3F71E;
	Mon, 30 Jan 2023 03:17:16 -0800 (PST)
Date: Mon, 30 Jan 2023 11:17:13 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Guo Ren <guoren@kernel.org>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org,
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de,
	jpoimboe@kernel.org, suagrfillet@gmail.com, andy.chiu@sifive.com,
	e.shatokhin@yadro.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next V6 1/7] riscv: ftrace: Fixup panic by disabling
 preemption
Message-ID: <Y9enOQUDsMbY1Y/f@FVFF77S0Q05N>
References: <20230107133549.4192639-1-guoren@kernel.org>
 <20230107133549.4192639-2-guoren@kernel.org>
 <Y7xMvAJXjHaus0Bm@FVFF77S0Q05N>
 <CAJF2gTRzS0hBdqBUNbijvKKx3Kf_mY55XSkUyPJsfOK8p15_Mw@mail.gmail.com>
 <Y7/3hoFjS49yy52W@FVFF77S0Q05N>
 <CAJF2gTQXRt-mmuA=kKKdQojgLG-eQm6PqTuwf0ccw4cdYdbYfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQXRt-mmuA=kKKdQojgLG-eQm6PqTuwf0ccw4cdYdbYfQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_091553_695008_A1FF4D5D 
X-CRM114-Status: GOOD (  17.25  )
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

On Sat, Jan 28, 2023 at 06:00:20PM +0800, Guo Ren wrote:
> On Thu, Jan 12, 2023 at 8:05 PM Mark Rutland <mark.rutland@arm.com> wrote:

> > Ignoring things which require HW changes, you could consider doing something
> > like what I'm doing for arm64 with DYNAMIC_FTRACE_WITH_CALL_OPS:
> >
> >   https://lore.kernel.org/lkml/20230109135828.879136-1-mark.rutland@arm.com/
> The idea of DYNAMIC_FTRACE_WITH_CALL_OPS (Using data load/store +
> indirect jump instead of auipc+jalr) is similar to Andy's solution
> (See youtube link, last page of ppt).

Sure; I was present in that room and I spoke with Andy at the time.

The solutions are similar, but the important detail with
DYNAMIC_FTRACE_WITH_CALL_OPS is that the load and indirect branch is moved into
a common trampoline so that each call-site can be smaller. The ops pointer is
placed *before* the function entry point and doesn't need to be skipped with a
direct branch (which Andy's approach could also do if he aligned functions
similarly).

> But the key problem is you also expand the size of the prologue of the
> function. 64BIT is already expensive, and we can't afford more of it. I would
> change to seek a new atomic auipc+jalr ISA extension to solve this problem.

Sure, and that's nice for *new* hardware, but I'm talking about a solution
which works on *current* hardware.

> DYNAMIC_FTRACE_WITH_CALL_OPS  would speed up ftrace_(regs)_caller (Mostly for
> kernel debug), but it won't help DYNAMIC_FTRACE_WITH_DIRECT_CALLS. So I do
> not so care about the ftrace_(regs)_caller performance gain.

Actually, the plan is that it *will* help DYNAMIC_FTRACE_WITH_DIRECT_CALLS; we
just didn't make all the necessary changes in one go.

Florent Revest is looking at implementing that by placing the direct call
pointer into the ops, so the common trampoline can load that directly.

He has an older draft available at:

  https://github.com/FlorentRevest/linux/commits/indirect-direct-calls-3

... and since then, having spoken to Steven, we came up with a plan to make all
direct calls require an ops (which is the case for DIRECT_CALLS_MULTI), and
place a trampoline pointer in the ops.

That way, the common trampoline can do something like (in arm64 asm):

| 	LDR	<tmp>, [<ops>, #OPS_TRAMP_PTR]
| 	CBNZ	<tmp>, __call_tramp_directly
| 
| 	// ... regular regs trampoline logic here 
| 
| __call_tramp_directly:
| 
| 	// ... shuffle registers here
| 	
| 	BR	<tmp>

... and I believe the same should work for riscv.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
