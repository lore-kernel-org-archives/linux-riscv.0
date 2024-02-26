Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D118DC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h60F2U1yRjyrnz3A4vS36MKX47iE3pYh8kc6qOZdStU=; b=m78d63XysX0rWoeULRYFv9lOXm
	AiNj7EHnLL+P/JNUDgnGGiCJUCJ8Gia28Kcy52bNUWzO6hlx0lXdQNVumfU0LQTt1c2uhuylYOFsV
	lMyru15ziJEpezEpo2qX47CZnvgO3dHqFS9UnohvdIm508chqv96H+ZVObG/hMBpH0Dvu3C33Ybeo
	S1G4FcA2eQ6pMS9jEVv4itCbS6Ee2hdJktrbaeUKlpvqBfK8dPTUKrDyvpKhGeFRMCyvnRn3+8X0T
	uEEavN2IyqOxFbyL3U08rewv/Dnh/tuWWvDwTqIdx1c1Ssh7oDna/qlWewOT+7MUa3zpFX00Yt7IR
	H6a9p64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXnT-0000000HViK-4A21;
	Mon, 26 Feb 2024 10:01:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reXnO-0000000HVeg-2r50
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 10:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1708941674; x=1740477674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=20R+xqDeDVw9ZtogwM2IQU2YVHkmY//AxAOlDJCpmQY=;
  b=rwPgmw/bG9U/olWHwrTsFTpdUdwsxH7ZPBkrB57KqjjFU4OSz05cNOLO
   Ma+SfFybTWElpbDDnSoYfKwYAl+FfeFzc4IR5SnGPg4uoplcErMsB2t1A
   B8Cl5oLgqKoPxQ8CWjAuZ6FRNOhMeaDB8BRMryVE0g9UlHvI5A8N4uw0S
   8MpTU3WBTR2gbdwa/J1ndQ/Zsh+cGiKP8hnEn46yf1RgCrcHp0lu2nFRm
   5AtHobdNL/7+9xW+yWhPpXm4peWeA8RG833XwKJmx3ygD8Is6G8izEbUS
   RV77DuO4/9d2n7mIoH+7iPkSaJF8un6+BGzzyr0WQu0L7NZMiJ1peJVse
   A==;
X-CSE-ConnectionGUID: gRuuUu1JT96ZGupzs5M00w==
X-CSE-MsgGUID: hu0OAtBmSMyULpQwlqszwA==
X-IronPort-AV: E=Sophos;i="6.06,185,1705388400"; 
   d="asc'?scan'208";a="18370423"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Feb 2024 03:01:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 03:01:06 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 03:01:03 -0700
Date: Mon, 26 Feb 2024 10:00:21 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Conor Dooley
	<conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, William Qiu <william.qiu@starfivetech.com>, Ley Foon
 Tan <leyfoon.tan@starfivetech.com>, <linux-pwm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: pwm: opencores: Add compatible for StarFive
 JH8100
Message-ID: <20240226-greasily-balcony-cee5014f5b8b@wendy>
References: <20240226033945.816974-1-jisheng.teoh@starfivetech.com>
 <opzxowacxsagwgw3l33p6y7omzjokus2bi3ol5wizfwjwi2s44@3p5frb4ysji7>
MIME-Version: 1.0
In-Reply-To: <opzxowacxsagwgw3l33p6y7omzjokus2bi3ol5wizfwjwi2s44@3p5frb4ysji7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_020116_056679_A4CBE87F 
X-CRM114-Status: GOOD (  16.39  )
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
Content-Type: multipart/mixed; boundary="===============8034113909702380657=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8034113909702380657==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qIf1NVTAKfLs5NKT"
Content-Disposition: inline

--qIf1NVTAKfLs5NKT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 09:11:23AM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Mon, Feb 26, 2024 at 11:39:45AM +0800, Ji Sheng Teoh wrote:
> > StarFive JH8100 uses the same OpenCores PWM controller as JH7110.
> > Mark JH8100 as compatible to the OpenCores PWM controller.
> >=20
> > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> >=20
> > ---
> >=20
> > This patch depends on patch [1] ("dt-bindings: pwm: Add bindings for
> > OpenCores PWM Controller") in Conor's riscv-dt-for-next branch.
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/com=
mit/?h=3Driscv-dt-for-next&id=3D2529085831b01fcd02ff58ab4e2596d3b31bcf80
>=20
> I recommend to make use of git format-patch's --base parameter to
> additionally(!) make this information available to the build bots.

I like the "additionally" :)
>=20
> Looks fine to me.
>=20
> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Coner: If you're happy with this patch, please apply it in the same way
> as the initial OpenCores PWM Controller binding patch.

Ye, I can do. Although, I suppose this is an example of why the driver
maintainers applying the bindings is preferred, even if the driver patch
itself isn't ready or there is no driver patch.

Cheers,
Conor.

--qIf1NVTAKfLs5NKT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdxhNAAKCRB4tDGHoIJi
0sfGAP4gXa3ZQBTcw4KYOWpO4Y9Hl56JOtYMdxzTr8/ALwaDwAD/WwrHnl741xey
Tfp2k4uQHY/CONnty4macPOekNyY4wI=
=Oyq2
-----END PGP SIGNATURE-----

--qIf1NVTAKfLs5NKT--


--===============8034113909702380657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8034113909702380657==--

