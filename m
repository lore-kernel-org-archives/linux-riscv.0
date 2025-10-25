Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D49CCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 12:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUWlfo6erST8R2Qh/HhiLZ1YI3BWMefEzsYNwaOXiN8=; b=aUs27MCR+Pvx12rab9bel1Gedc
	1VX+ySukOcqbJi1SsRXngYcv4iqDHf6xgA9iU8cPCbiXZFUUwhBs3xLfUL1IEvaGRGAgjbJz76AcR
	XbxzGb+H6uRtD2KBFdhDkkQE+6uvH2m/Y4xm7NfXyuBEij+r3YHa4wJ+rHm+arY083x960bOKscvZ
	G/5648rFu2WETH6A0dBdiHjDWlz9qAYCO2aJUOpBgZu94bMY6GudKfFPu1UqI/4yW8ILtIf/JHiql
	dkS+qrogEqHgap1jLolx79Scat456iz3JSSgbed5WSvPZ14EWMSVLE1Kw4ayURnRMrqF5fMRZhHnQ
	2kvuVsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCdcv-0000000BIYl-0RTN;
	Sat, 25 Oct 2025 12:44:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCdcs-0000000BIYM-2OSV
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 12:44:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBA124482B;
	Sat, 25 Oct 2025 12:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F2EC4CEF5;
	Sat, 25 Oct 2025 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761396245;
	bh=b5QpYMZmMe9U2UEWN9ko4/SOjOQwMOaP9+o4qUFvVF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0oqDjVDFfQ9fTKk4ScPbIJezjt4zWQx7Y4LueSWL7XLlQtXTsKp5EEg5EY+SOdTU
	 Z9243Me9Stozh4c3HL6aMqpqqo9NyhSYLavRmj0E5ZkuE90XkXhLL8EiNDMjN+QaqI
	 NcuOaZqWGJvQ8D22AGN8cnqxIuR6LGo5vd7dPHFXYJHCGTAfXob/I1JPK2jxR92GFB
	 wN5++uQ/4SJjxX4zc/u/eXvzFnITz9y1M9XqnAaolvyC2fJSdiaYaYa/dYgT5jxEoB
	 TRtcdej4/bEnyIMQaMSe2d525pjYuaidWNAW8iH01QCp+tEUOr8KqMe+q8s4O8pNK7
	 JvHNt+DTi5RlA==
Date: Sat, 25 Oct 2025 13:44:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20251025-shakable-jujitsu-3a5e9c8895a5@spud>
References: <20251024030528.25511-1-looong.bin@gmail.com>
 <20251024030528.25511-2-looong.bin@gmail.com>
 <20251024-hangout-designing-33e96c0d35fc@spud>
 <oymxspgopaqja63nipufgzn6kpobkdopemfaw3azhom3ikvk5f@e7cg4lq64j2o>
MIME-Version: 1.0
In-Reply-To: <oymxspgopaqja63nipufgzn6kpobkdopemfaw3azhom3ikvk5f@e7cg4lq64j2o>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_054406_646349_340793C4 
X-CRM114-Status: GOOD (  19.43  )
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
Content-Type: multipart/mixed; boundary="===============4117971463283129225=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4117971463283129225==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BNmCECBWFm1Puo0R"
Content-Disposition: inline


--BNmCECBWFm1Puo0R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 25, 2025 at 10:27:13AM +0800, Longbin Li wrote:
> On Fri, Oct 24, 2025 at 05:46:03PM +0100, Conor Dooley wrote:
>=20
> > > ...
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: sophgo,cv1800b-top-syscon
> > > +          - const: syscon
> > > +          - const: simple-mfd
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 1
> > > +
> > > +  ranges: true
> >=20
> > Do you actually use ranges?
> >=20
> > > +patternProperties:
> > > +  "dma-router@[0-9a-f]+$":
> >=20
> > Do these actually appear at variable addresses, or is it always 48 for
> > the phy and 53 for the dma router?
> >=20
> > > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> > > +    unevaluatedProperties: false
> > > +
> > > +  "phy@[0-9a-f]+$":
> > > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> > > +    unevaluatedProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - "#address-cells"
> > > +  - "#size-cells"
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/sophgo,cv1800.h>
> > > +
> > > +    syscon@3000000 {
> > > +      compatible =3D "sophgo,cv1800b-top-syscon", "syscon", "simple-=
mfd";
> > > +      reg =3D <0x03000000 0x1000>;
> > > +      #address-cells =3D <1>;
> > > +      #size-cells =3D <1>;
> > > +
> > > +      usbphy: phy@48 {
> >=20
> > Drop the labels off of these two, since they're unused in the example.
> >=20
>=20
> Hi,
>=20
> Thanks for the review.
>=20
> There are a couple of different opinions here.
> Could you please help confirm which approach is preferred here?
>=20
> This is Rob's reply:
> https://lore.kernel.org/all/20251015134144.GA3265377-robh@kernel.org/

I don't think that Rob and I disgree about the example, having child
nodes is good, having the label on them is what I don't want.

Re: the child node patterns, I was not looking for a return to what Rob
didn't like, but rather a move to just making them normal properties
rather than a pattern, if there's only one possible address.

--BNmCECBWFm1Puo0R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPzGCgAKCRB4tDGHoIJi
0hKmAP9wppNOTqUcMNHIzevx1pK2MIBbfFM0ow0FlUnLwre+jAEA+1Y1ihrGIpfc
64g6hgbEVSbSRUo+VAr3/aMAaFlHdQo=
=AyBe
-----END PGP SIGNATURE-----

--BNmCECBWFm1Puo0R--


--===============4117971463283129225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4117971463283129225==--

