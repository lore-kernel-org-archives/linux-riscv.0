Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD08CAC5A7
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 17:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ponV2vi1/VrmAz9GrDokMcdPvF2I0eKQ4P6k8DLwbw=; b=wzv3rHAGWmW/QRxH28yLX7wnb3
	gyX++71mJWPXApJJkxd1TvR5MCiyZvt6eNSd79bpOsAu2sA6M4nQb7VN4q2xmdMahfPsYjJsJzCO5
	wdgrZ8lCnOOLruXX+9zH2BbSI2sXroI3s6jF0zrlmSv+gif0aHTcsKF0mL2oq4El4Ul+ltBzMnj9f
	sAQ/4VF4e3EKU8aWfoDIO249xO4+HRmWg3Zqvt0Jb3oZNXTcroxUWWkb3lW9SBeImpzFABbGz/Aoy
	tBXB3MsqIxuYwRj7VfLhr1h9IzQ9XCq/biXXH7ie5MAvqK82rw4sUorCbD+scYh8GDUUpHYkDFHiW
	FsVIb6fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pg9-0000000BV8O-2wIn;
	Thu, 25 Sep 2025 17:22:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pg8-0000000BV7n-3fen
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 17:22:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E71C61199;
	Thu, 25 Sep 2025 17:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA8DC4CEF0;
	Thu, 25 Sep 2025 17:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758820967;
	bh=wlNFWQy/QGmy4ugZQpMqvcZwNqcTbX3wzcNBtn70tgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AOeSEwBoMx+rebxEesl5Kn1nXCWNTpQGO+7sNocttr9/JJkWcXrZB/QTJBK5eTyyf
	 WJUiQ1C705eWVN5mtgpXjSpxGsApBWhoglAM9K6vEE3UEb7Hu9SmR24q3rM0bwBRiT
	 SYwuhKa5zOg6lcyffC3pxJzs4e2vag+FwoEilYod034NRDkeEXGs5N5g20s4lmk6n5
	 +Lxn3VOJcLNJn3ZDoHCkMcW+yX5RX6WvqxOMqA8Ny43FuPASiQgL7Jayd5tFxu2xoB
	 7yrYAv1N8K70XckEKYV5C4TVpA2vgfhAhUQJ2HI4PmRxIGNC5814fttrAGu36ppbcY
	 bQAlP6dCgTGXg==
Date: Thu, 25 Sep 2025 18:22:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 00/11] riscv: Add initial support for Anlogic DR1V90
Message-ID: <20250925-chowtime-stove-4078dc1af2b0@spud>
References: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech>
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
Content-Type: multipart/mixed; boundary="===============8710874730580763997=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8710874730580763997==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MNfIA8O4BYWQqWG8"
Content-Disposition: inline


--MNfIA8O4BYWQqWG8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 08:46:30PM +0800, Junhui Liu wrote:
> This patch series introduces initial support for the Anlogic DR1V90 SoC
> [1] and the Milianke MLKPAI-FS01 [2] board.

It's a bit late for v6.18 content, since the merge window likely opens
on Monday, but how do you intend getting the series into mainline?

There is a document https://docs.kernel.org/process/maintainer-soc.html
containing information about how the platform maintenance process works.
Arnd has suggested that the best way to get a platform initially added
is to send the whole patchset, rather than a PR - it leaves you with
fewer things to deal with at once. This patchset should be sent to
soc@kernel.org, with a note saying that it is ready for inclusion in
your cover letter.=20

Ideally, the initial patchset for an SoC should contain clock (and
pinctrl) support, rather than use fake fixed-clocks, but you have none of
those in your base dts so I have no objections. fixed-clocks can become
a problem if the dts is imported into U-Boot via OF_UPSTREAM or
elsewhere, since it can cause regressions for them. I would highly
suggest that upstreaming the clock/reset controller is the next step
that you take, because other peripherals are going to need clocks.

Please let me know if you have any questions - either by email (and it
can be off-list if needed if it relates to platform maintenance
questions) or on irc (I'm conchuod on libera.chat).

Cheers,
Conor.

--MNfIA8O4BYWQqWG8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNV6YQAKCRB4tDGHoIJi
0sTUAQDxOrAl5pk32YMhLmtZaHDiTchFhUiAGM+lO8Yo6wqSswEA8lvwYkNs6FFB
/jn1cq3RoQClzGcAQSmeqYHqeG+8rQ8=
=oXli
-----END PGP SIGNATURE-----

--MNfIA8O4BYWQqWG8--


--===============8710874730580763997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8710874730580763997==--

