Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBB8C74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 09:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmGZH55qQynsLoSVPNbFKYISIeMO1UAcJmjy3qm1ehY=; b=qsyMsf6NsakFs3vKhaAttCDX2Q
	gMkMfgfSYAWPppIWtKexfhOzup3Aeh8QKPl1S5Z8SNECXCKcjKBReGQXAgsXTHVZIlW5jDnRaEKMn
	JIUasP73fIIkvsyktUh6yjrQtEcw1tfY5MmUZhxCtqCOsX5umqTcndrEFR3WQnxvvs1pGWsdqgGMi
	gFhKT7VgOqM1wV+g2NPmVq9hLy5TzpxutziciUj/TeHZZL13pEVrq5rLqjyK2530M1nAy0hWlhuRq
	mCz8hvLV3keVkPwAfBDxgr60WrYxh2PuKVl5Oc1atwSUamXq6Jwt3F5v+4y95h7anj6PKVZZ3jeB+
	cbP/38Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGrX-001MTP-2I;
	Thu, 23 Mar 2023 09:03:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGrU-001MR5-0N
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 09:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679562235; x=1711098235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pfEd7PgZgr1Enscty5HN6t0iA9hWqdaXMHbtn/VGXDE=;
  b=pfnf7rgBg2om3HkJohYDn0z4KdLZesqQoQp0QHzkUV6dgck5fY2d+4Ul
   8ekXfKiM8gDWd3hKIVt1KS6b2vjwpPNi7urWsEVe2fpyZtUYHC+ZZw0EZ
   MD077meh4kdkc8ISEs4EKK03cXGJ5gI3O+5rGQFXTiR2zcWFj+hKCfqiy
   ai5dvGm3A6jbTpnyZoA4ZMiSqXmXQu8is7ipn/ZVV/s4dptU3shjfpxoM
   fzAOlU3NOyDvLRhCwkQpKY5wukgwpHqOlOVUpgEplvCtDmUaR3+XyTQ8e
   wwueRJNvM6qu6PRgG0Eqq6XKDYgqVw9Jfpry82DKTQWhoFeO2XlmiUFii
   g==;
X-IronPort-AV: E=Sophos;i="5.98,283,1673938800"; 
   d="asc'?scan'208";a="217613551"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Mar 2023 02:03:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 02:03:44 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Mar 2023 02:03:41 -0700
Date: Thu, 23 Mar 2023 09:03:23 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>, <hal.feng@starfivetech.com>
CC: Hal Feng <hal.feng@starfivetech.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc
 Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 19/21] riscv: dts: starfive: Add initial StarFive
 JH7110 device tree
Message-ID: <6ce5b897-f1c2-4b58-9353-9d9e881ad237@spud>
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
 <20230320103750.60295-20-hal.feng@starfivetech.com>
 <60359574-8bce-40f2-99db-6d81f6e6c5c3@spud>
MIME-Version: 1.0
In-Reply-To: <60359574-8bce-40f2-99db-6d81f6e6c5c3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_020356_161685_C1B3C0B4 
X-CRM114-Status: GOOD (  15.70  )
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
Content-Type: multipart/mixed; boundary="===============1294468276397463971=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1294468276397463971==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kj0I/hLRt9/h7AYV"
Content-Disposition: inline

--Kj0I/hLRt9/h7AYV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 10:02:40PM +0000, Conor Dooley wrote:
> On Mon, Mar 20, 2023 at 06:37:48PM +0800, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> >=20
> > Add initial device tree for the JH7110 RISC-V SoC by StarFive
> > Technology Ltd.
> >=20
> > Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
>=20
> > +		S7_0: cpu@0 {
> > +			compatible =3D "sifive,s7", "riscv";
> > +			reg =3D <0>;
> > +			d-cache-block-size =3D <64>;
> > +			d-cache-sets =3D <64>;
> > +			d-cache-size =3D <8192>;
> > +			d-tlb-sets =3D <1>;
> > +			d-tlb-size =3D <40>;
> > +			device_type =3D "cpu";
> > +			i-cache-block-size =3D <64>;
> > +			i-cache-sets =3D <64>;
> > +			i-cache-size =3D <16384>;
> > +			i-tlb-sets =3D <1>;
> > +			i-tlb-size =3D <40>;
> > +			mmu-type =3D "riscv,sv39";
> > +			next-level-cache =3D <&ccache>;
> > +			riscv,isa =3D "rv64imac_zba_zbb";
> > +			tlb-split;
> > +			status =3D "disabled";
>=20
> Jess pointed out on IRC that this S7 entry looks wrong as it is claiming
> that the S7 has an mmu. I didn't go looking back in the history of
> u74-mc core complex manuals, but the latest version does not show an mmu
> for the S7.

BTW Hal, if the dt-binding stuff is okay with Emil, I can just remove
the mmu here if you confirm it is a mistake rather than you needing to
resubmit to remove it.

Cheers,
Conor.

--Kj0I/hLRt9/h7AYV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBwV2gAKCRB4tDGHoIJi
0mosAQC0tTdSuLZs5V6/bJW0odHWJ3cmDx/Sya5mfwta/QgwXAD/YImkx/axtw7b
1SczMbwlvay1eA/viVfufOvLXfk5XQ0=
=2Nu6
-----END PGP SIGNATURE-----

--Kj0I/hLRt9/h7AYV--


--===============1294468276397463971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1294468276397463971==--

