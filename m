Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F25C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGNtWz8Wg4P9dpiatl4WeUZ6xzlLce7DB71aXbVY98M=; b=Y3A9oRF5CKHtCeGWTykuCustRC
	0RflUI5xchEb9rt6rnmmC2yk+IwEckIMqkT4YBwxpw14qqemof9PK0frPK3SDxJG4UQAjUjD5AbmT
	jz3jEbJkyfOuy9QHCinPqMP71yWuoqWTGHT9VIbWHPM2S3IqRIXEWcC7bFJYLxTNmsp3C9jw4ExdJ
	pEpI+NXv9U9IRuNLY2YIjyN8KsQF7nNA+J383dBy5EKhCF3Pp/TAIvCQy3pkpcJdsWIZm0743+WuO
	uNkjXqVBpf3qR7r1WewwJes/xuXinZ3FONZcSDxSIJ1n2ol1mCMVcf3tUIEdsGJeoBsU2EmuLBYNE
	9LZUo+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puVic-007MQp-2v;
	Thu, 04 May 2023 09:57:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puViZ-007MPD-2A;
	Thu, 04 May 2023 09:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683194263; x=1714730263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=skX0KctM5NyGzhY5XFNMWtwT33oUgFCc7oCsUf4NI6Q=;
  b=hNdk/pyR6r/PKIAoAkY55Puwy++7w+7BLHTrNQjUBAJ9r7jpS6/7CAE/
   1VcsAAdbtLhtVtRsPkzUDqMNCf1cbcKMgGnWSP2Ell/DEb4xc0d5EK3m6
   /oySOEy5DvTLhvGWA2ejPjjER6+CrCQ4rDrenQ2paOYYoSe+yWhgRjQoJ
   GauC4/bX0/vGDF3SKKQjf8u9daV34l+DD57HyFbgOp0s8rriJlmROLYUw
   mhlRIA8RoZI0tXXCwjkXpuccTAa7zE1DmXCbk8TCRJf7PU0slVuiOXg8j
   6263xUxl+8bY+EBwdVAqfxaIgeiC06mdUZwz3OsJAhndeWY+K/q+CYGxa
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677567600"; 
   d="asc'?scan'208";a="213646175"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 May 2023 02:57:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 4 May 2023 02:57:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 4 May 2023 02:57:31 -0700
Date: Thu, 4 May 2023 10:57:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <vkoul@kernel.org>,
	<linux-phy@lists.infradead.org>
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Message-ID: <20230504-worshiper-ongoing-5581e1f2c2c4@wendy>
References: <20230425-commotion-prewashed-876247bed4ab@spud>
 <0b0f9187-ad6b-a1d9-6ec4-beb8989ca731@starfivetech.com>
 <3ed72340-accc-4ad1-098f-4a2eb6448828@linaro.org>
 <482e812a-05dd-105c-189c-e926b4be9d28@starfivetech.com>
 <089e24d1-588a-4a56-f00b-0b35d1d99295@linaro.org>
 <ea5b5534-8fc2-7c84-a011-c1b42c6ed7a0@starfivetech.com>
 <1ac26c1a-1726-515d-6598-849a07ed0b86@linaro.org>
 <5adda0ad-965c-fbf0-878c-9d41d28b5c39@starfivetech.com>
 <86693969-59bf-5bcc-42a3-b6e94a0d6f3e@linaro.org>
 <fcfc8ba4-40a7-da43-3375-712bd7e7f4d5@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <fcfc8ba4-40a7-da43-3375-712bd7e7f4d5@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_025743_959492_28805295 
X-CRM114-Status: GOOD (  16.99  )
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
Content-Type: multipart/mixed; boundary="===============5368156007831805825=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5368156007831805825==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+N3Mbg4s7LcQH++0"
Content-Disposition: inline

--+N3Mbg4s7LcQH++0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 05:48:20PM +0800, Changhuang Liang wrote:
> On 2023/5/4 17:36, Krzysztof Kozlowski wrote:
> > On 04/05/2023 10:43, Changhuang Liang wrote:

> >> On 2023/5/4 15:26, Krzysztof Kozlowski wrote:

> >>>> aon_syscon: syscon@17010000 {
> >>>> 	compatible =3D "starfive,jh7110-aon-syscon", "syscon", "starfive,jh=
7110-aon-pmu";
> >>>> 	reg =3D <0x0 0x17010000 0x0 0x1000>;
> >>>> 	#power-domain-cells =3D <1>;
> >>>> };
> >>>>
> >>>> If right? I will tell the syscon patch's owner delete the "simple-mf=
d" in aon_syscon node.
> >>>
> >>> Yes, but your compatibles are now wrong. Just compatible =3D
> >>> "starfive,jh7110-aon-syscon", "syscon".
> >>>
> >>
> >> If compatible =3D "starfive,jh7110-aon-syscon", "syscon". My pmu drive=
rs need use=20
> >> "starfive,jh7110-aon-syscon" to match.
> >=20
> > And how it would even work with your proposal
> > "starfive,jh7110-aon-syscon", "syscon", "starfive,jh7110-aon-pmu"?
> >=20
> > Try...
> >=20
> >>  And my pmu series will add this=20
> >> aon_syscon in yaml and device tree, so the syscon patch's owner don't =
need=20
> >> to add the aon_syscon in its yaml and device tree?
> >=20
> > I don't understand. But if you need to drop syscon, sure, drop it.
> >=20
>=20
> Yes, I think it can drop aon_syscon node in syscon patch series. And mayb=
e my
> compatible =3D "starfive,jh7110-aon-pmu", "syscon"; is better.
>=20
> aon_syscon: syscon@17010000 {
> 	compatible =3D "starfive,jh7110-aon-pmu", "syscon";

I don't really understand why you actually need to have this compatible.
Why not keep "starfive,jh7110-aon-syscon" & register the PMU using a
software mechanism?

> 	reg =3D <0x0 0x17010000 0x0 0x1000>;
> 	#power-domain-cells =3D <1>;
> };
>=20
> Best regards,
> Krzysztof

^^^^^^^^^^^^^^
btw, your mailer is doing something odd with quotation.

Cheers,
Conor.

--+N3Mbg4s7LcQH++0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFOBbgAKCRB4tDGHoIJi
0kPXAQDud5N7nXj7gDMGD+6MnWsxLG803WiUGD455jBCgzvmeAEAps+uRCXiT365
KJIw/A5d325YftGjykNMpI0usmQWPg4=
=HjHL
-----END PGP SIGNATURE-----

--+N3Mbg4s7LcQH++0--


--===============5368156007831805825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5368156007831805825==--

