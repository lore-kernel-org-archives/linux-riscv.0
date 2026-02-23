Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6F7EC1104
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDbU0NAGYX7SWfHofU092i/vZiYhHlFvGsWHGJn/AAg=; b=CAuA80tfUrZraqt7LEhxG2HAp2
	sHmVNm89aE2eDxLmg2JWQELY6Gc31st1D8tS8lUM/YLlylAuhKK4mHSClieKf7P2aGr1sLgJEj6M9
	5aQxRNme4bc1vIxuhJ0mtOO7DDTL+XhDoMuymYTRBMl+69nShgCErQ6mOmpFytZEvIzVLSZHd8OC9
	LIKKZ/Vi6NrB0wx0TvkGsxDrGIQJiqDkf5BSzJvPnpdZj8R2dufbqrQfx7AROfBwvr2YPsacTVkdY
	J2xRHe/1qK+TwhwmmZOcgVAh/SW/hIl2YFLZDmgUBzGCSUZyMbGoQXOR2lJTKtcPpj6M6+YaNGMHh
	Yhuxt92w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYo6-00000000ggd-0xkt;
	Mon, 23 Feb 2026 16:29:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYo4-00000000ggK-1Syk
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 16:29:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C6CE60123;
	Mon, 23 Feb 2026 16:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E3CC116C6;
	Mon, 23 Feb 2026 16:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771864150;
	bh=V8MCg8JxTBTc1LXnILzTBwpz2fPHtDQfHJM/Xxnk7Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jr+8mPX9vgCWsq/ucbX61sM0Cd2e5uIvfEupzEo+OcX0qo3vTuUn4F9nrvq+qTSsQ
	 p46bxm6FC/GpbvBTOFLNPqp3tf3rh1TIljVD+JIB8+aaGsDCzNjXXK8vKW7U7zXxYz
	 drhBBZtrFdUEALGlRgp2HQzWLWdZxjaIX99szosPRXfwFMezDtbfheKa8lbnqhzc7z
	 uOn7yIfxfz7DJEFqnbDVcgNIGAqC8LKEjzMSBl5bRRr1OIeAbh7fCKw/5eU+SoNUer
	 KCF+yUS6wqxouazitkTRI9+HmUNM8m1EU14OPE/zCiSHfIIhl1WnLc0FdjnuFJ9Lb9
	 f0FUTMQA2V0Mg==
Date: Mon, 23 Feb 2026 16:29:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com, palmer@dabbelt.com,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mark Rutland <mark.rutland@arm.com>, paul.walmsley@sifive.com,
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com,
	eric.lin@sifive.com, vicent.chen@sifive.com, zong.li@sifive.com,
	yongxuan.wang@sifive.com, samuel.holland@sifive.com,
	olivia.chu@sifive.com, c2232430@gmail.com, arnd@arndb.de,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev, pjw@kernel.org
Subject: Re: [PATCH v4 10/12] riscv: Implement
 HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
Message-ID: <20260223-garlic-sulphuric-0c1574608d09@spud>
References: <20250407180838.42877-1-andybnac@gmail.com>
 <20250407180838.42877-10-andybnac@gmail.com>
 <20260221-repeal-emphatic-ddc2e9b94208@spud>
 <CANk7y0iTjHUBK66xx50b-eT=ssz9g0moFjOhCmipQC1SzkGs5g@mail.gmail.com>
 <20260223-respect-chaste-60c3403b5bc9@wendy>
 <CANk7y0jdzCeFaLVpj6-mnWiSZvv+rJF=9kgWDYF7g_rjCpiYsw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANk7y0jdzCeFaLVpj6-mnWiSZvv+rJF=9kgWDYF7g_rjCpiYsw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2324118880590778463=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2324118880590778463==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gW4htCybjdexQ6TR"
Content-Disposition: inline


