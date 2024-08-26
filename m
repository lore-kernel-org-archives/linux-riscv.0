Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9DFC5321E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywigMO9tdr+QoorJipmnXGhJvTYfuycKrmoqFNFoo7c=; b=yjvWAa/2SaeF+MNeARqYMHJ9X2
	BNlHRJHd5H3gmgcQ1BIcUnCj3rCbrdhkrUg8kUf9FPJRyfWQAibbqXOR1w4zEHTcUd6yo/zVPyX22
	vu4NB2h9ExOFfcutN+53aJrSWBc1q+Cm4WmDN5BSuLiK+iOpnt7Ore3gkP3tWFDaExpAqHUtRv2qc
	D4vZUjyRscLRYIo6ZYZ0VioGcKgyaMtXVqwQczufksGVaZG3tLxgBinZjwENPzioP1yBIl1T9+Dpe
	TA7DFPsJQq0Lh0wQziYJqEIgUFFkWhdX6uUz6bZh0MY9g6iPsDRt38OMSBLQFxXEby6hnnbQZ3kTj
	r2wBua7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sicU0-00000007ynQ-1vdx;
	Mon, 26 Aug 2024 16:22:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sicTx-00000007ymw-1gq1
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 16:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A0D85A414A8;
	Mon, 26 Aug 2024 16:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4C2C52FC0;
	Mon, 26 Aug 2024 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724689336;
	bh=+RTZMx1fzQdb+R5GnKXIaBS0hVNREfRA+TCS9zcwgbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LyvyOAvDft8diKLOLUx20hHBgtJRj7WlrqbidunMWHGD5BOLkxHTL5o6fY7yT8Gs3
	 DcJbKbnMLgpQyKVvdKGc+flE6lxPFbG4P0K0SNVPn0k/RvbWGO7OgbK/ZEUEIXPd07
	 3E8i+1Nn+9ESLgGww9YjjHr/qrJNLORNHmJQnc5Q5i/Pu3vwPCVJj8Wi3ZYrjR13xc
	 JXCO18OxLNbPaGkIjKdBoOi2U+nPIHr5ipkRWEOmayOa6pyxygSEF9rKm3KsFZG+zZ
	 MjC99H2cFwabwar8EGqf8u7eQG4DStn4QbAn20rnKOmdIwhuoC2NLavgyHVMV4AkM+
	 5264DWAfuAyZQ==
Date: Mon, 26 Aug 2024 17:22:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents for
 K1 SoC
Message-ID: <20240826-turbofan-unwound-280af18d60cc@spud>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
 <66cbf3bb.050a0220.2632ed.b191SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <66cbf3bb.050a0220.2632ed.b191SMTPIN_ADDED_BROKEN@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_092217_587773_C206701D 
X-CRM114-Status: GOOD (  13.67  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: multipart/mixed; boundary="===============0555356930829641524=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0555356930829641524==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vv0iS6OPh2q+34gu"
Content-Disposition: inline


--vv0iS6OPh2q+34gu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 03:09:39AM +0000, Yixun Lan wrote:
>=20
> On 13:10 Sun 25 Aug     , Yixun Lan wrote:
> > Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.
> >=20
> > Two vendor specific properties are introduced here, As the pinctrl
> > has dedicated slew rate enable control - bit[7], so we have
> > spacemit,slew-rate-{enable,disable} for this. For the same reason,
> > creating spacemit,strong-pull-up for the strong pull up control.
> >=20
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>

I got this mail, and one of your other ones, 5 times. What's going wrong
with your mail setup?=20

| 250   T Aug 25 Yixun Lan       (6.0K) =E2=94=8C=E2=94=80>[PATCH v2 4/4] r=
iscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3
| 251 N T Aug 26 Inochi Amaoto   ( 12K) =E2=94=82 =E2=94=8C=E2=94=80>
| 252   T Aug 25 Yixun Lan       (6.8K) =E2=94=9C=E2=94=80>[PATCH v2 3/4] r=
iscv: dts: spacemit: add pinctrl support for K1 SoC
| 253 N T Aug 26 Inochi Amaoto   ( 46K) =E2=94=82 =E2=94=8C=E2=94=80>
| 254   T Aug 25 Yixun Lan       ( 38K) =E2=94=9C=E2=94=80>[PATCH v2 2/4] p=
inctrl: spacemit: add support for SpacemiT K1 SoC
| 255 N T Aug 26 Inochi Amaoto   ( 22K) =E2=94=82 =E2=94=8C=E2=94=80>
| 256   T Aug 26 Yixun Lan       ( 333) =E2=94=82 =E2=94=9C=E2=94=80>
| 257   T Aug 26 Yixun Lan       ( 338) =E2=94=82 =E2=94=9C=E2=94=80>
| 258   T Aug 26 Yixun Lan       ( 334) =E2=94=82 =E2=94=9C=E2=94=80>
| 259   T Aug 26 Yixun Lan       ( 334) =E2=94=82 =E2=94=9C=E2=94=80>
| 260   T Aug 26 Yixun Lan       ( 333) =E2=94=82 =E2=94=9C=E2=94=80>
| 261   C Aug 25 Rob Herring (Ar (9.0K) =E2=94=82 =E2=94=9C=E2=94=80>
| 262 N C Aug 26 Krzysztof Kozlo ( 14K) =E2=94=82 =E2=94=82 =E2=94=8C=E2=94=
=80>
| 263 N C Aug 26 Inochi Amaoto   ( 19K) =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=
=80>
| 264   C Aug 26 Yixun Lan       ( 285) =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=
=80>
| 265   C Aug 26 Yixun Lan       ( 281) =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=
=80>
| 266 N C Aug 26 Yixun Lan       ( 14K) =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=
=80>
| 267 N C Aug 26 Yixun Lan       ( 12K) =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=
=80>
| 268 N C Aug 26 Yixun Lan       ( 12K) =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=
=80>
| 269   T Aug 25 Krzysztof Kozlo ( 13K) =E2=94=82 =E2=94=9C=E2=94=80>
| 270   T Aug 25 Yixun Lan       ( 14K) =E2=94=9C=E2=94=80>[PATCH v2 1/4] d=
t-binding: pinctrl: spacemit: add documents for K1 SoC
| 271   T Aug 25 Yixun Lan       (8.5K) [PATCH v2 0/4] riscv: spacemit: add=
 pinctrl support to K1 SoC


--vv0iS6OPh2q+34gu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsyrsgAKCRB4tDGHoIJi
0q6hAQDeH2i2SNS/Z13kPou1aa7nn27FSu6SRvKx9lRsDN+A0wD/eqwn/JkSg0bn
sCsM9hBmsqrjbzQW/WiTVKFJWO1kZAk=
=th+c
-----END PGP SIGNATURE-----

--vv0iS6OPh2q+34gu--


--===============0555356930829641524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0555356930829641524==--

