Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF1ACD1294
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 12:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWXT65bkP6VJsSUtf2NP6b7H6OIY7uG/ZMW8EhuWU1Q=; b=1ymwwfSF+YiIh8JQTw8fYgRWYC
	kuZr4mbSK8NClmnwwNCA4Am+N38h4Mk7oP7sS1ZMOH51ZpIQEgsMxilYW2dYgLZ0iovj5K8mmZRq6
	FQGq34BtzsbROyuU07g+8EZjkn3ObLBJYeb4t0+fqjD/bJD1ODTozX++/MmnN0N/G2Mf7yRZaWvjf
	tcArPOu3CMzFYTwD9hnYLzhC86K28BoWjwEI2h0yCm1vYLWt7/MSOYitFZwdUNlwpvnXCnImG+8sg
	CjOPh+jLv3vNCNvT8NyYjZTFcNlsMUElckZp+Hes3OJGPViWRgytDM9kgj+AllRKCQE5kpcxK/usn
	DXL/SEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdix-0000000BCrV-1cXh;
	Tue, 02 Apr 2024 12:58:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdiH-0000000BClA-3giw
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 12:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712062686; x=1743598686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c20jtcTiYnJN5GOdRZ4xqI6F2kAuoMdLDYhAs+FZuTY=;
  b=lxytkSx6dTPYVoF0FQU0LfddkZNgh6d1lLswQy9z0r+xzjgEEEazPGtN
   Stir9Ym4qFDl8UXka40XjiUuuxs3ozhrxedRpQiOArmTg6uaadOP97RfR
   JUwkSJB/kZXVup/gICMP8AJHbY2AJ16Erdg3Cv0kYOQ1THdaQtBz1SSN3
   MIK98ABpLsydohbrl/lAYrv2p4GxiaJpTwA4YWM04QdTXH3CenQs21uZt
   oCPtyha+unoq2gw0+rqyZdvaJcsqkKwJKkofWbEU5KB3admRv9lmn1Kry
   1dvuEVMN5M/sj1RnckKCaIGXAVJb3r25v6ttS8S0QV2XMEhsERh+1hMNf
   A==;
X-CSE-ConnectionGUID: zJdH45BwRNCwIlgxGwnvJQ==
X-CSE-MsgGUID: mLaRUhSLTyS3tu+hCvVbgA==
X-IronPort-AV: E=Sophos;i="6.07,175,1708412400"; 
   d="asc'?scan'208";a="19161140"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Apr 2024 05:58:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 05:57:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 2 Apr 2024 05:57:28 -0700
Date: Tue, 2 Apr 2024 13:56:40 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Yangyu Chen <cyy@cyyself.name>, <linux-riscv@lists.infradead.org>, Conor
 Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, <linux-gpio@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 08/11] pinctrl: k210: Deprecate SOC_CANAAN and use
 SOC_CANAAN_K210
Message-ID: <20240402-automatic-radial-7bc7dc342987@wendy>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
 <tencent_6D10A9C63E3E0F412EED33477B5CDB98C207@qq.com>
 <CACRpkdY1wpGM7M5QV5rN0M6JMN_yugQJ7CEtnQjzsheD5AT23A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdY1wpGM7M5QV5rN0M6JMN_yugQJ7CEtnQjzsheD5AT23A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_055806_266214_BA780113 
X-CRM114-Status: GOOD (  16.13  )
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
Content-Type: multipart/mixed; boundary="===============6340447687447626202=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6340447687447626202==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mWQUdRed7U+WvCby"
Content-Disposition: inline

--mWQUdRed7U+WvCby
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2024 at 02:31:36PM +0200, Linus Walleij wrote:
> On Sat, Mar 23, 2024 at 1:13=E2=80=AFPM Yangyu Chen <cyy@cyyself.name> wr=
ote:
>=20
> > Since SOC_FOO should be deprecated from patch [1], and cleanup for other
> > SoCs is already on the mailing list [2,3,4], we remove the use of
> > SOC_CANAAN and introduced SOC_CANAAN_K210 for K210-specific drivers,
> >
> > Thus, we replace its drivers depends on SOC_CANAAN_K210 and default sel=
ect
> > when it has the symbol SOC_CANAAN_K210.
> >
> > [1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@k=
ernel.org/
> > [2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7e=
d0a@spud/
> > [3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c4=
6bb29@spud/
> > [4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb86=
55a4d@spud/
> >
> > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Is this patch something I can just apply to the pinctrl tree?

The new symbol doesn't exist in the pinctrl tree, so the driver will
cease to be compilable. Yangyu sent a standalone version of these symbol
changes:
https://lore.kernel.org/all/tencent_DB11214C8D0D7C48829ADA128E7BB8F13108@qq=
=2Ecom/
That whole series needs to go through one tree though, for the same reason.

If your ack transfers to that (identical patch) I can take the whole lot
via the soc tree for v6.10.

--mWQUdRed7U+WvCby
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgwAiAAKCRB4tDGHoIJi
0vAXAQCeH+Yhvgq6/ASIgmTJPZ4FUkxGBC6xwyyibvKsGIjFQwD/cR8dZLkzZWnx
k50eNNnRBJ2KI81TqZySRvwHsgO/bA8=
=QFi9
-----END PGP SIGNATURE-----

--mWQUdRed7U+WvCby--


--===============6340447687447626202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6340447687447626202==--

