Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7236EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdT5yoWTLQ20DnyNpEoWC9BYdLz2Uuk9GMtsaytswqo=; b=Pp4OxnfZOryg2r2GmziUEuJZuW
	NRUPELP1ukn0FyDVgY/iZez0Hn7gp2oJNb90UccYaml0ydJvukseyMARoyk/i96KgU8DuARBKOus7
	mhLLjPgFf8DpFNPwenuUS+/DA+yXIGHK1s6edF7B5gY14UTGnTLQd5gwqoZuBbAc9MFVL6RE/qANa
	I21sbkRbFeRB2UXsLYKoh+ZfUPZkhI2WEp1l4gOIo6AIJZG7a3KqVSjQihZ/EWhDhOhsFS7jw6JCD
	U65TMwLcfFeMdtlVH4ZA3GJbV0WkBJFZt2Js/bd8wjX5x+1BjUiDs2M7e9bMMnHLpGaKZ4Nzy9ZZY
	Z9gjbfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXB8-00BlBl-00;
	Thu, 20 Jul 2023 17:11:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXB4-00BlAY-0g
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 17:10:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 802B460BBD;
	Thu, 20 Jul 2023 17:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1115C433C7;
	Thu, 20 Jul 2023 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689873056;
	bh=+axwopYxss32R/v91aEDYuikl4wHxlkypTqI8kD6aso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCqSFh7cyVmHDASsdStKBK/jH7esg7iLSu6bLcPd91ldXFqCSEsYMXMx0aC9kwDWp
	 sITE99JryYqoKSZYx++BRhsOwJ5wezc4UPhubd1g+sil3QUmCfCPlJH/yuA38WHeQ2
	 lczEfsclUrTRRGS7+IKJyza/pVPRM3yC7SKnSR5soJ1T5Sq0PpmVrq7mhrHIBErTAI
	 asmw06YlY9p1uAAH17JIKZnsJ+iNgqilbvYbWAgfpt42Bfe3fHCl4JBZ1w2BI+CaUW
	 WfhGAhm6/iUJPCrOM+O1wZQTv9cNTtvG+WBEGhK5HgYpFgnumgNq3rFWp/NuR+quqD
	 vNL2WCOxpDkUQ==
Date: Thu, 20 Jul 2023 18:10:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Eric Lin <eric.lin@sifive.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	will@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
	peterz@infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	zong.li@sifive.com, greentime.hu@sifive.com,
	vincent.chen@sifive.com, Nick Hu <nick.hu@sifive.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Message-ID: <20230720-slept-guru-216e2803061e@spud>
References: <20230720135125.21240-1-eric.lin@sifive.com>
 <20230720135125.21240-2-eric.lin@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230720135125.21240-2-eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_101058_336975_509FC6C8 
X-CRM114-Status: GOOD (  18.76  )
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
Content-Type: multipart/mixed; boundary="===============4313293156870026390=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4313293156870026390==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DXW+N7LgbdadIzwt"
Content-Disposition: inline


--DXW+N7LgbdadIzwt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Eric,

On Thu, Jul 20, 2023 at 09:51:19PM +0800, Eric Lin wrote:
> This add YAML DT binding documentation for SiFive Private L2
> cache controller
>=20
> Signed-off-by: Eric Lin <eric.lin@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Nick Hu <nick.hu@sifive.com>
> ---
>  .../bindings/cache/sifive,pl2cache.yaml       | 62 +++++++++++++++++++

btw, your $subject should be "dt-bindings: cache: ...." rather than
"riscv: sifive".

>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cache/sifive,pl2cac=
he.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/cache/sifive,pl2cache.yaml=
 b/Documentation/devicetree/bindings/cache/sifive,pl2cache.yaml
> new file mode 100644
> index 000000000000..ee8356c5eeee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cache/sifive,pl2cache.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (C) 2023 SiFive, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cache/sifive,pl2cache.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Private L2 Cache Controller
> +
> +maintainers:
> +  - Greentime Hu  <greentime.hu@sifive.com>
> +  - Eric Lin  <eric.lin@sifive.com>

There's extra spaces in these lines for some reason.

> +
> +description:
> +  The SiFive Private L2 Cache Controller is per core and
> +  communicates with both the upstream L1 caches and
> +  downstream L3 cache or memory, enabling a high-performance
> +  cache subsystem.
> +
> +allOf:
> +  - $ref: /schemas/cache-controller.yaml#
> +

I'm pretty sure that I pointed out last time around that you need to add
something like in the ccache driver:

select:
  properties:
    compatible:
      contains:
        enum:
          - sifive,ccache0
          - sifive,fu540-c000-ccache
          - sifive,fu740-c000-ccache

otherwise this binding will be used for anything containing "cache" in
the dt-binding.
For this binding, I think that the following is sufficient:

select:
  properties:
    compatible:
      contains:
          const: sifive,pl2cache1

> +properties:
> +  compatible:
> +    items:
> +      - const: sifive,pl2cache1
> +      - const: cache

You omitted the pl2cache0 from here, that needs to come back! You'll end
up with 2 items entries.
Either way, I can't take this binding without a soc-specific compatible,
per sifive-blocks-ip-versioning.txt..

Thanks,
Conor.

--DXW+N7LgbdadIzwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLlqmwAKCRB4tDGHoIJi
0tcuAP92m51JnHz7NPdeF4+NU14NEqDIZzYAshCe+QYlXCRcRQD+NRNK1FrLyftL
6Ff62D6y4p7pPTuYG+5nJ0phZ28ntwA=
=QjrL
-----END PGP SIGNATURE-----

--DXW+N7LgbdadIzwt--


--===============4313293156870026390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4313293156870026390==--

