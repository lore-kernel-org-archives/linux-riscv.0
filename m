Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87924C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q14qKSar9fEhRBu3dyqVu17dCUsjs0olC04OBZMn04k=; b=UsvReGIqiD0kWFub19v8fJR7Dc
	x8QKjMAxdMRqJKuWBEdVqCzGlx4HRAQ/iRAvIKLvnEQlBsSQ3Y/6+Egj7z1rwpJWK5tBP6QPNbsIP
	k7bbZ/nvncH2BezqMNESHh5OroTfZWgSTNUJ/xZJIzEINBGoTGukLetXdynjTgnwMe1GTGmKVaJ14
	ph1sZw+ZSQBvlrk6R+V2BXm3mYg6ZhSB7ngCCbSyUJDTOpKllmdGx0bUD0UTFzgd940u7vbAMBHmR
	qHDC+kKmXYrX97ZH3TdCprxaeOklKblFRjeJFo1r7X+R6JygsNY8/5Yq3cGpRNvAYDhaKXBTA43V9
	WtgbbaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XoH-001xbm-39;
	Mon, 27 Nov 2023 09:21:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XoD-001xb1-2V
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 09:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701076902; x=1732612902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VUSPYjDKlMwuW2JRSJ61+FAHHiwznJIqIhpJdIbiNJw=;
  b=0dmIKdI65Cjf4EK0/a4RVuuTbAJHfnC93L5d/F8wsaR0NPQsPkvlTJNj
   2ss0t8JZielBC5qMSCXVJ+Tf01Sk2n3UJc9GsZQukyrF8Hfle3IIQSohk
   ogKjgEaj7xkUeLtJFrVqyDdwBdzz7rf1diO4Z9ojUAuWfeex7R45qub3T
   Uh2D0NIMwKaAjpIRkvWwHofXukSKOLRqUIz4pLEwaB852B6+urilmXCyy
   0zjeSK31+QG4ak228o/GsREsydM07OktNc0HN+CelwEJVZmoJOov16fIW
   pFYLOyx1IruRVNRuPiTX4QMXeq9GcUWBSfU5qLXVX8e7bGuktbzPkrGXu
   g==;
X-CSE-ConnectionGUID: 8HWE/KGCT9Cu+VA5//C5YQ==
X-CSE-MsgGUID: xPwz78lvSnKAE4YDWTljVQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="asc'?scan'208";a="12324235"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2023 02:21:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Nov 2023 02:21:12 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 27 Nov 2023 02:21:10 -0700
Date: Mon, 27 Nov 2023 09:20:41 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Sia Jee Heng <jeeheng.sia@starfivetech.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <conor@kernel.org>,
	<kernel@esmil.dk>, <robh+dt@kernel.org>,
	<emil.renner.berthing@canonical.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH 7/7] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Message-ID: <20231127-undying-sauciness-a5c1a2e7c89b@wendy>
References: <20231127013602.253835-1-jeeheng.sia@starfivetech.com>
 <20231127013602.253835-8-jeeheng.sia@starfivetech.com>
 <20b13322-3cd1-47b1-bb39-2710ddc59a11@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20b13322-3cd1-47b1-bb39-2710ddc59a11@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_012141_929208_C6670315 
X-CRM114-Status: GOOD (  12.13  )
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
Content-Type: multipart/mixed; boundary="===============1976093473652065281=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1976093473652065281==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UIZ7q/jzaCkPlcNJ"
Content-Disposition: inline

--UIZ7q/jzaCkPlcNJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 09:50:35AM +0100, Krzysztof Kozlowski wrote:
> On 27/11/2023 02:36, Sia Jee Heng wrote:

> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	cpus {
> > +		timebase-frequency =3D <4000000>;
>=20
> This was fixed recently on the mailing lists.

Actually, I only fixed this for the microchip stuff, as I don't know
whether or not having this in $board.dts is valid for other cases.

As far as I understand it, this works just like regular clock nodes, so
if the clock is provided by an off-chip crystal it is okay to have it in
$board.dts, but otherwise it should go in $soc.dts.

The same applies to the jh7100/jh7110, so if you could clarify it for
that platform too, that'd be great. Doing it in response to
https://lore.kernel.org/all/20231126-attractor-swampland-b1b95bd1322b@spud/
would be great.

Thanks,
Conor.

--UIZ7q/jzaCkPlcNJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWRfZQAKCRB4tDGHoIJi
0gHWAQC+qna0EhtpL1qCEG6ofq0rMPUV6Ic0TYQILJz5IPX2AgEAgjxLKeIm8q6D
LemVXtIRAcw5kl6QPfdqlkh2VPQxrww=
=P5+r
-----END PGP SIGNATURE-----

--UIZ7q/jzaCkPlcNJ--


--===============1976093473652065281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1976093473652065281==--

