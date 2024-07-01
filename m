Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD1EC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 09:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UftvdkFo3iPA0uayjhr+UPHB1r3RToVGYFe6HeCdsB4=; b=N7as+zEnJOKPbfY9Dc+E3arHuY
	66nx1hMprhrriMeHxaKvSrfiXmf5t7pbd/rdT3aDYDj5/0ZaiI+jrhpfEtbRqX4xvGAeMYxA3/obV
	ICz2BzgNMpfjI69h0hwZcZ5lx/F+elrLvZwKmVqY9vszfYEx25ZJGQEGEsI34UZ4QZUT+UzGay1Yf
	sB+Dq30Z12oRIDhx5mqrNvWMVRH/tWISRxgq1Ryqkm47PjyyOKWKmuiRIT/u14gxNmCrx/hJ5z87u
	qJ26/aNkWJWUczSu/n8F2CkAPO7gbZ5QdnyQyTwjGx8rxwYP+S+RjiFYgprJfmhzcOLAkE7OZZIJi
	Ea44G3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sODPh-00000002SS6-3ujy;
	Mon, 01 Jul 2024 09:33:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sODPf-00000002SRN-2uf9
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 09:33:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 226B761170;
	Mon,  1 Jul 2024 09:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DBDC116B1;
	Mon,  1 Jul 2024 09:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719826410;
	bh=T7OwNpTVJdPd4FTNMLYtYpQmz6nnOJiH4DAvs8geivc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t+QxtkZRPVCQxmQJ11CacOMN/RX4fdzwnaM+PQube9n2Hb7RsEtQeYlXarbdv69Ws
	 y8fiY0KPrf9i3CLJKPhOXXiwsrwc77JoVmZCo5KgZcgtPhqqVupOQG9lrALar27XUh
	 WSEybY5EVZIvYj/i1GNLDCTy3oEQEHWhr7RWeITNOUP/JV39JI8muWlFiWwvPFrVQy
	 hJctoRxVY8F6Jfn9u+GM3E7xEyvajYwHtZ31p3T3d+f7SGXnuPpGfzmoGSbJ2zw1lR
	 D2rkn9f4360dP+F4OTlrN/4C5JDjMK0zyvH2u/OFCVfhYR8tRWaaXv1/fNXkB8lhm6
	 u4Vimnk+1w4oA==
Date: Mon, 1 Jul 2024 10:33:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: kanakshilledar111@protonmail.com, Serge Semin <fancer.lancer@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] arch: riscv: thead: implement basic spi
Message-ID: <20240701-unsnap-unhitched-a84476a719cd@spud>
References: <20240630063845.116307-1-kanakshilledar@gmail.com>
 <20240630-generous-carnation-c534f5d84a8a@spud>
 <CAGLn_=vG09C49goRkbygZdYch8H1c_kw3p7ar9NGOrgpd0_MiA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGLn_=vG09C49goRkbygZdYch8H1c_kw3p7ar9NGOrgpd0_MiA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_023331_838769_A96CF695 
X-CRM114-Status: GOOD (  31.97  )
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
Content-Type: multipart/mixed; boundary="===============0702623488234044811=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0702623488234044811==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J2qMr9rpUpN31Eec"
Content-Disposition: inline


--J2qMr9rpUpN31Eec
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 02:43:46PM +0530, Kanak Shilledar wrote:
> On Sun, Jun 30, 2024 at 7:22=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Sun, Jun 30, 2024 at 12:08:20PM +0530, Kanak Shilledar wrote:
> > > implemented basic spi support for TH1520 SoC.
> > > created a fixed clock and a simple spi0 node.
> > > updated the matching binding to include thead,th1520-spi as compatibl=
e.
> > > added a spidev device in devicetree which will utilise the spi0 node.
> > > this is usually reserved for a SPI NOR flash which is left unpopulated
> > > underneath the carrier board. I performed a SPI self loop test using
> > > tools/spi/spidev_test.c and tried sending `\xDE\xAD\xBE\xEF` and veri=
fied
> > > it is being received correctly. i updated the of_device_id struct in
> > > drivers/spi/spi-dw-mmio.c to include "thead,th1520-spi" as the compat=
ible.
> > > this patch also adds basic spi support on beaglev ahead which shares =
the
> > > same TH1520 SoC. i have only tested on LicheePi 4A.
> > >
> > > Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> > > ---
> > >  .../devicetree/bindings/spi/snps,dw-apb-ssi.yaml |  4 ++++
> > >  .../boot/dts/thead/th1520-beaglev-ahead.dts      |  9 +++++++++
> > >  .../boot/dts/thead/th1520-lichee-module-4a.dtsi  |  4 ++++
> > >  .../riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 10 ++++++++++
> > >  arch/riscv/boot/dts/thead/th1520.dtsi            | 16 ++++++++++++++=
++
> > >  drivers/spi/spi-dw-mmio.c                        |  1 +
> >
> > This needs to be 3 different patches - one for the binding, one for the
> > driver and a final one for the dts files.
>=20
> I will convert this into a patch set of 3 patch as you suggested.
>=20
> > > +
> > > +&spi0 {
> > > +     status =3D "okay";
> > > +     spidev@0 {
> >
> > "spidev" is not a type of device, the nodename should match the type.
> >
> > > +             compatible =3D "rohm,dh2228fv";
> > > +             reg =3D <0>;
> > > +             spi-max-frequency =3D <500000>;
> > > +     };
> > > +};
> >
> > I'll put money on you not having a dh2228fv on this board. Document what
> > you actually have on it please, not what allows you to probe the spidev
> > driver in linux.
>=20
> Yes, you are right! Actually as per the vendor's kernel it should be a
> "spi-nor" device from winbond.
> I changed it to spidev for testing purposes. Shall I just leave it
> with status =3D "okay" or add the node for
> that spi-nor flash?

If it isn't on the board, it shouldn't be in the devicetree. Please add
the actual device that is here instead. If there's a board with nothing
connected, then please don't add anything.

Thanks,
Conor.

--J2qMr9rpUpN31Eec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoJ35QAKCRB4tDGHoIJi
0j8KAP9LwCJp3Y34VPmBSkqu5OK4PNlV/u7zd7GesQ6X3g9IfAD4vxPkDRFgIr0I
//mB3acpuMdI2ele2BVcXagmZcbKCg==
=EgMk
-----END PGP SIGNATURE-----

--J2qMr9rpUpN31Eec--


--===============0702623488234044811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0702623488234044811==--

