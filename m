Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE9DC004C0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBTzbt+ewn/plKrfyFyCRhssdTBtyJQtnds65EBpNpc=; b=WsIz7Ggpb6klD8NRCUi4EpnWZH
	d28sMKQ57M6JnQsjBj4HRxrDQI/S2u/op0fV/gWQn6zCqLITrEsYwit7h5Zrn3MEX2hJuGE3TcYQW
	k6GViPbIW7ppGFJHolb+I/e7pSL0CDTGhws10JK/rHB4mk2wekgceRKJsgj0S7GCsdbkvtZFuMtvV
	kqQebZbd43MHOwAZaKcEj+qqzfBHjF2sBu6s8lnindwKxOptVg0h3TbVSicbzvfTpJ6M1heo26Psd
	l4wQ/mbdc4kGjjV5q0F8+SfaLWFwyHgSQlkPK2qJCBdM+kAWrG+5W+CrUGEg6vGsQuugasHPQnVhA
	j7z2RZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quxXb-007n3f-2q;
	Mon, 23 Oct 2023 16:12:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quxXW-007n1M-3D
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 16:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 23B88CE2653;
	Mon, 23 Oct 2023 16:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03081C433C7;
	Mon, 23 Oct 2023 16:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698077544;
	bh=qAfQfnASOwEw2I1gSh1b9F780q6nwNnSsTKiLZYyBng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzA9rfZ/HTWtxZjcRBdJNKOSmh83i3j8GjdkLLwpKO0H0+KVvubOCuu+yXp1q2JfG
	 OGjMVjykfulsDO8fMaaVx9FUXu6Nu3/VvFMggrO9hqGdZ+xaL0IIYd8ltX5UMEPFvQ
	 il+Wr8irRSLnuXdHD9OhO4M2f9QxXgeDgUVM0M9eJnVwlzisnooQHfOHhe52seCUBg
	 GiVKIaTeweS00NGn7PW6BZyDjFs41Q4SJ0pgHfyc2Xyn+LLFgBC6Ou8KOGW0bfELDN
	 f3zeAvuMDoqa6I2R+LtuRQyBBVtvQLLog2Onai3b2/bTJmtHOi+eQQkk99hIpbyCmi
	 Ur02VlSxeGaWQ==
Date: Mon, 23 Oct 2023 17:12:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric DeVolder <eric.devolder@oracle.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH 1/2] kexec: fix KEXEC_FILE dependencies
Message-ID: <20231023-grower-riches-76ab00195002@spud>
References: <20231023110308.1202042-1-arnd@kernel.org>
 <20231023-thievish-imitation-c7c4b36d76f1@spud>
 <67ddd260-d424-4229-a815-e3fcfb864a77@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <67ddd260-d424-4229-a815-e3fcfb864a77@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_091227_382356_46B68105 
X-CRM114-Status: GOOD (  17.85  )
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
Content-Type: multipart/mixed; boundary="===============2672749317064531758=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2672749317064531758==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RprDvLMNxjsipoGk"
Content-Disposition: inline


--RprDvLMNxjsipoGk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 06:04:06PM +0200, Arnd Bergmann wrote:
> On Mon, Oct 23, 2023, at 17:37, Conor Dooley wrote:
> > On Mon, Oct 23, 2023 at 01:01:54PM +0200, Arnd Bergmann wrote:
>=20
> >> index 25474f8c12b79..f571bad2d22d0 100644
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@ -687,9 +687,7 @@ config ARCH_SELECTS_KEXEC_FILE
> >>  	select KEXEC_ELF
> >> =20
> >>  config ARCH_SUPPORTS_KEXEC_PURGATORY
> >> -	def_bool KEXEC_FILE
> >> -	depends on CRYPTO=3Dy
> >> -	depends on CRYPTO_SHA256=3Dy
> >> +	def_bool y
> >
> > This being the problem, KEXEC_FILE is 64-bit only.
> >
> > IIRC I commented on this same thing during the original conversion
> > patches.
>=20
> Does it work with this patch on top?

Yah, that modification builds.

rv32 being the redheaded stepchild strikes again :!

Cheers,
Conor.

>=20
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -687,7 +687,7 @@ config ARCH_SELECTS_KEXEC_FILE
>         select KEXEC_ELF
> =20
>  config ARCH_SUPPORTS_KEXEC_PURGATORY
> -       def_bool y
> +       def_bool ARCH_SUPPORTS_KEXEC_FILE
> =20
>  config ARCH_SUPPORTS_CRASH_DUMP
>         def_bool y
>=20
>=20
>      Arnd

--RprDvLMNxjsipoGk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTabYAAKCRB4tDGHoIJi
0ur9AQCKjo1eyI56rDJ+wq7ei6/ptwM4nKPVMtMwxDG4buP1AgD+MNiwYiopmEpR
Rg5VQw4r6QSCMkhYM0xu5fYVvRE9qQE=
=mhv+
-----END PGP SIGNATURE-----

--RprDvLMNxjsipoGk--


--===============2672749317064531758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2672749317064531758==--

