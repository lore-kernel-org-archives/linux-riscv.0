Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC43AC7619A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 09:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rTt4w7RlsiQY7mEkpQTXOS4Kjwj56hW9zZm9wHyOFs=; b=PfTMmJSbLg7mhN2V4snWvMDB8K
	o2X8nmttQBJR2lebpfEmL2UoFUT6nHZxVEqpvk748BFlTfo01UlsY4K8sV7YRfKrhY41p4wOP4Zpj
	O3dSXFttzJ6LOxsvWqlDGTbxoKiMP8bq6qYT+2N5Fsp5ngdHed2FWorHBj96X+RV2u9t/CIGx2B9V
	UnH/DC7QiQ+2GyQv5YjVxFRQQ0OsQaG7YfZQEaLM5ssek5dZLuXPuEWXNq69/7FoeLGmqCxNpfsju
	urT44CSgTUles7t/5LWwFaiTNLKGzzBcPy9Vi1G2JCp2XdNFQkR0j24jdHL+YGa16TP3G/G91+MU3
	EoEU8SbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmX00-002RRq-0c;
	Wed, 12 Apr 2023 09:42:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmWzw-002RQa-22
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 09:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681292561; x=1712828561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wwbP6kjjOhN6ShhtN2xMWrgj1r+S9yH1dt22Dkw+6Ag=;
  b=GU3eeNjRJ8dte2zXct7IPyO538nxdO4bFFYMN/2giNU2X64w3PRfNaYA
   WZ1ZYwR7yKRHDFA7P844znzpABiDkjM6apxzwPyF9dhdCSa9djF9jYGzw
   o6WwGNi7gSOUeVq8DT0Boc5Wmp/294DKceVaep1LKyd2k9rHxVrOA+Exe
   OpaKk+0ejDhoOHo+TbShJVjoXdedSF7XCDXalg5BmniYkxWqyoggAUk5I
   wyeyRo5RMi7hz9pg2wnR026kPVbL9iIEUFZTYkFxH69uwr58bV5TEM+le
   9j8GZYvHkZFIc5cvZBhz3NtZNClwt2ivwPn+OfMOvPmjFN4wEqxpsITcP
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,338,1673938800"; 
   d="asc'?scan'208";a="206122102"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Apr 2023 02:42:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 12 Apr 2023 02:42:30 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 12 Apr 2023 02:42:28 -0700
Date: Wed, 12 Apr 2023 10:42:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 1/7] dt-bindings: power: Constrain properties for
 JH7110 PMU
Message-ID: <20230412-trifle-outplayed-8a1c795fab8b@wendy>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-2-changhuang.liang@starfivetech.com>
 <cb97cf01-2dfd-7f93-2048-e05a806d468f@linaro.org>
 <ee406b3d-0719-9332-cab5-62fe7537bcf1@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <ee406b3d-0719-9332-cab5-62fe7537bcf1@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_024240_756840_BFCF0FFD 
X-CRM114-Status: GOOD (  15.25  )
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
Content-Type: multipart/mixed; boundary="===============2313442155632362961=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2313442155632362961==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a40T/4ja5BHSkhhK"
Content-Disposition: inline

--a40T/4ja5BHSkhhK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 04:51:16PM +0800, Changhuang Liang wrote:
>=20
>=20
> On 2023/4/12 16:35, Krzysztof Kozlowski wrote:
> > On 11/04/2023 08:47, Changhuang Liang wrote:
> >> When use "starfive,jh7110-pmu-dphy" compatible, do not need the reg and
> >> interrupts properties.
> [...]
> >> =20
> >>  description: |
> >>    StarFive JH7110 SoC includes support for multiple power domains whi=
ch can be
> >> @@ -17,6 +18,7 @@ properties:
> >>    compatible:
> >>      enum:
> >>        - starfive,jh7110-pmu
> >> +      - starfive,jh7110-pmu-dphy
> >=20
> > You do here much more than commit msg says.
> >=20
> > Isn'y DPHY a phy? Why is it in power?
> >=20
>=20
> OK, I will add more description. This is a power framework used to turn o=
n/off=20
> DPHY. So it in power, not a phy.

Perhaps tie it less to its role w/ the phy, and more to do with its
location, say "jh7110-aon-pmu"?
There's already "aon"/"sys"/"stg" stuff used in clock-controller and
syscon compatibles etc.

Krzysztof, what do you think of that? (if you remember the whole
discussion we previously had about using those identifiers a few weeks
ago).

--a40T/4ja5BHSkhhK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDZ89AAKCRB4tDGHoIJi
0gOEAP4xbIiDNdrHtqJY8ZFlAr0xgcCwo8KdDu3U3Y6fAyp2zAD8DGiYX29WcQcA
LO0OuThgQ/Lftt9j56haijzia6Ng3Qg=
=p5uw
-----END PGP SIGNATURE-----

--a40T/4ja5BHSkhhK--


--===============2313442155632362961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2313442155632362961==--

