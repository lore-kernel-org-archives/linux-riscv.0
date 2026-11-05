Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB274606A901
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1JeGe9nz;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=XcJht3bK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tAIm0XXspU/OFDYUhitKS0gqBWZvF+1XIEl+Ad2P/Jo=; b=1JeGe9nzTUXQsAbi83bNvowb7R
	yy8GOwE6hgJnygIrJkQnjpUhr6JQv9gC0887EHfotwWUnpOmBmVDURnHMFJy378YtgRVeXIUTqGzX
	WqEiveOHFGaEs8FpEKYOf0QzakLwrTUXMUasUo6AbQ2QeHNFwmU6d0D2H2GU6mPJzothB4lsg5PPP
	lyob2RGqDRabNSkGRE1rljLdDdlUg904+oCb8G9i4PVfqcke6AdvtzQEhmQe59Y80tpfJnDul/RTc
	GTwC81x0CMtbBsaejXi/AHT8cT6L5/jBlO8fd7yi/TNbT4KDPHt7mvAHk+Mcxa4mSd2i914zu6vEm
	Eni1tL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw19-00000008mHL-232y;
	Thu, 05 Nov 2026 11:52:31 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw14-00000008mFk-4AsT;
	Thu, 05 Nov 2026 11:52:30 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261105115223euoutp02401577e35fde163e971d044c1a1e6b40~lI-CoNlxl3120631206euoutp023;
	Thu,  5 Nov 2026 11:52:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261105115223euoutp02401577e35fde163e971d044c1a1e6b40~lI-CoNlxl3120631206euoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793879543;
	bh=0yf/VBr9PgSD2TLcROBoj1QltxuNWALI4+9T58rMh/k=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=XcJht3bKEcPNl4tHHo0odfzx0/lNUxBnLjQzrpY0jOOiwxhPsGfsqK6zkDMziJeFv
	 Qa9BFEFIB6kRiXQpuLwEsLm8qIDP6PxCFVDC8Rd63QgkFyuflwg44q2A6q0CQBu/OW
	 9hsCh/wnbjl4C3owfDiOalFk4sUorY1dq/NYOu7o=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261105115222eucas1p13e1fdfcf650934bf98ae67a9ceba38a7~lI-B4ePgq1887918879eucas1p1B;
	Thu,  5 Nov 2026 11:52:22 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261105115220eusmtip1dbbc5e03d0addbdca200fe0d0fffba71~lI-ANWOBC0047900479eusmtip1V;
	Thu,  5 Nov 2026 11:52:20 +0000 (GMT)
Message-ID: <54a2c7d1-f8d4-425e-966c-ae11ca03e13c@samsung.com>
Date: Thu, 5 Nov 2026 12:52:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/18] drm/bridge: inno-hdmi: Allow the register map
 to come from a parent
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
	<u.kleine-koenig@baylibre.com>, Byron Stanoszek <gandalf@winds.org>, OOHehir
	<oo.hehir@gmail.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <3194397.687JKscXgg@phil>
X-CMS-MailID: 20261105115222eucas1p13e1fdfcf650934bf98ae67a9ceba38a7
X-Msg-Generator: CA
X-RootMTR: 20261029075407eucas1p1c9b0d887cafa4c3c10bb34fa3ef3c4b7
X-EPHeader: CA
X-CMS-RootMailID: 20261029075407eucas1p1c9b0d887cafa4c3c10bb34fa3ef3c4b7
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
	<CGME20261029075407eucas1p1c9b0d887cafa4c3c10bb34fa3ef3c4b7@eucas1p1.samsung.com>
	<20261029-jh7110-clean-send-v6-9-759594e43acf@samsung.com>
	<3194397.687JKscXgg@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_035227_629625_E4C8F1F5 
X-CRM114-Status: GOOD (  24.06  )
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

