Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EA7C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 07:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmfLiVGjitqPd3uiwHWg/5nQvusAYw7Lbv+KmeBp5Qs=; b=q9mM2fXjeeLWVQzU0zm7JeLRYY
	0JaFZI52sQsO47wGSTHWqdQh3wbw+3QlPN6099/dpAqT+2Gu6hpit5KPnSzmDOkpsGaepehMWIt8C
	Fb8AX03q3kSI7Q7zJvGZDDSRuUM8LIbDJ8TlnPR+v5c/KOLuLiNMmIietiqI3TScU6thiompZYymg
	Ns+wf+mUME1HXKMtuGjB8GKRQTdZLm0BcjFKDMA98j8oAd2wuU72keSlkgxma0QmeusZws34i8CDS
	IBwrUAP96SFvw2dWZGxVjrRNLILMjS8CtzcgnUzdGUszYUURvrMqd6dDIvd912pIaF55XIZ8TSndp
	vJob221w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCbCG-004IVa-1J;
	Mon, 11 Dec 2023 07:59:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCbCC-004IUl-2p
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 07:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1702281560; x=1733817560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ahXSbRAJBTiA2MQUihFAGoimJVSEvl5KNWFHCZRfaVs=;
  b=k1SAioS8P+6If34ahIDABOmAYjD3L7hXfMTemNk23/g05mF9Nb4EF636
   ADGJKI+Ce1bJ7fRdB5jBO5lo8lRVnnEQFk4DPymKBpx4/OI388mQP11On
   xbhZ4orU/y/fu15jTkuoxpknH/HvvKNYI0sXRCcELg2+bFA+6y5qrPv3Y
   AHHS4rEHGD5iwCM13jT5Dhy9nLYR2g6Cwh4sxCa6+wFkb/K+8eZCvrfk9
   ATGf20lVotlL32uC1SCL2ArP64+WSUZaqduTLEJlwOn8ERtF25eCieNIu
   mRbo4QxfJkz6EM4ezosqez+GwwAOlRzSaFETlGSDpyqEGdL2xBV+mdqNH
   g==;
X-CSE-ConnectionGUID: 8UrTKvbkTlm7b+wAo40GdQ==
X-CSE-MsgGUID: /JF1wvFzSLWglB/cfw89gA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="asc'?scan'208";a="180266216"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Dec 2023 00:59:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 00:59:06 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 11 Dec 2023 00:59:02 -0700
Date: Mon, 11 Dec 2023 07:58:31 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
CC: Shengyu Qu <wiagn233@outlook.com>, "kernel@esmil.dk" <kernel@esmil.dk>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"krzk@kernel.org" <krzk@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"conor@kernel.org" <conor@kernel.org>, "anup@brainfault.org"
	<anup@brainfault.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>, Michael Zhu
	<michael.zhu@starfivetech.com>, "drew@beagleboard.org"
	<drew@beagleboard.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Message-ID: <20231211-submerge-vegan-244889f1751c@wendy>
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
 <20231201121410.95298-7-jeeheng.sia@starfivetech.com>
 <TY3P286MB2611F70A3D61788E556C8A30988AA@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <358bcdb3f0ab4a7b9d6bbe17ca1a696d@EXMBX066.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <358bcdb3f0ab4a7b9d6bbe17ca1a696d@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231210_235920_997228_163229CC 
X-CRM114-Status: GOOD (  10.57  )
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
Content-Type: multipart/mixed; boundary="===============2960646702244846148=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2960646702244846148==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hd6P+t5VhD/fQIFu"
Content-Disposition: inline

--hd6P+t5VhD/fQIFu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 01:38:06AM +0000, JeeHeng Sia wrote:
>=20
> > From: Shengyu Qu <wiagn233@outlook.com>
> > Sent: Friday, December 8, 2023 8:09 PM

> > Does the dubhe-80 cores actually support vector? Or vector support
> >=20
> > doesn't exist on actual silicon?

> We don't have a use case for vector application in JH8100

I am sorry, but I am not clear on what this means. Do the CPUs on
the JH8100 support vector or not?

--hd6P+t5VhD/fQIFu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXbBIwAKCRB4tDGHoIJi
0qLgAQDdnIyMYOcscMM6Xn9n15BVhbDy7y4Y61q9DeXzpLmYtgD9HbHQYif0r4fF
BViOKAMeIVjMPAbnlXqZaG4Vt1VXzgY=
=Z2qE
-----END PGP SIGNATURE-----

--hd6P+t5VhD/fQIFu--


--===============2960646702244846148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2960646702244846148==--

