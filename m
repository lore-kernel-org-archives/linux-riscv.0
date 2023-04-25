Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F9CC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 16:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJlu7ioV1M0+FW8xXxyTVj8AHHaO5SeRdfABxqnhJzM=; b=PgHVxuYnh6m2M5pFG+eIAgrHLi
	mjak0k9iN5BN07QYb903mq+agnQfx5w6ItLKG4UMVsuoLR1TI+kwjNqM77apa9S+o4Ch/OKqVIayf
	wIIrXD+1L30wOtVy3Hj2Hl38rWJxmXSF9QmmpH9opNb3YsjnRVniWRUnbO4xyWV1GRKCmxj8PQf6/
	5I4VStFiocufb9c066nGRb5+vxB1LU9821En0d7q8h8ZyEV1xh7Eqe1WaZTPfrWApw0dizv6QUz7j
	x5d1DdVRHifEc5ze8Rt+Xm0yniKgMymhJ7oeb28hGgHfF2M7G/SmCh0IyO6H/T3hJH6Nak5tUV3P/
	C6w8WjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prLyW-001jJM-01;
	Tue, 25 Apr 2023 16:57:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prLyS-001jI9-39;
	Tue, 25 Apr 2023 16:57:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E5F4062D52;
	Tue, 25 Apr 2023 16:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13196C4339C;
	Tue, 25 Apr 2023 16:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682441823;
	bh=cUDv7w0pj/dy7GYFDIBt/oc/4E1U2yx8meJnVqD9X/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYHdqVra8pVt5vIloxWIOlZzNWPHB97kBVaD8zgRIdazyyvvdDc//MVDzgjTsi6qb
	 SR3RNWqiX+8O73EBTrj85JSM+TlenznTLp5se1SYsQFBvMOqtozZDCENNcyOq6xbqf
	 NqfdhgqX8zq+1VsXIeZCM2c6oDtbKx/YTtczx6Ombg8cxkm8YsdVKKKIW2DGnGW+0y
	 0pdnTnx+hrVn7NqzopgkiuqR4uHuDqgUhyqCmId8Lsk+qpwdUcW8UTX75Ve72iaCXn
	 lRDud2C/nI9OQJ9Mz9V008Mxvf7T6PMor/2QdiXoKn9zoZv42fWWQPTWAeUdpd3i+r
	 Eu7TwFD4U3iYA==
Date: Tue, 25 Apr 2023 17:56:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	vkoul@kernel.org, linux-phy@lists.infradead.org
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Message-ID: <20230425-commotion-prewashed-876247bed4ab@spud>
References: <20230419-labored-camper-644d51a7ca96@spud>
 <1a5b15fa-4f20-51c2-2ba1-a04a2911a694@starfivetech.com>
 <20230424-baffle-punch-ec73098f2b6a@spud>
 <d685a1d4-c07d-7dfa-f1fb-b35ceb2aa0eb@starfivetech.com>
 <20230425-unquote-eligible-09f743d81981@wendy>
 <a7cdfabf-2312-eaf3-f462-5bda7f0a120d@starfivetech.com>
 <68cb565d-bf39-10b0-9e3e-35ba7f54b90b@linaro.org>
 <0988495f-b87a-7f69-f222-37c67d6eae23@starfivetech.com>
 <20230425-resale-footrest-de667778c4fe@wendy>
 <663e9933-b9b3-a48f-98b6-2207215a8ed7@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <663e9933-b9b3-a48f-98b6-2207215a8ed7@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_095705_117658_02CDD8DC 
X-CRM114-Status: GOOD (  24.56  )
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
Content-Type: multipart/mixed; boundary="===============1514890248138077017=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1514890248138077017==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2jPozkJrlsTQK/jH"
Content-Disposition: inline


--2jPozkJrlsTQK/jH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 08:26:35PM +0800, Changhuang Liang wrote:
> On 2023/4/25 17:35, Conor Dooley wrote:
> > On Tue, Apr 25, 2023 at 05:18:10PM +0800, Changhuang Liang wrote:
> >> On 2023/4/25 16:19, Krzysztof Kozlowski wrote:
> >>> On 25/04/2023 09:57, Changhuang Liang wrote:
> >>>> Yes, "starfive,jh7110-aon-pmu" is a child-node of "starfive,jh7110-a=
on-syscon".
> >>>> In my opinion, "0x17010000" is "aon-syscon" on JH7110 SoC, and this =
"aon-pmu" is just=20
> >>>> a part of "aon-syscon" function, so I think it is inappropriate to m=
ake "aon-syscon"
> >>>> to a power domain controller. I think using the child-node descripti=
on is closer to
> >>>> JH7110 SoC.=20
> >>>
> >>> Unfortunately, I do not see the correlation between these, any
> >>> connection. Why being a child of syscon block would mean that this
> >>> should no be power domain controller? Really, why? These are two
> >>> unrelated things.
> >>
> >> Let me summarize what has been discussed above.=20
> >>
> >> There has two ways to describe this "starfive,jh7110-aon-syscon"(0x170=
10000).
> >> 1. (0x17010000) is power-controller node:
> >>
> >> 	aon_pwrc: power-controller@17010000 {
> >> 		compatible =3D "starfive,jh7110-aon-pmu", "syscon";
> >> 		reg =3D <0x0 0x17010000 0x0 0x1000>;
> >> 		#power-domain-cells =3D <1>;
> >> 	};
> >>
> >>
> >> 2. (0x17010000) is syscon node, power-controller is child-node of sysc=
on:
> >>
> >> 	aon_syscon: syscon@17010000 {
> >> 		compatible =3D "starfive,jh7110-aon-syscon", "syscon", "simple-mfd";
> >> 		reg =3D <0x0 0x17010000 0x0 0x1000>;
> >>
> >> 		aon_pwrc: power-controller {
> >> 			compatible =3D "starfive,jh7110-aon-pmu";
> >> 			#power-domain-cells =3D <1>;
> >> 		};
> >> 	};
> >=20
> > I thought that Rob was suggesting something like this:
> > 	aon_syscon: syscon@17010000 {
> > 		compatible =3D "starfive,jh7110-aon-syscon", ...
> > 		reg =3D <0x0 0x17010000 0x0 0x1000>;
> > 		#power-domain-cells =3D <1>;
> > 	};

> I see the kernel:
> https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/mediat=
ek/mt8167.dtsi
> this file line 42:
> it's power-controller also has no meaningful properties.
> What do you think?

I'm not sure that I follow. It has a bunch of child-nodes does it not,
each of which is a domain?

I didn't see such domains in your dts patch, they're defined directly in
the driver instead AFAIU. Assuming I have understood that correctly,
your situation is different to that mediatek one?

Cheers,
Conor.

--2jPozkJrlsTQK/jH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEgGWQAKCRB4tDGHoIJi
0n5hAQCXOV1SrfD6iA2QcZe3hIYyiXSLArZEvyZM7JlrkXLP+QD/dv8/MQyPmHPt
hLWQvz3H3XVzqkslQ4ihE4QPcfIn8wI=
=AfU5
-----END PGP SIGNATURE-----

--2jPozkJrlsTQK/jH--


--===============1514890248138077017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1514890248138077017==--

