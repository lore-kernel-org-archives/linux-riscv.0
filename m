Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F0D606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 17:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WTsXgihb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=McnVzDrA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CvyrDbN6aQmQKzvvFlxfv7DnEXUehpLO+f3EOo0JZSs=; b=WTsXgihbNO3jbn0esK69iQayOw
	HUutSkzUQC2nqdMaAYknMbs/M3nuYbUT+M+l7aNirmoWQx1bWFaeBIuV4lwF9cUXGElFjfb7dIpUd
	4fYThoOtv8JhpuN2GmZkQkt7mgH/lZnRPvGuSGg7QA1AhbR/KZAW8hMCUcLAijHXPkYh2Y5xe7XKP
	q/haCWb3TmbHHw7imMVkifvgG75c51GGaF+oLcqAVIVbFQXpkleN0b+BwcNnnhdHji2yvxcXHNFNj
	ED2ebyFBihBsPl3MN9vaUYuz4VRdZsrkwUlDaJ98PLF4C3Oh2JTTBCJWw4kmF/O/CUOqqPvv4l28h
	eWbN6z6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqf2-0000000CGsJ-3GGy;
	Fri, 30 Oct 2026 17:45:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqez-0000000CGql-39kT;
	Fri, 30 Oct 2026 17:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=6g5elUdeGVozBVRB/uIpu9t+eT/QLwJb6+mCEOi3sU0=; b=McnVzDrABheU2AO7yOCTA46Wnj
	OQAwr+mr7ut6IbkprUPAK3ZO73I8BNz6LgFRR0aLlWHWPdUxhqs+MyYI9QPusA0ppO9RpQAMByt+5
	kyQi4QZP4qr+kz0nBCHCewJpFTEI6sDQeU3G5eEMsnuLEJk7VMmGugR6rq8fGrfIfJ9B3oBmvF6eP
	zELkXz7C+gAmcKlmoUwpzrhgc3kqCPOPrd9WUA4jiFVAN+rZtcCsCMBRn7kzFI1SitdZDm4XVeYaz
	1U/XNHSlGHiXrIKUKIzzBzY7SNDRlbZHnKrkm6fsARi4ILdgUjZcpjAMO3zBbK/YAQAl2gCTDFylv
	RgxT8d+w==;
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
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v6 02/18] drm/bridge: inno-hdmi: Don't dereference a NULL
 drm_device on hotplug
Date: Fri, 30 Oct 2026 18:44:24 +0100
Message-ID: <2261991.3Lj2Plt8kZ@phil>
In-Reply-To: <1844578.vCJZsxu672@phil>
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
 <20261029-jh7110-clean-send-v6-2-759594e43acf@samsung.com>
 <1844578.vCJZsxu672@phil>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_104501_802253_C6D75D58 
X-CRM114-Status: GOOD (  24.81  )
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

