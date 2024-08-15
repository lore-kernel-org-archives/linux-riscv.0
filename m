Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556EEC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 16:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQHfs9x+2jhLDY+J/N+zkxtrFubVts8Dn35p4V/zILs=; b=FcXb0/LdhpUfqW
	xe0Lc4vGnO6wZXvxrcFU2593Nd7gxwrqj06DtHy9vWCmIBpM7IufzK+pgGurWdnCUtElG8588bgam
	YPKTPbFIaB589p/SBLsSuIbUMLGhGkNs+aQVgDk3EaOPsPT6D3G8wPVTWGmhALHew51VGKusfpxss
	Ej44jfQhPPOwQnN91BlIDriQiLNM6nQFoYz56jt8Vdbabz0gfa88Gu14e5wN+jxb004yg+829B4BY
	9jd4qPZyTp5J1sHh+5TvQAVNj7bLoTjKSkggZWOdzykIO6ujQXAWwRTsj9NRVdHrA9nb9s9q1Y7Bg
	blTqypkA/OYaQq/kBkXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sedbu-0000000AYaq-2ulS;
	Thu, 15 Aug 2024 16:46:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secTw-0000000AP7x-2tUg;
	Thu, 15 Aug 2024 15:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=thV+icgWgLhrStru+zV1Q9digrGKb6lXMEajA/O80cY=; b=Dxm0BYqchiAuqxQSZIfG7n0ZuN
	6f0+M1cGise8DombJezd0V3wsRZQXIl2zVOpITmavj6a+TxwXwPlCFh632SzrZYRR9bBryJVElTRn
	D3X1aL1sIMV86hrUfSJhSnXjQP7wBKdmSNjb6yBUrgQP42usVPpJpBAUnLC81IB9q+fBRuq1BRBpa
	1BumE6XT9wXHUYIV9C82P0zr/Op/lmumVVBfikzROH1/KEj0NDrS6M3zygskTW4IyCh1dBbqmorMo
	CeD5mlbpXZpn+0hZasKgDsCKsDch/E+oGHZsBDeqhNgbVr3U7pi8/cwXmV/3nb2QVKACixz0Idy9P
	xm4+PgwQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secTq-00000008PyE-2eZB;
	Thu, 15 Aug 2024 15:33:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7948614BF;
	Thu, 15 Aug 2024 08:34:00 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 555713F58B;
	Thu, 15 Aug 2024 08:33:28 -0700 (PDT)
Date: Thu, 15 Aug 2024 16:33:25 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 24/40] arm64/signal: Expose GCS state in signal frames
Message-ID: <Zr4fxZ8wf+Wcey4E@e133380.arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-24-699e2bd2190b@kernel.org>
 <ZrzIv3FWNgJizDc2@e133380.arm.com>
 <7433e3d2-996a-45a0-b917-666a340ad109@sirena.org.uk>
 <Zr4KMaBv4JXx8uBz@e133380.arm.com>
 <efe1d936-011d-49e3-a0ff-8f6276e4d782@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efe1d936-011d-49e3-a0ff-8f6276e4d782@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_163339_154520_27785591 
X-CRM114-Status: GOOD (  50.64  )
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

On Thu, Aug 15, 2024 at 04:05:32PM +0100, Mark Brown wrote:
> On Thu, Aug 15, 2024 at 03:01:21PM +0100, Dave Martin wrote:
> 
> > My thought was that if libc knows about shadow stacks, it is probably
> > going to be built to use them too and so would enable shadow stack
> > during startup to protect its own code.
> 
> > (Technically those would be independent decisions, but it seems a good
> > idea to use a hardening feature if you know about and it is present.)
> 
> > If so, shadow stacks might always get turned on before the main program
> > gets a look-in.
> 
> > Or is that not the expectation?
> 
> The expectation (at least for arm64) is that the main program will only
> have shadow stacks if everything says it can support them.  If the
> dynamic linker turns them on during startup prior to parsing the main
> executables this means that it should turn them off before actually
> starting the executable, taking care to consider any locking of features.

