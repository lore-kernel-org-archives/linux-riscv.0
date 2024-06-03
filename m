Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B877C25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h65/7ePeptAsVUuY/Pv4j7L9IDXyUp3tCOTOHvQUm7Y=; b=AAB8GfN6NUXGRbwDvopeQLJwkW
	GWxvtylvLW6iUEQNhN284dyCA3jAPMq7+OUXEZr2wvbczMgomnKaRysXmrFHWkc2h2P2d1OmNFHxY
	tcbCV/HJ4ASb4NXpHc8M9bSv/CRFz8a+1I66I2hCXwvHApjpejpwANujQ+5BYcd8wjVoytM0uYoDs
	RiqfCVRPyKwZ383/fM0QIR3vqjl5mlQpaFR6TjUpu0N0ULpsRAVmFZDd+BP3RyDB42d+N3cmcfgtO
	1KxP7hm2ahWyP0XuXpAsCz25en1n4x2JmkNchDHy+wQAxLKsVh4Cfj472bTO+zQy2X5PRed678VKl
	MnChE4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE76M-0000000GkAZ-1qbq;
	Mon, 03 Jun 2024 12:47:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE76J-0000000Gk8j-2ddt
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 12:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E942560DE7;
	Mon,  3 Jun 2024 12:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AA1C4AF07;
	Mon,  3 Jun 2024 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717418864;
	bh=xjvuuOdnqOIhK5ZBtlN6ndKEQrQUjVsyjGmdjk8KDM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jx9j+DBzZp16t8GUoTabwdp9sySO5qFu4XyiaobyhE0bWZwGYAOot9E1RKFHAGYn1
	 RFsK6myrrIx2X2exvfkwD06gQ3WHr6ZYP0rC6kRpLfp+Yw6+qyPFIJ3wNt2Do8lDRw
	 XlKSVa+zhpiYpdo4ATR6iTBlhCqmlI3pK90eRLAdF6y3vgSkOu2HfFxLuH0vBaSdb0
	 8Nb4ZCCxOVH8GQ/30htNKhSoPm2sqqExt91urxrj4zWKfMiSKE7BtkWjaZBi3V02Dl
	 cvSBUIfXhsLmcP4umDOyuEW90vH3ruTPyFgiFAQYhyREH7WHaicWHcBssMiWSzb+HU
	 BrCqREjhNes9g==
Date: Mon, 3 Jun 2024 13:47:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <20240603-stinking-roster-cfad46696ae5@spud>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_054747_832671_E136E578 
X-CRM114-Status: GOOD (  29.44  )
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
Content-Type: multipart/mixed; boundary="===============5438137588542720607=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5438137588542720607==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iJdrl4qDKkXrEMBS"
Content-Disposition: inline


--iJdrl4qDKkXrEMBS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2024 at 11:14:49AM +0200, Alexandre Ghiti wrote:
> Hi Conor,
>=20
> On 31/05/2024 19:31, Conor Dooley wrote:
> > On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
> > > Dectect the Zkr extension and use it to seed the kernel base address.
> > >=20
> > > Detection of the extension can not be done in the typical fashion, as
> > > this is very early in the boot process. Instead, add a trap handler
> > > and run it to see if the extension is present.
> > You can't rely on the lack of a trap meaning that Zkr is present unless
> > you know that the platform implements Ssstrict. The CSR with that number
> > could do anything if not Ssstrict compliant, so this approach gets a
> > nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
> > it, so you're stuck with getting that information from firmware.
>=20
>=20
> FYI, this patch is my idea, so I'm the one to blame here :)
>=20
>=20
> >=20
> > For DT systems, you can actually parse the DT in the pi, we do it to get
> > the kaslr seed if present, so you can actually check for Zkr. With ACPI
> > I have no idea how you can get that information, I amn't an ACPI-ist.
>=20
>=20
> I took a look at how to access ACPI tables this early when implementing t=
he
> Zabha/Zacas patches, but it seems not possible.
>=20
> But I'll look into this more, this is not the first time we need the
> extensions list very early and since we have no way to detect the presence
> of an extension at runtime, something needs to be done.

Aye, having remembered that reading CSR_SEED could have side-effects on a
system with non-conforming extensions, it'd be good to see if we can
actually do this via detection on ACPI - especially for some other
extensions that we may need to turn on very early (I forget which ones we
talked about this before for). I didn't arm64 do anything with ACPI in the
pi code, is the code arch/x86/boot/compressed run at an equivilent-ish point
in boot?

--iJdrl4qDKkXrEMBS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZl27awAKCRB4tDGHoIJi
0qGGAP0dROI2kQOiSz/LUNHcEMeZPOeCAtT2w2ieJ5CnnqdxFAEA0+On5DOHDyHW
ScDD2IjkJxreOi0zn1lj8uq2WccodwI=
=fWLb
-----END PGP SIGNATURE-----

--iJdrl4qDKkXrEMBS--


--===============5438137588542720607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5438137588542720607==--

