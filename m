Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA0BC83F14
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pm87HOEKYChRAQfBhtE+3GbweFRQfv46Oe15CFOj2DM=; b=yA4AREtW3hbwn7hXN2ggV9+xi6
	Rd/rOffWrVfERWKUK7fc+xdFTJMhXMiU3NAalVj4qMWfzDLZmwaIwoCI7JOyLwFmqwVxob0HnDhAZ
	v2cbGBsvEjc4ikLAYqL3hNGYqM/ZxQuwzyolJRHtYc1yt7Vq3MaZ7ONrJ/wBSCnS/5rco3qam90zD
	Nqj3sBMvOaRdjK0xgv8W3sgJnEFErlZDciKArrwWDsljLftMD6kK8CYg89H86e9T2Sg0HWAj1izNr
	NZTLmZhoZrjZAdsEh537b1/moohxPs30M4j72JL6dZoZlrUVyazaWaU1G+M2eqp9M5xtAL9/V6rIz
	jv+xRwGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbGfn-00D5ec-1k;
	Wed, 30 Aug 2023 08:35:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbGfk-00D5e6-1g
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 08:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693384532; x=1724920532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1rr15Edf/mJdMl4aJdngCeF31+Nb5/f0kCNlVbqGRGc=;
  b=e6rj8UonI6OGbuBmuV1zfD2uIXmXv2slKvQFHtq1VwhaNeAuxo9xSqEC
   zV3HVUytXO9pxQQ09uKuEVCfYolfihTqiHa05hQ1OuyeZio6Pg2Za/gR2
   iv06mUCs/gHjKTnO5n2QIEFaeqeU3rLK7qk0HHSUWjwyG9ic4hnj56p6J
   x5JQaoEZs25nWkYtUsVHh1XTXwRDieaKNFL089HAM9buhl1psTzUU5RFg
   qXBkA2xXoCjiZKF1bC9fyJPAC37+nwdENACkmHF/f9GKGU7YTIYb4YROm
   1UI44T1T5rYFApl8O/B1eLuHIVBPbSVeqpNsCzvFeszkHe+jq9yUXrIu8
   g==;
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="asc'?scan'208";a="169026622"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2023 01:35:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 30 Aug 2023 01:34:51 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 30 Aug 2023 01:34:48 -0700
Date: Wed, 30 Aug 2023 09:34:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: William Qiu <william.qiu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-mmc@vger.kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring <robh+dt@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
Message-ID: <20230830-procedure-frostbite-56c751f7c276@wendy>
References: <20230830031846.127957-1-william.qiu@starfivetech.com>
 <20230830031846.127957-2-william.qiu@starfivetech.com>
 <20230830-commence-trickery-40eaa193cb15@wendy>
 <b375b88c-0d9c-30a9-21f6-283083cf3880@linaro.org>
MIME-Version: 1.0
In-Reply-To: <b375b88c-0d9c-30a9-21f6-283083cf3880@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_013532_758058_52909F43 
X-CRM114-Status: GOOD (  18.59  )
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
Content-Type: multipart/mixed; boundary="===============7980684206110640311=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7980684206110640311==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h1favm8wo5hVWnmt"
Content-Disposition: inline

--h1favm8wo5hVWnmt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 09:29:20AM +0200, Krzysztof Kozlowski wrote:
> On 30/08/2023 08:50, Conor Dooley wrote:
> > On Wed, Aug 30, 2023 at 11:18:44AM +0800, William Qiu wrote:
> >> Due to the change of tuning implementation, it's no longer necessary to
> >> use the "starfive,sysreg" property in dts, so drop the relevant
> >> description in dt-bindings here.
> >=20
> > How does changing your software implantation invalidate a description of
> > the hardware?
> >=20
>=20
> Which is kind of proof that this syscon was just to substitute
> incomplete hardware description (e.g. missing clocks and phys). We
> should have rejected it. Just like we should reject them in the future.

:s I dunno what to do with this... I'm inclined to say not to remove it
=66rom the binding or dts at all & only change the software.

> There are just few cases where syscon is reasonable. All others is just
> laziness. It's not only starfivetech, of course. Several other
> contributors do the same.

I'm not sure if laziness is fair, lack of understanding is usually more
likely.

--h1favm8wo5hVWnmt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZO7++gAKCRB4tDGHoIJi
0u4KAP0Vf98t3HptgWUDxzyfGqUIFcjfe/j2Dbq8eR0D637TbAEA0mpYQNoVYT5e
3uimUjgIT7U4Gkf664SMkKGV+ED1Zgs=
=cvPO
-----END PGP SIGNATURE-----

--h1favm8wo5hVWnmt--


--===============7980684206110640311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7980684206110640311==--

