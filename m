Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEE1C77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wk0wOzkoR/9gIe+aD7zDcVy/p6acqgPvRLPYmazva4=; b=ELDjPXO0AYecJY/epSJmJotb2O
	Wj19jcamgYhyYBdQFyq+99Dy5tuTXv0w2ejNP94XaCqWDTAWtM6zgYMx1W7PyBkqYJSuN9jjVvv9K
	6+3kzTQy8KVXaLeOtCbzrPnnWCTH9F2YKhpQdCrbQd46XveSVYd3lZ+/4wScxI7N6QL3RBLRXu8Ti
	EwzsBikB5hofO9xI41ELU9bsLIP/XUesv2XSPr1JQjjt0RYyfTzIfSe+CHe8hn2bd60bPfAPV9JTl
	n9TTslpR8gnqmwCRIoDVwaand7hd7If1spqr5rBGST2anyz/7b+KtEfQDimFMHdkAdgpmqpgprWlZ
	3fjk4kXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prF5u-000fRB-0E;
	Tue, 25 Apr 2023 09:36:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prF5q-000fPi-2X;
	Tue, 25 Apr 2023 09:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682415374; x=1713951374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cdJ5RCl0jRK2WkiOSErGKVWigi6cRYrQGKqxUv/5kOQ=;
  b=OVAPbpgePymf7U/RSTiTg7eyn2vs1cozI2HnzJHtt1u66YUsKqdkBr24
   qOB9IbMwovBoV9OHl9+8BNkYR0yX0jx/BlaUKa7QSeI+Ui15iQzkmhES8
   0KlrBNtY59pB/cJI9w2hohFIX6s8lvvkuV/5VUNnZfx7ojM/E3wAcmraY
   xqG3zL032oCKvc0tIERkz4zPe4ckPpkTuWG70Um0jagCGemFGsuiDdr2O
   EStISeV2lsQndeU+z4JLAyCcbz3oIBjC9at75aFtiCIokUpMsBOa0a+ZU
   da+/NjZCOu7TfvS7hfIXycNA09AvM+Rs/RD4Uvh6uI9HIGLuQB9uslHjx
   g==;
X-IronPort-AV: E=Sophos;i="5.99,225,1677567600"; 
   d="asc'?scan'208";a="210571348"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Apr 2023 02:36:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 25 Apr 2023 02:36:05 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 25 Apr 2023 02:36:02 -0700
Date: Tue, 25 Apr 2023 10:35:45 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <vkoul@kernel.org>,
	<linux-phy@lists.infradead.org>
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Message-ID: <20230425-resale-footrest-de667778c4fe@wendy>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
 <20230419035646.43702-2-changhuang.liang@starfivetech.com>
 <20230419-labored-camper-644d51a7ca96@spud>
 <1a5b15fa-4f20-51c2-2ba1-a04a2911a694@starfivetech.com>
 <20230424-baffle-punch-ec73098f2b6a@spud>
 <d685a1d4-c07d-7dfa-f1fb-b35ceb2aa0eb@starfivetech.com>
 <20230425-unquote-eligible-09f743d81981@wendy>
 <a7cdfabf-2312-eaf3-f462-5bda7f0a120d@starfivetech.com>
 <68cb565d-bf39-10b0-9e3e-35ba7f54b90b@linaro.org>
 <0988495f-b87a-7f69-f222-37c67d6eae23@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <0988495f-b87a-7f69-f222-37c67d6eae23@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_023614_833642_86AD4D2E 
X-CRM114-Status: GOOD (  24.77  )
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
Content-Type: multipart/mixed; boundary="===============2736207305802241705=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2736207305802241705==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NyVSyvpBVoaqkS2m"
Content-Disposition: inline

