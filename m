Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11346C43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 00:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KuquNnpT/x4lMnXx3PJQdlXAs0Kccn/iws2mMaQQsw8=; b=w9wNwS2T5925y7
	ZNPc3M6THiJfrWFHet2pA5rrHakb0eSM9z8G1zX+dH/tvIMxo/9pjwawvXXSitaCx4/LkPTCtESOS
	RXM9JJqWT1On7am2Wed924zgorzfqiNX9lgUMBBoYK4NTjl0Oxo74faYrD5b/5byy4SR4NHr+DI9j
	2oyRE7jOYPu3KIEzHIUutul8WjHtjr289O1aWN1BMLLCGjxl85RRmDX/g83CUwvpps86JeBsNwFPR
	/hz8CbhAnz6Fu9mj8hJdRDYxROUQIlsaxe8fNbEwKQu/bCFYwerAWnaqXq4mOGdfR7NbZyKQe08/C
	dROXdihqGDl1ZX2kYzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgXIC-0000000AuPS-0sZj;
	Mon, 06 Jul 2026 00:34:36 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgXI9-0000000AuLz-1MSm
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 00:34:35 +0000
Message-ID: <973f3d6f-6ff4-4685-9c9f-b07987f74d98@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783298059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wYrjdzAhnc0P88BFwUH/b6uj52WFQfIRb2R1u4QFCds=;
	b=mLsuUED9ENIp3ed3h8bdKFYcEwFgoRzOELLNc1jLIXF6taZ+WEztXLwd9/BAKQWvUz2Hs3
	3EKLIatmB5Z+Df3dgdlCr8bmpTJQbWFj3Jp6WCvzaQnW40BXVB4LUsJRj7jQdhncagFIYu
	oCbFYryMjDBm1fu5il4d+x3rl9gBRyM=
Date: Mon, 6 Jul 2026 08:33:47 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, linux-pwm@vger.kernel.org
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Michael Walle
 <mwalle@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Hammer Hsieh <hammerh0314@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Alexey Charkov <alchark@gmail.com>, Sean Anderson <sean.anderson@linux.dev>,
 Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev
References: <cover.1783263835.git.ukleinek@kernel.org>
 <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_173433_504668_A5E976AA 
X-CRM114-Status: GOOD (  13.54  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDcvNS8yMDI2IDExOjE0IFBNLCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHVi
KSB3cm90ZToKPiAgIC0gVXNlIGEgc2luZ2xlIHNwYWNlIGluIGEgb2ZfZGV2aWNlX2lkIGFycmF5
IHRlcm1pbmF0b3I7IEEgc2luZ2xlIHNwYWNlCj4gICAgIGFmdGVyIHRoZSBvcGVuaW5nIHsgYW5k
IGJlZm9yZSB0aGUgY2xvc2luZyB9IGluIG5vbi1lbXB0eQo+ICAgICBpbml0aWFsaXplcnM7Cj4g
ICAtIE5vIGNvbW1hIGFmdGVyIGFuIGFycmF5IHRlcm1pbmF0b3I7Cj4gICAtIEFsc28gbm8gdHJh
aWxpbmcgY29tbWEgYWZ0ZXIgYSBuYW1lZCBpbml0aWFsaXplciBpZmYgdGhlCmlmZiAtPiBpZgo+
ICAgICBjbG9zaW5nIH0gaXMgb24gdGhlIHNhbWUgbGluZTsKPgo+IFNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIDx1LmtsZWluZS1rb2VuaWdAYmF5bGli
cmUuY29tPgoKWy4uLi4uLl0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zb3BoZ28t
c2cyMDQyLmMgYi9kcml2ZXJzL3B3bS9wd20tc29waGdvLXNnMjA0Mi5jCj4gaW5kZXggN2QwN2Iw
Y2E3ZDI5Li4wYjY0NjExNzJlNmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wd20vcHdtLXNvcGhn
by1zZzIwNDIuYwo+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bS1zb3BoZ28tc2cyMDQyLmMKPiBAQCAt
MjI1LDExICsyMjUsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzZzIwNDJfY2hpcF9kYXRhIHNn
MjA0NF9jaGlwX2RhdGEgPSB7Cj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBz
ZzIwNDJfcHdtX2lkc1tdID0gewo+ICAgCXsKPiAgIAkJLmNvbXBhdGlibGUgPSAic29waGdvLHNn
MjA0Mi1wd20iLAo+IC0JCS5kYXRhID0gJnNnMjA0Ml9jaGlwX2RhdGEKPiAtCX0sCj4gLQl7Cj4g
KwkJLmRhdGEgPSAmc2cyMDQyX2NoaXBfZGF0YSwKPiArCX0sIHsKPiAgIAkJLmNvbXBhdGlibGUg
PSAic29waGdvLHNnMjA0NC1wd20iLAo+IC0JCS5kYXRhID0gJnNnMjA0NF9jaGlwX2RhdGEKPiAr
CQkuZGF0YSA9ICZzZzIwNDRfY2hpcF9kYXRhLAo+ICAgCX0sCj4gICAJeyB9Cj4gICB9OwoKQ2hh
bmdlcyB0byBzb3BoZ28gcmVsYXRlZCBmaWxlc++8mgoKUmV2aWV3ZWQtYnk6IENoZW4gV2FuZyA8
Y2hlbi53YW5nQGxpbnV4LmRldj4KClRoYW5rcywKCkNoZW4KClsuLi4uLi5dCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
