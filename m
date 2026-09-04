Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714FAC79F82
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 22:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNGdauYYUDTmnRIr1tMi8jK4gfVl391mBc8kehD+X0o=; b=J+L6P7cPefUU7x
	pr/DFHn3qB77oJ218sSrQbnZNb6k7tOATzLUKBLIGOacvgWTHy30k3TSysGkHr4LUcGXFEbDIPcvj
	soau0zLfbMrnwTAZYP5RdsuW4KzTX/eskFtFrDhmeB/U4x9UXkOcYXFp9pGpNIGHDJ5wWDI2e2xEA
	KMkFzs1Jfc+w751BE/Z1dZM7mx2zvCpFH48ypgDRn6tPUk2HB0/hw/GZzAALdaUqXOwNg6SWs2G8c
	quTn7201EeISI4Trvs2js52xVPwni12klDNqTY0GnMRpgRo8OT28c5Y5sxNcU2DTxY7GRA8q9lh5O
	+/3OW3NYx73mpaznXsjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cWa-00000003Pf9-3AyD;
	Fri, 04 Sep 2026 22:36:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cWZ-00000003PeG-1WFU
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 22:36:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24C8A44792
	for <linux-riscv@lists.infradead.org>; Fri,  4 Sep 2026 22:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87AE1F01573
	for <linux-riscv@lists.infradead.org>; Fri,  4 Sep 2026 22:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561402;
	bh=dft8jIKZLyvDmq/LPRhVyMm6r8WW3Y1LCnA91drhmyY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qh0OQ7L0D7X+117p1PpoMp1i31lJRFbYVHzLlgQ4q8VSEX3EzfUTlRAxt+8Y50ypa
	 smazqPkGF4OAGm6Y/1rlNxf036E8E+iKcc6MHDS+XKUEEpdtK92j4dW5riWf6ddzjH
	 kRW1+JWQ9oTyKRdu8qKPGNNTnQrIE9gNC4GqpvG6ZE2m2R5+TYYL142JjHLBOrO1tm
	 M/VrsIzJuP1CRiXquq2Bwkk0mUehJxblPhi5OdXWqMMx9irt6NKca04+5fOEkccVTN
	 hT5YXTqlleSDkWaQmsScB0gxtEpHBJT+8yLu3jvdO2W74lTMJlNBGCGu6reDQ0KoR9
	 BWWALoQQKspQw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b5e1340faeso1358865e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 15:36:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwJmjjwT3Ng6gXX3icsYudON5wJeA/v/9BTHz2w76yrheh1yooVaSfw2Zw/JyeyVg1utA+vtFaFjS1Exg==@lists.infradead.org
X-Gm-Message-State: AFuF++kBDTS+z73K8A9Q5PAZMEa1zM6T71Sk+doQ5g5imPJgDBI1mm0w
	n7hhbENz8R0uVxKwKyVCFHV1WM/fBWRLxVetW9e+NrkeWjlPZtHKH8AuODKOBweGz5POqCnXqbT
	6YQYxLpIYxTRGIA8E9kmuU21ZloWoSP0=
X-Received: by 2002:a05:6512:250e:b0:5b1:5a2d:55f9 with SMTP id
 2adb3069b0e04-5b616f3215dmr1620442e87.21.1788561401588; Fri, 04 Sep 2026
 15:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-22-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-22-s-vadapalli@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:36:29 +0200
X-Gmail-Original-Message-ID: <CAD++jL=c7Hbfwbngr2HQ_RTUizL=hwQbTa=C-oZNu2BAjLh0yQ@mail.gmail.com>
X-Gm-Features: AcwNN1U9I_dDB3NJSseFrC3_GFY1Eb30_yQ91aHRnm5hTr_W3IoNAFdaYoLTgAE
Message-ID: <CAD++jL=c7Hbfwbngr2HQ_RTUizL=hwQbTa=C-oZNu2BAjLh0yQ@mail.gmail.com>
Subject: Re: [PATCH net-next 21/33] net: dsa: realtek: rtl8366rb: Remove comma
 after sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, 
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com, 
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kurt@linutronix.de, hauke@hauke-m.de, chester.a.unal@arinc9.com, 
	daniel@makrotopia.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	luizluca@gmail.com, alvin.sipraga@analog.com, clement.leger@bootlin.com, 
	justin.chen@broadcom.com, dlan@kernel.org, rogerq@kernel.org, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	opendmb@gmail.com, andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, 
	amadeus@jmu.edu.cn, kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, 
	horms@kernel.org, vadim.fedorenko@linux.dev, daniel.zahka@gmail.com, 
	nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com, 
	haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com, 
	lgs201920130244@gmail.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-omap@vger.kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBTZXAgNCwgMjAyNiBhdCA2OjM54oCvQU0gU2lkZGhhcnRoIFZhZGFwYWxsaSA8cy12
YWRhcGFsbGlAdGkuY29tPiB3cm90ZToKCj4gU2luY2Ugc2VudGluZWwgaXMgdGhlIGxhc3QgZW50
cnkgYW5kIHdlIGRvIG5vdCBleHBlY3QgZnVydGhlciBlbnRyaWVzCj4gZm9sbG93aW5nIGl0LCBy
ZW1vdmUgdGhlIGNvbW1hLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2lkZGhhcnRoIFZhZGFwYWxsaSA8
cy12YWRhcGFsbGlAdGkuY29tPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzd0Br
ZXJuZWwub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
