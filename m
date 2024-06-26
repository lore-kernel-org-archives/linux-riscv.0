Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139C0C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 14:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdcrzK2qpEYGSh0N0prmm8gHuTowWVBOPc8gNSiqUc8=; b=aq9KLdLRaAZq88Jfv6h/zgojAe
	cxHUZq1VnvzSKkQBXQqlNAS4cagC64u5TI1xAOuF+hnXK3gZhmO9/eg0UG0QkIjEfI3jWkE2y1ZNQ
	Sk0rf7gXHNwR8UMK321E2xN63j7aAalIDw3Zl86CxEZ94MxIVvsLZONXmw0jjdnVog4ucXGvMrJgr
	DKqBNRUzVReTBmrjH3mDhMZoQvhplbnLP/8Vqd6zvpH2T2syImO6HC838zVnCdrnXm8xy3qQ0Xc/G
	sWzzBj1tLv9KNma7ykl5+Wiv5Qobt4F+wIQUgk+tvpc4rA1qqVxedn/9HZ50DcuQz2aC0Q4rktGGI
	c9g+Agqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTj4-00000007Cmt-0H1D;
	Wed, 26 Jun 2024 14:34:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTiz-00000007Chs-0F39
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 14:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7A81ECE20BD;
	Wed, 26 Jun 2024 14:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D53C116B1;
	Wed, 26 Jun 2024 14:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719412452;
	bh=D3c1gQ648tEhgLlYiDSolRNCSiuz2KJRJlQeBmzlIDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RcyVdO6SVYo33x8dKozPZT65CCTcHp2r+Dmjtl/gV/bzVsIVi7YWz7MISUOPChANC
	 /UePeVTUD8OG5VotiuAN+xLye0XvlDZSnlfUabWKgq9qRGyJ2sozV5UML72ajB2k8W
	 zOzxKR63my7huwwO+jyPUSoHudbqCZb9K1lYuddKkqevNnoL/xVgKzFleWyKJWYscO
	 MIOApBxr4Fl3j53wa2dpjIrO6paZN7sXbqpaO2LBeaEKmnNiOOo99eKmu4ayrkaiuk
	 iGKhLkfVwPioInX5wfmgdejG1ca1B8rZs95d847V+ModAJ0Ni8wFe29LQ/apubwyrg
	 ndc/aaROSAOXA==
Date: Wed, 26 Jun 2024 15:34:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Erick Archer <erick.archer@gmx.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] RISC-V: hwprobe: Add SCALAR to misaligned perf
 defines
Message-ID: <20240626-ungraded-legend-65480eabd255@spud>
References: <20240625165121.2160354-1-evan@rivosinc.com>
 <20240625165121.2160354-3-evan@rivosinc.com>
 <20240625-kindle-sanitizer-c52b48ed9b86@spud>
 <CALs-HsuEc9ympGsQP3bvXaowiAj0bq3nvD=9CcX0NNMza+79OA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HsuEc9ympGsQP3bvXaowiAj0bq3nvD=9CcX0NNMza+79OA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_073417_513835_64838143 
X-CRM114-Status: GOOD (  33.20  )
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
Content-Type: multipart/mixed; boundary="===============8259631497813060740=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8259631497813060740==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8Hy1V/9xQfoCyn26"
Content-Disposition: inline


--8Hy1V/9xQfoCyn26
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 12:08:09PM -0700, Evan Green wrote:
> On Tue, Jun 25, 2024 at 11:35=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Tue, Jun 25, 2024 at 09:51:21AM -0700, Evan Green wrote:
> > > In preparation for misaligned vector performance hwprobe keys, rename
> > > the hwprobe key values associated with misaligned scalar accesses to
> > > include the term SCALAR.
> > >
> > > Signed-off-by: Evan Green <evan@rivosinc.com>
> > >
> > > ---
> > >
> > > Changes in v2:
> > >  - Added patch to rename misaligned perf key values (Palmer)
> > >
> > >  Documentation/arch/riscv/hwprobe.rst       | 20 ++++++++++----------
> > >  arch/riscv/include/uapi/asm/hwprobe.h      | 10 +++++-----
> > >  arch/riscv/kernel/sys_hwprobe.c            | 10 +++++-----
> > >  arch/riscv/kernel/traps_misaligned.c       |  6 +++---
> > >  arch/riscv/kernel/unaligned_access_speed.c | 12 ++++++------
> > >  5 files changed, 29 insertions(+), 29 deletions(-)
> > >
> > > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arc=
h/riscv/hwprobe.rst
> > > index c9f570b1ab60..83f7f3c1347f 100644
> > > --- a/Documentation/arch/riscv/hwprobe.rst
> > > +++ b/Documentation/arch/riscv/hwprobe.rst
> > > @@ -215,22 +215,22 @@ The following keys are defined:
> > >    the performance of misaligned scalar word accesses on the selected=
 set of