QW0gRnJlaXRhZywgMzAuIE9rdG9iZXIgMjAyNiwgMTg6NDM6NDcgTWl0dGVsZXVyb3DDpGlzY2hl
IE5vcm1hbHplaXQgc2NocmllYiBIZWlrbyBTdHVlYm5lcjoKPiBBbSBEb25uZXJzdGFnLCAyOS4g
T2t0b2JlciAyMDI2LCAwODo1MzozNiBNaXR0ZWxldXJvcMOkaXNjaGUgTm9ybWFsemVpdCBzY2hy
aWViIE1pY2hhbCBXaWxjenluc2tpOgo+ID4gaW5ub19oZG1pX2lycSgpIHBhc3NlcyBoZG1pLT5i
cmlkZ2UuZGV2IHRvIGRybV9oZWxwZXJfaHBkX2lycV9ldmVudCgpLAo+ID4gd2hpY2ggZGVyZWZl
cmVuY2VzIGl0IGluIGl0cyBmaXJzdCBzdGF0ZW1lbnQ6Cj4gPiAKPiA+IAlpZiAoIWRldi0+bW9k
ZV9jb25maWcucG9sbF9lbmFibGVkKQo+ID4gCj4gPiBicmlkZ2UuZGV2IGlzIGFzc2lnbmVkIG9u
bHkgYnkgZHJtX2JyaWRnZV9hdHRhY2goKSwgYnV0IGlubm9faGRtaV9iaW5kKCkKPiA+IHVubXV0
ZXMgdGhlIGhvdHBsdWcgaW50ZXJydXB0IGluIGlubm9faGRtaV9pbml0X2h3KCkgYW5kIGluc3Rh
bGxzIHRoZQo+ID4gaGFuZGxlciB3ZWxsIGJlZm9yZSBpdCBhdHRhY2hlcyB0aGUgYnJpZGdlOgo+
ID4gCj4gPiAJaW5ub19oZG1pX2luaXRfaHcoaGRtaSk7CQkvKiB1bm11dGVzIGhvdHBsdWcgKi8K
PiA+IAlkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKC4uLik7CQkvKiBoYW5kbGVyIGdvZXMgbGl2
ZSAqLwo+ID4gCS4uLgo+ID4gCWhkbWktPmJyaWRnZS5kZGMgPSBpbm5vX2hkbWlfaTJjX2FkYXB0
ZXIoaGRtaSk7Cj4gPiAJZGV2bV9kcm1fYnJpZGdlX2FkZChkZXYsICZoZG1pLT5icmlkZ2UpOwo+
ID4gCWRybV9icmlkZ2VfYXR0YWNoKC4uLik7CQkJLyogYnJpZGdlLmRldiBzZXQgaGVyZSAqLwo+
ID4gCj4gPiBUaGUgYnJpZGdlIGlzIGFsbG9jYXRlZCBieSBkZXZtX2RybV9icmlkZ2VfYWxsb2Mo
KSwgd2hpY2gga3phbGxvYygpcyBpdCwKPiA+IHNvIGJyaWRnZS5kZXYgaXMgTlVMTCBmb3IgYWxs
IG9mIHRoYXQgd2luZG93LCBhbmQgYSBob3RwbHVnIGV2ZW50Cj4gPiBhcnJpdmluZyBpbiBpdCBl
bnRlcnMgZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KE5VTEwpLgo+ID4gCj4gPiBCZWZvcmUgdGhl
IGNvbnZlcnNpb24gdG8gYSBicmlkZ2UgdGhlIG9yZGVyaW5nIHdhcyBzYWZlOgo+ID4gaW5ub19o
ZG1pX3JlZ2lzdGVyKCkgY2FsbGVkIGRybW1fY29ubmVjdG9yX2hkbWlfaW5pdCgpLCB3aGljaCBz
ZXQKPiA+IGNvbm5lY3Rvci5kZXYsIGJlZm9yZSB0aGUgaW50ZXJydXB0IHdhcyByZXF1ZXN0ZWQu
Cj4gPiAKPiA+IERyb3AgaG90cGx1ZyBldmVudHMgdGhhdCBhcnJpdmUgYmVmb3JlIHRoZSBicmlk
Z2UgaXMgYXR0YWNoZWQuCj4gPiAKPiA+IEZpeGVzOiA5NjkzMjVhMjU5N2UgKCJkcm0vcm9ja2No
aXA6IGlubm8taGRtaTogQ29udmVydCB0byBkcm0gYnJpZGdlIikKPiA+IFNpZ25lZC1vZmYtYnk6
IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm8taGRtaS5jIHwgOCArKysrKysrLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW5uby1oZG1pLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2lubm8taGRtaS5jCj4gPiBpbmRleCBkN2MzM2I5MmUyZGRmNGNlZDg0ZDE3
MzA0NDYzZjQ0YmU1MjI3MGI4Li5kMjk4MzIyNDliOTQyZGVjODRmYjlkMDdhMGIyMWVlNzUxZmMw
NDg2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vLWhkbWkuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vLWhkbWkuYwo+ID4gQEAgLTkyOSw3
ICs5MjksMTMgQEAgc3RhdGljIGlycXJldHVybl90IGlubm9faGRtaV9pcnEoaW50IGlycSwgdm9p
ZCAqZGV2X2lkKQo+ID4gIHsKPiA+ICAJc3RydWN0IGlubm9faGRtaSAqaGRtaSA9IGRldl9pZDsK
PiA+ICAKPiA+IC0JZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KGhkbWktPmJyaWRnZS5kZXYpOwo+
ID4gKwkvKgo+ID4gKwkgKiBUaGUgaW50ZXJydXB0IGlzIHJlcXVlc3RlZCBiZWZvcmUgdGhlIGJy
aWRnZSBpcyBhdHRhY2hlZCwgYW5kCj4gPiArCSAqIGJyaWRnZS5kZXYgaXMgb25seSBzZXQgYnkg
ZHJtX2JyaWRnZV9hdHRhY2goKS4gRHJvcCBob3RwbHVnIGV2ZW50cwo+ID4gKwkgKiB0aGF0IGFy
cml2ZSBiZWZvcmUgdGhlbiByYXRoZXIgdGhhbiBkZXJlZmVyZW5jZSBhIE5VTEwgZHJtX2Rldmlj
ZS4KPiA+ICsJICovCgpuaXQ6IEkgZG9uJ3QgdGhpbmsgdGhhdCBodWdlIGNvbW1lbnQgaXMgbmVj
ZXNzYXJ5IGZvciB0aGF0CgoKPiA+ICsJaWYgKGhkbWktPmJyaWRnZS5kZXYpCj4gPiArCQlkcm1f
aGVscGVyX2hwZF9pcnFfZXZlbnQoaGRtaS0+YnJpZGdlLmRldik7Cj4gCj4gUmV2aWV3ZWQtYnk6
IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gCj4gTW9zdCBvdGhlciBjYWxsZXJz
IG9mIGRybV9oZWxwZXJfaHBkX2lycV9ldmVudCgpIGFsc28gZG8gZXhhY3RseSB0aGlzLgo+IAo+
IAo+IEhlaWtvCj4gCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
