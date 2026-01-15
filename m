Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C143CD44C63
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MK8Sy3djuCFI/oBQwx+HOvdBIt9FReg+7HD3sxs2GQ=; b=vIPEnVhBKKod9gVskUr2Md4NYS
	G+QLmRuJrTrVxXmu+/NhiaGKCPaj23pq5zzMV2EznZoAAYBWHDv9pJsHXFe8pdknWUYfLjUj4ePq3
	uCu70uaev8TiC6vIDe2iL05foUDf40g0/45LhKIuXhYOry7aLF2fLuZZLF01UiA8/UOM9OTDpf3jU
	gM4fEqKtzJSEF3RepDSMlgITpL/UXTrwzFbl8tzK9Prlv8y+W5eRj1nDPxxoKQYIujNEP3n3Feicv
	F4HIKdOpyezLJr4Wat7zebY+9eZxVZ5pEEsfgseVtxmWczBMXx0kxM9w1R1uJ1PvfH3aw1I8BS5Ob
	lMDRSUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPG4-0000000CbD5-3PFz;
	Thu, 15 Jan 2026 15:27:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPG2-0000000CbCJ-15tH
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 15:27:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28F74443CC;
	Thu, 15 Jan 2026 15:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E63C116D0;
	Thu, 15 Jan 2026 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768490853;
	bh=Wur3o2dVRvtFukmxpf5IOeXOF/T53+5j3g9hFxdzOMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GnQBs7w0yy1tfgRWifeXHjbgqvLHnNGjgss9K4gkC1/N2HxiDMCtSAdga3AbVWDjK
	 TqD2UsvpeMV9CTbWb3Gt2k5ynuwgpOAW8PJQ7S7tS5v/A5kBvkP19yvB5bW2GZGdqT
	 xPpfGKO26CotbeFDWrFPmtvxAGB9fHOw8YWZQP9ba7H4S9rVdkFXBb+luKqbVqPJlu
	 IwQNsAsWhbcebpD+9OwB+MCrWlcq53c0Uqx9Z7tSvJeRrJmPiUbYSamLJe3TD0XHWJ
	 4N/36aXzWGxNKTegsb+7Lk05obpB4LA3C/m9GAOullsN7XLt2KtF8ZNEyBNEh1bj6t
	 hSeNcvG1Rv1CA==
Date: Thu, 15 Jan 2026 15:27:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
	krzk+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, cyy@cyyself.name,
	dlemoal@kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: canaan: add 100ask K230
 boards compatible strings
Message-ID: <20260115-vending-statistic-9db5bd1829ec@spud>
References: <20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115060801.16819-2-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115-muscular-oxpecker-of-typhoon-bbe46f@quoll>
 <aWjTl2g11WNc3gvT@duge-virtual-machine>
MIME-Version: 1.0
In-Reply-To: <aWjTl2g11WNc3gvT@duge-virtual-machine>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_072734_316851_AB38C0F5 
X-CRM114-Status: GOOD (  15.00  )
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
Content-Type: multipart/mixed; boundary="===============6483763444438487305=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6483763444438487305==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RHQdXFgtwHzoIDTw"
Content-Disposition: inline


--RHQdXFgtwHzoIDTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 07:46:31PM +0800, Jiayu Du wrote:
> On Thu, Jan 15, 2026 at 10:30:35AM +0100, Krzysztof Kozlowski wrote:
> > On Thu, Jan 15, 2026 at 02:08:00PM +0800, Jiayu Du wrote:
> > > K230 CANMV DSHANPI is a development board produced by 100ASK.
> > >=20
> > > Add compatible string for the board and its SoM.
> > >=20
> > > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> > > ---
> > >
> >=20
> > <form letter>
> > This is a friendly reminder during the review process.
> >=20
> > It looks like you received a tag and forgot to add it.
>=20
> I will add the Acked-by/Reviewed-by/Tested-by tags in v4 version.

I'll go fetch them, unless you have to send a v4 for some other reason.

--RHQdXFgtwHzoIDTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWkHXwAKCRB4tDGHoIJi
0nwbAQDzZ9FYbCw+oGQhoDJsBx3HzcV8KP6JDAv8qXYPFQtNHgEAmqYI/+pPMizU
R2g7nz5SHM2GTQ9uzmXTiSXshrHz9Q8=
=YSPA
-----END PGP SIGNATURE-----

--RHQdXFgtwHzoIDTw--


--===============6483763444438487305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6483763444438487305==--

