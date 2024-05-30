Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0CEC27C43
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 09:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSy0QAtRRpZPZxkBQkFTSArAHykh30XdW0tvWi94SGE=; b=tZPxWrZmTmXeim
	02KtMGb7QiD/B/LyKeGPpQbkipinF6BVJT7/rvnKyZFbmN1By3TxjnxGcHkGxwIVZCzEki0ZqySEo
	GRPRI/yDpTAgWxgHa/YdiLoxbtFj5+GWaVnP5kiHZXVGOp5l/M9204T6N0yU8kHuMW2uJ1Oqu5M0t
	w7cN2yoPYicAdkCZf+R4HXyyTfS4JPJWIrXX9H/FCmcTVXYBKMp+PJTO7uVjQ3538is849WU1kNvO
	mKg/WXVuo4UmB3OJAJCiNzwk4G1MbkYZWWto1fmrdHu3ZKtmnzOUuxAL4azplBof7DhTu4+WR7avo
	7OgLJfVX22F0rFPZzMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbz4-00000006nX0-45X6;
	Thu, 30 May 2024 09:22:06 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbyt-00000006nU6-0aaj;
	Thu, 30 May 2024 09:21:59 +0000
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ad7a2f8715so6173346d6.1;
        Thu, 30 May 2024 02:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717060910; x=1717665710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWN78EB24MX6Q0HZqErBr8t9tcr4nbKt3etlWVHkE68=;
        b=H6IRWEuZgjr4Mnw0/rf+ILgJamZXuvifH36yXtysGkfdH+oYRJkKZ1Hd18E/TrV4AE
         ll3X5evCCFLe6CljeSLLsSgPIi6YJ3MlUX0xH+Skf4aMHYuw54EvmXpOHF6HnENGkCCT
         /gbkaB6AI/9qNsGzcbm6WCr0YhKZxoA8/+puE/9QLs8cJy1R2CTqh96z1AYq3o/VECuw
         LD/GmH2bO0FHv4QElRZ4GieqHqxKvatL4xdsVRi8tnNZsn1COZ9lRF8VhSoLWPHEKTwI
         9+vM9g0Fsh6HihZiDbCksYBXz2xj/N74NiN9d58mlxWItzOdyvRJap35s0AkYlvxRFAC
         pxvw==
X-Forwarded-Encrypted: i=1; AJvYcCVM1N05ibS0Rdqb31RyvgypN50t1bqvr9AcNEcs+bgVIZxpjVxnr8udNkJBQob/9hYwgk8aQHDFEOBmaw3nCovnXjzPUIyd6xz7txMufioas0Vv4JUgCZZUBQ906ovZaw5lU2Voj5FPqLDvXK9Gb5LUKe5nB2s9FCFWJuo85yM9w09MESx7GJTYXhU9fgyDV5uyrhpWdPBVTW2wUBtzkFdUj1jA8exSrt0B1Kqw90i/MeSejpaDh4dD5/Y/fms=
X-Gm-Message-State: AOJu0YwqkaSj9gxeEAKfcpxZJY6DDZ4pzEr70OHeqStmmygA0czVgkxe
	zQZZyStk2n/sXlaUF6pLqpbnG30r6Dzis7T3947moUBm81qORcNx7j2AgpZ7
X-Google-Smtp-Source: AGHT+IH/USYzmkxRCQHaW2776bKsoNvXA99L8ys9FUU/EztaPiSrBpYjs7WLOMmolLExxgDv3nMMkA==
X-Received: by 2002:a05:6214:3102:b0:6ad:7087:ef8a with SMTP id 6a1803df08f44-6ae0e76ff37mr24081896d6.9.1717060910165;
        Thu, 30 May 2024 02:21:50 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae0c519abesm6040806d6.29.2024.05.30.02.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 02:21:50 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-792bdf626beso58528485a.1;
        Thu, 30 May 2024 02:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAm7vKovo7bMsLPPOY9VqoSn3RwURJOKsCyzH20qt3I5xSsqL+5BH+8z+2regGreq9Q3RTSP2ociXLfSWPdG2g2NgNS00NxS6AWkDDTOkiJVANGrZn7qmw2NZ5ghkcIJmxhAQ42+kO66T8IiklYbHHgYK9WkankgemN8YRH2G7vWhU7bcYNzpyOJtag7Dne7OFocQf+XaIQbN4gNGENCRlE7OBvkIUW+5NmQ0C/ItHlMAzOI/q9l4LyA7xnTo=
