Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6886E606A324
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 17:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eujIEgp0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=U9kWFnfC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p7Uu4hNXqTUnjrLSrbq2nfdMuA6frnanbQ1d6xcM3ng=; b=eujIEgp0QcqfAPJHpOKrX4/xeD
	D/nzoRaD978FUR7xw08ZThz4wWrc2siAyKdjttA/DOL3jWhsoRY4twSr2YY9tzIgfezAP3zcyZ7Mj
	vEMPQseHnNGTlX3jAJqBr6OXRnM/xQcWaQ/2u1WLn5MMTcr1ZqYBqG8/s0UnCEOtkkAzm3OH5yhFm
	zpP8rMZ1vVy5rvkBUXEG3v273oO/XgIPudWZfWK5zfBgABJMdTl3erRsn2xUom3IWIDVPyW7unUQt
	DYt6AcUQa3HX15jSxWYb9z6rD7aFU62ev3ZtWJQNUfvqq6ur+zXpt/M72bXlQbTLXE34xMJLSqhIa
	QNdUkvAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqeL-0000000CGe4-0jjZ;
	Fri, 30 Oct 2026 17:44:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqeI-0000000CGdI-1mOX;
	Fri, 30 Oct 2026 17:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=usSQk3gmkVPvTdjKUU6vUCEb73RASrZuENLTQo/CskA=; b=U9kWFnfC3oQMbgDNWHcOQJ/NJT
	HfgLlU43wb+0bVziHK6qseWoW1WMNY9f8Yajz9bGzugJq2zGqk+5Zl/V7gMxjMMyR2ibJg2DM/cKq
	mFzfarqU1oKC/MKLL6HJdfJrlr9ls7aCcDDFy74PBnwrJJomtlNsDXUz13oWND07rvw4PsnCH04QP
	aYc/Td6PEoaEgs9zzYMyNlzWqaiAeywaleFvaOvv0NUvxO68TRI9g5PexamYMQFGhtIA9nmouBK2A
	hlhLO7I37xAuZou/gPdDekGMLTi100S6UetXWliTUUnG1AXLWeo3vVV6iXXbak+pKHorNBooaP+i1
	QmeOqqOg==;
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
Date: Fri, 30 Oct 2026 18:43:47 +0100
Message-ID: <1844578.vCJZsxu672@phil>
In-Reply-To: <20261029-jh7110-clean-send-v6-2-759594e43acf@samsung.com>
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
 <CGME20261029075355eucas1p190ad652b6408201a2e04bc53c2717783@eucas1p1.samsung.com>
 <20261029-jh7110-clean-send-v6-2-759594e43acf@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_104418_464062_EB3C8964 
X-CRM114-Status: GOOD (  20.47  )
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

