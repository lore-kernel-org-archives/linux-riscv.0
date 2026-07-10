Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7F1C44501
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 08:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iuVylFppRjIDout2i5BZlU3qxn49eCR+FjX70fHDRU=; b=tKOoRyQUG/RPQiKoTEgIrwibtW
	UZJNK87O8jCjbOFo007mNlP0OfKdk/c4LwODpIwEztzG9sPG5Kks89BKb6XVoJf0gbveK6X2/Jj2R
	98HzKwWYAUppkiCJ2L4jQm+KqDOfTQndxV+Xea7l9Yug7JQo8hwS65OYaK/H98Rb5D4HCf9Y9iJXT
	QhipfZo5a7JvWhxIaPORtLhT8jf1zUlbIk8ZG0cAf+7/DF1FF38khqS6vt/xDDE9K20nk0Pa7foTv
	rfh31ggCxqBmlrA5kZHJP2kkEVGAebwXkoKhrYs1MGJse+HFSB7RHL2wFzUHWbfpn5yDssfU6G7kI
	otEhpezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi759-00000004VzO-3SkB;
	Fri, 10 Jul 2026 08:59:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi756-00000004VyA-12Y7
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 08:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1783673975; x=1815209975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ySeEdVyfLJ1FoqK1KDCiOu5dWvFOr79CGcqcGkC6+pU=;
  b=h7gka5UMawPiznYay4s6fC6IIC+P8vVytahz6E82tOcvGo933lvHpuZR
   /d4/HEScXNb6YAQOw+6QQJDY0lzRLD8IbI43JIooGwfneIxPhKAfa3vZs
   Q+PtdzLXuvMMElErXCrbpVmzVlBRGo5soQtHWFZ17OTyMNUgWVlNEnbvJ
   xqR0s6fqUAw8P5JiX8nAfdkZRcSKNAuQCGmryMBA2MCmrNcMuaRnC6ESZ
   YVXdlxwrx7BOeD6QRfWiOuCDqk9Gg8maBz4U/ioc9nKNCgS3DoSqYtrE2
   k+LRISOhUjYbxuztO/HEUNUW3NDNle7r2VEMnbijr6Pxn4bzndeeKXwTD
   w==;
X-CSE-ConnectionGUID: 93p7ykEDR4iIaWuQKtugoQ==
X-CSE-MsgGUID: d97xofyKSd+Bzpg62yGSuw==
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="asc'?scan'208";a="59540370"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 01:59:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Fri, 10 Jul 2026 01:59:32 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 10 Jul 2026 01:59:29 -0700
Date: Fri, 10 Jul 2026 09:58:34 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
CC: Albert Ou <aou@eecs.berkeley.edu>, Alex Ousherovitch
	<aousherovitch@rambus.com>, Conor Dooley <conor+dt@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rob
 Herring <robh@kernel.org>, Shuah Khan <shuah@kernel.org>, Alexandre Ghiti
	<alex@ghiti.fr>, <devicetree@vger.kernel.org>, Joel Wittenauer
	<Joel.Wittenauer@cryptography.com>, <linux-api@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Shuah Khan <skhan@linuxfoundation.org>,
	Thi Nguyen <thin@rambus.com>
Subject: Re: [PATCH v2 01/19] dt-bindings: crypto: add Rambus CryptoManager
 Hub
Message-ID: <20260710-siding-unmatched-5e066fbe4c01@wendy>
References: <20260709203037.1884436-1-skrishnamoorthy@rambus.com>
 <20260709203037.1884436-2-skrishnamoorthy@rambus.com>
MIME-Version: 1.0
In-Reply-To: <20260709203037.1884436-2-skrishnamoorthy@rambus.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_015936_358325_D9A963FC 
X-CRM114-Status: GOOD (  27.88  )
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
Content-Type: multipart/mixed; boundary="===============8467266887848405482=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8467266887848405482==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tVV5lCAGuauPQznU"
Content-Disposition: inline

