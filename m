Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2D3C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ajtQwAiy9YrLemVvAvJKl1iCvMoeNtL44Lrt7vY2Sg=; b=nmIHnfdRhWGzxMcST13vzUpA3m
	vZ3QDdjqpuFfTdgRnIyqw5eJhGAnq2PvXuuuZ6xiC0BGPF9knwk1m/SAFcjHW6Iaj7WG61jLGLtu0
	zLRYrsQ+nTOBGxPMgsSrt6bL69NEnMAwKmrEKew80U9LXy4rxNP66iihSkOmoAHfljvHLomQPJfo/
	Fu4CEdKW/Qh6hoPuolm+D7Azv2aYr+qN4973P21tsoF5geInr/VrU5/YgkUItW3HmNZdYAd41ZWUO
	GGExZAAOV2Fi0/Skt5Qu8ixmpPwV79J8/B2+aBNSPNZJ+c7KGLlNIPXj5EnOGkS8BJbtsCdVsin9/
	F/SqUfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9dy-00B4XA-21; Wed, 01 Feb 2023 09:43:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9du-00B4Uc-Jy
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 09:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675244582; x=1706780582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BbyQ3KX75X0GO7lZd2KrNFTCEFGR/uZgZrbiCMS8ncc=;
  b=zlAirKYMT/z/Zm/j5ysGEnuVBqNsEjBAlOtm6XwtMQJxnmodMXYJCKgJ
   GT8ITvSNVph8FqLNsTK/5DluarTb/rTliZXRSxp+wqB0FJ+PTXL4bNNED
   vJfbGz7MSUjCCl+KOUmUXc1hxj7+68icXy96GR/NcN7qiwD39SXQLx1mm
   e/QmnZdycZOyuJzNvbify8LMFsRTlF3IeZQXBEk59L72y4Y6llJKB+VOa
   VoNqHEXmert1M4JJsLMnTXRouwGgGQ+ZD1uDvVIS+VxAWvqTCAStXhvB7
   ldonz62C5EA0CXH32FiFOE7bWaO+iGbtblfoyVveUxK+OoOSJgb6uKR1I
   A==;
X-IronPort-AV: E=Sophos;i="5.97,263,1669100400"; 
   d="asc'?scan'208";a="198870411"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Feb 2023 02:42:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 02:42:56 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Wed, 1 Feb 2023 02:42:55 -0700
Date: Wed, 1 Feb 2023 09:42:30 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: "liaochang (A)" <liaochang1@huawei.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko.stuebner@vrull.eu>, <ajones@ventanamicro.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <jszhang@kernel.org>,
	<vincent.chen@sifive.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Add header include guards to insn.h
Message-ID: <Y9o0Bv7VBM74ePHH@wendy>
References: <20230129094242.282620-1-liaochang1@huawei.com>
 <Y9fZ2ZxdMmXgO5aB@wendy>
 <9a4f98a7-fa03-7960-29ce-0bff018c0ac9@huawei.com>
MIME-Version: 1.0
In-Reply-To: <9a4f98a7-fa03-7960-29ce-0bff018c0ac9@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_014302_736085_D52BE791 
X-CRM114-Status: GOOD (  31.19  )
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
Content-Type: multipart/mixed; boundary="===============8999776582279770739=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8999776582279770739==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GgcUcrZJ+3fZpfIE"
Content-Disposition: inline

--GgcUcrZJ+3fZpfIE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 01, 2023 at 05:37:24PM +0800, liaochang (A) wrote:
> =E5=9C=A8 2023/1/30 22:53, Conor Dooley =E5=86=99=E9=81=93:
> > On Sun, Jan 29, 2023 at 05:42:42PM +0800, Liao Chang wrote:
> >> Add header include guards to insn.h to prevent repeating declaration of
> >> any identifiers in insn.h.
> >=20
> > I'm curious, did you spot this "by hand" while doing other work, or do
> > you have a tool that found it for you?
>=20
> I found this "by hand", inspired by scripts/checkdeclares.pl, i write a t=
iny tool
> to analyse the missing header guards in header file.

Ohh, cool! I'd love to add this one to the checks on patchwork so that
we do not end up adding any more of these. If this is based on
checkdeclares, is it GPLv2?

