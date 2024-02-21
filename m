Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB13C54788
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3U/YVo+aogCT9lnFk/Mzm26YacB4zSdCoIIkmfNrU3k=; b=ngbsO3PSWSfYW4NqhnF/7B6hg1
	XCsoYmokDPWCf19gZ7RVGCYolJ52AONWOD01MGcePKTXSwzVBrtv72O9o517hphrOM2z61TmI2sWI
	/DhdVZIW6tnuujqGNYysF8mNRoCb+sLEmX8UbiONSPFP0mScNXe0zuXUtuSuazPB03flu8pDrfM8L
	Y9UC/u7R78Kqf7Q/WdwqewRB24lyiOBaaft/IkEfi8yVKOXTpa7eMCUug/Op79FXiYvSKhI1z8zu+
	KUv3jsexM5ltLeMCsvJvLIfbJQu7RLHstw1HPJfggSwI3Axtd4sau0x/P1JEJU7m8+ccMpo9WQ/0a
	Sj8fY8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcn2M-000000019Ld-0zrw;
	Wed, 21 Feb 2024 13:53:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcn2I-000000019JO-3YaW;
	Wed, 21 Feb 2024 13:53:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CB92ACE1D76;
	Wed, 21 Feb 2024 13:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8B9C433F1;
	Wed, 21 Feb 2024 13:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708523600;
	bh=2qDB6aCchFqvsRrIZrlOnBUWRusFLsK6a7t86lO4/kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYWFYY21ChMcDnqRafHBvRB0QxejjlT/bZHLI49dgPa5dRacaD3UN0LLMesLDhEVK
	 FQALDj09HDwKPE6W4jj/Eh1jqbUH+H+QnFzr8lEIlZA/imkC3dRk/JOQvq/V/1qmnf
	 AKtPOLPebGuFFRe5xPIXDbSmUtlL944IsVvIA7rGpLNSg/1AcaSk659q46C8HRHywn
	 bhl8FLesEaZJjbv9GARHL60svpyiaFNTpyRdOuK9i5QgdctkDvVHFN/fMwhmSVZRSB
	 /NtzQjotaqwXeqdsZ0ePVwa6GV0m+bjLd5HQ/Rwg6sMIIZRNIfrgzJfc4uR31QEOgk
	 nbyq6X4Uq/GjQ==
Date: Wed, 21 Feb 2024 13:53:10 +0000
From: Mark Brown <broonie@kernel.org>
To: "dalias@libc.org" <dalias@libc.org>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"musl@lists.openwall.com" <musl@lists.openwall.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>, "maz@kernel.org" <maz@kernel.org>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"sorear@fastmail.com" <sorear@fastmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS
 in userspace
Message-ID: <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <22a53b78-10d7-4a5a-a01e-b2f3a8c22e94@app.fastmail.com>
 <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
 <20240220185714.GO4163@brightrain.aerifal.cx>
 <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
 <20240220235415.GP4163@brightrain.aerifal.cx>
 <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
 <20240221012736.GQ4163@brightrain.aerifal.cx>
MIME-Version: 1.0
In-Reply-To: <20240221012736.GQ4163@brightrain.aerifal.cx>
X-Cookie: The second best policy is dishonesty.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_055323_254833_04DC258D 
X-CRM114-Status: GOOD (  28.18  )
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
Content-Type: multipart/mixed; boundary="===============1734669754023029107=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1734669754023029107==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cNQgfjDz+IAKI+aZ"
Content-Disposition: inline


--cNQgfjDz+IAKI+aZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 20, 2024 at 08:27:37PM -0500, dalias@libc.org wrote:
> On Wed, Feb 21, 2024 at 12:35:48AM +0000, Edgecombe, Rick P wrote:

> > (INCSSP, RSTORSSP, etc). These are a collection of instructions that
> > allow limited control of the SSP. When shadow stack gets disabled,
> > these suddenly turn into #UD generating instructions. So any other
> > threads executing those instructions when shadow stack got disabled
> > would be in for a nasty surprise.

> This is the kernel's problem if that's happening. It should be
> trapping these and returning immediately like a NOP if shadow stack
> has been disabled, not generating SIGILL.

I'm not sure that's going to work out well, all it takes is some code
that's looking at the shadow stack and expecting something to happen as
a result of the instructions it's executing and we run into trouble.  A
lot of things won't notice and will just happily carry on but I expect
there are going to be things that care.  We also end up with an
additional state for threads that have had shadow stacks transparently
disabled, that's managable but still.

> > > The place where it's really needed to be able to allocate the shadow
> > > stack synchronously under userspace control, in order to harden
> > > normal
> > > applications that aren't doing funny things, is in pthread_create
> > > without a caller-provided stack.

> > Yea most apps don't do anything too tricky. Mostly shadow stack "just
> > works". But it's no excuse to just crash for the others.

> One thing to note here is that, to enable this, we're going to need
> some way to detect "new enough kernel that shadow stack semantics are
> all right". If there are kernels that have shadow stack support but
> with problems that make it unsafe to use (this sounds like the case),
> we can't turn it on without a way to avoid trying to use it on those.

If we have this automatic conversion of pages to shadow stack then we
should have an API for enabling it, userspace should be able to use the
presence of that API to determine if the feature is there.

--cNQgfjDz+IAKI+aZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXWAEUACgkQJNaLcl1U
h9BTcAf+MujJo/pNOGU2neBJWmbVKrnAz60+j+uAD98t6m1YXtFChsz+YR6gQOA1
7FEah97yBTtTiSGpgeKnKCJZMVaWEYHF0Oal7bU/cO0uO6DshP7BIWygF/xyL6/r
AiFhQ5IAhgRYlGKzShiXTP3rx7ITjIS/1ejalkQ4vHwCOA/N0rsnZwJadUytQjJv
bHJxu0pC95Sb9lZG3yrrOqZJdljkMsnb7ThBwPRENX0XmGz/Y8l0/FjQwiyWc+Bv
i4HuekjDwxdxIknpEI/kciFlk8gjthTCrAloZNN/PGNExBEppzAMUg44bTcUkuuu
CReIkIoN/x1s3gztzAkcLF2nu1EF6w==
=wfib
-----END PGP SIGNATURE-----

--cNQgfjDz+IAKI+aZ--


--===============1734669754023029107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1734669754023029107==--

