Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4F9CA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 10:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyuxegFMOHwxGUjoP7rRSxjTeK4zmjC56rUcYcfZZUY=; b=MukMfG9iri9ulu
	UwQ2xYNDa8w1yihck6bDJ3sVS9leXwHXpkNSbhSNtremwDqZ26rPIG5/BLfX+iqdVUPInTkrOUbCi
	1+br268U2DZYLpPQFRwFoMLimtOIjGspvTAWvZy37EusV7Wd1y2AJ90evPkxVRuiZPVVhsfcJy52q
	8yNRqVebuI4KBUkZO8RAwDVGDxFfoDZoyoDicHh/1U+NeMV8R04uakfGJd/xB9EG/FOsSrdFT9eI1
	vioaHsYvacMAXnOm1x487HkZYddYOVd9p6y6GUvm9QKkk2mgeO2wJPY2AixOquy3jG1DNtHfcCTF/
	fCtlpU3r+9SjSHcy/oQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrAF-00000005eH1-2MRX;
	Wed, 30 Sep 2026 10:03:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrAA-00000005eFV-2E51;
	Wed, 30 Sep 2026 10:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sh5fC0CUc10hXDTzkPBdCZZkzPfnJFt3NuMWURsgHZU=; b=dQDZx7GNYaKjOyAprY0oq3+rhC
	/eRsMVCp7CHstO2amzfLwnWMpuZhOwZLV5zCzcz4BYLIiyI9kZ1yw0r9OgHEv+aIvi44sdtTirKwa
	OQzxVHJQX/qDklqrlWPmwXgnqqXLejnfAonFjc6ADre+i/BSBCvUdjrrSrOrH6Dl1fxjxFXnwhCso
	IPBJy26ZLjCtumpQqqejgo1MnBy4oKjXWyaJFjYC+jjpGjIJA0/q0xkiOVJoP0A2jPCkz/ZCOtkxz
	ncKW0RperYZyh/uHq/5ZVrtrNlVK174R8UiChq058TY1LetGeH75URGVPxm0LcveI87AsX1YnSDo2
	tHqzyTzg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Joshua Peisach <jpeisach@ubuntu.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH v5 08/21] drm/bridge: inno-hdmi: Split probe out of bind
Date: Wed, 30 Sep 2026 12:02:56 +0200
Message-ID: <6535891.44csPzL39Z@diego>
In-Reply-To: <20260929-jh7110-clean-send-v5-8-82b4d8e3c6c7@samsung.com>
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
 <CGME20260929103221eucas1p264107850882dde96fcda4772332d4f41@eucas1p2.samsung.com>
 <20260929-jh7110-clean-send-v5-8-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_030346_727240_3B49EACD 
X-CRM114-Status: GOOD (  29.28  )
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