--tVV5lCAGuauPQznU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Thu, Jul 09, 2026 at 01:30:19PM -0700, Saravanakrishnan Krishnamoorthy w=
rote:
> From: Alex Ousherovitch <aousherovitch@rambus.com>
>=20
> Add device tree binding schema for the CRI CryptoManager Hub (CMH)
> hardware crypto accelerator.  The binding covers the parent SoC-level
> node with register region, interrupt, DMA properties, and per-core
> child nodes identified by compatible string and unit address.
>=20
> Register the 'cri' vendor prefix for Cryptography Research, Inc.

This company no longer exists, you should probably introduce a rambus
vendor prefix instead.

>=20
> Co-developed-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.=
com>
> Signed-off-by: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.co=
m>
> Signed-off-by: Alex Ousherovitch <aousherovitch@rambus.com>
> Reviewed-by: Joel Wittenauer <Joel.Wittenauer@cryptography.com>
> Reviewed-by: Thi Nguyen <thin@rambus.com>
> ---
>  .../devicetree/bindings/crypto/cri,cmh.yaml   | 222 ++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  2 files changed, 224 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/cri,cmh.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/crypto/cri,cmh.yaml b/Docu=
mentation/devicetree/bindings/crypto/cri,cmh.yaml
> new file mode 100644
> index 000000000000..db41132e0591
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/cri,cmh.yaml
> @@ -0,0 +1,222 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/crypto/cri,cmh.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CRI CryptoManager Hub (CMH) Hardware Crypto Accelerator
> +
> +maintainers:
> +  - Alex Ousherovitch <aousherovitch@rambus.com>
> +  - Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
> +  - Joel Wittenauer <Joel.Wittenauer@cryptography.com>
> +
> +description: |
> +  The CRI CryptoManager Hub (CMH) is a hardware cryptographic accelerato=
r accessed
> +  via a mailbox-based VCQ (Virtual Command Queue) interface.  The host
> +  writes VCQ command sequences into per-mailbox DMA queue buffers and
> +  rings a doorbell; the CMH eSW processes them and signals completion
> +  via interrupt.
> +
> +  Supported algorithm families: SHA-2, SHA-3, SM3, AES, SM4,
> +  ChaCha20-Poly1305, RSA, ECDSA, EdDSA, ECDH, SM2, ML-KEM, ML-DSA,
> +  SLH-DSA, LMS, XMSS, DRBG.
> +
> +properties:
> +  compatible:
> +    const: cri,cmh
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      SIC (System Interface Controller) MMIO region.  Mailbox instance
> +      registers are at offsets N * 0x1000 within this region.
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 64
> +    description:
> +      Per-mailbox completion/error interrupts from the CryptoManager Hub,
> +      matching the real CMH ch_sys_interrupt_mbx[N-1:0] topology.
> +      Entry i corresponds to MBX instance i.  The driver maps each
> +      configured mailbox (cri,mbx-instances) to its DT interrupt
> +      index and registers a separate threaded IRQ handler per MBX.
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 64
> +    items:
> +      pattern: '^mbx[0-9]+$'
> +    description:
> +      Names for each mailbox interrupt, matching the interrupts array.
> +      Format is "mbxN" where N is the mailbox instance index.
> +
> +  cri,mbx-instances:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 64
> +    description:
> +      Array of 0-based mailbox instance indices to configure.
> +      Each index N maps to register offset N * 0x1000 within the
> +      SIC region.  If absent, defaults to instances 0 and 1.

This property seems like it could be replaced by having a reg entry for
each mailbox.

> +  cri,mbx-slots-log2:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 64
> +    description:
> +      Per-mailbox slot count as log2.  Valid range 1..15.
> +      Array length must match cri,mbx-instances.
> +      Default is 5 (32 slots).

This looks like it should be deducible from a device-specific compatible.

> +
> +  cri,mbx-strides-log2:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 64
> +    description:
> +      Per-mailbox stride (bytes per slot) as log2.  Valid range 7..10.
> +      Array length must match cri,mbx-instances.
> +      Default is 7 (128 bytes per slot).

Ditto here.

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^(hc|aes|sm4|sm3|hcq|qse|pke|drbg|ccp)@[0-9a-f]+$":
> +    type: object
> +    description:
> +      Per-core-type child nodes.  Each child represents one crypto core
> +      instance available in the hardware.  The driver enumerates these at
> +      probe to discover which algorithm families are present.

