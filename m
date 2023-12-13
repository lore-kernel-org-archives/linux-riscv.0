Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483C2C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssL8M+K+0ge/Li5DpTcpEbM+aVdl7jT78WvX7EwPXRk=; b=X2EgTjC9hSOPSq7lYYqbkch9Ra
	eSFxeh2ouV7hZHaOxdRFJtA6sybLlWTMrNLyLIjsdtRQQ2doU1hwNP4hd+Dr2ryCGEO+WBQnP7qnq
	EFReVCb69qel8kWgxmZ74G4XHL7pfgCKYKHp58ZwHfKD/p/eR83AXDSK4zohxcKDJnsgSryThVfmY
	2D2moRnYYY6eJ3hhCKp6iEjQVSonQJUwlsraZkahgPC5VEqN5e5JhU1cruPNgH0sL3BOjzfJQG81u
	ry3vYXZ6T0dGlyvWZNofmxtPhkPkgmJJSdCEubEEwuas2RL0K2gWZ9kTbMOKKkkgSo6E45K2I1TLS
	V9LMW9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOnX-00Ei1j-05;
	Wed, 13 Dec 2023 12:57:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOnT-00Ei0y-26
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 12:57:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4D80CB81D6D;
	Wed, 13 Dec 2023 12:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243D0C433C7;
	Wed, 13 Dec 2023 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702472225;
	bh=5neyQLlIsWkVQ2qC/3BqHS/hcTbEBUuFcUcD3NBeG0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HR5wn3Vc92O0f9VH/KvOhlRbDK6cnTIzdbBfU7+Im7txS9/EYwh+f3J/O0TzyoblJ
	 7rElQ0qgoIssF7p525GEvCg5DL3fYjZEEuetWKZW4tPt7ISoXwa2G0w0VQI0Na6Vb7
	 +HScxFJgAr4LmbJ5CKhpzzm9yBPajUCkf+/TQVYK8tp1bYMZ00OqIymfOFhKyV/BQI
	 6NlzllRYkn2QD8WZ/KqfQ3lv8SWwrwEqg7ycvwerufxvI2e7/zZGxSS1JWDxQGDQyR
	 8WlDxQkrqzv0Egy1zNc1AmcsMvU31n7SPqHSLFxHoM6s21UPxtytLk0H+n9c6GXfw3
	 nyPKPtITtrC6Q==
Date: Wed, 13 Dec 2023 12:57:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: linux-next: Tree for Dec 11 (riscv32: patch.c)
Message-ID: <20231213-excretory-ashen-03a34f3a4c90@spud>
References: <20231211172504.058ad6b6@canb.auug.org.au>
 <9f0763c0-8175-4160-b72e-8e9e3aee42f8@infradead.org>
 <CAHVXubjbVxEvL01uu_Cm-_R8oLddwc6fUaQYE_Bc+sBThTmvWA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubjbVxEvL01uu_Cm-_R8oLddwc6fUaQYE_Bc+sBThTmvWA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_045707_972555_EE3F2E51 
X-CRM114-Status: GOOD (  12.94  )
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
Content-Type: multipart/mixed; boundary="===============9140819562198478387=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9140819562198478387==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="obwyZd8LQsMhiGve"
Content-Disposition: inline


--obwyZd8LQsMhiGve
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 09:01:17AM +0100, Alexandre Ghiti wrote:
> Hi Randy,
>=20
> On Mon, Dec 11, 2023 at 10:17=E2=80=AFPM Randy Dunlap <rdunlap@infradead.=
org> wrote:
> >
> >
> >
> > On 12/10/23 22:25, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20231208:
> > >
> >
> > on riscv32:
> >
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L4':
> > patch.c:(.text+0xbe): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0xc2): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L12':
> > patch.c:(.text+0xd2): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0xd6): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L15':
> > patch.c:(.text+0x1ea): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L7':
> > patch.c:(.text+0x1ee): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0x1fe): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L22':
> > patch.c:(.text+0x202): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `__patch_insn_write':
> > patch.c:(.text+0x410): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0x414): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0x424): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0x428): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L46':
> > patch.c:(.text+0x53c): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0x540): undefined reference to `__exittext_begin'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: ar=
ch/riscv/kernel/patch.o: in function `.L48':
> > patch.c:(.text+0x550): undefined reference to `__exittext_end'
> > /opt/crosstool/gcc-13.2.0-nolibc/riscv32-linux/bin/riscv32-linux-ld: pa=
tch.c:(.text+0x554): undefined reference to `__exittext_end'
> >
> >
> > Full randconfig file is attached.
>=20
> We can ignore this one as CONFIG_XIP is enabled and we agreed at LPC
> that I'll remove this soon.

I don't think we can (even if people hadn't sent patches yesterday for
XIP) act as if XIP being removed is a foregone conclusion.

--obwyZd8LQsMhiGve
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXmqHQAKCRB4tDGHoIJi
0v3JAQDasJk60e0AOa9BFldLhHllm/ZCvbLhi798Ft48nzn06AEAx1NxZQ4H+SZo
z8u48ofVkJagwI2H9MWYiHFrr32d0w0=
=hgAl
-----END PGP SIGNATURE-----

--obwyZd8LQsMhiGve--


--===============9140819562198478387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9140819562198478387==--

