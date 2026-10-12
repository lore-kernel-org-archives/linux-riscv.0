Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF7BCA9EDE
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 19:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nuGiOLWRtxtX9NmKF5qvDbHp1SzIq5HvJ82jY6C5KE=; b=1M0P9nHzM9upGDkFhNby084l+6
	9Dbo7sM1F9XpgXzjyUu6ECjSpmYz2PE9PPb3EGQsh5vvdOA77A43QxB7s18pyn69lFv4MVsYiABVR
	IpOHwo9giU/+E0Ee980LZrh8F0ZVvdoiE1rV4kRCc6rVoQZhAUJH8IXn5s7dj38HgrDyvo97Bf7ys
	+cpm6amOsK1HuV8ShZtO5S1Osq+HJWaXZjjUTnB/tiOZl6r8tKuu/FI8fVAcLcw7t3L/6tUxnCEhZ
	2+Tu6nsiKMwQN1UJsRxkyIsoGo6ZQ3iHDhyndU36tX++has8vUKFjGkq6G6PgpyHk9zoSMYjpaLK5
	+zhIW6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLJc-0000000BLOl-49LX;
	Mon, 12 Oct 2026 19:04:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGLJb-0000000BLOD-1bIh
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 19:04:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BCB6A6025A;
	Mon, 12 Oct 2026 19:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20BF1F0089B;
	Mon, 12 Oct 2026 19:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791831842;
	bh=1OMZvB79RqI+kzQxp/CVoXY+jNcNnaUcK+X647D0SSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lHkPhq8MYEERkEq61elsdCcJ00F8yBEv+2n0x3NF8LgWBeBWKlKNTs0hsVVf3QO7m
	 6SynsFOO7uH3D2RLbB/7j8QQlob5Wpccl00XMbwo2aXB2fJvevukvTGeKTjOGn1J1Q
	 Gllz52hPXWC5xqJEx2/6dBXha6gHk1W809B4Fej2BWII5I75efTtlHjaxvaSj4v9iQ
	 tgelNi1PS7xPVjNfFS7KNmGoGKxqFrjuDpJhLOes7MkGG9K4jsaBhWuLcJvae9J1L/
	 j1bZ1h5WtwmHBMKPkY9hE73MrpDspCp5/X2Dqh7/W+VYcC7HB5oRF5kZTtlyA6ml7+
	 hXuGZJ1U/IW1A==
Date: Mon, 12 Oct 2026 20:03:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v6 00/15] Add basic clocks and resets for JHB100 SoC
Message-ID: <20261012-grass-guru-1ba876eda895@spud>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <179180050741.66744.3459927533880490879.b4-review@b4>
MIME-Version: 1.0
In-Reply-To: <179180050741.66744.3459927533880490879.b4-review@b4>
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
Content-Type: multipart/mixed; boundary="===============4369260597905432567=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4369260597905432567==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FFX0NmdIYzkgk4y3"
Content-Disposition: inline

--FFX0NmdIYzkgk4y3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:21:47PM +0200, Jerome Brunet wrote:
> > The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> > subsystems:
>=20
> Nothing really forces you to send them all together.
>=20
> In the future, could you try to send one CRG driver at a time ?
>=20
> It is fine to send big RFC to give context but after that, if you
> can make you series smaller, it is generally a good idea to do so.
>=20
> This helps us iterate on the series faster and then you can fold our
> feedback in following series (instead of repeating the same comments
> on multiple instances of the same thing) Thanks.
>=20

> Also your series does not apply on clk-next or -rc1 and no pre-requisite
> are mentioned in this cover letter. Consider using b4 to point out
> your pre-requisite if any

The dep should be the PR I sent to Brian, but I suspect what's happened
here is that the MAINTAINERS parts of those patches (which I had dropped
because they were all conflicting with my tree) didn't get reabsorbed
into this series. Very annoying for review of course, even if it's a
non-functional conflict. Of course rebase on top of clk-next would've
highlighted that to the submitter!

--FFX0NmdIYzkgk4y3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas0vHQAKCRB4tDGHoIJi
0p4KAQC1kQ1+cKFzcpOgn95+wlYJze0mqmVjCR0pb2B6IOdvqQD9HAk4N9AhWxVZ
V/yO2UvmUb9rqNSOqVsZ1VhZkGmMAAA=
=v6ol
-----END PGP SIGNATURE-----

--FFX0NmdIYzkgk4y3--


--===============4369260597905432567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4369260597905432567==--

