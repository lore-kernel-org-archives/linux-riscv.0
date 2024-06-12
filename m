Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFF2C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 11:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/mxqVm57RH97+9HrFH5Ngu4kjiY9GBhTP8Fuzh3sp4=; b=NKS5UmJOAdmOVoI87773gKk5Od
	MP8XzcvCjYMwdx2d7ktY1vv0Jh2m3Xj8qz408uyY1OLVnP+7FyREHLfJKPDS2lndAaRYv65G0Atoh
	pG4m3nk+c4rFAPZl6m8f3sWuZJWGcCRyhn5IHMbGLuQ5VbrumJuKu+0o20JKDBpzjSxAXOu7MwKGM
	DWKBgiCByq1ByQslY7uW7ARVlhTPZSshcsR5ZvEWXQ+LH3zBgaavAq5fwDzQYBjcSbbXfM/0AhAC1
	eStJidm567tcOSJzoBJt9nTqjG3H70MShX6gT2zviTlQJwoj+mBG99uB4iAmKhlZ8n4kpl+UEw9aw
	Zm0eNJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHLxL-0000000CPVv-1uxP;
	Wed, 12 Jun 2024 11:15:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHLxJ-0000000CPVT-0NFY
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 11:15:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A61E61350;
	Wed, 12 Jun 2024 11:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16653C3277B;
	Wed, 12 Jun 2024 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718190952;
	bh=7d24fUeZ1zP8SH2Q+34h24RjLG4meZy6sShN3SzAN8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fW3m6jnb3gneinc4H/B0Gtb06vZCOSWj6qjo8a5u9z+DZVcY/GWNQK9eWzO+n6jU8
	 W09bJuoYg7mhVUYy84Sy1mcgWgKHAxdaUu3Xqg5FXCDbDA0HKL4TXBEWp19cETU+oB
	 swfc0FOlTdfZ5m6lPnxXT3btWIFc0ezWpwWSjU/AHyAl2XQCcVvG9EogMZ1PO5GnYP
	 A/qmULkTeXu1I56u1ihWbrHQawI0Pivnoz7IeDiZKCvYwdIvd9lTN5VUO3RSuY212R
	 NkzG9qSXU7QMXz9ILxMGruWywLWAITG4di/SDb7wI4IxFEfPspXSylnGA11cgL12/X
	 cyUr/xA9fw88w==
Date: Wed, 12 Jun 2024 12:15:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: Re : [PATCH v1] riscv: dts: starfive: add PCIe dts configuration
 for JH7110
Message-ID: <20240612-italicize-cultural-a10b8a387520@spud>
References: <20240611015200.40996-1-minda.chen@starfivetech.com>
 <20240611-irk-hypocrite-a53e98e6c394@spud>
 <SHXPR01MB0863CFE4519C0D69E961620CE6C02@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <SHXPR01MB0863CFE4519C0D69E961620CE6C02@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_041553_281469_39D4D5E3 
X-CRM114-Status: GOOD (  17.56  )
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
Content-Type: multipart/mixed; boundary="===============6962970116109862865=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6962970116109862865==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Li8mNAUIEQ/ZV6y1"
Content-Disposition: inline


--Li8mNAUIEQ/ZV6y1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 01:48:55AM +0000, Minda Chen wrote:
>=20
>=20
> >=20
> > On Tue, Jun 11, 2024 at 09:52:00AM +0800, Minda Chen wrote:
> > > Add PCIe dts configuraion for JH7110 SoC platform.
> > >
> > > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > > Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> > > ---
> > >  .../boot/dts/starfive/jh7110-common.dtsi      | 64 ++++++++++++++
> > >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 86 +++++++++++++++++=
++
> > >  2 files changed, 150 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > index 8ff6ea64f048..1da7379f4e08 100644
> > > --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> > > @@ -294,6 +294,22 @@
> > >  	status =3D "okay";
> > >  };
> > >
> > > +&pcie0 {
> > > +	perst-gpios =3D <&sysgpio 26 GPIO_ACTIVE_LOW>;
> > > +	phys =3D <&pciephy0>;
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&pcie0_pins>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&pcie1 {
> > > +	perst-gpios =3D <&sysgpio 28 GPIO_ACTIVE_LOW>;
> > > +	phys =3D <&pciephy1>;
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&pcie1_pins>;
> > > +	status =3D "okay";
> > > +};
> >=20
> > Do all 3 of the mars, star64 and visionfive 2 have both PCIe ports expo=
sed? I
> > assume if one does, all does, since they're basically identical?
>=20
> Visionfive 2 and milkv mars are all the same. Star64 do NOT enable PCIe0,=
 PCIe1 pins are the same.

This patch adds both PCIe instances for the Star64 though, since that
also includes jh7110-common.dtsi. I think you need to enable these in
the board dts files instead?

--Li8mNAUIEQ/ZV6y1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmmDYwAKCRB4tDGHoIJi
0hRRAP9uJQeWEGeh7XescP1RuK/PppGYyYJPTZoCbrDpZU0wCQD/Q+mC+PcqoffH
44ymM0rcydKYlUsr+vX1H3OvOtKdnQU=
=UKtv
-----END PGP SIGNATURE-----

--Li8mNAUIEQ/ZV6y1--


--===============6962970116109862865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6962970116109862865==--

