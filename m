Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BC7D1D88D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nybdT3jABPfrYakY0Dmmv7G1HD65H9P+UmZjsAYnM/M=; b=ZzTfl1/H0PIlMeZVxf8hj9FDxF
	Eux1KPFIatZfWhppRuejC1+kNsOU6Xntui72phigulO1AXPR6MKQU3Fo2NOiGkhjyTCxjPGv3VVjs
	fpXLl+vedkeaQ/CIF7S/YaXJbUHMeE3thnJvUq83dUK41x/5veMnAMYahTfazFzow3BnbXPmczQ4x
	PqkXrJcWFi9oSEmCjYB058052rFenJCBWbHq9IlxgP5fBrVAuORrJ1ylOZlk3toTGeVaDf+iAfilb
	LMQRcUoRu5aXDKuw0yErzeaCBpTFPg6LXIX/Yc2HaZCBe92/qM1kwHlb+hkAWKjn/eUaFnDnhTAHZ
	XOjlcjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lDm-000000090nv-2kkB;
	Tue, 15 Oct 2024 17:20:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lCg-000000090cb-3O0H
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 17:19:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 573175C5DDB;
	Tue, 15 Oct 2024 17:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CADEC4CEC7;
	Tue, 15 Oct 2024 17:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729012764;
	bh=FhkbhlgNxWEmO+oPRyTU6uVeuYw5m/gMtNzAr+fT0u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4ZvLcB4rzhfcEMm/U9LacCQopKJrXmaFY7/0vZ7NnfOSW3gBDltxBAgVu0rU9a5/
	 wog0LZiXa9ccbp0RhgsQ2eAzOvfB6Z0xqia4uR5MEPsKHCCgsZh0NLmltsLeqf8YXX
	 BgLIW4Ma8EeUxls6ZHjQnDWtSOIOjMV/VSaGCX8hZ5bMnv2TgOwpO+sc8vQyh67emF
	 seTwrtpPmrXqqtZw7JBKeU7Le3OaQVlTpzYrH20rCKn6iG6Eu7ZwwUbj/1GGhwX7q8
	 L66WGygvbv37g4aV1tGN75PYJk8rtm8ZC0ciVoBzf16imH0eF+9/OMT6LLn7nLKUVP
	 oINQnr6t+AYQg==
Date: Tue, 15 Oct 2024 18:19:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] riscv: dts: thead: Add TH1520 pin controller support
Message-ID: <20241015-thriving-dizzy-4708ff6b6ebe@spud>
References: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
MIME-Version: 1.0
In-Reply-To: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_101926_910223_12BF51EC 
X-CRM114-Status: GOOD (  14.84  )
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
Content-Type: multipart/mixed; boundary="===============6363303930010041988=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6363303930010041988==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7eHvARJ0qZ9bqrij"
Content-Disposition: inline


--7eHvARJ0qZ9bqrij
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 10:54:17AM -0700, Drew Fustini wrote:
> This series of device tree patches enables the TH1520 pin controllers on
> the BeagleV Ahead and Lichee Pi 4A boards.
>=20
> Patches 1-7 have all been cherry picked from esmil's th1520 branch [1].
> They do not have the issues pointed out in the previous series [2] that
> I sent out which contained out dated versions of the patches.
>=20
> The final patch was suggested by Emil as there are not currently any
> users of the spi0 node so there is no need to enable it in the board dts
> files.
>=20
> I have tested on the BeagleV Ahead and the LicheePi 4A. The leds on the
> BeagleV can be controlled as expected through sysfs.
>=20
> [1] https://github.com/esmil/linux
> [2] https://lore.kernel.org/lkml/20240930-th1520-pinctrl-v3-0-32cea2bdbec=
b@tenstorrent.com/

btw, this should have continued the version numbering from [2] and been
v4

--7eHvARJ0qZ9bqrij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZw6kFwAKCRB4tDGHoIJi
0iKiAP9mkgOWt54JWWibeBYm9kQHvB+cdUrB5/JTwwsTV4QJ6AEAtT6lhapsuR6A
c3DRBdDzUaomKNpiObcWJE5ZXd49DQQ=
=bgwm
-----END PGP SIGNATURE-----

--7eHvARJ0qZ9bqrij--


--===============6363303930010041988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6363303930010041988==--

