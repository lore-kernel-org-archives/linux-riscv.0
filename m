Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF0DC79F82
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 22:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGfZj9j1kdwF5seKbjipdjIIGS4k3uP05YYuhgaw2Rg=; b=X8Rmf7GWvueo5H
	6HuqKQixhM193XwyVs9X1wQf/6ZQjDaVn5Az4X8Zp5Tcgisj4V2JVjvNAy8PbsIFJSIuSrXwJc7H3
	gHUm7l7I/RO/0IjXG1aZViJWwj/MHLi5DKRSlFVCzQzsRbp4wDmPZAeRectSesi6UtK+zVXKEbff2
	BPhMxtBX3sPJ+iKHb1FpJBkkMyc5Zu4hCvwOVII+/Bczj0ICE3eg9dkI5rkDPCuyr6IbXvoO3jCEF
	G9P+fksBsgTd3lD3wfNrSIfEvC5IorQa1PtLn00+0SyBqVS2Cdrz6accDDZKbob7ch6wYRjZOCKUD
	tJ3zApjYHgwhKgSnsAdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cWI-00000003PZF-3Srh;
	Fri, 04 Sep 2026 22:36:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cWH-00000003PYZ-43km
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 22:36:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B713B447B7
	for <linux-riscv@lists.infradead.org>; Fri,  4 Sep 2026 22:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CAC1F01802
	for <linux-riscv@lists.infradead.org>; Fri,  4 Sep 2026 22:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561385;
	bh=/oXwqSl9Gxhd9ASYzU33CVNwSksmytljDqKt0iBuLvI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GlVbCwxddIH2dGDoJPIA/h2Tst/6qBA1KGZqh+6T+wL3wdW8xpNgyzaSqPTvBO3IW
	 dmWsdWcd/TE+zleN5SMZD9rLM8nV3rxKKRQIlCABrM8elVbNhL6ZG6n1LB+RpwiAMR
	 mWEEHJ2ijqefgTMOVlyCe6A4bK22tcocp1M1amhMsGRuSaSdQeiKrQjGl8ma2dSnqI
	 7iGskWVDBlHW02icgqAP7VeQOEbWbRAIUSZMRyRq8VivPjFPHzPGt2yYzma34ys9Tp
	 2OOnvpmEk8u59IFhysAtgxkO25ylitmXa46S7QuFOChTDJs0sRRb3d7WqqybV3DH0y
	 vPUw1DQqB7/xA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so2010100e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 15:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzNxa/VPxOsFNnVDBDu1axcF19EMk97Q4UfnKLSKpAK2umd5hH+iVGq5fyM9mEF+VQ1PNFcW4QiUs4rug==@lists.infradead.org
X-Gm-Message-State: AFuF++mojjvzGDmtcGS26Ujlbp+pvOiKQPAaG2Zg17Kw9vs6rB0efvoX
	VE6IP+4ZzQQ47KppmTxVA9Y0gXv9h5VcB3fA29u1fvKdlxCnfF0XeCG/OOUIamDrfiSdFsK8jF7
	jt8vJDZu/psm0PRM/YCbloCpjQUEJGVw=
X-Received: by 2002:a05:6512:a86:b0:5ae:b7c7:5334 with SMTP id
 2adb3069b0e04-5b60e8f8b8dmr2291058e87.17.1788561384171; Fri, 04 Sep 2026
 15:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-19-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-19-s-vadapalli@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:36:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLn+fsxrH2YvJSnaYhHg2EQiUnjMX5BFE_MDAzvvJjY3Bw@mail.gmail.com>
X-Gm-Features: AcwNN1WIrbJQES4aWl5_UIygFkf4p6tsLt1aSuz1HDzaVFgsk_a2nVa_8mNAHm8
Message-ID: <CAD++jLn+fsxrH2YvJSnaYhHg2EQiUnjMX5BFE_MDAzvvJjY3Bw@mail.gmail.com>
Subject: Re: [PATCH net-next 18/33] net: dsa: mv88e6xxx: Remove comma after
 sentinel-entry in match-table
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

T24gRnJpLCBTZXAgNCwgMjAyNiBhdCA2OjM44oCvQU0gU2lkZGhhcnRoIFZhZGFwYWxsaSA8cy12
YWRhcGFsbGlAdGkuY29tPiB3cm90ZToKCj4gU2luY2Ugc2VudGluZWwgaXMgdGhlIGxhc3QgZW50
cnkgYW5kIHdlIGRvIG5vdCBleHBlY3QgZnVydGhlciBlbnRyaWVzCj4gZm9sbG93aW5nIGl0LCBy
ZW1vdmUgdGhlIGNvbW1hLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2lkZGhhcnRoIFZhZGFwYWxsaSA8
cy12YWRhcGFsbGlAdGkuY29tPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzd0Br
ZXJuZWwub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
