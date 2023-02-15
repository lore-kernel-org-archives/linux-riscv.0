Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862E8C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 07:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0kQ8QnsTZ200uAcHPq4QkkP5Zkw0Va7g4NwRLB2Jik=; b=ZS8OAiXCZRMo/rogJcvRVk6osn
	poWxu9xII9EecnG+AvtOfDkwqayY/Wew0YftzL7+637XjevZ6DwrNTe2djRoymNJ7tHn0L4T86Ohd
	AkS+YuPouqjbgynxM9av84rypDx+7AOp17w/PWT98KT75lM8UFlUXdD/sN3mMzkYPhxz82s6IUmmJ
	O9F3Lehi/ddSVIAqzBAKzRYwiY7DEIhiYqz+FUsCzzJs0Exb8u0AYEIeqcr18mVPCpXtJxGOEe/iH
	4ExwMaOUtYSqRrr+35O0sHuzA40lP84VKFJXRoo9DuD/WMNwMpb6o0R9QRHlsS0zVtoUX8Q0TM2j7
	uFr470Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSCR9-0054yf-WB; Wed, 15 Feb 2023 07:42:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSCR7-0054xs-7x
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 07:42:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 746A9B81FF3;
	Wed, 15 Feb 2023 07:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E0FC433EF;
	Wed, 15 Feb 2023 07:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676446958;
	bh=QSFKS/90ezs3zriHvewvAbRppeD86cWtp0r1rkH2EDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYgDPwYeHYAC6ydfsVp8whTMWrG5UOIcCpBQGcB5jpXBHPQNom/Ns+UUPwURlCfTM
	 akiWIKNOnc14udj1TmgBU0sopUEYX+fdKq7P557PPXOhTor6t/1b9VzjzxDCrJH33K
	 OSHOHHyfjE7WTT8G9BT4ItiiOZZ/OkivVXLNYv7j0bZYSZgclsDmMHbn9IEyMM53VS
	 lMKgawG7uBboKytbtyxZj0vI6TNw5ZIB0b096xS9d9AD7Clc9/UyR6P0QAQilIryrz
	 ng4b31a1dlYZgjVSETh2kPIT3PI9BU/WWJBBSOVtw2l1WQ77Z75YTaMif1tp/5NXnc
	 28imcOaoOX7GQ==
Date: Wed, 15 Feb 2023 07:42:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
Message-ID: <Y+yM6HgAbDoWlu1G@spud>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-7-hal.feng@starfivetech.com>
 <Y6zHy9oL4xzl+6Rd@spud>
 <c507e0b2-5ca3-cffe-55d2-873ed8c24e3d@starfivetech.com>
 <Y9og8Q2UnJ452KH/@wendy>
 <df6755ed-a358-ea01-d89e-f3c004b9c297@starfivetech.com>
 <Y9wR7Up+iObw5qoE@spud>
 <8b35344f-0f78-b4e6-2b5e-e6ec6b101a75@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <8b35344f-0f78-b4e6-2b5e-e6ec6b101a75@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_234241_614176_43EA08B1 
X-CRM114-Status: GOOD (  37.81  )
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
Content-Type: multipart/mixed; boundary="===============0467828412531440306=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0467828412531440306==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AXLnbqr/95MyN3cz"
Content-Disposition: inline


--AXLnbqr/95MyN3cz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Hal!

