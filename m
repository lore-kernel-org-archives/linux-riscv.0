Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F2AC7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 08:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1L+unug34ojKXkONluLwb3amMH7U0aBoqjLzT3DTtY8=; b=cV9IRim/uyYXB6JVZXZeIa2do1
	AYavCQkXliqQFOEIM/dfcwsTqmottWw6mWMV2RfAQ65+gV4JE81U7Iem3OXjfZdjNnwwTfMRT4ry4
	d91GU82mTcvyYeTUzzf8wTWrQ/1jMQKDnxESCwFO6qDzxa7uBZJfWl6GhOVBvBSpp5fMi/0VguZ2P
	shozIQPS7hV6w55n0widhlpS0hpkP+n84X61XiAalfe/7mUvU7AbDXonhbsUBfTnlFGkLbgj2Gdrm
	GtgFOgIsgFitLvGIRM8T80vDbfXRMG1Jx6cIalX2M8ovfaXTsrUvW9QEvvNoOXA0d8ush2Huo6me6
	GSboHPuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAJR-0000000COaE-37W8;
	Thu, 19 Jun 2025 08:07:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9na-0000000CJRQ-1MHz
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 07:35:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750318502; x=1781854502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aH4MYI7c3m+ShgBRS97B9wA9VDRXLN0Ik809nqZTBM8=;
  b=cElNEALuIza3Y0lQhADHm1FV6F3FXCmOT/CfN2ZtcmrdmKJ4kI+NSS7O
   HaezSHZ9gv/fXjDkh3pX+lzFKDA0MzUXV6Fo5L24/LuEf1UGi7yNllLaJ
   4eVcHsxQZGREKcJU5Lp/PFtY/PgbmC5XzzlMkPoyQA0yOBi19dRL8WKgV
   eu9oo4WXJhOnVNT+5s1EdgojMVsmWUbEYBAx+MHmrLsKtuKJn5fPHvFxG
   +cZxfGTsphKvUfOkZ2VOmd/JnLc85jkJLrV/jeHrs2Mp7C587rg5Zq3Da
   2B/fnBjN4yqDuysoiigqw6Gy4W7tCJ8ZdiBk96bA0xsf45/yr3yI8GKjN
   w==;
X-CSE-ConnectionGUID: Okrbc+Y5Sn2HmFwBqXV6bQ==
X-CSE-MsgGUID: gNNiB0ORS/Sg5ekHcFUhbA==
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="asc'?scan'208";a="43566381"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2025 00:35:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Jun 2025 00:34:20 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44 via Frontend
 Transport; Thu, 19 Jun 2025 00:34:19 -0700
Date: Thu, 19 Jun 2025 08:33:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alex Guo <alexguo1023@gmail.com>
CC: <daire.mcnamara@microchip.com>, <andi.shyti@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: busses: Fix out-of-bounds bug in
 mchp_corei2c_smbus_xfer
Message-ID: <20250619-jubilant-nag-c50bdebdac0c@wendy>
References: <20250615234919.525431-1-alexguo1023@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250615234919.525431-1-alexguo1023@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_003502_431773_478BB101 
X-CRM114-Status: GOOD (  17.03  )
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
Content-Type: multipart/mixed; boundary="===============7657156471370871809=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7657156471370871809==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JByXUeaN4Z+QSMXa"
Content-Disposition: inline

--JByXUeaN4Z+QSMXa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 07:49:19PM -0400, Alex Guo wrote:
> The data->block[0] variable comes from user. Without proper check,
> the variable may be very large to cause an out-of-bounds bug.
>=20
> Fix this bug by checking the value of data->block[0] first.
>=20
> Similar commit:
> 1. commit 39244cc7548 ("i2c: ismt: Fix an out-of-bounds bug in
> ismt_access()")
> 2. commit 92fbb6d1296 ("i2c: xgene-slimpro: Fix out-of-bounds
> bug in xgene_slimpro_i2c_xfer()")
>=20
> Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> ---
>  drivers/i2c/busses/i2c-microchip-corei2c.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/bus=
ses/i2c-microchip-corei2c.c
> index 492bf4c34722..a79d4d327f20 100644
> --- a/drivers/i2c/busses/i2c-microchip-corei2c.c
> +++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
> @@ -492,6 +492,8 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapter=
 *adap, u16 addr, unsigned
>  		if (read_write =3D=3D I2C_SMBUS_WRITE) {
>  			int data_len;
> =20
> +			if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
> +				return -EINVAL;

Seems reasonable, but I'd like to see a blank line here after the
return. Maybe Andi can do it on application?

Acked-by: Conor Dooley <conor.dooley@microchip.com>

>  			data_len =3D data->block[0];
>  			msgs[CORE_I2C_SMBUS_MSG_WR].len =3D data_len + 2;
>  			for (int i =3D 0; i <=3D data_len; i++)
> --=20
> 2.34.1
>=20

--JByXUeaN4Z+QSMXa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFO9JwAKCRB4tDGHoIJi
0oORAPwOMF7HJ4ncK8AJdngYGaRq0iU6yc1gSpPtOdeH4MjGdgEArIT7bXuTG9EK
znXpn8yenjNsLNWz4BhevGHIXt2A0gA=
=VSNl
-----END PGP SIGNATURE-----

--JByXUeaN4Z+QSMXa--


--===============7657156471370871809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7657156471370871809==--

