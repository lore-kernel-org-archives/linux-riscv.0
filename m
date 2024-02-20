Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FFFC48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 20:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+isaNp8mGrZ/mJdzGx7hiJxRqe8znjU9KyXm5/JmiY4=; b=3u4ppxpFaHGKEYpzwhtCQbbGFI
	zcudBdDBytbsrWoyOIFehFXzqD3oBRiaPG+noHHe9s46TVMROQsWQbAnscETBoLIbDGzvOA+I56p5
	BLUVMDSI37kmBmGFCcdWk7rnjk9zEpTga2ywusyUuj517owPwCQ2QNaSYB8O+hfNmlBqDWZLU1bsR
	qrAeHJWjvULb5a6qIHRO6apJO4JUPG746u0uBAILlMDDJOQ0sB3oNs2iXZ2EMx3GzPVTVUXpM9zFL
	5I/9Ssskg2l/YoWS4L8E+kt+87XoNZZBUecIkeEXx7xvaO9DfU/8EsS1sbsIo/I0gDeKNj2IJ9o+e
	OBXPTeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcWVp-0000000G4tG-1Hef;
	Tue, 20 Feb 2024 20:14:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcWVl-0000000G4s7-3r9D;
	Tue, 20 Feb 2024 20:14:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 227C6CE19BF;
	Tue, 20 Feb 2024 20:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0852DC433C7;
	Tue, 20 Feb 2024 20:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708460079;
	bh=PhnmgydTViRe3a3Z0MeKX2O9Z2j/9jkmyt+EI/YkIDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=livCMehgZsyylqxmsXVj6i8xUdU6xpehFod2AwCiN5tpwFKJ1EI6uVpnpUk1SD1pP
	 GAOlkj14vHO/qPvkX0d2id7JAYJfmORLe28tPRQkxNkQE6Rd+nls0vM8PGBKwrFQaU
	 Z6Hn1f36OwFyKU9OKK+mfymo53Iz1gvB0Pk8YA6mTWUndRC5NI4pVkVYdWAFBH06HP
	 wpOkoK5yJIv0PkCR2AWd/nyXrwJz1hOuoOPB1/Rw7cDtv6Mla+4AxXh12qp+hhLjEp
	 yd71FoqwR1k2BDtT0dWYNV11Xg/QhMr2farOiz7zqwo8yti2+//d2OrlM8Ac/4z8v3
	 SQyYG8IyDqVJw==
Date: Tue, 20 Feb 2024 20:14:30 +0000
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "ardb@kernel.org" <ardb@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"sorear@fastmail.com" <sorear@fastmail.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"musl@lists.openwall.com" <musl@lists.openwall.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS in userspace
Message-ID: <527e2b4d-5d2b-4993-a30a-834e77a23a40@sirena.org.uk>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <22a53b78-10d7-4a5a-a01e-b2f3a8c22e94@app.fastmail.com>
 <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
X-Cookie: E = MC ** 2 +- 3db
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_121442_323305_FFF37F25 
X-CRM114-Status: GOOD (  30.17  )
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
Content-Type: multipart/mixed; boundary="===============2340892387051593291=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2340892387051593291==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LFlVuq7xn7hg1UEJ"
Content-Disposition: inline


--LFlVuq7xn7hg1UEJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 06:41:05PM +0000, Edgecombe, Rick P wrote:
> On Tue, 2024-02-20 at 11:36 -0500, Stefan O'Rear wrote:

> > 2. Shadow stack faults on non-shadow stack pages, if flexible shadow
> > stack
> > =A0=A0 handling is in effect, cause the affected page to become a shadow
> > stack
> > =A0=A0 page.=A0 When this happens, the page filled with invalid address
> > tokens.

> Hmm, could the shadow stack underflow onto the real stack then? Not
> sure how bad that is. INCSSP (incrementing the SSP register on x86)
> loops are not rare so it seems like something that could happen.

Yes, they'd trash any pages of normal stack they touch as they do so but
otherwise seems similar to overflow.

> The situation (for arm and riscv too I think?) is that some
> applications will just not work automatically due to custom stack
> switching implementations. (user level threading libraries, JITs, etc).
> So=A0I think it should be ok to ask for apps to change to enable shadow
> stack and we should avoid doing anything too awkward in pursuit of
> getting it to work completely transparently.

Yes, on arm64 anything that rewrites or is otherwise clever with the
stack is going to have to understand that the GCS exists on arm64 and do
matching rewrites/updates for the GCS.  This includes anything that
switches stacks, it will need to use GCS specific instructions to change
the current shadow stack pointer.

> > MAP_SHARED; I consider this sufficiently perverse application
> > behavior that
> > it is not necessary to ensure exclusive use of the underlying pages
> > while
> > a shadow stack pte exists.=A0 (Applications that use MAP_SHARED for
> > stacks
> > do not get the full benefit of the shadow stack but they keep
> > POSIX.1-2004
> > conformance, applications that allocate stacks exclusively in
> > MAP_PRIVATE
> > memory lose no security.)

> On x86 we don't support MAP_SHARED shadow stacks. There is a whole
> snarl around the dirty bit in the PTE. I'm not sure it's impossible but
> it was gladly avoided. There is also a benefit in avoiding having them
> get mapped as writable in a different context.

Similarly for arm64, I think we can physically do it IIRC but between
having to map via map_shadow_stack() for security reasons and it just
generally not seeming like a clever idea the implementation shouldn't
actually let you get a MAP_SHARED GCS it's not something that's been
considered.

> > I am substantially less familiar with GCS and SHSTK than with
> > Zicfiss.
> > It is likely that a syscall or other mechanism is needed to
> > initialize the
> > shadow stack in flexible memory for makecontext.

> The ucontext stacks (and alt shadow stacks is the plan) need to have a
> "restore token". So, yea, you would probably need some syscall to
> "convert" the normal stack memory into shadow stack with a restore
> token.

Similar considerations for GCS, we need tokens and we don't want
userspace to be able to write by itself in the normal case.

--LFlVuq7xn7hg1UEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXVCCUACgkQJNaLcl1U
h9CH3gf+IJkDKy0uUAtsKGOEXiHDZs6dgXAT43RbQM/ofajONSRA7nEWsZHy7IWP
Tcz0hVz2/ellXMMRHdtDCKYxE3ugSuE8UQSOLGt2B3R1TDmgkXPW8GWOtV/eIUYS
rJEPCtPF35R3ezGjIYnLBQvSoFNjD4TNyygIvjh6d3Wc8m+aXtiC/whvINTuzOVv
SnYa3aFliCl153Ck0/3GzAiFCbGFUY3qVhKBwbk6MLITlRf9mF5bLp8e5Zzf49yj
9qGcHcDETmpcxDVRJ7oAzh8gqQqein8FOyFDkREnT59O7DdNNTx8m/K29UOnBuLF
z/qP3IZSjbKlJ3d/XfSVG0mTnYnohw==
=e50G
-----END PGP SIGNATURE-----

--LFlVuq7xn7hg1UEJ--


--===============2340892387051593291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2340892387051593291==--

