Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DAEFC592F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qq6P5iVuKJjfbU/+QqY9UQRNYunLqViCs+d+7ylKMBc=; b=JA2vZMMMYpMYspj3BHGrAfqxIr
	4Y/pQ6pyFWrL6Wsq3gKjey8qaAJ6amJcgzb+KRiJsJjjbF7X25ji+8PbpqWOoT+NwtaexFtB+iQKt
	r43tQPZZbqCOerA05cj+WeBsqcEBa9aaUN32j8F9Ngwev6rme/uJukN4Ek6IvbbA6/LRFOuN7dHXj
	lms4hj5++K44Ig02m7bT9c9/fshcjI+P5vIYivRskCLC/sf3GgAXd+ashsch7B1SzPTUXjVO8fuIK
	2iFpDklVJT0byILe9NqiTAKkCkXMrcbytePNv3p6hxYNW2TSImsIRVwmT+mOLhSGvjAQraSvCXSIw
	npIOYTtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZFZ-00000006070-3sPY;
	Thu, 26 Feb 2026 11:09:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZFX-0000000606H-2EMr
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 11:09:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CEC59405D3;
	Thu, 26 Feb 2026 11:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE57C116C6;
	Thu, 26 Feb 2026 11:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772104182;
	bh=Kc3y4vF5C5ht3a1XMvsgWskMHYvLykSYzITc23T1NDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lMwXjfJRiBEVT78l5CXkOIawXNBob9Tdyzc3m9YFg/yr5NW3jo4xUaZtWPHv/0yac
	 /Hly1F07PxVhWGDQNVpxeu2kGBaCqUkT2niVyH2Y51jDtlazKYy4ZzF0zT64lhSV5o
	 LqftKpjqtq5SNHLyEZNtnrjab3+k7UHOZzkEAVCuK6S/GvLCFQcQA2x2unfm1lRdd+
	 3dnowboT25KCF+kAVqUMa4lMBCn4RSwnSPU6Qw/z3VOAKkQZVJulE82qq1AlLjkWcv
	 UStRFoipY7jmgC/3t5JHneFEUpm8fXDGBS6hTpKTLLiA2ZFH/pDkKky4e68MHVo1Z4
	 9KfmULnHylmTw==
Date: Thu, 26 Feb 2026 11:09:35 +0000
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next v2 1/8] riscv: dts: microchip: add tsu clock to
 macb on mpfs
Message-ID: <20260226-untimely-overcoat-a335a7016adc@spud>
References: <20260226-snowshoe-amusable-6716d4ddea11@spud>
 <20260226-briskly-severity-69c2988e8dc8@spud>
MIME-Version: 1.0
In-Reply-To: <20260226-briskly-severity-69c2988e8dc8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_030943_585783_3E31E6AA 
X-CRM114-Status: GOOD (  12.43  )
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
Content-Type: multipart/mixed; boundary="===============5034384852285071922=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5034384852285071922==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HXcvzNaRR2Bb/QYt"
Content-Disposition: inline


--HXcvzNaRR2Bb/QYt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 11:03:16AM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> In increment mode, the tsu clock for the macb is provided separately to
> the pck, usually the same clock as the reference to the rtc provided by
> an off-chip oscillator. pclk is 150 MHz typically, and the reference is
> either 100 MHz or 125 MHz, so having the tsu clock is required for
> correct rate selection.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/Makefile.orig | 26 +++++++++++++++++++++

Of course I noticed this only after sending, but this patch isn't for
net anyway so it's kinda moot and I could fix it myself on application
or in the likely v3.

--HXcvzNaRR2Bb/QYt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaAp7wAKCRB4tDGHoIJi
0uBQAP0Sp42MPDxWXYk+ByvyugQefv2Lt1layvBUVWDkCGvzLwD6A8UBJsHEysQT
QWWCpEpvz0l96P/zT0bSG3dWzXFJhQI=
=Mz+3
-----END PGP SIGNATURE-----

--HXcvzNaRR2Bb/QYt--


--===============5034384852285071922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5034384852285071922==--

