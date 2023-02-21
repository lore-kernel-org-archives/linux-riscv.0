Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C259C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nlwf2TPEvjEE50wDhO7PcxQFP+IiEBhNZYa1vTPZSQ=; b=Afc5TMgzZ3mGOgGrfxlWKwWLCL
	LOBOys5wy0x/3UCPgMHOsbsLpDP0qdRYaZ9rXzp8PgdZwIBRac51zZseM1gg6iJC8tJPDl9irHmEY
	+tRHahkFyYFHtrpBcP9DEXQCI5mrC5T2ab/MTX8jixGh+5GOdiiOWoJvXeW5Pt3rrBUqr3c/Ediqg
	hvxY0aqszXnshf2/N4VjOBCucOGqPQ6cYAa9tS+p/ecEZpTQEIOd6gLi6cYMZ/6Dg79kaQQ9jHfvV
	dhS5CrsHpByXcoGmfbyKBM/P72CAnPvDc8Rjh0SJRU6+1I2ihOH9Ti3kvT2Ez4QN9dE8bDz3IQVCY
	6QmdFBEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUIo-008cNq-IH; Tue, 21 Feb 2023 15:11:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUIl-008cLp-Hc
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 15:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676992291; x=1708528291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ZW2Q3KtQe8Z07sQgq1qV6g5TesF3qQIYfp8f8ljU50=;
  b=PbSDz7t4Wy2/O+We57lQzl+DI0YG9FH/CYTVWdxC3T0xKSwz2jfTfxbk
   3jgICUGaErBAp1EJ5IRxRyNpeF/cJkpLY692S3N666eMBZ7R8pBPMXUgz
   CW+5pwHzKJ51n0NKKWbnYfBcqn+ezxyND1up/AsEEr3tsuOKF2w8N+6/A
   WZWISNON80D4kdVhqyNi8lT1y5cyZNV4MfOM6rbNd7mlreS4x7zJRDmi+
   CLfhJg8H+dMBFtaXp8mqV8J5NaPPxt2gpMGT9Qvv3VsGayEvTQwOuOjHy
   mZ8yQbQh0WP33gZGLK1plKg3gPMDvAVsa9Rg9ABRm2V4DSoy/tbVrVmhU
   g==;
X-IronPort-AV: E=Sophos;i="5.97,315,1669100400"; 
   d="asc'?scan'208";a="212990992"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Feb 2023 08:11:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 08:11:04 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 21 Feb 2023 08:11:01 -0700
Date: Tue, 21 Feb 2023 15:10:35 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Hal Feng <hal.feng@starfivetech.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 16/19] dt-bindings: riscv: Add SiFive S7 compatible
Message-ID: <Y/Te66AZYjBXMxpO@wendy>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-17-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230221024645.127922-17-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_071131_672781_94887116 
X-CRM114-Status: GOOD (  13.84  )
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
Content-Type: multipart/mixed; boundary="===============5711480393226082370=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5711480393226082370==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r8mdfKzrJCh2QVlz"
Content-Disposition: inline

--r8mdfKzrJCh2QVlz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 10:46:42AM +0800, Hal Feng wrote:
> Add a new compatible string in cpu.yaml for SiFive S7 CPU
> core which is used on SiFive U74-MC core complex etc.
>=20
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index a2884e3113da..54bfe24a436b 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -35,6 +35,7 @@ properties:
>                - sifive,e7
>                - sifive,e71
>                - sifive,rocket0
> +              - sifive,s7
>                - sifive,u5
>                - sifive,u54
>                - sifive,u7
> --=20
> 2.38.1
>=20
>=20

--r8mdfKzrJCh2QVlz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/Te6wAKCRB4tDGHoIJi
0jRLAQCLxbjzKZxF5kXJAN0YbHDLPfmmtWsh1g2Ra+4w1YSTPAD+PRiyh0QABaP+
6N6Sl0W0ikTZ40hz6WDViUfRfs5KrwA=
=J3rH
-----END PGP SIGNATURE-----

--r8mdfKzrJCh2QVlz--


--===============5711480393226082370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5711480393226082370==--

