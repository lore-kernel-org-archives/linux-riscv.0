Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAAFC48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 09:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1eFVNeIXYgJ2JrX3Uom/ZBCNa1g1iX9LEdOcDJXwnk=; b=1VTBM9umyl698S4hqf+XRzLB2q
	Yc0iq2FJ5pMHoSSKdNl4KUzF7ewWCuT1IzgbbF+xgVPka7Tp4ePrYIwh4GPApblrzXVzncRWCsPDw
	yb4UjR8jW/mgRJMh64JWwuEC0vWSa+C2iKIkqIc1KYyqtjw7T20YGtmL2o2zXpNHFQgG3VG+1nbY6
	dfPsmrW4+yYxvSsH7cjFnwXYciBAOYo9Rqfycsd0QJrekUd8hhxzTtxD+uiDXAo2VVE4twa4JZ710
	NsTW3zY4O1EDUL20C0IL+RLcHkfKkbhYIIzrQcZBeTqSRjgS47NgJiWalFQO55j2A8yzafBrb73Tr
	VTUOGLeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raufq-00000001l4b-1eqs;
	Fri, 16 Feb 2024 09:38:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raufn-00000001l3W-1mRw
	for linux-riscv@lists.infradead.org;
	Fri, 16 Feb 2024 09:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1708076303; x=1739612303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YztRVAMrWM4QMn+3khyc9Qi6zHLT7tuCgUnaeHsjBWA=;
  b=LKZK0Zz0y8iE+G63GmFL3gY9p+80FwnQsRmk6jCZ7xXCtbfiJUrCwehD
   ySaeGJ7OGU61XJPsU7u6eT/ToXv7Fbr6esWitVzmwWT2p9dDdRBWN+dgO
   MMIyQaIXRvz38WJv1IfmOMktTB6bhAo1DgttC4yK4EA0rnV6waNFcXO/m
   WDqP9xl089JD8UP4bL2cFao3BHROqsYln4pZ5V5wbxvEp+YcyiSVeeRQE
   c0JhvvexAWzNxoRDV9/+LNx2J+QarOfoQEjTK2iMpgyBCy/TkqlrfDoEk
   nS+6fvX3WSjaJRONmXBhlnzWsR2HliKmql/SsiGWbv4G8yxRGSsvFWktS
   Q==;
X-CSE-ConnectionGUID: Z3dkU+2hRsuPUT2NteERjg==
X-CSE-MsgGUID: 2bUyP5NgQWuU9FhmhwOPQA==
X-IronPort-AV: E=Sophos;i="6.06,164,1705388400"; 
   d="asc'?scan'208";a="16346714"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Feb 2024 02:38:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 16 Feb 2024 02:38:07 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 16 Feb 2024 02:38:05 -0700
Date: Fri, 16 Feb 2024 09:37:24 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>,
	<linux-riscv@lists.infradead.org>, Green Wan <green.wan@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update SiFive driver maintainers
Message-ID: <20240216-exit-pointer-43dc427bf4df@wendy>
References: <20240215234941.1663791-1-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240215234941.1663791-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_013823_543120_C41EE76A 
X-CRM114-Status: GOOD (  11.77  )
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
Content-Type: multipart/mixed; boundary="===============3751575119018819766=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3751575119018819766==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mYkzGwyutxXcaTiN"
Content-Disposition: inline

--mYkzGwyutxXcaTiN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 03:49:11PM -0800, Samuel Holland wrote:
> Add myself as a maintainer for the various SiFive drivers, since I have
> been performing cleanup activity on these drivers and reviewing patches
> to them for a while now. Remove Palmer as a maintainer, as he is focused
> on overall RISC-V architecture support.
>=20
> Collapse some duplicate entries into the main SiFive drivers entry:
>  - Conor is already maintainer of standalone cache drivers as a whole,
>    and these files are also covered by the "sifive" file name regex.

And the binding isn't affected since I get all binding patches anyway.

>  - Paul's git tree has not been updated since 2018, and all file names
>    matching the "fu540" pattern also match the "sifive" pattern.
>  - Green has not been active on the LKML for a couple of years.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for doing this :)

Cheers,
Conor.

--mYkzGwyutxXcaTiN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc8s1AAKCRB4tDGHoIJi
0s1nAQCTZODj0RTvd44DM0Y7k+8LPG3mmMncetbaGsTQ8IvxWwEAqbfS75MldlXS
KFexxnGBuPQaptsVig9ZWd2+H8Ei0AM=
=Zecr
-----END PGP SIGNATURE-----

--mYkzGwyutxXcaTiN--


--===============3751575119018819766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3751575119018819766==--

