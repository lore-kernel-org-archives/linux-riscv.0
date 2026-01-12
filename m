Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5EFD4662C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kAhILt23SrBnXcx+N/b4Jk1NtOk6V0+KaZtKTSo+UKI=; b=V71puekJu+dK/m
	gfAcf75K3Hi+qXuh1Ph5APecCRZtO1sOqsHxL6pABgVF39e1sYzPfNKi1rfZyFd8xzzC5c1W+UaNc
	ip+rfQ4EXRjqF08Jkkhm1vuJ4C8ig9WcwxkKAjUx0DPugUNumuAiknBEAR1lBaF/zLmTyaEOHmsYD
	GK+RQSRIzG99OSIoE0aPkXGncf53jfK6E4rXFrZ4nw21jGUb734yEgYF+CczMSa5qQeSfY6RkVWkZ
	NFMKf75fhgNikL/56hxz+UjqUfI8ddmbq8MXgVzeCJwTiBsgiNXh4H1Dj4oCEan1GQq+f5/HPL/3i
	/QdEmgPI4zKQfaLCT/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgU1l-0000000D8so-3d9b;
	Thu, 15 Jan 2026 20:33:09 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfOdj-00000006B1P-1GwU;
	Mon, 12 Jan 2026 20:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768250152; x=1799786152;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=REqCyoJrIpewtMdGURz7oYk9zmr7BJajQXuF1TakMwI=;
  b=TyuTtnyQvmTyxhohp0FEYfNTsNdR+oiZQfT5NJizK++/HwYR5T64GsHn
   Yf/WnZhr7YmzMCsHU0PBhtayJAjsTzVV/VzkfNxCJdUnJoW1/M2QUMYVv
   Mrk1+baoYwsp43WMx2M0C3gjxzpBnheZSXFOg9HhUK2/WYmBX0adMm998
   EXzZTSO5BSYrW/ttoG65oXtX+gWXgxHitG7QaeJ4abWubT9Xq+BkYwgtH
   m2ojX2t3smPQZ6fglOlY23uL6o3ZGJ6zuFCaj/PRQ/31SMiusZU51tB1i
   XDmHrslFv/grpDBWlAnISJPTSsTEvVWSB4XW0ShyS1kD5olrroFissLKs
   g==;
X-CSE-ConnectionGUID: 433/TEnjQiWKYb38BIyhpQ==
X-CSE-MsgGUID: v5caZGNFT4mGaizk1iLAyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69515863"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69515863"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 12:35:49 -0800
X-CSE-ConnectionGUID: 7PU/+58FRGmZBHD6gr/4xw==
X-CSE-MsgGUID: rZrk0S0xRlSTSs6fidTsfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="209262138"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 12 Jan 2026 12:35:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6841594; Mon, 12 Jan 2026 21:35:37 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Janne Grunau <j@jannau.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chen-Yu Tsai <wens@kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	CL Wang <cl634@andestech.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Heiko Stuebner <heiko@sntech.de>,
	William Zhang <william.zhang@broadcom.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	David Lechner <dlechner@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Hang Zhou <929513338@qq.com>,
	Jun Guo <jun.guo@cixtech.com>,
	Philipp Stanner <phasta@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Shiji Yang <yangshiji66@outlook.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Carlos Song <carlos.song@nxp.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Sergio Perez Gonzalez <sperezglz@gmail.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Rosen Penev <rosenp@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Luis de Arquer <luis.dearquer@inertim.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Alessandro Grassi <alessandro.grassi@mailbox.org>,
	Darshan R <rathod.darshan.0896@gmail.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	Vishwaroop A <va@nvidia.com>,
	Haixu Cui <quic_haixcui@quicinc.com>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Sven Peter <sven@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Yang Shen <shenyang39@huawei.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Han Xu <han.xu@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Li-hao Kuo <lhjeff911@gmail.com>,
	Masahisa Kojima <masahisa.kojima@linaro.org>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Michal Simek <michal.simek@amd.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 0/4] spi: Make SPI core to take care of fwnode assignment
