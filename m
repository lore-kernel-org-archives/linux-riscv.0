Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA420E7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 18:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvvirBXtz6e/u1zN5JIygSzeY0m0Js6WhR4ATBtysAc=; b=R0yLODnijeyT/4YN5dcyQIkRIx
	OS1IhFUSj85KivofciCVhwQg8w+hy0Z1O+KKLYTZuC+MS7kxv4G7GG+8I1Z/38IEJTcDpXb5SZTQs
	NHUQdeNHtJEa6RrpeJbuqwh+Cq6PCly3BZxfQ6g+clcwj8mt56zq4VAO1FQ3rGVNFl07akWSToC4F
	avoLo9sdraSjaIZZHbL7ZqCnrwsNtrDqORj4vqGde8kBSsWKh5n9cpkUBf7PM5nV0IZTnmoy+mfl3
	/Yc+IhbZA9LhtLitX8U8ulNeAWx8T2uLXmku0ijCFRTUw2fAkwXkL15/kJWc0VZoIwl3/cNA7rb5m
	Ofu7loMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNGAF-0000000B0Xc-0FBL;
	Mon, 16 Dec 2024 18:49:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNG9k-0000000B0SM-2x6K
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 18:49:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C0185C541C;
	Mon, 16 Dec 2024 18:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25A3C4CED0;
	Mon, 16 Dec 2024 18:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734374963;
	bh=ZeQQScruNqW/bJ/x/lj6Dul84Yp6/f/jX5d+nsFQXP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1ZPNrm77Hzb3Yr+VIztPlS4AaSqQZsY4L4YZA9QyjHnf9y9BKoeORsmL5zqgKM5z
	 zLaNqRq6UgjB77sZjplhEZvkYOwLVcGoCG3dowN1eWsh6i5FORV033E1421uFMGfFD
	 ikzKblefGpcRe5va/r0VTspaftVOegoMzFiPLys3IV/zW/amTD8r56rT9kmc+udtBt
	 4QRQxrK5zAnkPf+4VqrMovYSuSx4UGoHBY6wxRrubhkokRlvQdN8/aFhXyhQv60rcM
	 a4ZHBnq1aW8/33AXSZy4Tfg96sbT4oMedVo3YzFjVgm0J++jU5Ff5gptjzJi3iK5wo
	 UEUM1dM3cddig==
Date: Mon, 16 Dec 2024 18:49:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [RFC PATCH 2/8] dt-bindings: mailbox: Add bindings for RPMI
 shared memory transport
Message-ID: <20241216-untrained-scarce-211d99984416@spud>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
 <20241216084817.373131-3-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20241216084817.373131-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_104924_826979_54CFFABC 
X-CRM114-Status: GOOD (  21.90  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Atish Patra <atishp@atishpatra.org>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Anup Patel <anup@brainfault.org>, Michael Turquette <mturquette@baylibre.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============8940929388359742271=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8940929388359742271==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DW1/Ea3gbyAW1RUZ"
Content-Disposition: inline


--DW1/Ea3gbyAW1RUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 02:18:11PM +0530, Anup Patel wrote:
> Add device tree bindings for the common RISC-V Platform Management
> Interface (RPMI) shared memory transport as a mailbox controller.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-=
shmem-mbox.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-m=
box.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.=
yaml
> new file mode 100644
> index 000000000000..8d713ba7ffc7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Platform Management Interface (RPMI) shared memory mailbox
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a common s=
hared
> +  memory based RPMI transport. This RPMI shared memory transport integra=
tes as
> +  mailbox controller in the SBI implementation or supervisor software wh=
ereas
> +  each RPMI service group is mailbox client in the SBI implementation and
> +  supervisor software.
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  References
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  [1] RISC-V Platform Management Interface (RPMI)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +properties:
> +  compatible:
> +    const: riscv,rpmi-shmem-mbox
> +
> +  reg:
> +    oneOf:
> +      - items:
> +        - description: A2P request queue base address
> +        - description: P2A acknowledgment queue base address
> +        - description: P2A request queue base address
> +        - description: A2P acknowledgment queue base address
> +        - description: A2P doorbell address
> +      - items:
> +        - description: A2P request queue base address
> +        - description: P2A acknowledgment queue base address
> +        - description: A2P doorbell address
> +
> +  reg-names:
> +    oneOf:
> +      - items:
> +        - const: a2p-req
> +        - const: p2a-ack
> +        - const: p2a-req
> +        - const: a2p-ack
> +        - const: db-reg
> +      - items:
> +        - const: a2p-req
> +        - const: p2a-ack
> +        - const: db-reg
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 1
> +    description:
> +      The RPMI shared memory transport supports wired interrupt specifie=
d by
> +      this property as the P2A doorbell.
> +
> +  msi-parent:
> +    description:
> +      The RPMI shared memory transport supports MSI as P2A doorbell and =
this
> +      property specifies the target MSI controller.
> +
> +  riscv,slot-size:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 64
> +    description:
> +      Power-of-2 RPMI slot size of the RPMI shared memory transport.
> +
> +  riscv,db-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Update only the register bits of doorbell defined by the mask (32 =
bit).

For an untested RFC, the bindings here look mostly fine. I'd suggest
renaming "db" to "doorbell" in properties etc, since we can easily
afford the extra characters. Please make sure to actually test the
bindings next time around, looks like all 3 bindings produced warnings.

General comments like not needing to provide minItems: 1 when maxItems
is also 1, and not needing a | unless you have formatting to preserve.

> +      If this property is not present then mask is assumed to be 0xfffff=
fff.

Also, things like this should be handled with a `default: 0xffffffff`,
rather than describing it in text.

I'll give the !rfc bindings a proper review when they appear, but before
that I'll give the code here a go too - thanks for sending the patches.

Cheers,
Conor.

--DW1/Ea3gbyAW1RUZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2B2LQAKCRB4tDGHoIJi
0oJNAP9JzetQCsrZEN1o9LOtrG9uzZmopAxjlXBU4Ev0ivS0wgD9GrrhOQX2dGfa
MzxcsO3uL5ROuSy48vQfWsf+RA9CnAA=
=lG3u
-----END PGP SIGNATURE-----

--DW1/Ea3gbyAW1RUZ--


--===============8940929388359742271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8940929388359742271==--

