Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45148606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 10:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WFz3yobx;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=NcjEQpYM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c9FvtB5Dojd9ysvnWCl6H4he+flp/iNqy2TuIGiLMdw=; b=WFz3yobxdHKwdP0GCcTUqXlGYt
	4++NL1wsXX2LO8t/U581nr1VDoJBdyKjToli9cM4atEHDID3u019Vq0XchH08COk7XvlID2D4VwYh
	A8yqy8Q6tL5xiAP0iDusNrLvwD4xzHY8Xg4J8KcA3d/mPyD7b/JnX/wSr/TtiHxe6TpCn/A7LrLCJ
	LntwyCf7oc9J+LbUcsbj7iiqKn2bFfCqg2PNZjuSIAWJaRQI8nQT9Ktll2K+zCG1gABBHZGyHCb/A
	lA6QV2kiyD8gBPAX68Sj8e+5epZVhv7Yoks0/m0dnWXytK4WTfB7lOytCvAU5x9J73TNou0hEciAl
	FP9qsu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv6r-00000008VKo-3eVM;
	Thu, 05 Nov 2026 10:54:21 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv6o-00000008VJe-1402;
	Thu, 05 Nov 2026 10:54:20 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261105105412euoutp0221de3a5b7a4048d78194fc0f7afe1c16~lIMP-HPlY3044430444euoutp02C;
	Thu,  5 Nov 2026 10:54:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261105105412euoutp0221de3a5b7a4048d78194fc0f7afe1c16~lIMP-HPlY3044430444euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793876052;
	bh=8U+WQmu8jFLJh5cbm79ZPqM5GeKacWcEkDyhOz912oU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=NcjEQpYMRbxhXBgzKnZDjzO9LLwfDGOaaIfPmI2qnt8v3BjyjGfN95aIsbRJ5WcAe
	 pMYGKFT8Id4k/8Q0czZ/74nGUvslfN7Kw9FJOU7LmEuNez+Hz47vdPfnIMzS747B6m
	 sW7Jr++9LwO+aS1wGDZxc4S00WHnS1MZnDI6ngsg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261105105412eucas1p171b6bde174fb0b6700cc78deee9d7edf~lIMPucvWX2329723297eucas1p12;
	Thu,  5 Nov 2026 10:54:12 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261105105410eusmtip15133e9a84efd244fc2a8fcab25cfa49a~lIMOGw1ty2761527615eusmtip1a;
	Thu,  5 Nov 2026 10:54:10 +0000 (GMT)
Message-ID: <204d333a-6f09-4498-b776-b2daee8d94b8@samsung.com>
Date: Thu, 5 Nov 2026 11:54:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/18] drm/bridge: inno-hdmi: Don't dereference a
 NULL drm_device on hotplug
To: Heiko Stuebner <heiko@sntech.de>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
	<hal.feng@starfivetech.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Andy Yan
	<andyshrk@163.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Yakir Yang <kuankuan.y@gmail.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Conor Dooley <conor@kernel.org>,
	William Qiu <william.qiu@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Sandy Huang <hjc@rock-chips.com>, Manivannan
	Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <2261991.3Lj2Plt8kZ@phil>
X-CMS-MailID: 20261105105412eucas1p171b6bde174fb0b6700cc78deee9d7edf
X-Msg-Generator: CA
X-RootMTR: 20261030174510eucas1p2f85c6d82738ce34b17bdcab27f914ac1
X-EPHeader: CA
X-CMS-RootMailID: 20261030174510eucas1p2f85c6d82738ce34b17bdcab27f914ac1
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
	<20261029-jh7110-clean-send-v6-2-759594e43acf@samsung.com>
	<1844578.vCJZsxu672@phil>
	<CGME20261030174510eucas1p2f85c6d82738ce34b17bdcab27f914ac1@eucas1p2.samsung.com>
	<2261991.3Lj2Plt8kZ@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_025418_928788_243A1D27 
