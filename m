Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3077AC4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 15:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogdpqiFFDcdw0/0MQqxpx8ekqYwqCALSk0YzkwEO6mg=; b=pLJuNs4YYdzg25LPRPMn07Mofg
	u/Jxzn+lar9TmHgCLZdK/13j+WISXthCUiXPxNrYru0OgGSN0rs0qurzt96tma+ZmqOQWhhrpkXf+
	iu4BpGg9OqacCCfAg1zH9uZEXsmUMk3595u7opQtgPUUk9sZ5es33PNOHGg6ICzJ7gQDFneqI5Ew3
	bh9KsC9qQGTiLiIPx8d466WX0wxPvT6G4FL5cHBgdpwuCpNPYHh9FLzJSu3bvT8vqRwRKpY3ASYeo
	hFV3Il9MnA3nQNgvKQfu6QiDweTNko0/SLUT5b8TA/EXjSNMoqB7FRjpqi9m8UmMtt/Mxz5iKw6jF
	Ef1Ukxjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYSe9-0000000HLL9-0faq;
	Fri, 09 Feb 2024 15:18:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYSe6-0000000HLKh-17qW
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 15:18:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BF5761D9F;
	Fri,  9 Feb 2024 15:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC62C433C7;
	Fri,  9 Feb 2024 15:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707491909;
	bh=qsEohGDlLb5D6DJLRfIDcQFTUfVGUCeWwneA1f1Lcq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e84l+KMQC9NBIrXYUXkAX7vePQw7RIDj6eTwmZptCjhNJwjV09bzS+TA3v7x9PL20
	 VhodEm4/wktAFiIgm9a0Ra/aI1NWfBYhhq7P1/fi46rVq77YvPNytX7FAEQ8m0lyCm
	 fml3Tbe7OJ8/V1Ra234KnVF7h3kaOPCd1711Om/tOp4U55fqoqGt/ufvIbi3AZBGw+
	 J2lVHp1hUcBU1gdYyXZNQpVwHo+35aORpEAmhMb9KfvO1zawHyxiePWJq7HWV+M905
	 Xs/SkkoiCxY3ymG5k5HDgbZnkOD+nlzBseccKvsANiMS1td65W/KsfOYnQSJRl/iNp
	 Qauf5rYHZVmDQ==
Date: Fri, 9 Feb 2024 15:18:22 +0000
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
Message-ID: <20240209-rage-keg-1b2982cd17d9@spud>
References: <20240117-swiftly-parasail-618d62972d6e@spud>
 <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud>
 <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy>
 <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy>
 <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud>
 <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_071830_373174_B075B192 
X-CRM114-Status: GOOD (  15.19  )
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
Content-Type: multipart/mixed; boundary="===============5417401980508138667=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5417401980508138667==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CHccunpyRzIcwl0N"
Content-Disposition: inline


--CHccunpyRzIcwl0N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 27, 2024 at 02:46:38PM +0100, Miguel Ojeda wrote:
> On Fri, Jan 26, 2024 at 11:01=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > Is that even needed? We already have ARCH_SUPPORTS_CFI_CLANG and AFAIU
> > rust supports it if clang does, so a second option is superfluous?
>=20
> From a quick look, I don't see it enabled in any RISC-V built-in
> target in `rustc` yet.
>=20
> It may also still be the case that KCFI needs some tweaks for, say,
> RISC-V, before the flag actually works, i.e. we couldn't just test the
> flag in that case -- Ramon: how likely is it that RISC-V would work if
> KCFI works for aarch64 and x86_64?

Well, there's been no reply here. I'll do sa you suggested and add a=20
depends on !CFI_CLANG to RUST.

Cheers,
Conor.


--CHccunpyRzIcwl0N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcZCPgAKCRB4tDGHoIJi
0v5zAQCzZ7t4RKWWhpbT+/YlhCexHgJAtD+HTzNc09+i1Ph0HwEAhd/NiiTHdmkJ
LbqEznQmgueGJZpHS5dLO20wBGVAUgA=
=q5/s
-----END PGP SIGNATURE-----

--CHccunpyRzIcwl0N--


--===============5417401980508138667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5417401980508138667==--

