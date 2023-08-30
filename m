Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF694C83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 07:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uaGX1w4diyO+wPBPFyY+5/IQNRDbvqX79ik/UW8Vy4=; b=e8Tbc4ajlsFX9dRb/Gv77KGLBU
	+MW+mda2DGsy3D9VK6nBLtlJofx8aK63OKSsq0leFWiycltnDRPo/mQz3gpYWvMFSwHfZrsWklfa1
	b8K+YWCvbwPQkqCzHbxOMvv/LomszLIKM7/L5LsFpfNftKBTFyNV6Cx+ZnekbgBR7N9myzop1mies
	yq6Fj6Me++5YRCkh+Ej4EfQexbQSH2yV9jr0MVkR7QzQ0RcLiX7Ox4UzqtEgj0sASUsG0OTiUU3V6
	UgKjBe1063KTKipj9D+AlWjOs/QyupH98uChfMFhUhtCw1KLZn3bYgh87ntILBA7VQ3EfuRcrqI3G
	j549Ithg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFBb-00CxVF-1A;
	Wed, 30 Aug 2023 07:00:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFBY-00CxUo-17
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 07:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693378816; x=1724914816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mvg/nUDtYhEADCoBEFukMvDaTm/pr0NPS2b3VR6z3RM=;
  b=HevDUjrMIQpkPkJ/bbCgvPIe10h93hzzKEAsv61w0aDUxyeCR3CiHOvM
   AcKCewqj5VemP0Hm6uZZfH0XbJAZibIuva58BhbsnK2ukmEH93xe0Ke8V
   DJ8cBj/qsBzTFupyEfCey1F4xYciOhHRLOxN8wPEpKnHgaxJV6b1xis2C
   zsaZHc2UtmVIhSQq6F7rB3bLRZvfmWlWoOpJiQth+BhXZPBfGVaaiuV2R
   llVHuXMP5sfoSb3s42fZPjtvosxmNpag4CkYy8yGu1cjobGBrcBtpJYsX
   g3pxr93vOMhgb6qcj9KbtanVvgGBJF0KLYFsvRxssojEmyEcKQmxeQxFn
   Q==;
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="asc'?scan'208";a="169013177"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2023 00:00:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 30 Aug 2023 00:00:03 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 30 Aug 2023 00:00:01 -0700
Date: Wed, 30 Aug 2023 07:59:19 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
CC: Anup Patel <anup@brainfault.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "ardb@kernel.org"
	<ardb@kernel.org>, "Li, Haicheng" <haicheng.li@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RISC-V: Optimize bitops with Zbb extension
Message-ID: <20230830-breeze-washboard-ef496d5c9d5a@wendy>
References: <20230806024715.3061589-1-xiao.w.wang@intel.com>
 <CAAhSdy2_djw2JX+8tmF2V190+x9KLvt7u8rCX-TaGCKQrUVOYQ@mail.gmail.com>
 <DM8PR11MB57512001CAFA07EC58203A7BB8E6A@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR11MB57512001CAFA07EC58203A7BB8E6A@DM8PR11MB5751.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_000016_457879_681F9AF8 
X-CRM114-Status: GOOD (  36.65  )
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
Content-Type: multipart/mixed; boundary="===============2672921885535601141=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2672921885535601141==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BxCw0DgMJ3ArtR6u"
Content-Disposition: inline

--BxCw0DgMJ3ArtR6u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 06:14:12AM +0000, Wang, Xiao W wrote:
> Hi,
>=20
> > -----Original Message-----
> > From: Anup Patel <anup@brainfault.org>
> > Sent: Tuesday, August 29, 2023 7:08 PM
> > To: Wang, Xiao W <xiao.w.wang@intel.com>
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; ardb@kernel.org; Li, Haicheng
> > <haicheng.li@intel.com>; linux-riscv@lists.infradead.org; linux-
> > efi@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH] RISC-V: Optimize bitops with Zbb extension
> >=20
> > On Sun, Aug 6, 2023 at 8:09=E2=80=AFAM Xiao Wang <xiao.w.wang@intel.com=
> wrote:
> > >
> > > This patch leverages the alternative mechanism to dynamically optimize
> > > bitops (including __ffs, __fls, ffs, fls) with Zbb instructions. When
> > > Zbb ext is not supported by the runtime CPU, legacy implementation is
> > > used. If Zbb is supported, then the optimized variants will be select=
ed
> > > via alternative patching.
> > >
> > > The legacy bitops support is taken from the generic C implementation =
as
> > > fallback.
> > >
> > > If the parameter is a build-time constant, we leverage compiler built=
in to
> > > calculate the result directly, this approach is inspired by x86 bitops
> > > implementation.
> > >
> > > EFI stub runs before the kernel, so alternative mechanism should not =
be
> > > used there, this patch introduces a macro EFI_NO_ALTERNATIVE for this
> > > purpose.
> >=20
> > I am getting the following compile error with this patch:
> >=20
> >   GEN     Makefile
> >   UPD     include/config/kernel.release
> >   UPD     include/generated/utsrelease.h
> >   CC      kernel/bounds.s
> > In file included from /home/anup/Work/riscv-
> > test/linux/include/linux/bitmap.h:9,
> >                  from
> > /home/anup/Work/riscv-test/linux/arch/riscv/include/asm/cpufeature.h:9,
> >                  from
> > /home/anup/Work/riscv-test/linux/arch/riscv/include/asm/hwcap.h:90,
>=20
>=20
> It looks there's a cyclic header including, which leads to this build err=
or.
> I checked https://github.com/kvm-riscv/linux/tree/master and
> https://github.com/torvalds/linux/tree/master, but I don't see
> "asm/cpufeature.h" is included in asm/hwcap.h:90, maybe I miss something,
> could you help point me to the repo/branch I should work on?

