Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F1FC79FBF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RU+Ljubqf1Pklfm0YOw5l6BjcrWSTHtPOZ+3ktymbw=; b=a2H2/7630vBmWSgw/i60gmRXMZ
	QPQPczKRsAKtz6PE+HA2Yb2RO9FNsHHXMR6CqdNANnZwk409Zr83x6XoqgvFSUSpR22LdTR03jHeo
	ijky+7TRmuyY9tS0ZiBWWPNFOyDCY6c24+cgvpXuBMt83e37AG9EPAsnGynUI7nb6gFjoD4HNEInm
	V4M27hvbmTM1pZxQ2HPZMusWFdQrE8HjHHfj9XFOA8OgSfem1tu4WJ0cwLRyKWzLHCBN8r2ZbivjM
	qBYRhIZ0t1KCSdArDsMISszsy9mdA47ZJqAXRPmXmU1XyiifqAsOKRmpszVCs+cE/8XfaC/AtM1MP
	1g/D+6CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gvJ-0000000EqOr-37x6;
	Thu, 10 Sep 2026 15:42:49 +0000
Received: from mail.avm.de ([212.42.244.94])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gvG-0000000EqLN-1QBE;
	Thu, 10 Sep 2026 15:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789054956; bh=LK8bkV1Vz0floem0tDs4fowSkN+VH/bI8JorqlPfxFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2t/gCBQ5Ji+klRB77okzADkIBpOjucABpFdn1joI6CGFroNQ2dok89iTW7zlsgDJ
	 OhupApf9LKIRvcGE2XGbdgRc1L/Cyu778E8qiCt5Mx3N/HSwPKfTDWrLuQBULuYETh
	 DEpZTMKIWNIB95kcOEYyM+KTdXBA1kly0af9dVc2J1yCQpvugpbSIq04iHmdW/EGZ3
	 Y4A/qaU5/ks6TeFtBhGFS/mS3OdzSq+oJRGgjHfaRsaS82LquTqTSeUDZk3Yd/dQog
	 lg48YsTm0IrzSWtTPbK8Ble4vH9U4bTyk8isOlH6ribTe1cTR6+aKHV2VGyYR9cK7K
	 zTVgF+ct8Jfhw==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aa2cfec-6dc7-7f0000032729-7f000001a7b2-1
	for <multiple-recipients>; Thu, 10 Sep 2026 17:42:36 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 10 Sep 2026 17:42:36 +0200 (CEST)
Date: Thu, 10 Sep 2026 17:42:35 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker probes
Message-ID: <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
 <178901395292.3971858.13236774094648272066.b4-review@b4>
MIME-Version: 1.0
In-Reply-To: <178901395292.3971858.13236774094648272066.b4-review@b4>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789054956-F1CDF0BC-4895A414/0/0
X-purgate-type: clean
X-purgate-size: 2705
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: 9AB3CA045E  external: no
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_084246_530072_22F8234E 
X-CRM114-Status: GOOD (  17.13  )
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
Content-Type: multipart/mixed; boundary="===============0524538675177290970=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0524538675177290970==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6NJv2EjhorC/TYUZ"
Content-Disposition: inline


--6NJv2EjhorC/TYUZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 09:19:12PM -0700, Nathan Chancellor wrote:
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 8583d9f06c52..3c92c87254a3 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -144,6 +144,44 @@ config CC_HAS_ASSUME
> >  config CC_HAS_NO_PROFILE_FN_ATTR
> >  	def_bool $(success,echo '__attribute__((no_profile_instrument_functio=
n)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> > =20
> > +config CC_HAS_ZERO_INIT_PADDING_BITS
> > +	def_bool $(cc-option,-fzero-init-padding-bits=3Dall)
> > +
> > +config CC_HAS_NO_STACK_CLASH_PROTECTION
> > +	def_bool $(cc-option,-fno-stack-clash-protection)
> > +
> > +config CC_HAS_NO_ADDRSIG
> > +	def_bool $(cc-option,-fno-addrsig)
>=20
> I am generally in favor of this proposal since I think these checks
> should be cached by Kconfig where possible to clear up running them
> twice. That said, I wonder if we should pick a better dumping ground for
> these checks other than init/Kconfig. Maybe init/Kconfig.tools or
> scripts/Kconfig.tools or something?

Yes, skimming through the patch, I thought about that, too.  Moving more=20
cc option checks to Kconfig will make building out-of-tree kmods with a=20
different compiler more dangerous.  Maybe we will have to make the=20
warning in Makefile's prepare (external kmods) target a bit louder.

> I also worry about backsliding and growing cc-option checks. Should we
> update the documentation to state that it is preferrable for these
> checks to live in Kconfig so that they can be properly cached?

Sounds good, yes.

--=20
Nicolas

--6NJv2EjhorC/TYUZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmqiz+cACgkQiMa8nIia
bbgNERAAgCLMWkWnCF5POqjQiZGkZbm/i9SwwH2BVVg0H8Bf+O6WGCZ4YiM0NOu7
6d9EZV95NkDD36Y3vCEaq1/GclFeUn2ET6HEprS7tQsmYbcofxLYoQuMV/5Si/18
jJBz3eksIZYRAnSFGG6K1+Hq3u63l3cV5TmRaquZg76LwJkTjCNsFmfT2wxHP40y
LmkyOsw9NiHo2Bm75Bz8ds7EVqHU/wPxCAWBuiw6ervOrw4RR7PURz61DaBGIuOc
9B/HnhACn44debha9z9dUTsDIsPsK2sftFLfgJvD8c1V8vj6D1uhX7Fx/hXRElRA
srsyf2q67EuQ8hKIU8sch6rKkD9slQJd0/w2XNQsONffnO9RghF+Qu8dzo9mUusZ
l1vYg30SglV5c7m1FlgCvvmvJSppryu6zZw4FgzOUTfcxt6l+VXTm9jaigCWPXbT
KAYgvQqNVVgkIAg2WDqyiVTeWQxrxo9ctf3m/6srxI4/AkuGZV/XU2m1QiQJxQ5/
rdm3WGYjD/gVrLPBr6oIoPWDSgP7C4U4kSuZGq1jWAhPeqaa691z+Z5WbRVoVDO/
SEc1cIdDE88/z8QwIEsgmaXaVhnaCiW66Npfh9zP1J+/pQV3kvU4kf9CIEQ6QMDf
MPfl1Si0rJA9thzauvNi6Mu6JsUi9FPz7+Oen1Y22eMfv2st6Sc=
=TUj9
-----END PGP SIGNATURE-----

--6NJv2EjhorC/TYUZ--


--===============0524538675177290970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0524538675177290970==--

