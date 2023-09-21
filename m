Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8718EE706F2
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 08:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciaVIm7dTCC3hilqd5N3+GCG6o/26wEqqSZ3OkKyGYY=; b=Xvdtumixg0ZzzFwHAKdvJTq5fV
	nMm7uVH8IeZu/bXJD64dm0caxdHhgDmjPgzW88TdDXoO94YrYR4AvAc1FmE2dH6Uc+Y7ZDjq983WF
	9NY7nloGpOhawnXcfi6kJcjbDj+pGtuGgk2b74bCGsycInNO4aUSylg2Z2QmE/fyQ9WRQvpElJR86
	AinGthWlZCsz3AacjUnmiPx70XzRLrYmqvuyeKY1QYjXKTNW5dLWLrroCH47yhDuqTH79ffygbS2H
	DvBFN2j0SfkRGFp13X5ZDHLwnVTGQ+WeKkchW5eTgdAlK4Bv3llR0YSsxKersuHfG/rDHpd8Wk0xQ
	W/9ufb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFPx-005Wa7-2b;
	Thu, 21 Sep 2023 08:52:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjFPv-005WZY-1M
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 08:52:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id BAB1BCE1C1F;
	Thu, 21 Sep 2023 08:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A636EC116D7;
	Thu, 21 Sep 2023 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695286328;
	bh=SBD9ZzEicd22ZDdkZ70qDAja5Op34wmz8fwnbFCDoPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjYj8FDDXuN2U5Mf1F2HHeaNdS4oKHVT6ICoyBQiXFpyhdXpn6eY2PcewMf1EnIXn
	 3VFwNdTQa97TsGvLsMM9F98Bmhgfy7ySgyJwpQYGGrd/8vwFY5rnQ7kVj9bI1esag0
	 BPnZgsSOX34n/33Uq/bk7QHf5LXLHBGhiGMirfPth7XNf6+VCnUfVyT6B0og9+b/XI
	 PHAbVrkIk1IqIhRPx5v79iYkbOQN6PBkxOfY5ORVfwgD9i3bd/o18+VpAaEt1o5v+4
	 AVP6806Ei5gD184AnQEkElKbONar700d2uIve8zeAn3AbrcZogBCxzvKDdVt4ovNiM
	 rzJc7gy8/TMfg==
Date: Thu, 21 Sep 2023 09:52:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	evicetree@vger.kernel.org, emil.renner.berthing@canonical.com,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Message-ID: <20230921-dbfb0a62538cc54852ad45b4@fedora>
References: <20230921-d7bab3f036e498a23eb6b578@fedora>
 <PH7PR20MB4962478C50534722C16B17DDBBF8A@PH7PR20MB4962.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH7PR20MB4962478C50534722C16B17DDBBF8A@PH7PR20MB4962.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_015211_808160_3AD1BAA7 
X-CRM114-Status: GOOD (  25.60  )
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
Content-Type: multipart/mixed; boundary="===============8743300496667865585=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8743300496667865585==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3QkateNXglw3SC16"
Content-Disposition: inline


--3QkateNXglw3SC16
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Thu, Sep 21, 2023 at 04:18:57PM +0800, Inochi Amaoto wrote:
> >On Thu, Sep 21, 2023 at 08:43:47AM +0800, Inochi Amaoto wrote:

> >>>>>> but not one. In another word, there is no need to defined mtimer a=
nd ipi
> >>>>>> device on the same base address.
> >>>>>
> >>>>> There's also no need to have two compatibles for the same interrupt
> >>>>> controller, so I do not get this reasoning. What actually _requires_
> >>>>> them to be split?
> >>>>>
> >>>>
> >>>> Yes, it is one, but can be mapped into different address. So I think=
 we
> >>>> need two.
> >>>
> >>> Not two compatibles though, just two memory addresses that you need to
> >>> locate (or maybe even 3, for SSWI?)
> >>>
> >>
> >> We may need four (mtime, mtimecmp, mswi, sswi) if use register range.
> >
> >Why would you need 4? The first two certainly could be individual
> >reg entries, no?
> >
>=20
> After reading the aclint doc again, I found the all of them can be mapped
> on the different address. (See the section 2.1 in that doc).

Right, that's what I meant by individual reg entries. If there's some
dynamic gap between them, then one reg entry would cover mtime and one
would cover the base of the mtimecmp region.

> But for now,
> the mtime and mtimecmp have the same base address in any platform.

How? The mtimecmp base address would have to be offset from the mtime
base address. Is what you mean that, for example, mtime is at an offset
of 0x0 from the base address & mtimecmp0 is at, for example, an offset
of 0x8 so a single reg entry can cover both?

Also, "any platform"? I figure you mean in this one specific platform?

> Anyway,
> the frozen spec in future will decided how many ranges we need.

Isn't the spec abandoned? There may well be no frozen spec.

> >> Anyway, I will use a vendor spec implementation as a temporary solutio=
n.
> >> I hope this will be corrected in a predictable future, and we can use a
> >> standard way to resolve this at that time. :)
> >
> >If the spec doesn't get frozen, there'll not be a standard way merged.
> >Hopefully not too many others go off an implement non-frozen specs, and
> >we will not really need to worry all that much about it.

Cheers,
Conor.

--3QkateNXglw3SC16
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQwELgAKCRB4tDGHoIJi
0mFBAQDD7fMHX5wOXYvk1hooV2cLDyyw+SAUv7OJKgltZw/Y1AEAlXgGk+Kx3Gm4
Kh/W9kwPQFTcI0GL2em5xAh5VCoPSw4=
=tkZX
-----END PGP SIGNATURE-----

--3QkateNXglw3SC16--


--===============8743300496667865585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8743300496667865585==--

