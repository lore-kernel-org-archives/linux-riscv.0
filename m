Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF47C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZpOds+JHCpCxvqfvSshUT/FhL6//IXduxuyM0bm8MA=; b=TvZzjaRXcLxZ0yPaIiznQLA0ge
	g8ScdsXMHn8WWj2wNYM+kqVv9BsUXt1NiZzVxLyvTXBqqzpw0xgrongJME1T1t4v/YJims2rllXEa
	CNrtsJqM9HMI2taBfOO1iBEPzOoNeHkP9pLUvLFXHln4FM9QUVKzyiRRyyXE5qqyW7Etj634k12GL
	Wnhk2hII2Hx0UL64M/bmI0uZh79kWzPvo8ca3/ngN+n6dFwLE6mFB4PYSTT3YU5q0nSgM71gqI0KU
	oPiRUOMGFlYwHENPOfgOQaJBgJZGrkL1yy1t5k7/sRSle6SXvVIFsZ0B8DL4yaT5sIXDc312TEwKv
	2zutuNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2vgz-005FbB-Eo; Wed, 07 Dec 2022 14:46:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2vgw-005FXX-1A
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 14:46:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5C14EB81B03;
	Wed,  7 Dec 2022 14:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6633C433D6;
	Wed,  7 Dec 2022 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670424391;
	bh=PsHVnbFBEihPB3NBp0BJWow6YIbcbhY3sBbqiwuA9vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UmnmuFc6Pc5jVPVWs++s8HNLuJr3H+pXoLfMKq1+RnAXtq+pQnOq0itFQnt5SxDuQ
	 /KnltwAjDN8CGYC9ul7XN9vUL1syO9N5TQzW6TwemshAv5CjlMJ9UIqkqKDWrQj7lE
	 bHjHqqIUgzSKPTR3u/U35anGRXj8CImhRp556r1pMoNerMEXgPycV1JCvkfZaqau5m
	 1XXQZzZrlxwsRMHgV5dx1dHANcS9OU1AtGBD4TE5T332op40O1SKc+c+M+7K07rZ63
	 /zh+5zrGg3ciYLNCXC9tp9HieLezwx/KQsrDn3/JmBj0DwIrroTk2vXZFlwWQg4Ddj
	 gjpEhPEv62sMw==
Date: Wed, 7 Dec 2022 14:46:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>,
	William Qiu <william.qiu@starfivetech.com>
Cc: William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Add bindings for StarFive
Message-ID: <Y5CnQlYTZJrJNjCf@spud>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-2-william.qiu@starfivetech.com>
 <167042222472.2111911.2050446708831690640.robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <167042222472.2111911.2050446708831690640.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_064634_399776_1D012182 
X-CRM114-Status: GOOD (  23.88  )
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
Content-Type: multipart/mixed; boundary="===============5451241298996012415=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5451241298996012415==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="15iFjk02Kxw946r4"
Content-Disposition: inline


--15iFjk02Kxw946r4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 08:19:49AM -0600, Rob Herring wrote:
>=20
> On Wed, 07 Dec 2022 21:17:29 +0800, William Qiu wrote:
> > Add documentation to describe StarFive
> > designware mobile storage host controller driver.
> >=20
> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > ---
> >  .../bindings/mmc/starfive,jh7110-sdio.yaml    | 71 +++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh71=
10-sdio.yaml
> >=20
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.example.dts:21=
:18: fatal error: dt-bindings/clock/starfive-jh7110.h: No such file or dire=
ctory
>    21 |         #include <dt-bindings/clock/starfive-jh7110.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Hello William,
As with the other bindings that StarFive has sent out recently,
including this header in the example creates a dependency on the
clock/reset stuff being merged prior to the drivers for unrelated
subsytems.
To avoid that, you can drop the headers & definitions from these
*examples* & use the numbers themselves instead.

That way, the only thing that depends on the clock binding headers is
the DeviceTree patch & the driver can be merged once it is ready.

Thanks,
Conor.

> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings=
/mmc/starfive,jh7110-sdio.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1492: dt_binding_check] Error 2
>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202212=
07131731.1291517-2-william.qiu@starfivetech.com
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>=20

--15iFjk02Kxw946r4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5CnJwAKCRB4tDGHoIJi
0jqRAQCsSx3Ke20VhxNk/Ydi4ewyUPQPytJ6yzxj4xk9pgAeMgD+LIlTVnmUzECN
HBRjjc8AbZ9qq7SwsftQ/3nu/ACeQAI=
=JKRg
-----END PGP SIGNATURE-----

--15iFjk02Kxw946r4--


--===============5451241298996012415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5451241298996012415==--

