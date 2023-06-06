Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EDDC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 11:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojpv1GCZMRMc4nIiBHQJwwQUikM2I+/BB+fltOlwE/g=; b=3OQGzFZzHNkcEC+OppCDx3K4bQ
	oeR9L4fUdSpTPCKwaYMg2JVuWgUdEg2/kKDcj2MLcXRvG5rPbVyYa0ug0C2Otos8YjHuGxT+XzOKn
	4jZFLjNos93xA/37dNEWVD8jII4MQjlVdoW/xB6kpHLCxrf7f4k8a34HDCaAoj4GgzZtJPr7mDSNx
	+nB2MfitqsXB5cDtw5g/ipABpcGu+Vhbi2aVy0PEwP0OC4t/r/svZR5BO64MHUh4aAr0jypE8kDwu
	Ogo1K0ujFJ53BZ5qJ3R7gaHH3yNxdNXE14sTJa1EZ2Ydsnkq412pgGsHCvBMLjzHbtUGhfIt/+VNV
	mpUyIbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Uuy-001S9o-0q;
	Tue, 06 Jun 2023 11:32:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Uuu-001S8C-2E
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 11:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686051120; x=1717587120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PX4wIJsd0NfghjQ/uFE2ySZMqtdfL0c7FgIDmxAuXAg=;
  b=JKD6vcCjT2s3tAkB1V0Rveig0UINnxFan8tkIxrEfwjXf7+/VRXT6zR1
   U0V1vC3+lwrgf8fYre0tqHahcupmBUeaPTsGSz5O38leJ5UIuKwNEo83B
   aRZGnwIfPZuBfU4urtkwMwG+gX+48X5AIUXE3wPApa+69hs15dodcBkfy
   QTw24L8zDUqIQRj/ZTy5Z3mcc+bknLOXAwKhJmUiI5pKGOJJQzRiFPxY8
   PYPcTEEctLWlV5I8Q8JEUY5wYDiidWbE0/saV6KX1r5nAliilvKJoU236
   qPQtZapWAtTIxlIR6ejkmLPE2TV1IMFM5fKEMIHo2veCwEWnsaIyYuGX4
   A==;
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="asc'?scan'208";a="155753414"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2023 04:31:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 6 Jun 2023 04:31:47 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 6 Jun 2023 04:31:45 -0700
Date: Tue, 6 Jun 2023 12:31:21 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: Mason Huo <mason.huo@starfivetech.com>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shengyu Qu <wiagn233@outlook.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] cpufreq: dt-platdev: Add JH7110 SOC to the
 allowlist
Message-ID: <20230606-unsmooth-slip-c80fab59c9b4@wendy>
References: <20230606105656.124355-1-mason.huo@starfivetech.com>
 <20230606105656.124355-3-mason.huo@starfivetech.com>
 <20230606110804.qns4rolrrj2gku6w@vireshk-i7>
MIME-Version: 1.0
In-Reply-To: <20230606110804.qns4rolrrj2gku6w@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_043200_797864_A1012F2D 
X-CRM114-Status: GOOD (  16.28  )
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
Content-Type: multipart/mixed; boundary="===============4591031521710350031=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4591031521710350031==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PVnj5Dy2DGpzU6zM"
Content-Disposition: inline

--PVnj5Dy2DGpzU6zM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 04:38:04PM +0530, Viresh Kumar wrote:
> On 06-06-23, 18:56, Mason Huo wrote:
> > Add the compatible strings for supporting the generic
> > cpufreq driver on the StarFive JH7110 SoC.
> >=20
> > Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> > ---
> >  drivers/cpufreq/cpufreq-dt-platdev.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpu=
freq-dt-platdev.c
> > index 338cf6cc6596..14aa8281c7f4 100644
> > --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> > +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> > @@ -85,6 +85,8 @@ static const struct of_device_id allowlist[] __initco=
nst =3D {
> >  	{ .compatible =3D "st-ericsson,u9500", },
> >  	{ .compatible =3D "st-ericsson,u9540", },
> > =20
> > +	{ .compatible =3D "starfive,jh7110", },
> > +
> >  	{ .compatible =3D "ti,omap2", },
> >  	{ .compatible =3D "ti,omap4", },
> >  	{ .compatible =3D "ti,omap5", },
>=20
> I thought I already merged it ?

You did, 4b4c0d37164c ("cpufreq: dt-platdev: Add JH7110 SOC to the
allowlist").

--PVnj5Dy2DGpzU6zM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH8ZCQAKCRB4tDGHoIJi
0rJnAQDaPUiev8/jv4DVEX6KPrP+2lQ61lVWp7MZRr2EUXwcuwD/RmDLMvupVtZR
NAUW47q4A9h7saZRU5kbxp63KRZKOAQ=
=RJ+E
-----END PGP SIGNATURE-----

--PVnj5Dy2DGpzU6zM--


--===============4591031521710350031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4591031521710350031==--

