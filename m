Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C79CD2CE05
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 16:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKRcgkY3TgdeENP3rOgAOOz3TcEY2Xb4JN39h03tGK4=; b=HoA0OL0rXoF5h7H8p6OqmUr+rk
	j/8kS2yQz7nUuWrjD66CfUPzMwC/hU57WA6gaEMZjwA8aaSXoW1R3buV48CfBbstSJfDMBwuwDkcy
	okF9rqORZ8GLLmuGI+zIx0GJiFzh7zvXV40bq1sEwnhqTDvtfclxy4ItjvVi/Oxel8xUwseNwSOFX
	iWUtJjNc1ICkRGF+4RR4+kaloR0ykdFTLp6dbgdJ/UKeqVsS0BC/X/7KL8NPhYyxlciAcaN4SFltb
	tPuTHWJ9kHW4M5TbqExUo7ZQcyE3IgIASxc0nHkjfovUDDz976qGgsZro0HzOfLHue5FhN504YsIH
	CksKJyvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3IEO-0000000BZTC-2UH7;
	Tue, 22 Oct 2024 16:59:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3HsQ-0000000BUXb-1tsl
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 16:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32B125C5E09;
	Tue, 22 Oct 2024 16:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58DAC4CEC7;
	Tue, 22 Oct 2024 16:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729615017;
	bh=BTDD3Fw+/u3I447F7vF/WWQoCy0CZu+9QabZG+ZAo/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/rfhmDmozheiqVB0k8mYEhZpyVjOTHCZBJTayCR17DDZbpO6sA0+248C+lPOR2wS
	 GgoNww8s2WiDPGLwnB3gUpYYWetpUWI5asMy1KvO7HzR72Qrrs/KU+63t2Q7GsrXu5
	 TArt3BROdroNVKZPT7F+DDIRIAjfyb8qyiw4xNr/6dCSrDd0z14d1gpRNU3yjW6IZF
	 vKeF6SipwEjneRdzZQXpFvUQQtnJVJrTs9zKl9nLFEmCKnQlvcB2ej8snWnwBw5R1o
	 vf/0Fol2n7dOEPh35ko/dmb1kncT/yG1Fpqb2vUjiP493cVzICTHOi8leo2khbMv4k
	 0k4qozhqOWV7A==
Date: Tue, 22 Oct 2024 17:36:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: dts: Replace deprecated snps,nr-gpios property
 for snps,dw-apb-gpio-port devices
Message-ID: <20241022-bulb-ruse-f9ba00aea2b0@spud>
References: <20241022091428.477697-8-u.kleine-koenig@baylibre.com>
 <d5vjohhftbx5zlsay6hfij7p5qbcrrebnj2sspsdtkgrkz4scq@aifcdtxcqqqd>
 <gtwdkkeckdtcfkovfljfoaplrhdjabqwagcvvub7zdnwp3dyqj@lztfrve6zhmh>
MIME-Version: 1.0
In-Reply-To: <gtwdkkeckdtcfkovfljfoaplrhdjabqwagcvvub7zdnwp3dyqj@lztfrve6zhmh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_093658_559423_F3E28BCB 
X-CRM114-Status: GOOD (  13.71  )
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
Content-Type: multipart/mixed; boundary="===============4636368540040971599=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4636368540040971599==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KaE63Gt2cT8ASydl"
Content-Disposition: inline


--KaE63Gt2cT8ASydl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 04:08:37PM +0200, Uwe Kleine-K=F6nig wrote:
> On Tue, Oct 22, 2024 at 06:04:17PM +0800, Inochi Amaoto wrote:
> > On Tue, Oct 22, 2024 at 11:14:30AM +0200, Uwe Kleine-K=F6nig wrote:
> > > snps,dw-apb-gpio-port is deprecated since commit ef42a8da3cf3
> > > ("dt-bindings: gpio: dwapb: Add ngpios property support"). The
> > > respective driver supports this since commit 7569486d79ae ("gpio: dwa=
pb:
> > > Add ngpios DT-property support") which is included in Linux v5.10-rc1.
> >=20
> > Please add Fixes tag.
>=20
> Ah, I expected that the usage of snps,nr-gpios in the dts files predates
> the deprecation. So we could add:
>=20
> Fixes: a508d794f86e ("riscv: sophgo: dts: add gpio controllers for SG2042=
 SoC")
>=20
> . That's a commit that just entered mainline in v6.12-rc1. But I'm not
> entirely sure backporting to stable is sensible.

Ye, I don't think I'd bother with a fixes tag even, since it'll probably
get backported automagically if you add one.

--KaE63Gt2cT8ASydl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxfUpAAKCRB4tDGHoIJi
0k5DAQCzNXMFFKBiB54D0Echm2fKmYgLO5iCAlqcVTg9iNWCUwEAi6+guhhWmycD
XSTGQVYZOrBQAFe1/x23lGp7SoyulQY=
=7tvp
-----END PGP SIGNATURE-----

--KaE63Gt2cT8ASydl--


--===============4636368540040971599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4636368540040971599==--

