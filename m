Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F179C7619A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 20:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKgoKmqMO9B7/8BhEi3eXAG+L1HU5D/oSVldAmXnFq4=; b=FbEfFkjMyHwRFQX193CCeBgj+Y
	dRzoea3qU/M9WjfhIDBVzxLKXNXMJyFD6MJ3AQh5qk1KjLrYTbfjGBgYbuNpGc2KFxcuzmPrYZQSe
	ifBmpNvTD21EuaEF6al8Z9EmwdZ1STEW7Wnd9HqhxV9VHspSeCQLzzT1ijWEMlREs88TKBPz8ucTA
	5MFEE3+aWp/LSmLEfVzGTWpdoTa15YW8p/Uf0gJP96OZiqISn7h1uiBSklRWg3PUKp0chztaboth+
	TlCNWMj1dbZIVk01ppd9eIIGm/5gIlkxD4Vex1GsbBt4h9ndFrpKs1RnfmrdAjJFnFCb8I6Df9UHz
	smaCdsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmKNO-0014V9-0B;
	Tue, 11 Apr 2023 20:14:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmKNK-0014Ug-38
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 20:14:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 874986277E;
	Tue, 11 Apr 2023 20:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE61C433D2;
	Tue, 11 Apr 2023 20:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681244038;
	bh=Go38pLLq5GEQ4fnek+7AtmPJ9Vnzlf80dUigltv0auc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOeV7199OPPV636mEmFgB8EpXl9tgfXARIWX7dTH4zKfpK/FObQ4b764/okxsDPp9
	 dIPC6tumBvsqsXqMVvlWuer/PA2b+7cIsZpGVSIAN8XPgkxqA9OD1vvOVPROzG7eAX
	 S9hxeQL9qMg4odmAfTEQ5vnaj9YrG8sY84IIHtBgG/LH4uFh8zSHZNFnixijNVjdbv
	 tJGw415Ioa6DA8sIOMvMyZ8p1uJ25sAJyQh90jF3YA+yYDMGhEZG5RdTmJ6xDZUmLF
	 BKHX3dZzUqoT7KDY8pmoJGiYrQ0cam1lP6F34rNuTD5zIl/lnq5TSDGu3peG6urMFu
	 3gzIpqASn6QWQ==
Date: Tue, 11 Apr 2023 21:13:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/7] soc: starfive: Replace SOC_STARFIVE with
 ARCH_SATRFIVE
Message-ID: <20230411-battered-detract-8fb2ae64448b@spud>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-3-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230411064743.273388-3-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_131359_050728_949B4FD5 
X-CRM114-Status: GOOD (  16.73  )
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
Content-Type: multipart/mixed; boundary="===============1835603575136002871=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1835603575136002871==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6b218k5iSPj9BmNv"
Content-Disposition: inline


--6b218k5iSPj9BmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 11:47:38PM -0700, Changhuang Liang wrote:
> Using ARCH_FOO symbol is preferred than SOC_FOO.
>=20

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/soc/starfive/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
> index bdb96dc4c989..1e9b0c414fec 100644
> --- a/drivers/soc/starfive/Kconfig
> +++ b/drivers/soc/starfive/Kconfig
> @@ -3,8 +3,8 @@
>  config JH71XX_PMU
>  	bool "Support PMU for StarFive JH71XX Soc"
>  	depends on PM
> -	depends on SOC_STARFIVE || COMPILE_TEST
> -	default SOC_STARFIVE
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	default ARCH_STARFIVE
>  	select PM_GENERIC_DOMAINS
>  	help
>  	  Say 'y' here to enable support power domain support.
> --=20
> 2.25.1
>=20

--6b218k5iSPj9BmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDW/gQAKCRB4tDGHoIJi
0te2AP4kM5Y/0lvQ10q82NEuhilKvUKcJD03pAWm+EeYpLCfpgEAnNbKqhYX2alb
2+ea64ItRx5J8x5vhzbVf3VjndzWegU=
=OCBn
-----END PGP SIGNATURE-----

--6b218k5iSPj9BmNv--


--===============1835603575136002871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1835603575136002871==--