--gW4htCybjdexQ6TR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 03:41:26PM +0000, Puranjay Mohan wrote:
> On Mon, Feb 23, 2026 at 3:28=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Mon, Feb 23, 2026 at 03:18:17PM +0000, Puranjay Mohan wrote:
> > > On Sat, Feb 21, 2026 at 12:15=E2=80=AFPM Conor Dooley <conor@kernel.o=
rg> wrote:
> > > >
> > > > Hey,
> > > >
> > > > On Tue, Apr 08, 2025 at 02:08:34AM +0800, Andy Chiu wrote:
> > > > > From: Puranjay Mohan <puranjay12@gmail.com>
> > > > >
> > > > > This patch enables support for DYNAMIC_FTRACE_WITH_CALL_OPS on RI=
SC-V.
> > > > > This allows each ftrace callsite to provide an ftrace_ops to the =
common
> > > > > ftrace trampoline, allowing each callsite to invoke distinct trac=
er
> > > > > functions without the need to fall back to list processing or to
> > > > > allocate custom trampolines for each callsite. This significantly=
 speeds
> > > > > up cases where multiple distinct trace functions are used and cal=
lsites
> > > > > are mostly traced by a single tracer.

> > > > >
> > > > > Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> > > > >
> > > > > [update kconfig, asm, refactor]
> > > > >
> > > > > Signed-off-by: Andy Chiu <andybnac@gmail.com>
> > > > > Tested-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
> > > >
> > > > I bisected a boot failure to this commit [c217157bcd1df ("riscv:
> > > > Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS")] yesterday, that appe=
ars
> > > > to be affecting all LLVM versions that I currently have installed. =
=46rom
> > > > some initial testing of Kconfig options, it looks like the issue is
> > > > CFI_CLANG related because when I disable CFI_CLANG things work once
> > > > more. Since this option depends on !CFI_CLANG, but is def_bool y, I
> > > > modified Kconfig to force disable it at all times and tested
> > > > !DYNAMIC_FTRACE_WITH_CALL_OPS && !CFG_CLANG, which did boot.
> > > >
> > > > I dunno anything about what's going on in this patch, but so little=
 in
> > > > it relates to having DYNAMIC_FTRACE_WITH_CALL_OPS, that I was able =
to
> > > > figure out that the problem is -fpatchable-function-entry=3D8,4
> > > >
> > >
> > > DYNAMIC_FTRACE_WITH_CALL_OPS can't work together with CFI_CLANG.
> > >
> > > arm64 has:
> > >
> > > select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
> > > if (DYNAMIC_FTRACE_WITH_ARGS && !CFI && \
> > >    (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))
> > >
> > > would need something similar for riscv if not already done.
> >
> >
> > I think you've misunderstood my email. We already have:
> >
> >         select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS if (DYNAMIC_FTRACE_WIT=
H_ARGS && !CFI)
> >
> > The problem is that the patch broke using CFI_CLANG, due to the
> > fpatchable-function-entry change.
>=20
>=20
> Yeah, sorry I did not see the patch,
> the original one I sent had:
>=20
> +ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS), y)
> +ifeq ($(CONFIG_RISCV_ISA_C),y)
> + CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D8,4
> +else
> + CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4,2
> +endif
> +else
>=20
>=20
> The basic Idea is that we can't put nops before the function entry
> when using CFI_CLANG, because they both interfere with each other.
>=20
> the fix should be something like:

Ye, this is what Nathan and I both did locally, give or take. I just
wasn't sure if this was actually correct to do or if it was just
papering over an issue with our CFI support. Do you want to send this as
a patch?

>=20
> -- >8 --
>=20
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 371da75a47f9..94100810a6a4 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -14,11 +14,19 @@ endif
>  ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
>         LDFLAGS_vmlinux +=3D --no-relax
>         KBUILD_CPPFLAGS +=3D -DCC_USING_PATCHABLE_FUNCTION_ENTRY
> +ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS),y)
>  ifeq ($(CONFIG_RISCV_ISA_C),y)
>         CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D8,4
>  else
>         CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4,2
>  endif
> +else
> +ifeq ($(CONFIG_RISCV_ISA_C),y)
> +       CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4
> +else
> +       CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D2
> +endif
> +endif
>  endif
>=20
>  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
>=20
> -- 8< --
>=20
>=20
> Thanks,
> Puranjay

--gW4htCybjdexQ6TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZyASgAKCRB4tDGHoIJi
0ipLAP9rwb/PDaE+bILOLjsj+tOWGZpG2udHnJniirLzWBbsPgEAyN9wZ55T41u/
kQpB7PGNIlR8JZt4LkDVrfaNS6czeQY=
=Odj9
-----END PGP SIGNATURE-----

--gW4htCybjdexQ6TR--


--===============2324118880590778463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2324118880590778463==--