On Wed, Feb 15, 2023 at 11:07:15AM +0800, Hal Feng wrote:
> On Thu, 2 Feb 2023 19:41:33 +0000, Conor Dooley wrote:
> > On Fri, Feb 03, 2023 at 02:56:41AM +0800, Hal Feng wrote:
> >> On Wed, 1 Feb 2023 08:21:05 +0000, Conor Dooley wrote:
> >> > On Wed, Feb 01, 2023 at 03:21:48PM +0800, Hal Feng wrote:
> >> >> On Wed, 28 Dec 2022 22:48:43 +0000, Conor Dooley wrote:
> >> >> > On Tue, Dec 20, 2022 at 09:12:46AM +0800, Hal Feng wrote:
> >> >=20
> >> >> >> +/ {
> >> >> >> +	compatible =3D "starfive,jh7110";
> >> >> >> +	#address-cells =3D <2>;
> >> >> >> +	#size-cells =3D <2>;
> >> >> >> +
> >> >> >> +	cpus {
> >> >> >> +		#address-cells =3D <1>;
> >> >> >> +		#size-cells =3D <0>;
> >> >> >> +
> >> >> >> +		S76_0: cpu@0 {
> >> >> >> +			compatible =3D "sifive,u74-mc", "riscv";
> >> >> >=20
> >> >> > The label here says S76 but the compatible says u74-mc.
> >> >>=20
> >> >> U74-MC has 5 cores including 1 * S7 core and 4 * U74 cores.
> >> >>=20
> >> >> > Which is correct? Your docs say S7 and S76, so I would imagine th=
at it
> >> >> > is actually an S76?
> >> >>=20
> >> >> I found SiFive website [1] call it S76, but call it S7 in other pla=
ces.
> >> >> So I misunderstood this. Considering the ISA difference you describ=
ed
> >> >> as below, I think it's proper to change the label to "S7_0".
> >> >=20
> >> > I'm less worried about the label & more interested in the compatible.
> >> > hart0 is, as you say, not a u74. Should we not be adding a "sifive,s=
7"
> >> > compatible string to Documentation/devicetree/bindings/riscv/cpus.ya=
ml
> >> > and using that here instead?
> >>=20
> >> First of all, it's my fault that I didn't check the revision of U74-MC
> >> manual, so most of my previous replies might not make sense.
> >=20
> > No that's fine. The manual stuff confused me too when I went looking
> > initially, and I still get get mixed up by the fact that there are
> > core-complex manuals but not core manuals.
> >=20
> >> If we add a new compatible string for S7, should we change the compati=
bles
> >> of hart1~3 to "sifive,u74" also? And then, there may be no point keepi=
ng some
> >> compatible strings of core complex like "sifive,u74-mc" and "sifive,u5=
4-mc".
> >> I'm not sure about this.
> >=20
> > [...]
> >=20
> >> >> Yes, "RV64IMAC" is correct. The monitor core in U74-MC is a
> >> >> S7-series core, not S76.
> >> >=20
> >> > Cool, thanks.
> >>=20
> >> Now I think it might be another version of S76.
> >=20
> > The SiFive docs describe the u74-mc core complex, which AFAIU you have,
> > as being 1x S7 & 4x U7.
> >=20
> > I'd be happy with new binding for "sifive,s7" & then we use that here.
> > If you're sure it's S76, we can also use that. S76 is described, in what
> > docs I can see, as a core complex containing an S7, so S7 seems likely
> > to be correct?
>=20
> I will add a new binding for "sifive,s7" and modify the code as follows.
>=20
> 	S7_0: cpu@0 {
> 		compatible =3D "sifive,s7", "riscv";
> 		...
> 		riscv,isa =3D "rv64imac_zicsr_zba_zbb";

I'm not sure that I'd bother with the zicsr, it gets added automagically
by the Makefile if needed:
| # Newer binutils versions default to ISA spec version 20191213 which move=
s some
| # instructions from the I extension to the Zicsr and Zifencei extensions.
| toolchain-need-zicsr-zifencei :=3D $(call cc-option-yn, -march=3D$(riscv-=
march-y)_zicsr_zifencei)
| riscv-march-$(toolchain-need-zicsr-zifencei) :=3D $(riscv-march-y)_zicsr_=
zifencei

Otherwise, thanks for the actual confirmation of zba/zbb!

Thanks,
Conor.


--AXLnbqr/95MyN3cz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+yM5wAKCRB4tDGHoIJi
0te+AP9fjWjQZYhZoNm6wd00NXH/2m9Ro0z5Weh/BsrqQkFGRAEA7oJxs9pfH8Eg
EBJC0mD8PUfKPoYJ1JIbt5LHZ+f5nAA=
=XxRj
-----END PGP SIGNATURE-----

--AXLnbqr/95MyN3cz--


--===============0467828412531440306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0467828412531440306==--

