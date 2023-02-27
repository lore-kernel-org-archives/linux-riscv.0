Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8016CC64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 14:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLiYjf3aS/CNuK01wBHjW72WhivijYg1bzj1CXHBLvw=; b=OrZ8rMU5zAZ0256unGC8oY3TEo
	KSBlUvYLi8DLR5yTxSsG44RXDSHydRti8UQ3T0THqRc7r9+l3VDpoGdJdtXD3pIRK3H1h+XAsqxcu
	XqPW43hv5K2v/8q6ZjHoc+x4KJxQRWBukivNir+C67KYNoTSs6TWJEfFO21bYqKhejqp3Ulusrk8z
	BGkJVKfH37AhQWeE4H68JGqHpI+JXnl8T9HAXWKmj0B4p47XnRcVszHfIEHM8VB1K0s8g4V1GDml3
	0TUU5bhYiyVXATwp2M+f75XMLoNt5uXmhaO4H3jzAbG9H40+f4Ks6rL5q64Rd61K7ZqZ3+zB5mAhE
	CFb0javQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWe6m-009tSO-Sd; Mon, 27 Feb 2023 14:04:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWe6g-009tQZ-Pn
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 14:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677506638; x=1709042638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lhINFStdkUVW6diIibKLb9nd7HYBVPWekTlInXGunlM=;
  b=x+bRhmtBZx2nx6R+5HhztNXI3ptTCcbN0mW6qwlzhTiOmhGUJflpU5EY
   L3GiUbHCzI4r1j3q2qEUTZTSqMKHsd+eXnU1klZ7y4OJ7FvtfsRn/FSqu
   0T2DvBZJi8IGUm288xeUNVUZ8WWO7y5j7oC/QlPuq3y4Dlumh3zJIskQ4
   pxf4uFog+BUfeqQ6rnlC6UXJ+rv2GQRc/tk63jlAyhbfToFVYuIZOm+hB
   gNGQSR9c5YTRye0f6NnBUCyNs2PEjKg2sTSJJp1Eo7XztY/YYgKSrdZul
   4A03PTKNiW94MD2Kj3A/KkoDZr5QCQii/s+m6YfxlF84EaWMNgMax5Wpc
   A==;
X-IronPort-AV: E=Sophos;i="5.98,332,1673938800"; 
   d="asc'?scan'208";a="139247079"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Feb 2023 07:03:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 07:03:55 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 27 Feb 2023 07:03:53 -0700
Date: Mon, 27 Feb 2023 14:03:26 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Jean Delvare
	<jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] hwmon: (sfctemp) Add StarFive JH71x0 temperature
 sensor
Message-ID: <Y/y4LunvriV2RYwu@wendy>
References: <20230227134125.120638-1-hal.feng@starfivetech.com>
 <20230227134125.120638-3-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230227134125.120638-3-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_060402_307390_7589C408 
X-CRM114-Status: GOOD (  14.30  )
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
Content-Type: multipart/mixed; boundary="===============0230544419753428615=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0230544419753428615==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NBI72SkxZsmpX/ON"
Content-Disposition: inline

--NBI72SkxZsmpX/ON
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 09:41:25PM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add driver for the StarFive JH71x0 temperature sensor. You
> can enable/disable it and read temperature in milli Celcius
> through sysfs.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Samin Guo <samin.guo@starfivetech.com>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

> +config SENSORS_SFCTEMP
> +	tristate "Starfive JH71x0 temperature sensor"
> +	depends on SOC_STARFIVE || COMPILE_TEST

We (or I?) am trying to homogenise RISC-V with the rest of the kernel by
using ARCH_FOO rather than SOC_FOO. We've currently got a mix of both,
due to companies that started out with RISC-V having SOC_ symbols &
those with history in other archs having ARCH_ ones.
The ARCH_ definitions landed in mainline this week, so if you end up
resubmitting this driver, it'd save me a conversion if you were to use
the ARCH_ variant.

Thanks,
Conor.

> +	help
> +	  If you say yes here you get support for temperature sensor
> +	  on the Starfive JH71x0 SoCs.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called sfctemp.

--NBI72SkxZsmpX/ON
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/y4LgAKCRB4tDGHoIJi
0mJ0AP4vNo5Ie/2kHWAmJFUKGr8YQL9x84VEY3Xn9vgF9A6izgD/QJzmlpXfLT0E
wuAiKkJkRPP9FP1Z+dqqrB2FAZrw3QY=
=DO8S
-----END PGP SIGNATURE-----

--NBI72SkxZsmpX/ON--


--===============0230544419753428615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0230544419753428615==--

