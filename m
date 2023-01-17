Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E00C63797
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 08:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fL0Zykiu5B8yGFzQqj0AEeUsp3we0zOPHcz3T4mwTFc=; b=RgZdXppHl57que5xKcv6tQ6wyi
	Bnod8w17K7gQN7XSQjE0qmqn8iGcO5AGlfCeTfMqQSWygXnyxA9SF6UTLtTWG22z8tBGsr8C/dxB/
	w6iWFU3M95lr2eMniG/+/EQaGvAiD3znTqwcO5+P1fI4lC7r4v6PEhQ3k62Z4QAWofWFglEhxL3Mg
	X6A1E068T5isj0PcFhpaO3KInIhh7g//CPN94bkpJ2A3nv9xAXN6f1HMr/zOFHzS308H5kV7W4ala
	WOIHFqyAio0Wv8SxYdL1ilSJRnf5igKHb8gjUU4mcLuNbcAm8DfMnNPvk1r7OKR5j/JWeWNWwIqAt
	8PkPreMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhCN-00DItC-Op; Tue, 17 Jan 2023 08:20:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhCB-00DIpx-Do
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 08:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673943591; x=1705479591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TW5FfshgIzZRRjLdDMxrOBpXSVNWPQuBogP5u7PR2gQ=;
  b=trr1Q54eqrTISbG7U55MC8GHgXte8wwehAIjCVnb2awDOPVXjCHLuu9m
   1fJi35nxXQDoWRRunCnl7/B0qaNVt0RLXy763eqJ+ohSYPnYcuBXL+/K3
   0RHnQm17yhCM8yzHGBS0bC4edPY66jaPYYJRRf747qLR6YHY/ewKILis3
   612Bl1jNYFxwwUPHH9z/n1GpQUKq9fgbfJ/cXc3K3S1DU9i0ti+h3uT6e
   JHZdgxW6gfH80p1/BDLDm5xp9bUkvlFA1D3ayKYrp/MlrmuFGX7OvArr9
   pnhfx7y7tGz+JUzQ2Zp5izp104ssTB39HzLRJI1mNK+bWGSey7Ea77suR
   g==;
X-IronPort-AV: E=Sophos;i="5.97,222,1669100400"; 
   d="asc'?scan'208";a="196955778"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jan 2023 01:19:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 01:19:46 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 17 Jan 2023 01:19:44 -0700
Date: Tue, 17 Jan 2023 08:19:22 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Walker Chen <walker.chen@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] JH7110 PMU Support
Message-ID: <Y8ZaCpEsmG4hChn+@wendy>
References: <20230116074259.22874-1-walker.chen@starfivetech.com>
 <Y8WjKArEZH5zd5jb@spud>
 <02174460-87b8-bb1c-7b6f-39694fa416c3@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <02174460-87b8-bb1c-7b6f-39694fa416c3@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_001951_562858_5115EED6 
X-CRM114-Status: GOOD (  23.89  )
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
Content-Type: multipart/mixed; boundary="===============3447514544356382179=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3447514544356382179==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RaSbWA0bl43jGaof"
Content-Disposition: inline

--RaSbWA0bl43jGaof
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Walker,=20

On Tue, Jan 17, 2023 at 03:45:22PM +0800, Walker Chen wrote:
> On 2023/1/17 3:19, Conor Dooley wrote:

> > It's helpful to do this, as when I went to apply your patch, there were
> > some conflicts that needed to be sorted out. Because of your prerequisi=
te
> > patches, the usual `b4` commands would not usable. E.g.
> >=20
> > b4 am -3 20230116074259.22874-1-walker.chen@starfivetech.com
> > Analyzing 4 messages in the thread
> > Checking attestation on all messages, may take a moment...
> > ---
> >   [PATCH v3 1/3] dt-bindings: power: Add starfive,jh7110-pmu
> >   [PATCH v3 2/3] soc: starfive: Add StarFive JH71XX pmu driver
> >   [PATCH v3 3/3] riscv: dts: starfive: add pmu controller node
> > ---
> > Total patches: 3
> > Preparing fake-am for v3: JH7110 PMU Support
> >   ERROR: Could not find matching blob for MAINTAINERS (85e8f83161d7)
> >          If you know on which tree this patchset is based,
> >          add it as a remote and perform "git remote update"
> >          in order to fetch the missing objects.
> >=20
> > Fortunately, this is just a driver addition so despite `b4` not
> > helping it was easy to resolve but for other patches in the future,
> > this may not be the case.
> >=20
> > Assuming the dt maintainers are happy with the binding, ping me in 2
> > weeks if no-one else has commented and I'll apply patches 1 & 2.
>=20
> Could I drop patch 3 and rebase patch 1 & 2 on the latest mainline then s=
ubmit as v4 ?

I dunno, if someone has the pre-requisites then they should be okay, but
I need to apply 1 & 2 without the pre-requisites.
I dropped patch 3 & did the rebase myself so that the build bots would
be able to build the patches:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dri=
scv-jh7110_pmu
I got the build success email this morning, so they appear happy with
it.

I would wait for some comments from the dt maintainers on patch 1 before
considering re-sending the series. If they have comments, then please do
rebase on v6.2

Thanks,
Conor.


--RaSbWA0bl43jGaof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8ZaBAAKCRB4tDGHoIJi
0vDcAPwMe+7Cb3Df6wDftdGrVQtuCZJrxoFppaxvImoNaQ5adwEAtrjpgkcsyweC
fh9qvBjyHXKBxr5a7lkpYkS8+IRJzQs=
=8lxA
-----END PGP SIGNATURE-----

--RaSbWA0bl43jGaof--


--===============3447514544356382179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3447514544356382179==--

