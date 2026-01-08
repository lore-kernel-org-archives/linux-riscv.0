Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82167D46626
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 20:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hlt23qzE3omkiJls0BXn2enqDTAtppN3dWLxNx/aHP8=; b=m/QU3FXIfrG7Ug
	5XSbV4qGlaq6YT1uu6v+vRk2kedCOkRt7U8IytuXhSDiJfTyiZUZDTClMCBEiniBYAjh6bV8nA6xx
	si7ppNWdr0AqbhyPsTuVZ6AjfIvpN7OU6DVmbVDd175Az0wre4bfD8cRSS2erF18w3E0jcFuuvxbN
	loOS8YoO0SoLNz5sNu8uZA+RVvIf1mCrZ8IJynp56YDwAvzNIoUcUXS/3Fxnr7fTLAKgP6y0RqyhF
	h6dMEQAS6JXXX/hUH7GwwlNy1uzU8Xg90M95y3XXoYJVFmUGVj3be46eYFZL8BGUBHNSabBUEpQpa
	6aagGg6RGBOnoJHj2niA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgU1g-0000000D8nL-0fvZ;
	Thu, 15 Jan 2026 20:33:04 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdweJ-00000000pln-2DMP;
	Thu, 08 Jan 2026 20:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767904228; x=1799440228;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5FDjJzy6AOW1qFhOgfm62fFBhHaSU5fD45eqi9Wu6i4=;
  b=VemOoXM0KfEdqOBPesDTwbpTbFFBbD9LxTOptATok/bgKHMdjz/O/XTc
   8NKmK3tQzYZOVFe+2HNJbgyouso0KsTAYuo11f2wKLTTAKZbN80Y528QC
   W++4RLN0+uwCEmdNZlQoVpQG9NPb0maJIK/0Wto/v6iomYp/xm3/fcBBP
   5NNE1e7q48WY8MAB+cCyQaUYuRDOVpzeerQqDeSUIgYKy+qnIvIreIi+F
   bzSu/QLYkZhQ0z9y+/b1AVHWAvigdCyCnofd+C0qkQsJlRNe1A32Aw4Uh
   X3m1KibjgPm9N51+B9iX9FeAx3UfRyid19YNNmiUbxry+mkv230BlbXxC
   Q==;
