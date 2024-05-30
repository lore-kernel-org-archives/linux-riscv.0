Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2D4C27C43
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmL4Dm2z5ygJwKtgWyRVsp452lcD6u47PRa4x7y+vHM=; b=yv+2B4bijS2pV9
	lYrUSaKEtcY0skaiVQzKgq1PmuqXg1+5xIWHzOufxYbQKbQBaGUaj8IRdthRW6IGw7c5+HjIUbL0b
	Y2wpUMSo3nsqkuJf/ZejBOOrgJgG5ZXZWGdV3gxCM2CWsPmWczKbSBqyK4safmBciGoS77N5RoCRL
	r/V9zsstUcXLx494LUtwJEb1RyxEcfLXuYdJgOz5peJcz985DDAZN4EaamjiWnj79YOoddN5I4RRQ
	0d3y16eP5iH4KMQ5w2AGo5bCePm7qL7kZomTs1wbjCwBXII79LT5h6Wk614NBXAj8UEJ6IGqT2Tif
	p8JlO1/P1iy4xhAxYFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCePg-00000007APT-0oMG;
	Thu, 30 May 2024 11:57:44 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCePX-00000007ANJ-1n0w;
	Thu, 30 May 2024 11:57:37 +0000
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ab9ce752e0so4088166d6.0;
        Thu, 30 May 2024 04:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717070247; x=1717675047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjHdVTNPfpZSE5mw/0S4dwLQIRvAN8JureryKLiLrHw=;
        b=winccnFz+27fHq6z56Vulw88MTvxpDzZaFpadO9xsGldg28D4OqBteM0bC/bRTFrFG
         uSv/gohj8NBt3TtsxyR7x7UZQGjxhwcdawRzU/c8jaDiv75L2mEPEP/oKBYURWTnExV5
         MT4odq8vfULz5XUDsSY1YS5J0NzBD/sTr7W5R91HKH6XaewUnjCECWWgFBK2NkVbf69g
         RLq+aFOZnT08wHjvZnsbrUh2/0Ouz5cNXMHu7gc+K0+xEnPusDUeFAXpgHATuakznpeA
         jqwFn2RokBzUJBlEPkkXDw1m/jLEArpEHD3IFOTUmppSeeP+vW4FjGpUp4gVgiGSA+lP
         0T1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfHofs+zpLlufH1RVeblQ4TTvQAFOBZ9Bj+9Ouw8CFBoYT7IDWn7+7l/cvlNcq1T431oxI77XvA/2J4ULD2am1wnSYdM55RK+TSoeHQ23scG8Tw7wLe0KrE9SjE/SeNvr+1+epwuEloL3aKPRnh3HppspkY7YR9M8IqaA01X2zRL6EQfOmuaGuH6n/DsQkMaEb1XH4kz9LTNs621bpvR7MOLgjRbHmphKmNkUGsB9e5nZHnMmP7PR567bo1Fo=
X-Gm-Message-State: AOJu0YwSt+LdkMjchcKoLPYgZtWj0HJqoF3umHDG0xVn1XXihWC8xnKR
	6qSXDmW8fMVxvHxGQAjcaAQRg7MjlnTAZi/rm8Vi+vRUTHLoIGarC6EieJgt
X-Google-Smtp-Source: AGHT+IFswuqk57gNu9w5kDePsWPa/SRxqlQ9QFUHnGIXwxvpCc+ScheP2PUA60Q4WuQAGmKPQxfbgQ==
X-Received: by 2002:a05:6214:5d85:b0:6ab:8b67:8db8 with SMTP id 6a1803df08f44-6ae0cb7858emr18131726d6.5.1717070247171;
        Thu, 30 May 2024 04:57:27 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac20a1410csm62565406d6.144.2024.05.30.04.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 04:57:26 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-43fab2fa4ccso3913981cf.2;
        Thu, 30 May 2024 04:57:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQRXvGHkKeC/1Pb5J+HM0h44muY5azg/DvMVbR96xO1ffF24Y5YER0prsHE7kE3MvQHGC4QXFhvH8bhNpEjZzaD9OFVcufu+P2rmFgnjGKrQix9EGo4+nODisDhi0D7ZeRFFCBkscvd7SQsXBsSh60Qg/Qw9inx74b6dZy9gSDTicPN+QXYZL8k8oc73Q+42oUrLZdReB9H9FmXMpCL0XkSKTfpLv4SrNhAlE3PwzRUBQjJB2InZVNP6ksQ6s=
X-Received: by 2002:a25:6842:0:b0:dfa:48f3:2253 with SMTP id
 3f1490d57ef6-dfa5a619bd3mr2110161276.32.1717070226150; Thu, 30 May 2024
 04:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 13:56:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
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
	Peng Fan <peng.fan@nxp.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_045735_561853_C6F6A8C7 
X-CRM114-Status: GOOD (  20.20  )
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

SGkgUGVuZywKCk9uIFNhdCwgTWF5IDQsIDIwMjQgYXQgMzoxMuKAr1BNIFBlbmcgRmFuIChPU1Mp
IDxwZW5nLmZhbkBvc3MubnhwLmNvbT4gd3JvdGU6Cj4gVXNlIHNjb3BlIGJhc2VkIG9mX25vZGVf
cHV0KCkgdG8gc2ltcGxpZnkgY29kZS4gSXQgcmVkdWNlcyB0aGUgY2hhbmNlCj4gb2YgZm9yZ2V0
dGluZyBvZl9ub2RlX3B1dCgpLCBhbmQgYWxzbyBzaW1wbGlmaWVzIGVycm9yIGhhbmRsaW5nIHBh
dGguCj4gSSBub3QgYWJsZSB0byB0ZXN0IHRoZSBjaGFuZ2VzIG9uIGFsbCB0aGUgaGFyZHdhcmVz
LCBzbyBkcml2ZXIgb3duZXJzLAo+IHBsZWFzZSBoZWxwIHJldmlldyB3aGVuIHlvdSBoYXZlIHRp
bWUuCj4KPiBUaGlzIHBhdGNoc2V0IHdhcyBpbnNwaXJlZCBmcm9tIERhbidzIGNvbW1lbnRzIG9u
IHBpbmN0cmwtc2NtaS1pbXguYywKPiB0aGFua3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZh
biA8cGVuZy5mYW5AbnhwLmNvbT4KCkFuZHkncyBxdWVzdGlvbiBhYm91dCBjb2RlIGdlbmVyYXRp
b24gb24gYSByZWxhdGVkIHBhdGNoIG1hZGUgbWUKd29uZGVyLCB0b28uCgpPbiBhcm0zMiwgYSBj
b252ZXJzaW9uIHRvIGZvcl9lYWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKCkgc2VlbXMgdG8KY29z
dCBjYS4gNDggYnl0ZXMgb2YgYWRkaXRpb25hbCBjb2RlLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIg
dGhlcmUgd2VyZQpleHBsaWNpdCBjbGVhbnVwcyBiZWZvcmUgb3Igbm90LgoKSSBjaGVja2VkICJw
aW5jdHJsOiByZW5lc2FzOiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwcyIs
CmFuZCBhbGwgYnV0IHRoZSBjb252ZXJzaW9ucyBpbiAqX2R0X25vZGVfdG9fbWFwKCkgY29zdCA0
OCBieXRlcyBlYWNoLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAg
ICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQK
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
