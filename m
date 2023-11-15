Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFF3CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIe9HYb3dm3vbYKXQBXQlpUfiwPyXNbZbRVpVlEOUpQ=; b=NzXSOjfeKC+oRyhiYKD46R1E3p
	n+Vo5VHr/9lDWCzrIxXd71elxF4RbP1ixp6r/BNoUJQaqmtbmzflONEusuL4NgL1bcgAkXRlbhrrG
	IopgNwFw5RywlteVOcmHeCdX40apW7afBIl5c9nH7JwHiRmb/hMpU+Nd4EtGC3Hg4K1YeZxPR9Bo2
	kaZ00N+dDpjFHVyA/zygIVnMQcu1OM/DkrcNxnkxkY1SJSysm0sKyO3p27ofQ2tHYwAC8m438N91G
	2ODvPQ3D5kpAsI4wUyhk6/HjFTZOgzbdntcL0GKPYAkHMztpvHMsNwpIaX2h5V9OgS6EfMUHW3+zc
	N6KkR1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HPT-00170m-0z;
	Wed, 15 Nov 2023 15:02:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HPP-0016ze-2d
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 15:02:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1F63DB81982;
	Wed, 15 Nov 2023 15:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DD0C433C7;
	Wed, 15 Nov 2023 15:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700060545;
	bh=1uBxQWcMUMhx7JwMi2EAENFmweyIXNrXqQTDSAkq8nU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=srOc4P2LWfKIwfv3lfqYZiy95RzCY0dyWse6TKe7qf+1CFAXQ4diGZ8GNMoksbLex
	 Fc7IpHozB6Yg8emHwCVl32wXEf4eZItb0SbtMTSOp+NQu8GGeFM4/4sLUCMWH7K7KZ
	 MH3m6a5ki5p0RTcZ9cwNX9b7V+MNhd73uy/fpwiDTGybt/g9glJ8oG6PC52xGG8bma
	 SGMCUoM0jD9hhG7DW34+WkgBcHGMEaZSEkoNkc/H1z+P255AgsNUqKZslSWIDYx5xa
	 kvoSo+fPvAL0FoRQtzE7YR8y+AdFLi5ANZn+N0pJUljM5R29QuN9lXaRiXeMrPtLYz
	 ogcNOzJJmIL8w==
Date: Wed, 15 Nov 2023 15:02:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: reset: Add binding for Sophgo CV1800B
 reset controller
Message-ID: <20231115-upward-unsworn-7746e0aeb5dd@squawk>
References: <20231113005503.2423-1-jszhang@kernel.org>
 <20231113005503.2423-2-jszhang@kernel.org>
 <44f21244-5bf1-4e0f-80a9-6ec76d65eea4@linaro.org>
 <ZVTHMsXaPdHiuUOF@xhacker>
 <80e28d77-4a0e-4827-91c0-951094176bbd@sifive.com>
MIME-Version: 1.0
In-Reply-To: <80e28d77-4a0e-4827-91c0-951094176bbd@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_070228_138331_B70DCACE 
X-CRM114-Status: GOOD (  32.89  )
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
Content-Type: multipart/mixed; boundary="===============4614622579880846174=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4614622579880846174==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sQsiKWp4mGkRvLKL"
Content-Disposition: inline


--sQsiKWp4mGkRvLKL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 09:56:07AM -0500, Samuel Holland wrote:
> On 2023-11-15 7:27 AM, Jisheng Zhang wrote:
> > On Tue, Nov 14, 2023 at 10:12:35PM +0100, Krzysztof Kozlowski wrote:
> >> On 13/11/2023 01:55, Jisheng Zhang wrote:
> >> ...
> >>
> >>> diff --git a/include/dt-bindings/reset/sophgo,cv1800b-reset.h b/inclu=
de/dt-bindings/reset/sophgo,cv1800b-reset.h
> >>> new file mode 100644
> >>> index 000000000000..28dda71369b4
> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/reset/sophgo,cv1800b-reset.h
> >>> @@ -0,0 +1,96 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> >>> +/*
> >>> + * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
> >>> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> >>> + */
> >>> +
> >>> +#ifndef _DT_BINDINGS_CV1800B_RESET_H
> >>> +#define _DT_BINDINGS_CV1800B_RESET_H
> >>> +
> >>> +/*				0-1	*/
> >>> +#define RST_DDR			2
> >>> +#define RST_H264C		3
> >>> +#define RST_JPEG		4
> >>> +#define RST_H265C		5
> >>> +#define RST_VIPSYS		6
> >>> +#define RST_TDMA		7
> >>> +#define RST_TPU			8
> >>> +#define RST_TPUSYS		9
> >>> +/*				10	*/
> >>
> >> Why do you have empty IDs? IDs start at 0 and are incremented by 1.
> >=20
> > there's 1:1 mapping between the ID and bit. Some bits are reserved, I.E
> > no actions at all. Is "ID start at 0 and increment by 1" documented
> > in some docs? From another side, I also notice some SoCs especially
> > those which make use of reset-simple driver don't strictly follow
> > this rule, for example, amlogic,meson-a1-reset.h and so on. What
> > happened?
> >=20
> > And I'd like to ask a question here before cooking 2nd version:
> > if the HW programming logic is the same as reset-simple, but some
> > or many bits are reserved, what's the can-be-accepted way to support
> > the reset controller? Use reset-simple? Obviously if we want the
> > "ID start at 0 and increment by 1" rule, then we have to write
> > a custom driver which almost use the reset-simple but with a
> > customized mapping.
>=20
> There are two possible situations. Either the reset specifier maps direct=
ly to
> something in the hardware, or you are inventing some brand new enumeratio=
n to
> use as a specifier.
>=20
> In the first situation, you do not need a header. We assume the user will=
 look
> to the SoC documentation if they want to know what the numbers mean. (You=
 aren't
> _creating_ an ABI, since the ABI is already defined by the hardware.)
>=20
> In the second situation, since we are inventing something new, the numbers
> should be contiguous. This is what Krzysztof's comment was about.
>=20
> For this reset device, the numbers are hardware bit offsets, so you are i=
n the
> first situation. So I think the recommended solution here is to remove the
> header entirely and use the bit numbers directly in the SoC devicetree.
>=20
> It's still appropriate to use reset-simple. Adding some new mapping would=
 make
> things more complicated for no benefit.

Further, I think it is fine in that case to have a header, just the
header doesn't belong as a binding, and can instead go in the dts
directory.

--sQsiKWp4mGkRvLKL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVTdegAKCRB4tDGHoIJi
0r6fAQCPXMjSpES01q/k2sT0z3umMcWMIpUKT/3X4UCvd/SghQD/aYjlcWbc34J9
1xUWupmleFR685Yebdp5rF6SeyZccAI=
=siUt
-----END PGP SIGNATURE-----

--sQsiKWp4mGkRvLKL--


--===============4614622579880846174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4614622579880846174==--

