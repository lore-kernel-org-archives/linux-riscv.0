Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8EBC624B4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 13:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oO+jrvwZeLVN1JCdy3re5fJEWja2N/G1J0UUIJotT/w=; b=fEn0+WFJjq44devgH+kjsm2nVo
	TXmGws8vFlWfYRTwNSlzq2eL9ezwTqXxJFMHJdgG68D1awXG+jVAgwgBO7yeCpofTBcA2CQhz1cm1
	gzg5hsFs1ZEyMQY/EQG6LDrQc/m2om4q25I6qjqFpYfWhSB9t3d0WtA/Y0gNGZU7m3FFlAR5bYEzQ
	x9rHu9VCP+yczBaXVlbHcCEqGmJllexdJRVlBDL3LToo5KUM30A2TZS6Pn9iT9Jpe9bk0sL9x6IVJ
	+EA3HiLkTdu5l1unKjYMKzTs6BoxC7fL/Rt5s8Vrf3hX36iXj+bpG+/vME2zezoOJecELaLhRMyBc
	TYosrCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r69d1-004sPD-2j;
	Thu, 23 Nov 2023 13:20:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r69cx-004sO9-2d;
	Thu, 23 Nov 2023 13:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700745620; x=1732281620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fWNtfXHzXywCV3rJawk3X+XqobnQl2nUu8oA1ElHfxI=;
  b=hL2V6sMuvqJYiHXYlYrKLeD0qM9j8iAyLkTgNW9EnLSQ6Non9P2rXLy6
   Ji/MeLzfQK2hpJaid+CIHEgAedKpGL7wEFJ5jSoFK8iZj1l7g585iznTb
   Yi1hysytfFM1L1IKxR5C1XIEsdxy325VTH/KHhNr95cN/j2J7mPt4Qrm6
   RqcuzgAdXKkDaNYhKIs9rjk3MQeXUT4+nnACejr+abpNmQAthoexebAjk
   xPzXQ3nJHFLauJopFf3z6p3GUhxckPJMiIh+I9CEKgwdbbNVZTiGFSLF6
   lSTf4wRQPEbDlcutVPqmCXnHM9dLyAHfpb3Vvu+72eaNUMz6S+5a8B+Dg
   Q==;
X-CSE-ConnectionGUID: bvAY+6v1Q022ekVbEs8Vvw==
X-CSE-MsgGUID: E6+Bsg93R3eTTQTJUaz5eQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="asc'?scan'208";a="12192189"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 06:20:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 06:20:08 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 06:20:06 -0700
Date: Thu, 23 Nov 2023 13:19:38 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh@kernel.org>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: perf: riscv,pmu: drop unneeded quotes
Message-ID: <20231123-nutlike-handiwork-2b24bffc64ac@wendy>
References: <20231122224414.2809184-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231122224414.2809184-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_052020_033574_6A0DA1CE 
X-CRM114-Status: UNSURE (   7.71  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2761631707902927682=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2761631707902927682==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VwNbz+r5L7xIZna3"
Content-Disposition: inline

--VwNbz+r5L7xIZna3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 03:44:14PM -0700, Rob Herring wrote:
> Drop unneeded quotes over simple string values to fix a soon to be
> enabled yamllint warning:
>=20
>   [error] string value is redundantly quoted with any quotes (quoted-stri=
ngs)
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--VwNbz+r5L7xIZna3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV9RagAKCRB4tDGHoIJi
0pBwAP0cuJ5+YBbNci6dtuViPbnpzFtnjRuPYpj7iZekyYXM6QD+IJJFLGfqJprA
5v+CEke2yJopFXOGNr0Y9vZLmj/imQg=
=G5Mg
-----END PGP SIGNATURE-----

--VwNbz+r5L7xIZna3--


--===============2761631707902927682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2761631707902927682==--