Thanks!

>=20
> #!/usr/bin/env perl
> use strict;
>=20
> sub usage {
>         print "Usage: checkguards.pl file1.h ...\n";
>         print "Warn of missing header guards\n";
>         exit 1;
> }
>=20
> if ($#ARGV < 0) {
>         usage();
> }
>=20
> foreach my $file (@ARGV) {
>         open(my $f, '<', $file)
>             or die "Cannot open $file: $!.\n";
>=20
>         my $scan_area =3D 1;
>         my $guards_warn =3D 0;
>=20
>         # The lines of header file are divided into several areas as foll=
ows:
>         #
>         # ... area1 ...
>         # #ifndef _HEADER_GUARD
>         # ... area2 ...
>         # #define _HEADER_GUARD
>         # ... area3 ...
>         # #endif /* _HEADER_GUARD */
>         # ... area4 ...
>         # EOF
>         #
>         # If any statement is found in area1, area2, and area4, it
>         # throws a warning of illegal usage of header guard usage.
>         while (<$f>) {
>                 if (m/^(.*);\s*$/o) {
>                         if ($scan_area =3D=3D 1 || $scan_area =3D=3D 2 ||=
 $scan_area =3D=3D 4) {
>                                 ++$guards_warn;
>                         }
>                 } elsif (m/^\s*(#ifndef\s+)[a-zA-Z0-9_]*_H[_]*\s*$/o) {
>                         ++$scan_area;
>                 } elsif (m/^\s*(#define\s+)[a-zA-Z0-9_]*_H[_]*\s*$/o) {
>                         ++$scan_area;
>                 } elsif (m/^\s*(#endif)\s*\/\*\s*[a-zA-Z0-9_]*_H[_]*\s*\*=
\/\s*$/o) {
>                         ++$scan_area;
>                 }
>         }
>=20
>         close($f);
>=20
>         if ($guards_warn) {
>                 print "Illegal usage of header guard found in $file.\n";
>         }
> }
>=20
> Thanks.
>=20
> >=20
> >> Fixes: edde5584c7ab ("riscv: Add SW single-step support for KDB")
> >=20
> > Heh, I appreciate you going back to the file's original name to find the
> > correct fixes tag!
> > I figure that it's probably worth adding a fixes tag for the rename too,
> > so that the stable bots don't get confused? That would be:
> > Fixes: c9c1af3f186a ("RISC-V: rename parse_asm.h to insn.h")
> >=20
> > Probably overkill when you have Drew's already for something so trivial,
> > but:
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> >> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> >> ---
> >>  arch/riscv/include/asm/insn.h | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/in=
sn.h
> >> index 25ef9c0b19e7..22c7613bfda3 100644
> >> --- a/arch/riscv/include/asm/insn.h
> >> +++ b/arch/riscv/include/asm/insn.h
> >> @@ -3,6 +3,9 @@
> >>   * Copyright (C) 2020 SiFive
> >>   */
> >> =20
> >> +#ifndef _ASM_RISCV_INSN_H
> >> +#define _ASM_RISCV_INSN_H
> >> +
> >>  #include <linux/bits.h>
> >> =20
> >>  #define RV_INSN_FUNCT3_MASK	GENMASK(14, 12)
> >> @@ -365,3 +368,4 @@ static inline void riscv_insn_insert_utype_itype_i=
mm(u32 *utype_insn, u32 *itype
> >>  	*utype_insn |=3D (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1=
);
> >>  	*itype_insn |=3D ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
> >>  }
> >> +#endif /* _ASM_RISCV_INSN_H */
> >> --=20
> >> 2.25.1
> >>
> >>
>=20
> --=20
> BR,
> Liao, Chang
>=20

--GgcUcrZJ+3fZpfIE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9oz9wAKCRB4tDGHoIJi
0lhzAP0f/StBjw3jkSx5YFiHgbBt9xkqmoqW9zL1JQJQznaaXAEA8Rk0eN2/A/OC
fKFEALpEaUisfv54TQkl4mSfCJQ48wk=
=WRsw
-----END PGP SIGNATURE-----

--GgcUcrZJ+3fZpfIE--


--===============8999776582279770739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8999776582279770739==--

