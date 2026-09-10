Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40800C79FBF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQZxMPzZtgRmqMvhie+394LNZc7ROLoQdZ18/B/7PzE=; b=LWEGnh37uo73UPZ2OnsYWiilzQ
	MRiLA+cItCO9A/jyXytvj6ZLfFs3jLjddTtEPHISuy4KHIhm09JKf7XcryN4JQGBLpbrTzVPkewsq
	Fmf9iGj7Co+QXrB+vuUjidAlY4jqtR84B1GJnBaPmUkX6syg9PaM+qZ0+UAX0oX7mtJjcHoQqMRKE
	EutK7wc4zEr7/5e+RTuilF6S/NA7SN2EOSeg1uQpz7mp3kDsnm4WdqoFKoru2n3ZEAoiPPpPLuMfU
	nZPSZeF48zrFJLvxx3uRa1nPiVYp75grPGP68Gd6iSpoAoYVILdQymbJUl6njyKvtFh5dfDKU84A+
	33yU2lOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4h1I-0000000Erig-3LkB;
	Thu, 10 Sep 2026 15:49:00 +0000
Received: from mail.avm.de ([212.42.244.94])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4h1F-0000000Erh1-3YFi;
	Thu, 10 Sep 2026 15:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789055335; bh=uuZUs8CyGKyoIbJX7p5GwQ6gTH4+NO01yolE0a/TQxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kw5yKkpRe/Y1tmb9JymSosqjJQjw2qgzZ9KZZqyOmhAQAxTz5HEFZqrYiX3oICPQf
	 ckaNlryfcAgmbWmlTplxNOFmSwApoY77UM024WyrBpNuKJop80mERVjlCKBEsV9h7C
	 U5HBWhhLjMM6uGRzezT0msAoFEspWJUThjDU6syaNqM3YlOIMpkIA4pPasaGQMpeVt
	 DczFspQ1hYXtkffJ+qQHHDqf1EuOrSJn4XAkOwXtyaoUeBU83fAAIFx8iLVtR2o5OB
	 2Bci4tkbqtQ5t/TTxOYveG5IbW5M45rNI+QR0L4wqde5mduY4arbUKWhFjFdZ3inb1
	 SJ8Nm0uv2d06g==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aa2d167-6dc7-7f0000032729-7f000001b250-1
	for <multiple-recipients>; Thu, 10 Sep 2026 17:48:55 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 10 Sep 2026 17:48:55 +0200 (CEST)
Date: Thu, 10 Sep 2026 17:48:53 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 16/23] kbuild: batch module finalisation
Message-ID: <20260910-nondescript-fierce-wapiti-de1cea@l-nschier-aarch64>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-16-5dc1ac01672d@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260908-build-speedup-v1-16-5dc1ac01672d@kernel.org>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789055335-064A40BC-80480D36/0/0
X-purgate-type: clean
X-purgate-size: 4263
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: 2B66AA0198  external: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_084858_035224_368E4F92 
X-CRM114-Status: GOOD (  25.82  )
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
Content-Type: multipart/mixed; boundary="===============5740259018098500306=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5740259018098500306==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4KfRRQPTJ7GRTheh"
Content-Disposition: inline


