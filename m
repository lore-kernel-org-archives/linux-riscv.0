Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85F1C77B73
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 10:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6C+k+hv/Odij8fLuY0WpP3UUOZFyiYl+K+tA+ptmQ5c=; b=OdnCqnYpBXyDpPSHamITJi2EKD
	ui/MgBCytjWt3Quak+rkC5NsJBW25eeKiPbsjFPEATKIiWiA4OhDTLjT4RNZbju0x7sICt8BXuQq/
	BZ1afr74LA7h71rLSfqw1+DOWF0u6O6/DS/iXa8XORSWRj4uul9mfxcSNuXx4ZwdkqDXWVEjfVx1Q
	b/XPObGWY0uwPsgHt8YkYoPbMrb7+aLRJfULYBuPdGNBHXtpnEWXpXrWRMAKL287/m4UXCqg74ziV
	xnsqrxx1aKmGejZ2fpiuoEaIMAtXURkHB3yEocYXSE+vnr3vSyoaohYPh+Gkj1QpH+FhNLe8VGNlO
	+sVkGX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvEyY-00D3s0-1Y;
	Sat, 06 May 2023 10:17:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvEyU-00D3rL-2R;
	Sat, 06 May 2023 10:17:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6CF6561A09;
	Sat,  6 May 2023 10:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B11C433EF;
	Sat,  6 May 2023 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683368228;
	bh=2BKyMfWbuzam8pPIQKLxv0HwFgMr99AvmaRkf2dAMAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIlKEx96qJxg5USu2rhGUPWJhb9u/8flrMmDA0LQgtPSgW5Tf0Pv/FJFVLoUijcDt
	 pu4/D0odINeiCivQMNpjTt7hM/yIbbAt5q1YAMW37qWmOvMV8fIodOm9kUQh8xxF+e
	 TERZyFDzjLbo5PEZRrfR2C4oqJSMs0/juZm/XhYx2z3UCWrXnTjhwf3u7nqz13//sM
	 Be9XcwPCT3fwubVr9HcokKmXGetwyx/nQR1I7i+/DbtyRyj+pH4DuwlUbcOUethHbB
	 kM06XhXg+iXLKvzBPchI19Qr76NsBiITQ1Ug1MO9Wf8QFX2Eqe9A/xrixtKD7rpUO7
	 WMff7sfQQysgw==
Date: Sat, 6 May 2023 11:17:03 +0100
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
Message-ID: <20230506-dating-twiddling-b364de21ed2b@spud>
References: <089e24d1-588a-4a56-f00b-0b35d1d99295@linaro.org>
 <ea5b5534-8fc2-7c84-a011-c1b42c6ed7a0@starfivetech.com>
 <1ac26c1a-1726-515d-6598-849a07ed0b86@linaro.org>
 <5adda0ad-965c-fbf0-878c-9d41d28b5c39@starfivetech.com>
 <86693969-59bf-5bcc-42a3-b6e94a0d6f3e@linaro.org>
 <fcfc8ba4-40a7-da43-3375-712bd7e7f4d5@starfivetech.com>
 <20230504-worshiper-ongoing-5581e1f2c2c4@wendy>
 <2f473307-2219-61a4-fa66-5848fe566cf0@starfivetech.com>
 <20230505-magician-poet-724c96020c2f@wendy>
 <ba6a1a47-d3b1-ee16-4785-f5c61d593127@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <ba6a1a47-d3b1-ee16-4785-f5c61d593127@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_031710_896193_F35CE5F2 
X-CRM114-Status: GOOD (  24.46  )
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
Content-Type: multipart/mixed; boundary="===============5526440190272542384=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5526440190272542384==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="olYpGZlk/8KzYW4Y"
Content-Disposition: inline


--olYpGZlk/8KzYW4Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 06, 2023 at 09:45:07AM +0800, Changhuang Liang wrote:
>=20
>=20
> On 2023/5/5 20:38, Conor Dooley wrote:
> > On Fri, May 05, 2023 at 09:29:15AM +0800, Changhuang Liang wrote:
> >=20
> >> But if keep this "starfive,jh7110-aon-syscon" compatible. Which .yaml =
match to
> >> it? Use this series dt-bindings or syscon series dt-bindings.
> >=20
> > There is no syscon series anymore, it's part of the PLL series now:
> > https://lore.kernel.org/linux-clk/20230414024157.53203-1-xingyu.wu@star=
fivetech.com/
> >=20
> > I don't really care what you, Walker & Xingyu decide to do, but add the
> > binding in one series in a complete form. It's far less confusing to
> > have only have one version of the binding on the go at once.
> >=20
>=20
> Due to the current aon pmu needs to be adjusted, it affects the syscon in=
 PLL series.
> So It's inevitable to change syscon in PLL series.
>=20
> My current idea is PLL series don't add the aon_syscon node. I will add i=
t in my
> aon pmu series in next version

That's fine. Rob was happy with the clock related parts, which was the
original source of confusion there.

> like this:
>=20
> aon_syscon: syscon@17010000 {
> 	compatible =3D "starfive,jh7110-aon-pmu", "syscon";

The syscon does a bunch of things of which one is a pmu. I don't see a
reason to name this other than "starfive,jh100-aon-syscon".

> 	reg =3D <0x0 0x17010000 0x0 0x1000>;
> 	#power-domain-cells =3D <1>;
> };
>=20
> In my opinion, the first we add "starfive,jh7110-aon-syscon" because "sys=
con" can=20
> not appear alone in the compatible. If we have "starfive,jh7110-aon-pmu",=
 this
> "starfive,jh7110-aon-syscon" is not a must-be need.
>=20
> Do you agree with doing so.
>=20
> Thanks,
> Changhuang

--olYpGZlk/8KzYW4Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFYpHwAKCRB4tDGHoIJi
0kWCAQCtW6PQ5IpHye69XI8USA4fSTwZKDy0/Fm4JQDlGIHRMgD+K+m3qWCEW3WU
3xk9P7m7lDqQ3ymNIrglttPFeuusjAs=
=098q
-----END PGP SIGNATURE-----

--olYpGZlk/8KzYW4Y--


--===============5526440190272542384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5526440190272542384==--

