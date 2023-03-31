Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB0EC76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 12:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaNAlw6yLril6XbRTSqWgFUrgi2oL28UZl4YMKgIkIk=; b=K55uYd4WP0oBem
	VMakfH3We1NVtDpU50BQNSRq8Hx3unB/KhrY0j8xBl0KmIGj2HQVnqvgBWHQLebpZp8CI51nppB5u
	G0pgInDXZ1mbNfzYyXowcT09yNg8H86EHxilt05RLuJG4I3/5kkVkTt64RKSIbCkVKYvO0xuy5kbI
	CZtCtbe7tVAoFX8uR5w9Wu03oupJlGAn4B0oO4ENTaRUgZhjBY4x8u5aQlneIEX7r4AyO1ClmXyVp
	OPp+RHf5yGwjzcJ7lVRWH65CBXmklxQXYhomqzoiaab4FHXdKK6Yol98MDiR+NbuqvIP5oYkeDM0/
	s2xhLXUXDvGDmNqJovMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piE2x-007LCf-0d;
	Fri, 31 Mar 2023 12:39:59 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piE0d-007Ji4-2C
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 12:37:39 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-54601d90118so256698407b3.12
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 05:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680266252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6lKdgk6THqQzNp4VvxVKewKaHaWOnEhQknxk2acjn0=;
        b=ZMrC7RQQSpVfgy/SHMpfC+E2QpLMDaY5/yaDkSHUKYAESGTlYtEL7g/qRUeknQy91P
         zUvgfNL0L6h3FNfh9c8D2HFAFVYOCP9WG625XToYyxYEiXALrCS5KsLDkaIeSbXlXde1
         eg6UEhsSIBdX6MmhPhtTRLpJ9X4gdd+QI1NZNQSGtPnmNcH0Md5Wv/wDx/8mZJzSNT7K
         vAZIJkR9VzoIqc5aO0g4o0xB+IpDOheOKDhB6ttu5EMPirHAV26dyaOz/pB9Dw1cQhWl
         Nw5HjfOlvF3F0OheAjfDdZPbDekSVJ+CefyXJevdAGQrjbRZSi8YsUnd1+evdQw6Mb3h
         4YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680266252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6lKdgk6THqQzNp4VvxVKewKaHaWOnEhQknxk2acjn0=;
        b=Se+0abqPejGkAe4dIJ4A+vULC1VGc7AgKxZAgXVm0UjbvirFJNnCibBVfvyacyvFuz
         SDjhBadNmkNBaoSWOtI8cXYsS3lSlQrkyg9oQ26ki5PANX3j9GIEclaTcrknXxTI8VSj
         ynfeGthEUUgzCy6VYhx/PGaiDaybNVMTTHPbbz0sRxutyB1jUOxA4kLRLPEajxslEeVN
         CyLzrhOwdKtYxXhG9uBz265y2q7lrg5rood3yVu5GozIa2YF77f4YIht7s5617hVbRQD
         e7jVzwADcCwdBf32s0yNWPJD2BVrIuvIy5zTfZ/s5AT9JAJtrC16ka8HLSb5mZHzvwoh
         yJPQ==
X-Gm-Message-State: AAQBX9fbKZAm7F/WIt93qgdT8iBLgfn+PO96pY8FEsuVfgQcMGziHHSW
	CTQY+hCM7PDVTIs46AXg0cLnIbzGfqdRqzJh67bPkg==
X-Google-Smtp-Source: AKy350aQG4pTb9063C5UpGPTZlWu/1jB1S9bOfbEf1bci1cyW8YxugalTaCiIXNAm4RWMBbCrWxYKS+tBxFA+9FzOXI=
X-Received: by 2002:a81:c84a:0:b0:541:753d:32f9 with SMTP id
 k10-20020a81c84a000000b00541753d32f9mr13384037ywl.9.1680266252481; Fri, 31
 Mar 2023 05:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230330200402.2731992-1-robh@kernel.org>
In-Reply-To: <20230330200402.2731992-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Mar 2023 14:37:21 +0200
Message-ID: <CACRpkdYwM5Kw4XB9S5qoqdK-boiYp2iu=LRZ-B-vJb1k9fNnig@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Damien Le Moal <damien.lemoal@wdc.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
	Wells Lu <wellslutw@gmail.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Michal Simek <michal.simek@xilinx.com>, Cristian Ciocaltea <cristian.ciocaltea@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	=?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, 
	Jonas Gorski <jonas.gorski@gmail.com>, - <patches@opensource.cirrus.com>, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, Peng Fan <peng.fan@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Rahul Tanwar <rahul.tanwar@linux.intel.com>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars Povlsen <lars.povlsen@microchip.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Chris Brandt <chris.brandt@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Gareth Williams <gareth.williams.jx@renesas.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Drew Fustini <drew@beagleboard.org>, 
	Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_053735_863841_BC6F5789 
X-CRM114-Status: GOOD (  10.61  )
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

T24gVGh1LCBNYXIgMzAsIDIwMjMgYXQgMTA6MDXigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gQ2xlYW51cCBiaW5kaW5ncyBkcm9wcGluZyB1bm5lZWRlZCBxdW90
ZXMuIE9uY2UgYWxsIHRoZXNlIGFyZSBmaXhlZCwKPiBjaGVja2luZyBmb3IgdGhpcyBjYW4gYmUg
ZW5hYmxlZCBpbiB5YW1sbGludC4KPgo+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gQWNrZWQtYnk6IEhlY3RvciBNYXJ0aW4gPG1hcmNhbkBt
YXJjYW4uc3Q+Cj4gQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0Bn
bGlkZXIuYmU+Cj4gQWNrZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFp
bC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+ICNy
b2NrY2hpcAo+IFJldmlld2VkLWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEBvcGVu
c291cmNlLndkYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+IHYyOgo+ICAtIFJlYmFzZSBvbiBwaW5jdHJsIHRyZWUK
CkkgYXBwbGllZCBpdCBxdWlja2x5IGJlZm9yZSBzb21ldGhpbmcgZWxzZSBjaGFuZ2VzIQoKVGhh
bmtzIGZvciByZXNwaW5uaW5nLCBhbmQgdGhhbmtzIGFzIGFsd2F5cyBmb3IgZHJpdmluZyB0aGVz
ZSBjaGFuZ2VzLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
