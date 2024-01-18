Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39F0C47DAF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lif3HYZwu0la+TR+vZzVP17r2SUbSJz+iTNOzXqq3TI=; b=OeGEo8QrceZ1kIZXYQV56Rf+0w
	+PRcMgfY5hkhNZ00SyazDDWLHolzAFOUgUfKagLb3jDTgy4BdEmvZRymh5apEevfSn6ZS7Z9Rg+rv
	SAOLvBaf/Blw8oKCyMuS8tt42n0yxnyGT3ZQBIAazXEOWyUWBRt7Nll7CVc9fqwnpRJJVuouADnxA
	aQmYVGovYSKK2FkOiaDjrQmR7q7ILi7/Lmg6jXqmFQUo2cqx90YKNl5Ckh2+i7v4vyAq2466hZZNt
	GqSM5Kf3LkLETZqwFqKzVQ9H0qiDMEbOvZGLlVy/mskuc98tLoCNRZ95TYa3hfxyr4u/l8l/gauGQ
	zuuTsspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQUe4-0039M9-2k;
	Thu, 18 Jan 2024 15:49:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQUe2-0039L6-02
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 15:49:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5B5D6B818E0;
	Thu, 18 Jan 2024 15:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B6BC433C7;
	Thu, 18 Jan 2024 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705592967;
	bh=nJVOqOIFQLFIG1XFDqf8IhmlkhMFmW/3etJVOY+0M+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpYiSM7LnbMKYZ/xM2ne4yN+OEp8lDymBAwogZ7ixHmybIOElFhzSpUX5lhLUvR/E
	 NLbrsils21ig9zfMqUG9ywCY5AQwzGfql41mIgM+VSOOC2E4LRsTWdNVgJwK1SRu5+
	 h+vfxeq6WSYafLE5mkl7x4dyemtD6oEQ8jT6ik3VQ/9IQ75i2M+O2Z7ppIkmSZq4rN
	 EgOqabg0RbdDbfJlfDUVc3UWdbv29UJvLiJtvVIwHaXGLDdocM8VvvVLxKy3RCfE0Y
	 tiO/NrwnDsCDsLRE7yLXR03aUetujexIMJUP/4b7tL4YbY/APwCsTrewHNLQ4rR5f+
	 M2t7k0VaQfW1Q==
Date: Thu, 18 Jan 2024 15:49:21 +0000
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
	llvm@lists.linux.dev
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
Message-ID: <20240118-implode-delirium-eefdd86e170e@spud>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
 <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy>
 <20240117-swiftly-parasail-618d62972d6e@spud>
 <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_074930_360054_8EB0D1D3 
X-CRM114-Status: GOOD (  23.40  )
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
Content-Type: multipart/mixed; boundary="===============7681019234506333315=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7681019234506333315==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1HW3FZOlVDIsEuAs"
Content-Disposition: inline


--1HW3FZOlVDIsEuAs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 07:23:17PM +0100, Miguel Ojeda wrote:
> On Wed, Jan 17, 2024 at 12:31=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > 6.6 came and went, and I have been busy dealing with the other
> > responsibilities I mentioned and have not had a chance to look here.
> > I rebased this today and things still work as they did when I submitted
> > this version, but things have gotten muddier on the LLVM side of things,
> > as more recent versions have added yet more extension support.
>=20
> Sounds fun :)
>=20
> > My inclination at this point is to engage in a bit of LARPing as an
> > ostrich, and sorta ignore these concerns initially. Specifically, I'd
> > like to drop the idea of having the gcc support, and restrict to LLVM=
=3D1.
>=20
> Yeah, if `LLVM=3D1` works, then I would suggest going ahead with that.
>=20
> (Now that `rustc_codegen_gcc` is here, we will move to that and forget
> about mixed compiler builds, but we still have to handle `bindgen`
> flags until we have an alternative for that)

The bit that worries me most is bindgen, and in particular detecting the
version of libclang used. I mentioned to Nathan or Nick about needing a
buildtime test for the version of LIBCLANG being used.
I'm less worried about this for LLVM=3D1 builds, since while I think it is
possible to provide a LIBCLANG path to the build system, I suspect that
for LLVM=3D1 builds it's almost always going to match the LLVM toolchain
in use.

> > When it comes to asymmetrical extension support between the C and Rust
> > toolchains, I'm think we deal with that as we do for the C toolchains,
> > sort issues out as-and-when they arrive rather than punt this again.
>=20
> Sounds good, thanks a lot!

I'll do another rebase and resend after the merge window closes I
suppose :)

--1HW3FZOlVDIsEuAs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZalIgQAKCRB4tDGHoIJi
0h8eAQDfKI2cOYM7xH8dDl7IUQsHvHxvlTx+Fc/ul6I5u85oZwEA3NdLO8SEdOI/
0oVhy3L0n3OWLZBkAkoN6rTjPQhddgQ=
=atSn
-----END PGP SIGNATURE-----

--1HW3FZOlVDIsEuAs--


--===============7681019234506333315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7681019234506333315==--

