Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B02C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 07:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Idm6O6/+IGyBRJNU2g1CF+W7Uy/NUqBo0pZ5dhNS6Ns=; b=WzrArRBwZXq106
	ScETtn3eRWMy00VGzyuKoaGKM7eOi+AdoKFjLve5cVawg+vl+TUCaB+oG/uvwVw2NDAPQbPnp/O4b
	RZQTSzppYR1Lq6pESvDVSAq+//3DY6Q0rPz/gTMFwlt57eoEOlkpE3KIKH7Fc9uDMWDnhCsGpSNb6
	JS0VvnWGI750u0K9V6LpHT6A8Vrt2jITamtcNTdiw59abm1+ZwlK3cUy49CPYSeVRWCcgdsrD6O9x
	zWe9iUyvj114W4xHLLXf7vGRzYYsjpkrPCiGBbGSL2DeTSpTKkCVAxFvTg6ea2z8p3BZotKeG+2QH
	sMplbSfXigVO3GYIeGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b8y-00000004tQ8-3CgG;
	Tue, 15 Apr 2025 07:55:44 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4au2-00000004q3J-2fiE
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 07:40:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744702774; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NkU8spe0vKT08V1fXVABu5/53/gQbYk4BNMrFwDPZsuuvccHpPHSsVbcfjrjR/bQGLUg9Ta0Mg02gUixO06nxIxeTPQSKi3jUFH83n25ZCq62lGhw4Led0V0GjA7GTAh5rgreZW4JKllVNYa6Gz6Hs8LKWCS6YZEq7z7qodE7DA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744702774; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yU0uVlGtDXeaxlwOodUHke+tqbdX1S3tQgjMGMTi7t8=; 
	b=Y7ZPpfE+id/ntFmKRy7y2NAhV1gzFzurNoW0ZjmrU75LSbbfQn2BVs//6r53AB1Bc+Zy8jQLy9PGjv6Zd7vZU1xDRpoS9RRqtDyBbLlyN7wHOp8Zza+oiI2lDUSLuPtk0CznX7rat0ZZG8MMvtHwNZw/MT/1D1OGX7JAJCl0QQE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sjoerd@collabora.com;
	dmarc=pass header.from=<sjoerd@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744702774;
	s=zohomail; d=collabora.com; i=sjoerd@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=yU0uVlGtDXeaxlwOodUHke+tqbdX1S3tQgjMGMTi7t8=;
	b=EVuhjwAwRYM7/0zcg7r0GCMTJSTlVHZMZxkNQFQxVzGr6goyPp8DbT7Ng4UWe5VX
	H2iA36/QNHPm/XrnD6QsdJzrkrACjX0HSj5+gX+Z81sYUllypQmYHKKqpqVtfvF/o4l
	v0qUEpQ/qmRJ6tFUcmenLs0EYQHBlQJSv8Yvo/n4=
Received: by mx.zohomail.com with SMTPS id 17447027670091011.7454237538764;
	Tue, 15 Apr 2025 00:39:27 -0700 (PDT)
Message-ID: <096a8318629dea9073ad6c4807a2f1dedc6b0cd6.camel@collabora.com>
Subject: Re: [PATCH v3 10/10] riscv: dts: eswin: add HiFive Premier P550
 board device tree
From: Sjoerd Simons <sjoerd@collabora.com>
To: Samuel Holland <samuel.holland@sifive.com>, Ariel D'Alessandro	
 <ariel.dalessandro@collabora.com>, Pinkesh Vaghela	
 <pinkesh.vaghela@einfochips.com>, Conor Dooley <conor@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Gleixner	 <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt	
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano	
 <daniel.lezcano@linaro.org>, Min Lin <linmin@eswincomputing.com>, Pritesh
 Patel	 <pritesh.patel@einfochips.com>, Yangyu Chen <cyy@cyyself.name>, Lad
 Prabhakar	 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Yu Chien Peter Lin	
 <peterlin@andestech.com>, Charlie Jenkins <charlie@rivosinc.com>, Kanak
 Shilledar <kanakshilledar@gmail.com>, Darshan Prajapati
 <darshan.prajapati@einfochips.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Aradhya
 Bhatia	 <a-bhatia1@ti.com>, rafal@milecki.pl, Anup Patel
 <anup@brainfault.org>, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 "kernel@collabora.com" <kernel@collabora.com>
Date: Tue, 15 Apr 2025 09:39:21 +0200
In-Reply-To: <0dc3bb03-3708-4134-96bf-d5f95187e8bb@sifive.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
	 <20250410152519.1358964-11-pinkesh.vaghela@einfochips.com>
	 <956d76b0-4f82-4f95-8f70-70896d488bd3@collabora.com>
	 <0dc3bb03-3708-4134-96bf-d5f95187e8bb@sifive.com>
Organization: Collabora
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_004018_740451_64349A66 
X-CRM114-Status: GOOD (  19.51  )
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

