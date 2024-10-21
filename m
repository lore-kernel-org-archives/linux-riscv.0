Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0282DD0E6F1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5jHx8lJCt/JV2iG3Dn/lmGjqNQTgzI5GycpQecA7KA=; b=UypbSvS/y+JcCJdhIUeKLiGqk0
	BSsNu2CFqQT2OlMEXcNn35Nj5cCGEkE7BhdtS62IVMKeTTVBlD3zOq+i5FoOtqw81q+QgvKvh93Xv
	msdu76EG0pddJ4v7xMGbnGTiPzI2G8BmQuqjUh+JoC/WQywE+sQu/D/aoYiB3D5gQ4mcn7hhnI1m6
	3LZ4VTK1r2iskpvhtcYDBlZRCzgnbaBABpdeJasp+feNz3tFQl0PjDkvYgHgv0XZ8nk8/3SpZdCJk
	DxiUsa5IlXesT+xb6stU2ET3Lnvu60o4yWmLYRGlPzDRBZHoGfPDtHMVgvwccBM8jHxn9dUBwHbAi
	+siFNBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2qP6-000000071oE-3zNX;
	Mon, 21 Oct 2024 11:16:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2qP4-000000071nW-2Str
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 11:16:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 123215C48DC;
	Mon, 21 Oct 2024 11:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8717C4CEC3;
	Mon, 21 Oct 2024 11:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729509409;
	bh=2f93h3fB4LLkd11DyIv9Y0/XNE6yLB6WyRy24xVgmlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nfom7GnGD1cB5+8lbtj2U35qRULIN35Q5wNvCT+cPuje4/lsjyjdKydoruv6X3gCH
	 ZcVTe9YBem9ZKJCeyW6hUp7vMJW32WabUtneH8/ngK3Jv4uYXdeJQbyQghsgoQ80LL
	 mVcpPd46XYpRna5Cf4m0cDaOwUcJgQSNzeB7Sb94uhQneT1ROzlG8kQz4vRyfqlSJY
	 ZtHndxS2qpOYQeg4JVXYgzcIHSmvw6f+7AbkVxK45e1rIwFbHulH9v27bPyde8BXly
	 6uF/mf+dOfSW+mkXepO77BHYxPaQdmcsYmfT6mqUeua4LJLmKeGaayRay9Ee5YkkSd
	 jN+AErlxgfjDw==
Date: Mon, 21 Oct 2024 12:16:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>, Daniel Schaefer <dhs@frame.work>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>, linux@frame.work,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] riscv: dts: starfive: add DeepComputing FML13V01
 board device tree
Message-ID: <20241021-unroll-empower-3ab903615d6d@spud>
References: <20241020134959.519462-1-guodong@riscstar.com>
 <20241020134959.519462-4-guodong@riscstar.com>
 <ae5gels34ozgzrcrwz53wj22hoy5cq3crn3dmkhitxlffmnavt@6lbmrcpjmqyd>
MIME-Version: 1.0
In-Reply-To: <ae5gels34ozgzrcrwz53wj22hoy5cq3crn3dmkhitxlffmnavt@6lbmrcpjmqyd>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_041650_691701_58A02AAA 
X-CRM114-Status: GOOD (  15.49  )
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
Content-Type: multipart/mixed; boundary="===============2929492358405300108=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2929492358405300108==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VVnw05SnzZXMvGzA"
Content-Disposition: inline


--VVnw05SnzZXMvGzA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 09:17:59AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Oct 20, 2024 at 09:49:59PM +0800, Guodong Xu wrote:
> > From: Sandie Cao <sandie.cao@deepcomputing.io>
> > +&camss {
> > +	status =3D "disabled";
> > +};
> > +
> > +&csi2rx {
> > +	status =3D "disabled";
> > +};

You can drop these two, I marked them disabled in the common file
earlier this week.
1
> > +
> > +&gmac0 {
> > +	status =3D "disabled";
> > +};
> > +
> > +&i2c0 {
> > +	status =3D "disabled";
> > +};
> > +
> > +&pwm {
> > +	status =3D "disabled";
> > +};
> > +
> > +&pwmdac {
> > +	status =3D "disabled";
> > +};
> > +
> > +&spi0 {
> > +	status =3D "disabled";
>=20
> If your board has to disable all these, then they should not have been
> enabled in DTSI in the first place. Only blocks present and working in
> the SoC (without amny external needs) should be enabled.
>=20
> I suggest to fix that aspect first.

Eh, I don't think I agree. Having 5 disables here is a lesser evil than
reproducing 90% of jh7110-common.dtsi or shunting a bunch of stuff
around. Emil?

--VVnw05SnzZXMvGzA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxY4GgAKCRB4tDGHoIJi
0ryMAQDylSPIecFs5rj5VL8jUi+nAFss0Y7ZYLW2+cgjnnNluQD/VG1+cJIt0h8u
syL+09/AjgZAeUOS6/+AmUIafMx6oQg=
=JCPq
-----END PGP SIGNATURE-----

--VVnw05SnzZXMvGzA--


--===============2929492358405300108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2929492358405300108==--

