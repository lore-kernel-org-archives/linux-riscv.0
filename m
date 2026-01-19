Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41594D29C50
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 18:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHVYeFVD3Rey7yvnsORwzL0WM+4FEKLMkNd0xa7zOKw=; b=B1E1Uj5EBgk3nLM9IxTKYcAJ16
	KaWs5j1XUOVerfhmCywBq6pH8ZYHDqN7rSAI96sD0/D7L8C3X7F9HAIiQVpESPqksVAS+QS+2h7al
	g7KGBTj4QPPbKscpxRjdCBjl0dA/cwrAbNjkn1aNeYmxgIwJW5IX1YWW/3rT7kYHrWsqQulzICRyC
	THxRJu03XmF33YI/gWztGCH78PFpDUJgO7v8ppe02flclZoa4/TbZ+Pv3b/u4sOUnT+5cBY3qRS2f
	NP1GEkUa0yK2rJHUVWFxCGRCZfwm0p9+a+lJGe7tQ0zfo1OvcKYbsNlYc9OAbyanT8wiEtcASsDd7
	0ij9wF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtkW-00000002h5O-3HrK;
	Mon, 19 Jan 2026 18:13:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtkU-00000002h4m-0aZA
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 18:13:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4741440D6;
	Mon, 19 Jan 2026 18:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87FCC19422;
	Mon, 19 Jan 2026 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768846388;
	bh=+GPrc+VC5LhsvUwvuFMDOJQ8WEkZu6sQfESCubnoKsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHzmDsSbOquj5RyNUjRMRTb54VBQw8JpU6rHan4MVuZmcusPLy8ngI7hZx/0nPXlK
	 WAYONRXcsqBHimnRy7J/VuRLmNS7g8g7r6OsQ5LGF04bnkHDJrRdwrw1yMht2Gl1Mw
	 mrUNbBQWK1OsK8ScQxwbeejq9zYZx/aJ5sux+6dMCS0QxKZIdPvd4FNB1WVkdp3erb
	 ITuiT1Js8BrGzbZP/kBUdiu39Mk2A1HhuzC7+RtVvZdeGq5ohq8LjEvmZu301PXjtL
	 c5ER6DuBO7ATfLdbwhYG3m7RXPSXbv189ZMcucPKv/Gt8DVXz2YgA9Dchh8XrQZvNa
	 M9iLJeF4H/roQ==
Date: Mon, 19 Jan 2026 18:13:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: canaan: k230: Add "b" ISA extension
Message-ID: <20260119-parcel-overtly-2621c4069f13@spud>
References: <20260118-k230-ext-b-v1-1-6a63616b11cc@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20260118-k230-ext-b-v1-1-6a63616b11cc@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_101310_202377_81CD10BF 
X-CRM114-Status: GOOD (  13.10  )
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
Content-Type: multipart/mixed; boundary="===============4898841081831589947=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4898841081831589947==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oPma+Hg1nyREzzym"
Content-Disposition: inline


--oPma+Hg1nyREzzym
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 10:25:07PM +0800, Junhui Liu wrote:
> "b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
> (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> checking rule is now enforced, which requires that when zba, zbb, and zbs
> are all specified, "b" must be added as well. Failing to do this will
> cause dtbs_check schema check warnings.
>=20
> According to uabi.rst, as a single-letter extension, "b" should be added
> after "c" in canonical order.
>=20
> Update k230.dtsi to conform to this rule. Also synchronize "riscv,isa"
> with "riscv,isa-extensions".
>=20
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
> Based on Conor's k230-basic branch and rebased to riscv-dt-for-next.
>=20
> The commit message and implementation are adapted from Guodong's patch
> for adding the "b" ISA extension to multiple dtsi files.

Applied to my k230-basic branch.

--oPma+Hg1nyREzzym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW50LQAKCRB4tDGHoIJi
0lyVAPwIyMt9V+9/RQXQI3699dzt8Z/BHQtTcQpwEb/azVM2zQEA1DJemeolcjLQ
6fgw6pCmq1lhCiCd1FcY21oaoE4X6AY=
=blkV
-----END PGP SIGNATURE-----

--oPma+Hg1nyREzzym--


--===============4898841081831589947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4898841081831589947==--

