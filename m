Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C2AC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUqW17uR0B7UniO9lUS5qZ2KyFSDeNmYAiXx4N2nI4k=; b=nrQVxm8iTdBAiSYxyW3nL1HAZl
	WHDFWXpft9VmstGdDWVXO8L221WTDB2vnjASfL+aHqUk8EXwdzWxZHsbHV2not7kGHzAFeg2DqVfK
	Lr0yttTN5MkYSsAf2fh5mB5JSXzP8bZUF8dxxI1kyyMlR7O/72bok1quOSBdw6eAJ0N1V2osUScRk
	I5QXzJJbTQCKVoxbkkfugDOjLA6CfZac7IiWLyYb8sb6hlq8mtpQG29KAvIAgPj9rm9xkOOjw/7GA
	j7shMofxwp9UrQ/1Ixx3lzFdzn5XlVngsSbCBwUgRF1vf+LjPMkl5VrazEUjVbkd6yb7YC8rMey+v
	cBljW0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXcO-0000000AS6A-3aVF;
	Wed, 27 Mar 2024 18:03:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXcL-0000000AS5A-3lmx
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 18:03:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32FBA61638;
	Wed, 27 Mar 2024 18:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8FBC433C7;
	Wed, 27 Mar 2024 18:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711562596;
	bh=0O8XCY11WB9l5WV+H/o+LxwXGJuiHlEDHBA2DM0WnNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbKfIGdymFcXCV4gfFbDa95Uq9FJ5xB6pOYGVLZYOn9MoYlCbWkgzyyTMaWGK+Jmu
	 lWXVTGJ0TCUHbYf0uJimJ0scqKUxYXJ/jdb08X5UeYV0iUpkj9+0Tjbwir1SIO+LhY
	 N6+9aH5PaTWhHaLZo4DNHBy1a70e9zt9dHYIUuYfJTjpri8nOjcYRgW6VhJOSLVTCJ
	 sJymvBS9NJVlVdRkuedfQtYogCa9EQC4ISQlkI0zJvRwi0WwcTxo287SBxGCMPuDdq
	 vaAB6IfTkgxrdaRK0nXMCQ7en/W/YXaE3lRkALcV48jwu0bpeOfizgnFFa5b8TxRxI
	 yEqVCvdk1Fotw==
Date: Wed, 27 Mar 2024 18:03:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRD?=
 =?utf-8?Q?H_v1_1=2F2=5D_dt-bindings?= =?utf-8?Q?=3A?= media: starfive: Match
 driver and yaml property names
Message-ID: <20240327-unlucky-bulge-2bf99a8649be@spud>
References: <20240119100639.84029-1-changhuang.liang@starfivetech.com>
 <20240119100639.84029-2-changhuang.liang@starfivetech.com>
 <20240119-despair-festival-59ab2d4d896b@wendy>
 <SHXPR01MB0671E2150D9A2707F12E0901F270A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
 <20240119-preamble-calm-7724e17fcebc@wendy>
 <BJXPR01MB0662E6EEEEF888BD90A1FCE5F275A@BJXPR01MB0662.CHNPR01.prod.partner.outlook.cn>
 <20240122-uncivil-almost-631137081fd9@spud>
MIME-Version: 1.0
In-Reply-To: <20240122-uncivil-almost-631137081fd9@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_110318_070916_594B3282 
X-CRM114-Status: GOOD (  24.90  )
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
Content-Type: multipart/mixed; boundary="===============3232354335886508216=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3232354335886508216==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zzCqoLyA9q69ODhP"
Content-Disposition: inline


--zzCqoLyA9q69ODhP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 08:24:51AM +0000, Conor Dooley wrote:
> On Mon, Jan 22, 2024 at 01:33:56AM +0000, Changhuang Liang wrote:
> >=20
> > > On Fri, Jan 19, 2024 at 12:57:22PM +0000, Changhuang Liang wrote:
> > > > EXTERNAL EMAIL: Do not click links or open attachments unless you k=
now
> > > > the content is safe
> > > >
> > > > Hi , Conor
> > > >
> > > > > =E4=B8=BB=E9=A2=98: Re: [PATCH v1 1/2] dt-bindings: media: starfi=
ve: Match driver
> > > > > and yaml property names
> > > > >
> > > > > On Fri, Jan 19, 2024 at 02:06:38AM -0800, Changhuang Liang wrote:
> > > > > > Drop some unused properties for clocks, resets and interrupts f=
or
> > > > > > StarFive JH7110 camera subsystem.
> > > > >
> > > > > What do you mean "unused"?
> > > > >
> > > > > Do these clocks etc exist but are not used by the driver?
> > > > >
> > > > > Or do they not exist at all?
> > > > >
> > > > > The two are very different!
> > >=20
> > > > These clocks etc exist but are not used by the driver.
> > >=20
> > > That's not an acceptable reason for removing them from the binding. I=
f they
> > > exist, they should be documented, regardless of whether the driver ma=
kes use
> > > of them. NAK.
> >=20
> > If so, how to avoid the warning of dtbs_check.
>=20
> By also adding the clocks, resets and interrupts to the dts.

Going through patchwork stuff now that the merge window is done. I'm
gonna mark the dts patch as changes requeted. The binding (and dts)
should describe all of the clocks the hardware has, whether or not you
choose to use them all in software does not matter. Can you please
resend the dts patch, with all of the clocks, resets and interrupts
present?

Thanks,
Conor.

--zzCqoLyA9q69ODhP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgRfXwAKCRB4tDGHoIJi
0qQXAQDfBiXwvtzOzuvMjituCroQrHpvVV9xsdNonK911KyCSwEA799G/wBfPBYb
V3sbl2B9KISp0AvY5FbPCNrcFvvq8Qg=
=gcwu
-----END PGP SIGNATURE-----

--zzCqoLyA9q69ODhP--


--===============3232354335886508216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3232354335886508216==--