This whole subnode thing seems like it is only required because you
don't have device-specific compatibles to deduce what is supported.

> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          Hardware core ID for this core type (e.g. 0x02 for HC, 0x03 fo=
r AES).
> +          Must match the CORE_ID_* values defined by the CMH hardware.
> +
> +      cri,mbx:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Pin this core instance to a specific mailbox instance index.
> +          Multiple child nodes of the same core type may each specify a
> +          different cri,mbx value to spread instances across mailboxes.
> +          When absent, the driver auto-assigns a mailbox via round-robin
> +          across the instances listed in cri,mbx-instances.

With the mailboxes converted to individual reg entries, this could
probably be handled via reg-names? If the reg name is "aes" or w/e, use
that mailbox for aes only, if it is $something-generic then it's
available for round robin assignment.

pw-bot: changes-requested

Cheers,
Conor.

> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        crypto@a4800000 {
> +            compatible =3D "cri,cmh";
> +            reg =3D <0x0 0xa4800000 0x0 0x41000>;
> +            interrupts =3D <1 2>;
> +            interrupt-names =3D "mbx0", "mbx1";
> +            cri,mbx-instances =3D <0 1>;
> +            cri,mbx-slots-log2 =3D <5 5>;
> +            cri,mbx-strides-log2 =3D <7 7>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            hc@2 {
> +                reg =3D <0x02>;
> +            };
> +
> +            aes@3 {
> +                reg =3D <0x03>;
> +            };
> +
> +            sm4@4 {
> +                reg =3D <0x04>;
> +            };
> +
> +            sm3@5 {
> +                reg =3D <0x05>;
> +            };
> +
> +            hcq@8 {
> +                reg =3D <0x08>;
> +            };
> +
> +            qse@9 {
> +                reg =3D <0x09>;
> +            };
> +
> +            pke@a {
> +                reg =3D <0x0a>;
> +                cri,mbx =3D <1>;
> +            };
> +
> +            drbg@f {
> +                reg =3D <0x0f>;
> +            };
> +
> +            ccp@18 {
> +                reg =3D <0x18>;
> +            };
> +        };
> +    };
> +
> +  - |
> +    /* Multi-instance: two AES cores on separate MBXes (future eSW suppo=
rt) */
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        crypto@a4800000 {
> +            compatible =3D "cri,cmh";
> +            reg =3D <0x0 0xa4800000 0x0 0x41000>;
> +            interrupts =3D <1 2>;
> +            interrupt-names =3D "mbx0", "mbx1";
> +            cri,mbx-instances =3D <0 1>;
> +            cri,mbx-slots-log2 =3D <5 5>;
> +            cri,mbx-strides-log2 =3D <7 7>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            hc@2 {
> +                reg =3D <0x02>;
> +            };
> +
> +            aes@3 {
> +                reg =3D <0x03>;
> +                cri,mbx =3D <0>;
> +            };
> +
> +            /* Second AES instance at core ID 0x06, pinned to MBX 1 */
> +            aes@6 {
> +                reg =3D <0x06>;
> +                cri,mbx =3D <1>;
> +            };
> +
> +            pke@a {
> +                reg =3D <0x0a>;
> +                cri,mbx =3D <1>;
> +            };
> +
> +            drbg@f {
> +                reg =3D <0x0f>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 396044f368e7..8b7187ea0194 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -375,6 +375,8 @@ patternProperties:
>      description: Crane Connectivity Solutions
>    "^creative,.*":
>      description: Creative Technology Ltd
> +  "^cri,.*":
> +    description: Cryptography Research, Inc.
>    "^crystalfontz,.*":
>      description: Crystalfontz America, Inc.
>    "^csky,.*":
> --=20
> 2.43.7
>=20

--tVV5lCAGuauPQznU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalC0JQAKCRB4tDGHoIJi
0lDOAP4lM7VqD2SV+kzpePgkDgsK+A4p1hJGMNL/A0QhQxSjSgD8C+6gZEUcIcPi
73MwrF0YJ8Q/LuZsV0RCYOPYGqMSIAc=
=1fAE
-----END PGP SIGNATURE-----

--tVV5lCAGuauPQznU--


--===============8467266887848405482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8467266887848405482==--

