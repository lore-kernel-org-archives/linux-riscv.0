Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478FFC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 12:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymlf3M8T5uvGFrmUajxhNM/luCN4LT64TcdiKR/rRXs=; b=QZ+aN8vhwudMawxBIBbfCDLHeY
	SNH/u0uuqmrsiV8FtckpsU+HWwicR0a0dj9KPvGdpbuU1lQw4zHSYEgVbBYR904bcEoAKkFSAk4Wo
	1uU1YSrXItIGTAyddK+w7mIdixQRWg7NvmhA5zt57IcBf7hhTT4dWqqQxYBZXnTJucjqvW/O1qF0L
	AGroAedEK5jlzFITTyaXYwPO6MJm/kAlcWHwpPK0kR+h5MSWk5ljiGpJo8u1RxBC9ylyRIJ2ANMrv
	qRjQhBka2nOvHAfUGc6eRdhDgBWPV9Q5mfuk7EbNap1/RMInRieIAZygktHXPzFJT3X9PoueyXjgd
	umUhUntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU3Qn-0000000Dhss-3Hc9;
	Wed, 17 Jul 2024 12:06:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU3Qk-0000000DhsL-474F
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 12:06:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4F0EDCE1736;
	Wed, 17 Jul 2024 12:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6350EC32782;
	Wed, 17 Jul 2024 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721218003;
	bh=nywpXi2h4zG79mMkSQKTimVu1LXY5R/z5vuogaMkbEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A7/dtYEd1+AotXXsTRKn/rlcwnr9eTZWcLvMN8EMhLeE+oun+q74YFw3ey/WQOmX7
	 1Pb4jRXqoNp7rmeUYACVkjM/KVIB1gncqJ6ANNpP0IzXugjBAXu8Bk+X99+ZQSXXKB
	 fqXUgy+AyVT8B2SFy1d2mfB8gtCN4jkM5A2XgCzxSJVFW8kGHr4Uo0vqObjwZ+glc7
	 D0m6C+DWLOIRDKtWgmbAutHpqtZ3dMXEJKvhTQpfNa+uGz0HhD3Nt3qH9PbWqhTAsH
	 GOUUs9TItY+iTD4yzPu0j+LmHDMag5iCO1cNm2mWdCrsQCW8CqPp5JPJzFqHcfRh2N
	 PXUoFGPWCCc7Q==
Date: Wed, 17 Jul 2024 13:06:39 +0100
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
Message-ID: <20240717-theft-resample-19c248bb2a26@spud>
References: <20240717111716.157149-1-alexghiti@rivosinc.com>
 <20240717-synapse-decade-a0d41bd7afce@spud>
 <203e8784-54f2-43ea-a442-833d7e4a06c8@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <203e8784-54f2-43ea-a442-833d7e4a06c8@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_050647_407376_5C4325D5 
X-CRM114-Status: GOOD (  32.30  )
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
Content-Type: multipart/mixed; boundary="===============8963605254285166063=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8963605254285166063==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+0B+bzp0mRRL4CCI"
Content-Disposition: inline


--+0B+bzp0mRRL4CCI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 01:41:23PM +0200, Alexandre Ghiti wrote:
> Hi Conor,
>=20
> On 17/07/2024 13:32, Conor Dooley wrote:
> > On Wed, Jul 17, 2024 at 01:17:16PM +0200, Alexandre Ghiti wrote:
> > > The following build failure happens when using LLVM < 17.0.0:
> > >=20
> > > kernel/sched/core.c:11873:7: error: cannot jump from this asm goto st=
atement to one of its possible targets
> > >=20
> > > This is a known issue [1] so let's upgrade the minimal requirement for
> > > LLVM to the version 17.0.0, which is the first version to contain the
> > > fix.
> > I think doing this unilaterally is kinda insane, LLVM 17 isn't even a
> > year old. Debian testing doesn't have anything later than 16.
>=20
>=20
> Debian will very likely select the qspinlocks when available anyway, so
> they'll need llvm >=3D 17. And Debian won't ship a kernel >=3D 6.11 until=
 some
> time right? So they'll probably update their infra to llvm >=3D 17 (and
> they'll probably do to take advantages of the new extensions).

What I mean is that you are going to prevent people building the kernel
with llvm on machines running anything but very recent rolling-release
distros. Your patch would stop most developers, including those who don't
care about your qspinlock stuff, even build testing with the version of
LLVM that their distro provides. I'm not talking about distros building
kernels in their build infrastructure.

>=20
>=20
> > Why does
> > it need to be done unilaterally rather than just when the qspinlock
> > stuff is built?
>=20
>=20
> We can do that indeed, it may happen again and we can keep requiring llvm=
 17
> on a per-config basis.
>=20
>=20
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1886#issuecomme=
nt-1645979992 [1]
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202407041157.odTZAYZ6-l=
kp@intel.com/
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > If Nathan wrote the patch, you need to set him as the author of the
> > patch :)
>=20
>=20
> I thought I did, how should I do that then?
>=20
>=20
> >=20
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> > >=20
> > > This patch was done by Nathan, I'm just sending it as an RFC to get q=
uicker
> > > feedbacks.
> > >=20
> > > I tested it successfully.
> > >=20
> > > Note that the build failure happens on the not-yet merged qspinlock
> > > patchset.
> > >=20
> > >   scripts/min-tool-version.sh | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> > > index 91c91201212c..e81eb7ed257d 100755
> > > --- a/scripts/min-tool-version.sh
> > > +++ b/scripts/min-tool-version.sh
> > > @@ -28,6 +28,8 @@ llvm)
> > >   		echo 15.0.0
> > >   	elif [ "$SRCARCH" =3D loongarch ]; then
> > >   		echo 18.0.0
> > > +	elif [ "$SRCARCH" =3D riscv ]; then
> > > +		echo 17.0.0
> > >   	else
> > >   		echo 13.0.1
> > >   	fi
> > > --=20
> > > 2.39.2
> > >=20
> > >=20
> > >=20
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv

--+0B+bzp0mRRL4CCI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpezzwAKCRB4tDGHoIJi
0lAAAP4ukSsQNKH83VinYN4P6TvkUEYT19wBuJZQ39VnokQpRgD9F06sCd7yG2b1
Su+5N0ApRQvIXvkTAxx1AMkl5cQNKQc=
=N3ed
-----END PGP SIGNATURE-----

--+0B+bzp0mRRL4CCI--


--===============8963605254285166063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8963605254285166063==--

