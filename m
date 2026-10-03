Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F47CA5FDD
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXh5D5/WS8suT9ONIJ6j9TG12lMFyEHPOIXJOWdtuSY=; b=JsfiuN6DnwloTn
	m45HQXemRbMbbdYUUNTYkoEd3LPt1IUezjHQdsDKo7gcbMpZpkS+d8arw3XxyDSEQhyXCHoOZu6vp
	9tay0sHePpnKGfG8UuguzQ/XCzym88qoRcnSHMX5MBceD58gXqfNxWFtL2N+2G/J32QN2d6NHFDZa
	i0NyNQ67CIqJANC4ov4mNj1jloY7CfTdxEfBPq5AWw513M5V39f5pmp+UEWoUs30YQQ9dCD1llSBJ
	HMHPbwWbc/taqxNtf4sj1swEEf92v3IH2ms5zq8yiCASvCLoQliZa2bIiFYocaJ9V3RLDyQxROak/
	V5yTxpYaJ7NNitXCyOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD2Sq-0000000DjxE-1z2X;
	Sat, 03 Oct 2026 16:19:56 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD2Sk-0000000DjwE-2leK;
	Sat, 03 Oct 2026 16:19:54 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261003161944euoutp015445fcbf6e0d4e3cb00b7533697c0e02~bEWDnwLC60335403354euoutp012;
	Sat,  3 Oct 2026 16:19:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261003161944euoutp015445fcbf6e0d4e3cb00b7533697c0e02~bEWDnwLC60335403354euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791044384;
	bh=1XaQcVeyhm8yfAFalkdFK1wk7N73U0zKdzj1RF8N3QE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=lsnwuG0Rt3fGmtfGSOO65rhkC0IFUgrq1ANqgsQGtVreBctftYXQpGMAZgPzf+Ci0
	 +kvHkS1AYixN1TDhKQn3VgurKD90DR9RBMHeFubIeyUtXTe1ckGdkeIPTPBfcYCdGk
	 P4JjhZ41OygKkWPJO9Q1IpC/ICJqCNGZ8gN2VJqo=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261003161943eucas1p2d4d85e066b9cedf34cbeaf481bf875db~bEWCnjmvZ2037620376eucas1p20;
	Sat,  3 Oct 2026 16:19:43 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261003161941eusmtip20b539371f409b63e666c140753664cb8~bEWBBnkRs2154121541eusmtip2G;
	Sat,  3 Oct 2026 16:19:41 +0000 (GMT)
Message-ID: <e1b83c15-1ca9-4575-97aa-f44552ecb182@samsung.com>
Date: Sat, 3 Oct 2026 18:19:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/21] drm/bridge: inno-hdmi: Split probe out of bind
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Vinod Koul
	<vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <6535891.44csPzL39Z@diego>
X-CMS-MailID: 20261003161943eucas1p2d4d85e066b9cedf34cbeaf481bf875db
X-Msg-Generator: CA
X-RootMTR: 20260929103221eucas1p264107850882dde96fcda4772332d4f41
X-EPHeader: CA
X-CMS-RootMailID: 20260929103221eucas1p264107850882dde96fcda4772332d4f41
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20260929103221eucas1p264107850882dde96fcda4772332d4f41@eucas1p2.samsung.com>
	<20260929-jh7110-clean-send-v5-8-82b4d8e3c6c7@samsung.com>
	<6535891.44csPzL39Z@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_091952_093650_E0D8EA83 
X-CRM114-Status: GOOD (  37.86  )
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

