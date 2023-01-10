Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B17C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 10:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0cWa1117yKDEtanmayXfqXcMHKmVY+G4nZ2oe0bCAg=; b=ap6NiTZIgzgp3nzNArC5pHp/cO
	UzB+x4rWGTNR5DXwfEdmKxSXI4dkxGtbiYUnYctzBI3XuCdKEmacPu9W2HHY9R/WPQzEKK8pnk1WD
	lJpIrNcmPRmWnTxp+vV0YL9rmiJYMMOd+JPhM/TBvGNdlJruVed40EFIveH06HLC2BHw9C1VFH5Nm
	6HEZEAR1yBwfH4MqmR3j63prXNfnHHUcC9FV2+NVGOAToLwoV7F467T7lBfpZQL5qeMgZ5LjkI4RT
	6WY3CBsRnxHIagB861n8AxHINjjTdAE5JUypYH1uwkl2aITr/p5DSiOZWy/ie32diRJRDiLH23W66
	bbGsHWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFBev-006IV8-Ct; Tue, 10 Jan 2023 10:15:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFBer-006ITB-DC
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 10:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673345705; x=1704881705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X4PQdGvyzshTtjak29gfmTqdE++yT7mv7C9VYz4viRI=;
  b=vYRhLCMdnEBwwh/tzffdvCPlkc6BAtHurcJ4kxagMFOSs5vQsxwD8X1F
   gh1jnvwxXW9OQ5rsNcsuLF2Bsw15PAWBfipr/TgZCeyY4ohNbQN2BYDDm
   i7bVbHY3iK5T+4xpzhJ7MigoeBd9giiQU48Fu0KCMevccjtHLV3D2bjbm
   pZ2f79y77YcjsyibjEavc916mEkFUZ/rHUsxf4pCv16JHw4RQKcALbI8Z
   vsYh/X4oq2vKEVK473TzC0OnJEWPr/ZBxLYBm7Af/U2kEnQBbR3Er2Lqd
   5q96jFhMaeWdVquAg+denXMWUi9QxP5FgY+T01Z8b/i0za0FsQK/0F4Lx
   w==;
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="asc'?scan'208";a="191543414"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jan 2023 03:15:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 03:15:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 03:14:58 -0700
Date: Tue, 10 Jan 2023 10:14:37 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Heiko Stuebner <heiko@sntech.de>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <christoph.muellner@vrull.eu>, <conor@kernel.org>,
	<philipp.tomsich@vrull.eu>, <jszhang@kernel.org>, Heiko Stuebner
	<heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 5/5] RISC-V: add zbb support to string functions
Message-ID: <Y706jSZjUOle32m+@wendy>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-6-heiko@sntech.de>
 <20230110095720.j7ll3qwmwneodmpw@orel>
MIME-Version: 1.0
In-Reply-To: <20230110095720.j7ll3qwmwneodmpw@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_021505_583510_AE78B130 
X-CRM114-Status: GOOD (  20.82  )
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
Content-Type: multipart/mixed; boundary="===============0952355900790135263=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0952355900790135263==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ih/lDtkR+0zU4FJO"
Content-Disposition: inline

--Ih/lDtkR+0zU4FJO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2023 at 10:57:20AM +0100, Andrew Jones wrote:
> On Mon, Jan 09, 2023 at 07:17:55PM +0100, Heiko Stuebner wrote:

> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 1b9a5a66e55a..c4d1aa166f8b 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -162,6 +162,7 @@ arch_initcall(riscv_cpuinfo_init);
> >   *    extensions by an underscore.
> >   */
> >  static struct riscv_isa_ext_data isa_ext_arr[] =3D {
> > +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> >  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> >  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> >  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>=20
> Huh, this array still doesn't appear to be in order... Zbb should
> be getting inserted between the Zi* extensions (which should be first)
> and the S* extensions and each of those three categories should be
> in alphabetical order.

Correct. The new entry was at least added in the right place, reordering
existing entries aside.

> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 205bbd6b1fce..bf3a791d7110 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -222,6 +222,7 @@ void __init riscv_fill_hwcap(void)
> >  					set_bit(nr, this_isa);
> >  				}
> >  			} else {
> > +				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
> >  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
> >  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> >  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>=20
> I think we wanted this one in alphabetical order...

Correct again.

I've been avoiding mentioning this stuff in reviews though as Palmer has
not yet picked up the patches [0] putting these arrays into those orders
in the first place.

I tried to harass him about them last night, but he didn't get around to
them. Perhaps worth mentioning tomorrow if we're gonna keep having to
discussing these lists in reviews?

Thanks,
Conor.

0 - https://lore.kernel.org/all/20221205144525.2148448-1-conor.dooley@micro=
chip.com/
(I tried applying it yesterday, worked with `git am -3`)

--Ih/lDtkR+0zU4FJO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY706iAAKCRB4tDGHoIJi
0ruPAQCuNJyEEFA25S8K5ucCAYoQUFZUrT3Ruz6Sdyk2eMoW4AD/d00RPr37WDNn
53Ni5Nm3mmS99W837nJz8A/8aK7v1Qk=
=1VFm
-----END PGP SIGNATURE-----

--Ih/lDtkR+0zU4FJO--


--===============0952355900790135263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0952355900790135263==--

