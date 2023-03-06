Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA536C64EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 23:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7Y8NHfSGfsqf9LRr2esWqWy/ffQb8LSfdbgWxKXIUc=; b=Olg3RUuhEnGBcKW25K4yufCCWx
	6OLpQaKdnXi3RJjr9TgfhK8J5CzngvXC7TO2sWqaN+g87itutIuFvxvfOzA1lLgLQw6ei3kQyx6Ns
	ZWc0Sj5egyx6dC0odVvGT8lPosc5eNgYgbZZpcUUwRgw7GItsCKlCCiDyGq6ycfQHR4bCrdeOExDi
	6xRRi0azC5oYKmMVACu4ueJ464iSLqnYw1lc9Cb/gPIvjqjpSErN0TKOuH2I7KrBEnakpqbxBJZqi
	GE83m89x93sd08fSJGuNHDjETpn2e1xr+sQctwU9d3bY6/pbs7ZaMW8zmlAwz5q7GUHZAzzj6oLBn
	ybuw/PKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZKKB-00FTwV-Rv; Mon, 06 Mar 2023 23:32:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZKJv-00FTu7-Ex; Mon, 06 Mar 2023 23:32:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A54F6117F;
	Mon,  6 Mar 2023 23:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21C3C433EF;
	Mon,  6 Mar 2023 23:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678145562;
	bh=ZGUTtquGzXTLF7VGJydoXmWIUDYMJ/fi4dkrB65U3c0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/f0fTlj6dXMj8VsjZ3Inkr6iRTv+kJUf6iG24bvoD3PBZ5m4w3tfafylbVEPd/Wt
	 FQWpgyinzhzUIyyY6ZJjEZiOINzjC9L0Tfv5xGjb55Iynfju+p8UwfUtoNYlPKRzxH
	 obJ3+1qor+bbvps6HyUwOR2DNk98Sk8BinXZPGRUpkgFxm2xPQtLiJ0KLDoNmNE2VJ
	 2dNAPGMucj9ba1PcF5hKktSp9smySVQmtsSvEfQfzT6tpK/FX4jp3W0UTki7X1Rc6t
	 XIXoByLPblr3FjCFLzLrMPEspEOqGZOcZsZ1Ih3Ob7B94DIbRV8H+Kft5WKqfQXL1q
	 U6sg+ycRV51qA==
Date: Mon, 6 Mar 2023 23:32:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 03/12] soc: sifive: ccache: Add StarFive JH7100 support
Message-ID: <b969cf86-d5df-462a-982b-c5b67f97c3d6@spud>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-4-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230211031821.976408-4-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_153249_691636_C0755E7C 
X-CRM114-Status: GOOD (  22.42  )
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
Content-Type: multipart/mixed; boundary="===============7290395377669227530=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7290395377669227530==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sWezJbPTi7EG0f2m"
Content-Disposition: inline


--sWezJbPTi7EG0f2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2023 at 05:18:12AM +0200, Cristian Ciocaltea wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> This adds support for the StarFive JH7100 SoC which also feature this
> SiFive cache controller.
>=20
> Unfortunately the interrupt for uncorrected data is broken on the JH7100
> and fires continuously, so add a quirk to not register a handler for it.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> [drop JH7110, rework Kconfig]
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

This driver doesn't really do very much of anything as things stand, so
I don't see really see all that much value in picking it up right now,
since the non-coherent bits aren't usable yet.

> ---
>  drivers/soc/sifive/Kconfig         |  1 +
>  drivers/soc/sifive/sifive_ccache.c | 11 ++++++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> index e86870be34c9..867cf16273a4 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/soc/sifive/Kconfig
> @@ -4,6 +4,7 @@ if SOC_SIFIVE || SOC_STARFIVE
> =20
>  config SIFIVE_CCACHE
>  	bool "Sifive Composable Cache controller"
> +	default SOC_STARFIVE

I don't think this should have a default set w/ the support that this
patch brings in. Perhaps later we should be doing defaulting, but not at
this point in the series.
Other than that, this is fine by me:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--sWezJbPTi7EG0f2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAZ4EgAKCRB4tDGHoIJi
0qcEAP4r1H1KunxSPvzOIQ+psBjZf0GhVcU5HUKo2au2azIMUQD9H6CCIImWvFF5
+IBbmg9ik+sYw9HE7cIE67qmG8f03wQ=
=jWnP
-----END PGP SIGNATURE-----

--sWezJbPTi7EG0f2m--


--===============7290395377669227530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7290395377669227530==--