X-CRM114-Status: GOOD (  18.13  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAxMC8zMC8yNiAxODo0NCwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6Cj4gQW0gRnJlaXRhZywg
MzAuIE9rdG9iZXIgMjAyNiwgMTg6NDM6NDcgTWl0dGVsZXVyb3DDpGlzY2hlIE5vcm1hbHplaXQg
c2NocmllYiBIZWlrbyBTdHVlYm5lcjoKPj4gQW0gRG9ubmVyc3RhZywgMjkuIE9rdG9iZXIgMjAy
NiwgMDg6NTM6MzYgTWl0dGVsZXVyb3DDpGlzY2hlIE5vcm1hbHplaXQgc2NocmllYiBNaWNoYWwg
V2lsY3p5bnNraToKPj4+IGlubm9faGRtaV9pcnEoKSBwYXNzZXMgaGRtaS0+YnJpZGdlLmRldiB0
byBkcm1faGVscGVyX2hwZF9pcnFfZXZlbnQoKSwKPj4+IHdoaWNoIGRlcmVmZXJlbmNlcyBpdCBp
biBpdHMgZmlyc3Qgc3RhdGVtZW50Ogo+Pj4KPj4+IAlpZiAoIWRldi0+bW9kZV9jb25maWcucG9s
bF9lbmFibGVkKQo+Pj4KPj4+IGJyaWRnZS5kZXYgaXMgYXNzaWduZWQgb25seSBieSBkcm1fYnJp
ZGdlX2F0dGFjaCgpLCBidXQgaW5ub19oZG1pX2JpbmQoKQo+Pj4gdW5tdXRlcyB0aGUgaG90cGx1
ZyBpbnRlcnJ1cHQgaW4gaW5ub19oZG1pX2luaXRfaHcoKSBhbmQgaW5zdGFsbHMgdGhlCj4+PiBo
YW5kbGVyIHdlbGwgYmVmb3JlIGl0IGF0dGFjaGVzIHRoZSBicmlkZ2U6Cj4+Pgo+Pj4gCWlubm9f
aGRtaV9pbml0X2h3KGhkbWkpOwkJLyogdW5tdXRlcyBob3RwbHVnICovCj4+PiAJZGV2bV9yZXF1
ZXN0X3RocmVhZGVkX2lycSguLi4pOwkJLyogaGFuZGxlciBnb2VzIGxpdmUgKi8KPj4+IAkuLi4K
Pj4+IAloZG1pLT5icmlkZ2UuZGRjID0gaW5ub19oZG1pX2kyY19hZGFwdGVyKGhkbWkpOwo+Pj4g
CWRldm1fZHJtX2JyaWRnZV9hZGQoZGV2LCAmaGRtaS0+YnJpZGdlKTsKPj4+IAlkcm1fYnJpZGdl
X2F0dGFjaCguLi4pOwkJCS8qIGJyaWRnZS5kZXYgc2V0IGhlcmUgKi8KPj4+Cj4+PiBUaGUgYnJp
ZGdlIGlzIGFsbG9jYXRlZCBieSBkZXZtX2RybV9icmlkZ2VfYWxsb2MoKSwgd2hpY2gga3phbGxv
YygpcyBpdCwKPj4+IHNvIGJyaWRnZS5kZXYgaXMgTlVMTCBmb3IgYWxsIG9mIHRoYXQgd2luZG93
LCBhbmQgYSBob3RwbHVnIGV2ZW50Cj4+PiBhcnJpdmluZyBpbiBpdCBlbnRlcnMgZHJtX2hlbHBl
cl9ocGRfaXJxX2V2ZW50KE5VTEwpLgo+Pj4KPj4+IEJlZm9yZSB0aGUgY29udmVyc2lvbiB0byBh
IGJyaWRnZSB0aGUgb3JkZXJpbmcgd2FzIHNhZmU6Cj4+PiBpbm5vX2hkbWlfcmVnaXN0ZXIoKSBj
YWxsZWQgZHJtbV9jb25uZWN0b3JfaGRtaV9pbml0KCksIHdoaWNoIHNldAo+Pj4gY29ubmVjdG9y
LmRldiwgYmVmb3JlIHRoZSBpbnRlcnJ1cHQgd2FzIHJlcXVlc3RlZC4KPj4+Cj4+PiBEcm9wIGhv
dHBsdWcgZXZlbnRzIHRoYXQgYXJyaXZlIGJlZm9yZSB0aGUgYnJpZGdlIGlzIGF0dGFjaGVkLgo+
Pj4KPj4+IEZpeGVzOiA5NjkzMjVhMjU5N2UgKCJkcm0vcm9ja2NoaXA6IGlubm8taGRtaTogQ29u
dmVydCB0byBkcm0gYnJpZGdlIikKPj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tp
IDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4+PiAtLS0KPj4+ICBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2lubm8taGRtaS5jIHwgOCArKysrKysrLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9pbm5vLWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW5uby1o
ZG1pLmMKPj4+IGluZGV4IGQ3YzMzYjkyZTJkZGY0Y2VkODRkMTczMDQ0NjNmNDRiZTUyMjcwYjgu
LmQyOTgzMjI0OWI5NDJkZWM4NGZiOWQwN2EwYjIxZWU3NTFmYzA0ODYgMTAwNjQ0Cj4+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm8taGRtaS5jCj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2lubm8taGRtaS5jCj4+PiBAQCAtOTI5LDcgKzkyOSwxMyBAQCBzdGF0aWMg
aXJxcmV0dXJuX3QgaW5ub19oZG1pX2lycShpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4+PiAgewo+
Pj4gIAlzdHJ1Y3QgaW5ub19oZG1pICpoZG1pID0gZGV2X2lkOwo+Pj4gIAo+Pj4gLQlkcm1faGVs
cGVyX2hwZF9pcnFfZXZlbnQoaGRtaS0+YnJpZGdlLmRldik7Cj4+PiArCS8qCj4+PiArCSAqIFRo
ZSBpbnRlcnJ1cHQgaXMgcmVxdWVzdGVkIGJlZm9yZSB0aGUgYnJpZGdlIGlzIGF0dGFjaGVkLCBh
bmQKPj4+ICsJICogYnJpZGdlLmRldiBpcyBvbmx5IHNldCBieSBkcm1fYnJpZGdlX2F0dGFjaCgp
LiBEcm9wIGhvdHBsdWcgZXZlbnRzCj4+PiArCSAqIHRoYXQgYXJyaXZlIGJlZm9yZSB0aGVuIHJh
dGhlciB0aGFuIGRlcmVmZXJlbmNlIGEgTlVMTCBkcm1fZGV2aWNlLgo+Pj4gKwkgKi8KPiAKPiBu
aXQ6IEkgZG9uJ3QgdGhpbmsgdGhhdCBodWdlIGNvbW1lbnQgaXMgbmVjZXNzYXJ5IGZvciB0aGF0
CgpUaGFua3MsIEknbGwgdHJpbSB0aGUgY29tbWVudCBpbiB2NwoKPiAKPiAKPj4+ICsJaWYgKGhk
bWktPmJyaWRnZS5kZXYpCj4+PiArCQlkcm1faGVscGVyX2hwZF9pcnFfZXZlbnQoaGRtaS0+YnJp
ZGdlLmRldik7Cj4+Cj4+IFJldmlld2VkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNo
LmRlPgo+Pgo+PiBNb3N0IG90aGVyIGNhbGxlcnMgb2YgZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50
KCkgYWxzbyBkbyBleGFjdGx5IHRoaXMuCj4+Cj4+Cj4+IEhlaWtvCj4+Cj4gCj4gCj4gCj4gCj4g
CgpCZXN0IHJlZ2FyZHMsCi0tIApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1
bmcuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
