Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07421FCE07C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPC+SGRU6zzVPrhhvlNN9YWWBxO2vZSTqEa44yS6bO4=; b=xeSnxUrlyKFNMr
	Kzr5ezcZDAPR7jVtUG92UreLnZFisNQFqK8wKbAOi5VPYd21fU0xnySP1FsmL2iAGyUOpR3UGdTaz
	ZEbgUQB5WUJIjV9evUJNncPZW2y0m8J2lQSBWRuuI7rcF9vTnFBqHE0rbC1Bw19nMrpTJdG95kusN
	IY1jNJXPahNtkU/i5DgwXNjbTaL9RSHtLwO3mJ7JyKsu5VeinCndY3fzoAxRdwNT5zCkvCoPdX5TU
	1MtwSkt9jQORlLiRorwUAAOFV+1PkpG9fDNK3vsQzAwv9nClQbMAvxk0J8bZWl3QAEd588d5vn53J
	5ZHaZ3G3/YfRIvwy70Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbLM-00000006DaD-0Bxn;
	Thu, 26 Feb 2026 13:23:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbLK-00000006Da5-3nZI
	for linux-riscv@bombadil.infradead.org;
	Thu, 26 Feb 2026 13:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i2vPnTOsLMU5Qa9GYDYYtRH0azuc/q1gEYWuAZdWaDU=; b=Y5vwKzVhCLbBxLqiCsXJ/0jL6+
	0ZDAi8m7boE48xT0Toj8otIFjpXlvlNPwdXlxxqGvJGl8vKbksxWQhA8u84xRRm3GRq7X1buiUR32
	7COui8aDmjUKbqH2MbWvBj6nHWo5GDKTltn52gHNDicXbNX1u4mVAuiMIEsJWlrw5+hZMZz3O1hNO
	ggh4U0Z6Ob0lgxOPGup8LNvQpTneHl4sHqbZeuvEcQl4r33DF7yM20gTxSA06Uf9lSF08kYWCiAUb
	sdhGMZ1KFveCBWRtDPWuMQv/5GWMDePhWy7ijsuP/4L9bh6B1RqkrEwsr4XyJYkXx+buHK7RCviuR
	y0w70gZA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbLI-0000000B21B-3wcq;
	Thu, 26 Feb 2026 13:23:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B35BF300462; Thu, 26 Feb 2026 14:23:42 +0100 (CET)
Date: Thu, 26 Feb 2026 14:23:42 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"Yu, Yu-cheng" <yu-cheng.yu@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"zong.li@sifive.com" <zong.li@sifive.com>
Subject: Re: [GIT PULL] RISC-V updates for v7.0
Message-ID: <20260226132342.GC606826@noisy.programming.kicks-ass.net>
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
 <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
 <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
 <b2aae256-7d3c-447d-aa8b-5904848cff6a@sirena.org.uk>
 <CAHk-=whfQXKr3Sgoc7R1tPWFD3A1gEhUh=j7GGwz8yg_EQVhNA@mail.gmail.com>
 <aZYZsBlH_tVxnZIf@debug.ba.rivosinc.com>
 <196537b2933567d1781901f813a72ffffedd10fd.camel@intel.com>
 <aZZuGYQUy11Gse7x@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZZuGYQUy11Gse7x@debug.ba.rivosinc.com>
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

On Wed, Feb 18, 2026 at 05:57:45PM -0800, Deepak Gupta wrote:

> x86 doesn't have any equivalent BTI bit in PTEs to mark code pages. IIRC, it
> does have mechanism where a bitmap has to be prepared and each entry in bitmap
> encodes whether a page is legacy code page (without `endbr64`) or a modern code
> page (with `endbr64`). And CPU will consult this bitmap to suppress the fault.

So; all of this is only ever relevant for programs that are mixing CFI
and !CFI code. If a program has no CFI, all good. If a program is all
CFI enabled, also all good.

If it starts mixing things, then you get to be 'creative'.

Now the thing is, if you start to do that you need to deal with both
forward CFI (BTI) and backward CFI (shadow-stack) #CF exceptions. That
bitmap, that can only deal with BTI, but doesn't help with shadow
stack, so its useless.

My proposal was to ignore that whole bitmap; that's dead hardware, never
used. Instead use a software PTE bit, like ARM has, and simply eat the
#CF look at PTE and figure out what to do.

Yes, this is 'slow', but my claim is that this doesn't matter. There are
2 ways out of this slow-ness:

 - fully disable CFI for your program (probably not the thing you want,
   but a quick fix, and not really less secure than partial CFI anyway).

 - fully enable CFI for your program (might be a bit of work).

The whole mixed thing is a transition state where userspace doesn't have
its ducks in a row. It will go away.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
