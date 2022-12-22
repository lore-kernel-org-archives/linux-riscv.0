Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F194C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7R9unC+CPxuMXDD4HwwIDCHOPNiQjGeix+Wb9QTCFjk=; b=rH4L4sGEnUMLLdHt/zEcyNdvgX
	pBDtiEnP9iggn80nFHy9VRjMfyCZxm3pI2+TBXUc3iS+zm0NR5GcIc6HVMFL1C5OX5dYK7r1pMx7f
	IwqphT2IUR/wGLBIotCFsCnYI82xS9Y/g4uW0NX4y1UJNeY281iCaZ1WgqxnRmhx8dCUEz2QAh96C
	PwR9fPQDSuqDmlQfPrzsiFh4NKyLfEtSQq6CWaHbVcOUV837K/or10UV5+5XRi24rDbv0qVnWzLke
	WcCg2igGoPveTKzJh7R0IZYJZK+gL+kyA2fdkFh3vXjdkN4howX+Tyk+ZOV8Q31MpB6emH+CgjEQP
	4kHIXZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8UXv-000VWL-S4; Thu, 22 Dec 2022 23:00:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8UWb-000Tp3-3P; Thu, 22 Dec 2022 22:58:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5DC8F61DA7;
	Thu, 22 Dec 2022 22:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B63C433D2;
	Thu, 22 Dec 2022 22:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671749931;
	bh=ZWgMvBec2zTJYuyb0Svwk6xDFK1LoTGdFQ3B/mZFMIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIei7yl96n5732UM4LP9k01gFdHTs5jCFI53oc8Fu2rBTS9Vqs/5/gzAxSWNDBPUZ
	 heND8Iz+BzIp0Sx48Ls8+1epZbcJMoSreIzZUP/hSV7jmS/IlK7bvlv+2FbZOERygw
	 c0sBu9ET9FYMFhWPzV6d3f1Lud0/qX3aKHy1g+a1V9KqfGusFB/IIhKrCrxbEqpAku
	 6dey2T+1OsG4xVlO1+9HhzkiJ4bjNMMYwXD7ze8+28+WfOmGQ131UUKsAfXh7dlW9N
	 PGN7x5MFs5v9TFw8aoqAljcuKnzwp0pLC5PxLVVIfYTQhM2LpK78xXocWrC0wjamH8
	 F8oNFSO+LTYiQ==
Date: Thu, 22 Dec 2022 22:58:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 04/13] riscv: hwcap: make ISA extension ids can be
 used in asm
Message-ID: <Y6ThJkjhdee2uNfS@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-5-jszhang@kernel.org>
 <Y44+QWJfaa7haS/5@spud>
MIME-Version: 1.0
In-Reply-To: <Y44+QWJfaa7haS/5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_145853_276660_EFBC78B2 
X-CRM114-Status: GOOD (  28.78  )
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
Content-Type: multipart/mixed; boundary="===============1916087495518235341=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1916087495518235341==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9Y7Im1lgoL+dPIBi"
Content-Disposition: inline