> > >    processors.
> > >
> > > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of =
misaligned
> > > -    accesses is unknown.
> > > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN`: The performa=
nce of
> > > +    misaligned accesses is unknown.
> > >
> > > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesse=
s are
> > > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED`: Misaligned =
accesses are
> > >      emulated via software, either in or below the kernel.  These acc=
esses are
> > >      always extremely slow.
> > >
> > > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned word access=
es are
> > > -    slower than equivalent byte accesses.  Misaligned accesses may b=
e supported
> > > -    directly in hardware, or trapped and emulated by software.
> > > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW`: Misaligned word=
 accesses
> > > +    are slower than equivalent byte accesses.  Misaligned accesses m=
ay be
> > > +    supported directly in hardware, or trapped and emulated by softw=
are.
> > >
> > > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned word access=
es are
> > > -    faster than equivalent byte accesses.
> > > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_FAST`: Misaligned word=
 accesses
> > > +    are faster than equivalent byte accesses.
> > >
> > > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned acce=
sses are
> > > -    not supported at all and will generate a misaligned address faul=
t.
> > > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED`: Misalign=
ed accesses
> > > +    are not supported at all and will generate a misaligned address =
fault.
> > >
> > >  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int wh=
ich
> > >    represents the size of the Zicboz block in bytes.
> > > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/inclu=
de/uapi/asm/hwprobe.h
> > > index 22073533cea8..e11684d8ae1c 100644
> > > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > > @@ -66,11 +66,11 @@ struct riscv_hwprobe {
> > >  #define              RISCV_HWPROBE_EXT_ZVE64F        (1ULL << 40)
> > >  #define              RISCV_HWPROBE_EXT_ZVE64D        (1ULL << 41)
> > >  #define RISCV_HWPROBE_KEY_CPUPERF_0  5
> > > -#define              RISCV_HWPROBE_MISALIGNED_UNKNOWN        0
> > > -#define              RISCV_HWPROBE_MISALIGNED_EMULATED       1
> > > -#define              RISCV_HWPROBE_MISALIGNED_SLOW           2
> > > -#define              RISCV_HWPROBE_MISALIGNED_FAST           3
> > > -#define              RISCV_HWPROBE_MISALIGNED_UNSUPPORTED    4
> > > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN        =
 0
> > > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED       =
 1
> > > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW           =
 2
> > > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_FAST           =
 3
> > > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED    =
 4
> > >  #define              RISCV_HWPROBE_MISALIGNED_MASK           7
> >
> > How come the "old" names do not need to be preserved for userspace?
>=20
> It depends on what exactly the big userspace compatibility rule is.
> This preserves binary compatibility, which I think is the big one, but
> breaks source compatibility, though with an easy translation to fix.
> We could keep the old names around, but then it seems sort of silly to
> introduce the new names. I introduced this patch upon request, so I
> don't personally have a horse in the race on this one.

So apparently this isn't quite Palmer actually wanted. In today's call
he suggested that he'd send a new version himself, but also that what we
should do define a new key for scalar /and/ new add new defines values that
contain the word scalar, retaining the old defines. The values can of
course be the same.

--8Hy1V/9xQfoCyn26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnwm3wAKCRB4tDGHoIJi
0pN+AQCreK6NjvZnRI9VZsvMHlvKpUtNrWcwhuTMHxzCmRVdvgD/YODVuyDP1okz
Il+G9mctAu4ZDZGzZc/ojuyFxxOcXQk=
=TfxS
-----END PGP SIGNATURE-----

--8Hy1V/9xQfoCyn26--


--===============8259631497813060740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8259631497813060740==--

