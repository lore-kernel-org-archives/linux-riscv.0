Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FF3C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 10:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJb4gLWkax6lx30BKLNhOlivnP7u6dUXe5sIbwX5CHc=; b=ObpzrtIHpumKS17kevDHEjRA+D
	9esxl1xZcCgb0Pt8xnOnO0BaaZCBrdlCbQdvlxokdhOrSkaWBHNhERTwGGxYAf23PyG0s7W3A4H2N
	IPJiZPu8kGpt+pwmdzQo2UgL/WofZMto7y3Da30en8wuJrz+xdxQdUWoJD225AMGaYcRGGuXJ8Lkc
	HBsKjtU9LB0HVjjqsx5tdSX5F1ZHXHqGkPhKFuGCrtxbNqCvascNh8mHgxMjRw+a6UbL0tSnEAuiP
	EjrTuyU9iAnWMG9fAfX6NkPjNl05Ro1YowcPX+r2w7SqT9OzEkc2Vbm7oo36fGDszFVuHRiwgcYox
	BIEMTaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD1yK-006SYn-3C; Sun, 17 Jul 2022 10:58:00 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD1yH-006SXi-2K
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 10:57:58 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 5F9541C0003; Sun, 17 Jul 2022 12:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1658055475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2PiYcVoQaJRB7ipLJ+CzHZiXAP65SK93zbBFtaADAHY=;
	b=aNP+rDla8x8MVa/ZII4Q1KX24tDomXButkwpdsgzHhxyeB2Lyk0hTdcCpzAxJ7HyUEH/N/
	76CDAdOSE4aqEMZ6b8tR1Y9OrAVLCZJEPXMS5nZvlRu0T8zcJJUDcElOa9Ps+vRSMsn7R5
	O3uebTfw7bt/2fygjdjAM3Zxv+CXP1M=
Date: Sun, 17 Jul 2022 12:57:54 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Vincent Pelletier <plr.vincent@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ron Economos <w6rz@comcast.net>,
	Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Stephen L Arnold <nerdboy@gentoo.org>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	David Abdurachmanov <davidlt@rivosinc.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 4/4] riscv: dts: sifive unmatched: Add PWM controlled
 LEDs
Message-ID: <20220717105754.GE14285@duo.ucw.cz>
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
 <20220705210143.315151-5-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20220705210143.315151-5-emil.renner.berthing@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_035757_583652_571C6361 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3215105140383078093=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3215105140383078093==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="orO6xySwJI16pVnm"
Content-Disposition: inline


--orO6xySwJI16pVnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2022-07-05 23:01:43, Emil Renner Berthing wrote:
> This adds the two PWM controlled LEDs to the HiFive Unmatched device
> tree. D12 is just a regular green diode, but D2 is an RGB diode with 3
> PWM inputs controlling the three different colours.
>=20
> Signed-off-by: Emil Renner Berthing
<emil.renner.berthing@canonical.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

(This is dts change, I'd rather not take it through the LED tree).

Best regards,
							Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--orO6xySwJI16pVnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYtPrMgAKCRAw5/Bqldv6
8vJKAKCK8iCAueRbp/sBar9NXzmMECiF6ACgp9e1BthH/ZKcWRgw97Pvc99PupI=
=0geR
-----END PGP SIGNATURE-----

--orO6xySwJI16pVnm--


--===============3215105140383078093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3215105140383078093==--

