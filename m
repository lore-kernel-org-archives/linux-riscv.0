Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5D5C7618E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 17:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdMw9wGb/qsCFhyfqBMrwUeearZkqM1Wg0bUg2LK2Tg=; b=JPIRgxGxg7l+50erdH/LoUFP8f
	sAJiaTocNJXUItof+XFS8V2E7Z6uTzD2TDvmMKuAPrqGPGTv/+PBVt9i4jBCFBLg50ZZJIOlW3zH7
	abLL5D4UoJfLHjVXWGzcArs9fE9r9PRxxxMeebUZIPR2UnNh+tVEqtmEx+N//IEjIkWWfi+XnHN3u
	/FWCHYIoywwpoWB5fhu8W7VzmXbUgGjvU8SSCyRKg383ezDfsMurIt309P+v3ru+kONZJwfqyVUUQ
	NLFZWnPyQFEVUbbCgzLplpGA4QbMQtaIxVOthkk3ez1tJ0dC8/J0kz06XnxVIXJFDDX0Aj0TSZIM7
	BsZ85pAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqznB-00GsxO-07;
	Mon, 24 Apr 2023 17:15:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqzn7-00Gswi-3B
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 17:15:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55DEA61E7D;
	Mon, 24 Apr 2023 17:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F97AC433D2;
	Mon, 24 Apr 2023 17:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682356552;
	bh=hRs/acnkIDX2tBWCp9DVeye/pTM8KlJRW6iseqcPYZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B3fVlOJYd1jRadwKwhGG99DNMpt6un9zqJ97AumxiIU1FL8bXSaWg8PcHKbmTOhlq
	 4oeSi4DaDS26tGqyB49nssli6RseTe7/ZiSLZvoUewN1L55VJO9ltcKFePBtr95nVe
	 RoskAuuKZuUQjV3AFml3QcFW3+uMfhxz+mewWAenAGs01KZweEqLkJpdEOgGqC7Yr4
	 g3vjq1IloujWIK6hIwiAu2g0srzHO7yOOZl6g4kj75DR8J0XE7lkQFd1zNxlpFQ9qS
	 STzlghmkCqzoK317Mh2vo+fvGZejCPFmJfVBUUefLis4CwOM4MBDgJiC79wn5K2/tI
	 ppnigF1Xz1SEQ==
Date: Mon, 24 Apr 2023 18:15:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Message-ID: <20230424-footsie-compost-d6624c8ef4e8@spud>
References: <20230414024157.53203-1-xingyu.wu@starfivetech.com>
 <20230414024157.53203-6-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230414024157.53203-6-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_101554_101331_E60D66FD 
X-CRM114-Status: GOOD (  22.98  )
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
Content-Type: multipart/mixed; boundary="===============8503060938556806588=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8503060938556806588==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6h8NHcwldPvt4iyb"
Content-Disposition: inline


--6h8NHcwldPvt4iyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 10:41:55AM +0800, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
>=20
> Add documentation to describe StarFive System Controller Registers.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfi=
ve,jh7110-syscon.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh71=
10-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh=
7110-syscon.yaml
> new file mode 100644
> index 000000000000..de086e74a229
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-sysc=
on.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 SoC system controller
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +description: |
> +  The StarFive JH7110 SoC system controller provides register informatio=
n such
> +  as offset, mask and shift to configure related modules such as MMC and=
 PCIe.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - starfive,jh7110-aon-syscon
> +              - starfive,jh7110-sys-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +      - items:
> +          - const: starfive,jh7110-stg-syscon
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
> +    type: object
> +
> +  power-controller:
> +    $ref: /schemas/power/starfive,jh7110-pmu.yaml#
> +    type: object

My plan was to grab this patch after the merge window, but there's been
some back and forth [1] about what exactly should be a power-controller
here. Given the merge window is open & I know Emil wants to look at the
various clock bits for the JH7110, I don't think there's a pressing need
for you to do anything here, but figured I'd at least mention how things
are going on this thread too.

Thanks,
Conor.

1 - https://lore.kernel.org/linux-riscv/20230419035646.43702-1-changhuang.l=
iang@starfivetech.com/T/#m708770e9596098214df769bcc2bdaf9c1a46ca98

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@10240000 {
> +        compatible =3D "starfive,jh7110-stg-syscon", "syscon";
> +        reg =3D <0x10240000 0x1000>;
> +    };
> +
> +    syscon@13030000 {
> +        compatible =3D "starfive,jh7110-sys-syscon", "syscon", "simple-m=
fd";
> +        reg =3D <0x13030000 0x1000>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 03051ae2e9e5..0fafeea8ebdb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19917,6 +19917,11 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
>  F:	drivers/clk/starfive/clk-starfive-jh7110-pll.*
> =20
> +STARFIVE JH7110 SYSCON
> +M:	William Qiu <william.qiu@starfivetech.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon=
=2Eyaml
> +
>  STARFIVE JH71X0 CLOCK DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  M:	Hal Feng <hal.feng@starfivetech.com>
> @@ -19954,6 +19959,7 @@ STARFIVE SOC DRIVERS
>  M:	Conor Dooley <conor@kernel.org>
>  S:	Maintained
>  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:	Documentation/devicetree/bindings/soc/starfive/
>  F:	drivers/soc/starfive/
> =20
>  STARFIVE TRNG DRIVER
> --=20
> 2.25.1
>=20

--6h8NHcwldPvt4iyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEa5QwAKCRB4tDGHoIJi
0l+0AP0e3JscjX9uM8ImqV7QVtI4v8fidKqzUoF260oblriMtwEA54APb/okMY+/
v17rOEyY6cI2/FIYxQZLySSpbK99Og8=
=PGj2
-----END PGP SIGNATURE-----

--6h8NHcwldPvt4iyb--


--===============8503060938556806588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8503060938556806588==--

