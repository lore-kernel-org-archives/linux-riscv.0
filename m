Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87397C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 21:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxvLtHjVD+aqLW4KZ+Shhs2E0mrYAYEOjCL0KIHRmyc=; b=yZnjN0MdlfT8ESzXcFQu3sDzbY
	X86GhiSBQZzSGD2GjsQFpDONjheMvMNPKnslOpcM2uwlJeijjv1MbdcCNUCiaU2Lqnu2WsYy+UnLJ
	uCp7nHj52AgRACzrmqWQUXibaPwKFLlHUKwjCS7U0x38LWxFPkQhWLNXWH0LSQ5cKmj/3lu2gVq/1
	EITNbnK3yRLjLXqW5sPgUfa5AX7Ii+Izj0iRiqXSil6lX2jvwktHaxfwej6BWpkf74a0Hha+ElVjF
	Eql1W63k0evC8jq+deD7ctReK1WUkUy4ecyKxw6419AuEPYe2u9/Ws5XDmsk6B7JOsQgel4Q1+E4p
	VBPre4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7jx7-0049nG-2B; Tue, 20 Dec 2022 21:15:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7jx4-0049id-N7
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 21:15:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0D6FCB818B8;
	Tue, 20 Dec 2022 21:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF7AC433F0;
	Tue, 20 Dec 2022 21:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671570900;
	bh=SaFUQnlPhWnTefMSF5TAmmsvzt+RR7tzLYrYhfEmis0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dtq3Vii3FFUmY7uPnKp1pGMPMgrNezTyLuqse4FRH+UF9Ync/PyefOXNY71Hhc6IY
	 +jLyZOuZsgMeL1q2fRu4KgHmMFUWQ6SVXtll2Dia6MNw47eAb33WTQNDEsvibdATi/
	 4JXYj98wyj6t02rm2543hoNkkz52RCT64JDpOduLvWBfVtX7gO+UaUJKIjaIigufRJ
	 e+G57//D5fOoFHj9CsNR7SaGXmzONTnzXUyQC9li6hGf3LkWbTGWsaTs4Jy80mKuqK
	 czT/gO5oB/uyCkwCUvVn+Q+0kZmMBxEWE/7osckawfcClGGlR1QiOUVfjriS4/wnLo
	 G12eip1n2jN4Q==
Date: Tue, 20 Dec 2022 21:14:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] soc: sifive: ccache: Add StarFive JH7110 support
Message-ID: <Y6IlztUSTEiBw7Pd@spud>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-6-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221220011247.35560-6-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_131507_067189_7CC8CE7A 
X-CRM114-Status: GOOD (  17.20  )
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
Content-Type: multipart/mixed; boundary="===============1783254872406460662=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1783254872406460662==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VgU9tBCqHV9nCZZx"
Content-Disposition: inline


--VgU9tBCqHV9nCZZx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 09:12:45AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> This adds support for the StarFive JH7110 SoC which also
> features this SiFive cache controller.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

I'll queue this and the ccache binding for v6.3 once -rc1 is tagged,
once again with the caveat that screaming from Emil with dissuade me.
Ordinarily, I'd wait for his R-b, but he is the author..

Thanks,
Conor.

> ---
>  drivers/soc/Makefile       | 2 +-
>  drivers/soc/sifive/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 69ba6508cf2c..534669840858 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -26,7 +26,7 @@ obj-y				+=3D qcom/
>  obj-y				+=3D renesas/
>  obj-y				+=3D rockchip/
>  obj-$(CONFIG_SOC_SAMSUNG)	+=3D samsung/
> -obj-$(CONFIG_SOC_SIFIVE)	+=3D sifive/
> +obj-y				+=3D sifive/
>  obj-y				+=3D sunxi/
>  obj-$(CONFIG_ARCH_TEGRA)	+=3D tegra/
>  obj-y				+=3D ti/
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> index ed4c571f8771..e86870be34c9 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/soc/sifive/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
> -if SOC_SIFIVE
> +if SOC_SIFIVE || SOC_STARFIVE
> =20
>  config SIFIVE_CCACHE
>  	bool "Sifive Composable Cache controller"
> --=20
> 2.38.1
>=20
>=20

--VgU9tBCqHV9nCZZx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6IlzgAKCRB4tDGHoIJi
0kY+AP9enkrvYXKKa5SNA4sSbGwZDhvcoCcsSCloARVs+Qc36QD/cb/vWsgaFwSK
q42fkVYJ4ro/LJiPrNEB+YgA+WF5aQk=
=ZTcn
-----END PGP SIGNATURE-----

--VgU9tBCqHV9nCZZx--


--===============1783254872406460662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1783254872406460662==--