X-Received: by 2002:a25:8c84:0:b0:dd1:6cad:8fd3 with SMTP id
 3f1490d57ef6-dfa5dcdc800mr946343276.27.1717060889311; Thu, 30 May 2024
 02:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
In-Reply-To: <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 11:21:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqXVT3Y7N8pTb_68E23RkLGi=ySOSDkAWX4MOpP09Q4g@mail.gmail.com>
Message-ID: <CAMuHMdXqXVT3Y7N8pTb_68E23RkLGi=ySOSDkAWX4MOpP09Q4g@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
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
X-CRM114-CacheID: sfid-20240530_022155_233416_51EFFB8B 
X-CRM114-Status: GOOD (  22.04  )
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

SGkgQW5keSwKCk9uIFRodSwgTWF5IDMwLCAyMDI0IGF0IDExOjAz4oCvQU0gQW5keSBTaGV2Y2hl
bmtvCjxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPiBNb24sIE1heSAxMywgMjAy
NCBhdCAwMTo1OTowM1BNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4ga2lyam9pdHRpOgo+ID4g
T24gU2F0LCBNYXkgNCwgMjAyNCBhdCAzOjE04oCvUE0gUGVuZyBGYW4gKE9TUykgPHBlbmcuZmFu
QG9zcy5ueHAuY29tPiB3cm90ZToKPiA+IFlvdSBtaXNzZWQgb25lIHRyaXZpYWwgY29udmVyc2lv
biwgcHJlc3VtYWJseSBiZWNhdXNlIG5vIGVycm9yIGhhbmRsaW5nCj4gPiBhbmQgdGh1cyBubyBv
Zl9ub2RlX3B1dCgpIGlzIGludm9sdmVkPwo+Cj4gTm90aGluZyBpcyBtaXNzZWQuIFRoZSBiZWxv
dyBpcyBhIHJlZHVuZGFudCBjaGFuZ2UuCj4KPiAuLi4KPgo+ID4gLSAgICAgICBmb3JfZWFjaF9j
aGlsZF9vZl9ub2RlKG5wLCBjaGlsZCkgewo+ID4gKyAgICAgICBmb3JfZWFjaF9jaGlsZF9vZl9u
b2RlX3Njb3BlZChucCwgY2hpbGQpIHsKPiA+ICAgICAgICAgICAgICAgICBpZiAob2ZfcHJvcGVy
dHlfY291bnRfdTMyX2VsZW1zKGNoaWxkLCBSWk4xX1BJTlNfUFJPUCkgPiAwKQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgY291bnQrKzsKPiA+ICAgICAgICAgfQo+ID4KPiA+IElmIHlvdSBw
cmVmZXIgbm90IHRvIGluY2x1ZGUgdGhpcwo+Cj4gSSBwcmVmZXIgdGhpcyBub3QgdG8gYmUgaW5j
bHVkZWQgYXMgaXQgd2lsbCBnaXZlIGEgbWlzbGVhZGluZyBzaWduYWxzIHRvIHRoZQo+IHVzZSBv
ZiB0aGUgb3JpZ2luYWwgQVBJKHMpLgoKVGhhbmsgeW91IGZvciByZW1pbmRpbmcgbWUgdG8gc2Vu
ZCB0aGlzIG91dCBhcyBhIHNlcGFyYXRlIHBhdGNoIDotKQoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci9jMGEyOGY0NjZjNDJkNWQ1OWM3ZmFkZmExZmQwNWZkNTEyZDQzYjZmLjE3MTcwNjA3MDgu
Z2l0LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAg
ICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3Mg
bG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkg
InByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
