Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F34DC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Vsdit2xQlEO9QHVad9agLAIJzEipDDXoORYQYeAi/w=; b=XaZPnWJhazPAQlE02O+Fp1QxqG
	HFsoZQqm/iZGFebMmE6KRjsPS2+9BErjQeqCIUgprSvRtE38EPfKDNUrOOdZkDu9ty4PGh50WNKbu
	RFwoi4jKinHcLzfFOonTxf9qR6MwCFCB8H73eMucWdqPHoTstvnJFK86xYMM3eH30ss+4EY8Oi+f3
	inoHYuo5cCchPT9XjD52qXn8/x5evOx7SwNMGyXHQyp+FT24CS47CjnMZs1cgIQAapRaD70os0J/o
	KrdL/xgUBS67r+MBARqivsuJIk7j+jUw4JlJQGQoEthc/nzNJlfvGKElxP3RUeAOz6bzn/vzarGWs
	/RgtO9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIs5u-00Ab2t-UH; Fri, 20 Jan 2023 14:10:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIs5r-00AazI-CQ
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674223812; x=1705759812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yWdP0AlkpNuGpE4SWfbgyApq7EB/xPrL4Lku7qnnWiI=;
  b=D8sAbTeOTrTPmXDCr7+M65Py4shJxNtS76UAxeGpv6AhTPRzV6TW5KvI
   GaspnnuAcvxHh/9MaItB128VIh6Whj0G+S/O+Zf08cYWnRo+cLxFEn+1D
   ttpwTgxwxBp6UU1/7ZCZjVmxJ7Q+RmJ6m7QgqJAy8hsyeiOi6WVhnZBEH
   Zo4Ko9iJgx06LEiYkAtxYvK25QsNXV0IWk6qcTr0t2BhW5ALDJoDZ9Sld
   MZkCUmuh1DuRdg26O9rIYbiO1V9phnYbthQqJ43nW/uV5YAkRD0BFueqm
   Yo7BQDcX7DwtRe2VvcSVyPTyl3Ujtkppw5ecNWDT7X758t1oCEKXXh9w3
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669100400"; 
   d="asc'?scan'208";a="197635228"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 07:10:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 07:09:59 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 07:09:57 -0700
Date: Fri, 20 Jan 2023 14:09:35 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	<linux-riscv@lists.infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
	<linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Samuel Holland
	<samuel@sholland.org>
Subject: Re: [PATCH v2] clocksource/drivers/riscv: Get rid of
 clocksource_arch_init() callback
Message-ID: <Y8qgn5FVtro0nAlp@wendy>
References: <20221229224601.103851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20221229224601.103851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_061011_516420_7E45D60F 
X-CRM114-Status: GOOD (  13.40  )
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
Content-Type: multipart/mixed; boundary="===============3014885878318036589=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3014885878318036589==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jF0mOp7nLO7/TrvI"
Content-Disposition: inline

--jF0mOp7nLO7/TrvI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2022 at 10:46:01PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Having a clocksource_arch_init() callback always sets vdso_clock_mode to
> VDSO_CLOCKMODE_ARCHTIMER if GENERIC_GETTIMEOFDAY is enabled, this is
> required for the riscv-timer.
>=20
> This works for platforms where just riscv-timer clocksource is present.
> On platforms where other clock sources are available we want them to
> register with vdso_clock_mode set to VDSO_CLOCKMODE_NONE.
>=20
> On the Renesas RZ/Five SoC OSTM block can be used as clocksource [0], to
> avoid multiple clock sources being registered as VDSO_CLOCKMODE_ARCHTIMER
> move setting of vdso_clock_mode in the riscv-timer driver instead of doing
> this in clocksource_arch_init() callback as done similarly for ARM/64
> architecture.
>=20
> [0] drivers/clocksource/renesas-ostm.c
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Samuel Holland <samuel@sholland.org>
> ---
> RFC -> v2
> * Dropped vdso_default static global variable

> * Used IS_ENABLED() macro

Not sure it really makes much difference here either way, but increased
coverage is always good I suppose.

rv32 is the user for the !GENERIC_GETTIMEOFDAY patch IIRC and nothing
seemed obviously amiss there to me either.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


--jF0mOp7nLO7/TrvI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8qgngAKCRB4tDGHoIJi
0lANAP4/lQXHQYV12FWR9fMBrlqGro7dG6zJw5CN12H3WufHkAEA+pjrHts9eaEc
DyDNhC86lie/e9gho75+rDX39f81DgQ=
=ZdMu
-----END PGP SIGNATURE-----

--jF0mOp7nLO7/TrvI--


--===============3014885878318036589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3014885878318036589==--