--NyVSyvpBVoaqkS2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 05:18:10PM +0800, Changhuang Liang wrote:
>=20
>=20
> On 2023/4/25 16:19, Krzysztof Kozlowski wrote:
> > On 25/04/2023 09:57, Changhuang Liang wrote:
> >>>>>>>> =20
> >>>>>>>>  description: |
> >>>>>>>>    StarFive JH7110 SoC includes support for multiple power domai=
ns which can be
> >>>>>>>> @@ -17,6 +18,7 @@ properties:
> >>>>>>>>    compatible:
> >>>>>>>>      enum:
> >>>>>>>>        - starfive,jh7110-pmu
> >>>>>>>> +      - starfive,jh7110-aon-pmu
> >>>>>
> >>>>> I was speaking to Rob about this over the weekend, he asked:
> >>>>> 'Why isn't "starfive,jh7110-aon-syscon" just the power-domain provi=
der
> >>>>> itself?'
> >>>>
> >>>> Maybe not, this syscon only offset "0x00" configure power switch.
> >>>> other offset configure other functions, maybe not power, so this
> >>>> "starfive,jh7110-aon-syscon" not the power-domain itself.
> >>>>
> >>>>> Do we actually need to add a new binding for this at all?
> >>>>>
> >>>>> Cheers,
> >>>>> Conor.
> >>>>>
> >>>>
> >>>> Maybe this patch do that.
> >>>> https://lore.kernel.org/all/20230414024157.53203-6-xingyu.wu@starfiv=
etech.com/
> >>>
> >>> This makes it a child-node right? I think Rob already said no to that=
 in
> >>> and earlier revision of this series. What he meant the other day was
> >>> making the syscon itself a power domain controller, since the child n=
ode
> >>> has no meaningful properties (reg, interrupts etc).
> >>>
> >>> Cheers,
> >>> Conor.
> >>
> >> Yes, "starfive,jh7110-aon-pmu" is a child-node of "starfive,jh7110-aon=
-syscon".
> >> In my opinion, "0x17010000" is "aon-syscon" on JH7110 SoC, and this "a=
on-pmu" is just=20
> >> a part of "aon-syscon" function, so I think it is inappropriate to mak=
e "aon-syscon"
> >> to a power domain controller. I think using the child-node description=
 is closer to
> >> JH7110 SoC.=20
> >=20
> > Unfortunately, I do not see the correlation between these, any
> > connection. Why being a child of syscon block would mean that this
> > should no be power domain controller? Really, why? These are two
> > unrelated things.
> >=20
> > Best regards,
> > Krzysztof
> >=20
>=20
> Let me summarize what has been discussed above.=20
>=20
> There has two ways to describe this "starfive,jh7110-aon-syscon"(0x170100=
00).
> 1. (0x17010000) is power-controller node:
>=20
> 	aon_pwrc: power-controller@17010000 {
> 		compatible =3D "starfive,jh7110-aon-pmu", "syscon";
> 		reg =3D <0x0 0x17010000 0x0 0x1000>;
> 		#power-domain-cells =3D <1>;
> 	};
>=20
>=20
> 2. (0x17010000) is syscon node, power-controller is child-node of syscon:
>=20
> 	aon_syscon: syscon@17010000 {
> 		compatible =3D "starfive,jh7110-aon-syscon", "syscon", "simple-mfd";
> 		reg =3D <0x0 0x17010000 0x0 0x1000>;
>=20
> 		aon_pwrc: power-controller {
> 			compatible =3D "starfive,jh7110-aon-pmu";
> 			#power-domain-cells =3D <1>;
> 		};
> 	};

I thought that Rob was suggesting something like this:
	aon_syscon: syscon@17010000 {
		compatible =3D "starfive,jh7110-aon-syscon", ...
		reg =3D <0x0 0x17010000 0x0 0x1000>;
		#power-domain-cells =3D <1>;
	};

Cheers,
Conor.


--NyVSyvpBVoaqkS2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEee8QAKCRB4tDGHoIJi
0iAjAQCAYkbFL/ydjRkg7qdZ1xejJeKnKpac8GkxwCp7ovCnGwD/S+XqbVNUcOyu
xaeZnAsWfEaTMKgIuWoqCeIrvwvPlAQ=
=31W+
-----END PGP SIGNATURE-----

--NyVSyvpBVoaqkS2m--


--===============2736207305802241705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2736207305802241705==--

