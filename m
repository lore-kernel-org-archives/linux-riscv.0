Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDF2606A31F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 18:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gft0PAaQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=jCwZPf+Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pAJdbSqr/nCCj8FNVds8UqplXfskoXOn4pbJ1KTLXlo=; b=Gft0PAaQKHlA9XC32UEtspc0u1
	anfSzXTt+Wrq2LmwyhOB+7waRApq41ACrHBv1k9vpDIIPeotq/OlWzlF4qFsHbEUnCk18ONjWzGZV
	fk/70IM9PWRGwvrOtQuMwJPG2ylmyatTCjZcqTM8lKtGGh6pbe1JoI1PXJRumrzB2GEA9imqYA24M
	cM0ZpQCTRB6UYiNGWbGgdqOtELZrc19hJi0bS88U9X3qS1i2no8Gu8seFT+x85MwXcGwrjmxSqLhU
	7O0c0fyZD6A3YYIQHSCIlLBv1vKu4hiVI6YnBUood+18VlfetPpjHuAjhvAgrUSVUJZVOnlwIXSOr
	u0FlgFXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqvV-0000000CLPV-0Mkx;
	Fri, 30 Oct 2026 18:02:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqvR-0000000CLOB-0llM;
	Fri, 30 Oct 2026 18:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9gfQkCnTfkug6p4HXHCVXaX3Q+suBlhnBegGYXjv1IY=; b=jCwZPf+YIAUctffkKF7pw1WOTQ
	CqyoI3bprXm02g6eVWMZAP2o9CQVig+ZDJuoNwBP1DxIkVbxMu2P/p4tXuxMKYc4Ct92k59PUjQcu
	p9M0fxe+NKOPyBTiu4qZ2BMXCD5QeYqAOL4k5RyLDO01SzgGowPpWRasZrVz0wa/3JwDJ69OQ5HjO
	4UM6+54lKVKYP6PTNYFyIhj0lDGZ7WeJFcJ+JWU2yRWfB/ufDvxDvH0vcmrgyj7hjhi7+KK0AishG
	9nt0DMnXu14dtZMGcnL5n4WhtagwmsKlCTgUsCSliSuChpiCIPJYQEQsCDmoc4yHiNsX+FkeeXrRO
	6c6ajRIw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dominique Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Yakir Yang <kuankuan.y@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Conor Dooley <conor@kernel.org>, William Qiu <william.qiu@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Sandy Huang <hjc@rock-chips.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Joshua Peisach <jpeisach@ubuntu.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Byron Stanoszek <gandalf@winds.org>, OOHehir <oo.hehir@gmail.com>
Subject: Re: [PATCH v6 09/18] drm/bridge: inno-hdmi: Allow the register map to come
 from a parent
Date: Fri, 30 Oct 2026 19:01:08 +0100
Message-ID: <3194397.687JKscXgg@phil>
In-Reply-To: <20261029-jh7110-clean-send-v6-9-759594e43acf@samsung.com>
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
 <CGME20261029075407eucas1p1c9b0d887cafa4c3c10bb34fa3ef3c4b7@eucas1p1.samsung.com>
 <20261029-jh7110-clean-send-v6-9-759594e43acf@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_110201_230905_817BE213 
