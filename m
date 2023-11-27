Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8904C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HADopFVnMjU+d4Rs8S31WOcI3tQsjxJsUSnD9ZVf69E=; b=PVwQn0PqB/TrfA
	KqNj2Nrznu8GCX6GzFEjtMYNnDnZ4YmAdfHDm9THLBDeA3c0BzrKyBZf4g0rsxTMNbaBzBFJ0JafJ
	88a8kaJFwzXct4adFpbMFWSN9edsGwXnrsbpvrgRFX6OkSV+HPAMvnGpC0JrhV5yy6IGHsaFhK7rk
	pc3qNmc5PM7aVbXWmuS6SWV+0E53avVeKUXFegYL5EYxdOkrHxZ1it8lJye9it8UA/JQQjBIYBAlB
	kNl27vmAEBff8vKecEbPNzCF0l0AxBcwzLu9bWYyh62qVa52lrqvWjLRSwJqo/7nKUguGui1bdTfc
	TUrEWZ+tT9BwSPcNntFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Zbl-002BW2-2l;
	Mon, 27 Nov 2023 11:16:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Zbk-002BVp-1I
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 Nov 2023 11:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cAMYRwVtTk4t4CFVybTFSaosFfl7UAZUdZLXZwoFExo=; b=ATqUzkBAXvyJcu5VDkL3MVJVfz
	M/w2F2dpijW6LxyJLlqXBnQ0lCixTGvRKNlSoSiX09wPSklZT/HtWrEsqMUIdkq93s+4dAO9uWxTV
	zMJVEfgI4+fLLB/BspixOggT0/648mr9X8rGlX6pT0ysMRuueX9ZH2SJCHA6yABLLJ3WdeVUQ9nkx
	7hkUh0jav76aCSftSKzOTTuPr4TusyFps7ll+zKj+RPzbY6WUbwHRxY8UE9/5HR6OBjEBqv0sRGhO
	1hHs7A0mYGz4bDCYmyPGoVMW2Gwqq/97kzONjxkB6w/6NX7lo3vhxYcv3rFdjOgVRN8vrcTve873R
	d3HFyzHg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ZbZ-00G258-25;
	Mon, 27 Nov 2023 11:16:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 17B3A3002F1; Mon, 27 Nov 2023 12:16:44 +0100 (CET)
Date: Mon, 27 Nov 2023 12:16:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>, Daniel Lustig <dlustig@nvidia.com>
Subject: Re: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
Message-ID: <20231127111643.GV3818@noisy.programming.kicks-ass.net>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
 <20231124101519.GP3818@noisy.programming.kicks-ass.net>
 <ZWFhSYalMCgTo+SG@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZWFhSYalMCgTo+SG@gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 24, 2023 at 09:51:53PM -0500, Guo Ren wrote:
> On Fri, Nov 24, 2023 at 11:15:19AM +0100, Peter Zijlstra wrote:
> > On Fri, Nov 24, 2023 at 08:21:37AM +0100, Christoph Muellner wrote:
> > > From: Christoph M=FCllner <christoph.muellner@vrull.eu>
> > > =

> > > The upcoming RISC-V Ssdtso specification introduces a bit in the senv=
cfg
> > > CSR to switch the memory consistency model at run-time from RVWMO to =
TSO
> > > (and back). The active consistency model can therefore be switched on=
 a
> > > per-hart base and managed by the kernel on a per-process/thread base.
> > =

> > You guys, computers are hartless, nobody told ya?
> > =

> > > This patch implements basic Ssdtso support and adds a prctl API on top
> > > so that user-space processes can switch to a stronger memory consiste=
ncy
> > > model (than the kernel was written for) at run-time.
> > > =

> > > I am not sure if other architectures support switching the memory
> > > consistency model at run-time, but designing the prctl API in an
> > > arch-independent way allows reusing it in the future.
> > =

> > IIRC some Sparc chips could do this, but I don't think anybody ever
> > exposed this to userspace (or used it much).
> > =

> > IA64 had planned to do this, except they messed it up and did it the
> > wrong way around (strong first and then relax it later), which lead to
> > the discovery that all existing software broke (d'uh).
> > =

> > I think ARM64 approached this problem by adding the
> > load-acquire/store-release instructions and for TSO based code,
> > translate into those (eg. x86 -> arm64 transpilers).

> Keeping global TSO order is easier and faster than mixing
> acquire/release and regular load/store. That means when ssdtso is
> enabled, the transpiler's load-acquire/store-release becomes regular
> load/store. Some micro-arch hardwares could speed up the performance.

Why is it faster? Because the release+acquire thing becomes RcSC instead
of RcTSO? Surely that can be fixed with a weaker store-release variant
ot something?

The problem I have with all of this is that you need to context switch
this state and that you need to deal with exceptions, which must be
written for the weak model but then end up running in the tso model --
possibly slower than desired.

If OTOH you only have a single model, everything becomes so much
simpler. You just need to be able to express exactly what you want.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
