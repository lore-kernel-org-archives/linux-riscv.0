Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE894C3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 13:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TS4RQDGNOKA1Fxdz0SkdmMIQg+hMnbfWPybOkRl02nY=; b=Jy/s84PzpW/Ml9uhLhLkHlImW6
	sb1ThEtxodn/p3aspAgk/rtdLw/J2Ol3adQqkMRIrbMUYTgX1ZnnimFFJbPyA5/XC2gfgpkYy3OSG
	ih94Hnwt95jBBA1T9vcaSr3/CIcgf54iwv3kzK2OuGTor+sv9ywkALdGTt21FjUF6ir8rufezv0bh
	jp2PI5hI6eWW0znZDe0NKL0LgY2NO/a1TB9po/iBEssyVrUubB1XB8nM4tz5MWfKAqEFhS7dR2NiL
	FFs3IlZWwlft9Yocj9ELuQgw4Yo40yfHJQppZ/VUx0zEHM6wNYXyzp2gf1NOXLUDT7ykUAy6ESm4E
	cfJj0gpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4NJ-0000000DqFc-2ASN;
	Wed, 17 Jul 2024 13:07:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4NG-0000000DqET-1qTY
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 13:07:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 44393CE179C;
	Wed, 17 Jul 2024 13:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737F1C4AF09;
	Wed, 17 Jul 2024 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721221606;
	bh=C0t1p4/tPnP1VjckQRuFWVTqpJzCj/as7FvZ2OtK1FU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBN0Vm3zfQglSh2z2hOBJcGSr6u46+zZMw7HBXU1EJirkcatyCEo9GxLnywePcACe
	 QjbL9eRFJCZ+rM9xxgQB5KOLMbXHqhSUfrs9Tl9eTFK8t9OSJ2lKpwyl1b6HH9OHF3
	 eifqboVxfEOdyu6pXmZqzb0wzc6dnNFiPJnZXg1EqvzI3jWYZUcrgi9nfsih80IQN3
	 aMmNE4J2N7kuJx8QyeZM8FgPEBRyjGKdi9V3F+5EJWUZThMp3VMR52UftDYVT5DyKR
	 mch8x/m5MSZfmKxARiWtldp27yNeLKS6/ZzBMGc6euPDdbwp58KbPESew1jzYsYs8u
	 jSGM4zEcF72MQ==
Date: Wed, 17 Jul 2024 14:06:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC] riscv: Allow to build only with LLVM >= 17.0.0
Message-ID: <20240717-commuting-channel-4ad202950e4c@spud>
References: <20240717111716.157149-1-alexghiti@rivosinc.com>
 <20240717-synapse-decade-a0d41bd7afce@spud>
 <203e8784-54f2-43ea-a442-833d7e4a06c8@ghiti.fr>
 <20240717-theft-resample-19c248bb2a26@spud>
MIME-Version: 1.0
In-Reply-To: <20240717-theft-resample-19c248bb2a26@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_060714_833110_57021681 
X-CRM114-Status: GOOD (  24.00  )
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
Content-Type: multipart/mixed; boundary="===============1235586648519144822=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1235586648519144822==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2Tdx5ZzAQtnjYisr"
Content-Disposition: inline


--2Tdx5ZzAQtnjYisr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 01:06:39PM +0100, Conor Dooley wrote:
> On Wed, Jul 17, 2024 at 01:41:23PM +0200, Alexandre Ghiti wrote:
> > Hi Conor,
> >=20
> > On 17/07/2024 13:32, Conor Dooley wrote:
> > > On Wed, Jul 17, 2024 at 01:17:16PM +0200, Alexandre Ghiti wrote:
> > > > The following build failure happens when using LLVM < 17.0.0:
> > > >=20
> > > > kernel/sched/core.c:11873:7: error: cannot jump from this asm goto =
statement to one of its possible targets
> > > >=20
> > > > This is a known issue [1] so let's upgrade the minimal requirement =
for
> > > > LLVM to the version 17.0.0, which is the first version to contain t=
he
> > > > fix.
> > > I think doing this unilaterally is kinda insane, LLVM 17 isn't even a
> > > year old. Debian testing doesn't have anything later than 16.
> >=20
> >=20
> > Debian will very likely select the qspinlocks when available anyway, so
> > they'll need llvm >=3D 17. And Debian won't ship a kernel >=3D 6.11 unt=
il some
> > time right? So they'll probably update their infra to llvm >=3D 17 (and
> > they'll probably do to take advantages of the new extensions).
>=20
> What I mean is that you are going to prevent people building the kernel
> with llvm on machines running anything but very recent rolling-release
> distros. Your patch would stop most developers, including those who don't
> care about your qspinlock stuff, even build testing with the version of
> LLVM that their distro provides. I'm not talking about distros building
> kernels in their build infrastructure.
>=20
> >=20
> >=20
> > > Why does
> > > it need to be done unilaterally rather than just when the qspinlock
> > > stuff is built?
> >=20
> >=20
> > We can do that indeed, it may happen again and we can keep requiring ll=
vm 17
> > on a per-config basis.

Nathan pointed out to me that I misunderstood the build failure, and
that it happens whether or not the option is enabled. /sigh.

--2Tdx5ZzAQtnjYisr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpfB4gAKCRB4tDGHoIJi
0l6BAQCd0FpEzXdgZp2Uy/j3HO577wh65f4yVPgCTfXFW93RSAD9EVU1EgR+YBzH
OU9kSaTlxRGRHmENI0ilR/fv4OZrJwU=
=bjUU
-----END PGP SIGNATURE-----

--2Tdx5ZzAQtnjYisr--


--===============1235586648519144822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1235586648519144822==--

