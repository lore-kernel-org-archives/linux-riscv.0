Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83320EDE9A0
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 16:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jePemn6DPtMPRqZ7TzOP+Ity8GQ3N/lVeAG2hQtHCVo=; b=MYZ+jnCCGFhKf4sN94VStxwaFf
	nTHqa/W++7bYqnfH5wEL+gL17AFKNBrrk51yA+LhIglseMPffKZGX44E1hFwOYI5pPtrB2fjI29zj
	w5gr/s9uHE1P2/zD93Bf1L/bNJWLJj9Ws4Q6U1T2GM5vc7wEw/wAUdy0uJ6yrBe22olY/pVjaH3Lv
	5o+gLVvO7Kkzz/bS5ctZ7z2Aju69CVv+AxC8Wd+dtBivuIf4X9fWTwDZDVXTESF98Rf6gphgCDFi3
	ua5x54/1XZECdGfS/itSgrtrnmF8gLJwLkT5RsdNDXBWuVzRJL62WESQXfEksvXHTB6cJYIcK4oy1
	UUwrhb+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3V2-00000006IMl-2mi0;
	Tue, 10 Sep 2024 16:13:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3Uz-00000006IMM-3zjj
	for linux-riscv@lists.infradead.org;
	Tue, 10 Sep 2024 16:13:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5DAA7A4485D;
	Tue, 10 Sep 2024 16:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97733C4CEC3;
	Tue, 10 Sep 2024 16:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725984828;
	bh=dOdR3AQgsVyZSdcajtpHjcfvmfwJd54PfZ0HuKjzNEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MgyNizoF746o+zqMHs8s646fq8ley9zuXy4EFkWifAD6Cu/lxJbPvvvMPVfJa0/Sa
	 sTfoEzWXD3D6LH2ClrjDxj4aqvBCe+B+ScS9oIZMj9CPzhkJKmfpj3krvvu8rmbzLu
	 XWj65OOi7IYzjuz/a2An/EHqGn0qrFaXXVBSajydHd5M2eM5ccindUsfPBUyNinuAp
	 avgjOH11E5EkKDG0g7vVscCzp+900SR5nfyMK2f4MAryGjeXrrbkNlzLcRoudJRwud
	 c3bjVEFLmTc6onkATCF/hUEIXOZOA7/ce/Y88AIh3KPJIfkeHFRlsfmONv8he1Z8fM
	 QCiGe40jd0fpA==
Date: Tue, 10 Sep 2024 17:13:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] riscv: sophgo: Add pinctrl support for CV1800
 series SoC
Message-ID: <20240910-bust-mulled-e45f6f6ef29d@spud>
References: <IA1PR20MB495374DB8C4208575AAC9675BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240909-prowler-renewal-0592d820ccca@spud>
 <IA1PR20MB4953A0D6A2B73D03BF162671BB992@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB4953A0D6A2B73D03BF162671BB992@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_091350_079236_DD9FF0F8 
X-CRM114-Status: GOOD (  23.39  )
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
Content-Type: multipart/mixed; boundary="===============7948912563521054064=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7948912563521054064==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5rQtVXXUCRQ43X6+"
Content-Disposition: inline


--5rQtVXXUCRQ43X6+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 06:24:34AM +0800, Inochi Amaoto wrote:
> On Mon, Sep 09, 2024 at 03:41:10PM GMT, Conor Dooley wrote:
> > On Sat, Aug 31, 2024 at 06:38:40AM +0800, Inochi Amaoto wrote:
> > > Add basic pinctrl driver for Sophgo CV1800 series SoCs.
> > > This patch series aims to replace the previous patch from Jisheng [1].
> > > Since the pinctrl of cv1800 has nested mux and its pin definination
> > > is discrete, it is not suitable to use "pinctrl-single" to cover the
> > > pinctrl device.
> > >=20
> > > This patch require another patch [2] that provides standard attribute
> > > "input-schmitt-microvolt"
> > >=20
> > > The v4 version is from [3]
> >=20
> > Which version of this ended up in linux-next? I see a link to v4 in
> > what's been applied, but this v5 was sent before that code was
> > committed.
> >=20
> > Either way, what's been applied and what's here produce warnings:
> > cv1812h.dtsi:19.28-24.5: Warning (simple_bus_reg): /soc/pinctrl@3008000=
: simple-bus unit address format error, expected "3001000"
> > cv1800b.dtsi:18.28-23.5: Warning (simple_bus_reg): /soc/pinctrl@3008000=
: simple-bus unit address format error, expected "3001000"
> >=20
> > It's just a copy-paste error I would imagine, but please send a fix.
>=20
> Yes, it is like some copy-paste error, I will fix it.

I'd rather you had sent some follow-up patches, than rebase your tree at
this point in the cycle. I assume you hadn't yet sent that stuff in a PR
to Arnd?

Cheers,
Conor.

--5rQtVXXUCRQ43X6+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuBwNwAKCRB4tDGHoIJi
0t5rAP4upEEdJUW2Gc+Vage29OZ9yngrJUbqENkbK/Ej9TAbRQD+OLDBe2aZ8tIR
uI1kXbmhKJKXdKpQEDrMWeaxtnPUNA0=
=+P8k
-----END PGP SIGNATURE-----

--5rQtVXXUCRQ43X6+--


--===============7948912563521054064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7948912563521054064==--

