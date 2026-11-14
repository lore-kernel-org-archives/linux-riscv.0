Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E69606A335
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 00:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nIViUWb6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oVMcLii0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IOZWkyWvepX7e8AUTWZmHzOlh2EtfXiMXeV40CD0+Ks=; b=nIViUWb6MovnpjLBGUu4z1c5Wc
	sRkUu1JlgadlqPglTYIedLBXzm0Su4GxXT++0aa9zB/jHlsPBoRgnrl95b5SaTC69LhboF29ha5rD
	LohiAjm9FqMTbjvtWuulDH/F05Yr0R3TMm2vgZR3vRXqzs+u/BQFK5qLCHcre2afojFzQVdNXuDzH
	ijWxApJGKaxSnaTbPUilsPK3UkEC5e5eJ1vXQVzzWMhKZTJSAmtSfqyUaL0ObfcahZGur+vME2TWX
	JCMdfAOh+b6ME5sVsYlXBueqI3b81TLOdTmC37Tpuce3d2ubTAarXDGKN0O4KqxYpvyCSvzLEU7X2
	XDEgyFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1z4-0000000ExET-2S2A;
	Sat, 14 Nov 2026 00:51:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1z3-0000000ExED-0Owh;
	Sat, 14 Nov 2026 00:51:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91698439C1;
	Sat, 14 Nov 2026 00:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560D81F000C4;
	Sat, 14 Nov 2026 00:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794617468;
	bh=4P7DMRpzI67L+ckc1ZBMVeAzQ4J+BH4io4JBuf9M6QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oVMcLii0dUHW5lJ0aO2FOmzV+DtpO2BAO3mNVRP0i0LIE6D5kLt6SrgDhXsucm8mC
	 C8ZQpUMueJXSpnm7ywh3lwmbIMgUwhyXiAAfrus8oblsQmbj0zZCRx0MfWCawJGdDa
	 EefuKEHnAmO6bpzC8yMwOuUfyQSeK5FtDKXYNT4eduq0M3/iHfMDpUCgQUOM1dJoiF
	 Sqbplwg5b3TwtDDG/NEY3JqGAqMM9xSxxoJ4Dy7xxpu9dhxQ1hJP7vvENFbql46WqB
	 CXreMYZzU80aPeCqlP634fGxyAOCYtEuGDKtqDac3RsNQF8BdP16XOxkOkI3lmUP51
	 C/CJ9RPPV57Lw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 8D99C32AA096; Sat, 14 Nov 2026 00:51:06 +0000 (GMT)
Date: Sat, 14 Nov 2026 00:51:06 +0000
From: Mark Brown <broonie@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: william.zhang@broadcom.com, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	pjw@kernel.org, samuel.holland@sifive.com, kursad.oney@broadcom.com,
	jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
	anand.gore@broadcom.com, florian.fainelli@broadcom.com,
	rafal@milecki.pl, linux-arm-kernel@lists.infradead.org,
	sven@kernel.org, j@jannau.net, neal@gompa.dev,
	asahi@lists.linux.dev, ryan.wanner@microchip.com,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Subject: Re: [PATCH v2 3/5] spi: bcmbca-hsspi: fix division by zero for
 devices without a max speed
Message-ID: <1d8b7784-f217-45ef-8f09-658044e441ea@sirena.org.uk>
References: <CAHi4H7GHGO27Q=O8Upfds8jk-ujSHU5h91hCZw6qjftNX7a2Ng@mail.gmail.com>
 <20261111173637687ugnRPRBKJkF0zihl662i2@zte.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261111173637687ugnRPRBKJkF0zihl662i2@zte.com.cn>
X-Cookie: I'm wet!  I'm wild!
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5671489848339062872=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============5671489848339062872==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D7xosyWN3K0hIeX/"
Content-Disposition: inline


--D7xosyWN3K0hIeX/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 11, 2026 at 05:36:37PM +0800, shao.mingyin@zte.com.cn wrote:

> > IMHO the upper layer should fail ... rather than having the controller
> > driver to override with a risky 1Hz clock.

> Agreed; the fix belongs upstream of the driver, not in ->set_clk().
> Mark, which do you prefer: reject max_speed_hz == 0 in spi core, or
> have these two drivers clamp FCW >= 1?  I'll wait for your call and
> won't spin a v3 meanwhile.

Ideally the core should do this but that's quite hard to do due to knock
on effects of handling 0 as a default everywhere, together with having a
bunch of existing drivers that don't provide any information.

--D7xosyWN3K0hIeX/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavewegAKCRAv73Ows9A4
iWN2AQClR5sOK8gylXjPGozoKNkL8che7F9VYkofFkYIAbamjwD/ReYiG72diC+8
NHMu21kmTY9APQadD0105SE1A4OM0wg=
=FhG5
-----END PGP SIGNATURE-----

--D7xosyWN3K0hIeX/--


--===============5671489848339062872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5671489848339062872==--

