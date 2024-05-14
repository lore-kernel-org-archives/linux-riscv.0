Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685C6C41513
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 06:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLa8moizM2urUAzeWaRadW0qlUbjr89g4Yeqor1BO4s=; b=k8fL8An7U5SlUO
	Akon7CoI8GZ6vOgOclLD5rhHnVhBstoKWnf/1OepENOBeHmSDDyzqo2YfVjRW4DbEr66UkgkP+otS
	/U0xwNBTIz4AhrJhw6Be7iFgMb0dRhCUHVXNtlqh4VmJczfoMsNd5JeOkZo6vMjjUvKoKjnIB67lK
	NF8JBAGKb29cfIiGWhs2wVvOGAK2cQyifNzWUQC9cml4+80VUK3UUU8fhdYI4sU953jxCmQ3oVG5x
	dAQ2wsifZnKaOhBUJGegwgc3wPEBC9cYmCcmOETIdpiOmS1D7mn8lN8IVo2BnG/WJ0x06jAL+isdu
	ZMWVAYoUqu/vBRXbvUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6llz-0000000F80A-2IiW;
	Tue, 14 May 2024 06:36:27 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6llu-0000000F7z9-1dnU;
	Tue, 14 May 2024 06:36:24 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-622e32414ffso21591217b3.1;
        Mon, 13 May 2024 23:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715668578; x=1716273378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyXm2XZJp7cQccvVHsZwFRorrc4lUY+2faX/WPeRScc=;
        b=KVKES6YpowGO3Bq0y7p9OYIcYA/rs3Kt8+Msf2KlSyzTB/H6YqTAM6GZSQnKMkvMlv
         CVdHjohrq6sGI/ttsiW4WytK4/5l9REgChmTKhzHvFcwklYybVTvD0FiWmlxC7WHz6TK
         7PjJi2pv5BYeWC0k4y6w84WigjbKy9WYo2Iij3IkfF7uDFXvyeB8kXBT8tokvB+gYXdr
         xcxaIgPgAnKIP0y0FESJ9fpe1XSHwKK2MPYVIf2Sz3EO7v0cM8I2oiH9t5+puK9buUgQ
         bflQQhon0QdVAvQbBR6eviHfP/7gOBKjn2c9nWPJfnp97GEdOouk9C54gyoK12cO2KFG
         LOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHxGKy8W2TlEK3zgFVlt6F+KmMznXNOutvQdRm6Y4IPpou6z2cKxrAo+bb59aI57eXZeQ3siEwYrNVHQcs4yHxYwJ0rgZUMvQywZds6IilbGh03KoOUa3H/EHGFDcYeh5bVaUjPi6xfUOpq6yhFyuPz9npTtA5FiwGeT9AdCN01s2+XVZ7USAHC0tkyLInQgVQRxJfI1f2nWtPYhCbNlZzOJDIFPw18lCX3pX7R6pxjAKluw/9AA+MYPt8m5U=
X-Gm-Message-State: AOJu0YxoHENUzdCqwW9J1sniUb68fP/m1uTaUaDSomy9R/JuV7NSB+1F
	j164jQwnt8RobT+gNXKJqbWPR2Bz0lTZYKkkkdRDs8/gnvgLhX3xJvq+Uuvo
X-Google-Smtp-Source: AGHT+IE/ONWYCer+FYqBm1JEMiRa/snci3uYe5RuOyt3IOben+TTXRoRdF4lC9rbTyw0YvmUGG4nyA==
X-Received: by 2002:a05:690c:6906:b0:615:bb7:d59c with SMTP id 00721157ae682-622aff9d827mr176216387b3.22.1715668578414;
        Mon, 13 May 2024 23:36:18 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e347613sm24457627b3.98.2024.05.13.23.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 23:36:18 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-622e32414ffso21590917b3.1;
        Mon, 13 May 2024 23:36:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWI8+gbzIFUYKMVyLCZwbMWm3Vy1ujz6TcggiB+CXyPAiz+uDMzDSbGukY92r8tm6UtcQBl4+i0+qjhC2YdSFFbngqpZueU42rwilGMnLCfQ1++2e1g/s3KbyEF9285lluOrXD80QxPOxjYw1AP7u0LLswyZNTE+bpff7G1hTyqVDy+Gmisd246O5rSNeEgkv3q+10jvOeJtBmOh7RvUA+0JeYeA4Br3fxizexG2wpPeFr690dvBGuFS0Go8ns=
X-Received: by 2002:a5b:f48:0:b0:de5:567b:88f with SMTP id 3f1490d57ef6-dee4f31a205mr14563293276.10.1715668557234;
 Mon, 13 May 2024 23:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
In-Reply-To: <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 May 2024 08:35:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
Message-ID: <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
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
X-CRM114-CacheID: sfid-20240513_233622_462623_A32BDA3E 
X-CRM114-Status: GOOD (  22.64  )
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

SGkgTGludXMsCgpPbiBNb24sIE1heSAxMywgMjAyNCBhdCAxMDo1MeKAr1BNIExpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gT24gTW9uLCBNYXkgMTMsIDIw
MjQgYXQgMTo1OeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+
IHdyb3RlOgo+ID4gT24gU2F0LCBNYXkgNCwgMjAyNCBhdCAzOjE04oCvUE0gUGVuZyBGYW4gKE9T
UykgPHBlbmcuZmFuQG9zcy5ueHAuY29tPiB3cm90ZToKPiA+ID4gRnJvbTogUGVuZyBGYW4gPHBl
bmcuZmFuQG54cC5jb20+Cj4gPiA+Cj4gPiA+IFVzZSBzY29wZSBiYXNlZCBvZl9ub2RlX3B1dCgp
IGNsZWFudXAgdG8gc2ltcGxpZnkgY29kZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGVu
ZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Cj4gPgo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+
ID4KPiA+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPgo+ID4gQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0Bn
bGlkZXIuYmU+Cj4KPiBEb2VzIHRoaXMgZ28gaW50byB0aGUgUmVuZXNhcyBwYXRjaCBzdGFjaz8K
Pgo+IEkgdGhpbmsgdGhlIHBhdGNoIHN0YW5kcyBmaW5lIHdpdGhvdXQgdGhlIHJlc3Qgb2YgdGhl
IHNlcmllcy4KClN1cmUsIEkgY2FuIGRvIHRoYXQuCkZyb20geW91ciBwb3NpdGl2ZSByZXNwb25z
ZSB0byB2MSwgSSB0aG91Z2h0IHRoYXQgcGVyaGFwcyB5b3UganVzdAp3YW50ZWQgdG8gdGFrZSB0
aGUgZnVsbCBzZXJpZXMgeW91cnNlbGY/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
