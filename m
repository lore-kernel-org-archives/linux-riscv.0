Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BD2C531DD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 14:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPZCg2hV7hyHlKzbBbaVAahrkYseAxpyvm4LjT1H8HA=; b=frDMFZTxpvYsTQ
	6SFQPVjdOvI3Z/bcs6TsYubPE4m/j4T3cbEgEb1y/srOq/XTj0hVhysp86bWW4hmKjqfxcSL5UEVm
	hb3MsbBjr12UAEASQxfno0rMRioS9kLOAQK/h8wxIAElmUs7khgx8xstpiH3oY8WAqk+H3o/iLVjB
	stkmgpdvImsubI+6qYgWa8ihSnvOeuaBFg19SVK17/eCr/hwNVNTiH29zLOMlf5vj61R7BUrf2oJt
	EtIWK67tGu0tD7JP9ek5IjiDbATMz/vn5gAuTEIYPq4lr6dbDdqqGMzu+XSnG4bnHJuieOJVAvveA
	wQc4X6DoNNT8LEMRqGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seb3L-0000000A8Ac-1M6v;
	Thu, 15 Aug 2024 14:02:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seb2f-0000000A7yS-3ZcJ;
	Thu, 15 Aug 2024 14:01:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9830414BF;
	Thu, 15 Aug 2024 07:01:54 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0410C3F73B;
	Thu, 15 Aug 2024 07:01:23 -0700 (PDT)
Date: Thu, 15 Aug 2024 15:01:21 +0100
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
Message-ID: <Zr4KMaBv4JXx8uBz@e133380.arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-24-699e2bd2190b@kernel.org>
 <ZrzIv3FWNgJizDc2@e133380.arm.com>
 <7433e3d2-996a-45a0-b917-666a340ad109@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7433e3d2-996a-45a0-b917-666a340ad109@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_070130_055272_D9EE233B 
X-CRM114-Status: GOOD (  34.24  )
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

On Wed, Aug 14, 2024 at 05:21:44PM +0100, Mark Brown wrote:
> On Wed, Aug 14, 2024 at 04:09:51PM +0100, Dave Martin wrote:
> > On Thu, Aug 01, 2024 at 01:06:51PM +0100, Mark Brown wrote:
> 
> > > +	if (add_all || task_gcs_el0_enabled(current)) {
> > > +		err = sigframe_alloc(user, &user->gcs_offset,
> > > +				     sizeof(struct gcs_context));
> > > +		if (err)
> > > +			return err;
> > > +	}
> 
> > Who turns on GCS?  I have a concern that if libc is new enough to be
> > built for GCS then the libc startup code will to turn it on, even if
> > the binary stack running on top of libc is old.
> 
> It should normally be the dynamic linker which should be looking for
> annotatations in the binaries it's loading before it decides if it's
> going to turn on GCS (and libc doing something similar if it's going to
> dlopen() things in a process with GCS enabled).

My thought was that if libc knows about shadow stacks, it is probably
going to be built to use them too and so would enable shadow stack
during startup to protect its own code.

(Technically those would be independent decisions, but it seems a good
idea to use a hardening feature if you know about and it is present.)


If so, shadow stacks might always get turned on before the main program
gets a look-in.

Or is that not the expectation?

> 
> > Is there any scenario where it is legitimate for the signal handler to
> > change the shadow stack mode or to return with an altered GCSPR_EL0?
> 
> If userspace can rewrite the stack pointer on return (eg, to return to a
> different context as part of userspace threading) then it will need to

Do we know if code that actually does that?  IIUC, trying to do this is
totally broken on most arches nowadays; making it work requires a
reentrant C library and/or logic to defer signals around critical
sections in userspace.

"Real" threading makes this pretty pointless for the most part.


Related question: does shadow stack work with ucontext-based coroutines?
Per-context stacks need to be allocated by the program for that.


> be able to also update GCSPR_EL0 to something consistent otherwise
> attempting to return from the interrupted context isn't going to go
> well.  Changing the mode is a bit more exotic, as it is in general.
> It's as much to provide information to the signal handler as anything
> else.

I'm not sure that we should always put information in the signal frame
that the signal handler can't obtain directly.

I guess it's harmless to include this, though.

> > Is the guarded stack considered necessary (or at least beneficial) for
> > backtracing, or is the regular stack sufficient?
> 
> It's potentially beneficial, being less vulnerable to corruption and
> simpler to parse if all you're interested in is return addresses.
> Profiling in particular was mentioned, grabbing a linear block of memory
> will hopefully be less overhead than chasing down the stack.  The
> regular stack should generally be sufficient though.

I guess we can't really argue that the shadow stack pointer is
redundant here though.  The whole point of shadow stacks is to make
things more robust...

Just kicking the tyres on the question of whether we need it here, but
I guess it's hard to make a good case for saying "no".

Cheers
---Dave


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
