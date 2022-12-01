Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4254FC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 01:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLKz8BbwnvMDf03OhNDKbvSBdHYrWOpeTzvBjv+0Yz0=; b=xyZaJo3YOLJDIr
	IpTfw/w+8ow67bxy7VDb0uLsInsI1Ozo2BBNe/ainWSdeMj4u6SqKtJ8DDFOJkoJjk8m8Ja/gx3mv
	wy+/7QRB8UVEKrSumicsDTffq+5JElY2mPbdLvck4PrcUTSIoscpp9EqEFWltvTzSTSzMXDIDVsDz
	00L+VjS+kdbmgITYVDr1/nCDu6gAULh3m0VhESATwDz0xhTRSK/vlOw/X96lN2wvMS5hZ0uZUQhx+
	DA+TS7imGRPGwCNlaU+NjVi0E226ZUDuXqx5MgeK2BAXgQEzCQK9m/nSRygGEX+9qE3whY/MDSIaQ
	2wysjf4aK5OuOQAgVhyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0YCv-003lM7-HM; Thu, 01 Dec 2022 01:17:45 +0000
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0YCp-003lJf-R1; Thu, 01 Dec 2022 01:17:42 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=57;SR=0;TI=SMTPD_---0VW5-8b9_1669857445;
Received: from 30.97.48.64(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VW5-8b9_1669857445)
          by smtp.aliyun-inc.com;
          Thu, 01 Dec 2022 09:17:29 +0800
Message-ID: <a7e61ce5-b5e6-384a-3c89-ebde63340678@linux.alibaba.com>
Date: Thu, 1 Dec 2022 09:17:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an error
 code
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Douglas Anderson <dianders@chromium.org>,
 Pavel Machek <pavel@ucw.cz>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Hammer Hsieh <hammerh0314@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sean Anderson <sean.anderson@seco.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, Satya Priya
 <quic_c_skakit@quicinc.com>, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_171740_087966_543CE07A 
X-CRM114-Status: GOOD (  11.76  )
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

CgpPbiAxMS8zMC8yMDIyIDExOjIxIFBNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNwcmQuYyBiL2RyaXZlcnMvcHdtL3B3bS1zcHJkLmMK
PiBpbmRleCA3MDA0ZjU1YmJmMTEuLmJkYThiYzVhZjk3NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3B3bS9wd20tc3ByZC5jCj4gKysrIGIvZHJpdmVycy9wd20vcHdtLXNwcmQuYwo+IEBAIC02NSw4
ICs2NSw4IEBAIHN0YXRpYyB2b2lkIHNwcmRfcHdtX3dyaXRlKHN0cnVjdCBzcHJkX3B3bV9jaGlw
ICpzcGMsIHUzMiBod2lkLAo+ICAgCXdyaXRlbF9yZWxheGVkKHZhbCwgc3BjLT5iYXNlICsgb2Zm
c2V0KTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgdm9pZCBzcHJkX3B3bV9nZXRfc3RhdGUoc3RydWN0
IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAo+IC0JCQkgICAgICAgc3Ry
dWN0IHB3bV9zdGF0ZSAqc3RhdGUpCj4gK3N0YXRpYyBpbnQgc3ByZF9wd21fZ2V0X3N0YXRlKHN0
cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiArCQkJICAgICAg
c3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpCj4gICB7Cj4gICAJc3RydWN0IHNwcmRfcHdtX2NoaXAg
KnNwYyA9Cj4gICAJCWNvbnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3Qgc3ByZF9wd21fY2hpcCwgY2hp
cCk7Cj4gQEAgLTgzLDcgKzgzLDcgQEAgc3RhdGljIHZvaWQgc3ByZF9wd21fZ2V0X3N0YXRlKHN0
cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiAgIAlpZiAocmV0
KSB7Cj4gICAJCWRldl9lcnIoc3BjLT5kZXYsICJmYWlsZWQgdG8gZW5hYmxlIHB3bSV1IGNsb2Nr
c1xuIiwKPiAgIAkJCXB3bS0+aHdwd20pOwo+IC0JCXJldHVybjsKPiArCQlyZXR1cm4gMDsKPiAg
IAl9Cj4gICAKPiAgIAl2YWwgPSBzcHJkX3B3bV9yZWFkKHNwYywgcHdtLT5od3B3bSwgU1BSRF9Q
V01fRU5BQkxFKTsKPiBAQCAtMTEzLDYgKzExMyw4IEBAIHN0YXRpYyB2b2lkIHNwcmRfcHdtX2dl
dF9zdGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4g
ICAJLyogRGlzYWJsZSBQV00gY2xvY2tzIGlmIHRoZSBQV00gY2hhbm5lbCBpcyBub3QgaW4gZW5h
YmxlIHN0YXRlLiAqLwo+ICAgCWlmICghc3RhdGUtPmVuYWJsZWQpCj4gICAJCWNsa19idWxrX2Rp
c2FibGVfdW5wcmVwYXJlKFNQUkRfUFdNX0NITl9DTEtTX05VTSwgY2huLT5jbGtzKTsKPiArCj4g
KwlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGludCBzcHJkX3B3bV9jb25maWcoc3Ry
dWN0IHNwcmRfcHdtX2NoaXAgKnNwYywgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKCkZvciBzcHJk
IHB3bSBwYXJ0czoKUmV2aWV3ZWQtYnk6IEJhb2xpbiBXYW5nIDxiYW9saW4ud2FuZ0BsaW51eC5h
bGliYWJhLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
