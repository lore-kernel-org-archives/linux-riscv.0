Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4B4E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 09:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4iorra1jkFQ9TA2D5Mnp0+7tg7zxcVwc2Yq7BK77+A=; b=mruEaEZxo3Z4VNGm+if9eS2SYr
	K17QJJfz8cjlgno0YYJETDaDxVp1KxmTNj1RZkdVcJQMGKDn5q218pPOqec+jKKOVHWi9UU/3x07z
	zFKfw+P/TotkvLe7dRXZy38KrZoZsr0ou5/hh0jOnEo7mxzlnJDQf1YYcdXt01JtHSeHFzEQO+3xF
	5TNZblBK/xR3MyBZ+kLJTM2mZOLa5CXSyLqNlDwg5pZ9HVXKdD3zYTpQmXgO0RZLX9tW+6VDp4Sed
	m1tJAzuWX3e8lwxiTy8T1rai/Hh58RyCRJ86W5GPqgR6kl8wphGXrnZv7Ufx4tb30puqFEIJmsmck
	FUIzhFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmSm-00A556-39;
	Mon, 09 Oct 2023 09:22:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpmSh-00A52K-2a
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 09:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696843323; x=1728379323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nl/Pb7yNcrRSIji9Rq2BWcaYNm9rNVSMwfevq+ZJbXU=;
  b=crShZL9+dzmEF1T5a/saHroMLQ2u60EH2yMA+n//Utywp0zNZrzEzYsy
   Hw9LtZlLrUKbed10MHJEwkQ1pkeBt1QfbYOE3S8kxTHfaR9r8yaLUa9HV
   6dQ1jafdJabaRGNpvMAKcIVlVhlr7z31zpmM6rHc7md7vBLiDTFbTYixL
   51Uv1DJOgoCaEKAQJqHmz4H4nGyzzZ04Y6NhKm1f0bpDkoLo3HB5WjzGP
   zIOBnEQlmo3P13AoJSIytQLdK6TsOgk7RMa57O4KglkjMVnTJNDsaE5bI
   D6xWQWyD/iOentXUGWRN0USRCzQf3ao26mlY8+5q/iQkhhL8i3EbMpSPM
   A==;
X-CSE-ConnectionGUID: crs7sF3tRlKn6sEwzlDrPg==
X-CSE-MsgGUID: 9cWccrISQheTSGzag4PSBQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="asc'?scan'208";a="176377026"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 02:21:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 02:21:59 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 02:21:56 -0700
Date: Mon, 9 Oct 2023 10:21:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: <linux-renesas-soc@vger.kernel.org>, <conor@kernel.org>, Randy Dunlap
	<rdunlap@infradead.org>, Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] soc: renesas: select ERRATA_ANDES for R9A07G043 only
 when alternatives are present
Message-ID: <20231009-acuteness-nutlike-1f28a2335384@wendy>
References: <20231009-sandbar-botch-0f398fd2e289@wendy>
 <CAMuHMdVojwgOP8bqHobgbsgUA+7yxUA7v5M6Z800zxrCeuxZjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVojwgOP8bqHobgbsgUA+7yxUA7v5M6Z800zxrCeuxZjg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_022204_057609_CA6E9A97 
X-CRM114-Status: GOOD (  27.43  )
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
Content-Type: multipart/mixed; boundary="===============7404086002041499447=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7404086002041499447==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H8JAiz5CASvgRsHi"
Content-Disposition: inline

--H8JAiz5CASvgRsHi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 10:34:34AM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
>=20
> On Mon, Oct 9, 2023 at 10:12=E2=80=AFAM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> > Randy reported a randconfig build issue against linux-next:
> > WARNING: unmet direct dependencies detected for ERRATA_ANDES
> >   Depends on [n]: RISCV_ALTERNATIVE [=3Dn] && RISCV_SBI [=3Dy]
> >   Selected by [y]:
> >   - ARCH_R9A07G043 [=3Dy] && SOC_RENESAS [=3Dy] && RISCV [=3Dy] && NONP=
ORTABLE [=3Dy] && RISCV_SBI [=3Dy]
> >
> > ../arch/riscv/errata/andes/errata.c:59:54: warning: 'struct alt_entry' =
declared inside parameter list will not be visible outside of this definiti=
on or declaration
> >    59 | void __init_or_module andes_errata_patch_func(struct alt_entry =
*begin, struct alt_entry *end,
> >
> > On RISC-V, alternatives are not usable in XIP kernels, which this
> > randconfig happened to select. Add a check for whether alternatives are
> > available before selecting the ERRATA_ANDES config option.
> >
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > Tested-by: Randy Dunlap <rdunlap@infradead.org>
> > Closes: https://lore.kernel.org/all/09a6b0f0-76a1-45e3-ab52-329c47393d1=
d@infradead.org/
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
> > @@ -343,7 +343,7 @@ config ARCH_R9A07G043
> >         select ARCH_RZG2L
> >         select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
> >         select DMA_GLOBAL_POOL
> > -       select ERRATA_ANDES if RISCV_SBI
> > +       select ERRATA_ANDES if (RISCV_SBI && RISCV_ALTERNATIVE)
>=20
> Perhaps ARCH_R9A07G043 should depend on RISCV_ALTERNATIVE (and
> RISCV_SBI) instead?  It's not like RZ/Five is gonna work without the
> Andes errata handling present (unless all of them are related to cache
> handling, and we can run uncached; also see below)).
>=20
> >         select ERRATA_ANDES_CMO if ERRATA_ANDES
>=20
> And then this "if" can go as well.
>=20
> Any other hard dependencies?
> E.g. can RZ/Five work without RISCV_DMA_NONCOHERENT?

That seems fair to me, it won't work without any of the above, so it's
probably fair game to make them actual dependencies & likely more user
friendly since it'll prevent people creating a kernel that cannot
function.

Cheers,
Conor.

>=20
> >         help
> >           This enables support for the Renesas RZ/Five SoC.
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --=20
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

--H8JAiz5CASvgRsHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSPGIAAKCRB4tDGHoIJi
0pQdAQDP0EDastcRyfubosMkIjTRJbu3yHBbxDcEIeHUXE1/2QEAgoXMXZl4RxM7
cxShvCs8UHEpmf2WuY+pPyQiXnxHvQ4=
=VHI5
-----END PGP SIGNATURE-----

--H8JAiz5CASvgRsHi--


--===============7404086002041499447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7404086002041499447==--

