Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E395C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3iHzR8+mpAWQMV5ja1ghmh3UncuGwPHFw3Ew5epwrE=; b=DOhG3MJVU61L7h5ayR7JIDua64
	dwyvR8lz6BBiS2T+2kJzL3D5wyErSbV1AW+IyyFuGe9XPAZRXBcAUwg0i4iPN3/ph7MZVItM2AsNI
	NLcO6Xkp7kjcgL4P2pU+NRhVjGiRdWDrzVy4xb16iS0fFDfvGuAdsHwJJwYROF3IIl0Bbd16e/2AS
	SCpEONR89K+fMnUcQxSJECC0Ekx0EsxvSL2uWWv7Pbk7oim3nMFYNx8atwXS4iCfrC+s2iNIQu3tD
	OlV5SR7K8bYDMthme2XQSHreLQnbj06Us7F46e8uNQrvyWMbd0kT+F6JvZXcPmbcW21cbpGg5P5yM
	Akcg1ZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyU2Z-001TVk-06;
	Mon, 15 May 2023 08:58:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyU2V-001TU8-0K
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 08:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684141122; x=1715677122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hMsyLAgqduiMwamIfLzaLKeu61ywdWXcxC7+DE2RUok=;
  b=f/CDxiuzXVKBzOpikpfLH0rOrpU3I9DQ+W++NX2Fxbh7nl3qBLNuTwyt
   Vh+ZnAQ8teEJ0hQv+dK4GsdLcFHe5lxTJneBUwiMwbVbtuXcF8OqAzFpx
   H3hvNJCO3jkL0XtfrI8NZrf1z50OD/6wmF1CJ0BBdDcWtLv6SH8+wLWqh
   8I380VPGl48S3Z0WiipBhcqpPRhRg7YjQMrM3eJNawGFPwpKtjUI1KkD9
   7WbX6wQBIb/KcgckcR/dCBQzCt6OdnQ6f+5INGItNxQxdhx600Opq9eU0
   /XC2T/bgnoGH3NMaLVhS3RI5htS+lRygfFzT379C1ywPi4g9pN99hQkSe
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,276,1677567600"; 
   d="asc'?scan'208";a="213313694"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2023 01:58:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 15 May 2023 01:58:37 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 15 May 2023 01:58:33 -0700
Date: Mon, 15 May 2023 09:58:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Walker Chen <walker.chen@starfivetech.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: add the node and pins
 configuration for tdm
Message-ID: <20230515-dragonish-diffuser-48a1c6f4c8ae@wendy>
References: <20230511091549.28003-1-walker.chen@starfivetech.com>
 <20230511091549.28003-4-walker.chen@starfivetech.com>
 <cd7803a2-38a0-c498-467f-1ef802645527@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <cd7803a2-38a0-c498-467f-1ef802645527@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_015843_145405_674C3143 
X-CRM114-Status: GOOD (  13.36  )
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
Content-Type: multipart/mixed; boundary="===============0040087535681341702=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0040087535681341702==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UHn8PAOuSV97BRQJ"
Content-Disposition: inline

--UHn8PAOuSV97BRQJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 04:44:54PM +0800, Walker Chen wrote:

> Hi Conor / Emil,
>=20
> Based on our discussion a few days ago, the new version of patch for dts =
looks like this,
> Please help to review and provide your comments if you feel free.

> On 2023/5/11 17:15, Walker Chen wrote:

It's only been 4 days chief, of which 2 were the weekend, you don't need
to bump it yet! You'd be better off asking one of your co-workers to
review the content, instead of me. I'll happily apply the patch, with
appropriate review, once the dt-binding has been applied by Mark. I do
not have the capacity to review the detail of individual patches adding
peripherals unfortunately.
Getting your co-workers to look at your patches, and doing the same for
theirs, is almost always a good idea for speeding up the process

Thanks for dropping the overlay though,
Conor.

--UHn8PAOuSV97BRQJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGH0JAAKCRB4tDGHoIJi
0jLDAQDrt1XJCjQ6JyzG4qMUGcwEUFr+S+UP7zNXLyeoCpvSIAEAjxdzf/onbCjn
NqfHT2twydBb9KiPvxH3Xjj9vO+hnQQ=
=spdl
-----END PGP SIGNATURE-----

--UHn8PAOuSV97BRQJ--


--===============0040087535681341702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0040087535681341702==--

