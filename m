Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D764CF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dny3UnW3urhapcuKgMFlBbjr0uCRIfwha7lQCz4lG24=; b=P1yxC33Kpu4fwXOtEh+pBquOHf
	UW8XVlTqpZpv+ySVotQ6P+r+w7tI6gW21Va0yKWSZxFYM9AuKXnPCO1G5L4NIghA59/QeXfHwOKRu
	ylubKUbiy/9XCJph75lgcrAjHtLat3KOklZl9m45uuVK5ozpY7vHDa2ak3APvtbm7+haZKaderQ/l
	fXeM9Vaa8JfMBJb+mLrfi6jR0s1VvtrldjyMr6TkSrvRghr7/p/wB8HCOHM6SiuhzawV62hpDHghR
	1fIiWCB6tglOjbLoPgFtR/6VrUdBVAFSSn5L4yJMRC4ddrUxqisoxFKzdR5t8b5H5cJNPyFa/C6DK
	vQQWZfQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st8De-00000002nC4-4A5s;
	Tue, 24 Sep 2024 16:16:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st8Dc-00000002nBW-26Tl
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 16:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 278F85C5B99;
	Tue, 24 Sep 2024 16:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4F3C4CEC4;
	Tue, 24 Sep 2024 16:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727194610;
	bh=7vhPh7OpK9Z+/MJC8dy+JSeVzTF5FEc0QB1gsS153vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PuQIT8La3d74zIxluUc3ZcuFUwUjrpAOOMGcJN9sXH+bObpwgrGOcaTOYayQqNegn
	 iMMah43SASNRrnxcD1tLFDEYGXNQWBafGHlgthJ9KhIVQN+BVNE+MyDfEbiexzjSYr
	 gQwsoyjTcIPTe7YOBZA9/EGkbw4jbU6nUqt4d4u0pcsVdomhKZW9nPZ19EkBpfTAx1
	 oeY5oWhqEDBZbbIprJN9du2VvTjqPyDGAGAZobgrLHe1a67TBt5d3UdIXvbRyG6CzY
	 4ENR2TCbYbqx/hEaHP+FeZRNZTxJZjZ0nRUorZ3LKxZuX2xyaYaIJuoshNQBvfpTN8
	 AtKeMDq01XKaQ==
Date: Tue, 24 Sep 2024 17:16:44 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?5pu554+K54+K?= <sandie.cao@deepcomputing.io>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Neil Armstrong <neil.armstrong@linaro.org>, rafal@milecki.pl,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dhs@frame.work, ams@frame.work,
	gregkh@linuxfoundation.org, yuning.liang@deepcomputing.io,
	huiming.qiu@deepcomputing.io
Subject: Re: [patch v2 2/3] dt-bindings: riscv: starfive: add
 deepcomputing,fm7110
Message-ID: <20240924-pacemaker-unstylish-3807c3c4f106@spud>
References: <20240924080650.1345485-3-sandie.cao@deepcomputing.io>
 <5dfa7fb9-5b0e-424e-bf53-74a9eaa25bb1@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.1182851f.8778.42ba.bd71.b04cef6fccc0@feishu.cn>
MIME-Version: 1.0
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.1182851f.8778.42ba.bd71.b04cef6fccc0@feishu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_091652_629875_15DFF6E3 
X-CRM114-Status: GOOD (  15.26  )
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
Content-Type: multipart/mixed; boundary="===============4585395260649808400=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4585395260649808400==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GxgsP75MI66qruER"
Content-Disposition: inline


--GxgsP75MI66qruER
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 06:12:02PM +0800, =E6=9B=B9=E7=8F=8A=E7=8F=8A wrote:
> On 24/09/2024 10:06, Sandie Cao wrote:
> > Add deepcomputing,fm7110 into compatible list.
>=20
> A:=C2=A0
> DeepComputing is creating a RISC-V Framework Laptop 13 Mainboard=C2=A0
> powered by a StarFive JH7110 processor.This is=C2=A0a=C2=A0developer-focu=
sed=C2=A0
> product, aimed at making tinkering with RISC-V more accessible.
> The Mainboard is under development and we'll share more on functionality,=
=C2=A0
> compatibility, and availability as the program progresses.
> For this Mainboard, the Model name in Framework is Framework FRANME0000;
> the Model name in DeepComputing is DeepComputing fm7110.
>=20
> Q: This we see from the diff. And commit subject. Describe here the hardw=
are.

Please don't use this quoting style, please figure out how to do
proper inline quoting with your mail client.

>=20
> > Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
>=20
> Best regards,
> Krzysztof
>=20

--GxgsP75MI66qruER
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvLl7AAKCRB4tDGHoIJi
0oR+AP0Z0zHw2BTNJ4dGmMSviMtQzA2yds6Tgzj9sEM3p2HXagD/eqlmZoKnSuxU
Qs9W9Vc+2mY0Z80iCgELR8mzzm4SoAM=
=n/4d
-----END PGP SIGNATURE-----

--GxgsP75MI66qruER--


--===============4585395260649808400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4585395260649808400==--

