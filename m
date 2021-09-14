Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AA8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 10:14:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06948610F9
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 10:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06948610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hx4anZhl/X01UIk2noesndsVXPECHAdb/sE80oHC7D0=; b=sZYIAblcDe/bYXFsLxYEHgmbCm
	4d8G2ZfZcOqN1RxqiMiCEqqUtsMF0PgU/97Dx5t86yIQp4IlIDyNjNTsl6uw9Rw2BcpmRGGb+DJMP
	px0SdkUdb//X2kw9T/kfUzPMqBeYXOEana3TN5fftN5H2vPtlIVoaedwJ6IdTpIBoPQe97ENXSGj+
	ubInYsjuiMRKkbOBtB4gMW77PpC0apBLOwiHJ8DJKJ8zxsayFfxBSYKKNmqjJrM0f/ptq2ylmstMT
	ZQ9N1GpoxhAJIMjr3+wZDDoCh7c3BtHuGv04roqhBhlI/ZT3+IlQG8WZ1TnGo0jCBeBtKAxdBpwKP
	7CJvchLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ5Rk-005BBy-1w; Tue, 14 Sep 2021 10:13:48 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ5Rh-005B8k-AY
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 10:13:46 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 2394F2B012D2;
 Tue, 14 Sep 2021 06:13:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 14 Sep 2021 06:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=oBkNfwyFzUbtgbbxm3sHHN53g0U
 wRCANpiEbWwktEsI=; b=1saxKCPQGLyQ9IO2OCEV6o2kPTwXjd3vIQWapzf+fgb
 UrZX1Z31cJBJH3O0CvzaCg/tJkaEdV+0R6lk0cYA+rZfyc2qOpIvEh3+XHu1Pos+
 fvkJVg+kT7eusAULpNBvxiQsVXYmOxgrNSR1RZjT09LjCZKSxUYtOQEKYtKJvJ4a
 yQOReC6tqf+5wImhT4ZO6iJpNzHiELkq6QJ+xafntOwLx5XeIPlQRcKeCMM09t5o
 njLYtmJXMM7j04HxnUnrGh3ytwZ0Wu7yqjMgcJpqtCzKrr9Fn3sCorKJJqakz015
 W5ZMOobvkDQK2RjyHOfwZVkFRgwFN6ez+3sU9Z8aL/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oBkNfw
 yFzUbtgbbxm3sHHN53g0UwRCANpiEbWwktEsI=; b=fMXTe22TPUjVB0nQGW/3a8
 CIVrrOSnSNZOEcSpfwA8vNQubDmNMKhzvpLEeS71tvXMf/EwQoKLZ7ItUhGCW1tS
 G8KQrpTPC8gkugyxfY2EFx4ldevGSRS0toLemois9zOzY/oHXesYC4squj9fGWIR
 4rwM6m3sLmQ1gJ5Q/DEDayWghxTyfyL8HXvP+PRk+axI5cE9TXh2erkAcDUk8tOV
 t+NUaonwkCTGXimxrQkDXaqNQzfsRgEiviuRQBZAvciS1g2+14UbaafZPthI3jlf
 XSmgBKf5YhPb6QFZ3mBlD+cqdlTupVo6whS4uulpG5CddzMheuY2fHNN31RpyPrQ
 ==
X-ME-Sender: <xms:yXVAYbAM0iwHcxani78TfepPJ6irhUYyuxp0qLWL-Ja_IGRcCW7xNw>
 <xme:yXVAYRijC2fVqg7QhatKutOfgIDCUbzsuEryoPb3NqepWou-Z24MdN1sbyhvkxBJ1
 48vSx45vj-80PHyR88>
