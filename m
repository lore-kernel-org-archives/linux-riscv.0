Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E77AC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 20:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIlNph7fb9+gw0aDd1IQqi0gv2hpq5MA8kIJTgeG1Mo=; b=rEsqz+RPMoMrbTEuWDUR9rbIEV
	FMQVMzHb2m3CMNdq0XiLY3PjUDJUjn8FNewYYwmi66YiAe5JDQVsQ2FRMRxvChAYAAxJQB79fbjd7
	ooK4fDi555KT0FjY2xJJbmlKH5twOgp4BFYtaueC6rT2KhHJcLRR1A4TGpUdpofaD/DH1xD25HYuZ
	GHGCmVo5olEkrZ73n2QXBEkIBomJV6oky8/iiem3R16O/iXT/J/sv5jILrJ69vTmNFU0anG3DVBKP
	tkp/bn9Bl6PQanG8XHGj6DKq5xenXuVLsaI1cvtUKT2M5vaXVxHPL8SHC2GvbScXTD46d+RkjLAYZ
	DJ3XF0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAH24-00GIxf-3t; Tue, 27 Dec 2022 20:58:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAH21-00GIvK-KR
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 20:58:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B940EB811F9;
	Tue, 27 Dec 2022 20:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00168C433D2;
	Tue, 27 Dec 2022 20:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672174718;
	bh=QHEGwcrBeKpSgFkBiLCph3tiMgxRBw1ycy8RzAhX6PI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AwFIma1MMVDat719aZNerCFUekEoWxXFJzPinva5LqNzBLiCWUNYwTlRK1s3IGHTs
	 3XR47blM/w40zCnndMiIxo1zbm8pbXn/tOwS7+gww9TvW6Oxt1isjBzC9W8EfXAN/q
	 RGF1xD9d8fzeiuA/sJAFt1lD3ThsMJT+mluTNYrQn/ki7bHaJ333Ma3A476Wak33Tf
	 A547kIY5lw09vFV8mj9Xa94QKyXXqxgB5o04Z46NefpNmy781p1hkFUAkRkwgl6LWa
	 DkbPk5uPSpZL7WNGMRl7KRI5zfz4a4gOGv/lXpfMedvIT8t5tOKXAypj1F8wwpGgsM
	 PluBSTjlKQu3Q==
Date: Tue, 27 Dec 2022 20:58:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
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
Message-ID: <Y6tceOCC+YFtSY6F@spud>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-7-hal.feng@starfivetech.com>
 <Y6Ipv0BUummgqNaw@spud>
 <e23460e8-0ca4-b20b-e48e-faeca4f30e88@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <e23460e8-0ca4-b20b-e48e-faeca4f30e88@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_125841_878931_491B5DF0 
X-CRM114-Status: GOOD (  16.25  )
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
Content-Type: multipart/mixed; boundary="===============2876416382288620674=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2876416382288620674==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="464m7fZGrAuzw6lu"
Content-Disposition: inline


--464m7fZGrAuzw6lu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 25, 2022 at 10:31:41PM +0800, Hal Feng wrote:
> On Tue, 20 Dec 2022 21:31:43 +0000, Conor Dooley wrote:
> > On Tue, Dec 20, 2022 at 09:12:46AM +0800, Hal Feng wrote:
> > > From: Emil Renner Berthing <kernel@esmil.dk>
> > >=20
> > > Add initial device tree for the JH7110 RISC-V SoC by StarFive
> > > Technology Ltd.
> > >=20
> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > > Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > > ---

> > > +		gpio: gpio@13040000 {
> >=20
> > > +		gpioa: gpio@17020000 {
> >=20
> > Out of curiousity, why gpio & gpioa?
>=20
> Oh, is it easier to read if I change "gpio" and "gpioa"
> to "sysgpio" and "aongpio"? Thanks.

I think those would be more reader friendly, that's for sure.


--464m7fZGrAuzw6lu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6tceAAKCRB4tDGHoIJi
0j1sAP9thq/K0P0uAxqb9fdxkY32mRYoo0Mkz4I81vVs0Y3poAD+OeXBv0pzKxhA
5mWXZb9nal9rZttUALcPO3BAiMtptA4=
=zfRm
-----END PGP SIGNATURE-----

--464m7fZGrAuzw6lu--


--===============2876416382288620674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2876416382288620674==--

