Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334AFC021BB
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hd6n6BtxOijBLmRKryMgEWwdnkYpp7XOsF76gficpE8=; b=BT0ncGsRnduoF7
	A5Io4RLaYBjfky63/L2AXDpvNKcsU1rWVkL0V5IMGLtaCx4i5dVCJQB3VB/m5GGvupHBhchNVNAOh
	ZkQB4KMys/ZPSGcEnnhF6Au6vyv4U+84b8m+otl04JtGxkhJSZeOfCtbwjFOah+McocnwnmzL9j+6
	/RDnZobDy9IdDIdgoYwfXCr1m8qhoWMCYoTz61baYUY3wrvyhR8sSmAaPQyETnQwqA5bx8hJ973XS
	a+A7R2X0+r/Ie3xywk1W2rbdbKaSvxtfP7cFJQSYJDOfGhU2px1HRFLVHPIT6RZB9pqUYEveTfU8U
	aqQriUBqyknaOjIjc1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy3c-00000000PcL-0txK;
	Tue, 25 Feb 2025 16:45:20 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxXZ-00000000AY3-0iIx
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 16:12:14 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaecf50578eso1135928866b.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 08:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740499931; x=1741104731; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=NjjNt4MwSEmQa0g/4QZIdj/bMccPcTcvfNARJTvVQvZeFtFKiLvw4HxJXX48L6o6Uu
         bMNGJ0gZyhdMgYx0yY9vDKZYeNETFHMSiewqEEl5LXzH9vrmQGGEOGj+KnxoJA6PZ18/
         tlxL00KGdb0CxWYIy5TkGvFw7l56uCpi+wU7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499931; x=1741104731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=wmg0ipca4otdPkqruCXvEIgYNNwaYnj2tfTPp7Gu/1/O9a513cqfrkXT8fQXidMZAc
         GYoil5zW5qGCL7qmWoR5SE0jMI+niVIgsiESqw1QQdD4xXQiOR/z9QOclEk01O+plI7/
         kIs/9frLtV/bAto4VKnSUfxPlBOWnVIUn0GOvEXuylErcYgetzyynJQyEa/VM0Rdpvwp
         Zs6pp7os0h+P/RNlyodjI/bfAaFqEs91eBD6cV+4Kei98IspMrLpHk/GdqfOmDo9lj2f
         lfRqGCEsTOhySO4X7MZUnjwKH42WkOvsOzFw4b+HnVDlPt2N/+fieG5DzKkBbyFYfOqe
         vXqA==
X-Forwarded-Encrypted: i=1; AJvYcCXL42jsbaWmFNbE42Z4EbvR38IqhLqTeGLa/QHboKOR2viCMoKbcmSd9wbMbivxtYDvIeXsEv7Wh14mcA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx47IBq0qYs4/WBj1nqTpncKCWnPld3qhfMpN+InfA7xyBsz4Gu
	cJTC9ZUI62XHssb2MtCm+RP+R2rSXu7IvktBG3k6tT4qTelIj1yvdfQWkcLDy7Y13TLWyUDqwor
	H7eHg
X-Gm-Gg: ASbGncvXNWqtL0Y5SjeTV4O+Gd9VNyiy18xy319JvD00XR4+UPgdm3YV4d+gebLM/Ho
	RA7AR5LLTcR2aFOm8aLrsT6urfG/SrDnbY2H+scO/qG7G6/sh1S2QeU+EvsaH3cSyV6ZMXfcxJ/
	sbSWWhag+1XDMfiERRLYt4H67cWDbL9KIzB4sbi2c1KdAJ6oxa1v71mfpdJPeSyLzOSyt43Sz8J
	8D1bfDMU824gp4k02gaQLeziu+GMMjPWssDFJ69rTzUXkPYiI/Gyei0l9tGC+Dp+3C8ujzOWK1b
	M6PCzevFo4NMSdBbU2xCNZ/W53o6c0mBqDMnUC4it8q3u4BkGvDUudNLilL4UfUjHw==
X-Google-Smtp-Source: AGHT+IFVn03ZVJad2MMoCVs2zvaf1XhcaQ69fkwGTDnyWSU26WntUzrjWBGcTKoOy4G5rbkY+6fG1g==
X-Received: by 2002:a17:906:cc4a:b0:abe:ea77:5a6 with SMTP id a640c23a62f3a-abeea781ee8mr43150866b.44.1740499931169;
        Tue, 25 Feb 2025 08:12:11 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20ad9e7sm159245166b.162.2025.02.25.08.12.10
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 08:12:10 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso993817066b.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 08:12:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdk2ZB7aLCe9878BqtumTtDWs9LsgZpJ4n6lsyNW+jUIpKr0wbiaY7daksG6U0JG5lp8lAnbTTj4Fw5Q==@lists.infradead.org
X-Received: by 2002:a05:6512:1241:b0:547:6723:93b6 with SMTP id
 2adb3069b0e04-5483909d1d1mr6678553e87.0.1740499509419; Tue, 25 Feb 2025
 08:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com> <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Feb 2025 08:04:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
X-Gm-Features: AWEUYZm3vRrajChqqVao9eJTA9wadMF2aiVVZGdKkNeW96YTlQauMsPFnVVKvC0
Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_081213_200921_FB25DE6B 
X-CRM114-Status: GOOD (  13.16  )
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

SGksCgpPbiBUdWUsIEZlYiAxOCwgMjAyNSBhdCAxMTozMOKAr0FNIEplcm9tZSBCcnVuZXQgPGpi
cnVuZXRAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IFRoZSBhdXhpbGlhcnkgZGV2aWNlIGNyZWF0
aW9uIG9mIHRoaXMgZHJpdmVyIGlzIHNpbXBsZSBlbm91Z2ggdG8KPiB1c2UgdGhlIGF2YWlsYWJs
ZSBhdXhpbGlhcnkgZGV2aWNlIGNyZWF0aW9uIGhlbHBlci4KPgo+IFVzZSBpdCBhbmQgcmVtb3Zl
IHNvbWUgYm9pbGVycGxhdGUgY29kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVuZXQg
PGpicnVuZXRAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXNuNjVkc2k4Ni5jIHwgNDkgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCgpSZXZpZXdl
ZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKSSdsbCBzbm9v
emUgdGhpcyBmb3IgYSBidW5jaCBvZiB3ZWVrcyBhbmQgY2hlY2sgYmFjayB0byBzZWUgaWYgdGhp
cwpjYW4gYmUgbGFuZGVkIGluIGRybS1taXNjLW5leHQgZXZlcnkgb25jZSBpbiBhIHdoaWxlLiBJ
ZiB5b3Ugbm90aWNlCnRoYXQgZHJtLW1pc2MtbmV4dCBoYXMgdGhlIG5lY2Vzc2FyeSBwYXRjaGVz
IGJlZm9yZSBJIGRvIHRoZW4gZmVlbApmcmVlIHRvIHBva2UgbWUgYW5kIEknbGwgY29tbWl0IGl0
LgoKLURvdWcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