CgpPbiAxMC8zMC8yNiAxOTowMSwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6Cj4gQW0gRG9ubmVyc3Rh
ZywgMjkuIE9rdG9iZXIgMjAyNiwgMDg6NTM6NDMgTWl0dGVsZXVyb3DDpGlzY2hlIE5vcm1hbHpl
aXQgc2NocmllYiBNaWNoYWwgV2lsY3p5bnNraToKPj4gT24gc29tZSBTb0NzIHRoZSBIRE1JIGNv
bnRyb2xsZXIgZG9lcyBub3Qgb3duIGl0cyByZWdpc3RlciB3aW5kb3cuIFRoZQo+PiBTdGFyRml2
ZSBKSDcxMTAgZG9jdW1lbnRzIG9uZSA2NCBLQiBibG9jaywgdTBfaGRtaXR4LCB0aGF0IGhvbGRz
IGJvdGgKPj4gdGhlIGNvbnRyb2xsZXIgYW5kIHRoZSBQSFksIHNvIHRoZSBwYXJlbnQgZGV2aWNl
IG1hcHMgaXQgYW5kIG93bnMgdGhlCj4+IHJlZ21hcCB3aGlsZSB0aGUgdHdvIGNoaWxkcmVuIHNo
YXJlIGl0Lgo+Pgo+PiBVc2UgYSByZWdtYXAgc3VwcGxpZWQgYnkgdGhlIHBhcmVudCBkZXZpY2Ug
d2hlbiB0aGVyZSBpcyBvbmUsIGFuZCBrZWVwCj4+IG1hcHBpbmcgb3VyIG93biByZXNvdXJjZSB3
aGVuIHRoZXJlIGlzIG5vdCwgc28gcGxhdGZvcm1zIHRoYXQgb3duIHRoZWlyCj4+IHJlZ2lzdGVy
IHdpbmRvdyBhcmUgdW5hZmZlY3RlZC4KPj4KPj4gUmV2aWV3ZWQtYnk6IEpvc2h1YSBQZWlzYWNo
IDxqcGVpc2FjaEB1YnVudHUuY29tPgo+PiBUZXN0ZWQtYnk6IEJ5cm9uIFN0YW5vc3playA8Z2Fu
ZGFsZkB3aW5kcy5vcmc+Cj4+IFRlc3RlZC1ieTogT09IZWhpciA8b28uaGVoaXJAZ21haWwuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1
bmcuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW5uby1oZG1pLmMgfCAz
MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgMjgg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvaW5uby1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lubm8t
aGRtaS5jCj4+IGluZGV4IDIyMmY2NTIyODQ0ZWU2MGFlOWEwN2FiMmRjY2E3NDhkYmY3NDAzZTQu
LmE4OTA1YmY2MjdhMjI0ZDdlMzkxODUxNDE5NWYxODEwMTY0ZGMyNmYgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW5uby1oZG1pLmMKPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9pbm5vLWhkbWkuYwo+PiBAQCAtMzk3LDYgKzM5Nyw3IEBAIHN0cnVjdCBpbm5v
X2hkbWkgewo+PiAgCXN0cnVjdCBjbGsgKnBjbGs7Cj4+ICAJc3RydWN0IGNsayAqcmVmY2xrOwo+
PiAgCXZvaWQgX19pb21lbSAqcmVnczsKPj4gKwlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Cj4+ICAJ
c3RydWN0IHJlZ21hcCAqZ3JmOwo+PiAgCj4+ICAJc3RydWN0IGlubm9faGRtaV9pMmMgKmkyYzsK
Pj4gQEAgLTQ3MCwxMSArNDcxLDI1IEBAIHN0YXRpYyBpbnQgaW5ub19oZG1pX2ZpbmRfcGh5X2Nv
bmZpZyhzdHJ1Y3QgaW5ub19oZG1pICpoZG1pLAo+PiAgCj4+ICBzdGF0aWMgaW5saW5lIHU4IGhk
bWlfcmVhZGIoc3RydWN0IGlubm9faGRtaSAqaGRtaSwgdTE2IG9mZnNldCkKPj4gIHsKPj4gKwl1
MzIgdmFsOwo+PiArCj4+ICsJaWYgKGhkbWktPnJlZ21hcCkgewo+PiArCQlpZiAocmVnbWFwX3Jl
YWQoaGRtaS0+cmVnbWFwLCBvZmZzZXQgKiA0LCAmdmFsKSkKPj4gKwkJCXJldHVybiAwOwo+PiAr
Cj4+ICsJCXJldHVybiB2YWw7Cj4+ICsJfQo+PiArCj4+ICAJcmV0dXJuIHJlYWRsX3JlbGF4ZWQo
aGRtaS0+cmVncyArIChvZmZzZXQpICogMHgwNCk7Cj4+ICB9Cj4+ICAKPj4gIHN0YXRpYyBpbmxp
bmUgdm9pZCBoZG1pX3dyaXRlYihzdHJ1Y3QgaW5ub19oZG1pICpoZG1pLCB1MTYgb2Zmc2V0LCB1
MzIgdmFsKQo+PiAgewo+PiArCWlmIChoZG1pLT5yZWdtYXApIHsKPj4gKwkJcmVnbWFwX3dyaXRl
KGhkbWktPnJlZ21hcCwgb2Zmc2V0ICogNCwgdmFsKTsKPj4gKwkJcmV0dXJuOwo+PiArCX0KPj4g
Kwo+PiAgCXdyaXRlbF9yZWxheGVkKHZhbCwgaGRtaS0+cmVncyArIChvZmZzZXQpICogMHgwNCk7
Cj4+ICB9Cj4+ICAKPj4gQEAgLTExMDEsOSArMTExNiwxOSBAQCBzdHJ1Y3QgaW5ub19oZG1pICpp
bm5vX2hkbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPj4gIAloZG1pLT5k
ZXYgPSBkZXY7Cj4+ICAJaGRtaS0+cGxhdF9kYXRhID0gcGxhdF9kYXRhOwo+PiAgCj4+IC0JaGRt
aS0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPj4gLQlp
ZiAoSVNfRVJSKGhkbWktPnJlZ3MpKQo+PiAtCQlyZXR1cm4gRVJSX0NBU1QoaGRtaS0+cmVncyk7
Cj4+ICsJLyoKPj4gKwkgKiBPbiBwbGF0Zm9ybXMgd2hlcmUgdGhlIGNvbnRyb2xsZXIgc2hhcmVz
IGEgcmVnaXN0ZXIgc3BhY2Ugd2l0aAo+PiArCSAqIG90aGVyIGJsb2NrcywgdGhlIHBhcmVudCBv
d25zIHRoZSByZWdtYXAuIEZhbGwgYmFjayB0byBtYXBwaW5nCj4+ICsJICogb3VyIG93biByZXNv
dXJjZSB3aGVyZSBpdCBkb2VzIG5vdC4KPj4gKwkgKi8KPj4gKwlpZiAoZGV2LT5wYXJlbnQpCj4+
ICsJCWhkbWktPnJlZ21hcCA9IGRldl9nZXRfcmVnbWFwKGRldi0+cGFyZW50LCBOVUxMKTsKPj4g
Kwo+PiArCWlmICghaGRtaS0+cmVnbWFwKSB7Cj4+ICsJCWhkbWktPnJlZ3MgPSBkZXZtX3BsYXRm
b3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7Cj4+ICsJCWlmIChJU19FUlIoaGRtaS0+cmVn
cykpCj4+ICsJCQlyZXR1cm4gRVJSX0NBU1QoaGRtaS0+cmVncyk7Cj4+ICsJfQo+IAo+IHdoeSBj
YW4ndCB5b3UganVzdCBhbHNvIHVzZSBhIG1taW8gcmVnbWFwIGhlcmU/IEJlY2F1c2Ugd2l0aCB0
aGlzIGNoYW5nZQo+IHRoZSBkcml2ZXIgbm93IGhhcyAyIGNvbXBldGluZyByZWdpc3RlciBpbnRl
cmZhY2VzIGFuZCB5b3UgbmVlZCB0aG9zZQo+IGNvbmRpdGlvbmFscyBhbGwgdGhlIHRpbWUuCj4g
Cj4gSnVzdCBjb252ZXJ0IHRoZSBleGlzdGluZyB1c2VyIHRvIGFsc28gdXNlIGEgcmVnbWFwIHBs
ZWFzZS4KCk9LLiBJbiB2NyBpbm5vLWhkbWkgd2lsbCB1c2UgYSByZWdtYXAuCgpQYXJlbnQncyB3
aGVyZSBvbmUgZXhpc3RzLCBhbmQgb3RoZXJ3aXNlIGEgZGV2bV9yZWdtYXBfaW5pdF9tbWlvKCkK
Y292ZXJpbmcgaXRzIG93biByZXNvdXJjZS4gaGRtaV9yZWFkYigpL2hkbWlfd3JpdGViKCkgY2Fu
IHRoZW4gZHJvcAp0aGUgY29uZGl0aW9uYWxzLgoKVGhhdCBhbHNvIHN3aXRjaGVzIHJvY2tjaGlw
IGh3IGZyb20gcmVhZGwvd3JpdGVsIG92ZXIgdG8gcmVnbWFwLiBJCmNhbiBvbmx5IGJ1aWxkIHRl
c3QgdGhvc2UgdHdvIHNvIGEgVGVzdGVkLWJ5IGZyb20gYW55b25lIHdpdGggdGhlCmFjdHVhbCBo
YXJkd2FyZSB3b3VsZCBiZSBhcHByZWNpYXRlZC4KCj4gCj4gCj4gSGVpa28KPiAKPiAKPiAKPiAK
CkJlc3QgcmVnYXJkcywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3Vu
Zy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
