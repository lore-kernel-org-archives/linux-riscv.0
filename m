Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C899BCCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LC+Mof0xYcZ3jw0e0EFFJ3c5JEJnTDMh5f9kEsOLBWY=; b=wNS3dBZMshhgX43bL9E2M54Utl
	tENkBwh+LSUHTS350VoZi+RoFwxk1m1YMBKxcXzz/HqbXovvKfMPAgmrMHJ/aCe5y2ybEqnODPeCY
	0dKzjiNEIIL1MSAymysYZeKT/rEmWG6RwMazzWfTRRHiFqQh5Mh17AeLtbwDwvDPlxgnaEyuVQWhR
	XNlLYr13qq2TXy8p1+YElXC+7IP8irlpMAiQWcneb2qrpX8C6AP/uOUywzpFHp/vM/qwnI221drg0
	fIo0C5D6O9z+KGp71j/jmpMo/o0Ir0p0i79epq4pio1njyDqi/R5Oo2npTR8d5Z05vuuP31Qz+2fl
	l++E6JzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCuW-0000000BUSu-3LZs;
	Tue, 04 Nov 2025 09:01:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCuT-0000000BUSG-3dUS
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 09:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762246861; x=1793782861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yZJWb+YgufW+fRvWZAF/rjt/FGY/o/OacsBv0wBUUSk=;
  b=o8prtfvbFmnCsnNyC7Wmr9lADT0CxGHMmadpe5OXkbrYrMPW+o4eAHdW
   S8YB70HWtQySnxdC6TOuAdhHgsWuuz/npcj/zrHM2Kuim+wIlsNfNIPiQ
   kkM24JkAqnO9PJ2CyUG8ukPKYJM0Mf83XvTsfbPzeVHAS9KEihsE3e50O
   iy68zXlGmc+TIG40xFuk62R4yaEhgtjexZuoKKR5p/fYMtElP12Fkbcor
   CWngS+v3gvBMEJvXfFYebsR1a4fiATYMsnJ5IlzxZKpaPQGYurE2xpQ2W
   ouUzxxKJu5dT9D2e0c8fBqM/VBuvBza9y/3Gm07SfBdqPCDGRoIsI2sdy
   w==;
X-CSE-ConnectionGUID: 3f10AFXvRw+JlCeZvJ9giA==
X-CSE-MsgGUID: k4v3zqedR7W8FTcqXLNMJA==
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="asc'?scan'208";a="215994965"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Nov 2025 02:01:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 4 Nov 2025 02:00:48 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Tue, 4 Nov 2025 02:00:46 -0700
Date: Tue, 4 Nov 2025 08:59:03 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>
Subject: Re: [PATCH v1 3/3] spi: add support for microchip "soft" spi
 controller
Message-ID: <20251104-unified-velcro-01219faf6dbd@wendy>
References: <20251103160515.412706-1-prajna.rajendrakumar@microchip.com>
 <20251103160515.412706-4-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20251103160515.412706-4-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_010101_972137_594E0CE2 
X-CRM114-Status: GOOD (  12.16  )
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
Content-Type: multipart/mixed; boundary="===============6271237738546480189=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6271237738546480189==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/Rlr8YUOA4YGx4c9"
Content-Disposition: inline

--/Rlr8YUOA4YGx4c9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2025 at 04:05:15PM +0000, Prajna Rajendra Kumar wrote:
> Introduce driver support for the Microchip FPGA CoreSPI IP.
>=20
> This driver supports only the Motorola SPI mode. TI and NSC modes are
> not currently supported.

When you send v2, it's probably worth mentioning all of the other
restrictions the driver current has, that are being enforced in probe.

> +static struct platform_driver mchp_corespi_driver =3D {
> +	.probe =3D mchp_corespi_probe,
> +	.driver =3D {
> +		.name =3D "microchip-corespi",
> +		.pm =3D MICROCHIP_SPI_PM_OPS,
> +		.of_match_table =3D of_match_ptr(mchp_corespi_dt_ids),
> +	},
> +	.remove_new =3D mchp_corespi_remove,

As the lkp bot pointed out, this doesn't exist in the tree any more,
probably since 6.13 or so. Please test patches you're sending upstream
against upstream.


--/Rlr8YUOA4YGx4c9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQnAVgAKCRB4tDGHoIJi
0k86AQDXM6tmcjnx2ozhOM4QBmW1zMpZLYWioLdizJRYRREg5wEAw/rZTtk2chVb
yJHHDkfyi2rr2Dmc4COWmmyHklTPnQ0=
=yb85
-----END PGP SIGNATURE-----

--/Rlr8YUOA4YGx4c9--


--===============6271237738546480189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6271237738546480189==--

