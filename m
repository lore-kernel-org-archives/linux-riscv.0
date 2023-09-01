Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B76CA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 06:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQwmk5SOaLd6Ao+u6zGOocYo0lTK8Syyr6LvB1dP7Zg=; b=NzqT1gHoavr7AR9Ow7VYJ8o59q
	crenxVjq9lwECcKhvtrHNkSy+YWTn7kir+ut6rYSB59s1GCLWLl5Ilk7A1SWifq3AQlg+yKpIpgEL
	H6KvTlt2jumQ1Y62wmygF1ZLoMGoMmGjLSvqMRv6AV3kQPym5e0iAIUWPHFr+zLwqT6vrx5L5PFzw
	MhqsMixtSCLfnqj6yrEOBxb3XoZTMvAdFd/e7yDug+nCB+CvvWRb/VLOmA3itYtldBM6twVJcwu00
	65E464IKWi+jTxU1CwNzRNgxQrin2VNVjSZEjoD+/pdlL75hXiudCySaqj7kbBWTtG1g9YbS+cBAm
	ikbnfaEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbxc2-00GXdR-0t;
	Fri, 01 Sep 2023 06:26:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbxc0-00GXd5-0s
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 06:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693549592; x=1725085592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aAlPFkFFJ0tKP+R+0ojprm+uUm4swQJFKVrG7PiJNPU=;
  b=IdBpHMulkSLlWtH/p3pi1F+a2QOkrBPRsMcw2KRMg69peDEWLblxeSDH
   15Su+QNIAujCKQP6Wgv1mpiS1X5vQXB94z3ErPfABmtrIsXp46q9ajj3d
   NA1994uexK9Yi8YpVvoL45bWVesrQVmuHrSXJSQ8l/Nj5Fpaw3GK0Ftge
   Bv9idi+ky0e55v9p/lkK5abtjVKgraNRBQPQdMMQosyMjlh2u13PE+JPo
   lq/ZsPKz8tTFBcR8fYmWGuqu8kzs/2jwNzFjdt5qtN7ZjNWTqygg4ornh
   o0NeyeViB0G2OvKTesRRwqujpR2vIMRyD3Lu1boms0pSNrVKLgZZykyGY
   g==;
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="asc'?scan'208";a="2394248"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Aug 2023 23:26:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 31 Aug 2023 23:26:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 31 Aug 2023 23:26:29 -0700
Date: Fri, 1 Sep 2023 07:25:47 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandru Ardelean <alex@shruggie.ro>
CC: Andrei Coardos <aboutphysycs@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<herbert@gondor.apana.org.au>, <olivia@selenic.com>,
	<daire.mcnamara@microchip.com>
Subject: Re: [PATCH] char: hw_random: mpfs-rng: removed unneeded call to
 platform_set_drvdata()
Message-ID: <20230901-upper-reenter-9c2fa8bf7a47@wendy>
References: <20230828101757.9724-1-aboutphysycs@gmail.com>
 <20230828-citable-superjet-d235f036be99@wendy>
 <CAH3L5QreWNPgwogL7bCYZgKSuz_HfZuKLtRVqz+UyRtJ1TB-SA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH3L5QreWNPgwogL7bCYZgKSuz_HfZuKLtRVqz+UyRtJ1TB-SA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_232632_319807_81C5FF64 
X-CRM114-Status: GOOD (  27.82  )
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
Content-Type: multipart/mixed; boundary="===============8929156998312542934=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8929156998312542934==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rbkSUiqy942IY70F"
Content-Disposition: inline

--rbkSUiqy942IY70F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 09:07:56AM +0300, Alexandru Ardelean wrote:
> On Mon, Aug 28, 2023 at 2:06=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Mon, Aug 28, 2023 at 01:17:57PM +0300, Andrei Coardos wrote:
> > > This function call was found to be unnecessary as there is no equival=
ent
> > > platform_get_drvdata() call to access the private data of the driver.=
 Also,
> > > the private data is defined in this driver, so there is no risk of it=
 being
> > > accessed outside of this driver file.
> >
> > I think Greg previously pointed out to you that is it not sufficient to
> > check for platform_get_drvdata() alone, because the information could be
> > accessed without going through that helper. That's not the case here,
> > but it could be true elsewhere.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Thanks,
> > Conor.
> >
> > >
> > > Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> > > ---
> > >  drivers/char/hw_random/mpfs-rng.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > >
> > > diff --git a/drivers/char/hw_random/mpfs-rng.c b/drivers/char/hw_rand=
om/mpfs-rng.c
> > > index c6972734ae62..0994024daa70 100644
> > > --- a/drivers/char/hw_random/mpfs-rng.c
> > > +++ b/drivers/char/hw_random/mpfs-rng.c
> > > @@ -79,8 +79,6 @@ static int mpfs_rng_probe(struct platform_device *p=
dev)
> > >       rng_priv->rng.read =3D mpfs_rng_read;
> > >       rng_priv->rng.name =3D pdev->name;
> > >
> > > -     platform_set_drvdata(pdev, rng_priv);
> > > -
> > >       ret =3D devm_hwrng_register(&pdev->dev, &rng_priv->rng);
>=20
> A question would be if there is a desire to keep the prints below, or
> would this be sufficient?
>=20
>           return devm_hwrng_register(&pdev->dev, &rng_priv->rng);
>=20
> If there is the desire to keep the prints, then:

Yeah, I'd like to keep a print in the failing case, thanks.

>=20
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
>=20
> > >       if (ret)
> > >               return dev_err_probe(&pdev->dev, ret, "Failed to regist=
er MPFS hwrng\n");
> > > --
> > > 2.34.1
> > >

--rbkSUiqy942IY70F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPGD6wAKCRB4tDGHoIJi
0qUTAQD0ZDiVMxcLtPt0mgxplAh+moC7mid0YSGHBG9Ni1um5QEA/E2z+UWdQSGw
Yw88TOcd4HWPZN8oMlkVEjAmi8MA4gs=
=3NaB
-----END PGP SIGNATURE-----

--rbkSUiqy942IY70F--


--===============8929156998312542934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8929156998312542934==--

