Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C02CC25B78
	for <linux-riscv@archiver.kernel.org>; Sat, 25 May 2024 10:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeeDapd5KMuEavmaCJMoOQZNcMC3HQoK0iG6Ql5+FNo=; b=Ua455KI7YY3Odx/LMcr6/a5Ywp
	K9rnKcXbFawPHGoEzoEqTRCDzrR6J7NcOwssV8JCccxltJ87Fb6gYg5VRM7IKoKMlL7hNiiusPfko
	ICU3/+QhwfCSCJfIXAYm2qYErCQlMk92KWgbsglbTR5srnYwDXf1wlmRYzoPUiHPvGYjtiqMn559h
	jL56FFRl1SjRhu/LRAGthFC2faolxRY3VVwRY12iPiF8D1z/vGLZJJxTlWGtTbBbVnVhKpnsyqJP5
	8yPoUY1IdxFAvE+lXnaXs73tkEYoh++PYv2MOhJKMOQJSdC7474JXR71NcxasE09I9yqkP8JmHBZV
	Vblgto+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAoV2-0000000AkOA-0fL5;
	Sat, 25 May 2024 10:19:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAoV0-0000000AkN0-0DPs
	for linux-riscv@lists.infradead.org;
	Sat, 25 May 2024 10:19:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1375CE0286;
	Sat, 25 May 2024 10:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5271C2BD11;
	Sat, 25 May 2024 10:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716632371;
	bh=GEtQE9d8Yn1WvXllKSgrZAhXcyiUxoBo9ZbhfRtOF2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0xqV3dQMCnGMnVF1dKyC6o567uZNkhV9rPMRa1BsN4v9VsV41MeN1V5nM6HoxE6N
	 VCc9V+Aa1Wa8Wt16A2rY3Qqrc7LQAkiOwo6cxY+WLyKaQ7CD2ZZLu6RDE9CQr/RKqh
	 0yGV2AY+BLzQy6oq7enrmiAxA+UmuPmsKhd2JhOopkY0g21ecgPTqyAY/4dTJDSFpQ
	 G4HnjAiFlSE2/dwI9ANZ5pHp+Gb6BhOfmN37ES8miFvF6ML22/t4jGpsUjQ8Uu4GPz
	 +IoaUYawKJ5FZhDfCHzdI9frEtMP6DyQfpC5zp9rScPEB3ynza7CHbxbQ89pkBD+HM
	 JIFB9BdsM5oTw==
Date: Sat, 25 May 2024 11:19:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Henry Bell <dmoo_dv@protonmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RISC-V: add Star64 board devicetree
Message-ID: <20240525-dumpster-bootlace-10123081a6f2@spud>
References: <IPHlm5mOKUzYfwGy0auyufx-oPkSrtQjUjiQLbtvspD69UPX9O98iB8P2mqM8ahNaerz0yUa009f4XABRniq7aj2PUp83hbRVVhhKmqT0Ss=@protonmail.com>
 <1b55aad1-1442-41a5-acc6-16baab90c021@web.de>
 <caCBlFpvjmhO9G1A1_2qHImmuoGai2NoPYonB5RCVftq4zIrSxlP8Msh9z_FX9GwQXzfSrB40dRxy1zfxZesOJENeebWQsERa03sDvArzec=@protonmail.com>
MIME-Version: 1.0
In-Reply-To: <caCBlFpvjmhO9G1A1_2qHImmuoGai2NoPYonB5RCVftq4zIrSxlP8Msh9z_FX9GwQXzfSrB40dRxy1zfxZesOJENeebWQsERa03sDvArzec=@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_031938_305582_164107BB 
X-CRM114-Status: GOOD (  11.81  )
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
Content-Type: multipart/mixed; boundary="===============2786720126284364208=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2786720126284364208==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zBnxnZGrJKN+COkR"
Content-Disposition: inline


--zBnxnZGrJKN+COkR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2024 at 10:12:01AM +0000, Henry Bell wrote:
> On Saturday, May 25th, 2024 at 9:37 AM, Markus Elfring <Markus.Elfring@we=
b.de> wrote:
>=20
> > =E2=80=A6
> >=20
> > > The board features:
> >=20
> > =E2=80=A6
> >=20
> > Would you like to add an imperative wording for an improved change desc=
ription?
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.9#n94
> >=20
> > Regards,
> > Markus
>=20
> I'm happy to change it, but was going off the format used in Conor's  Mil=
kv Mars commit
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?i=
d=3D04a228aadb84d894721b13197649ca741f3018bc

Don't worry about Markus, most maintainers (myself included) ignore his
comments on patches. The commit message here is fine.

Thanks,
Conor.

--zBnxnZGrJKN+COkR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlG7LgAKCRB4tDGHoIJi
0g1DAP0cerJgoJ1QbePZ3OIiXM8U1sbG7LwZOTp2PBWIHtGoqwD/Y2XdrtdG2baF
6xx9pkdHbSMu4P+OVp3QvNjcguSVaAU=
=DDPZ
-----END PGP SIGNATURE-----

--zBnxnZGrJKN+COkR--


--===============2786720126284364208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2786720126284364208==--

