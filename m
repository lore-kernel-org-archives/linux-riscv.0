Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD85CDB46F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 17:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhmUCfHtwoLSkreu+/OZ72NZDOFlyxt2rDGlh50g6Hs=; b=Xh4yjqI/qwBTv4hJOatnVKlt8k
	bx9iWQ0ATQz3pDv0+l8i18elguFCijrNurx44SFhtSD9BMA8gLOnErsu9goCF8+ClEbRwKcFOLy63
	yTgjN6J5K+2qvfVa+PEOT3KK3d50LWKUZHMQLETP3KMBPLwuTH9Yefa9dcodvyscXfXQWkoOkyuyf
	IRRSfKkt+nvp9MCT51L40wBLaTvn3geCdMijfsQRhlM8NHqPqgctpNK5rn05i+dJjasawLdU2nNXg
	g0rQlNY9RRCuErKOS6j/gnVEHf8Ntu/y4iw9sI2/uSP7m+RGT8WWUhy2/Zh5Qfz5cBNvRs4D2UjY9
	8eV73jCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbin7-00000005H31-0W9Z;
	Mon, 22 Jun 2026 17:50:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbin6-00000005H2s-0eo0
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 17:50:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F8AD42BA4;
	Mon, 22 Jun 2026 17:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1055F1F000E9;
	Mon, 22 Jun 2026 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782150635;
	bh=Tcr6cQw8/+pYLroK7pmKi8A9D7PtjmruMLL8Vwwm7SU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=USVQOBbF373jeaPO/1FUAeoX3ACGzL/DyUsgve6evHd+QPQHhIsj8EptbUEVZLuBO
	 GZG49R4R+jEXsvVqtz2y3HIJ2GYrqHGrKmsHe8m8rSTgTfDcwZhjx37aCsJdeJo3NY
	 YqtZke2K5kYFKvhi7yTpYcA3dC9CRiGLYa1qYsMWHjQ+aYIXb4ekq71MMe6yexxYgp
	 tQoZw+ACAKFLC8y6K8WQ4/XGmNzC9seB3YIqHO+JK+cy1ibbbmqx0n/lA+AnOCPpHW
	 KEZLFDDeNVRekAy8AYl58lsGpapCKkzVQGl+EONhjUeUfez/COcXtfKrR/9CAr98/o
	 UPz3f+ftsuG2g==
Date: Mon, 22 Jun 2026 18:50:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com
Subject: Re: [RFC PATCH 3/3] dt-bindings: sifive: Add WorldGuard Checker
Message-ID: <20260622-exemplary-navigate-88985b1444f5@spud>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-4-peter.lin@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20260619105834.1277302-4-peter.lin@sifive.com>
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
Content-Type: multipart/mixed; boundary="===============8397023712131941484=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8397023712131941484==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B0xT/bCV5w9r0ZSK"
Content-Disposition: inline


--B0xT/bCV5w9r0ZSK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 06:58:34PM +0800, Yu-Chien Peter Lin wrote:
> Add DT binding for SiFive wgChecker2, a hardware firewall enforcing
> WID-based access control in RISC-V Worlds. Provides checker slots to
> program per-WID permissions for downstream resources, with optional
> sub-range partitioning.
>=20
> Link: https://github.com/riscvarchive/security/blob/main/papers/worldguar=
d%20proposal.pdf
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>  .../devicetree/bindings/riscv/worlds.yaml     |   9 +
>  .../bindings/sifive/sifive,wgchecker2.yaml    | 237 ++++++++++++++++++
>  2 files changed, 246 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgche=
cker2.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Docume=
ntation/devicetree/bindings/riscv/worlds.yaml
> index cc8b3747591e..c39a06c2dd8d 100644
> --- a/Documentation/devicetree/bindings/riscv/worlds.yaml
> +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
> @@ -34,6 +34,14 @@ properties:
>      minimum: 2
>      maximum: 64
> =20
> +  sifive,trustedwid:

