Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12225EED627
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjhMyy/EindzitBv2JJuliaPKGJeUlwa/iRwQPnEeqY=; b=c1eXp0msntO/DVA5gj6Fz++GFv
	qmBzyxN0kF4e3eyiYhSDN0UiwgFtE0QkIEwmzaiNuLi/RUidJIKu7VVvp46xYGULXUG+sPvO3VZlp
	MXqomSv10dNY4e2KfZyAssNFlfuvCbP2VMqBeHhe69G29ZsHCUMzJDQjXnDaFBMGc7ClRjz3d2xl0
	5FgOBKIDWDPZ8vYODfmhCq/soMSjRF6SUw9o5eQyGGI1iVIfs7HoaEvitkH5eMY9TPk5avzCiXTmf
	dk7GJvdQ3AYTMzFRiGUavvEucZlEccDFH/uPmZBnkusfgCneTcD/9LYmJuTaGBDiQRlhJ26GEFFXk
	x7d2n+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sonQA-0000000Do8C-3Z9U;
	Thu, 12 Sep 2024 17:15:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sonQ7-0000000Do7p-1hQI
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 17:15:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D28CD5C5BDE;
	Thu, 12 Sep 2024 17:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF58C4CEC3;
	Thu, 12 Sep 2024 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726161350;
	bh=F2KHOAwtI2liyPV9p1o+B/TcQTeoG/9OurOUzOITgCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6a1m6UN8+Mc8aa6OvJQtkMkFtlC/An2ncY7bN/TbuccIworuRnicIdjj5P5hqc+R
	 /7ZoY3Eq2dlhOeP1Qmd3MvKhDPnsK3oHckYnwNW78m8BHlfI1CvAMY9fiIv9cnBU3b
	 T1XWuFt3kWODI8xkFitIi8m9f8ssXfdUdEMDxuuc2x1oFTwudoqhqIM5Cyml/T0rqV
	 7SBIMn5ZF5iiCOfe3hAwcT7Niwk4azuxQDgYn6dTX7TM8PKn+8q7STiPQuKjGVe4xt
	 k9llevAIEppG9KN+L2mN3LLzcXvEhCs4NeOzImt+bhhAiVa1Wlys6Ocq33ox9cgftZ
	 VzzzCIMgWVHcg==
Date: Thu, 12 Sep 2024 18:15:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	peterlin@andestech.com, dminus@andestech.com,
	conor.dooley@microchip.com, conor+dt@kernel.org,
	ycliang@andestech.com, jassisinghbrar@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v1 2/5] dt-bindings: mailbox: add binding for Microchip
 IPC mailbox driver
Message-ID: <20240912-wired-skirt-a758f0e1507c@spud>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240912170025.455167-3-valentina.fernandezalanis@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_101551_610621_0F36D0A4 
X-CRM114-Status: GOOD (  22.79  )
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
Content-Type: multipart/mixed; boundary="===============3406334434576776459=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3406334434576776459==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YivsFDfHFtw+N+Us"
Content-Disposition: inline


--YivsFDfHFtw+N+Us
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 06:00:22PM +0100, Valentina Fernandez wrote:
> Add a dt-binding for the Microchip Inter-Processor Communication (IPC)
> mailbox controller.

Before anyone else gets here, there's an erroneous "driver" in $subject
:)

> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.c=
om>
> ---
>  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,s=
bi-ipc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.=
yaml b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> new file mode 100644
> index 000000000000..dc2cbd5eb28f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/microchip,sbi-ipc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip Inter-processor communication (IPC) mailbox controller
> +
> +maintainers:
> +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> +
> +description:
> +  The Microchip Inter-processor Communication (IPC) facilitates
> +  message passing between processors using an interrupt signaling
> +  mechanism.
> +  This SBI interface is compatible with the Mi-V Inter-hart
> +  Communication (IHC) IP.
> +  The microchip,sbi-ipc compatible string is inteded for use by software
> +  running in supervisor privileged mode (s-mode). The SoC-specific
> +  compatibles are inteded for use by the SBI implementation in machine
> +  mode (m-mode).

And it might be worth me pointing out to the !riscv folks that "SBI
implementation in machine mode" means that the
"microchip,miv-ihc-rtl-v2" compatible is intended for use by firmware
only.

Cheers,
Conor.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,sbi-ipc
> +      - microchip,miv-ihc-rtl-v2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 5
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 5
> +
> +  "#mbox-cells":
> +    description:
> +      For the SBI "device", the cell represents the global "logical" cha=
nnel IDs.
> +      The meaning of channel IDs are platform firmware dependent. The
> +      SoC-specific compatibles are intended for use by the SBI implement=
ation,
> +      rather than s-mode software. There the cell would represent the ph=
ysical
> +      channel and do not vary depending on platform firmware.
> +    const: 1
> +
> +  microchip,ihc-chan-disabled-mask:
> +    description:
> +      Represents the enable/disable state of the bi-directional IHC chan=
nels
> +      within the MIV-IHC IP configuration. The mask is a 16-bit value, b=
ut only
> +      the first 15 bits are utilized.Each of the bits corresponds to
> +      one of the 15 IHC channels.
> +      A bit set to '1' indicates that the corresponding channel is disab=
led,
> +      and any read or write operations to that channel will return zero.
> +      A bit set to '0' indicates that the corresponding channel is enabl=
ed
> +      and will be accessible through its dedicated address range registe=
rs.
> +      The remaining bit of the 16-bit mask is reserved and should be ign=
ored.
> +      The actual enable/disable state of each channel is determined by t=
he
> +      IP block=E2=80=99s configuration.
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    default: 0
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,sbi-ipc
> +    then:
> +      properties:
> +        reg: false
> +    else:
> +      required:
> +        - reg
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,miv-ihc-rtl-v2
> +    then:
> +      properties:
> +        interrupt-names:
> +          items:
> +            pattern: "^hart-[0-5]+$"
> +
> +examples:
> +  - |
> +    mailbox {
> +      compatible =3D "microchip,sbi-ipc";
> +      interrupt-parent =3D <&plic>;
> +      interrupts =3D <180>, <179>, <178>;
> +      interrupt-names =3D "hart-1", "hart-2", "hart-3";
> +      #mbox-cells =3D <1>;
> +    };
> +  - |
> +    mailbox@50000000 {
> +      compatible =3D "microchip,miv-ihc-rtl-v2";
> +      microchip,ihc-chan-disabled-mask=3D  /bits/ 16 <0>;
> +      reg =3D <0x50000000 0x1C000>;
> +      interrupt-parent =3D <&plic>;
> +      interrupts =3D <180>, <179>, <178>;
> +      interrupt-names =3D "hart-1", "hart-2", "hart-3";
> +      #mbox-cells =3D <1>;
> +    };
> --=20
> 2.34.1
>=20

--YivsFDfHFtw+N+Us
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuMhwAAKCRB4tDGHoIJi
0ueGAQCjRtgOUFPYCV/NiX1IBYJRwc+sQaTW3AN/213MKFEm9gD9ELhr1G0y3nvJ
A9fm9nCT5PQy4F0MwaegNptVjGbC+Qo=
=L4tD
-----END PGP SIGNATURE-----

--YivsFDfHFtw+N+Us--


--===============3406334434576776459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3406334434576776459==--