QW0gRG9ubmVyc3RhZywgMjkuIE9rdG9iZXIgMjAyNiwgMDg6NTM6MzYgTWl0dGVsZXVyb3DDpGlz
Y2hlIE5vcm1hbHplaXQgc2NocmllYiBNaWNoYWwgV2lsY3p5bnNraToKPiBpbm5vX2hkbWlfaXJx
KCkgcGFzc2VzIGhkbWktPmJyaWRnZS5kZXYgdG8gZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KCks
Cj4gd2hpY2ggZGVyZWZlcmVuY2VzIGl0IGluIGl0cyBmaXJzdCBzdGF0ZW1lbnQ6Cj4gCj4gCWlm
ICghZGV2LT5tb2RlX2NvbmZpZy5wb2xsX2VuYWJsZWQpCj4gCj4gYnJpZGdlLmRldiBpcyBhc3Np
Z25lZCBvbmx5IGJ5IGRybV9icmlkZ2VfYXR0YWNoKCksIGJ1dCBpbm5vX2hkbWlfYmluZCgpCj4g
dW5tdXRlcyB0aGUgaG90cGx1ZyBpbnRlcnJ1cHQgaW4gaW5ub19oZG1pX2luaXRfaHcoKSBhbmQg
aW5zdGFsbHMgdGhlCj4gaGFuZGxlciB3ZWxsIGJlZm9yZSBpdCBhdHRhY2hlcyB0aGUgYnJpZGdl
Ogo+IAo+IAlpbm5vX2hkbWlfaW5pdF9odyhoZG1pKTsJCS8qIHVubXV0ZXMgaG90cGx1ZyAqLwo+
IAlkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKC4uLik7CQkvKiBoYW5kbGVyIGdvZXMgbGl2ZSAq
Lwo+IAkuLi4KPiAJaGRtaS0+YnJpZGdlLmRkYyA9IGlubm9faGRtaV9pMmNfYWRhcHRlcihoZG1p
KTsKPiAJZGV2bV9kcm1fYnJpZGdlX2FkZChkZXYsICZoZG1pLT5icmlkZ2UpOwo+IAlkcm1fYnJp
ZGdlX2F0dGFjaCguLi4pOwkJCS8qIGJyaWRnZS5kZXYgc2V0IGhlcmUgKi8KPiAKPiBUaGUgYnJp
ZGdlIGlzIGFsbG9jYXRlZCBieSBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSwgd2hpY2gga3phbGxv
YygpcyBpdCwKPiBzbyBicmlkZ2UuZGV2IGlzIE5VTEwgZm9yIGFsbCBvZiB0aGF0IHdpbmRvdywg
YW5kIGEgaG90cGx1ZyBldmVudAo+IGFycml2aW5nIGluIGl0IGVudGVycyBkcm1faGVscGVyX2hw
ZF9pcnFfZXZlbnQoTlVMTCkuCj4gCj4gQmVmb3JlIHRoZSBjb252ZXJzaW9uIHRvIGEgYnJpZGdl
IHRoZSBvcmRlcmluZyB3YXMgc2FmZToKPiBpbm5vX2hkbWlfcmVnaXN0ZXIoKSBjYWxsZWQgZHJt
bV9jb25uZWN0b3JfaGRtaV9pbml0KCksIHdoaWNoIHNldAo+IGNvbm5lY3Rvci5kZXYsIGJlZm9y
ZSB0aGUgaW50ZXJydXB0IHdhcyByZXF1ZXN0ZWQuCj4gCj4gRHJvcCBob3RwbHVnIGV2ZW50cyB0
aGF0IGFycml2ZSBiZWZvcmUgdGhlIGJyaWRnZSBpcyBhdHRhY2hlZC4KPiAKPiBGaXhlczogOTY5
MzI1YTI1OTdlICgiZHJtL3JvY2tjaGlwOiBpbm5vLWhkbWk6IENvbnZlcnQgdG8gZHJtIGJyaWRn
ZSIpCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1z
dW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vLWhkbWkuYyB8IDgg
KysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm8taGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vLWhkbWkuYwo+IGluZGV4IGQ3YzMzYjkyZTJkZGY0
Y2VkODRkMTczMDQ0NjNmNDRiZTUyMjcwYjguLmQyOTgzMjI0OWI5NDJkZWM4NGZiOWQwN2EwYjIx
ZWU3NTFmYzA0ODYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbm5vLWhk
bWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW5uby1oZG1pLmMKPiBAQCAtOTI5
LDcgKzkyOSwxMyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgaW5ub19oZG1pX2lycShpbnQgaXJxLCB2
b2lkICpkZXZfaWQpCj4gIHsKPiAgCXN0cnVjdCBpbm5vX2hkbWkgKmhkbWkgPSBkZXZfaWQ7Cj4g
IAo+IC0JZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KGhkbWktPmJyaWRnZS5kZXYpOwo+ICsJLyoK
PiArCSAqIFRoZSBpbnRlcnJ1cHQgaXMgcmVxdWVzdGVkIGJlZm9yZSB0aGUgYnJpZGdlIGlzIGF0
dGFjaGVkLCBhbmQKPiArCSAqIGJyaWRnZS5kZXYgaXMgb25seSBzZXQgYnkgZHJtX2JyaWRnZV9h
dHRhY2goKS4gRHJvcCBob3RwbHVnIGV2ZW50cwo+ICsJICogdGhhdCBhcnJpdmUgYmVmb3JlIHRo
ZW4gcmF0aGVyIHRoYW4gZGVyZWZlcmVuY2UgYSBOVUxMIGRybV9kZXZpY2UuCj4gKwkgKi8KPiAr
CWlmIChoZG1pLT5icmlkZ2UuZGV2KQo+ICsJCWRybV9oZWxwZXJfaHBkX2lycV9ldmVudChoZG1p
LT5icmlkZ2UuZGV2KTsKClJldmlld2VkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNo
LmRlPgoKTW9zdCBvdGhlciBjYWxsZXJzIG9mIGRybV9oZWxwZXJfaHBkX2lycV9ldmVudCgpIGFs
c28gZG8gZXhhY3RseSB0aGlzLgoKCkhlaWtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
