Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E370C47422
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 22:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9wTuh+SA8SpXi10TyZyMN70uDw73mjDdABej3VPPCw=; b=W1NtMa85EqFq7pOmRm1scIF1EU
	Oc7fdTPE2BccKbs4Vnjx/b0ZpcvjPaqMyy1DCFGYnxzduaEZWYGUIqt2NKDaZx1axwquC5POBoxaV
	4dsGtCXKs1gpIAYZYfltgxMVBq80ktUA55q2X1qXX//5gPVEUug0rWPwydvNk0WAC6WivbqX7HFae
	brdQRLBXn9H6msWFv6YjJL1DpeVx7utWNl02RFbbpGafkpbwleV372Q8/yCricFKchY7kzSDquAkO
	0L1H6KMOuEFAY+DeoUVuwgQLtCHa8/q7cZ36dg1FfpJ50NpHePsf5ZWjYH5Z5zkGXWa9TfI5LLoTG
	vK8wFAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTUGV-00000005X0H-2HQj;
	Fri, 26 Jan 2024 22:01:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTUGT-00000005Wzr-0I6q
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 22:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EC1D625BE;
	Fri, 26 Jan 2024 22:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A277C433F1;
	Fri, 26 Jan 2024 22:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706306461;
	bh=riut/XdpDrQsrASptwkcJlb0by07DshnWcYF/bs/29E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OlPwJWfoQ84jFCtOj2ECYPqtGlVcOuXS54UDiCUCWepQHkwb5HGmWUV/Ub+2dO/fp
	 y+jta1jG5WkFNa2JWgNBsRLG5ckfkgjYx2R74XPMNjzICsSq+PFWZa2mdaNXOgFvSU
	 c85/qaqET/+epqfZKhSqfsmsuJpSThFPdO4cXU+TPvpN5yodPcjGQch8oG9sPS4uK/
	 ZRyy7ypuVoD4l3gNX87Hif2mtnSOhNm4BTcHDg/2DG1uV/vwTCZMKkTpMSfoNpGYPb
	 xTYXppk54qRxer6vaAQ2EGumfgjJIJeVpm7H1jkwivnBVY99YBEGid3YrSi65wWgoB
	 oDvdwrsn3nW6w==
Date: Fri, 26 Jan 2024 22:00:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Matthew Maurer <mmaurer@google.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
Message-ID: <20240126-eccentric-jaywalker-3560e2151a92@spud>
References: <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy>
 <20240117-swiftly-parasail-618d62972d6e@spud>
 <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud>
 <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy>
 <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy>
 <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_140133_204871_8E91C906 
X-CRM114-Status: GOOD (  39.85  )
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
Content-Type: multipart/mixed; boundary="===============6022901930883797904=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6022901930883797904==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VpYZYsPh7ooFZbB5"
Content-Disposition: inline


--VpYZYsPh7ooFZbB5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 10:00:02PM +0100, Miguel Ojeda wrote:
> On Thu, Jan 25, 2024 at 2:46=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > Ah, thanks for the direct link :)
>=20
> My pleasure!
>=20
> > Actually, thinking about it for a moment - if only a single compiler
> > version is supported (the minimum, right?) then you could just add the
>=20
> Yeah, the minimum listed in `scripts/min-tool-version.sh` and in
> `Documentation/process/changes.rst`. It also happens to be the maximum
> too, until we can relax that.
>=20
> > -Zsanitizer=3Dkcfi flag whenever CFI_CLANG and RUST are both set.
>=20
> Since the flag goes to the Rust compiler, `RUST` would be always
> enabled, so the flag would only need to be added when `CFI_CLANG=3Dy`,
> no?

Sure.

> Or what do you mean?

Oh I was probably just getting myself mixed up between what the Kconfig
and Makefile stuff would look like. dw :)

> > I'm not sure if that is a better option though. It's a choice between
> > CFI_CLANG being disabled if the check is not updated when the toolchain
> > is bumped versus being enabled for C and not for RUST. I think I prefer
> > the former though, tracking down the cause of the latter I would rather
> > not wish on a user.
> >
> > I vote for having the check, even if it can only ever be true at the
> > moment.
>=20
> Since we only support a single version, we don't need `rc-option`
> tests until we start supporting several versions (which is why other
> tests like that do not exist so far).
>=20
> In my previous message I thought you meant using the flag to test for
> arch/target support or similar. That would be fine, but we can also do
> the usual `ARCH_SUPPORTS_CFI_RUST` here, I would assume.

Is that even needed? We already have ARCH_SUPPORTS_CFI_CLANG and AFAIU
rust supports it if clang does, so a second option is superfluous?

> Now, during the version bump to a stable flag, if we happen to forget
> to update the flag name, it would be a build error, so it should be
> easily spotted and fixed.

I'm reading back what I wrote, and I must have been trying to get out
the door or something because none of it really makes that much sense.
Of course an unknown option should be detectable at build time and not
be a silent breakage. Maybe I should have written the patch for this
before sending the mail rather than writing the mail based on what was
in my head.

> What we may want to add, though, to avoid the confusion you mention
> meanwhile, is just a `depends on !CFI_CLANG` for `RUST`, like for the
> other requirements we have there (which are things that should
> eventually go away). Then they can remove that when the `-Z` flag is
> deemed ready to be used. But perhaps let's see what Ramon et al. say.

I don't really mind either way. Whatever of the two that you guys want
that prevents broken kernels works for me!

> By the way, concerning the tracking issue, since you mentioned it: it
> has a list of PRs, but not fixes, there is a "known issues" link
> there. On top of that, we are "shifted in time" w.r.t. the latest
> status in the compiler, since we use stable versions of the compiler.

Yah, I was linking it to point out that the stuff is unlikely to be
usable any time soon, since it is not complete in the most recent
toolchain.

Cheers,
Conor.

--VpYZYsPh7ooFZbB5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbQrlwAKCRB4tDGHoIJi
0meeAP9z4Z4UXLa6YN4nCic4/a2cKXvc99l+GFebDHGuZJIHpwD/W1lM4CxjLlBg
W60C8W8UTeABvw1N16NPnnOeE8KteQI=
=jaxq
-----END PGP SIGNATURE-----

--VpYZYsPh7ooFZbB5--


--===============6022901930883797904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6022901930883797904==--

