Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E2DC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 01:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h99C1tIeaGecnqXrSXjrNTPaJRyDzHIqSrQYJU6x6Zw=; b=NEzm26xxdlV99n
	Uf+EUR54gMrrcoKSOYllqyRJitWyfABQezGb0PjTUTBwIY22QHgKLemWns4Zn9pzZtEDdRnNML6B6
	DUqkIODuvVMrNFrhvBnafwbyINs9P7K7ok/2zihFG4EBeBUHkCZ8nO8tKa9AEahWnk525q6Frt2nY
	SRpuSJD0Xg8Y4kR0PNAfsNEhPGNKZ3ZWRBOJn06JglPbJ8kDGKijWBsAskrwnR0VWQRbq9nwrxkL0
	n9HCYeF6KRR8+upuVbv+bw6evju6zDo2wuz55g9J4GrEqArFtnSwRafMTQbUB31as/mODgDcit5vY
	vypywMlc53IsentOhyLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7n7T-003puu-0u;
	Tue, 28 Nov 2023 01:42:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7n7P-003psx-1k
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 01:42:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF7F7CE16BB;
	Tue, 28 Nov 2023 01:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 594CCC433C7;
	Tue, 28 Nov 2023 01:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701135747;
	bh=gtoVfYSIc48oSQYnR6eKhSs43P+8J2vX1BS8SV6N/hI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nk8o12nCdnazZwWAAjT8gchuydW9Vv64z+vCVutfYWriReDKwgr/i+BKyLX7pfn+8
	 hj7dATcDAsJX5v2Evf0eErl2Ht6SIrpM1OHVjz6w7wjovojzHxv0zXqRozFVa0DglC
	 5j0oRUVRTsfzZiZVsl0/r+D2x/eRc4FAVo8nbkdNi7UXhEZVUhjgj00m3zRyymcaY+
	 4235eXWNZI+xcseo0KRe/ruqI2ayKp94ON/ogL+B3xGLDhXgfdfeEE/TyIfsY4NlSp
	 3VzVpX24BDwnZ+PshVTXffZjYUydM4+uLVsq+jNvhyXpNmN2Qw8o13Ueb+GCh92VZn
	 DkPIUA43kAECQ==
Date: Mon, 27 Nov 2023 20:42:19 -0500
From: Guo Ren <guoren@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <ZWVFe4SzeGMLD4wj@gmail.com>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
 <20231124101519.GP3818@noisy.programming.kicks-ass.net>
 <ZWFhSYalMCgTo+SG@gmail.com>
 <20231127111643.GV3818@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127111643.GV3818@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_174232_053912_C1D7ED30 
X-CRM114-Status: GOOD (  35.94  )
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

On Mon, Nov 27, 2023 at 12:16:43PM +0100, Peter Zijlstra wrote:
> On Fri, Nov 24, 2023 at 09:51:53PM -0500, Guo Ren wrote:
> > On Fri, Nov 24, 2023 at 11:15:19AM +0100, Peter Zijlstra wrote:
> > > On Fri, Nov 24, 2023 at 08:21:37AM +0100, Christoph Muellner wrote:
> > > > From: Christoph M=FCllner <christoph.muellner@vrull.eu>
> > > > =

> > > > The upcoming RISC-V Ssdtso specification introduces a bit in the se=
nvcfg
> > > > CSR to switch the memory consistency model at run-time from RVWMO t=
o TSO
> > > > (and back). The active consistency model can therefore be switched =
on a
> > > > per-hart base and managed by the kernel on a per-process/thread bas=
e.
> > > =

> > > You guys, computers are hartless, nobody told ya?
> > > =

> > > > This patch implements basic Ssdtso support and adds a prctl API on =
top
> > > > so that user-space processes can switch to a stronger memory consis=
tency
> > > > model (than the kernel was written for) at run-time.
> > > > =

> > > > I am not sure if other architectures support switching the memory
> > > > consistency model at run-time, but designing the prctl API in an
> > > > arch-independent way allows reusing it in the future.
> > > =

> > > IIRC some Sparc chips could do this, but I don't think anybody ever
> > > exposed this to userspace (or used it much).
> > > =

> > > IA64 had planned to do this, except they messed it up and did it the
> > > wrong way around (strong first and then relax it later), which lead to
> > > the discovery that all existing software broke (d'uh).
> > > =

> > > I think ARM64 approached this problem by adding the
> > > load-acquire/store-release instructions and for TSO based code,
> > > translate into those (eg. x86 -> arm64 transpilers).
> =

> > Keeping global TSO order is easier and faster than mixing
> > acquire/release and regular load/store. That means when ssdtso is
> > enabled, the transpiler's load-acquire/store-release becomes regular
> > load/store. Some micro-arch hardwares could speed up the performance.
> =

> Why is it faster? Because the release+acquire thing becomes RcSC instead
> of RcTSO? Surely that can be fixed with a weaker store-release variant
> ot something?
The "ld.acq + st.rel" could only be close to the ideal RCtso because
maintaining "ld.acq + st.rel + ld + st" is more complex in LSU than "ld
+ st" by global TSO.  So, that is why we want a global TSO flag to
simplify the micro-arch implementation, especially for some small
processors in the big-little system.

> =

> The problem I have with all of this is that you need to context switch
> this state and that you need to deal with exceptions, which must be
> written for the weak model but then end up running in the tso model --
> possibly slower than desired.
The s-mode TSO is useless for the riscv Linux kernel and this patch only
uses u-mode TSO. So, the exception handler and the whole kernel always
run in WMO.

Two years ago, we worried about stuff like io_uring, which means
io_uring userspace is in TSO, but the kernel side is in WMO. But it
still seems like no problem because every side has a different
implementation, but they all ensure their order. So, there should be no
problem between TSO & WMO io_uring communication. The only things we
need to prevent are:
1. Do not let the WMO code run in TSO mode, which is inefficient. (you ment=
ioned)
2. Do not let the TSO code run in WMO mode, which is incorrect.

> If OTOH you only have a single model, everything becomes so much
> simpler. You just need to be able to express exactly what you want.
The ssdtso is no harm to the current WMO; it's just a tradeoff for
micro-arch implementation. You still could use "ld + st" are "ld.acq +
st.rl", but they are the same in the global tso state.

> =

> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