Date: Mon, 12 Jan 2026 21:21:22 +0100
Message-ID: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_123551_440512_47CCAEAE 
X-CRM114-Status: GOOD (  14.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SXQgc2VlbXMgYWxsIG9mIHRoZSBTUEkgZHJpdmVycyB3YW50IHRvIHByb3BhZ2F0ZSBmd25vZGUg
KG9yIG9mX25vZGUpCm9mIHRoZSBwaHlzaWNhbCBkZXZpY2UgdG8gdGhlIFNQSSBkZXZpY2UuIE1h
a2Ugc3VyZSB3ZSBkb24ndCBkdXBsaWNhdGUKaXQgb3ZlciBhbmQgb3ZlciBpbiBlYWNoIG5ldyBk
cml2ZXIgKCsyIGluIHRoaXMgY3ljbGUpIGJ5IG1ha2luZyBjb3JlCnRvIHRha2UgY2FyZSBvZiB0
aGF0LiBOb3RlLCBzaW1pbGFyIGlzIGRvbmUgYWxyZWFkeSBieSBJSU8gYW5kCknCskMgc3Vic3lz
dGVtcy4KClRoZXJlIGlzIG9uZSBub3RpY2VhYmxlIGFuZCBxdWl0ZSBzcGVjaWZpYyBjYXNlIHRo
YXQgaXMgdGFrZW4gY2FyZSBpbgp0aGUgZmlyc3QgcGF0Y2ggYW5kIG5vdyB3ZSBoYXZlIGEgY29u
ZmlybWF0aW9uIGZyb20gQ2lycnVzIHRoYXQgZXZlcnl0aGluZwppcyBva2F5LiAgVGhlIHJlc3Qg
aXMganVzdCBhIG1lY2hhbmljYWwgY29udmVyc2lvbiBhZnRlciBjaGVja2luZyB0aGF0CnRoZSBw
YXJlbnQgZGV2aWNlIGlzIGFzc2lnbmVkIHRvIHRoZSBzYW1lIHRoYXQgcHJvdmlkZXMgdGhlIHJl
c3BlY3RpdmUKZndub2RlLgoKQ2hhbmdlbG9nIHYyOgotIGNvbGxlY3RlZCB0YWdzCi0gZml4ZWQg
Vz0xIHdhcm5pbmcgKHVudXNlZCB2YXJpYWJsZSkgaW4gc3BpLWRsbjIuYyAoTEtQKQoKdjE6IDIw
MjYwMTA4MjAzMDA0LjM1Mzg0NDktMS1hbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20K
CkFuZHkgU2hldmNoZW5rbyAoNCk6CiAgc3BpOiBQcm9wYWdhdGUgZGVmYXVsdCBmd25vZGUgdG8g
dGhlIFNQSSBjb250cm9sbGVyIGRldmljZQogIHNwaTogRHJvcCBkdXBsaWNhdGUgb2Zfbm9kZSBh
c3NpZ25tZW50CiAgc3BpOiBEcm9wIGR1cGxpY2F0ZSBmd25vZGUgYXNzaWdubWVudAogIHNwaTog
RHJvcCBkdXBsaWNhdGUgZGV2aWNlX3NldF9ub2RlKCkgY2FsbAoKIGRyaXZlcnMvc3BpL2F0bWVs
LXF1YWRzcGkuYyAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWFpcm9oYS1zbmZpLmMg
ICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktYWx0ZXJhLXBsYXRmb3JtLmMgICAgfCAyIC0t
CiBkcml2ZXJzL3NwaS9zcGktYW1sb2dpYy1zcGlmYy1hMS5jICAgfCAxIC0KIGRyaXZlcnMvc3Bp
L3NwaS1hbWxvZ2ljLXNwaXNnLmMgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWFwcGxlLmMg
ICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktYXI5MzR4LmMgICAgICAgICAgICAg
fCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1hcm1hZGEtMzcwMC5jICAgICAgICB8IDQgKy0tLQogZHJp
dmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGkt
YXRjc3BpMjAwLmMgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1hdGg3OS5jICAgICAg
ICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWF0bWVsLmMgICAgICAgICAgICAgIHwgMSAt
CiBkcml2ZXJzL3NwaS9zcGktYXhpLXNwaS1lbmdpbmUuYyAgICAgfCAxIC0KIGRyaXZlcnMvc3Bp
L3NwaS1iY20tcXNwaS5jICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWJjbTI4MzUu
YyAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktYmNtMjgzNWF1eC5jICAgICAgICAg
fCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1iY202M3h4LWhzc3BpLmMgICAgICB8IDEgLQogZHJpdmVy
cy9zcGkvc3BpLWJjbTYzeHguYyAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktYmNt
YmNhLWhzc3BpLmMgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGku
YyAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jICAgICAgIHwgMSAtCiBk
cml2ZXJzL3NwaS9zcGktY2FkZW5jZS5jICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3Nw
aS1jYXZpdW0tb2N0ZW9uLmMgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWNhdml1bS10aHVu
ZGVyeC5jICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktY2xwczcxMXguYyAgICAgICAgICAgfCAx
IC0KIGRyaXZlcnMvc3BpL3NwaS1jczQybDQzLmMgICAgICAgICAgICB8IDggKysrKysrKysKIGRy
aXZlcnMvc3BpL3NwaS1kYXZpbmNpLmMgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3Bp
LWRsbjIuYyAgICAgICAgICAgICAgIHwgMyAtLS0KIGRyaXZlcnMvc3BpL3NwaS1kdy1jb3JlLmMg
ICAgICAgICAgICB8IDIgLS0KIGRyaXZlcnMvc3BpL3NwaS1lcDkzeHguYyAgICAgICAgICAgICB8
IDEgLQogZHJpdmVycy9zcGkvc3BpLWZhbGNvbi5jICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJz
L3NwaS9zcGktZnNsLWRzcGkuYyAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1mc2wt
ZXNwaS5jICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWZzbC1saWIuYyAgICAgICAg
ICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktZnNsLWxwc3BpLmMgICAgICAgICAgfCAxIC0KIGRy
aXZlcnMvc3BpL3NwaS1nZW5pLXFjb20uYyAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3Bp
LWdwaW8uYyAgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktZ3hwLmMgICAgICAg
ICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1oaXNpLWt1bnBlbmcuYyAgICAgICB8IDEg
LQogZHJpdmVycy9zcGkvc3BpLWltZy1zcGZpLmMgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3Nw
aS9zcGktaW14LmMgICAgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1pbmdlbmlj
LmMgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWxhbnRpcS1zc2MuYyAgICAgICAg
IHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktbGpjYS5jICAgICAgICAgICAgICAgfCAxIC0KIGRyaXZl
cnMvc3BpL3NwaS1sb29uZ3Nvbi1jb3JlLmMgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWxw
ODg0MS1ydGMuYyAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktbWVzb24tc3BpY2MuYyAg
ICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1tZXNvbi1zcGlmYy5jICAgICAgICB8IDEgLQog
ZHJpdmVycy9zcGkvc3BpLW1pY3JvY2hpcC1jb3JlLXNwaS5jIHwgMSAtCiBkcml2ZXJzL3NwaS9z
cGktbXBjNTEyeC1wc2MuYyAgICAgICAgfCAyIC0tCiBkcml2ZXJzL3NwaS9zcGktbXBjNTJ4eC1w
c2MuYyAgICAgICAgfCAyIC0tCiBkcml2ZXJzL3NwaS9zcGktbXBjNTJ4eC5jICAgICAgICAgICAg
fCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1tcGZzLmMgICAgICAgICAgICAgICB8IDEgLQogZHJpdmVy
cy9zcGkvc3BpLW10NjV4eC5jICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktbXQ3
NjIxLmMgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1tdGstbm9yLmMgICAgICAg
ICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLW10ay1zbmZpLmMgICAgICAgICAgIHwgMSAtCiBk
cml2ZXJzL3NwaS9zcGktbXV4LmMgICAgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3Nw
aS1teGljLmMgICAgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLW5wY20tZml1LmMg
ICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktbnBjbS1wc3BpLmMgICAgICAgICAgfCAx
IC0KIGRyaXZlcnMvc3BpL3NwaS1ueHAtZnNwaS5jICAgICAgICAgICB8IDIgLS0KIGRyaXZlcnMv
c3BpL3NwaS1ueHAteHNwaS5jICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLW9jLXRp
bnkuYyAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktb3Jpb24uYyAgICAgICAgICAg
ICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1wbDAyMi5jICAgICAgICAgICAgICB8IDEgLQogZHJp
dmVycy9zcGkvc3BpLXB4YTJ4eC5jICAgICAgICAgICAgIHwgMiAtLQogZHJpdmVycy9zcGkvc3Bp
LXFjb20tcXNwaS5jICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5j
ICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1xdXAuYyAgICAgICAgICAgICAgICB8IDEg
LQogZHJpdmVycy9zcGkvc3BpLXJiNHh4LmMgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3Nw
aS9zcGktcmVhbHRlay1ydGwtc25hbmQuYyAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1yZWFsdGVr
LXJ0bC5jICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXJvY2tjaGlwLXNmYy5jICAgICAg
IHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktcm9ja2NoaXAuYyAgICAgICAgICAgfCAxIC0KIGRyaXZl
cnMvc3BpL3NwaS1yc3BpLmMgICAgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXJ6
djJoLXJzcGkuYyAgICAgICAgIHwgMiAtLQogZHJpdmVycy9zcGkvc3BpLXJ6djJtLWNzaS5jICAg
ICAgICAgIHwgMiAtLQogZHJpdmVycy9zcGkvc3BpLXMzYzY0eHguYyAgICAgICAgICAgIHwgMSAt
CiBkcml2ZXJzL3NwaS9zcGktc2MxOGlzNjAyLmMgICAgICAgICAgfCAyIC0tCiBkcml2ZXJzL3Nw
aS9zcGktc2cyMDQ0LW5vci5jICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1zaC1oc3Bp
LmMgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXNoLW1zaW9mLmMgICAgICAgICAg
IHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktc2lmaXZlLmMgICAgICAgICAgICAgfCAxIC0KIGRyaXZl
cnMvc3BpL3NwaS1zbGF2ZS1tdDI3eHguYyAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXNu
LWYtb3NwaS5jICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktc3ByZC1hZGkuYyAgICAg
ICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1zcHJkLmMgICAgICAgICAgICAgICB8IDEgLQog
ZHJpdmVycy9zcGkvc3BpLXN0bTMyLW9zcGkuYyAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9z
cGktc3RtMzItcXNwaS5jICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1zdG0zMi5jICAg
ICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXN1bjRpLmMgICAgICAgICAgICAgIHwg
MSAtCiBkcml2ZXJzL3NwaS9zcGktc3VuNmkuYyAgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMv
c3BpL3NwaS1zdW5wbHVzLXNwNzAyMS5jICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXN5bnF1
YWNlci5jICAgICAgICAgIHwgMyAtLS0KIGRyaXZlcnMvc3BpL3NwaS10ZWdyYTExNC5jICAgICAg
ICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXRlZ3JhMjAtc2ZsYXNoLmMgICAgIHwgMSAtCiBk
cml2ZXJzL3NwaS9zcGktdGVncmEyMC1zbGluay5jICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3Nw
aS10ZWdyYTIxMC1xdWFkLmMgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXRpLXFzcGkuYyAg
ICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktdW5pcGhpZXIuYyAgICAgICAgICAgfCAx
IC0KIGRyaXZlcnMvc3BpL3NwaS12aXJ0aW8uYyAgICAgICAgICAgICB8IDIgLS0KIGRyaXZlcnMv
c3BpL3NwaS13cGNtLWZpdS5jICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXhjb21t
LmMgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGkteGlsaW54LmMgICAgICAgICAg
ICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS14bHAuYyAgICAgICAgICAgICAgICB8IDEgLQogZHJp
dmVycy9zcGkvc3BpLXh0ZW5zYS14dGZwZ2EuYyAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGku
YyAgICAgICAgICAgICAgICAgICAgfCAzICsrKwogMTA4IGZpbGVzIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDEyMiBkZWxldGlvbnMoLSkKCi0tIAoyLjUwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
