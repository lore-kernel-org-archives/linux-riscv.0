Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7771ACD98F2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzOKLAlDm3mpr7Tg587QgWWP88C2hLVn+LwuJyZBdPU=; b=MM67fDcOP9GC+7EYg+HHrKcOui
	Xl6ammwe5Ci2azZ+xqvX9rGu0qQUEEHzd3Qb78YF9C9t86+Bh1hglR/qFCSKG+ClnCY3kju0HAzhG
	iVQr/QngXYvNuZNHOfIz5PCxR0RPYhN2f3NyKW4kXt1KEsVkWv2+lLJMk8I3YZjMit/I9OJYUxhtH
	IapCrApu4+4PZ5Z/VCMpAMsplOk/BtWcfdmBycDfrWMB1yXigg3cDW8pG1lTssrsw4Cwp2GWNxgcP
	bCzywxmHkt+wNBt7LxhxC6QVyb27sYus7p1uuQWk0f8HUpct7dWrU6SyZqSC1AUm0mNx1rwrxPCgO
	JG+c3bdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbiCe-00000005F8F-26E5;
	Mon, 22 Jun 2026 17:12:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbiCd-00000005F80-0YKl
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 17:12:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8F04419F9;
	Mon, 22 Jun 2026 17:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8C01F000E9;
	Mon, 22 Jun 2026 17:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782148374;
	bh=+xKQGK1xzLlOj2Cs7V1t6IwPtme7Lo3yazoQMsyAceI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=glNgCllMiix2vbWBuiVp5UEsa2qF4AQIR8WExjMq8A0WJsez+vtwnzin3L5Vp1ETJ
	 dqjCEH//50B3xsjosrFRF3c6kDCAk+02wzlIRS2sIJd0dKhoIJJvpjp6QaHd1Tt7y8
	 QkZ5doHEy5mU2ZbNTWfqu+IiEDLd6IEOe6KGkpwsOc430JjpIMrdcQPYv6pVqPGV5F
	 KDexJhM2Msaq6oRGkmtqY0kfTKjb1usHxOZIvMQZ86QC8edUNfwC+EX0jRmLzOVBmu
	 kFderdRWfZfmsBzk4OHEpw7O1IUlezv9XB38mxPXWvc+Qj1fh5c8sScFJucSxrHHwS
	 Adwx/s/pQQZow==
Date: Mon, 22 Jun 2026 18:12:47 +0100
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
Subject: Re: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
Message-ID: <20260622-profanity-herbs-1cc1bcf6206f@spud>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20260619105834.1277302-3-peter.lin@sifive.com>
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
Content-Type: multipart/mixed; boundary="===============7985405574803757884=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7985405574803757884==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vE1iEq1IsVaZ4OsP"
Content-Disposition: inline


--vE1iEq1IsVaZ4OsP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wrote:
> Add per-hart DT properties for RISC-V Worlds architecture:
> riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> platform-defined values are primarily used by M-mode firmware
> to configure World ID CSRs and restrict WID usage across
> privilege levels.
>=20
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
>  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 5feeb2203050..4b5778b6d3e7 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -26,6 +26,7 @@ description: |
>  allOf:
>    - $ref: /schemas/cpu.yaml#
>    - $ref: extensions.yaml
> +  - $ref: worlds.yaml
>    - if:
>        not:
>          properties:
> @@ -120,11 +121,31 @@ properties:
>        thead systems where the vector register length is not identical on=
 all harts, or
>        the vlenb CSR is not available.
> =20
> +  riscv,pmwid:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Platform-defined M-mode World ID (WID) assigned to this hart.
> +    minimum: 0
> +    maximum: 63
> +
> +  riscv,pmwidlist:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description:
> +      Platform-defined bitmap of M-mode World IDs (WIDs) that this hart =
may use.

I don't understand what the difference is between this property and the
one before it are.
Is this one meant to be used by m-mode software to then select one which
will appear in riscv,pmwid?

> +
> +  riscv,pmlwidlist:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description:
> +      Platform-defined bitmap of World IDs (WIDs) that S-mode and U-mode=
 may use
> +      on this hart.
> +
>    # RISC-V has multiple properties for cache op block sizes as the sizes
>    # differ between individual CBO extensions
>    cache-op-block-size: false
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false

> +  # RISC-V requires 'riscv,nworlds' in /cpus, so disallow it here
> +  riscv,nworlds: false

Isn't this pointless? Nothing ever defines riscv,nworlds as a cpu level
property so there's no need to disallow it?

> =20
>    interrupt-controller:
>      type: object
> diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Docume=
ntation/devicetree/bindings/riscv/worlds.yaml
> new file mode 100644
> index 000000000000..cc8b3747591e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/worlds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Worlds Extension
> +
> +maintainers:
> +  - Yu-Chien Peter Lin <peter.lin@sifive.com>
> +
> +description: |
> +  The RISC-V Worlds ISA extension, as described in the RISC-V Privileged
> +  Specification, adds World ID tagging for context isolation.
> +
> +  This binding describes the system-wide Worlds configuration for the /c=
pus node
> +  and is used alongside per-hart Worlds-related properties such as riscv=
,pmwid in
> +  the RISC-V CPU binding and Worlds-related ISA extensions enumerated via
> +  riscv,isa-extensions.
> +
> +select:
> +  properties:
> +    $nodename:
> +      pattern: "^cpus$"
> +
> +properties:
> +  riscv,nworlds:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Number of World IDs (WIDs) supported by the platform. This is a sy=
stem-wide
> +      property that describes the total number of isolation contexts ava=
ilable.
> +      Hardware components such as the WorldGuard Checker use this to det=
ermine
> +      the valid range of WID values.
> +    minimum: 2
> +    maximum: 64
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    // Example: System with 4 World IDs
> +    cpus {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        timebase-frequency =3D <1000000>;
> +        riscv,nworlds =3D <4>;
> +
> +        cpu@0 {
> +            device_type =3D "cpu";
> +            reg =3D <0>;
> +            compatible =3D "sifive,bullet0", "riscv";
> +            riscv,isa-base =3D "rv64i";
> +            riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c";
> +            riscv,pmwid =3D <0>;
> +
> +            interrupt-controller {
> +                #interrupt-cells =3D <1>;
> +                compatible =3D "riscv,cpu-intc";
> +                interrupt-controller;
> +            };
> +        };
> +
> +        cpu@1 {
> +            device_type =3D "cpu";
> +            reg =3D <1>;
> +            compatible =3D "sifive,bullet0", "riscv";
> +            riscv,isa-base =3D "rv64i";
> +            riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c";
> +            riscv,pmwid =3D <1>;
> +
> +            interrupt-controller {
> +                #interrupt-cells =3D <1>;
> +                compatible =3D "riscv,cpu-intc";
> +                interrupt-controller;
> +            };
> +        };
> +    };
> --=20
> 2.43.7
>=20

--vE1iEq1IsVaZ4OsP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajltDwAKCRB4tDGHoIJi
0tJXAQCZQytqbQQqRG+4zLsuFbAzysNGLpw3SKOQX/PxGaP42AEA9X5YeOLL4M/6
5L814hDyTlSP1GJnVOVQ6M7yZXvi4wU=
=9UMS
-----END PGP SIGNATURE-----

--vE1iEq1IsVaZ4OsP--


--===============7985405574803757884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7985405574803757884==--

