Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47958C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cydNCHPdcMvBF7h4VGgMyaFyk2EfI8ESdUdzVZTCr4=; b=wCBB3+KL77u14IHTDy5yajgaj6
	5xhGe4aEr/t9CQNyV0moVB1ZNOVnTwxy9V96W6SX7wS6U4PPf7L9o1AIcmESszQWTPVYQeR8WA9q9
	yV48KsoYeKvKlHj2zDq1KcJ/yREiB7iEyzXAbRE4Y7HPRO+KSjgsVj/LvYp+3ciVtdwWdL+lHsFCU
	nDpwOP1sIplz+mBxvOf1IN3uZpG4+g9mtLnCkCk15+hZopxC4C0Sxtk7KEz64BbZScbdccnbUzt1i
	/dz8KNVVCEEVABi21g7NyIc7i4MlHkinPY9DE5f6pIXIJAjHT/8PuFAgahLbFDw1NFWCN39KqMwGe
	rUSwP/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s78xk-00000000ley-3cG9;
	Wed, 15 May 2024 07:22:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s78xi-00000000ldc-09GM
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 07:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715757726; x=1747293726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8rUH+otL33JPl6/eelDW+giyktscV7EVUM1KV0wegvg=;
  b=m+sqgWf84azC/cueLHjl4SnZ7d28OyIDF8n81Q2BxOCkTdNweb5rhH7F
   ZBMQbg+ykZ/ZUAK1RlZGJqh4xWykzXhAuzPfaqldnDqcOIfhONfHXqjXm
   A/kJ25C5gQOswuiPI9gtqbYBJlTGb3N9pTO2qE8s7vh1N4vHE/VguvYDN
   5R7GunH9EYUjjnfk7oK+Ii8j1cCo+IZgjk9ni2SCuazjDhLzGDZaVDl05
   VB1cRN6Me59lUIgzj1ijF7JRE7tE0fbObinQB6wvy/PXR40LyIg6dFHst
   xVR0qerBp+CJSUOAjMr3PsjKXa/lD30GIyVNJi4tSv6IuSdTDIj2oS+JT
   A==;
X-CSE-ConnectionGUID: xh7729e8TEGmLa/d6tPEtQ==
X-CSE-MsgGUID: 4h9UeB2TTpyZiPvvgQObqg==
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="asc'?scan'208";a="255637101"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2024 00:22:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 00:21:30 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 15 May 2024 00:21:28 -0700
Date: Wed, 15 May 2024 08:21:14 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<conor@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <leyfoon.tan@starfivetech.com>,
	<jeeheng.sia@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 0/2 RESEND] Add StarFive's StarLink Cache Controller
Message-ID: <20240515-denture-matriarch-c775324379e5@wendy>
References: <20240515050253.38061-1-joshua.yeong@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240515050253.38061-1-joshua.yeong@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_002206_210355_47EE0030 
X-CRM114-Status: GOOD (  10.22  )
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
Content-Type: multipart/mixed; boundary="===============6929358001961664878=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6929358001961664878==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fy8jGRKT4POCemEl"
Content-Disposition: inline

--Fy8jGRKT4POCemEl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 01:02:51PM +0800, Joshua Yeong wrote:
> StarFive's StarLink Cache Controller flush/invalidates cache using non-
> conventional RISC-V Zicbom extension instructions. This driver provides t=
he
> cache handling on StarFive RISC-V SoC.
>=20
> Changes in v4:
> - Move cache controller initialization to arch_initcall()
> - Link to v3: https://lore.kernel.org/all/20240424075856.145850-1-joshua.=
yeong@starfivetech.com/

Why are you resending this? A resend with no context doesn't help me
understand what you want done.
There's been no action taken yet with the v4 that you had sent because
there was not enough time between its arrival and when I had to send a
PR with 6.10 material. Right now it is the merge window, so there's
nothing that can be done here til that ends.

Cheers,
Conor.

--Fy8jGRKT4POCemEl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkRiagAKCRB4tDGHoIJi
0omXAP9pIXYi4n5B7Ijb7oNal5DySb2TUY6bM7EGDeulPWO70gEA3Yt4/qVY17Q/
pqEiBG0Ji10JgU4wA+T6k4C4ckqfEwc=
=ZhD4
-----END PGP SIGNATURE-----

--Fy8jGRKT4POCemEl--


--===============6929358001961664878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6929358001961664878==--

