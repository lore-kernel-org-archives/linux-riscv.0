Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E139C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 17:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQLuO4sLE7MAmiyMVJr8IHtig7l8rACSOa7SZFiwE48=; b=guzu6sPLuMS3hwdaRkPEtFIKHG
	Y45rdEhIFqhwiYmSDh3LN2ZXF59q/2H8ipg7th7S71QwW+n2uEcWqsvxOHsNHKvMbfSTRYTj7IfrU
	zLpJsga4/+Tt/sDIy7TeDiIO4Mz9oc5uj7Pn6/kHffHdPsEa1y7EZN645iABj8ve/d9goAR3GWQcz
	D0mx+dvBekeMtIMvyUujEjvSGhrq7VIz9t67Jfu+lC3wcGb4KTbJSfgqe0t/81faGuN/QwT2+v7te
	Yd+YXcNdrIKD6rgMzLI0jDZSjbjUxU6mI9U0AWg8JMM61FbGu3G42AalrPGXAeU/2jWZszltHveRp
	n8vrCbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x406M-00000009v40-1WyA;
	Tue, 08 Sep 2026 17:59:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x406K-00000009v3O-1hWD
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 17:59:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F9E9403F0;
	Tue,  8 Sep 2026 17:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98401F00A3D;
	Tue,  8 Sep 2026 17:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890359;
	bh=nS58VD+9Q5pUHduSFMUnW1M4pyzzqHU28MfvtzrJtek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kbs4qpQxvXdX376nnnNxPuvV8rLbnpJ1kViaBYc652qP/5z3lpl3UkO3OmVmfxJRU
	 0o9rApZyZuGN2KMCyW78xaiM8OguNwZAA04OZU2/2OeZLqXAmfTbPx3fUvY8ABvPTs
	 iydkAhXo/Li8VHzzniNoA611yAUhT4/5ne98fZsDiptcnmOUuRHj+XZ07BDNyvmcLN
	 /oAItnsbMJZgvRIUu3hRIYzh3cu/0Su2I8L9b4x/DgcQIr/kv1D8BWUZdjqui5NPp1
	 bA9NgdQMGwiAgSP4RDEnJK5nZHYsjymNjS2moWCYM8f3LuoDqKHtPW+drHJX1Ftkuq
	 nqSe1S6TQYJ/A==
Date: Tue, 8 Sep 2026 18:59:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jennifer Berringer <jberring@redhat.com>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] scsi: ufs: spacemit: dt-bindings: Add UFS
 controller for K3 SoC
Message-ID: <20260908-carnival-curve-5762bb5cdb92@spud>
References: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
 <20260908-08-k3-ufs-support-v4-1-22aa2bd97d3b@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260908-08-k3-ufs-support-v4-1-22aa2bd97d3b@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============8800339806147430030=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8800339806147430030==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jQbfg5+DHEnMgPgg"
Content-Disposition: inline

--jQbfg5+DHEnMgPgg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2026 at 07:42:03AM +0000, Yixun Lan wrote:
> Document the compatible for UFS (Universal Flash Storage) Host Controller
> which found in SpacemiT K3 SoC chip. Its features are listed below:
>=20
> - Compliant with MIPI UniPro v1.61 specification.
> - Compliant with M-PHY v3.0 specification.
> - Compliant with UFS HCI v2.1 specification.
> - Supports up to 2 Tx and 2 Rx lanes, up to HS-GEAR3 5.8 Gbps per lane.
> - Supports standard low-power hibernate to reduce power consumption.
>=20
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml | 56 ++++++++++++++++=
++++++
>  1 file changed, 56 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml=
 b/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml
> new file mode 100644
> index 000000000000..dda533c852e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ufs/spacemit,k3-ufshc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K3 SoC UFS Host Controller
> +
> +maintainers:
> +  - Yixun Lan <dlan@kernel.org>
> +
> +properties:
> +  compatible:
> +    const: spacemit,k3-ufshc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: ref_clk

It's the usual refrain here, about having "clk" in clock names.
"axi" and "ref" perhaps?
Otherwise, looks fine to me.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +
> +allOf:
> +  - $ref: ufs-common.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/spacemit,k3-clocks.h>
> +    #include <dt-bindings/reset/spacemit,k3-resets.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    ufs@c0e00000 {
> +        compatible =3D "spacemit,k3-ufshc";
> +        reg =3D <0xc0e00000 0x40000>;
> +        clocks =3D <&syscon_apmu CLK_APMU_UFS_ACLK>,
> +                 <&syscon_apmu CLK_APMU_UFS_REFCLK>;
> +        clock-names =3D "aclk", "ref_clk";
> +        resets =3D <&syscon_apmu RESET_APMU_UFS_ACLK>;
> +        interrupts =3D <135 IRQ_TYPE_LEVEL_HIGH>;
> +        lanes-per-direction =3D <2>;
> +    };
>=20
> --=20
> 2.55.0
>=20

--jQbfg5+DHEnMgPgg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBM8QAKCRB4tDGHoIJi
0oK4AP938kdQirfMN6NRHa+lTPVj1DNNJ7TbVOQGbjOSg3a1FQEA/tuljdiVQH6H
wm/nMVyuuDsuFyLk4tuZ9ZZ7EEwhwwk=
=ZkPf
-----END PGP SIGNATURE-----

--jQbfg5+DHEnMgPgg--


--===============8800339806147430030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8800339806147430030==--

