Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A556ECDE001
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xz7BPjDqngsXmlMnXFt5BLslwoWI6f5af91WAtbOu0g=; b=J4PfIcJIlAK3KXKyld43UNe7dI
	5y2Za49QU5xZtAqOR1pnU+Dl7q25KPbILWKGdzb8p1OV3qnzqVYSgVAy0BGqiZmiHP+R0GuQVZ21J
	GI+geBq+k4kkHDogt9SgOEjg7ZX6CJGeZFemrwq/6owpHSXeG66A0QW9VFlxAA9mD06Sf07XJP4W7
	+q7ar9Av/V44D25BCpfm7WyNstqn4vTTYA7oay5f9Hj668KKjUsXQVrIo6kScJglZOTOrnl0XTHpc
	ssftJ9itposkKPAixkK7jxuHr5NNhQwl1Gx6EQp9HlD6vaxwI8jO51Kx/2Poq4/U4cBliS3bzDo/9
	bNKnV/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmnk-00000009SvC-10tx;
	Thu, 25 Jun 2026 16:19:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcmni-00000009Suv-3qRL
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 16:19:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E96B600AE;
	Thu, 25 Jun 2026 16:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC171F000E9;
	Thu, 25 Jun 2026 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404377;
	bh=7YcMVVY3Ngo1QA2QA4VNeE39obuNmOZ0bZLp0deFa4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GtWTdtpBtJaqqhntdx94UBquSGkQICKW/35LtX6FCenrEFQOyrhP84qGQESOlDQMt
	 Z9LIvY5aXOX6SoaXq+xSAzSJD5sFsuPQEa1y6fVPdQJSFUMo7/orxM5U2/YWwXt6M9
	 CpCNjZIw8p27gyJJtmV+DODPhEK+LlamOOUcQIT5Xtp4bjswlX3r7gYwJAnmM9ud/B
	 4zUYWLNSXP2DM4cGiVm89nf7zweBbJS1rksQ1qj9fTKrAKhZ0SUb/3yUqGQKeQPrle
	 tiMGmj9jRNQbb7eqYg+G/2mRp2ndZM6+jqbLXLHxlRvW3NweSnGfDA1sJZDs+YnhYq
	 syY9nXn1Ozf9A==
Date: Thu, 25 Jun 2026 17:19:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: riscv: Add generic CBQRI controller
 binding
Message-ID: <20260625-cupbearer-failing-9ce0abf97b93@spud>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-7-2f8049fd902b@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260624-dfustini-atl-sc-cbqri-dt-v2-7-2f8049fd902b@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============1130493442845922334=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1130493442845922334==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iqz6WzvFJ9B9C8aq"
Content-Disposition: inline


--iqz6WzvFJ9B9C8aq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 06:38:35PM -0700, Drew Fustini wrote:
> Document the generic compatibles for capacity and bandwidth controllers
> that implement the RISC-V CBQRI specification. The binding also
> describes the common riscv,cbqri-rcid and riscv,cbqri-mcid properties,
> and the optional riscv,cbqri-cache phandle that links a capacity
> controller to the cache whose capacity it allocates.
>=20
> Assisted-by: Claude:claude-opus-4-8
> Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  .../devicetree/bindings/riscv/riscv,cbqri.yaml     | 97 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 98 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml b/D=
ocumentation/devicetree/bindings/riscv/riscv,cbqri.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..5d6be645381780e187b39e60c=
3bb487fdf2cfb69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/riscv,cbqri.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Capacity and Bandwidth QoS Register Interface (CBQRI) cont=
roller
> +
> +description: |
> +  The RISC-V CBQRI specification defines capacity-controller and
> +  bandwidth-controller register blocks that allocate cache capacity and =
memory
> +  bandwidth to resource-control IDs (RCIDs) and monitor usage per
> +  monitoring-counter ID (MCID):
> +  https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.pdf
> +
> +  Allocation and monitoring share one register block, and a controller m=
ay
> +  implement either or both. A driver discovers which at runtime from the
> +  capabilities register, so the compatible names only the controller typ=
e. It
> +  does not distinguish allocation-only, monitoring-only or combined
> +  controllers, and no property declares monitoring support.
> +
> +maintainers:
> +  - Drew Fustini <fustini@kernel.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - description: Tenstorrent Ascalon Shared Cache
> +            const: tenstorrent,ascalon-sc-cbqri
> +          - const: riscv,cbqri-capacity-controller
> +      - enum:
> +          - riscv,cbqri-capacity-controller
> +          - riscv,cbqri-bandwidth-controller

Please modify this, as has been done for other riscv spec related
bindings, to let people get away without using device-specific
compatibles.

In this case, you can just delete the first entry from this enum, since
it already has a user and only have to implement this feedback for the
second entry.

pw-bot: changes-requested

> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The CBQRI controller register block.
> +
> +  riscv,cbqri-rcid:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The maximum number of RCIDs the controller supports. RCIDs are the
> +      resource-control IDs that allocation operations target.
> +
> +  riscv,cbqri-mcid:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The maximum number of MCIDs the controller supports. MCIDs are the
> +      monitoring-counter IDs that usage-monitoring operations target. Pr=
esent
> +      on controllers that implement monitoring.
> +
> +  riscv,cbqri-cache:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the cache node whose capacity this controller allocates.
> +      Applies to capacity controllers that back a CPU cache. The cache l=
evel
> +      and the harts sharing it are taken from that node's cache topology.

Architecturally, is it impossible for a capacity controller to control
more than one cache?

> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: tenstorrent,ascalon-sc-cbqri
> +    then:
> +      required:
> +        - riscv,cbqri-rcid
> +        - riscv,cbqri-cache
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    l2_cache: l2-cache {
> +        compatible =3D "cache";
> +        cache-level =3D <2>;
> +        cache-unified;
> +        cache-size =3D <0xc00000>;
> +        cache-sets =3D <512>;
> +        cache-block-size =3D <64>;
> +    };
> +
> +    cache-controller@a21a00c0 {
> +        compatible =3D "tenstorrent,ascalon-sc-cbqri",
> +                     "riscv,cbqri-capacity-controller";

Is this or is this not a cache controller?
The compatible and fact that the property points to an actual cache
controller suggests that this is not.

Cheers,
Conor.

> +        reg =3D <0xa21a00c0 0xf40>;
> +        riscv,cbqri-rcid =3D <16>;
> +        riscv,cbqri-cache =3D <&l2_cache>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9e1092165046c773771b055869030bc1bdb64b16..64a95a4d795a57033d3f36200=
d98cfb4a013ab94 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23298,6 +23298,7 @@ M:	Drew Fustini <fustini@kernel.org>
>  R:	yunhui cui <cuiyunhui@bytedance.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> +F:	Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
>  F:	arch/riscv/include/asm/qos.h
>  F:	arch/riscv/include/asm/resctrl.h
>  F:	arch/riscv/kernel/qos.c
>=20
> --=20
> 2.34.1
>=20

--iqz6WzvFJ9B9C8aq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1VEAAKCRB4tDGHoIJi
0lXeAP4nYfY2HRKImG27gD+aSFjrJ2tV6sAdxhmJWyh1+AnCrAEAk6PNQ5SjX5nW
VK2mq7VQ+4K/2o7w6hvbd2oKNvn30ww=
=ZHZW
-----END PGP SIGNATURE-----

--iqz6WzvFJ9B9C8aq--


--===============1130493442845922334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1130493442845922334==--

