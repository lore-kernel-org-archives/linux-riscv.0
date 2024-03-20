Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E66C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaQja4o+Hbo8tuz9wqvTyi1zwuqKpdiBUjiTUHKjgG0=; b=kt0+r7a5Vo9SafNMsh4shuQgY7
	ixMl6vav4YjKioXOngMAlHfJ/XPWy5mFiOXHIhH+MIc9VlkFtj1OEHyKxmfe1fhLry9490rnQgsAu
	XwfXTwslLc7o1V+oKIKECQxDK8K30xIZYFg27hUGXsiHvfpKBuH/U4TyNUY5EBp5zD0bu/VFb3BDE
	MYmdt44D/IgwrcAQiuuS9/1Z2/A8NPA4DTvQbpFaLUQVPoDLZcs8uiuSWqAi3BuYFNOcFlfPY9/R9
	9Cl63zTHBfeEj/gVVsRRVV4/YpCMYnwjctEnRyYcjRL7AiHjsOoqwAsl2GGGSPwulxsxxfxgzUJYO
	Fl4Lh2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmr1g-0000000G6gf-0DU0;
	Wed, 20 Mar 2024 08:10:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmr1d-0000000G6ac-0Um8
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 08:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1710922217; x=1742458217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AfCnug0umUcdT2gosXp103HrYU4EPJM44slnpZb1jv0=;
  b=E+9iLyM1PPp4EOJOz/pRyrfEudlxSwbdLHxdH8iWyLXLJAvCeY5lEITb
   T+gYWzEMoPuh/DMAxDpXN5HUe5WKsSgxJovjS1lb5zcufCThkPc3bghHu
   +wETeuDRKT34SZxJ9TtrysjPmjOEcUhbexgF50FYNGxSX5TsCK34TgWvp
   Ln2Yl/LvUqTxhBmBeCp5w6yKIkaYR3rKCnbplVO+0JbSg6viLIgSyGWp7
   LTmHTqzYivAbPG3nDjR3Mws/rxizl3nSWfNdqXAc7j8hGeKieoFVs61pF
   dbvJWHuMNAWacyPLAuYk6W9SKvAo10eoCBxq11QEOejWxVR5jhf9Gn6lK
   A==;
X-CSE-ConnectionGUID: eZhPXw6WRumqhkMBxQG74g==
X-CSE-MsgGUID: a6qsqpTMSjOeZ0F7tAolvA==
X-IronPort-AV: E=Sophos;i="6.07,139,1708412400"; 
   d="asc'?scan'208";a="18421063"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Mar 2024 01:10:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 01:09:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 20 Mar 2024 01:09:27 -0700
Date: Wed, 20 Mar 2024 08:08:41 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 0/4] Add StarFive's StarLink-500 Cache Controller
Message-ID: <20240320-implement-finishing-136eae51d659@wendy>
References: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
 <20240317-viral-handcraft-12b2519ff1be@spud>
MIME-Version: 1.0
In-Reply-To: <20240317-viral-handcraft-12b2519ff1be@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_011017_229276_8160E6A1 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, geert+renesas@glider.be, jeeheng.sia@starfivetech.com, leyfoon.tan@starfivetech.com, heiko@sntech.de, prabhakar.mahadev-lad.rj@bp.renesas.com, guoren@kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Joshua Yeong <joshua.yeong@starfivetech.com>, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Type: multipart/mixed; boundary="===============5884481056712695419=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5884481056712695419==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iOmun+xjPn985xOw"
Content-Disposition: inline

--iOmun+xjPn985xOw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 17, 2024 at 03:01:05PM +0000, Conor Dooley wrote:
> On Thu, Mar 14, 2024 at 02:12:01PM +0800, Joshua Yeong wrote:
> > StarFive's StarLink-500 Cache Controller flush/invalidates cache using =
non-
> > conventional CMO method. This driver provides the cache handling on Sta=
rFive
> > RISC-V SoC.
>=20
> Unlike the other "non-conventional" CMO methods, the jh8100 does not
> pre-date the Zicbom extension. Why has that not been implemented?

Stefan pointed out on IRC yesterday that one of the main selling points
is the ease of operating on large ranges.

> How many peripherals on the jh8100 rely on non-coherent DMA?
>=20
> Cheers,
> Conor.



--iOmun+xjPn985xOw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfqZiQAKCRB4tDGHoIJi
0qMDAP9sOBXZWhcjt6+UQcqMAdgYDyQ/d+HtGVH8VPq7D6wuPwEAuJxliBsHfezS
RtGYM/iDUAlOd2eP7RPVi3PWvojxogk=
=Su/2
-----END PGP SIGNATURE-----

--iOmun+xjPn985xOw--


--===============5884481056712695419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5884481056712695419==--