CgpPbiA5LzMwLzI2IDEyOjAyLCBIZWlrbyBTdMO8Ym5lciB3cm90ZToKPiBBbSBEaWVuc3RhZywg
MjkuIFNlcHRlbWJlciAyMDI2LCAxMjozMTowNSBNaXR0ZWxldXJvcMOkaXNjaGUgU29tbWVyemVp
dCBzY2hyaWViIE1pY2hhbCBXaWxjenluc2tpOgo+PiBpbm5vX2hkbWlfYmluZCgpIGJvdGggc2V0
cyB1cCB0aGUgYnJpZGdlIGFuZCBhdHRhY2hlcyBpdCB0byBhIERSTQo+PiBlbmNvZGVyLiBBIHBs
YXRmb3JtIHdob3NlIEhETUkgY29udHJvbGxlciBpcyBhIGNoaWxkIG9mIGEgbGFyZ2VyIGRldmlj
ZQo+PiBuZWVkcyB0aGUgZmlyc3QgaGFsZiB3aXRob3V0IHRoZSBzZWNvbmQsIHNpbmNlIGl0IHJl
Z2lzdGVycyBhcyBpdHMgb3duCj4+IHBsYXRmb3JtIGRyaXZlciBhbmQgbGV0cyB0aGUgRFJNIGNv
cmUgYmluZCB0aGUgYnJpZGdlIGxhdGVyLgo+Pgo+PiBNb3ZlIHRoZSBzZXR1cCBpbnRvIGEgbmV3
IGV4cG9ydGVkIGlubm9faGRtaV9wcm9iZSgpLCBhbmQgcmVkdWNlCj4+IGlubm9faGRtaV9iaW5k
KCkgdG8gYSB3cmFwcGVyIGFyb3VuZCBpdC4KPj4KPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50
ZW5kZWQuCj4+Cj4+IFJldmlld2VkLWJ5OiBKb3NodWEgUGVpc2FjaCA8anBlaXNhY2hAdWJ1bnR1
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBz
YW1zdW5nLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm8taGRtaS5j
IHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPj4gIGluY2x1ZGUv
ZHJtL2JyaWRnZS9pbm5vX2hkbWkuaCAgICAgfCAgNCArKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQs
IDQ3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm8taGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9p
bm5vLWhkbWkuYwo+PiBpbmRleCBkN2MzM2I5MmUyZGRmNGNlZDg0ZDE3MzA0NDYzZjQ0YmU1MjI3
MGI4Li43YTlmNTRkY2UyNjQ3ZjAzMjBkNzc2MjlhMjgxNTRlYWRlMTQzODVmIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm8taGRtaS5jCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvaW5uby1oZG1pLmMKPj4gQEAgLTkyOSw3ICs5MjksMTQgQEAgc3RhdGlj
IGlycXJldHVybl90IGlubm9faGRtaV9pcnEoaW50IGlycSwgdm9pZCAqZGV2X2lkKQo+PiAgewo+
PiAgCXN0cnVjdCBpbm5vX2hkbWkgKmhkbWkgPSBkZXZfaWQ7Cj4+ICAKPj4gLQlkcm1faGVscGVy
X2hwZF9pcnFfZXZlbnQoaGRtaS0+YnJpZGdlLmRldik7Cj4+ICsJLyoKPj4gKwkgKiBUaGUgaW50
ZXJydXB0IGlzIHJlcXVlc3RlZCBpbiBwcm9iZSwgYnV0IGJyaWRnZS5kZXYgaXMgb25seSBzZXQg
b25jZQo+PiArCSAqIHRoZSBEUk0gbWFzdGVyIGJpbmRzIGFuZCBhdHRhY2hlcyB0aGUgYnJpZGdl
LCB3aGljaCBtYXkgbmV2ZXIgaGFwcGVuLgo+PiArCSAqIERyb3AgaG90cGx1ZyBldmVudHMgdGhh
dCBhcnJpdmUgYmVmb3JlIHRoZW4gcmF0aGVyIHRoYW4gZGVyZWZlcmVuY2UgYQo+PiArCSAqIE5V
TEwgZHJtX2RldmljZS4KPj4gKwkgKi8KPj4gKwlpZiAoaGRtaS0+YnJpZGdlLmRldikKPj4gKwkJ
ZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KGhkbWktPmJyaWRnZS5kZXYpOwo+IAo+IFRoaXMgaXMg
bm90IHBhcnQgb2YgdGhlIGNvbW1pdCBkZXNjcmlwdGlvbiBhbmQgd2hpbGUgdHJ1ZSwgc2hvdWxk
IGxpa2VseQo+IGJlIGl0cyBvd24gcGF0Y2ggd2l0aCBpdHMgb3duIGRlc2NyaXB0aW9uLgoKCkl0
IG9ubHkgbWFkZSBzZW5zZSB3aXRoIHRoaXMgcGF0Y2gsIGhlbmNlIHdoeSBpdCdzIGluY2x1ZGVk
LiBIYXBweSB0bwpzcGxpdCBpdC4KCj4gCj4gCj4+ICAKPj4gIAlyZXR1cm4gSVJRX0hBTkRMRUQ7
Cj4+ICB9Cj4+IEBAIC0xMDYxLDExICsxMDY4LDI0IEBAIHN0YXRpYyBzdHJ1Y3QgaTJjX2FkYXB0
ZXIgKmlubm9faGRtaV9pMmNfYWRhcHRlcihzdHJ1Y3QgaW5ub19oZG1pICpoZG1pKQo+PiAgCXJl
dHVybiBhZGFwOwo+PiAgfQo+PiAgCj4+IC1zdHJ1Y3QgaW5ub19oZG1pICppbm5vX2hkbWlfYmlu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+IC0JCQkJIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rl
ciwKPj4gLQkJCQkgY29uc3Qgc3RydWN0IGlubm9faGRtaV9wbGF0X2RhdGEgKnBsYXRfZGF0YSkK
Pj4gKy8qKgo+PiArICogaW5ub19oZG1pX3Byb2JlIC0gSW50ZXJuYWwgaGVscGVyIHRvIHBlcmZv
cm0gY29tbW9uIHNldHVwCj4+ICsgKiBAcGRldjogcGxhdGZvcm0gZGV2aWNlCj4+ICsgKiBAcGxh
dF9kYXRhOiBTb0Mtc3BlY2lmaWMgcGxhdGZvcm0gZGF0YQo+PiArICoKPj4gKyAqIFRoaXMgZnVu
Y3Rpb24gaGFuZGxlcyBhbGwgdGhlIGNvbW1vbiBoYXJkd2FyZSBzZXR1cDogYWxsb2NhdGluZyB0
aGUgbWFpbgo+PiArICogc3RydWN0LCBtYXBwaW5nIHJlZ2lzdGVycywgZ2V0dGluZyBjbG9ja3Ms
IGluaXRpYWxpemluZyB0aGUgaGFyZHdhcmUsCj4+ICsgKiBzZXR0aW5nIHVwIHRoZSBJUlEsIGFu
ZCBpbml0aWFsaXppbmcgdGhlIEREQyBhZGFwdGVyIGFuZCBicmlkZ2Ugc3RydWN0Lgo+PiArICog
SXQgcmV0dXJucyBhIHBvaW50ZXIgdG8gdGhlIGlubm9faGRtaSBzdHJ1Y3Qgb24gc3VjY2Vzcywg
b3IgYW4gRVJSX1BUUgo+PiArICogb24gZmFpbHVyZS4KPj4gKyAqCj4+ICsgKiBUaGlzIGZ1bmN0
aW9uIGlzIHVzZWQgYnkgbW9kZXJuLCBkZWNvdXBsZWQgTUZEL2dsdWUgZHJpdmVycy4gSXQgcmVn
aXN0ZXJzCj4+ICsgKiB0aGUgYnJpZGdlIGJ1dCBkb2VzIG5vdCBhdHRhY2ggaXQuCj4+ICsgKi8K
Pj4gK3N0cnVjdCBpbm5vX2hkbWkgKmlubm9faGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2LAo+PiArCQkJCSAgY29uc3Qgc3RydWN0IGlubm9faGRtaV9wbGF0X2RhdGEgKnBs
YXRfZGF0YSkKPj4gIHsKPj4gLQlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxh
dGZvcm1fZGV2aWNlKGRldik7Cj4+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsK
Pj4gIAlzdHJ1Y3QgaW5ub19oZG1pICpoZG1pOwo+PiAgCWludCBpcnE7Cj4+ICAJaW50IHJldDsK
Pj4gQEAgLTExMjgsNyArMTE0OCwyNCBAQCBzdHJ1Y3QgaW5ub19oZG1pICppbm5vX2hkbWlfYmlu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+ICAJaWYgKHJldCkKPj4gIAkJcmV0dXJuIEVSUl9QVFIo
cmV0KTsKPj4gIAo+PiAtCXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGVuY29kZXIsICZoZG1pLT5i
cmlkZ2UsIE5VTEwsIERSTV9CUklER0VfQVRUQUNIX05PX0NPTk5FQ1RPUik7Cj4+ICsJcmV0dXJu
IGhkbWk7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MX0dQTChpbm5vX2hkbWlfcHJvYmUpOwo+PiAr
Cj4+ICtzdHJ1Y3QgaW5ub19oZG1pICppbm5vX2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYs
Cj4+ICsJCQkJIHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwKPj4gKwkJCQkgY29uc3Qgc3Ry
dWN0IGlubm9faGRtaV9wbGF0X2RhdGEgKnBsYXRfZGF0YSkKPj4gK3sKPj4gKwlzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2ID0gdG9fcGxhdGZvcm1fZGV2aWNlKGRldik7Cj4+ICsJc3RydWN0
IGlubm9faGRtaSAqaGRtaTsKPj4gKwlpbnQgcmV0Owo+PiArCj4+ICsJaGRtaSA9IGlubm9faGRt
aV9wcm9iZShwZGV2LCBwbGF0X2RhdGEpOwo+PiArCWlmIChJU19FUlIoaGRtaSkpCj4+ICsJCXJl
dHVybiBoZG1pOwo+PiArCj4+ICsJcmV0ID0gZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgJmhk
bWktPmJyaWRnZSwgTlVMTCwKPj4gKwkJCQlEUk1fQlJJREdFX0FUVEFDSF9OT19DT05ORUNUT1Ip
Owo+PiAgCWlmIChyZXQpCj4+ICAJCXJldHVybiBFUlJfUFRSKHJldCk7Cj4gCj4gVGhpcyBjbHV0
dGVycyB1cCB0aGUgc3RydWN0dXJlIGV2ZW4gbW9yZSB0aGFuIGl0IGlzIHJpZ2h0IG5vdy4gRnJv
bSAiYmluZCIKPiBiYWNrIHRvICJwcm9iZSIgYW5kICJkZXYiIGJhY2sgdG8gInBkZXYiIGFuZCBj
YWxsaW5nIGEgZnVuY3Rpb24gY2FsbGVkCj4gInByb2JlIiBmcm9tIHRoZSBiaW5kIGNhbGxiYWNr
Lgo+IAo+IFlvdSBhcmUgcmlnaHQsIHRoYXQgYWxsIHRoZSByZXNvdXJjZSBhbGxvY2F0aW9uIGNh
biAoYW5kIHByb2JhYmx5IHNob3VsZCkKPiBsaXZlIGluIHRoZSBkcml2ZXJzIHByb2JlLXBhdGgs
IGJ1dCB0aGVuIHBsZWFzZSBjYWxsIHRoYXQgcHJvYmUgZnVuY3Rpb24KPiBmcm9tIHRoZSBhY3R1
YWwgcHJvYmUgcGF0aC4KPiAKPiBGb3IgZXhhbXBsZSB5b3UgY291bGQgbG9vayBhdCBob3cgYWxs
IHRoZSBTeW5vcHN5cyBicmlkZ2VzIGRvIHRoYXQuCgpUaGF0IGlzIHdoYXQgdGhlIG5ldyBqaDcx
MTAgZHJpdmVyIGRvZXMgLSBpdCBpcyBhIHBsYWluIHBsYXRmb3JtIGRyaXZlcgphbmQgY2FsbHMg
aW5ub19oZG1pX3Byb2JlKCkgZnJvbSBpdHMgb3duIHByb2JlIG5vIGNvbXBvbmVudCBmcmFtZXdv
cmsuClNhbWUgc2hhcGUgYXMgdGgxNTIwLWR3LWhkbWkuYyB3aGljaCBjYWxscyBkd19oZG1pX3By
b2JlKCkgZnJvbSBpdHMKcGxhdGZvcm0gcHJvYmUgYW5kIG5ldmVyIGNhbGxzIGR3X2hkbWlfYmlu
ZCgpLgoKSSBrZXB0IGlubm9faGRtaV9iaW5kKCkgYXMgYSB3cmFwcGVyIG9uIHB1cnBvc2Ugc28g
dGhlIHJvY2tjaGlwIHByb2JlL2JpbmQKZmxvdyBzdGF5cyBleGFjdGx5IGFzIGl0IGlzIHRvZGF5
LiBJIGRvIG5vdCBoYXZlIGFueSByb2NrY2hpcCBoYXJkd2FyZSBhbmQKbW92aW5nIHJlc291cmNl
IGFjcXVpc2l0aW9uIG91dCBvZiBiaW5kIGFuZCBpbnRvIHByb2JlIHRoZXJlIGNoYW5nZXMgd2hl
biB0aGUKYnJpZGdlIGlzIGFkZGVkLCB3aGljaCBJIGRpZCBub3Qgd2FudCB0byBkbyBidWlsZCB0
ZXN0ZWQgb25seS4gZHctaGRtaSBrZWVwcwpkd19oZG1pX2JpbmQoKSBmb3IgdGhlIHNhbWUga2lu
ZCBvZiBjb25zdW1lciBzaW5jZSBkd19oZG1pLXJvY2tjaGlwLmMgaXMKc3RpbGwgY29tcG9uZW50
IGJhc2VkLgoKSSBhbSBoYXBweSB0byBjb252ZXJ0IGlubm9faGRtaS1yb2NrY2hpcC5jIHNvIHBy
b2JlIGFjcXVpcmVzIHRoZQpyZXNvdXJjZXMgYW5kIGJpbmQgb25seSBhdHRhY2hlcyAtIHRoYXQg
d291bGQgbGV0IGlubm9faGRtaV9iaW5kKCkgZ28KYXdheSBlbnRpcmVseSAtIGlmIHNvbWVvbmUg
d2l0aCByb2NrY2hpcCBoYXJkd2FyZSBjYW4gdGVzdCBpdC4gT3RoZXJ3aXNlCkkgd291bGQgcmF0
aGVyIHNlbmQgaXQgc2VwYXJhdGVseSB3aGVyZSBpdCBjYW4gZ2V0IHByb3BlciB0ZXN0aW5nLCBh
cwp0aGlzIHNlcmllcyBpcyBhdCAyMSBwYXRjaGVzIGFscmVhZHkuCgpZb3UgYXJlIHJpZ2h0IGFi
b3V0IHBkZXYgLSBpbm5vX2hkbWlfYmluZCgpIHdpbGwgdGFrZSBhIHBsYXRmb3JtX2RldmljZSBs
aWtlCmR3X2hkbWlfYmluZCgpIGRvZXMgc28gdGhlIHRvX3BsYXRmb3JtX2RldmljZSgpIGdvZXMg
YXdheS4KCj4gCj4gCj4gVGhhbmtzCj4gSGVpa28KPiAKPiAKPiAKCkJlc3QgcmVnYXJkcywKLS0g
Ck1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
