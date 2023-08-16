Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07591C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/9BtFRxpWiFM1mBryXwNsRNYNaKh/cyGrR7NIyVUMI=; b=HsFy8yZvxnM27DF3O24RRO83zT
	1mS+AzJPRZo02dZ/NMd8x6K9GwKEde47tL/dGYjrtB1u4a+y1zZwXvP3oW48hiPjidpnTEYjfi+1y
	d5ChmgxufeCNo3tlvFNYPlAugfX+o8xVhBc8ERO9JBknTPpjJQvBnipKUj3UtXrJga3COZheCudqL
	DEjuUyvadE2EZlDlshVSROb2d7wvQIV7VBSDBB393BTkQ3eSjX5WvvDBGnplVns9oVk8Rpz2ZSELy
	I++SQt+WiMkXPe/6vMVWuwjPKTDCYJt4Fj3pLeep+6i13QlaqEEfQRImAmCXIcoOMPuVc+euF4g6U
	DzoXdy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFjE-0049Vm-0b;
	Wed, 16 Aug 2023 12:34:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFjB-0049Uq-0Z
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 12:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692189261; x=1723725261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lyhELIJqxcrJzxwaOiTZGnsjr8uYfDonHAMh6w9QOK0=;
  b=QxvZwLBgJVrWc2q54Xt4lfYWTbmDHZ3fi4oeR6ARczdxxR2dfpAaTtO9
   vVT323U7bOI5JvBx5P9zpyhb2QNxQRiUjRmYWXM1LPRq6WoKrDkLOpaYO
   6WpmPlpQQSOFIMM425+g3lgcWXcuaaHoPI40y1t4813YdR/adrhUq4GcP
   ++MluM6/rwaIBdf7lhODayzfRhfMxhQaHpWcOWkpDC+SMkeOaMRtC4TTO
   BekQiCnwjetNb2IBGr+8d2xOvHFfyDFGthIP3xZH0JPWGqTg7NTvoO0EQ
   XIkZbZyz1bp9CmuWobAF7wJNGW7mbySrwDf6vrnwmlLOWstb1shOLWxoH
   A==;
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="asc'?scan'208";a="225669164"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Aug 2023 05:34:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 16 Aug 2023 05:34:11 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 16 Aug 2023 05:34:09 -0700
Date: Wed, 16 Aug 2023 13:33:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Nick Hu <nick.hu@sifive.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<ajones@ventanamicro.com>, <mason.huo@starfivetech.com>,
	<jeeheng.sia@starfivetech.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH] riscv: suspend: Add syscore ops for suspend
Message-ID: <20230816-mural-portion-5b22d90e83fd@wendy>
References: <20230816034009.2614866-1-nick.hu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230816034009.2614866-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_053421_424189_90A7AA96 
X-CRM114-Status: GOOD (  11.55  )
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
Content-Type: multipart/mixed; boundary="===============0642641109672894530=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0642641109672894530==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mujUFVaVXdyT0dmu"
Content-Disposition: inline

--mujUFVaVXdyT0dmu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 11:40:09AM +0800, Nick Hu wrote:
> Save and restore the FPU and vector states when system suspend. If a
> task is the one who performs the suspend flow and it also do some
> floating or vector operations before the suspend, we should save and
> restore the FPU states and vector states for this task.
>=20
> Signed-off-by: Nick Hu <nick.hu@sifive.com>

> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

What was Andy's contribution to the patch?
Are you missing a co-developed-by tag?

Also, I'm a bit confused by the commit message due to a lack of
knowledge here - is this a fix or a new feature?
It reads as if things are not being saved/restored correctly, but
there's no "fix" related keywords in the commit message nor a Fixes:
tag.

Thanks,
Conor.

--mujUFVaVXdyT0dmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNzCGgAKCRB4tDGHoIJi
0vd6APsEzcdqOn94Igwx7pElasQuaMkT0YL/4Ki5Fv89meVt1wD+N8lY5dX3JdnO
Jzi2aDbkXftaAbJyn5chJR7M3qc6UwI=
=r77g
-----END PGP SIGNATURE-----

--mujUFVaVXdyT0dmu--


--===============0642641109672894530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0642641109672894530==--

