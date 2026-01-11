Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86485D46628
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 20:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mwEXHla2OK23rsFTWrqfmiosrB0nPJ2ttbcRdLCIfc=; b=rL8T+MP7WGlkPh
	VIA1xhaLt0jX6IBza8Qy00tHcKY8Zs4N+yqVh7DHRwLw4/CDKQESRomB1T9/6g5qH/keCI/VZUKH/
	BlsIgmMhqw9UnlowbQo2hopl7qZqb7on/Nhc1ro+oArzKOGa+04khd57zjCDFcd9enHeikIa+zdrA
	m4ZzQcRI9IDP9zZZRJLbCfT53Sg2Q0jxebnY5pfRDRPxwm5/P0aGbBey4jS0XlCujiFmIrdIHSTSI
	FWh2IOW+YqW2ihokF75uF7gwxK+wpn5KAfGW+n7YBIIAhtscndKHgSB4kq4OzhyOujFZYdFXZhPSH
	mGdUtc+jvay4aPgYfTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgU1j-0000000D8qC-28AC;
	Thu, 15 Jan 2026 20:33:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veoMs-00000003tqz-3If0
	for linux-riscv@lists.infradead.org;
	Sun, 11 Jan 2026 05:52:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77DDE444A6
	for <linux-riscv@lists.infradead.org>; Sun, 11 Jan 2026 05:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B16EC2BCB1
	for <linux-riscv@lists.infradead.org>; Sun, 11 Jan 2026 05:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768110722;
	bh=gFOqW5EllA9fOAMNFfoSxTnUWA45XGayQuA1pDHkobg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=EaG/5oDAR9smlSfbzttjy3FKgAcfmuUQr5RohlvPT82k8gDogNTuPeVkhnNnUzN1Q
	 PUOYV9pyWf373DPlkm8bWa7AsjFvsbAbUFYXOSuK0uzvYWRb876UbNBjf7MUQ5hkon
	 bUFWMcwSnyeeICSZEdVry0FTr34MGTriVAUR5JZOHnEWo7WtKX1Zar86vjFoWEP31k
	 gk+I+morpNnQnEeEmDnBg7M0hgwxAV8m2Ct2Z/e+uEEtP48pakFbj9avoda79dJcxD
	 ypgQlN9Ed8KhEcF7CrAD1jQYrdgMLb/QRKIT7Zjo8LxcnbiYvQXEigeCDsGKtRwxxs
	 vQTRaVoQZ/NFg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b679cff1fso4280898e87.0
        for <linux-riscv@lists.infradead.org>; Sat, 10 Jan 2026 21:52:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXWgodrHXRYplMxFXGLP7RHJQhmJt12nKEteQKUy3MqeX8RIcrmOPR4UO2XmS+NbNiiOTx+mrHecJJKiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzR9ctLd2swYZ74udSEI5riaQyPIfjSUzcmtQPKcImROtS9wMh3
	49ByHKH9+T6wYNyokhA/TomCmcWGCZSbqheTkE1CcAn3i3MbcOiRSE4Ac03MjyTX5pHimR7KOtR
	o9coBUXPCwWBpP5lDazVGe6zW0AxBRGI=
X-Google-Smtp-Source: AGHT+IHdx8MpFefSjShCgzPfxBNx4mIFIm/zyAePE38bdBhjZyOXA6x69rTwWZ2pdG4l9l0f7a6WNZMxH5DhWbEqc7E=
X-Received: by 2002:a05:6512:31cd:b0:59b:6853:f085 with SMTP id
 2adb3069b0e04-59b6ef04985mr5236958e87.16.1768110718798; Sat, 10 Jan 2026
 21:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com> <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 11 Jan 2026 13:51:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v640nT=+g6bVuROizSG5Qb-upfQefs0-j9X0BnOHf9NYMg@mail.gmail.com>
X-Gm-Features: AZwV_QjlNyXyyBCLSJ5be_kfqm-PbzUe8msaEi6oZsEaSVwRVLe_bhZOZe6iKv4
Message-ID: <CAGb2v640nT=+g6bVuROizSG5Qb-upfQefs0-j9X0BnOHf9NYMg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] spi: Drop duplicate of_node assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, Varshini Rajendran <varshini.rajendran@microchip.com>, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, David Lechner <dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, Sergio Perez Gonzalez <sperezglz@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, Alessandro Grassi <alessandro.grassi@mailbox.org>, Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Wanner <ryan.wanner@microchip.com>, Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, William Zhang <william.zhang@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Chris Packham <chris.packham@alliedtelesis.co.nz>, Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_215202_855974_7E1E1E56 
X-CRM114-Status: GOOD (  13.18  )
X-Mailman-Approved-At: Thu, 15 Jan 2026 12:33:02 -0800
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKYW4gOSwgMjAyNiBhdCA0OjMw4oCvQU0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gVGhlIFNQSSBjb3JlIHByb3Zp
ZGVzIHRoZSBkZWZhdWx0IG9mX25vZGUgZm9yIHRoZSBjb250cm9sbGVyLAo+IGluaGVyaXRlZCBm
cm9tIHRoZSBhY3R1YWwgKHBhcmVudCkgZGV2aWNlLiBObyBuZWVkIHRvIHJlcGVhdCBpdAo+IGlu
IHRoZSBkcml2ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5z
aGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KWy4uLl0KCj4gIGRyaXZlcnMvc3BpL3Nw
aS1zdW40aS5jICAgICAgICAgICAgICB8IDEgLQo+ICBkcml2ZXJzL3NwaS9zcGktc3VuNmkuYyAg
ICAgICAgICAgICAgfCAxIC0KCkFja2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAa2VybmVsLm9y
Zz4gIyBzdW40aSwgc3VuNmkKClsuLi5dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
