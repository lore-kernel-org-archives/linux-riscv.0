Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF02C001DF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5n4MrrSerGyqKHQaYBHXdd+/aIAufezyYuXVt2TNgs=; b=LKtcHsB4G7ZHRIGjaDsgjCJS2C
	Nmj05VfAdJ8Fm0Sx+2gSc8PX8V7jxQUVH4tNHH9oAjDRLGKjlZk0fR8w/wSkba19Tsar5tBzq2KsK
	Vo18zrg8FAGzGxS9NH/0F/ZOyyOu3C8/NqH6REZQZh5ZiNGfAIxWr/NcLg1/Fysr4UuFcvbAIHpTd
	U846kTha5k+twW4dgUh8/4p7I/6RI8B3Gi4fxSrr+vw8ub67GfxydhECWz5N7d/P7+L2ssfVRgiq9
	AYz2GWhD2NLLuAVrv3C/0XOG3nC7JcYgYQkRVa4i+ZrhAeyaXFHyOYmb0OwmLthnBvYV1gvfHO3vj
	bDsIkoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwCE-003Nro-2g;
	Thu, 13 Jul 2023 13:17:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwCB-003Nr4-37
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 13:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689254244; x=1720790244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E7sEqqhbrFfmEZwgyxrnHJnRF+eAaOP0Nzd8hDng2VE=;
  b=WzhBnUuo1HGZYV1tGa0h+b6sbWVote+zEHB3XAkgE394K73dj6wHUvJE
   J7Z+2RZfc1RKcGhikIaaA7Fas4xoG31rgdZHG3Rm6/wWJVx/qxN8dK8iL
   xtMJHDUtkK5JOvtBfj52a/D2u8GmpegmI30DEr3Kezsnq5QaLUd/QDraz
   iPwGMtx1MwQlyaZSRXk2Mm5yuTFmhyWjhttD7mLC7OF2RLzMzB7//iDdP
   vJvCoq4Hvu/Oo8U4sDDxl5c8/ZT+YiB27kyXZ5yieCqiQInLBR5zPAH/3
   oFvMNUfNtr+2m8iHqNPHv4cPSlbGVeEApIaaVviaQGfewYJEOObCs1Uj2
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="asc'?scan'208";a="220208830"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2023 06:17:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 13 Jul 2023 06:17:17 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 13 Jul 2023 06:17:14 -0700
Date: Thu, 13 Jul 2023 14:16:43 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Evan Green <evan@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>, <linux@rivosinc.com>, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>,
	<linux-kernel@vger.kernel.org>, Guo Ren <guoren@kernel.org>, Atish Patra
	<atishp@rivosinc.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	<devicetree@vger.kernel.org>, <sorear@fastmail.com>, Jiatai He
	<jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH v4 1/4] RISC-V: Add Bitmanip/Scalar Crypto parsing from DT
Message-ID: <20230713-bootleg-tray-c5bfe58b5673@wendy>
References: <20230712084134.1648008-1-sameo@rivosinc.com>
 <20230712084134.1648008-2-sameo@rivosinc.com>
 <20230712-bulldozer-affected-199042dc3afd@wendy>
 <CALs-HsuxxVcwX=mSwktPiEiAFkfK+5qJ6zg1Bzf2t37L=pZWjw@mail.gmail.com>
 <20230713-3f574332a06678f908cee21e@orel>
 <20230713-aggregate-uncut-e16ee9270b14@wendy>
 <20230713-692c967c7a08c15dacbcab10@orel>
MIME-Version: 1.0
In-Reply-To: <20230713-692c967c7a08c15dacbcab10@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_061724_067325_BF478923 
X-CRM114-Status: GOOD (  16.33  )
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
Content-Type: multipart/mixed; boundary="===============4675700190960984992=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4675700190960984992==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gTE48Nq7TkHCRHEc"
Content-Disposition: inline

--gTE48Nq7TkHCRHEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 02:45:57PM +0200, Andrew Jones wrote:
> On Thu, Jul 13, 2023 at 12:27:24PM +0100, Conor Dooley wrote:

