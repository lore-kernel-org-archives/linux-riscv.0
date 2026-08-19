Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E928C5DF85
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFpjpmYchJpt+OtFD9Th2FKtMnoI8m0Aa+szAES/xns=; b=o6xADg3dgBiPnprPdmrBDjfpIi
	WInCKRnMn+/Nx51IdhhBJzJ3WQDLR2xuPPrMwwsnk0yqei6TsvMT59MTtirBxAENn/M5RZaHvoaMp
	WD0G2eoT4dsSLQNg8cIry4DWzWvll5FPIsUDP+zA/I+rHvfATzlAH+yfnOz5hVA2Ig5ibKZwTxKC6
	mVHBuJbfqTvAxx7zfrG/x/QXbhdlBrBuyErIFfkpsjiTEcxTa8k0aSElWoQ8ftyXTxQIH5BkH1WTm
	xefjyZVWJPnr4cjAU710quCK3Pa8HzxZfYjC4Yub/8aL6vAzjNTeKt1T8x+zZczuXTiqUTyuN6/3T
	8WoxTCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjhA-0000000AF4o-1AHX;
	Wed, 19 Aug 2026 17:03:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjh8-0000000AF4T-3V65
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 17:03:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1C4460AAA;
	Wed, 19 Aug 2026 17:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB461F000E9;
	Wed, 19 Aug 2026 17:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787158997;
	bh=0gp3VyYOMdGHK42yR9w7EY3RDGcSJHOd19lsKKn2S+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gdOIotAoNtVOSdgwQhmtNFCSNg7aCpmPjSDk96J0wV6oEXAm37RRoebAJ6CZszI/e
	 eftl7m5a2l65rNyUC1eAqlesPnsQY0Sh9Rdx/RzI0w1z0N+bpUM8IQtPh83s1Z10rp
	 +lhmgBmlkmSTrGXH5DtsuMGzqq5xPjBxzTFg8PnH2R+4KmoDCIDGNf12qik705dHMv
	 tVb2J86MtdiovRbCruIgMCALR1Y0vkQKcqH60w7qLTMHTWWo+QmhLeflE3YW1r1uV8
	 H4/g3jIdaKD8LXtbGTvDuRpufeqnaGjS7KNA/i4jieboNp9ix7+6f/S0oyh2Lgtjw+
	 nFp/IoTSJgdyQ==
Date: Wed, 19 Aug 2026 18:03:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, inux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, yangyinglu@bosc.ac.cn,
	yangyinglu <yangyinglu@bosc.cn>
Subject: Re: [PATCH] dt-bindings: riscv: firmware: Add OpenSBI configuration
 binding
Message-ID: <20260819-extent-decrease-0483d66a87af@spud>
References: <20260819090411.18561-1-guoyaxing@bosc.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260819090411.18561-1-guoyaxing@bosc.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============3835743092630732858=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3835743092630732858==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AaeJ4SPdX0PPAsBI"
Content-Disposition: inline

--AaeJ4SPdX0PPAsBI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 05:04:11PM +0800, Yaxing Guo wrote:
> From: yangyinglu <yangyinglu@bosc.cn>
>=20
> Add a Devicetree binding for OpenSBI configuration data in the
> chosen node, including the cold-boot-harts property.
>=20
> OpenSBI supports describing certain Generic Platform configurations in
> the device tree passed by the previous boot stage. The OpenSBI source
> tree documents the `opensbi,config` node and provides the corresponding
> device tree parsing flow.
>=20
> The `/chosen/opensbi-config` node can be used to configure OpenSBI,
> including the set of harts permitted to perform a cold boot through the
> `cold-boot-harts` property. OpenSBI parses this node during the boot
> phase and removes it from the device tree after cold boot.
>=20
> Add the Devicetree binding for this OpenSBI configuration node to
> document the supported `compatible` and `cold-boot-harts` properties.
>=20
> Signed-off-by: yangyinglu <yangyinglu@bosc.cn>
> ---
>  .../bindings/firmware/opensbi,config.yaml     | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/opensbi,co=
nfig.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/opensbi,config.ya=
ml b/Documentation/devicetree/bindings/firmware/opensbi,config.yaml
> new file mode 100644
> index 000000000000..86b1e1e673a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/opensbi,config.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/opensbi,config.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OpenSBI Firmware Configuration
> +
> +maintainers:

You probably should've waited for a response to your question about who
should maintain it before sending, becuase I am not entirely sure this
software configuration node should be documented or if the maintainers
of opensbi would want it to be.

Cheers,
Conor.

> +
> +description: |
> +  OpenSBI configuration data passed in the chosen node.
> +
> +properties:
> +  compatible:
> +    const: opensbi,config
> +
> +  cold-boot-harts:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      List of hart CPU nodes selected as cold boot harts by OpenSBI.
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    / {
> +        chosen {
> +            opensbi-config {
> +                compatible =3D "opensbi,config";
> +                cold-boot-harts =3D <&cpu0>;
> +            };
> +        };
> +    };
> +...
> --=20
> 2.43.0
>=20

--AaeJ4SPdX0PPAsBI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoXh0AAKCRB4tDGHoIJi
0hAgAP9iZc/Vjyv2t7oMgTJef0tLRpRYzg9LpjDOV4Z2aFzYPQD4zArzLmonHrjO
81f/gVpfnmIDblnPGBbk/N+hLqSjDA==
=eeVi
-----END PGP SIGNATURE-----

--AaeJ4SPdX0PPAsBI--


--===============3835743092630732858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3835743092630732858==--