X-ME-Received: <xmr:yXVAYWlZ_HWSTrWyPik46VRYoL27Q-2-6wfjJ2oeDClJCioBsWZ5e0fm0MY2pq-fXcWMiMirsPxU-JzI6rvv1QpF-FWH9Jx8Zyiu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yXVAYdzTdbRlpEDy3hE0K7RDUO3DnmSX2VlgiwnJ4G0nmVURW4B6iQ>
 <xmx:yXVAYQShlgXeh0lvaJGEFaIren79h9upkTV4D44J3yIM1WdtR9Ds3g>
 <xmx:yXVAYQbDYh4Xry2PetppjAx-z-khpXo8-u4k1GzxE4xpInri6PeZFg>
 <xmx:y3VAYZTbrtyLiJeLzEM8XDa0LznC8y4g5sNdg7YjpkgjASH5p-q_8jU_yYU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 06:13:29 -0400 (EDT)
Date: Tue, 14 Sep 2021 12:13:27 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Christoph =?utf-8?Q?M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 philipp.tomsich@vrull.eu, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, wefu@redhat.com,
 Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>,
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 Guo Ren <guoren@linux.alibaba.com>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
Message-ID: <20210914101327.47baun6mop3mc56j@gilmour>
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
 <CAJF2gTT_8VLTt0B=LxXAPWVpHaBaVxy+V0rGCjr7JZyRiO7LfQ@mail.gmail.com>
 <d2ac3da8-f4d5-52c1-da7f-f8260a0bb604@infradead.org>
 <CAJF2gTTVj2J6_rCXAG81PB3vJZO2TTwpD03vAE2q+K=9zh_TzQ@mail.gmail.com>
 <CAK8P3a1TY+XT1vF=wAh0XA5BXU5Z6Ab1d4DekXbVsN9aj3aL5w@mail.gmail.com>
 <CAJKOXPdH0C0CJe_oxZ2rG1UeE5G9w2mh2Thh8LynpNHQk2g1qA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJKOXPdH0C0CJe_oxZ2rG1UeE5G9w2mh2Thh8LynpNHQk2g1qA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_031345_458188_F2780FFF 
X-CRM114-Status: GOOD (  20.14  )
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
Content-Type: multipart/mixed; boundary="===============2515674226797539022=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2515674226797539022==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bilmfgj3f2ue6b6g"
Content-Disposition: inline


--bilmfgj3f2ue6b6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 12:07:08PM +0200, Krzysztof Kozlowski wrote:
> On Tue, 14 Sept 2021 at 11:31, Arnd Bergmann <arnd@arndb.de> wrote:
> > Some subsystem maintainers want drivers to be selected by the SoC
> > option, this is why you need the 'select SIFIVE_PLIC', but usually
> > the drivers are selectable with a 'depends on ARCH_SUNXI ||
> > COMPILE_TEST' and enabled in the defconfig.
>=20
> I would say selecting drivers is even more useful for distros and
> other downstream users. Especially in the ARM world where we have so
> many different SoCs - how could a distro person know which driver is
> necessary, important or useful? Having all main SoC drivers enabled
> when ARCH_SUNXI=3Dy, helps distro a lot.

Imply, maybe, but select is far too painful for everyone else.

> > If you want to get fancy, you can use something like:
> >
> > config RESET_SUNXI
> >         bool "Allwinner SoCs Reset Driver" if COMPILE_TEST && !ARCH_SUN=
XI
> >         default ARCH_SUNXI
> >
> > This will make an option that
> >  - always enabled when the platform is built-in
> >  - user selectable when compile-testing for any other platform
> >  - always disabled otherwise
>=20
> +1 for this pattern.

Yeah, or a default

Maxime

--bilmfgj3f2ue6b6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUB1xwAKCRDj7w1vZxhR
xaW4AQCjA2HZIq35rcUZ4xRg5zpPUX/IlJenhzSsJVR4kVhhUgD/Qfn9Rkd94UgU
C0UYsWax+a1VpEmYSy5tBJAotQXQvQw=
=u+RQ
-----END PGP SIGNATURE-----

--bilmfgj3f2ue6b6g--


--===============2515674226797539022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2515674226797539022==--

