Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3D5C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 10:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTUd7dQB7wamsobIcV3LNCOmCzXfsuk6/qJb/YoHIIg=; b=sAjmHZ4toAdcHP
	IoM2rBzXUf3c4UXk5of1TCPbmDoXi3HKu4Svoyp8AauN/ZO8pPJZeeDRnnslpOK10udsJXVv/O2WN
	k9rbDQOpMEtmwZCqKAyU7I8WK7Q2dsffg3TjvZ8bxlZqPArmRn976+bXFff2Na8Z6ubpphfUdXJzh
	fHa00AUstIlKU2VsA5zcHa2FWoaUzUQmPsqICxJLtYL6LVPcly1hY+Rwn+qztFghvWmAfVS7VuAqI
	ugyIdm8q2q5MubqdiHe/A9sBXSZUpPEqlQWmO9rLMrLa1yTKApbE0QnenW7NYFkq8UeNp5mrqxw87
	Nf7aZyhE5iO9uFMq1/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gin-006gBG-HD; Thu, 01 Dec 2022 10:23:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0gih-006g6F-2d; Thu, 01 Dec 2022 10:23:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 175C1D6E;
	Thu,  1 Dec 2022 02:23:09 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4DF93F67D;
	Thu,  1 Dec 2022 02:22:55 -0800 (PST)
Date: Thu, 1 Dec 2022 10:22:52 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Conor Dooley
 <conor.dooley@microchip.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Douglas Anderson
 <dianders@chromium.org>, Pavel Machek <pavel@ucw.cz>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Samuel
 Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson
 <sean.anderson@seco.com>, Michal Simek <michal.simek@xilinx.com>, Bjorn
 Andersson <andersson@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, Satya Priya
 <quic_c_skakit@quicinc.com>, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an
 error code
Message-ID: <20221201102252.52ace284@donnerap.cambridge.arm.com>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
	<20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_022307_257666_4BD03F7D 
X-CRM114-Status: GOOD (  25.50  )
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

