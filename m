Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0923D10A88FF
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 18:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZleAHWZHufPjyCVfh7euB9FQeSZwZ/VpzNpGS587JE=; b=R0UFjD4SMPbftzP7/D+BC9wT6j
	6wBu1L5fX+LlX8vh2KPfyf+r3jT3s2/fm5UQwPqfUSrjLtUozSEBhR004WzPgKtIRX1JQ2WbmcNkf
	+fjQq/U4MpfPxBsFwFvBl8bSiguRsk4lYLbz0l4AHgtWXh5N/IDTtZkPk/QwuQhGjXcnXMg/bhQZQ
	SkfOXpNfJTVzbXOWMHXdCBZB61jwoqq3ity29eStvF3xBaTsNssjBFvxPeBI0MUsj1bFHska8o2iG
	3wlqvijmq1ZTF3reTNKCNR1kzJSAH/IsteoLBD3DRUXLlIBYdxnWxQfpum7ceApwKNB0ee3h/I9vU
	4h6q7wXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pXa-000000062mV-1J8M;
	Thu, 26 Mar 2026 18:34:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pXY-000000062mA-1035
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 18:34:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2128143C29;
	Thu, 26 Mar 2026 18:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588ACC116C6;
	Thu, 26 Mar 2026 18:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774550083;
	bh=+WFhHAP+I6U56ZY1SPoQXhOLT+bdcm5oHSlV3lm2fRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLQ8s2Ys1REk6EW7Qhg3mlYZf3hKzj8IindqDfPFSPV9j2xX5TipAVNqRAUNL+Wea
	 x4Y0N8d3LK8wCT2DArdswnWLaR795pWrpELuTVswjw2gttc7K7J4eNtCdjcjpqbJlz
	 yK/HKpZlVj7Z37+hYHahAhIkr6dwVwIfBpaLT3hLCoQEgAeJNgF7DSLH3zUsKsCDi2
	 ckkp3Xk9BU37wOBORGkLpHEm38eeWkBZRrpzO5xlZPT4MNuBpD4kU3BAl74GVvgSo5
	 NsK/KDCX/pTx8/NsY9pHgcp5u+/sfcKA5UVl8fiQSP8dqqxQ67uoL7JcWFreNn9cnY
	 ZF0JxhevI/KOQ==
Date: Thu, 26 Mar 2026 18:34:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Guodong Xu <guodong@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
Message-ID: <20260326-explode-surplus-24c0e0813099@spud>
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-2-ca94ca7bb595@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260326-k3-pdma-v2-2-ca94ca7bb595@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_113444_301843_508F08D1 
X-CRM114-Status: GOOD (  14.22  )
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
Content-Type: multipart/mixed; boundary="===============3484425524730795214=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3484425524730795214==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3c5c3SbeQ5J8Cvcr"
Content-Disposition: inline


--3c5c3SbeQ5J8Cvcr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 04:17:17PM +0800, Troy Mitchell wrote:
> From: Guodong Xu <guodong@riscstar.com>
>=20
> Add k3 compatible string.

That's obvious. What you need to explain is why it is not compatible with
the existing k1.
pw-bot: changes-requested
Cheers,
Conor.

>=20
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml =
b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
> index ec06235baf5c..62ce6d81526b 100644
> --- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
> +++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
> @@ -14,7 +14,9 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: spacemit,k1-pdma
> +    enum:
> +      - spacemit,k1-pdma
> +      - spacemit,k3-pdma
> =20
>    reg:
>      maxItems: 1
>=20
> --=20
> 2.53.0
>=20

--3c5c3SbeQ5J8Cvcr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacV8PQAKCRB4tDGHoIJi
0iSJAQCYik/5JNh07McaFHFAtO7PKvqeDrCRfWwv0LzCc+MAOQD+I6kaG8JvSER/
6z5GZ8MFkLGErIBUFMmIqZJuwKZldAo=
=sPth
-----END PGP SIGNATURE-----

--3c5c3SbeQ5J8Cvcr--


--===============3484425524730795214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3484425524730795214==--

