Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED70C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7dY7pSq/bwh0ufnnLBj6dAtnLT2/hKQZ/lNCrTHhyw=; b=GjragLYIZvuPxfQQOud/nuiIO6
	je7uM40UbaY36+jUrQ9yW2/L7TsW0D7i1dYrOwb2EiWldIPu9R7ALUZuU19FxtsP5mKYJ8NndQA7P
	cFeGWEJU7LsbZLkapSrVbKpytL/EBbFkocZ7TqL7wvHv5FSRAYFZAvw2Jh/MOexMLkWkFo0DPYRZt
	oGfcU9pPhTgDnn2pOBnkyvRI5uq+FuS8vrFHgy8J2Sa/0rOU3StOQzGqtbymNISialguxGVw4qwtL
	OdZdtSPu9Q6HuzcMW5vIZZNxNCwdFL4h1kRCCqHWsBm1UfHhDtvWAx0rRz6Tdc+2F/PCMoyqncXKb
	SB44HzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD234-006TZB-48; Sun, 17 Jul 2022 11:02:54 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD231-006TXo-CR
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 11:02:52 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id CFBCF1C000A; Sun, 17 Jul 2022 13:02:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1658055769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5+3U4BoqIseximINTkRtUt+Nxs6zfcLxjIl2czwey7I=;
	b=GWJTe8AEpO/14QNQQ1reCbJkDMgrVCxC8B/z18B7dYm8mHjT/aSUP2jOg6eT/eXVqfwyvO
	kjHQTAuIw3/9dJdN3TDblzyc+DCwzXdnf32vwVsCNsKeR9X5MFUWADxCabQqgOdCtiTLUY
	E47SHyApcktL1zW45A0XD/fgcYgfvik=
Date: Sun, 17 Jul 2022 13:02:49 +0200
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
Subject: Re: [PATCH v1 0/4] Add HiFive Unmatched LEDs
Message-ID: <20220717110249.GF14285@duo.ucw.cz>
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_040251_593227_D937B6B8 
X-CRM114-Status: UNSURE (   8.15  )
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
Content-Type: multipart/mixed; boundary="===============9110944690313025863=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9110944690313025863==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
Content-Disposition: inline


--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This series adds support for the two LEDs on the HiFive Unmatched
> RISC-V board.
>=20
> Emil Renner Berthing (4):
>   leds: pwm-multicolor: Don't show -EPROBE_DEFER as errors
>   dt-bindings: leds: pwm-multicolor: Add active-low property
>   leds: pwm-multicolor: Support active-low LEDs

Thank you, applied. Not taking the dts change

Best regards,
							Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYtPsWQAKCRAw5/Bqldv6
8gq0AJwIckPJm2yDxtGdkNcSELHvsLEndQCgh55aqv0nUOUw476HCy+Z7iSfGt0=
=PdXv
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--


--===============9110944690313025863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9110944690313025863==--

