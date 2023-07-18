Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34711C001DF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O32dn4DgyrgLICvdTjv8HwE4BvzfrPB3gklJ9wU9FV8=; b=ET0ljxnwqtt7Hnp2xv4Qdk5cXU
	G5R5AziUghgkwDgnwE5zRUZfBHnHPxXR5usAKisWYG1vqA+bnka6eF9TIl1Lt1TtfEGtvrEgWRyu5
	nrNqWV1Hm46qSQUNzKDAw8crh2n4OE0Ob/bMb3ejSXdL88EnCF2uVVKrg7s7Fc31WTq6HSMWzi8rq
	oQuXZfypnHs6lbSCnmNBbwPa600NWeY7PEVpDWy+6SGhr0UwB1kheN9VrIxiTHC9gAf07q8CkPjF2
	S9sZMCGvEegf1jy5RjnpkR02mxhDi0GsNSsddCpjadocvKOWbF73+kctgmpub0Aq9O0F8V4433psS
	6PC8Gg3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0a8-005gw2-0M;
	Wed, 19 Jul 2023 06:22:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0a6-005gus-2i
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5C21m6i8HswGI2WbIlBa0eZIIPKfE/cBADbOBojKzmE=; b=Caao1x5OBl6cspb1dfY2cCMg68
	RjX5NK/JMpSMNLDDoNRJuZ/m99kEJbA2ctiUBft3du9EA50SE+t06LkiXhaBDTqLHqmgaBUS6ZaOO
	D8uWmLovIIAavMjylEakio9w84VgqlCTxx5wi1yAzR5OdoY4AdgDU6Ea5I2PlOcS4ehv5viAMsUc2
	BEFeG7Xy9ItWD9KGY8NDXDReg20TDd4y/lIcpVO0bvgkmAhfmE2C3oWPqg6beAKY3GGSyq9E+2SH1
	6OecSgQZILLx2c70nKPVkUG38SHIpv3X0vhXAc4mXk1SMq4g0BtysixOG1AUmkdYCRo09nWC+mc5d
	ovmjCzvw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLlZS-00BdJc-00
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 14:21:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6FF361594;
	Tue, 18 Jul 2023 14:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6F7C433C8;
	Tue, 18 Jul 2023 14:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689690020;
	bh=69f9Ow7G9SsiOy4AHNxB2+xh70U/bWAt+jbQXiCN9EE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZb1tcBRDBygRjVyPhSRssQyYE2oHpTYsXiTT1l9pKF1STlu13Iixoi8hJImAoXpO
	 94EpbPYgEi6As3I8DrJtm1WZA0zP8nwvrD7bI+n7IothYlhMAzp55oWNr7XfVBvzFu
	 gG93yC7kuqBdBylkdd+sLY1HzySR82keSAG5daB7knFz9yVH8K8tvDM28FyGjUrQNf
	 AjY82wvZz7CcR96qMnGeM3gn3iYw5eedZfGFyTIAiZSydfHh0A8l+++FgTacwGUbeo
	 TKRn7r3gyn/sn3ENLQKLOq92cw78vQTdmPC027pIcAx4x46BE2Lv0xalXTHo2YIidC
	 R2IcV6i2TNu0g==
Date: Tue, 18 Jul 2023 15:20:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] MAINTAINERS: Add Hal as a maintainer of SFCTEMP
 HWMON DRIVER
Message-ID: <20230718-progeny-edge-70b1a395f2aa@spud>
References: <20230718034937.92999-1-hal.feng@starfivetech.com>
 <20230718034937.92999-4-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230718034937.92999-4-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_152058_622251_7DC04C1D 
X-CRM114-Status: GOOD (  15.81  )
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
Content-Type: multipart/mixed; boundary="===============0421671794613700088=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0421671794613700088==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+SYy1csup/eV3m/s"
Content-Disposition: inline


--+SYy1csup/eV3m/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 11:49:37AM +0800, Hal Feng wrote:
> As he is the submitter of this driver, add his mail so he can
> maintain the driver and easily reply in the mailing list.
>=20
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aee340630eca..5056079ade77 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19256,6 +19256,7 @@ F:	drivers/net/ethernet/sfc/
> =20
>  SFCTEMP HWMON DRIVER
>  M:	Emil Renner Berthing <kernel@esmil.dk>
> +M:	Hal Feng <hal.feng@starfivetech.com>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml

Whatever about the other patches in this series, this one certainly
needs an Ack from Emil.

Thanks,
Conor.

--+SYy1csup/eV3m/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLafjQAKCRB4tDGHoIJi
0ieXAPoDb+w2V0FDl4JxOKH09CNgAq/8yBxnBA358gfjau/P9QD/Rw3p/VAyVXD5
S6E/DUnzFkGfMmqp4BxxVrghLiJKjgk=
=T5XJ
-----END PGP SIGNATURE-----

--+SYy1csup/eV3m/s--


--===============0421671794613700088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0421671794613700088==--

