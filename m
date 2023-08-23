Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29166EE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 13:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WKyWSXDqGllC7wzB/nwCr4B2B1iA5ChMBVhNfdD0ws=; b=2Fvff/uB0b9pu9
	gTyGznqpRIjFyBOw1xQkPXqyNQAwpBctv3PEAtTRN/4uduOetj528zr5Nw3XFksbExeFMNG3XeaA2
	5T3/2MW5ghF73dJLauFM/KW5vtthOeW0MLue2r16Ka8t3tskFK0uq5PFf+uvT2DvR2DxYe2X724XM
	rBl58UO1MI3zXTRMLzBK2JbOTSUhlxGgTGTlMUpPKK8uO6G0SVz7gYa3Zkbsu/X0Z0RUZAQSfjYzG
	iyr2t3i5fxwzXAGFXUpx+CZUdQz828pcOSL8as7pjGTE77iMP0KR8BRuXy98/W6EG8UzbdvgWn7xF
	wnYZMD+xs5iZ0HaGejcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYndw-000bmD-1w;
	Wed, 23 Aug 2023 13:11:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnds-000bkI-1d;
	Wed, 23 Aug 2023 13:11:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3E8463EBD;
	Wed, 23 Aug 2023 13:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DAAC433C7;
	Wed, 23 Aug 2023 13:11:10 +0000 (UTC)
Date: Wed, 23 Aug 2023 14:11:07 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 03/36] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <ZOYFazB1gYjzDRdA@arm.com>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZN+qki9EaZ6f9XNi@arm.com>
 <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
 <ZOTnL1SDJWZjHPUW@arm.com>
 <43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
 <ZOXa98SqwYPwxzNP@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOXa98SqwYPwxzNP@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_061124_633808_2D3E9451 
X-CRM114-Status: GOOD (  45.13  )
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

On Wed, Aug 23, 2023 at 11:09:59AM +0100, Szabolcs Nagy wrote:
> The 08/22/2023 18:53, Mark Brown wrote:
> > On Tue, Aug 22, 2023 at 05:49:51PM +0100, Catalin Marinas wrote:
> > > It would be good if someone provided a summary of the x86 decision (I'll
> > > get to those thread but most likely in September). I think we concluded
> > > that we can't deploy GCS entirely transparently, so we need a libc
> > > change (apart from the ELF annotations). Since libc is opting in to GCS,
> > 
> > Right, we need changes for setjmp()/longjmp() for example.
> > 
> > > we could also update the pthread_create() etc. to allocate the shadow
> > > together with the standard stack.
> > > 
> > > Anyway, that's my preference but maybe there were good reasons not to do
> > > this.
> > 
> > Yeah, it'd be good to understand.  I've been through quite a lot of old
> > versions of the x86 series (I've not found them all, there's 30 versions
> > or something of the old series plus the current one is on v9) and the
> > code always appears to have been this way with changelogs that explain
> > the what but not the why.  For example roughly the current behaviour was
> > already in place in v10 of the original series:
> > 
> >    https://lore.kernel.org/lkml/20200429220732.31602-26-yu-cheng.yu@intel.com/
> 
> well the original shstk patches predate clone3 so no surprise there.
> e.g. v6 is from 2018 and clone3 is 2019 linux 5.3
> https://lore.kernel.org/lkml/20181119214809.6086-1-yu-cheng.yu@intel.com/

Good point, I had not realised that.

> > I do worry about the story for users calling the underlying clone3() API
> > (or legacy clone() for that matter) directly, and we would also need to
> > handle the initial GCS enable via prctl() - that's not insurmountable,
> > we could add a size argument there that only gets interpreted during the
> > initial enable for example.
> 
> musl and bionic currently use plain clone for threads.
> 
> and there is user code doing raw clone threads (such threads are
> technically not allowed to call into libc) it's not immediately
> clear to me if having gcs in those threads is better or worse.
> 
> glibc can use clone3 args for gcs, i'd expect the unmap to be more
> annoying than the allocation, but possible (it is certainly more
> work than leaving everything to the kernel).

Unmapping is indeed more complex but I guess something similar needs to
happen for the thread stack to be reclaimed.

The thing I dislike about the kernel automatically mapping it is the
arbitrary fraction of RLIMIT_STACK size. glibc may use RLIMIT_STACK as a
hint for the thread stack size but is this the case for other libraries?
Some quick search (which I may have misinterpreted) shows that musl uses
128KB, bionic 1MB. So at this point the shadow stack size has no
relevance for the actual thread stack.

An alternative would be for the clone3() to provide an address _hint_
and size for GCS and it would still be the kernel doing the mmap (and
munmap on clearing). But at least the user has some control over the
placement of the GCS and its size (and maybe providing the address has
MAP_FIXED semantics).

> > My sense is that they deployment story is going to be smoother with
> > defaults being provided since it avoids dealing with the issue of what
> > to do if userspace creates a thread without a GCS in a GCS enabled
> > process but like I say I'd be totally happy to extend clone3().  I will
> > put some patches together for that (probably once the x86 stuff lands).
> > Given the size of this series it might be better split out for
> > manageability if nothing else.
> 
> i would make thread without gcs to implicitly disable gcs, since
> that's what's bw compat with clones outside of libc (the libc can
> guarantee gcs allocation when gcs is enabled).

Yes, this should work. Any invocation of clone() or clone3() without a
shadow stack would disable GCS. What about the reverse, should GCS be
enabled for a thread even if the clone3() caller has GCS disabled? I
guess we shouldn't since GCS enabling depends on the prctl() state set
previously.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
