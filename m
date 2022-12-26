Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F707C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Dec 2022 22:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4L7qPihC3XBnzoZAlD0ZUaBChkdhdeCKxJWNeLhYFG4=; b=h0q9jcoHogFfZZRXNRJMDBPULp
	Q7d65IQoccOU66pLcYFpeTkyvxfiz/wueFfz9wQq6hCGVqFXibrsK+V+LGnvZAvN/BHdPKxCyyZ1y
	2HqrUOhCNOE04jRJG4tB991iHham7+zpaAxxn5AVUUjDCE420y8lZLjNGJVnVAoIqW5l9diAxFTiX
	nNUzBh0gTq/Tk/3i7JloPUnP+Jei4jrFcCAQm1FR3IpQKmh5r0tzEHIr5+NLY4iqpKg/wFB73Ueom
	C9Y1HKBXCwzlY2AKbfglrzeRLVugw2a5xj1jnV7C8G9iN5luVIc+kS7KGUnn7D7L/GybwU9qoqgw2
	2w0oLIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9vYJ-007jRt-W2; Mon, 26 Dec 2022 22:02:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9vY6-007jLx-Li; Mon, 26 Dec 2022 22:02:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id ADA14CE0C47;
	Mon, 26 Dec 2022 22:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1732C433EF;
	Mon, 26 Dec 2022 22:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672092137;
	bh=ry6lx+uexHhl+KAnI+uFm4EaQ8KJmvU/sxNXOfCYXu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsdalTDD884x4PWJj5rh7s/dUmy4mcwNC7yb8uxB7yOFTwR+SVlYpUnv9rWhbU4QM
	 UtcPcWhnl+4bs17JHduLwRWmBk/zp9fBW4+NisAuun//upx7NJE8GCS3P1JSX6B2qI
	 s+wc4Za+v28XorBxEVu4xqKa8oZEl30bpl35bGiOMF/h7U1mIPIYmVLlybWALoj49+
	 Zyd13FmdEFRGngRKL0AT85sRbazxODqx2WTz3b1lr91PpRlAt7Oo1iFanVxrUCYE/6
	 yHhTmViJlhlbgMBGJREvC69nIkaoINMO+qqoXlcHLHQa8CbepamcSzfBDXRsPv3axd
	 cw2nqaCZetXEg==
Date: Mon, 26 Dec 2022 22:02:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Dennis Gilmore <dennis@ausil.us>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] arch: fix broken BuildID for arm64 and riscv
Message-ID: <Y6oZ40fEArg7MJGo@spud>
References: <20221224192751.810363-1-masahiroy@kernel.org>
 <Y6hptEk8FmISixLS@spud>
 <CAK7LNAT39aZEw=0209ovYZ2kxtOaA2a51=XD9=LqYHjkTOEK4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK7LNAT39aZEw=0209ovYZ2kxtOaA2a51=XD9=LqYHjkTOEK4g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_140223_117358_7FF1ACB0 
X-CRM114-Status: GOOD (  31.30  )
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
Content-Type: multipart/mixed; boundary="===============8160055462241367762=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8160055462241367762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3A7DtNG3krRkXmgE"
Content-Disposition: inline


--3A7DtNG3krRkXmgE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Masahiro,

On Tue, Dec 27, 2022 at 04:06:35AM +0900, Masahiro Yamada wrote:
> On Mon, Dec 26, 2022 at 12:18 AM Conor Dooley <conor@kernel.org> wrote:
> > On Sun, Dec 25, 2022 at 04:27:51AM +0900, Masahiro Yamada wrote:
> > > Dennis Gilmore reports that the BuildID is missing in the arm64 vmlin=
ux
> > > since commit 994b7ac1697b ("arm64: remove special treatment for the
> > > link order of head.o").
> > >
> > > The issue is that the type of .notes section, which contains the Buil=
dID,
> > > changed from NOTES to PROGBITS.
> > >
> > > Ard Biesheuvel figured out that whichever object gets linked first ge=
ts
> > > to decide the type of a section, and the PROGBITS type is the result =
of
> > > the compiler emitting .note.GNU-stack as PROGBITS rather than NOTE.
> > >
> > > While Ard provided a fix for arm64, I want to fix this globally becau=
se
> > > the same issue is happening on riscv since commit 2348e6bf4421 ("risc=
v:
> > > remove special treatment for the link order of head.o"). This problem
> > > will happen in general for other architectures if they start to drop
> > > unneeded entries from scripts/head-object-list.txt.
> > >
> > > Discard .note.GNU-stack in include/asm-generic/vmlinux.lds.h.
> > >
> > > riscv needs to change its linker script so that DISCARDS comes before
> > > the .notes section.
> >
> > No idea why I decided to look at patchwork today, but this seems to
> > break the build on RISC-V, there's a whole load of the following in the
> > output:
> > `.LPFE4' referenced in section `__patchable_function_entries' of kernel=
/trace/trace_selftest_dynamic.o: defined in discarded section `.text.exit' =
of kernel/trace/trace_selftest_dynamic.o
> >
> > I assume that's what's doing it, but given the day that's in it - I
> > haven't looked into this any further, nor gone and fished the logs out =
of
> > the builder.
>=20
>=20
> arch/riscv/kernel/vmlinux.lds.S clearly says:
> /* we have to discard exit text and such at runtime, not link time */
>=20
> riscv already relies on the linker not discarding EXIT_{TEXT,DATA}
> so riscv should define RUNTIME_DISCARD_EXIT like x86, arm64.

Huh, fair enough. The diff for that appears to be trivial, but I was not
able to correctly determine a fixes tag. I may have erred in my
history-diving, but it's a wee bit hard to determine the correct fixes
tag. That comment about runtime discards appears to date back to
commit fbe934d69eb7 ("RISC-V: Build Infrastructure") in 2017 -
apparently pre-dating the addition of the define in the first place.

Commit 84d5f77fc2ee ("x86, vmlinux.lds: Add RUNTIME_DISCARD_EXIT to
generic DISCARDS") added it to x86 but not to arm64 - but it seems like
it was added to arm during a later reword. Does that make 84d5f77fc2ee
the correct one to mark it as a fix of & riscv was just overlooked when
the define was added?


> Anyway, I came up with a simpler patch, so I do not need to
> touch around arch linker scripts.
>=20
> I sent v2.
> https://lore.kernel.org/lkml/20221226184537.744960-1-masahiroy@kernel.org=
/T/#u

Sweet, thanks. Hopefully the automation likes that version better :)


--3A7DtNG3krRkXmgE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6oZ4wAKCRB4tDGHoIJi
0vx8AP9KqS1+Wa8jonc1+vZRskZt+Z6ZPC4i6vIUI3Y9GBVSwgEApJRM44pmtZPa
H1qE+gJ/vNyix6QqYiMlLy5OV2vFwQo=
=FbKh
-----END PGP SIGNATURE-----

--3A7DtNG3krRkXmgE--


--===============8160055462241367762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8160055462241367762==--

