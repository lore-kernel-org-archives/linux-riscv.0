Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D067D15DBD
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoSB9MuZdce5AYGKTPQ2+1ftzKh87vbE52FxCOOmzic=; b=cWgsqn48F33ie8+ZX8Zf6wegHB
	MK1o7o0zimXXHF8sl+dtfwt1O8u37QTLbdqcX6O2fksh70QXHBay0hkAWz5obJPVuMS46Ii34dLet
	MGivBkD/3GnpOouPt5hGLG8jEkycTYc5AconZ5JLMO4rLZ9SlBB9uvZg+K9S/5oMJfiRfR2zVFXQx
	YYqIfsknPs8rpI8k0/ksfmBCwqAFySr8d1EUmqesAqY4n3ZJsHuoeiFj8uR8nAXSFdXUmcE7RhLTO
	sGWCohG6FSrOsah0GfLMtkKcdd4Y0jVOrfyBiOaqcugFPw2VA++dk3USoLMP3SyrJDSmd6k1ZQ4+L
	PVdKFM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2vc9-0000000820P-2rFU;
	Mon, 21 Oct 2024 16:50:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2va3-000000081bc-0m2F
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 16:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BFE59A4365F;
	Mon, 21 Oct 2024 16:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FBBC4CEC3;
	Mon, 21 Oct 2024 16:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729529309;
	bh=y88CpT+n2HdoRrfctihIvqBAw/nq7qai6p50KHNi9PI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tg9AormP7oj96Nxs3Hyh2cbZX/WEiqqxEmm+RWJB8AzCWl7pwu7FKZAJ9YUiBY6Eb
	 O5qRi6WYvMfb15NkUuyCjBItfUyi6LHK7tdujb5j6GnK6UpmsHZKq9fGfHl9JmMEXj
	 7yxEwxfNiBvb77sZYvY9oIwdzMtfoELesLuwvXbdQccqJgu/nAHpW230oDq+To01+m
	 5TMGNCrlyeXRT7nKObiVEhbU/mnXai4GaQLyC5pOQvtduRLrQgJY5K1PHGFAIwjicX
	 YIQzR/+OqxkMjXvL7C8hfrN2m+jmJlPHkzddAOMtLEkAhokoODjGCEhF2/YNrc1RBz
	 Ij944FdRnuh4g==
Date: Mon, 21 Oct 2024 17:48:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>,
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
	Huiming Qiu <huiming.qiu@deepcomputing.io>, linux@frame.work,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] riscv: dts: starfive: add DeepComputing FML13V01
 board device tree
Message-ID: <20241021-crimson-translate-291eaba4e640@spud>
References: <20241020134959.519462-1-guodong@riscstar.com>
 <20241020134959.519462-4-guodong@riscstar.com>
 <ae5gels34ozgzrcrwz53wj22hoy5cq3crn3dmkhitxlffmnavt@6lbmrcpjmqyd>
 <20241021-unroll-empower-3ab903615d6d@spud>
 <c048d270-7a07-4807-b816-0f4e0aeb67f7@kernel.org>
 <2b449955-6596-4c9a-9799-f15d186e260f@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <2b449955-6596-4c9a-9799-f15d186e260f@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_094831_378662_99B50B72 
X-CRM114-Status: GOOD (  29.40  )
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
Content-Type: multipart/mixed; boundary="===============2710012536981705866=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2710012536981705866==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HM8xtjn6x2CDD6Fw"
Content-Disposition: inline


--HM8xtjn6x2CDD6Fw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 08:44:16AM -0500, Alex Elder wrote:
> On 10/21/24 7:47 AM, Krzysztof Kozlowski wrote:
> > On 21/10/2024 13:16, Conor Dooley wrote:
> > > On Mon, Oct 21, 2024 at 09:17:59AM +0200, Krzysztof Kozlowski wrote:
> > > > On Sun, Oct 20, 2024 at 09:49:59PM +0800, Guodong Xu wrote:
> > > > > From: Sandie Cao <sandie.cao@deepcomputing.io>
> > > > > +&camss {
> > > > > +	status =3D "disabled";
> > > > > +};
> > > > > +
> > > > > +&csi2rx {
> > > > > +	status =3D "disabled";
> > > > > +};
> > >=20
> > > You can drop these two, I marked them disabled in the common file
> > > earlier this week.
> > > 1
> > > > > +
> > > > > +&gmac0 {
> > > > > +	status =3D "disabled";
> > > > > +};
> > > > > +
> > > > > +&i2c0 {
> > > > > +	status =3D "disabled";
> > > > > +};
> > > > > +
> > > > > +&pwm {
> > > > > +	status =3D "disabled";
> > > > > +};
> > > > > +
> > > > > +&pwmdac {
> > > > > +	status =3D "disabled";
> > > > > +};
> > > > > +
> > > > > +&spi0 {
> > > > > +	status =3D "disabled";
> > > >=20
> > > > If your board has to disable all these, then they should not have b=
een
> > > > enabled in DTSI in the first place. Only blocks present and working=
 in
> > > > the SoC (without amny external needs) should be enabled.
> > > >=20
> > > > I suggest to fix that aspect first.
> > >=20
> > > Eh, I don't think I agree. Having 5 disables here is a lesser evil th=
an
> > > reproducing 90% of jh7110-common.dtsi or shunting a bunch of stuff
> > > around. Emil?
> >=20
> > Why reproducing 90%? Only enable would be here, no? Or you want to say
> > the common DTSI has things which do not exist?
>=20
> For what it's worth, I agree with Krzysztof.  In the (long) cover
> page we pointed this out, and offered to do it in a followup patch.
> But if requested we can do it now.
>=20
> So in v6, a new patch would be inserted before the other three,
> and it would:
> - Remove the status =3D "okay" lines for those nodes that are not enabled
>   in this new platform, in "jh7110-common.dtsi"
> - Add nodes where appropriate in:
>     jh7110-milkv-mars.dts
>     jh7110-pine64-star64.dts
>     jh7110-starfive-visionfive-2.dtsi
>   They'll look like this, to enable the ones disabled above, e.g.:
>     &gmac0 {
>         status =3D "okay";
>     };
>=20
>     &i2c0 {
>         status =3D "okay";
>     };
>=20
> You guys should come to agreement, but I do think what Krzysztof says
> is the right approach.  And unless convinced otherwise, this will be
> what shows up in the next version of this series.

Ultimately, it is up to Emil how he wants these laid out.

--HM8xtjn6x2CDD6Fw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxaF1gAKCRB4tDGHoIJi
0n25AP9w+mgLPG37PWo0lketQlmgfBvb0mnm/q/uq+DyENNPiwEA0d6noRdXHH1D
VAVdOopja8BtMCTOjnpc/8inYN+MbQQ=
=T8RS
-----END PGP SIGNATURE-----

--HM8xtjn6x2CDD6Fw--


--===============2710012536981705866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2710012536981705866==--

