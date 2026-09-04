Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCADC624D3
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 22:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNGdauYYUDTmnRIr1tMi8jK4gfVl391mBc8kehD+X0o=; b=XVuSnZHqx1RF1w
	cKRdNl1NKTIIhZyVRSWoZTOo09ZsCIxG/vs50zdi7e5mNHSNwjS8P4iIWgGkqT04iZgAbHY9W3+me
	TZMqE2xqYEZwe/0BdeJ4dariZDD9xjFt2Q+out2UkmoS1l0LtMGWMSWr9aGRHXMeZIGgLQiI3gkfk
	x62pN9Vxpt3et5zMqNX6E6ahGlum73jm1SVHXafMmKq9T7ZhYvM7sQIa8BFVBBEATBOCnfqiKLpEf
	7Ic2QWlD7uleFP83ocYd2JcoWWJBQZebTLagrVkZTotv1sibLUBkrwrN5o2GWjMGgG7lVfiWktRsc
	Qjt7KHyZXRHrRgoq3WLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cUR-00000003PAC-1FfY;
	Fri, 04 Sep 2026 22:34:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cUP-00000003P9k-3145
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 22:34:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D140143C92
	for <linux-riscv@lists.infradead.org>; Fri,  4 Sep 2026 22:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E561F0155B
	for <linux-riscv@lists.infradead.org>; Fri,  4 Sep 2026 22:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561267;
	bh=dft8jIKZLyvDmq/LPRhVyMm6r8WW3Y1LCnA91drhmyY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JYoDekoIWqbyA2d6AFs9pkfIIIPviX99b4PNrXAxgbCQQF1dL9694ILlfzsOF9bjh
	 EDHjfFBj2rg1kN5BUPZ7sWwgCJdF1O2LBadFOYioLe3NL6Z0UxgN8bQZIPykzb0kIV
	 CeP2V94/YysKm8y7qehaNBmQINcQeTkVH3rYQZFzRNSJADYXZ6FaZoxF7+yGFHc7bL
	 j29jH+Fm2j64ewfDLmTZ/aVDHVwg5weAwMpu4nTwJimPoca4wLEQjEhcIXxlIJ7Aso
	 N2p5m9b0qKictMOibmx7IdV2ehpyhNL4kLPEvcWp4PUPxcQfEqdR6Xu/62SYhhmq8h
	 QX8pZpIOeK8Tw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b45f2e5f58so1375881e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 15:34:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByyVa2VKYcod+S0kQvGsoOgMwSTSm6fnZrQGnPkP05n7IsGsHoAwXkUpHGB7aoTnjDHoc1dw7Qs8zKS5Q==@lists.infradead.org
X-Gm-Message-State: AFuF++nIa8bCLyV3E7ptWk5GOVa73HkZxsK8oiG9uiWHE56n26gk586V
	0i55sNCAhL6TDEMZ/v/DrFnMBt196Xp0nqQqJ6kmjhOgE8s8/2tBGpeLsKCEK7FIaoKCbsFtXNH
	qV7MIMH1wv79jO0Z+jIGq1NQcwTj+Oeg=
X-Received: by 2002:a05:6512:1313:b0:5b0:22a6:6b13 with SMTP id
 2adb3069b0e04-5b616e717cfmr1606890e87.0.1788561266181; Fri, 04 Sep 2026
 15:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-21-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-21-s-vadapalli@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:34:13 +0200
X-Gmail-Original-Message-ID: <CAD++jL=V6eLEywiyKKFCQMZikQ79ULaq1uPYAQxu-rtYuSW7CA@mail.gmail.com>
X-Gm-Features: AcwNN1X2dJF1quKIRJ19ZE4zvP-mImnANUJmKgqRVeK17MZA2wOCllak4fdVdf4
Message-ID: <CAD++jL=V6eLEywiyKKFCQMZikQ79ULaq1uPYAQxu-rtYuSW7CA@mail.gmail.com>
Subject: Re: [PATCH net-next 20/33] net: dsa: realtek: rtl8365mb: Remove comma
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