=46rom MAINTAINERS:
	RISC-V ARCHITECTURE
	...
	T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git

The for-next branch there is what you should be basing work on top of.
AFAICT, you've made bitops.h include hwcap.h while cpufeature.h includes
both bitops.h (indirectly) and hwcap.h.

Hope that helps,
Conor.

> >                  from
> > /home/anup/Work/riscv-test/linux/arch/riscv/include/asm/bitops.h:26,
> >                  from
> > /home/anup/Work/riscv-test/linux/include/linux/bitops.h:68,
> >                  from /home/anup/Work/riscv-test/linux/include/linux/lo=
g2.h:12,
> >                  from /home/anup/Work/riscv-test/linux/kernel/bounds.c:=
13:
> > /home/anup/Work/riscv-test/linux/include/linux/find.h: In function
> > 'find_next_bit':
> > /home/anup/Work/riscv-test/linux/include/linux/find.h:64:30: error:
> > implicit declaration of function '__ffs'
> > [-Werror=3Dimplicit-function-declaration]
> >    64 |                 return val ? __ffs(val) : size;
> >=20
> > Regards,
> > Anup
> >=20
> >=20
> > >
> > > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > > ---
> > >  arch/riscv/include/asm/bitops.h       | 266 ++++++++++++++++++++++++=
+-
> > >  drivers/firmware/efi/libstub/Makefile |   2 +-
> > >  2 files changed, 264 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/bitops.h
> > b/arch/riscv/include/asm/bitops.h
> > > index 3540b690944b..f727f6489cd5 100644
> > > --- a/arch/riscv/include/asm/bitops.h
> > > +++ b/arch/riscv/include/asm/bitops.h
> > > @@ -15,13 +15,273 @@
> > >  #include <asm/barrier.h>
> > >  #include <asm/bitsperlong.h>
> > >
> > > +#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(EFI_NO_ALTERNATIVE)
> > >  #include <asm-generic/bitops/__ffs.h>
> > > -#include <asm-generic/bitops/ffz.h>
> > > -#include <asm-generic/bitops/fls.h>
> > >  #include <asm-generic/bitops/__fls.h>
> > > +#include <asm-generic/bitops/ffs.h>
> > > +#include <asm-generic/bitops/fls.h>
> > > +
> > > +#else
> > > +#include <asm/alternative-macros.h>
> > > +#include <asm/hwcap.h>
> > > +
> > > +#if (BITS_PER_LONG =3D=3D 64)
> > > +#define CTZW   "ctzw "
> > > +#define CLZW   "clzw "
> > > +#elif (BITS_PER_LONG =3D=3D 32)
> > > +#define CTZW   "ctz "
> > > +#define CLZW   "clz "
> > > +#else
> > > +#error "Unexpected BITS_PER_LONG"
> > > +#endif
> > > +
> > > +static __always_inline unsigned long variable__ffs(unsigned long wor=
d)
> > > +{
> > > +       int num;
> > > +
> > > +       asm_volatile_goto(
> > > +               ALTERNATIVE("j %l[legacy]", "nop", 0, RISCV_ISA_EXT_Z=
BB, 1)
> > > +               : : : : legacy);
> > > +
> > > +       asm volatile (
> > > +               ".option push\n"
> > > +               ".option arch,+zbb\n"
> > > +               "ctz %0, %1\n"
> > > +               ".option pop\n"
> > > +               : "=3Dr" (word) : "r" (word) :);
> > > +
> > > +       return word;
> > > +
> > > +legacy:
> > > +       num =3D 0;
> > > +#if BITS_PER_LONG =3D=3D 64
> > > +       if ((word & 0xffffffff) =3D=3D 0) {
> > > +               num +=3D 32;
> > > +               word >>=3D 32;
> > > +       }
> > > +#endif
> > > +       if ((word & 0xffff) =3D=3D 0) {
> > > +               num +=3D 16;
> > > +               word >>=3D 16;
> > > +       }
> > > +       if ((word & 0xff) =3D=3D 0) {
> > > +               num +=3D 8;
> > > +               word >>=3D 8;
> > > +       }
> > > +       if ((word & 0xf) =3D=3D 0) {
> > > +               num +=3D 4;
> > > +               word >>=3D 4;
> > > +       }
> > > +       if ((word & 0x3) =3D=3D 0) {
> > > +               num +=3D 2;
> > > +               word >>=3D 2;
> > > +       }
> > > +       if ((word & 0x1) =3D=3D 0)
> > > +               num +=3D 1;
> > > +       return num;
> > > +}
> > > +
> > > +/**
> > > + * __ffs - find first set bit in a long word
> > > + * @word: The word to search
> > > + *
> > > + * Undefined if no set bit exists, so code should check against 0 fi=
rst.
> > > + */
> > > +#define __ffs(word)                            \
> > > +       (__builtin_constant_p(word) ?           \
> > > +        (unsigned long)__builtin_ctzl(word) :  \
> > > +        variable__ffs(word))
> > > +
> [...]

--BxCw0DgMJ3ArtR6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZO7oxwAKCRB4tDGHoIJi
0ozlAQDIl5mI7ovdiMJADRIobwVL0Wabj7o88Y28I+1sghdKfAEAx17o0kYzHC1p
TWhYbjU4Mgdz6pbu5yyaDwqyyD44qw0=
=MI7l
-----END PGP SIGNATURE-----

--BxCw0DgMJ3ArtR6u--


--===============2672921885535601141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2672921885535601141==--