--9Y7Im1lgoL+dPIBi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 06:53:53PM +0000, Conor Dooley wrote:
> Hey Jisheng,
>=20
> On Mon, Dec 05, 2022 at 01:46:23AM +0800, Jisheng Zhang wrote:
> > We will make use of ISA extension in asm files, so make the multi-letter
> > RISC-V ISA extension IDs macros rather than enums and move them and
> > those base ISA extension IDs to suitable place.
>=20
> Which base ISA extension IDs? Changelog should match the patch contents,
> and it's a little unclear here since the base ISA extension IDs are
> visible here but in the context not the diff.
>=20
> >=20
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 43 ++++++++++++++++------------------
> >  1 file changed, 20 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index b22525290073..996884986fea 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -12,20 +12,6 @@
> >  #include <linux/bits.h>
> >  #include <uapi/asm/hwcap.h>
> > =20
> > -#ifndef __ASSEMBLY__
> > -#include <linux/jump_label.h>
> > -/*
> > - * This yields a mask that user programs can use to figure out what
> > - * instruction set this cpu supports.
> > - */
> > -#define ELF_HWCAP		(elf_hwcap)
> > -
> > -enum {
> > -	CAP_HWCAP =3D 1,
> > -};
> > -
> > -extern unsigned long elf_hwcap;
> > -
> >  #define RISCV_ISA_EXT_a		('a' - 'a')
> >  #define RISCV_ISA_EXT_c		('c' - 'a')
> >  #define RISCV_ISA_EXT_d		('d' - 'a')
> > @@ -46,22 +32,33 @@ extern unsigned long elf_hwcap;
> >  #define RISCV_ISA_EXT_BASE 26
> > =20
> >  /*
> > - * This enum represent the logical ID for each multi-letter RISC-V ISA=
 extension.
> > + * These macros represent the logical ID for each multi-letter RISC-V =
ISA extension.
> >   * The logical ID should start from RISCV_ISA_EXT_BASE and must not ex=
ceed
> >   * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
> >   * extensions while all the multi-letter extensions should define the =
next
> >   * available logical extension id.
> >   */
> > -enum riscv_isa_ext_id {
> > -	RISCV_ISA_EXT_SSCOFPMF =3D RISCV_ISA_EXT_BASE,
> > -	RISCV_ISA_EXT_SVPBMT,
> > -	RISCV_ISA_EXT_ZICBOM,
> > -	RISCV_ISA_EXT_ZIHINTPAUSE,
> > -	RISCV_ISA_EXT_SSTC,
> > -	RISCV_ISA_EXT_SVINVAL,
> > -	RISCV_ISA_EXT_ID_MAX =3D RISCV_ISA_EXT_MAX,
> > +#define RISCV_ISA_EXT_SSCOFPMF		26
> > +#define RISCV_ISA_EXT_SVPBMT		27
> > +#define RISCV_ISA_EXT_ZICBOM		28
> > +#define RISCV_ISA_EXT_ZIHINTPAUSE	29
> > +#define RISCV_ISA_EXT_SSTC		30
> > +#define RISCV_ISA_EXT_SVINVAL		31
>=20
> Could you re-order these alphabetically when you move them please?

On reflection, this is a horrific idea - don't bother. It'd only be
temporary anyway as it'd need massaging when the next extension comes
along.

Either people will have a slightly harder seeing if something is added,
or a "slightly" harder time finding which is the next free number or
have to reshuffle the whole thing.
The latter sounds like a prime bug breeding ground, while the former is
just a search away.
So yeah, don't bother & apologies for the noise!

> > +
> > +#ifndef __ASSEMBLY__
> > +#include <linux/jump_label.h>
> > +/*
> > + * This yields a mask that user programs can use to figure out what
> > + * instruction set this cpu supports.
> > + */
> > +#define ELF_HWCAP		(elf_hwcap)
> > +
> > +enum {
> > +	CAP_HWCAP =3D 1,
> >  };
> > =20
> > +extern unsigned long elf_hwcap;
> > +
> >  /*
> >   * This enum represents the logical ID for each RISC-V ISA extension s=
tatic
> >   * keys. We can use static key to optimize code path if some ISA exten=
sions
> > --=20
> > 2.37.2
> >=20



--9Y7Im1lgoL+dPIBi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6ThJQAKCRB4tDGHoIJi
0oLKAQCBXs1EjdtFjjO2TfICNa6J8PSQmdmGAOCdZGi8emFxxAD/QKv6vk+jdRYn
wOMpXkzglRwJgTXvV2fTjKDv+9NLfwg=
=W3Us
-----END PGP SIGNATURE-----

--9Y7Im1lgoL+dPIBi--


--===============1916087495518235341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1916087495518235341==--