What's sifive specific about this? Wouldn't other vendors also have
trusted worlds?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 31
> +    description: |
> +      The World ID (WID) designated as the trusted WID for this platform.
> +      Transactions tagged with this WID are authorized to access and con=
figure
> +      WorldGuard blocks, including wgCheckers and wgMarkers.
> +
>  additionalProperties: true
> =20
>  examples:
> @@ -44,6 +52,7 @@ examples:
>          #size-cells =3D <0>;
>          timebase-frequency =3D <1000000>;
>          riscv,nworlds =3D <4>;
> +        sifive,trustedwid =3D <3>;
> =20
>          cpu@0 {
>              device_type =3D "cpu";
> diff --git a/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.y=
aml b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> new file mode 100644
> index 000000000000..043c748385ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> @@ -0,0 +1,237 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2026 SiFive, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sifive/sifive,wgchecker2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive WorldGuard Checker
> +
> +maintainers:
> +  - Yu-Chien Peter Lin <peter.lin@sifive.com>
> +
> +description: |
> +  The RISC-V Worlds ISA extension defines World IDs (WIDs) as architectu=
ral
> +  identifiers that tag each system transaction with its originating cont=
ext.
> +  System integrators assign WIDs to execution contexts such as privilege=
 modes,
> +  trusted execution environments, or other isolation boundaries.
> +
> +  The SiFive WorldGuard Checker is a hardware firewall positioned in the
> +  system interconnect fabric. It inspects every transaction, evaluating =
the
> +  WID against access control policies encoded in checker slots for each
> +  protected resource. Transactions from unauthorized WIDs are blocked and
> +  reported as bus errors, interrupts, or both.
> +
> +  This enables spatial partitioning of memory regions and memory-mapped =
devices
> +  across execution contexts. Different address ranges can enforce distin=
ct
> +  policies, allowing isolated workloads to coexist with hardware-enforced
> +  protection.
> +
> +  The wgChecker acts as an access-controller provider as defined in the
> +  access-controllers framework. Protected devices are consumers that dec=
lare
> +  their access policy via the access-controllers property. The hardware
> +  supports up to 32 World IDs.
> +
> +  The World ID authorized to configure WorldGuard blocks is specified by=
 the
> +  sifive,trustedwid property in the /cpus node.
> +
> +allOf:
> +  - $ref: /schemas/access-controllers/access-controllers.yaml#
> +
> +properties:
> +  compatible:
> +    const: sifive,wgchecker2

Missing device specific compatibles.

> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Base address and size of the wgChecker memory-mapped I/O registers.
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Interrupt line asserted when a WID access violation is detected and
> +      interrupt reporting is enabled in the slot configuration (IR or IW
> +      bits set).
> +
> +  '#access-controller-cells':
> +    const: 7
> +    description: |
> +      Specifier for one access-control rule, encoded as seven u32 cells:
> +        <addr-hi addr-lo size-hi size-lo perm-hi perm-lo config>
> +
> +      where:
> +        - addr-hi, addr-lo: 64-bit base address of the protected region.
> +        - size-hi, size-lo: 64-bit size of the protected region in bytes.

These two cells effectively just duplicate the reg property.

> +        - perm-hi: Permission bitmap for WIDs 16..31. Two bits per WID:
> +                     bit 2*(WID-16)   =3D Read  permission
> +                     bit 2*(WID-16)+1 =3D Write permission
> +                   Set bits grant access. Use 0x0 for systems with
> +                   riscv,nworlds <=3D 16.
> +        - perm-lo: Permission bitmap for WIDs 0..15. Two bits per WID:
> +                     bit 2*WID   =3D Read  permission
> +                     bit 2*WID+1 =3D Write permission
> +                   Set bits grant access.

And these two look like a layering violation to me. Why does the
consumer contain its own configuration information? If firmware provides
this to s-mode, it is either useless (because firmware has already done
the configuration) or it makes the access control pointless because
s-mode is expected to program its own access.
With that in mind, the first 4 cells can probably just be transmuted to
a single cell with platform-specific unique identifiers.
Surely the ecall involved with actually requesting access needs
something like that anyway?

The only value I can see in this is if some worlds that a bit of
software is running on can access a peripheral (or part thereof) and
others can't? Though platforms like that might benefit more from being
reworked to have homogeneous access! I've got no idea how a Linux driver
etc would handle the only some CPUs being permitted to access a register
region.

> +        - config:  Slot configuration bits:
> +                     Bit 0 (ER): Report read  violations as bus errors
> +                     Bit 1 (EW): Report write violations as bus errors
> +                     Bit 2 (IR): Report read  violations via interrupt
> +                     Bit 3 (IW): Report write violations via interrupt
> +                     Bit 4 (L):  Lock bit - prevents further modification
> +                   Bits 5..31 are reserved and must be zero.

For the next revision of this, I really would like to see the access
controller driver.

> +
> +      Multiple entries may be listed to apply different policies to
> +      different address ranges, including sub-ranges within a single
> +      physical resource.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#access-controller-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    // Example 1: Single device protection
> +    // WID 0 and WID 3 have RW access to UART; errors and IRQs reported.
> +
> +    cpus {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        timebase-frequency =3D <1000000>;
> +        riscv,nworlds =3D <4>;
> +        sifive,trustedwid =3D <3>;
> +
> +        cpu@0 {
> +            device_type =3D "cpu";
> +            reg =3D <0>;
> +            compatible =3D "riscv";
> +            riscv,isa =3D "rv64imac";
> +        };
> +    };
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        uart: uart@1c1000 {
> +            compatible =3D "ns16550a";
> +            reg =3D <0x0 0x001c1000 0x0 0x1000>;
> +            reg-names =3D "control";
> +            interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH>;
> +            // WID 0,3 RW; report errors+IRQs
> +            access-controllers =3D <&wgchecker0
> +                                  0x0 0x001c1000 0x0 0x00001000
> +                                  0x0 0x000000c3 0x0f>;
> +        };
> +
> +        wgchecker0: wgchecker@1c2000 {

I think this should be access-controller@

> +            compatible =3D "sifive,wgchecker2";
> +            reg =3D <0x0 0x001c2000 0x0 0x1000>;
> +            #access-controller-cells =3D <7>;
> +            interrupts =3D <80 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-parent =3D <&aplic_m>;
> +        };
> +    };

--B0xT/bCV5w9r0ZSK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajl14wAKCRB4tDGHoIJi
0vOoAQDGW5uVP7SsX3EThY+cslZwqoZM4OygPKIeEcEnV1ndagEAuE6wHtRin61E
7yZJ3AdpefPnIn7ERObXGjkJM2xyfw8=
=wQ6v
-----END PGP SIGNATURE-----

--B0xT/bCV5w9r0ZSK--


--===============8397023712131941484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8397023712131941484==--

