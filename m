Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853E4C3ABDD
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 19:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhCt95gPnZYmsJv4GLTY9iqy4eBhGuW+dWkA0iHD+ac=; b=JNZRu9obDjaWYwn9wmUbda5p73
	IhMuS/tuR+AUwdUSrnsfNnTCiqJlRvyT5fuKQAZBLA5BLwgBz288ljgLaps7YsyhK4YaaoH3QDXZo
	RGqfRSLthaD5p74VdSa7p0HOTJKRtGSaT8dl5LwgeSJ/PbCltchW530/fTtGxUWCLMuKJBCkvfRKT
	pULhVgFvyqXjRPSZdak1/ZPVyM1mmKU3LfR7ED2T1HQQmxHyifrO4UE5EGXAWyYEBkvapTu7o1YSx
	ElbFw1SP2k6OT3mEAQzV7xLsBxAwuLtnOn+hDJF+3UuzFpnN/dwe/Yxm4VTw/hxQRAB8OczzWy2Gd
	At06DJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6aq-0000000AJ5w-3E1q;
	Mon, 19 May 2025 19:56:12 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5iC-0000000ACKN-3cK7
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 18:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fcRR
	+5EcSH2NnZRiq+ktBDbPi2pbVrwiv1JAzpr30/g=; b=N7zmZOKr6XTLjOmlTya8
	qpS/cZfFj9/bODuxKLEJ0emekgGh3jPw9pOF397y0bUXwKq7buAu1QvQwc0Ye7pj
	8Sg5Ek5BHup+uxJLXeECcFaJ3tBYFXP0Z7U0+WzcV+G45hE8si/ZvSwQzbd8PvXU
	ez0V5Q1qRYZ/6m+t45zGmwhPeFGpKwxSVKGIzpPUQUuB1oYYaHaaHxKoDUFBaRtt
	aUxFSbFudm8BI9U6TNjYQG4xO7UTn4oxHl1H/UQJ7hULuBuFfFdzeTqzDkoQ1j4k
	zr4wKw8rRbwma44sPE0nF+jt3FaAI0IJhr0ezollsXBQEK7JMrLfnwLTzudUTIzg
	hw==
Received: (qmail 2605808 invoked from network); 19 May 2025 20:59:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 20:59:41 +0200
X-UD-Smtp-Session: l3s3148p1@gd37u4E1qNdZz6uL
Date: Mon, 19 May 2025 20:59:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	loongarch@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH 0/7] archs: use proper node names for GPIO based I2C
 busses
Message-ID: <aCt_nTLapk0XdI4E@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	loongarch@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	WANG Xuerui <kernel@xen0n.name>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_115945_172982_6603702C 
X-CRM114-Status: UNSURE (   8.72  )
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
Content-Type: multipart/mixed; boundary="===============7368731464085393611=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7368731464085393611==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Miw4moGlT/mH/7E/"
Content-Disposition: inline


--Miw4moGlT/mH/7E/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2025 at 02:15:00PM +0200, Wolfram Sang wrote:
> A lot of boards across various archs have a superfluous '-' in their
> node name for GPIO based I2C busses. 'dtbs_check' complains, so fix
> them.

Please drop this series. We found out that upstream dt-schema is broken
instead. I sent a fix.


--Miw4moGlT/mH/7E/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrf5wACgkQFA3kzBSg
Kba0/w/8DghRfAlopqU9war5gwpE26Ihxt5Q+oMhY5xMtWaQFNqTEc66w4HdQr3/
29RR7JJnOaX3VKQ/WpSYysrZxG185wIlaNA8jb8NRcvdI5N0p06SVBaJbnFh2e05
q3Y/EL5RCfyagvTQjCtTSZQPW0LjKIFM+EsxgWtZU2GgD8dQJMylLMgkgruViB95
8nFoBB+wxTKUcOixJxztDXAmeGOBh5J7XnpKVU8rH7Uqp4YePBIXDtN761U4Mf5S
PGHndrQ6+96AfztgD+X/jOLw3udkj8jM/PjkXRm00LRqk7bkC9C33WXIC4yk0G/X
KLFBh6KOP8JB0VqUC4v3ijbxaeVnPQIEFbFwGtY/XRBftELqN9vMNIEQixTPciB/
uBMbD2XacAwyCcmeDSEv2nqKm7oSuJ+mN5Zk6k1PnDbRFsrkq+fp+uWEyhoyybLD
1viuWAWh/rzsPwfixjyPKy0zd9aHaV3hNT4sSzrqhCrZikEmcusq1LqLPlGLsYbx
Mm1U9EU/JtSvJwQyUX8ZUWN5w1ndA/fzR9UDSZ9oE+cZCvnfV0PaSfuNZYH/ehVH
UzwSkZrjklNhZ/RQQCZGxce7bCbMUbSg6UdYDn+qW+UHqXyzp7b9Uk6PDWtUtla0
3GHameu2L+C947A6uzLxX0OJWCYJKdRqaghannzZwZibP0E5sxY=
=J0Ho
-----END PGP SIGNATURE-----

--Miw4moGlT/mH/7E/--


--===============7368731464085393611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7368731464085393611==--

