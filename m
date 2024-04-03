Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C3ECD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 15:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yw1dsYgkLcKQ1do8QdQIXy/LxEETYmGI7+WzFVFGwJI=; b=G9OPENM+pciJsHVvgAtofK/85r
	lE62ggM4+wwq4LX5LRJUZhEjdjYaijG3mNXtLIB5gvsFtvgtke53kxYNzlsKpO4R/2VAyqF2Uvt9Q
	TwvvihsbkQzjGJsFJ7QhFH1Qa+XsLLWHBnIUTwEA4lBeTTeqBAJwUVo7A/AkiIJNS0/j/hnQO3sL3
	T0l1RHQOgqPfNcRZHJVbRnVAD6JGrqcM/3RNICJMDnsx43QTtY27DtfY3RJR6oLKjEFrVdON45Qc9
	9SzJ2gONGT8aTAq+c3m1ntyvdVmo0MtqDIygAokZt5ESjzkeW02i2kPfqqE6fC7rNnLuTZKAbruX9
	QD0GCprQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs2rr-0000000Gomo-040r;
	Wed, 03 Apr 2024 15:49:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs2rg-0000000Goi1-16jE;
	Wed, 03 Apr 2024 15:49:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B8A96148B;
	Wed,  3 Apr 2024 15:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECF8C433C7;
	Wed,  3 Apr 2024 15:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712159367;
	bh=UzhIYoxj/GeUq1Zwp8VWt8eQlrVFRAAjBbLXufD7S1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iokMOfxMA3K/TB6FKWFIK0O7s2zq9aTtls09nLxeUk6PRr6Z60BQud79hycqKEjQS
	 F2HF0BeyukIj5qydY11CNYd3p1AQY5H0UJf1+SPKTJYMa91oijQJlPi2iC9x7YoZSv
	 enYPM4R+oka/GAq9UxpBKwGke/aXce6Xr4CaZbrTt+YooAe/ataCz/2t2Sq7VaY4/W
	 wSf4CL8M23uZrbYBJHpaKS78mRBqbwWWHDrdXGSS1kIteJSz5cvTJm+kgSTcn2B6DW
	 G5Kl7+x/QvP2PTALxe6WIXRScUUhaHfwCHbiGSRKSojnp5dBZARsKUiKKCNphr8Jni
	 C5BjRi7WSaSMg==
Date: Wed, 3 Apr 2024 16:49:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Tan Chun Hau <chunhau.tan@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Jee Heng Sia <jeeheng.sia@starfivetech.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 1/1] dt-bindings: net: starfive,jh7110-dwmac: Add
 StarFive JH8100 support
Message-ID: <20240403-curfew-baked-a0feef40cd92@spud>
References: <20240403100549.78719-1-chunhau.tan@starfivetech.com>
 <20240403100549.78719-2-chunhau.tan@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240403100549.78719-2-chunhau.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_084928_489349_764E94D6 
X-CRM114-Status: GOOD (  11.03  )
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
Content-Type: multipart/mixed; boundary="===============5944292658652707296=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5944292658652707296==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5QPyn77z4oCLNx4w"
Content-Disposition: inline


--5QPyn77z4oCLNx4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2024 at 03:05:49AM -0700, Tan Chun Hau wrote:
> Add StarFive JH8100 dwmac support.
> The JH8100 dwmac shares the same driver code as the JH7110 dwmac
> and has only one reset signal.
>=20
> Please refer to below:
>=20
>   JH8100: reset-names =3D "stmmaceth";
>   JH7110: reset-names =3D "stmmaceth", "ahb";
>   JH7100: reset-names =3D "ahb";
>=20
> Example usage of JH8100 in the device tree:
>=20
> gmac0: ethernet@16030000 {
>         compatible =3D "starfive,jh8100-dwmac",
>                      "starfive,jh7110-dwmac",
>                      "snps,dwmac-5.20";
>         ...
> };
>=20
> Signed-off-by: Tan Chun Hau <chunhau.tan@starfivetech.com>

How come you didn't pick up Rob's r-b?
https://lore.kernel.org/all/20240328204202.GA308290-robh@kernel.org/

Thanks,
Conor.

--5QPyn77z4oCLNx4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZg16fwAKCRB4tDGHoIJi
0rVTAPwPbHnemqIv++C11B6NjvmKObocsG2d4g/9l+VTGUcEcwD/dnqiJI0Edddc
A2TIMXnBN8NBZKR6OjdPOBQe3BmioQI=
=ysgy
-----END PGP SIGNATURE-----

--5QPyn77z4oCLNx4w--


--===============5944292658652707296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5944292658652707296==--