X-CSE-ConnectionGUID: 87omg/jgSDyyd3DNuoVTzg==
X-CSE-MsgGUID: qXmMy+0UT7a0IwgUmoV4og==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68485869"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="68485869"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 12:30:26 -0800
X-CSE-ConnectionGUID: dV6UL5sSSy6kvW0TibQ/lg==
X-CSE-MsgGUID: ssbC0vDPTbSXiI7fJK5T+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="226706600"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2026 12:30:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8983166; Thu, 08 Jan 2026 21:30:15 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Janne Grunau <j@jannau.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	CL Wang <cl634@andestech.com>,
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Rosen Penev <rosenp@gmail.com>,
	Luis de Arquer <luis.dearquer@inertim.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Alessandro Grassi <alessandro.grassi@mailbox.org>,
	Chen-Yu Tsai <wens@kernel.org>,
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
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	William Zhang <william.zhang@broadcom.com>,
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
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
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
	Heiko Stuebner <heiko@sntech.de>,
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
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Michal Simek <michal.simek@amd.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v1 0/4] spi: Make SPI core to take care of fwnode assignment
Date: Thu,  8 Jan 2026 21:23:37 +0100
Message-ID: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_123027_602726_5FE39E1B 
X-CRM114-Status: GOOD (  14.28  )
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
YXQgaXMgdGFrZW4gY2FyZSBpbgp0aGUgZmlyc3QgcGF0Y2ggYW5kIHdvdWxkIGJlIG5pY2UgdG8g
aGF2ZSBhIGNvbmZpcm1hdGlvbiBmcm9tIENpcnJ1cwp0aGF0IGV2ZXJ5dGhpbmcgaXMgb2theS4g
VGhlIHJlc3QgaXMganVzdCBhIG1lY2hhbmljYWwgY29udmVyc2lvbi4KCkFuZHkgU2hldmNoZW5r
byAoNCk6CiAgc3BpOiBQcm9wYWdhdGUgZGVmYXVsdCBmd25vZGUgdG8gdGhlIFNQSSBjb250cm9s
bGVyIGRldmljZQogIHNwaTogRHJvcCBkdXBsaWNhdGUgb2Zfbm9kZSBhc3NpZ25tZW50CiAgc3Bp
OiBEcm9wIGR1cGxpY2F0ZSBmd25vZGUgYXNzaWdubWVudAogIHNwaTogRHJvcCBkdXBsaWNhdGUg
ZGV2aWNlX3NldF9ub2RlKCkgY2FsbAoKIGRyaXZlcnMvc3BpL2F0bWVsLXF1YWRzcGkuYyAgICAg
ICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWFpcm9oYS1zbmZpLmMgICAgICAgIHwgMSAtCiBk
cml2ZXJzL3NwaS9zcGktYWx0ZXJhLXBsYXRmb3JtLmMgICAgfCAyIC0tCiBkcml2ZXJzL3NwaS9z
cGktYW1sb2dpYy1zcGlmYy1hMS5jICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1hbWxvZ2ljLXNw
aXNnLmMgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWFwcGxlLmMgICAgICAgICAgICAgIHwg
MSAtCiBkcml2ZXJzL3NwaS9zcGktYXI5MzR4LmMgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMv
c3BpL3NwaS1hcm1hZGEtMzcwMC5jICAgICAgICB8IDQgKy0tLQogZHJpdmVycy9zcGkvc3BpLWFz
cGVlZC1zbWMuYyAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktYXRjc3BpMjAwLmMgICAg
ICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1hdGg3OS5jICAgICAgICAgICAgICB8IDEgLQog
ZHJpdmVycy9zcGkvc3BpLWF0bWVsLmMgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9z
cGktYXhpLXNwaS1lbmdpbmUuYyAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1iY20tcXNwaS5j
ICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWJjbTI4MzUuYyAgICAgICAgICAgIHwg
MSAtCiBkcml2ZXJzL3NwaS9zcGktYmNtMjgzNWF1eC5jICAgICAgICAgfCAxIC0KIGRyaXZlcnMv
c3BpL3NwaS1iY202M3h4LWhzc3BpLmMgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWJjbTYz
eHguYyAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktYmNtYmNhLWhzc3BpLmMgICAg
ICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYyAgICB8IDEgLQogZHJp
dmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGkt
Y2FkZW5jZS5jICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1jYXZpdW0tb2N0ZW9u
LmMgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWNhdml1bS10aHVuZGVyeC5jICAgIHwgMSAt
CiBkcml2ZXJzL3NwaS9zcGktY2xwczcxMXguYyAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3Bp
L3NwaS1jczQybDQzLmMgICAgICAgICAgICB8IDggKysrKysrKysKIGRyaXZlcnMvc3BpL3NwaS1k
YXZpbmNpLmMgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWRsbjIuYyAgICAgICAg
ICAgICAgIHwgMiAtLQogZHJpdmVycy9zcGkvc3BpLWR3LWNvcmUuYyAgICAgICAgICAgIHwgMiAt
LQogZHJpdmVycy9zcGkvc3BpLWVwOTN4eC5jICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3Nw
aS9zcGktZmFsY29uLmMgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1mc2wtZHNw
aS5jICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWZzbC1lc3BpLmMgICAgICAgICAg
IHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktZnNsLWxpYi5jICAgICAgICAgICAgfCAxIC0KIGRyaXZl
cnMvc3BpL3NwaS1mc2wtbHBzcGkuYyAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWdl
bmktcWNvbS5jICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktZ3Bpby5jICAgICAgICAg
ICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1neHAuYyAgICAgICAgICAgICAgICB8IDEgLQog
ZHJpdmVycy9zcGkvc3BpLWhpc2kta3VucGVuZy5jICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9z
cGktaW1nLXNwZmkuYyAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1pbXguYyAgICAg
ICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWluZ2VuaWMuYyAgICAgICAgICAgIHwg
MSAtCiBkcml2ZXJzL3NwaS9zcGktbGFudGlxLXNzYy5jICAgICAgICAgfCAxIC0KIGRyaXZlcnMv
c3BpL3NwaS1samNhLmMgICAgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLWxvb25n
c29uLWNvcmUuYyAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktbHA4ODQxLXJ0Yy5jICAgICAg
ICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1tZXNvbi1zcGljYy5jICAgICAgICB8IDEgLQogZHJp
dmVycy9zcGkvc3BpLW1lc29uLXNwaWZjLmMgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGkt
bWljcm9jaGlwLWNvcmUtc3BpLmMgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1tcGM1MTJ4LXBzYy5j
ICAgICAgICB8IDIgLS0KIGRyaXZlcnMvc3BpL3NwaS1tcGM1Mnh4LXBzYy5jICAgICAgICB8IDIg
LS0KIGRyaXZlcnMvc3BpL3NwaS1tcGM1Mnh4LmMgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9z
cGkvc3BpLW1wZnMuYyAgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktbXQ2NXh4
LmMgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1tdDc2MjEuYyAgICAgICAgICAg
ICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLW10ay1ub3IuYyAgICAgICAgICAgIHwgMSAtCiBkcml2
ZXJzL3NwaS9zcGktbXRrLXNuZmkuYyAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1t
dXguYyAgICAgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLW14aWMuYyAgICAgICAg
ICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktbnBjbS1maXUuYyAgICAgICAgICAgfCAxIC0K
IGRyaXZlcnMvc3BpL3NwaS1ucGNtLXBzcGkuYyAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkv
c3BpLW54cC1mc3BpLmMgICAgICAgICAgIHwgMiAtLQogZHJpdmVycy9zcGkvc3BpLW54cC14c3Bp
LmMgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktb2MtdGlueS5jICAgICAgICAgICAg
fCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1vcmlvbi5jICAgICAgICAgICAgICB8IDEgLQogZHJpdmVy
cy9zcGkvc3BpLXBsMDIyLmMgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktcHhh
Mnh4LmMgICAgICAgICAgICAgfCAyIC0tCiBkcml2ZXJzL3NwaS9zcGktcWNvbS1xc3BpLmMgICAg
ICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMgICAgICAgICB8IDEgLQog
ZHJpdmVycy9zcGkvc3BpLXF1cC5jICAgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9z
cGktcmI0eHguYyAgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1yZWFsdGVrLXJ0
bC1zbmFuZC5jICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXJlYWx0ZWstcnRsLmMgICAgICAgIHwg
MSAtCiBkcml2ZXJzL3NwaS9zcGktcm9ja2NoaXAtc2ZjLmMgICAgICAgfCAxIC0KIGRyaXZlcnMv
c3BpL3NwaS1yb2NrY2hpcC5jICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXJzcGku
YyAgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktcnp2MmgtcnNwaS5jICAgICAg
ICAgfCAyIC0tCiBkcml2ZXJzL3NwaS9zcGktcnp2Mm0tY3NpLmMgICAgICAgICAgfCAyIC0tCiBk
cml2ZXJzL3NwaS9zcGktczNjNjR4eC5jICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3Nw
aS1zYzE4aXM2MDIuYyAgICAgICAgICB8IDIgLS0KIGRyaXZlcnMvc3BpL3NwaS1zZzIwNDQtbm9y
LmMgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXNoLWhzcGkuYyAgICAgICAgICAgIHwg
MSAtCiBkcml2ZXJzL3NwaS9zcGktc2gtbXNpb2YuYyAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMv
c3BpL3NwaS1zaWZpdmUuYyAgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXNsYXZl
LW10Mjd4eC5jICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktc24tZi1vc3BpLmMgICAgICAg
ICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1zcHJkLWFkaS5jICAgICAgICAgICB8IDEgLQogZHJp
dmVycy9zcGkvc3BpLXNwcmQuYyAgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGkt
c3RtMzItb3NwaS5jICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS1zdG0zMi1xc3BpLmMg
ICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMgICAgICAgICAgICAgIHwgMSAt
CiBkcml2ZXJzL3NwaS9zcGktc3VuNGkuYyAgICAgICAgICAgICAgfCAxIC0KIGRyaXZlcnMvc3Bp
L3NwaS1zdW42aS5jICAgICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXN1bnBsdXMt
c3A3MDIxLmMgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktc3lucXVhY2VyLmMgICAgICAgICAg
fCAzIC0tLQogZHJpdmVycy9zcGkvc3BpLXRlZ3JhMTE0LmMgICAgICAgICAgIHwgMSAtCiBkcml2
ZXJzL3NwaS9zcGktdGVncmEyMC1zZmxhc2guYyAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS10
ZWdyYTIwLXNsaW5rLmMgICAgICB8IDEgLQogZHJpdmVycy9zcGkvc3BpLXRlZ3JhMjEwLXF1YWQu
YyAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGktdGktcXNwaS5jICAgICAgICAgICAgfCAxIC0K
IGRyaXZlcnMvc3BpL3NwaS11bmlwaGllci5jICAgICAgICAgICB8IDEgLQogZHJpdmVycy9zcGkv
c3BpLXZpcnRpby5jICAgICAgICAgICAgIHwgMiAtLQogZHJpdmVycy9zcGkvc3BpLXdwY20tZml1
LmMgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGkteGNvbW0uYyAgICAgICAgICAgICAg
fCAxIC0KIGRyaXZlcnMvc3BpL3NwaS14aWxpbnguYyAgICAgICAgICAgICB8IDEgLQogZHJpdmVy
cy9zcGkvc3BpLXhscC5jICAgICAgICAgICAgICAgIHwgMSAtCiBkcml2ZXJzL3NwaS9zcGkteHRl
bnNhLXh0ZnBnYS5jICAgICAgfCAxIC0KIGRyaXZlcnMvc3BpL3NwaS5jICAgICAgICAgICAgICAg
ICAgICB8IDMgKysrCiAxMDggZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIxIGRl
bGV0aW9ucygtKQoKLS0gCjIuNTAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
