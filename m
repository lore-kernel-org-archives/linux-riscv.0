Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E20BCA5FC4
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 22:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FN0Td/iDs/Y8UqXS/rdRITYsf5wK41iNR8xdXgxvmns=; b=YJVZ8Pi6pn48coRagpD/OAurUb
	aP88IVD0fj6gLi3+ZFhHrsCsPWP3t7FF6/kdmT0sQQIoCCMJENNPbdM4WvpkhguqeFvW6zLNz/k+C
	0BIH7s9qbWILJN2ZOetjJDZSxDmH7jy6GRblxiShepgPtqPZtc/LlR/r2rJ/WgSd7SjMB4ZLQmlrL
	PPpYrt+AiHvZvJdvdwrHhFJTbUJm5dQlBo5B9qMyR/sWU2iJhZ1e3OGvTBLy4trkNIy65/npJ4xuB
	x+ntWHb/p1pHUCR7hh9KNCSz1TNUmQb7z0Vbnur33bcz7PYLpy5HZ3ti8R2pt2K48APYX+JRKDTSg
	cnC6lpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2sL-00000007NMj-3DjW;
	Wed, 30 Sep 2026 22:34:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2sK-00000007NMd-3m3Y
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 22:34:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D8C2601F1;
	Wed, 30 Sep 2026 22:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C661F000FF;
	Wed, 30 Sep 2026 22:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790807647;
	bh=Y9zMIJNxKpa5Bhx46XZTOnTAHlsLD1gKMetTQhVVcgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AaqhdASa8v9wWTPxKWm2KF3pmZykgLgqZfaVVC+OKDJthjCaVn0MR9j+myN4oxS87
	 3ml3pP9tZs41KnQSCrcScQgRK0U46yRAa2dSCtVLqeJlXQLfVoReLzYRrT1JDtjhAD
	 jRCyOn9Bmuo8c0qloxjFBB3uNGHYIOoVfszPhdmLO5qDD1J2FSFC1+jNOA/5a50aF3
	 8oBkd41Nh6wuVNPxDRXeuFsMANxdca1bCvdyIpvZTSYhxXRiYMM3xLvOH6qDYy4zGd
	 4mzKvVZEHqsZN0SrfcMLGuM/rj18CbQvBCbKHnBqdo8e30rAo7fJzR3YEx1czWF2W+
	 o+pnzAnGkFrww==
Date: Wed, 30 Sep 2026 23:34:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v8 00/22] Add basic pinctrl drivers for JHB100 SoC
Message-ID: <20260930-frantic-enviable-55c1a78fe7d4@spud>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <CAD++jLmts76o8wyR=eY=vdNsh8+916YqK9qwM3b=R624AYM1XA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD++jLmts76o8wyR=eY=vdNsh8+916YqK9qwM3b=R624AYM1XA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6033706737623120958=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6033706737623120958==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PlRoT138GtctrPoH"
Content-Disposition: inline

--PlRoT138GtctrPoH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 12:20:01AM +0200, Linus Walleij wrote:
> Hi Changuang,
>=20
> On Thu, Sep 10, 2026 at 12:04=E2=80=AFPM Changhuang Liang
> <changhuang.liang@starfivetech.com> wrote:
>=20
> > Changhuang Liang (22):
> >   dt-bindings: pincfg-node: Add property 'input-debounce-ns'
> >   pinctrl: pinconf-generic: Add property 'input-debounce-ns'
> >   dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 per0 controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 per1 controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 per2 controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 per3 controller driver
>=20
> All of those applied to the pinctrl tree!
>=20
> I had to manually adjust the MAINTAINERS patch because it is based
> on some reset controller patch I don't have in v7.3-rc1.

I believe that patch doesn't exist anywhere other than on the mailing
list :p

> >   riscv: dts: starfive: Add JHB100 pinctrl pad number header
> >   riscv: dts: starfive: jhb100: Add pinctrl nodes
>=20
> Please funnel these through the SoC tree.

Ye, I got my eye on them, don't worry.

btw, are you going to be at LPC or OSS Linus? I'll have to make sure to
say hi if so.

--PlRoT138GtctrPoH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar2OWgAKCRB4tDGHoIJi
0grzAP9Fs6ouvcThAMVjQbj6XU2gdVLZc/LBnWTeH4InJf79kQEAohOH8MQi/Wti
rReWTShRPoUOU1zat+wE0KfWpAY7owM=
=TNVs
-----END PGP SIGNATURE-----

--PlRoT138GtctrPoH--


--===============6033706737623120958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6033706737623120958==--

