Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF95C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tqkqo6cSyt1UCUmT1oozohH2n1bmv6r3h3F9YVgz+Vc=; b=aF3nHxHcfbrX7K+FhE9F3+hKIs
	avH0MBHLF0Eym1VhkdPeEoBjgABjHPm2Xhrn8LW4A4hUO7iSfDWgd0ovylNOwT8nlSWBl1y3k1BuY
	54h0r8sw8uiKhCijaLTHt+//jggucmSBNntFvfuRcWId/tQO3PfAb7IHSPhNPedofHHK2pd1qnrAt
	zz8IUl6hkG+SNgO4M6ClIE+5/XcB6WVmUISpUbFcx/hj+/Gr0x7j6Qi62WqmZQ5hLYXKyKUuVXWVz
	81b16opnsKa4VQdzD29J0WPDnQRcqzSwRWTeR/SDzbzraRYRCvHbSO83YRoI5TtK+UlvFo9v+641b
	OabTTs/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6j-0000000EfRa-13tN;
	Thu, 24 Apr 2025 16:07:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yP3-0000000ETqZ-21gM
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC48CA4CE3D;
	Thu, 24 Apr 2025 15:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5041C4CEE3;
	Thu, 24 Apr 2025 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745508136;
	bh=65dnaZeGGnRWk84fmSR5N0SHVqJzZHHb308Lo+CMzec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vA6WggJ/29pIOanuEdqC3Tx3NwpN+tlh+hCbV93ygPzarnMY6RZ6W/bG5XDWlbLit
	 0ccsCzpelrv5fcKG0LCi/zE/2pbnQjFN7OihYKasLLcWy9xsECFm+h75KbMoWgnmOg
	 FS8N+M223qtqmJHQ07UeP2RIbUDInyDqWddqVO7jgQx9x+r5Zl4TrB4PxcnKT5rr+r
	 qDEzkJ0i8K4jt09G/wC+NDq+s57Ym14Eo/o+eeMYunrrqEGsYaJDzkiWY11B5LRKCu
	 7GOn9aQOz/JrJCuBQ8JlNMTqZdiKexiXl4t4TQnQZIySidk0FF4BvdQRPJ8axON7+g
	 un5Fe0dXxxOTg==
Date: Thu, 24 Apr 2025 16:22:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v9 1/3] riscv: defconfig: spacemit: enable gpio support
 for K1 SoC
Message-ID: <20250424-untried-refueling-50c5902d63c9@spud>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
 <20250424-03-k1-gpio-v9-1-eaece8cc5a86@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20250424-03-k1-gpio-v9-1-eaece8cc5a86@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_082217_585209_3E5AD04D 
X-CRM114-Status: GOOD (  13.09  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alex Elder <elder@riscstar.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1121391612338190970=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1121391612338190970==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iLvKFyQQzMUSgZV7"
Content-Disposition: inline


--iLvKFyQQzMUSgZV7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 05:40:49PM +0800, Yixun Lan wrote:
> Enable GPIO support, in order to activate follow-up GPIO LED,
> and ethernet reset pin.
>=20
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Do you want me to grab this patch, or do you have a defconfig branch to
put it on?

> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 3c8e16d71e175e0e4c27136c31761127ce6e1602..b8899d59dd345c50d877829c0=
5d0330f2986895c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -169,6 +169,7 @@ CONFIG_PINCTRL_SOPHGO_SG2002=3Dy
>  CONFIG_PINCTRL_TH1520=3Dy
>  CONFIG_GPIO_DWAPB=3Dy
>  CONFIG_GPIO_SIFIVE=3Dy
> +CONFIG_GPIO_SPACEMIT_K1=3Dy
>  CONFIG_POWER_RESET_GPIO_RESTART=3Dy
>  CONFIG_SENSORS_SFCTEMP=3Dm
>  CONFIG_CPU_THERMAL=3Dy
>=20
> --=20
> 2.49.0
>=20

--iLvKFyQQzMUSgZV7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaApXIgAKCRB4tDGHoIJi
0hI1AP4wJfY4DSUsY0aboH5U9Y51POA1u9C+eijl9lhfdo39yAEApnknyL7FNdN+
gHFmfl8lby3E7vdc2xuWYXdZ5WTORw8=
=P7Hb
-----END PGP SIGNATURE-----

--iLvKFyQQzMUSgZV7--


--===============1121391612338190970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1121391612338190970==--