Hmm, so we really do get a clear "enable shadow stack" call to the
kernel, which we can reasonaly expect won't happen for ancient software?

If so, I think dumping the GCS state in the sigframe could be made
conditional on that without problems (?)

(We could always make it unconditional later if it turn out that that
approach breaks something.)

> 
> > > > Is there any scenario where it is legitimate for the signal handler to
> > > > change the shadow stack mode or to return with an altered GCSPR_EL0?
> 
> > > If userspace can rewrite the stack pointer on return (eg, to return to a
> > > different context as part of userspace threading) then it will need to
> 
> > Do we know if code that actually does that?  IIUC, trying to do this is
> > totally broken on most arches nowadays; making it work requires a
> > reentrant C library and/or logic to defer signals around critical
> > sections in userspace.
> 
> > "Real" threading makes this pretty pointless for the most part.
> 
> > Related question: does shadow stack work with ucontext-based coroutines?
> > Per-context stacks need to be allocated by the program for that.
> 
> Yes, ucontext based coroutines are the sort of thing I meant when I was
> talking about returning to a different context?  

Ah, right.  Doing this asynchronously on the back of a signal (instead
of doing a sigreturn) is the bad thing.  setcontext() officially
doesn't work for this any more, and doing it by hacking or rebuilding
the sigframe is extremely hairy and probably a terrible idea for the
reasons I gave.

> > > be able to also update GCSPR_EL0 to something consistent otherwise
> > > attempting to return from the interrupted context isn't going to go
> > > well.  Changing the mode is a bit more exotic, as it is in general.
> > > It's as much to provide information to the signal handler as anything
> > > else.

Note, the way sigcontext (a.k.a. mcontext).__reserved[] is used by
glibc for the ucontext API is inspired by the way the kernel uses it,
but not guaranteed to be compatible.  For the ucontext API glibc
doesn't try to store/restore asynchronous contexts (which is why
setcontext() from a signal handler is totally broken), so there is no
need to store SVE/SME state and hence lots of free space, so this
probably is supportable with shadow stacks -- if there's a way to
allocate them.  This series would be unaffected either way.

(IIRC, the contents of mcontext.__reserved[] is totally incompatible
with what the kernel puts in there, and doesn't have the same record
structure.)

> 
> > I'm not sure that we should always put information in the signal frame
> > that the signal handler can't obtain directly.
> 
> > I guess it's harmless to include this, though.
> 
> If we don't include it then if different ucontexts have different GCS
> features enabled we run into trouble on context switch.

As outlined above, nowadays you can only use setcontext() on a context
obtained from getcontext().  Using setcontext() on a context obtained
from a sigframe works by accident or not at all, but in any case
coroutines always switch synchronously and don't rely on doing this.

(See where setcontext deals with the FPSIMD regs:
https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/aarch64/setcontext.S;h=ba659438c564dc3bbbb8d6039030e2c492649534;hb=HEAD )

So, overall I think making ucontext coroutines with with GCS is purely
a libc matter that is "interesting" here, but we don't need to worry
about.

> > > > Is the guarded stack considered necessary (or at least beneficial) for
> > > > backtracing, or is the regular stack sufficient?
> 
> > > It's potentially beneficial, being less vulnerable to corruption and
> > > simpler to parse if all you're interested in is return addresses.
> > > Profiling in particular was mentioned, grabbing a linear block of memory
> > > will hopefully be less overhead than chasing down the stack.  The
> > > regular stack should generally be sufficient though.
> 
> > I guess we can't really argue that the shadow stack pointer is
> > redundant here though.  The whole point of shadow stacks is to make
> > things more robust...
> 
> > Just kicking the tyres on the question of whether we need it here, but
> > I guess it's hard to make a good case for saying "no".
> 
> Indeed.  The general model here is that we don't break userspace that
> relies on parses the normal stack (so the GCS is never *necessary*) but
> clearly you want to have it.

Agreed, but perhaps not in programs that haven't enabled shadow stack?

Cheers
---Dave

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