T24gV2VkLCAzMCBOb3YgMjAyMiAxNjoyMTozOCArMDEwMApVd2UgS2xlaW5lLUvDtm5pZyA8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKCkhpLAoKPiAuZ2V0X3N0YXRlKCkg
bWlnaHQgZmFpbCBpbiBzb21lIGNhc2VzLiBUbyBtYWtlIGl0IHBvc3NpYmxlIHRoYXQgYSBkcml2
ZXIKPiBzaWduYWxzIHN1Y2ggYSBmYWlsdXJlIGNoYW5nZSB0aGUgcHJvdG90eXBlIG9mIC5nZXRf
c3RhdGUoKSB0byByZXR1cm4gYW4KPiBlcnJvciBjb2RlLgo+IAo+IFRoaXMgcGF0Y2ggd2FzIGNy
ZWF0ZWQgdXNpbmcgY29jY2luZWxsZSBhbmQgdGhlIGZvbGxvd2luZyBzZW1hbnRpYyBwYXRjaDoK
PiAKPiBAcDFACj4gaWRlbnRpZmllciBnZXRzdGF0ZWZ1bmM7Cj4gaWRlbnRpZmllciBkcml2ZXI7
Cj4gQEAKPiAgc3RydWN0IHB3bV9vcHMgZHJpdmVyID0gewo+ICAgICAgICAgLi4uLAo+ICAgICAg
ICAgLmdldF9zdGF0ZSA9IGdldHN0YXRlZnVuYwo+ICAgICAgICAgLC4uLgo+ICB9Owo+IAo+IEBw
MkAKPiBpZGVudGlmaWVyIHAxLmdldHN0YXRlZnVuYzsKPiBpZGVudGlmaWVyIGNoaXAsIHB3bSwg
c3RhdGU7Cj4gQEAKPiAtdm9pZAo+ICtpbnQKPiAgZ2V0c3RhdGVmdW5jKHN0cnVjdCBwd21fY2hp
cCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUp
Cj4gIHsKPiAgICAuLi4KPiAtICByZXR1cm47Cj4gKyAgcmV0dXJuIDA7Cj4gICAgLi4uCj4gIH0K
PiAKPiBwbHVzIHRoZSBhY3R1YWwgY2hhbmdlIG9mIHRoZSBwcm90b3R5cGUgaW4gaW5jbHVkZS9s
aW51eC9wd20uaCAocGx1cyBzb21lCj4gbWFudWFsIGZpeGluZyBvZiBpbmRlbnRpb25zIGFuZCBl
bXB0eSBsaW5lcykuCj4gCj4gU28gZm9yIG5vdyBhbGwgZHJpdmVycyByZXR1cm4gc3VjY2VzcyB1
bmNvbmRpdGlvbmFsbHkuIFRoZXkgYXJlIGFkYXB0ZWQKPiBpbiB0aGUgZm9sbG93aW5nIHBhdGNo
ZXMgdG8gbWFrZSB0aGUgY2hhbmdlcyBlYXNpZXIgcmV2aWV3YWJsZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+
IC0tLQo+ICBkcml2ZXJzL2dwaW8vZ3Bpby1tdmVidS5jICAgICAgICAgICAgIHwgIDkgKysrKysr
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCAxNCArKysrKysr
Ky0tLS0tLQo+ICBkcml2ZXJzL2xlZHMvcmdiL2xlZHMtcWNvbS1scGcuYyAgICAgIHwgMTQgKysr
KysrKystLS0tLS0KPiAgZHJpdmVycy9wd20vcHdtLWF0bWVsLmMgICAgICAgICAgICAgICB8ICA2
ICsrKystLQo+ICBkcml2ZXJzL3B3bS9wd20tYmNtLWlwcm9jLmMgICAgICAgICAgIHwgIDggKysr
KystLS0KPiAgZHJpdmVycy9wd20vcHdtLWNyYy5jICAgICAgICAgICAgICAgICB8IDEwICsrKysr
Ky0tLS0KPiAgZHJpdmVycy9wd20vcHdtLWNyb3MtZWMuYyAgICAgICAgICAgICB8ICA4ICsrKysr
LS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1kd2MuYyAgICAgICAgICAgICAgICAgfCAgNiArKysrLS0K
PiAgZHJpdmVycy9wd20vcHdtLWhpYnZ0LmMgICAgICAgICAgICAgICB8ICA2ICsrKystLQo+ICBk
cml2ZXJzL3B3bS9wd20taW14LXRwbS5jICAgICAgICAgICAgIHwgIDggKysrKystLS0KPiAgZHJp
dmVycy9wd20vcHdtLWlteDI3LmMgICAgICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gIGRyaXZl
cnMvcHdtL3B3bS1pbnRlbC1sZ20uYyAgICAgICAgICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9w
d20vcHdtLWlxczYyMGEuYyAgICAgICAgICAgICB8ICA2ICsrKystLQo+ICBkcml2ZXJzL3B3bS9w
d20ta2VlbWJheS5jICAgICAgICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvcHdtL3B3bS1s
cHNzLmMgICAgICAgICAgICAgICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9wd20vcHdtLW1lc29u
LmMgICAgICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1tdGstZGlz
cC5jICAgICAgICAgICAgfCAxMiArKysrKysrLS0tLS0KPiAgZHJpdmVycy9wd20vcHdtLXBjYTk2
ODUuYyAgICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1yYXNwYmVy
cnlwaS1wb2UuYyAgICAgfCAgOCArKysrKy0tLQo+ICBkcml2ZXJzL3B3bS9wd20tcm9ja2NoaXAu
YyAgICAgICAgICAgIHwgMTIgKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUu
YyAgICAgICAgICAgICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9wd20vcHdtLXNsMjhjcGxkLmMg
ICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1zcHJkLmMgICAgICAg
ICAgICAgICAgfCAgOCArKysrKy0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYyAgICAg
ICAgICAgIHwgIDggKysrKystLS0KPiAgZHJpdmVycy9wd20vcHdtLXN1bjRpLmMgICAgICAgICAg
ICAgICB8IDEyICsrKysrKystLS0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc3VucGx1cy5jICAgICAg
ICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvcHdtL3B3bS12aXNjb250aS5jICAgICAgICAg
ICAgfCAgNiArKysrLS0KPiAgZHJpdmVycy9wd20vcHdtLXhpbGlueC5jICAgICAgICAgICAgICB8
ICA4ICsrKysrLS0tCj4gIGluY2x1ZGUvbGludXgvcHdtLmggICAgICAgICAgICAgICAgICAgfCAg
NCArKy0tCj4gIDI5IGZpbGVzIGNoYW5nZWQsIDE0NiBpbnNlcnRpb25zKCspLCA4OSBkZWxldGlv
bnMoLSkKPiAKClsgLi4uIF0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN1bjRpLmMg
Yi9kcml2ZXJzL3B3bS9wd20tc3VuNGkuYwo+IGluZGV4IGM4NDQ1YjBhMzMzOS4uMzdkNzVlMjUy
ZDRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdW40aS5jCj4gKysrIGIvZHJpdmVy
cy9wd20vcHdtLXN1bjRpLmMKPiBAQCAtMTA4LDkgKzEwOCw5IEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBzdW40aV9wd21fd3JpdGVsKHN0cnVjdCBzdW40aV9wd21fY2hpcCAqY2hpcCwKPiAgCXdyaXRl
bCh2YWwsIGNoaXAtPmJhc2UgKyBvZmZzZXQpOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCBzdW40
aV9wd21fZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwKPiAtCQkJCXN0cnVjdCBwd21f
ZGV2aWNlICpwd20sCj4gLQkJCQlzdHJ1Y3QgcHdtX3N0YXRlICpzdGF0ZSkKPiArc3RhdGljIGlu
dCBzdW40aV9wd21fZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwKPiArCQkJICAgICAg
IHN0cnVjdCBwd21fZGV2aWNlICpwd20sCj4gKwkJCSAgICAgICBzdHJ1Y3QgcHdtX3N0YXRlICpz
dGF0ZSkKPiAgewo+ICAJc3RydWN0IHN1bjRpX3B3bV9jaGlwICpzdW40aV9wd20gPSB0b19zdW40
aV9wd21fY2hpcChjaGlwKTsKPiAgCXU2NCBjbGtfcmF0ZSwgdG1wOwo+IEBAIC0xMzIsNyArMTMy
LDcgQEAgc3RhdGljIHZvaWQgc3VuNGlfcHdtX2dldF9zdGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNo
aXAsCj4gIAkJc3RhdGUtPmR1dHlfY3ljbGUgPSBESVZfUk9VTkRfVVBfVUxMKHN0YXRlLT5wZXJp
b2QsIDIpOwo+ICAJCXN0YXRlLT5wb2xhcml0eSA9IFBXTV9QT0xBUklUWV9OT1JNQUw7Cj4gIAkJ
c3RhdGUtPmVuYWJsZWQgPSB0cnVlOwo+IC0JCXJldHVybjsKPiArCQlyZXR1cm4gMDsKPiAgCX0K
PiAgCj4gIAlpZiAoKFBXTV9SRUdfUFJFU0NBTCh2YWwsIHB3bS0+aHdwd20pID09IFBXTV9QUkVT
Q0FMX01BU0spICYmCj4gQEAgLTE0Miw3ICsxNDIsNyBAQCBzdGF0aWMgdm9pZCBzdW40aV9wd21f
Z2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwKPiAgCQlwcmVzY2FsZXIgPSBwcmVzY2Fs
ZXJfdGFibGVbUFdNX1JFR19QUkVTQ0FMKHZhbCwgcHdtLT5od3B3bSldOwo+ICAKPiAgCWlmIChw
cmVzY2FsZXIgPT0gMCkKPiAtCQlyZXR1cm47Cj4gKwkJcmV0dXJuIDA7Cj4gIAo+ICAJaWYgKHZh
bCAmIEJJVF9DSChQV01fQUNUX1NUQVRFLCBwd20tPmh3cHdtKSkKPiAgCQlzdGF0ZS0+cG9sYXJp
dHkgPSBQV01fUE9MQVJJVFlfTk9STUFMOwo+IEBAIC0xNjIsNiArMTYyLDggQEAgc3RhdGljIHZv
aWQgc3VuNGlfcHdtX2dldF9zdGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsCj4gIAo+ICAJdG1w
ID0gKHU2NClwcmVzY2FsZXIgKiBOU0VDX1BFUl9TRUMgKiBQV01fUkVHX1BSRCh2YWwpOwo+ICAJ
c3RhdGUtPnBlcmlvZCA9IERJVl9ST1VORF9DTE9TRVNUX1VMTCh0bXAsIGNsa19yYXRlKTsKPiAr
Cj4gKwlyZXR1cm4gMDsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBzdW40aV9wd21fY2FsY3VsYXRl
KHN0cnVjdCBzdW40aV9wd21fY2hpcCAqc3VuNGlfcHdtLAoKRm9yIHN1bnhpOgoKUmV2aWV3ZWQt
Ynk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPgoKSnVzdCBvbmUgY29t
bWVudDogSSBkb24ndCBzZWUgYSBzdW54aSBzcGVjaWZpYyBwYXRjaCBsYXRlciBpbiB0aGUgc2Vy
aWVzLAp0aG91Z2ggaXQgc2VlbXMgd2UgaGF2ZSBhdCBsZWFzdCBvbmUgZXJyb3IgZXJyb3IgZXhp
dCAoc2VlIHByZXNjYWxlciA9PSAwCmFib3ZlKS4gUGx1cyBwb3RlbnRpYWxseSBhbm90aGVyIGV4
aXQgaWYgY2xrX2dldF9yYXRlKCkgKGF0IHRoZSB2ZXJ5CmJlZ2lubmluZykgZmFpbHMuClNoYWxs
IEkgc2VuZCBhIHBhdGNoIGZvciB0aGF0PwoKQ2hlZXJzLApBbmRyZS4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
