Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA8ACA0EE1
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 07:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raiH89cWt/Y4rvzhRZtTd5VJAqTr1LXMjEyIzjND51k=; b=Hmq+Ts696G4j/diZF5fZhwTeDG
	IdlIkxzWSCmsfuBTzfS1l1as/b0/EgXNNNCJyjpeEmWfKxc4iYM3XboyL6h6AWAFnQaY06mhJpCGj
	gZPCrMTTR6AYj3tDCoEJ54oT/4Mj//+OMryDC6aVJ0m98kLoMI3TXWeRRJiya6dA7+Ie3Ioch84Vo
	8dV1oZwitLWk6LiQu3EG2E3UcOK5Uh6yqe5/OAu9Bavc/tcShPRCeehjdo7HRea4+XitYQ9CaY7wk
	CUR4M51jhc+0evPvhO/8HooaXEC/9RZTWU5ULQpuxMjRFPYuO1nqwqie6WJGimL0KNax9vGmORHt+
	4QpneMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvl7-000000053lF-0pdJ;
	Fri, 30 Aug 2024 07:09:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvj3-0000000539a-18vf
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 07:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725001637; x=1756537637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s06I7vpuvh5FtVBBjKOoXNfkaI+hpLm4s5Wd8b/Kvr4=;
  b=h3rDM9oQEAMRBfur4ePaHVQHKFVQqlZIROz9qpqy1mxxYQc3ddi2WAAI
   omHKX/m1oLlMntRs6bQ6onGEYI0qOb/kzaispXu/THplymD+LfqO5stqU
   NUMSPFCCG4q3Y/KGnh0fLXnyUiZCTzRi3Eku4m0ZOiaM4AXtdVNKgJeer
   LheqX5MhZv7x2VFWagNng1anV5AqEFWO8UL8TXRsTLTRcBlJWo75Or0OE
   wi/V3+MKFyWafMKr9LbgTo2NnpziDK/2NWKbvsHy3QDQSR7L/MOSg5gNO
   yGb7hj9rW8XZBvYcOgD7tKcNMbAq9wBGVGmCPcUW6wKi8B9Exx38zlNxb
   w==;
X-CSE-ConnectionGUID: afjsWAo1T6e0LAk7nB8BvQ==
X-CSE-MsgGUID: dlg29yxyR1yb0jKAvDuxBw==
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="asc'?scan'208";a="262034575"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Aug 2024 00:07:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 30 Aug 2024 00:06:52 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 30 Aug 2024 00:06:49 -0700
Date: Fri, 30 Aug 2024 08:06:18 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicorn_wang@outlook.com>
CC: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor
 Dooley <conor@kernel.org>, <devicetree@vger.kernel.org>, Meng Zhang
	<zhangmeng.kevin@spacemit.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen
	<cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang
	<jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: spacemit: add support for
 K1 SoC
Message-ID: <20240830-tidy-identify-90dce7a21abc@wendy>
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-1-1fed6a22be98@gentoo.org>
 <MA0P287MB28226AF473BF6A261E4C5D84FE962@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB28226AF473BF6A261E4C5D84FE962@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_000717_349656_9E4B1438 
X-CRM114-Status: GOOD (  13.16  )
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
Content-Type: multipart/mixed; boundary="===============1933464554122349366=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1933464554122349366==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="74V6P+syw/CVE4ln"
Content-Disposition: inline

--74V6P+syw/CVE4ln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 07:48:17AM +0800, Chen Wang wrote:
>=20
> On 2024/8/28 19:30, Yixun Lan wrote:
> > Add dt-bindings for the pinctrl driver of SpacemiT's K1 SoC.
> >=20
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > Changes in v3:
> > - drop spacemit,slew-rate-{enable,disable} property
> > - use drive-strength instead of drive-strength-microamp
> > - fold strong-pull-up into bias-pull-up
> > - format fixed
> > - title fixed
>=20
> Drop this change history here, you can add this in the cover letter.
>=20
> [......]

It's perfectly fine to provide per-patch changelogs fyi, rather than in
the cover letter.

Cheers,
Conor.

--74V6P+syw/CVE4ln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtFvZgAKCRB4tDGHoIJi
0jE6AP4ysqQR2wlhI8N7l61bFcKY3fTl/Rj5qEuiKycVRFY/ZwD/RLfvMHbeQnnX
qxMpIu3EJeAfWS0noJpevIiMjG0r5QI=
=l5Fx
-----END PGP SIGNATURE-----

--74V6P+syw/CVE4ln--


--===============1933464554122349366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1933464554122349366==--