--4KfRRQPTJ7GRTheh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 09:55:16PM +0100, Lorenzo Stoakes (ARM) wrote:
> Module finalisation on allmodconfig builds consists of a large number of
> very short-lived jobs, and the make job dispatcher cannot possibly dispat=
ch
> jobs fast enough.
>=20
> For allmodconfig x86-64 this can be on the order of ~22,000 jobs of a few
> milliseconds in duration each.
>=20
> However per-job cost grows with the variables the instance holds, here the
> savedcmd_* of every .mod.o and .ko read back from the .cmd files, since it
> walks them all to build each child's environment.
>=20
> This makes module finalisation very inefficient when large numbers of
> modules are being built.
>=20
> Fix this by splitting modules.order into chunks of 128 at a time, run in
> parallel.
>=20
> Each instance holds only its own modules' variables and the top-level one
> reads no per-module .cmd files at all, the same rules serve both levels,
> and an instance is told its chunk with modfinal-first=3D<index>.
>=20
> "make modules" with every *.mod.o and *.ko deleted goes from 28.9s to 15.=
9s
> with clang 22. No-op "make modules" goes from 5.6s to 4.8s, as checking t=
he
> 22,000 targets is spread over the chunks too.
>=20
> Whole build, 128-thread Threadripper 9980X, best of N runs:
>=20
>                                          before   after     delta
>                                          -------------------------------
>   x86 allmodconfig, no-op make, gcc         1.9s     1.2s    -0.74s (-39%)
>   x86 allmodconfig, no-op make, clang       2.4s     1.6s    -0.77s (-32%)
>   x86 allmodconfig, clean, gcc            304.5s   291.4s     -13.1s (-4%)
>   x86 allmodconfig, clean, clang          301.7s   297.0s     -4.7s (-2%)
>=20
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  scripts/Makefile.modfinal | 26 +++++++++++++++++++++++++-
>  scripts/mod/sumversion.c  |  4 ++--
>  2 files changed, 27 insertions(+), 3 deletions(-)
>=20
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 75e9effdf02c..858fa798090b 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal

[...]
> diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
> index 2cbadd3cd97d..5501d6aa0bea 100644
> --- a/scripts/mod/sumversion.c
> +++ b/scripts/mod/sumversion.c
> @@ -249,7 +249,7 @@ static int parse_comment(const char *file, unsigned l=
ong len)
>  /* FIXME: Handle .s files differently (eg. # starts comments) --RR */
>  static bool stop_char[256];
> =20
> -static void init_stop_chars(void)
> +static void sumversion_init(void)
>  {
>  	static bool done;
>  	int chr;
> @@ -274,7 +274,7 @@ static int parse_file(const char *fname, struct md4_c=
tx *md)
>  	len =3D strlen(file);
>  	if (!len)
>  		goto out_file;
> -	init_stop_chars();
> +	sumversion_init();
>  	buf =3D xmalloc(len); /* File output buffer. */
> =20
>  	for (i =3D 0; i < len; i++) {
>=20
> --=20
> 2.55.0
>=20

(I have only skimmed through, not yet reviewed this patch.)

The change in sumversion.c seems to be wrong here.

--=20
Nicolas

--4KfRRQPTJ7GRTheh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmqi0WIACgkQiMa8nIia
bbg5EQ/+NGRAk8Ctc+X1OAU6pfHnSz6kq0kRgbNGW5OX2SXnhplNS7CMXxqLkUbZ
SQAY69x1eLH/K0A4j5Memv4kYSDGoAEawgiydt9wSZuQDi1eDhGnDC1T9q74bds3
uDrrnCbLogaoGnhXm4g7WcWVmdx+6rKgupL8kFDt4XQbrPVh2lsE5R5KfWvGWyH8
w/btnaniJv5lTR37xXrMWBXfPqxJY/uhiXW2Tov+iqO/sAdeIhGXWEgc5SPwx3qB
T0rZdFYTfeJ3BCXJF7x96X19HqORTftMzE4rOQtAwBebquwVV86tVUhPlKub/VpJ
I2KhiqAspQ+QME+xDGib76j3Z0HD/lm9ARByIO5hbBYHkBmXsOhTXdIDY5gTYm2e
I52eUWyf2CVwty/1aKNHQnDxo+N45dX9srD7ZbC3OUVSJqLG8oHOKoNGcsUmvVeO
egN83lroNk0UqyLlvugHgIMi01bNORXUn68pMrzto85iBXlaV0/6zAwpZSNe8fY5
ofrc7hzoQLkNNJJORkOXjdCdVAuAN+pCcTHLdQ84dMOviKCd4fLEDlpcV6b3kjFe
Jbu0Sqx0Cy41+Fwh7jmxXTRWhWCWnzpL3GFV65F4wdZtV2ajgaqsOPQfTpnz0yu5
5iDFJMVpe9pqv7hLuXGIlIYpxmQpm0gEeLqvZE72mDwn5IM2qyM=
=oTTk
-----END PGP SIGNATURE-----

--4KfRRQPTJ7GRTheh--


--===============5740259018098500306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5740259018098500306==--