> > +#define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) {	\
> > +	.name =3D #_name,					\
> > +	.property =3D #_name,				\
> > +	.bundle_ids =3D _bundled_exts,			\
> > +	.bundle_size =3D ARRAY_SIZE(_bundled_exts)	\
> > +}
> > +
> > +static const unsigned int riscv_zk_bundled_exts[] =3D {
> > +	RISCV_ISA_EXT_ZBKB,
> > +	RISCV_ISA_EXT_ZBKC,
> > +	RISCV_ISA_EXT_ZBKX,
> > +	RISCV_ISA_EXT_ZKND,
> > +	RISCV_ISA_EXT_ZKNE,
> > +	RISCV_ISA_EXT_ZKR,
> > +	RISCV_ISA_EXT_ZKT,
>=20
> I think RISCV_ISA_EXT_ZKNH also belongs in this bundle,
> since the spec says zk is the zkn bundle plus zkr and zkt.
>=20
> > +};
> > +
> > +static const unsigned int riscv_zkn_bundled_exts[] =3D {
> > +	RISCV_ISA_EXT_ZBKB,
> > +	RISCV_ISA_EXT_ZBKC,
> > +	RISCV_ISA_EXT_ZBKX,
> > +	RISCV_ISA_EXT_ZKND,
> > +	RISCV_ISA_EXT_ZKNE,
> > +	RISCV_ISA_EXT_ZKNH,
> > +};
> > +
> > +static const unsigned int riscv_zks_bundled_exts[] =3D {
> > +	RISCV_ISA_EXT_ZBKB,
> > +	RISCV_ISA_EXT_ZBKC,
> > +	RISCV_ISA_EXT_ZKSED,
> > +	RISCV_ISA_EXT_ZKSH
>=20
> And, per the spec, this one appears to be missing RISCV_ISA_EXT_ZBKX.

Yeah, these do look wrong. I should've cross-checked it.

> I found [1] which calls these shorthands "group names", so maybe we should
> use the term "group" instead of "bundle"?

WFM at least.

> I'm tempted to try to directly
> code that graphic in [1] with something like...
>=20
> #define Zks_group1 \
> 	RISCV_ISA_EXT_ZKSED, \
> 	RISCV_ISA_EXT_ZKSH
>=20
> #define Zks_group2 \
> 	RISCV_ISA_EXT_ZBKB, \
> 	RISCV_ISA_EXT_ZBKC, \
> 	RISCV_ISA_EXT_ZBKX
>=20
> #define Zks_group \
> 	Zks_group1, \
> 	Zks_group2
>=20
> #define Zkn_group1 \
> 	RISCV_ISA_EXT_ZKND, \
> 	RISCV_ISA_EXT_ZKNE, \
> 	RISCV_ISA_EXT_ZKNH
>=20
> #define Zkn_group2 \
> 	Zks_group2
>=20
> #define Zkn_group \
> 	Zkn_group1, \
> 	Zkn_group2
>=20
> static const unsigned int riscv_zks_group[] =3D {
> 	Zks_group,
> };
>=20
> static const unsigned int riscv_zkn_group[] =3D {
> 	Zkn_group,
> };
>=20
> static const unsigned int riscv_zk_group[] =3D {
> 	Zks_group,
> 	Zkn_group,
> 	RISCV_ISA_EXT_ZKR,
> 	RISCV_ISA_EXT_ZKT,
> };
>=20
> ...but now that I have, I'm not sure I like the looks of it...

If you called them RISCV_ISA_EXT_GROUP_ZKN (or similar) it would look a
lot less out of place IMO. I'd probably drop the "group2" dance & pick a
better name for "Zks_group2", maybe just do something like
RISCV_ISA_EXT_GROUP_SCALAR_CRYPTO_BITMANIP? Mouthful, but seemed better
than trying to be clever with ZBK or something.

> [1] https://wiki.riscv.org/display/HOME/Scalar+Cryptography+Instruction+S=
et+Extension+Group+Names+Diagram


--gTE48Nq7TkHCRHEc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK/5OwAKCRB4tDGHoIJi
0ry5AP99PnMNEOYct0QDkIe2N2+G1CGzJmhUN6A1xqT/KkLs0QD/aE6I9W7tY9lW
A0LBQi1Gw8uUta0WbR/Ph1YYceZVtAU=
=6z5J
-----END PGP SIGNATURE-----

--gTE48Nq7TkHCRHEc--


--===============4675700190960984992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4675700190960984992==--