SGV5LAoKT24gTW9uLCAyMDI1LTA0LTE0IGF0IDExOjAwIC0wNTAwLCBTYW11ZWwgSG9sbGFuZCB3
cm90ZToKPiBIaSBBcmllbCwKPiAKPiBPbiAyMDI1LTA0LTE0IDc6NTUgQU0sIEFyaWVsIEQnQWxl
c3NhbmRybyB3cm90ZToKPiA+IEhpIFBpbmtlc2gsCj4gPiAKPiA+IE9uIDQvMTAvMjUgMTI6MjUg
UE0sIFBpbmtlc2ggVmFnaGVsYSB3cm90ZToKPiA+ID4gRnJvbTogTWluIExpbiA8bGlubWluQGVz
d2luY29tcHV0aW5nLmNvbT4KPiA+IAo8c25pcD4KCj4gPiBBbHRob3VnaCBjb21taXQgbG9nIHNh
eXMgdGhhdCB0aGlzIGluY2x1ZGVzIERSQU0gY29uZmlndXJhdGlvbiwgbG9va3MgbGlrZQo+ID4g
aXQncwo+ID4gbWlzc2luZz8gSW4gb3JkZXIgdG8gdGVzdCB0aGlzIHBhdGNoc2V0LCBoYWQgdG8g
YWRkIHRoaXMgZm9sbG93aW5nIG1lbW9yeQo+ID4gZGVmaW5pdGlvbiAocGlja2VkIGZyb20gdmVu
ZG9yIGtlcm5lbCByZXBvc2l0b3J5KToKPiA+IAo+ID4gwqDCoMKgIEw1MDogbWVtb3J5QDgwMDAw
MDAwIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJzaWZpdmUsYXhp
NC1tZW0tcG9ydCIsICJzaWZpdmUsYXhpNC1wb3J0IiwKPiA+ICJzaWZpdmUsbWVtLXBvcnQiOwo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4ODAwMDAwMDAgMHg3ZiAweDgwMDAwMDAw
PjsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2lmaXZlLHBvcnQtd2lkdGgtYnl0ZXMgPSA8
MzI+Owo+ID4gwqDCoMKgIH07Cj4gCj4gVGhhdCBpcyBhIG1pc3N0YXRlbWVudCBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UuIFRoZSBtZW1vcnkgbm9kZSBpcyBub3QgaW5jbHVkZWQKPiBpbgo+IHRoZSBz
dGF0aWMgZGV2aWNldHJlZSBiZWNhdXNlIHRoZSBhbW91bnQgb2YgUkFNIGluc3RhbGxlZCBvbiB0
aGUgYm9hcmQgaXMKPiB2YXJpYWJsZS4gSXQgaXMgdGhlIHJlc3BvbnNpYmlsaXR5IG9mIGZpcm13
YXJlIHRvIHByb3ZpZGUgdGhlIG1lbW9yeSBtYXAsCj4gZWl0aGVyCj4gdGhyb3VnaCBFRkkgb3Ig
YnkgcGF0Y2hpbmcgdGhlIG1lbW9yeSBub2RlIGludG8gdGhlIERUIGF0IHJ1bnRpbWUuIEkgYmVs
aWV2ZQo+IHRoZQo+IGN1cnJlbnQgQlNQIFUtQm9vdCBkb2VzIHRoZSBmb3JtZXIgYnV0IG5vdCB0
aGUgbGF0dGVyLgoKQW1vdW50IG9mIFJBTSBiZWluZyB2YXJpYWJsZSBpcyBwcmV0dHkgY29tbW9u
IG9uIGRldmljZXMgdXNpbmcgRkRUIHRoZXNlIGRheXM7ClR5cGljYWxseSB0aGUgZHRzIHN0aWxs
IGdldHMgYSBtZW1vcnkgbm9kZSB0aGF0J3MgYSByZWFzb25hYmxlIGRlZmF1bHQsIHdpdGggdGhl
CmV4cGVjdGF0aW9uIHRoYXQgZS5nLiB1LWJvb3Qgd2lsbCBmaXggaXQgdXAuIElmIHlvdSBsb29r
IGF0IG90aGVyIHJpc2MtdgpkZXZpY2V0cmVlcyBpbiB1cHN0cmVhbSB0aGV5IChhbG1vc3Q/KSBh
bGwgY29tZSB3aXRoIGEgcHJlLWRlZmluZWQgbWVtb3J5IG5vZGUuCkZvciB0aGUgUDU1MCBib2Fy
ZCBhIGRlZmF1bHQgbWVtb3J5IG5vZGUgZm9yIDE2RyByYW0gc2VlbXMgcmVhc29uYWJsZSAoYXMg
dGhhdApzZWVtcyB0aGUgbWluaW1hbCBTS1U/KQoKVGhhdCBhbGwgYmVpbmcgc2FpZC4gSW5kZWVk
IHRoZSBzaWZpdmUgQlNQIHUtYm9vdCBkb2Vzbid0IHNlZW0gdG8gY2FsbCB0aGUKcmVsZXZhbnQg
YGZkdF9maXh1cF9tZW1vcnlgIHRvIGZpeHVwIHRoZSBtZW1vcnkgbm9kZSwgaGVuY2UgdXMgaGF2
aW5nIGlzc3Vlcwpib290aW5nIHdpdGggdS1ib290IGRpcmVjdGx5ICh3aXRob3V0IGdvaW5nIHRo
cm91Z2ggRUZJKS4gSG9uZXN0bHkgdGhpcyB3YXMgYQpiaXQgb2YgYSBzdXJwcmlzZSB0byBtZSBh
cyBvbmx5IG1vc3Qgb3RoZXIgYXJjaGl0ZWN0dXJlcyB0aGF0J3MganVzdCBkb25lIGJ5CmNvbW1v
biBjb2RlLCBidXQgdGhhdCBkb2Vzbid0IHNlZW0gdG8gYmUgdGhlIGNhc2UgZm9yIHJpc2MtdiAo
ZWl0aGVyIHVwc3RyZWFtIG9yCmRvd25zdHJlYW0pCgotLSAKU2pvZXJkIFNpbW9ucwpDb2xsYWJv
cmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
