Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3ECC7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 19:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64dD79ku8sWXHfezLc1CKaGDmKy3OvbT/0BDcMrM/mE=; b=WawFy47HahW2tGDQVx/qDknFtC
	HYLTkHtBwMJM4Hi+FacvjfJwE9NQP2sSPzbkSEnfRyGh10oq5Fy8RdN3Yk3mpqeP2geEtOA8fv14d
	+5ErroIPr/IiJbmFGovcYPcAJRCdEwYl+U9lOW01ZqOdufYoqFRUSdRKqdXAsBABvtlEG7sxV2jhH
	uIB0iau8qLrvKo36YjseSFrAyDPgxhJ8JjJh1vNAfdpxxX9u38VtiSEhRCqoxYwQuu/z7fOnMz5lC
	FhFlgPwGa+3ZVAhlHhgLtoB5+TLO10xpcxKZQjMlNJ64AYEfgjiv9rSV1zjc7coGUongKtfnL/Jc2
	o/VoaIHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwpqI-006rfd-1d;
	Wed, 10 May 2023 19:51:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwpqF-006rfE-1q
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 19:51:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1464F63F9A;
	Wed, 10 May 2023 19:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64FFC4339B;
	Wed, 10 May 2023 19:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683748274;
	bh=7bUSAhKpxskdimbeYDKvEahdeeVYQrECQTbrX4qEd/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Od+cSLkONolIsZ/B8afsiOQ3amhPIR6LxmdyzQpLoEyQjCELMe5lj+sm00afrjlhJ
	 xMzdFbW0D5gFhmdVtRL9lxnwaTGyDywPZCuwpSY9xogCKLVKohzx6Vk6IJNAuzvCrX
	 TWkE8/ymri3fjXWdx9l7owFH/LmmeRWtAM47lyT+sjahuVtdo3T6mpVyXc7NFZ5vkh
	 B0W2ak/hLi2YdMJrbKy/HwajAM0nxjxDylSukFymW5sYhe1MqGcHWMZs+sYXYHXH5z
	 Tqf/fZ/PfVBAiqICtkwgCpa9H6VhlO3XUxQtKv1xXp5Nen4DSiR4Y9qE1OJlEU6PE7
	 GQD+mXohQNdWA==
Date: Wed, 10 May 2023 20:51:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: power: Add JH7110 AON PMU support
Message-ID: <20230510-city-scarf-023705d3c96a@spud>
References: <20230510015311.27505-1-changhuang.liang@starfivetech.com>
 <20230510015311.27505-2-changhuang.liang@starfivetech.com>
 <20230510-cloning-clapping-e262f00a94e8@wendy>
 <d80646ae-cf1b-234a-261c-3753f6cc9080@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <d80646ae-cf1b-234a-261c-3753f6cc9080@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_125115_659528_6B3FEBD9 
X-CRM114-Status: GOOD (  20.25  )
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
Content-Type: multipart/mixed; boundary="===============2765221719406287762=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2765221719406287762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fQeNr7bxBo25KDoY"
Content-Disposition: inline


--fQeNr7bxBo25KDoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 03:20:14PM +0800, Changhuang Liang wrote:
> On 2023/5/10 15:06, Conor Dooley wrote:
> > On Tue, May 09, 2023 at 06:53:07PM -0700, Changhuang Liang wrote:
> >> +          - starfive,jh7110-pmu
> >> +      - items:
> >> +          - enum:
> >> +              - starfive,jh7110-aon-syscon
> >> +          - const: syscon
> >=20
> > Unfortunately, this is not what was wanted.
> > This syscon, of which power domain control is just one of the things th=
at
> > it can do, should be documented in
> > Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.y=
aml
> > alongside it's brethern "starfive,jh7110-sys-syscon" &
> > "starfive,jh7110-stg-syscon".
> >=20
>=20
> That means that I don't need to modify this original yaml file?=20

Does "this original" mean starfive,jh7100-pmu.yaml?
If so then...

> I just need to move current changes in this patch into=20
> "Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.ya=
ml"?

Correct.
It makes most sense for that binding, as it depends on the pll binding
(because it has a ref: to it), to go through the clock tree in Xingyu's
series.
I'll apply the driver changes once the binding has been applied.

Thanks,
Conor.

--fQeNr7bxBo25KDoY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFv1rQAKCRB4tDGHoIJi
0oYyAQCGubBPJUQ0rlBa+2muFZjPfG28PJMjy3hMLvMv8RYgQQEAmrsHqJXlTeET
FVB5kflykqAdT4t7yknJPIkEyY6uBA8=
=EzDq
-----END PGP SIGNATURE-----

--fQeNr7bxBo25KDoY--


--===============2765221719406287762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2765221719406287762==--

