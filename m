Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2E4C54FB3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEDghNJSnHhv7N9srU++SLPXhQfhaGF2t6n8sQzXwQY=; b=t2jcyWYpV3I0w+wOBhELLGhWTF
	2Y7WLjw4hN7R/bnU/66XaxhoYaZBK4SNq26dL1OEOauUAMgGhMLbTAyolJ4wdmOv5UK3LdYiqp88l
	W/uf5tgCT5ZYSCzNLdl+hhWRv4NWiLTteU+ApJBs5T9vuzVPaVIe9NT9WlcCMXAIZ4DH3MuagaAje
	zu6Ihj4yJj1SxIm0cs6HEdnCT/MWiCIcUqXpyqF0kdzE7BKaOgH3FWnijX4OGQ3vNtJMTnj0y5x60
	YhweVj3xGlNtYHLIikM4bgndWaEaEbcH7gJjjXn8p8yHZ7f71uHdiUmwAHpQRI5fKYVSw1t9PYFjd
	08rBLz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJbX1-00000009JWZ-0LSR;
	Mon, 26 May 2025 17:22:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJbWy-00000009JVp-2vjG
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 17:22:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F4212A4F4BC;
	Mon, 26 May 2025 17:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E24C4CEE7;
	Mon, 26 May 2025 17:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748280151;
	bh=rR0L3LQFJl5lnuDlkm5fGXdF8rlpXRpdN7zYcCMT5tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCn0el/OQuUV5N4jWDVcQWObrc8/FZmxWKlyOSKLkxlBs2K4fOkzUda5X+0Kam+OT
	 a4U7iSSqbk2PUqCHkmuDCSFsK1117VLQQOP3oMoetKAlRNGda2daoD9xj0G7dJLitA
	 dw/uWtNgMXU5zhLg1sFQntHkJ27qbI3KYPv9HTlWeFWxpj+3/5jV+EcddRbpj0JdPh
	 VBeFgw2tUhn0NNt3pZRJKUcIJ4DqhWU9zmGgWFdZzSRsebqKPrfnTybif0TWu2DLW1
	 BzinUUgkIO5rttYtNfljchPqcRrApGlGbHAf4oG03LwY/2ailyMqgMsUKCLMJ/81rB
	 BQan3t6wGdUWw==
Date: Mon, 26 May 2025 19:22:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr, heikki.krogerus@linux.intel.com, 
	elder@riscstar.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
Message-ID: <lgjntm2v4qtp3uwccriodxdefdc4vqydzl4dmula4avhws4zfi@xevkgzfuhyhl>
References: <20250429085048.1310409-1-guodong@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_102232_867347_27B3B268 
X-CRM114-Status: GOOD (  19.18  )
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
Content-Type: multipart/mixed; boundary="===============4401294811123316634=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4401294811123316634==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yljumz2plxfqhz5x"
Content-Disposition: inline


--yljumz2plxfqhz5x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
MIME-Version: 1.0

Hello,

On Tue, Apr 29, 2025 at 04:50:42PM +0800, Guodong Xu wrote:
> This patchset adds support for the SpacemiT K1 SoC in the PWM_PXA driver
> and updates related device tree bindings. The changes enable PWM
> functionality on the K1 platform through driver enhancements,
> configuration updates, and device tree additions.
>=20
> Functionality has been verified on the Banana Pi BPI-F3 board using PWM14,
> configured as a pwm-backlight. Per community feedback, the actual
> pwm-backlight node is not included in this patchset but can be found in
> patch 7 of the v1 series, with modification of pwms property to 4-cell
> format to match updated binding (#pwm-cells =3D <3>) since v3.
>=20
> +		pwms =3D <&pwm14 0 2000 0>;
>=20
> This patchset is based on [spacemit/for-next]
>   base: https://github.com/spacemit-com/linux for-next
>=20
> Plus the following dependencies:
> 1. Clock controller driver, posted by Heylen Chu (v8), with most of it has
>    been accepted:
> https://lore.kernel.org/all/20250416135406.16284-1-heylenay@4d2.org/
> 2. Reset controller driver, posted by Alex Elder (v5):
> https://lore.kernel.org/all/20250418145401.2603648-1-elder@riscstar.com/

It's not clear to me if I have to look into this github tree and the
listed dependencies. My impression is that it can go in on without these
changes. Maybe it only starts working when these are also applied, but
that shouldn't stop me applying this series, right?

There is a patch in pwm/for-6.16-rc1 (namely commit df08fff8add2 ("pwm:
pxa: Improve using dev_err_probe()")) that conflicts with this series.
I applied patches 1, 2 and 5 on top of my pwm/for-nexxt branch resolving
that conflict and rewording the commit log of patch 5. The result was
pushed to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/pxa=
-spacemit

=2E If you confirm that you're happy with my modifications and it's
correct to apply them without the listed dependencies I will add the
patches to my queue for 6.17-rc1.

Best regards
Uwe

--yljumz2plxfqhz5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg0o1EACgkQj4D7WH0S
/k4bgAf4o7db7SVDkKQD9FGqsTvIBAmE7TuWOKwRkL5saF9VkLJjDmgdOVZO3Hf/
Y4uPkJPTAa3bOzVFbL7Eftrjkslzs7Kv6mniyoMuo5X1ggGrfTLcNA7Y3NwArC9l
WUIiGKX84b20aHuYN9FXLAnAF4JtoXCc8gEI/m5nj0iGWi5UCFarRlIKCbKTXsXk
MEDl2vL8OUUutk00El5zEdWQeyDiifhJfXA8nHj3YX1ghBkom8J8UTUhltviYwi2
wZYWvs67N1uFChzLxAZrK8iJI+O5UeUevjGNlF4S7DymPNL6EAvOUY/9+QgALC2L
Ac3leHKJIYqVMeU1E4K33CqmhpVQ
=GSJk
-----END PGP SIGNATURE-----

--yljumz2plxfqhz5x--


--===============4401294811123316634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4401294811123316634==--

