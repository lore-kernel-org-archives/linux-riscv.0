Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92574C25B10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 11:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPSIqPlhQ87CAvhW+owuKD8i+HMAj2hmu/oh8+GRFeA=; b=UKIilRt6mH0OsV
	8XOXXdJhzcwHZgtqyQ+7zjnwPIVTfm4VCp9ADG5X4Lm9Qt4cuP5HXyd+NrIvedIpgM0CHCxWlHBXE
	QwKKKJ1i4MEKB1oKb5IAsESItU2/I9b0z0871oZe046N/ntnpWYJ6L+ad8unfOwTWqahFJM+MeBqf
	KA2DNjHgaEXnLKBoy0BHVRL5kJsAXumK8rzlhJHKUEqZXdGPx8bISBjyqHcaL8f8w2tBu+RaoJy5Q
	Lb5H35VMDAqaePFnp47H1N1B3AVY9rpxD0skZNztmKt6CCf066RBDuqLtiZ55s2ttTi6j//nju4SI
	e9eoA7aUIvBF+YburWsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ULK-0000000Cjxp-3JzE;
	Mon, 13 May 2024 11:59:46 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ULF-0000000Cjvu-1Jkl;
	Mon, 13 May 2024 11:59:42 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1edfc57ac0cso33381035ad.3;
        Mon, 13 May 2024 04:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601578; x=1716206378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z24B9qDTJHEobEGC/70CrM/eVAoUVzOxiy7onUzGbVU=;
        b=Rhj2lXhx7vJVZrV1V8BXTCARgJlJd85lI36XLK5u2j+dZCHp3DScvCz36erGFdloJo
         7ZHpt2eminhWseDdIdCwjqdXuIKNxB/XzqZKJGrBgcOAddH7GGUiMbosKoM5lJ9xh8Bs
         TGpzn0VIsA7E0QsSTFsxDAnp5xye7NC6LNRjOY564+ChZ40lwIl88JE4t+NXLQO6JeiA
         GJyKbn3KcEirjXuPy478RDjjNYpxLIBL8ksGQJh9iVdsru/tPZSzmCKRHch4auR0PzP+
         mmBWI9oKA6G5sqmVpLbTh8x5xoIp1K7IA3u9rV+uo+XNRje7z7AnVi+Xt90KmTNHzvBf
         asiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvpw912xGgUfR/Vodp/2zFV/HVsq72hSqtejTu/zQ/eDPBIxanMKEroSxivUMn/9/N8wZLLCXzhs8QGdNG+5LO57HOYb5xdqO6Kse1yfzYo5VAvSxn+30YrdLyHZ3bztl37owjxmg8/bZCvUo+HJVUOBQuNVqdsHSfr361g2vTCqxY4CNqhuwyje2ew0n1GMicH+TqYzE8TnWeaUqGYPfNr9NCOn3wP+TL/d+UR2rKRD4eojIYj7FNMNFB94Y=
X-Gm-Message-State: AOJu0YyzKTy35Er2+QMWnCfWnLuFivgWaFi7uyGDXwOL+1iwvcEcOGqR
	fj/+8fGC9IAR8MhoZPHWbNeDd8UZ0p0B0ZkCyZ60bvqJ1DHSY5Dbux6ZPiL4
X-Google-Smtp-Source: AGHT+IHRsIcqCnz9va1XDqS6tYIDVAPAzFjXjfMzw3777MYj1rgFChB6xIp3H/4MihleudIArUTeQQ==
X-Received: by 2002:a17:902:784e:b0:1eb:3daf:ebaf with SMTP id d9443c01a7336-1ef4404a932mr87857785ad.57.1715601578543;
        Mon, 13 May 2024 04:59:38 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad6176sm78116325ad.76.2024.05.13.04.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 04:59:38 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5f80aa2d4a3so3330161a12.0;
        Mon, 13 May 2024 04:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+cJqJM1Z5k20d1afQy95NOQA0BCVFR2l6SGV58VpjZyQBlsLaIfpOCsLTgRgNJlQ8uMjPxYFFAvWqCbYklHaQH8Fsk40FR6oZLknD3ybGD4u35O+FuTcyER850JyA/u4WKdtBAuH9d0XIu5mNquD9HWCKDNtB80lPMKBSsqFDZU8q0v6Ps8Lm6Y8SZN+g62+sdQaZDI3rzHEHV5B8j3QIzqik0KGlSh3vvWa7RXHeI6LD+vv/h4WEy+A9p4w=
X-Received: by 2002:a25:d048:0:b0:dcd:551f:1e2 with SMTP id
 3f1490d57ef6-dee4f3694bbmr8978126276.34.1715601555547; Mon, 13 May 2024
 04:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2024 13:59:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_045941_383599_603A13DD 
X-CRM114-Status: GOOD (  17.47  )
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

SGkgUGVuZywKCk9uIFNhdCwgTWF5IDQsIDIwMjQgYXQgMzoxNOKAr1BNIFBlbmcgRmFuIChPU1Mp
IDxwZW5nLmZhbkBvc3MubnhwLmNvbT4gd3JvdGU6Cj4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFu
QG54cC5jb20+Cj4KPiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwIHRvIHNp
bXBsaWZ5IGNvZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNv
bT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgpBY2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVz
YXMvcGluY3RybC1yem4xLmMKPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJs
LXJ6bjEuYwoKWW91IG1pc3NlZCBvbmUgdHJpdmlhbCBjb252ZXJzaW9uLCBwcmVzdW1hYmx5IGJl
Y2F1c2Ugbm8gZXJyb3IgaGFuZGxpbmcKYW5kIHRodXMgbm8gb2Zfbm9kZV9wdXQoKSBpcyBpbnZv
bHZlZD8KCkBAIC03MzcsMTMgKzczNywxMiBAQCBzdGF0aWMgaW50IHJ6bjFfcGluY3RybF9wYXJz
ZV9ncm91cHMoc3RydWN0CmRldmljZV9ub2RlICpucCwKCiBzdGF0aWMgaW50IHJ6bjFfcGluY3Ry
bF9jb3VudF9mdW5jdGlvbl9ncm91cHMoc3RydWN0IGRldmljZV9ub2RlICpucCkKIHsKLSAgICAg
ICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkOwogICAgICAgIGludCBjb3VudCA9IDA7CgogICAg
ICAgIGlmIChvZl9wcm9wZXJ0eV9jb3VudF91MzJfZWxlbXMobnAsIFJaTjFfUElOU19QUk9QKSA+
IDApCiAgICAgICAgICAgICAgICBjb3VudCsrOwoKLSAgICAgICBmb3JfZWFjaF9jaGlsZF9vZl9u
b2RlKG5wLCBjaGlsZCkgeworICAgICAgIGZvcl9lYWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKG5w
LCBjaGlsZCkgewogICAgICAgICAgICAgICAgaWYgKG9mX3Byb3BlcnR5X2NvdW50X3UzMl9lbGVt
cyhjaGlsZCwgUlpOMV9QSU5TX1BST1ApID4gMCkKICAgICAgICAgICAgICAgICAgICAgICAgY291
bnQrKzsKICAgICAgICB9CgpJZiB5b3UgcHJlZmVyIG5vdCB0byBpbmNsdWRlIHRoaXMsIEkgd2ls
bCBzZW5kIGEgc21hbGwgcGF0Y2ggbXlzZWxmIGxhdGVyLgoKR3J7b2V0amUsZWV0aW5nfXMsCgog
ICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcK
CkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
