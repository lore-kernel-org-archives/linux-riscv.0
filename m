Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E35DC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 17:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlvEtpDgRKbSexOm7Xi7DJwprpRnEfbtisEhXMsG0+w=; b=Nmz9+SpZkINNeVg2m7UduGpzHM
	8snvl+H5WSn5FUsHpVmKYHFaXRSHlkjSQjmXUzcO4rGMU4t/5uuOuh9gPkpuUhheRCOTXNx736jrN
	6oVmNHasH1F+I45zWA94h8Hdu/Zu63nopsV9vMccJJvsFtOdI7x7HnCME4NGpPx1Fz2IS3jfmwDa3
	uLLnd5G/fTtb0GJoIjl7IVsXqKWYUzwssQCAr178buPXkJhSWgFNGPkrIDP/sXVmu38CEcRl9excY
	Y6WZo9htEL3L6Kcpvd2NVqOaCp4TAKwTRchca8VrF+DSPiKql8fOGivqqyXQP/x5pFNWuUBh41tzX
	RAFgsk3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkJV-006SRJ-0Y;
	Mon, 11 Dec 2023 17:43:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkJS-006SOq-17
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 17:43:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 84503B80F6F;
	Mon, 11 Dec 2023 17:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B47C433C7;
	Mon, 11 Dec 2023 17:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702316603;
	bh=Xrsi+3PuSnsXMklZ6G2qnpKJr2/IDaNfFsWL8VpO5f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FBRGtPT1QpzPrQqn9ZWXvcuicsRwZrKH77dTgVAvpBpN800WmF6F/a0YLfAo1tM18
	 jmPxjw7FybqnMY3ndobGNTDGZk9mpztbBWbcqscQuuiHVkNQSXnCOuajtRgxpo5fnk
	 Qn6I6mujyhKaDRCpZZb60scTr3l/gu2fCXKHCTYNsF5cF0We5DFgfJSfeZPNOxxUPm
	 wccJl+Y2tOJmckw26GAH7eJhhiZB58WjBngmy4X4IkcOzBGdXYWT8MW2EPexqCnznY
	 wAYRK69areNhIN9DAvtG8qNcqJKG07M4cHKGqTGHfR4Zh/xXXtl0uqg4hZUCVtKoyf
	 4jL0V4DHIMObw==
Date: Mon, 11 Dec 2023 17:43:17 +0000
From: Conor Dooley <conor@kernel.org>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Shengyu Qu <wiagn233@outlook.com>,
	"kernel@esmil.dk" <kernel@esmil.dk>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"jirislaby@kernel.org" <jirislaby@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	"drew@beagleboard.org" <drew@beagleboard.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
Message-ID: <20231211-vacant-tracing-0f5bfc3b23fd@spud>
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
 <20231201121410.95298-7-jeeheng.sia@starfivetech.com>
 <TY3P286MB2611F70A3D61788E556C8A30988AA@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <358bcdb3f0ab4a7b9d6bbe17ca1a696d@EXMBX066.cuchost.com>
 <20231211-submerge-vegan-244889f1751c@wendy>
 <b3690246eb1e48428238ceb26b046297@EXMBX066.cuchost.com>
MIME-Version: 1.0
In-Reply-To: <b3690246eb1e48428238ceb26b046297@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_094326_653313_CE433687 
X-CRM114-Status: GOOD (  16.68  )
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
Content-Type: multipart/mixed; boundary="===============2129354715761052703=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2129354715761052703==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XS9oPw+vMXVv7R2u"
Content-Disposition: inline


--XS9oPw+vMXVv7R2u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 09:38:03AM +0000, JeeHeng Sia wrote:
>=20
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor.dooley@microchip.com>
> > Sent: Monday, December 11, 2023 3:59 PM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > Cc: Shengyu Qu <wiagn233@outlook.com>; kernel@esmil.dk; robh+dt@kernel.=
org; krzysztof.kozlowski+dt@linaro.org;
> > krzk@kernel.org; conor+dt@kernel.org; paul.walmsley@sifive.com; palmer@=
dabbelt.com; aou@eecs.berkeley.edu;
> > daniel.lezcano@linaro.org; tglx@linutronix.de; conor@kernel.org; anup@b=
rainfault.org; gregkh@linuxfoundation.org;
> > jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu <michael.zhu@st=
arfivetech.com>; drew@beagleboard.org;
> > devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-kern=
el@vger.kernel.org; Leyfoon Tan
> > <leyfoon.tan@starfivetech.com>
> > Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive =
JH8100 device tree
> >=20
> > On Mon, Dec 11, 2023 at 01:38:06AM +0000, JeeHeng Sia wrote:
> > >
> > > > From: Shengyu Qu <wiagn233@outlook.com>
> > > > Sent: Friday, December 8, 2023 8:09 PM
> >=20
> > > > Does the dubhe-80 cores actually support vector? Or vector support
> > > >
> > > > doesn't exist on actual silicon?
> >=20
> > > We don't have a use case for vector application in JH8100
> >=20
> > I am sorry, but I am not clear on what this means. Do the CPUs on
> > the JH8100 support vector or not?
> The JH8100 CPU does not support vector operation.

Thanks for clarifiying.

--XS9oPw+vMXVv7R2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXdKNQAKCRB4tDGHoIJi
0rZPAQCEsghqtswjmJygCWPmWVFvcHsL1UQuaSfdgVrpv2pGKwD+KS8NbHc9i8YD
aj/NuPnffcLulHXB2Efddk4kEgoIdQE=
=tBgs
-----END PGP SIGNATURE-----

--XS9oPw+vMXVv7R2u--


--===============2129354715761052703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2129354715761052703==--

