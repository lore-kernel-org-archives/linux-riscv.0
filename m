Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B261C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 18:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gL4MPQ/3Mp5fBZKHA2vJqDLlr+3zc1LkQq/EjnAuQ4=; b=Ypg+P0qCvlJmwGmZ/AvCEjSxbB
	vHBh09FLLa4XxfNRQWBnOyLGOxpBsI5aATD4polHEX4kfu85m3+utU+eBzOPiG+JhWblSuVI27meB
	s1Vnbzjbt2YfdzJAjjrm39gk1HvaAVvFbVR2VJEb3MZDlN37Hr8JCqWIJNfKldZ9cDXk+hBUwczG6
	CWxNk688IjnDwF/hvSe6mjoMIB/x0eugSYIAM/k7C8rMoItGZmLV9788GoBO81G/j8QUD4a8K+AuD
	axXXS2/51pAJmHka7TNMWZud1iWf6jKg8o5lqDLfV/8ZR02nZxweDAR4YLA+VQJT2RvtoRXTuoDr1
	BKM+M6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLS7e-00EvLZ-00;
	Thu, 04 Jan 2024 18:07:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLS7a-00EvKy-39
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 18:07:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A724E61873;
	Thu,  4 Jan 2024 18:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E50C433C7;
	Thu,  4 Jan 2024 18:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704391629;
	bh=2g4riwRlJYPaXC4pPnyGhw8jIgLWVYYCfFGE3oWgRxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uA6ZNlbl+HEha9Rm2MGfY7kGSNXWKOSH99nnBthw4IQK1fwi3DoVl5RdvrD1d1wOg
	 tGFB1K/B7bujJ9Jst1DJC0F/m4TGAMyMr+R42PTZyCM8iV1flFO6V+MlTfRFOVwr/D
	 6Y/sz+3Y4aKz1M5gsBzqssqQ+crQGKQtXpOdDqpiKavtDjGO96uhJ8lr5CVqFl6PrA
	 Vmn5magbGW7KrOYmKEDOfMHuDwE+CW8jk1cZROSzaVFtqeungQDCeyMrb+U3tIJVMG
	 FrcsO8dHJ+pQ2iMUw5jLp6ubHeM5tz+qYM+wHak65qGK34QjYxqxQSFE4pkkwM6VwR
	 rnGbfRGSMKuNw==
Date: Thu, 4 Jan 2024 18:07:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Yuklin Soo <yuklin.soo@starfivetech.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@beagleboard.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [RFC PATCH 1/6] dt-bindings: pinctrl: starfive: add JH8100
 pinctrl bindings
Message-ID: <20240104-thread-jot-53ee01efc63b@spud>
References: <20231221083622.3445726-1-yuklin.soo@starfivetech.com>
 <20231221083622.3445726-2-yuklin.soo@starfivetech.com>
 <CACRpkdYL8wK2vX7P7p4QvU9VV2CPjRv_aXiLqO+07MMCCKKk4Q@mail.gmail.com>
 <6c861db8-f6cd-4e12-856a-ef45efc654a2@linaro.org>
 <ZQ0PR01MB130273F2A3286849FB5BB0C9F667A@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ0PR01MB130273F2A3286849FB5BB0C9F667A@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_100711_122528_A895A356 
X-CRM114-Status: GOOD (  12.89  )
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
Content-Type: multipart/mixed; boundary="===============0375933240652157835=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0375933240652157835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5tQP8I1x4qTGmqU1"
Content-Disposition: inline


--5tQP8I1x4qTGmqU1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2024 at 03:12:31AM +0000, Yuklin Soo wrote:
>=20
>=20
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Sent: Thursday, December 21, 2023 11:45 PM
> > To: Linus Walleij <linus.walleij@linaro.org>; Yuklin Soo
> > <yuklin.soo@starfivetech.com>
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>; Hal Feng
> > <hal.feng@starfivetech.com>; Leyfoon Tan <leyfoon.tan@starfivetech.com>;
> > Jianlong Huang <jianlong.huang@starfivetech.com>; Emil Renner Berthing
> > <kernel@esmil.dk>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> > Drew Fustini <drew@beagleboard.org>; linux-gpio@vger.kernel.org; linux-
> > kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
> > riscv@lists.infradead.org; Paul Walmsley <paul.walmsley@sifive.com>; Pa=
lmer
> > Dabbelt <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>
> > Subject: Re: [RFC PATCH 1/6] dt-bindings: pinctrl: starfive: add JH8100=
 pinctrl
> > bindings
> >=20
> > On 21/12/2023 14:57, Linus Walleij wrote:
> > >> +          drive-strength:
> > >> +            enum: [ 2, 4, 8, 12 ]
> > >
> > > Milliamperes? Then spell that out in a description:
> >=20
> > Or just use drive-strength-microamp
>=20
> Suggest changing =E2=80=9Cdrive-strength:=E2=80=9D to =E2=80=9Cdrive-stre=
ngth: Drive strength in mA=E2=80=9D since the unit is in mA.

Just call the property "drive-strength-microamp". We have existing users
of that property.

Cheers,
Conor.

--5tQP8I1x4qTGmqU1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZbzxwAKCRB4tDGHoIJi
0q7mAQCKFq6hqG7JgQvVCfALjMOSzO+iKRfObMSQ6yyM/rg58AEAtyRFbdlGJiZB
GDLJ3QYvJCZAipAuCc44uWnALtuSBAI=
=6FU+
-----END PGP SIGNATURE-----

--5tQP8I1x4qTGmqU1--


--===============0375933240652157835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0375933240652157835==--