X-CRM114-Status: GOOD (  23.76  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QW0gRG9ubmVyc3RhZywgMjkuIE9rdG9iZXIgMjAyNiwgMDg6NTM6NDMgTWl0dGVsZXVyb3DDpGlz
Y2hlIE5vcm1hbHplaXQgc2NocmllYiBNaWNoYWwgV2lsY3p5bnNraToKPiBPbiBzb21lIFNvQ3Mg
dGhlIEhETUkgY29udHJvbGxlciBkb2VzIG5vdCBvd24gaXRzIHJlZ2lzdGVyIHdpbmRvdy4gVGhl
Cj4gU3RhckZpdmUgSkg3MTEwIGRvY3VtZW50cyBvbmUgNjQgS0IgYmxvY2ssIHUwX2hkbWl0eCwg
dGhhdCBob2xkcyBib3RoCj4gdGhlIGNvbnRyb2xsZXIgYW5kIHRoZSBQSFksIHNvIHRoZSBwYXJl
bnQgZGV2aWNlIG1hcHMgaXQgYW5kIG93bnMgdGhlCj4gcmVnbWFwIHdoaWxlIHRoZSB0d28gY2hp
bGRyZW4gc2hhcmUgaXQuCj4gCj4gVXNlIGEgcmVnbWFwIHN1cHBsaWVkIGJ5IHRoZSBwYXJlbnQg
ZGV2aWNlIHdoZW4gdGhlcmUgaXMgb25lLCBhbmQga2VlcAo+IG1hcHBpbmcgb3VyIG93biByZXNv
dXJjZSB3aGVuIHRoZXJlIGlzIG5vdCwgc28gcGxhdGZvcm1zIHRoYXQgb3duIHRoZWlyCj4gcmVn
aXN0ZXIgd2luZG93IGFyZSB1bmFmZmVjdGVkLgo+IAo+IFJldmlld2VkLWJ5OiBKb3NodWEgUGVp
c2FjaCA8anBlaXNhY2hAdWJ1bnR1LmNvbT4KPiBUZXN0ZWQtYnk6IEJ5cm9uIFN0YW5vc3playA8
Z2FuZGFsZkB3aW5kcy5vcmc+Cj4gVGVzdGVkLWJ5OiBPT0hlaGlyIDxvby5oZWhpckBnbWFpbC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1z
dW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vLWhkbWkuYyB8IDMx
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI4IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvaW5uby1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm8taGRt
aS5jCj4gaW5kZXggMjIyZjY1MjI4NDRlZTYwYWU5YTA3YWIyZGNjYTc0OGRiZjc0MDNlNC4uYTg5
MDViZjYyN2EyMjRkN2UzOTE4NTE0MTk1ZjE4MTAxNjRkYzI2ZiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm8taGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9pbm5vLWhkbWkuYwo+IEBAIC0zOTcsNiArMzk3LDcgQEAgc3RydWN0IGlubm9faGRtaSB7
Cj4gIAlzdHJ1Y3QgY2xrICpwY2xrOwo+ICAJc3RydWN0IGNsayAqcmVmY2xrOwo+ICAJdm9pZCBf
X2lvbWVtICpyZWdzOwo+ICsJc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ICAJc3RydWN0IHJlZ21h
cCAqZ3JmOwo+ICAKPiAgCXN0cnVjdCBpbm5vX2hkbWlfaTJjICppMmM7Cj4gQEAgLTQ3MCwxMSAr
NDcxLDI1IEBAIHN0YXRpYyBpbnQgaW5ub19oZG1pX2ZpbmRfcGh5X2NvbmZpZyhzdHJ1Y3QgaW5u
b19oZG1pICpoZG1pLAo+ICAKPiAgc3RhdGljIGlubGluZSB1OCBoZG1pX3JlYWRiKHN0cnVjdCBp
bm5vX2hkbWkgKmhkbWksIHUxNiBvZmZzZXQpCj4gIHsKPiArCXUzMiB2YWw7Cj4gKwo+ICsJaWYg
KGhkbWktPnJlZ21hcCkgewo+ICsJCWlmIChyZWdtYXBfcmVhZChoZG1pLT5yZWdtYXAsIG9mZnNl
dCAqIDQsICZ2YWwpKQo+ICsJCQlyZXR1cm4gMDsKPiArCj4gKwkJcmV0dXJuIHZhbDsKPiArCX0K
PiArCj4gIAlyZXR1cm4gcmVhZGxfcmVsYXhlZChoZG1pLT5yZWdzICsgKG9mZnNldCkgKiAweDA0
KTsKPiAgfQo+ICAKPiAgc3RhdGljIGlubGluZSB2b2lkIGhkbWlfd3JpdGViKHN0cnVjdCBpbm5v
X2hkbWkgKmhkbWksIHUxNiBvZmZzZXQsIHUzMiB2YWwpCj4gIHsKPiArCWlmIChoZG1pLT5yZWdt
YXApIHsKPiArCQlyZWdtYXBfd3JpdGUoaGRtaS0+cmVnbWFwLCBvZmZzZXQgKiA0LCB2YWwpOwo+
ICsJCXJldHVybjsKPiArCX0KPiArCj4gIAl3cml0ZWxfcmVsYXhlZCh2YWwsIGhkbWktPnJlZ3Mg
KyAob2Zmc2V0KSAqIDB4MDQpOwo+ICB9Cj4gIAo+IEBAIC0xMTAxLDkgKzExMTYsMTkgQEAgc3Ry
dWN0IGlubm9faGRtaSAqaW5ub19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYsCj4gIAloZG1pLT5kZXYgPSBkZXY7Cj4gIAloZG1pLT5wbGF0X2RhdGEgPSBwbGF0X2RhdGE7
Cj4gIAo+IC0JaGRtaS0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2
LCAwKTsKPiAtCWlmIChJU19FUlIoaGRtaS0+cmVncykpCj4gLQkJcmV0dXJuIEVSUl9DQVNUKGhk
bWktPnJlZ3MpOwo+ICsJLyoKPiArCSAqIE9uIHBsYXRmb3JtcyB3aGVyZSB0aGUgY29udHJvbGxl
ciBzaGFyZXMgYSByZWdpc3RlciBzcGFjZSB3aXRoCj4gKwkgKiBvdGhlciBibG9ja3MsIHRoZSBw
YXJlbnQgb3ducyB0aGUgcmVnbWFwLiBGYWxsIGJhY2sgdG8gbWFwcGluZwo+ICsJICogb3VyIG93
biByZXNvdXJjZSB3aGVyZSBpdCBkb2VzIG5vdC4KPiArCSAqLwo+ICsJaWYgKGRldi0+cGFyZW50
KQo+ICsJCWhkbWktPnJlZ21hcCA9IGRldl9nZXRfcmVnbWFwKGRldi0+cGFyZW50LCBOVUxMKTsK
PiArCj4gKwlpZiAoIWhkbWktPnJlZ21hcCkgewo+ICsJCWhkbWktPnJlZ3MgPSBkZXZtX3BsYXRm
b3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7Cj4gKwkJaWYgKElTX0VSUihoZG1pLT5yZWdz
KSkKPiArCQkJcmV0dXJuIEVSUl9DQVNUKGhkbWktPnJlZ3MpOwo+ICsJfQoKd2h5IGNhbid0IHlv
dSBqdXN0IGFsc28gdXNlIGEgbW1pbyByZWdtYXAgaGVyZT8gQmVjYXVzZSB3aXRoIHRoaXMgY2hh
bmdlCnRoZSBkcml2ZXIgbm93IGhhcyAyIGNvbXBldGluZyByZWdpc3RlciBpbnRlcmZhY2VzIGFu
ZCB5b3UgbmVlZCB0aG9zZQpjb25kaXRpb25hbHMgYWxsIHRoZSB0aW1lLgoKSnVzdCBjb252ZXJ0
IHRoZSBleGlzdGluZyB1c2VyIHRvIGFsc28gdXNlIGEgcmVnbWFwIHBsZWFzZS4KCgpIZWlrbwoK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