QW0gRGllbnN0YWcsIDI5LiBTZXB0ZW1iZXIgMjAyNiwgMTI6MzE6MDUgTWl0dGVsZXVyb3DDpGlz
Y2hlIFNvbW1lcnplaXQgc2NocmllYiBNaWNoYWwgV2lsY3p5bnNraToKPiBpbm5vX2hkbWlfYmlu
ZCgpIGJvdGggc2V0cyB1cCB0aGUgYnJpZGdlIGFuZCBhdHRhY2hlcyBpdCB0byBhIERSTQo+IGVu
Y29kZXIuIEEgcGxhdGZvcm0gd2hvc2UgSERNSSBjb250cm9sbGVyIGlzIGEgY2hpbGQgb2YgYSBs
YXJnZXIgZGV2aWNlCj4gbmVlZHMgdGhlIGZpcnN0IGhhbGYgd2l0aG91dCB0aGUgc2Vjb25kLCBz
aW5jZSBpdCByZWdpc3RlcnMgYXMgaXRzIG93bgo+IHBsYXRmb3JtIGRyaXZlciBhbmQgbGV0cyB0
aGUgRFJNIGNvcmUgYmluZCB0aGUgYnJpZGdlIGxhdGVyLgo+IAo+IE1vdmUgdGhlIHNldHVwIGlu
dG8gYSBuZXcgZXhwb3J0ZWQgaW5ub19oZG1pX3Byb2JlKCksIGFuZCByZWR1Y2UKPiBpbm5vX2hk
bWlfYmluZCgpIHRvIGEgd3JhcHBlciBhcm91bmQgaXQuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UgaW50ZW5kZWQuCj4gCj4gUmV2aWV3ZWQtYnk6IEpvc2h1YSBQZWlzYWNoIDxqcGVpc2FjaEB1
YnVudHUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5z
a2lAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW5uby1oZG1p
LmMgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQo+ICBpbmNsdWRl
L2RybS9icmlkZ2UvaW5ub19oZG1pLmggICAgIHwgIDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDQ3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvaW5uby1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lu
bm8taGRtaS5jCj4gaW5kZXggZDdjMzNiOTJlMmRkZjRjZWQ4NGQxNzMwNDQ2M2Y0NGJlNTIyNzBi
OC4uN2E5ZjU0ZGNlMjY0N2YwMzIwZDc3NjI5YTI4MTU0ZWFkZTE0Mzg1ZiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm8taGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9pbm5vLWhkbWkuYwo+IEBAIC05MjksNyArOTI5LDE0IEBAIHN0YXRpYyBpcnFy
ZXR1cm5fdCBpbm5vX2hkbWlfaXJxKGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiAgewo+ICAJc3Ry
dWN0IGlubm9faGRtaSAqaGRtaSA9IGRldl9pZDsKPiAgCj4gLQlkcm1faGVscGVyX2hwZF9pcnFf
ZXZlbnQoaGRtaS0+YnJpZGdlLmRldik7Cj4gKwkvKgo+ICsJICogVGhlIGludGVycnVwdCBpcyBy
ZXF1ZXN0ZWQgaW4gcHJvYmUsIGJ1dCBicmlkZ2UuZGV2IGlzIG9ubHkgc2V0IG9uY2UKPiArCSAq
IHRoZSBEUk0gbWFzdGVyIGJpbmRzIGFuZCBhdHRhY2hlcyB0aGUgYnJpZGdlLCB3aGljaCBtYXkg
bmV2ZXIgaGFwcGVuLgo+ICsJICogRHJvcCBob3RwbHVnIGV2ZW50cyB0aGF0IGFycml2ZSBiZWZv
cmUgdGhlbiByYXRoZXIgdGhhbiBkZXJlZmVyZW5jZSBhCj4gKwkgKiBOVUxMIGRybV9kZXZpY2Uu
Cj4gKwkgKi8KPiArCWlmIChoZG1pLT5icmlkZ2UuZGV2KQo+ICsJCWRybV9oZWxwZXJfaHBkX2ly
cV9ldmVudChoZG1pLT5icmlkZ2UuZGV2KTsKClRoaXMgaXMgbm90IHBhcnQgb2YgdGhlIGNvbW1p
dCBkZXNjcmlwdGlvbiBhbmQgd2hpbGUgdHJ1ZSwgc2hvdWxkIGxpa2VseQpiZSBpdHMgb3duIHBh
dGNoIHdpdGggaXRzIG93biBkZXNjcmlwdGlvbi4KCgo+ICAKPiAgCXJldHVybiBJUlFfSEFORExF
RDsKPiAgfQo+IEBAIC0xMDYxLDExICsxMDY4LDI0IEBAIHN0YXRpYyBzdHJ1Y3QgaTJjX2FkYXB0
ZXIgKmlubm9faGRtaV9pMmNfYWRhcHRlcihzdHJ1Y3QgaW5ub19oZG1pICpoZG1pKQo+ICAJcmV0
dXJuIGFkYXA7Cj4gIH0KPiAgCj4gLXN0cnVjdCBpbm5vX2hkbWkgKmlubm9faGRtaV9iaW5kKHN0
cnVjdCBkZXZpY2UgKmRldiwKPiAtCQkJCSBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4g
LQkJCQkgY29uc3Qgc3RydWN0IGlubm9faGRtaV9wbGF0X2RhdGEgKnBsYXRfZGF0YSkKPiArLyoq
Cj4gKyAqIGlubm9faGRtaV9wcm9iZSAtIEludGVybmFsIGhlbHBlciB0byBwZXJmb3JtIGNvbW1v
biBzZXR1cAo+ICsgKiBAcGRldjogcGxhdGZvcm0gZGV2aWNlCj4gKyAqIEBwbGF0X2RhdGE6IFNv
Qy1zcGVjaWZpYyBwbGF0Zm9ybSBkYXRhCj4gKyAqCj4gKyAqIFRoaXMgZnVuY3Rpb24gaGFuZGxl
cyBhbGwgdGhlIGNvbW1vbiBoYXJkd2FyZSBzZXR1cDogYWxsb2NhdGluZyB0aGUgbWFpbgo+ICsg
KiBzdHJ1Y3QsIG1hcHBpbmcgcmVnaXN0ZXJzLCBnZXR0aW5nIGNsb2NrcywgaW5pdGlhbGl6aW5n
IHRoZSBoYXJkd2FyZSwKPiArICogc2V0dGluZyB1cCB0aGUgSVJRLCBhbmQgaW5pdGlhbGl6aW5n
IHRoZSBEREMgYWRhcHRlciBhbmQgYnJpZGdlIHN0cnVjdC4KPiArICogSXQgcmV0dXJucyBhIHBv
aW50ZXIgdG8gdGhlIGlubm9faGRtaSBzdHJ1Y3Qgb24gc3VjY2Vzcywgb3IgYW4gRVJSX1BUUgo+
ICsgKiBvbiBmYWlsdXJlLgo+ICsgKgo+ICsgKiBUaGlzIGZ1bmN0aW9uIGlzIHVzZWQgYnkgbW9k
ZXJuLCBkZWNvdXBsZWQgTUZEL2dsdWUgZHJpdmVycy4gSXQgcmVnaXN0ZXJzCj4gKyAqIHRoZSBi
cmlkZ2UgYnV0IGRvZXMgbm90IGF0dGFjaCBpdC4KPiArICovCj4gK3N0cnVjdCBpbm5vX2hkbWkg
Kmlubm9faGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICsJCQkJICBj
b25zdCBzdHJ1Y3QgaW5ub19oZG1pX3BsYXRfZGF0YSAqcGxhdF9kYXRhKQo+ICB7Cj4gLQlzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7Cj4gKwlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICAJc3RydWN0IGlubm9faGRtaSAqaGRt
aTsKPiAgCWludCBpcnE7Cj4gIAlpbnQgcmV0Owo+IEBAIC0xMTI4LDcgKzExNDgsMjQgQEAgc3Ry
dWN0IGlubm9faGRtaSAqaW5ub19oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LAo+ICAJaWYg
KHJldCkKPiAgCQlyZXR1cm4gRVJSX1BUUihyZXQpOwo+ICAKPiAtCXJldCA9IGRybV9icmlkZ2Vf
YXR0YWNoKGVuY29kZXIsICZoZG1pLT5icmlkZ2UsIE5VTEwsIERSTV9CUklER0VfQVRUQUNIX05P
X0NPTk5FQ1RPUik7Cj4gKwlyZXR1cm4gaGRtaTsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0dQTChp
bm5vX2hkbWlfcHJvYmUpOwo+ICsKPiArc3RydWN0IGlubm9faGRtaSAqaW5ub19oZG1pX2JpbmQo
c3RydWN0IGRldmljZSAqZGV2LAo+ICsJCQkJIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwK
PiArCQkJCSBjb25zdCBzdHJ1Y3QgaW5ub19oZG1pX3BsYXRfZGF0YSAqcGxhdF9kYXRhKQo+ICt7
Cj4gKwlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRl
dik7Cj4gKwlzdHJ1Y3QgaW5ub19oZG1pICpoZG1pOwo+ICsJaW50IHJldDsKPiArCj4gKwloZG1p
ID0gaW5ub19oZG1pX3Byb2JlKHBkZXYsIHBsYXRfZGF0YSk7Cj4gKwlpZiAoSVNfRVJSKGhkbWkp
KQo+ICsJCXJldHVybiBoZG1pOwo+ICsKPiArCXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGVuY29k
ZXIsICZoZG1pLT5icmlkZ2UsIE5VTEwsCj4gKwkJCQlEUk1fQlJJREdFX0FUVEFDSF9OT19DT05O
RUNUT1IpOwo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gRVJSX1BUUihyZXQpOwoKVGhpcyBjbHV0
dGVycyB1cCB0aGUgc3RydWN0dXJlIGV2ZW4gbW9yZSB0aGFuIGl0IGlzIHJpZ2h0IG5vdy4gRnJv
bSAiYmluZCIKYmFjayB0byAicHJvYmUiIGFuZCAiZGV2IiBiYWNrIHRvICJwZGV2IiBhbmQgY2Fs
bGluZyBhIGZ1bmN0aW9uIGNhbGxlZAoicHJvYmUiIGZyb20gdGhlIGJpbmQgY2FsbGJhY2suCgpZ
b3UgYXJlIHJpZ2h0LCB0aGF0IGFsbCB0aGUgcmVzb3VyY2UgYWxsb2NhdGlvbiBjYW4gKGFuZCBw
cm9iYWJseSBzaG91bGQpCmxpdmUgaW4gdGhlIGRyaXZlcnMgcHJvYmUtcGF0aCwgYnV0IHRoZW4g
cGxlYXNlIGNhbGwgdGhhdCBwcm9iZSBmdW5jdGlvbgpmcm9tIHRoZSBhY3R1YWwgcHJvYmUgcGF0
aC4KCkZvciBleGFtcGxlIHlvdSBjb3VsZCBsb29rIGF0IGhvdyBhbGwgdGhlIFN5bm9wc3lzIGJy
aWRnZXMgZG8gdGhhdC4KCgpUaGFua3MKSGVpa28KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
