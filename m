Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04DAC28B20
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 06:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sk9pFB02yBx+h+7VM0Xlgl8UUj60j2yjkLeCLFiembo=; b=xJD8SNfDyP9J5J
	wqEjJACORiozzBiv+RddnihgEn7u6Rhkspn6UZeOQGA7aBhqkd1Dvb4y3zP+cDW/IpenkgYcFylMC
	VRT9JI8CXA255sPxJKozeMYJ9LtNnIpf9DQmihJ6gvYUBLCpjObUUnYcH4TxGAA6NxhOULvkHTV1I
	Tu3G6Q74oeV4uowgHrE5U1GScjrDIpT2pBKl+VXSZKi9R58jKJfg44p+ZRwXVFGaPReBWLE9JQebh
	j9wBhDIXzzlO0HBYPEQ2DPHLhf9MwZYTHcpLg8EnaYz7Bm96n9ZWkDuDw2K96rSxr2hMRD70gwVBM
	SGgq1XhUycqLgexa1YOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzs1T-00000005IKA-2o4c;
	Wed, 02 Apr 2025 06:56:27 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzs1R-00000005IJE-0IM9
	for linux-riscv@lists.infradead.org;
	Wed, 02 Apr 2025 06:56:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D7E32047D;
	Wed,  2 Apr 2025 06:56:17 +0000 (UTC)
Message-ID: <e24dcb5b-750f-4bab-b975-38753a619e3a@ghiti.fr>
Date: Wed, 2 Apr 2025 08:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Use kvmalloc_array on relocation_hashtable
Content-Language: en-US
To: wgpierce17@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org
References: <d9714824-810c-4dd8-aff4-d1431235702b@gmail.com>
 <20250402053408.14052-1-wgpierce17@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250402053408.14052-1-wgpierce17@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdeguefhhfevueejteevveeikeelkedvffdufeelveeggfeikeekgfeghfdttdevnecukfhppeefuddrfedvrdekuddrudekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefuddrfedvrdekuddrudekjedphhgvlhhopegludelvddrudeikedrvddurdefudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohephedprhgtphhtthhopeifghhpihgvrhgtvgdujeesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_235625_274928_0430DB20 
X-CRM114-Status: GOOD (  14.19  )
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

SGkgV2lsbCwKCk9uIDAyLzA0LzIwMjUgMDc6MzQsIHdncGllcmNlMTdAZ21haWwuY29tIHdyb3Rl
Ogo+IEZyb206IFdpbGwgUGllcmNlIDx3Z3BpZXJjZTE3QGdtYWlsLmNvbT4KPgo+IFRoZSBudW1i
ZXIgb2YgcmVsb2NhdGlvbnMgbWF5IGJlIGEgaHVnZSB2YWx1ZSB0aGF0IGlzIHVuYWxsb2NhdGFi
bGUKPiBieSBrbWFsbG9jLiBVc2Uga3ZtYWxsb2MgaW5zdGVhZCBzbyB0aGF0IGl0IGRvZXMgbm90
IGZhaWwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXaWxsIFBpZXJjZSA8d2dwaWVyY2UxN0BnbWFpbC5j
b20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYyB8IDUgKysrLS0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1
bGUuYwo+IGluZGV4IDQ3ZDBlYmVlYzkzYy4uYmFlM2RiNTA2NDdjIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxl
LmMKPiBAQCAtNjQ4LDcgKzY0OCw3IEBAIHByb2Nlc3NfYWNjdW11bGF0ZWRfcmVsb2NhdGlvbnMo
c3RydWN0IG1vZHVsZSAqbWUsCj4gICAJCWtmcmVlKGJ1Y2tldF9pdGVyKTsKPiAgIAl9Cj4gICAK
PiAtCWtmcmVlKCpyZWxvY2F0aW9uX2hhc2h0YWJsZSk7Cj4gKwlrdmZyZWUoKnJlbG9jYXRpb25f
aGFzaHRhYmxlKTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGludCBhZGRfcmVsb2NhdGlvbl90b19h
Y2N1bXVsYXRlKHN0cnVjdCBtb2R1bGUgKm1lLCBpbnQgdHlwZSwKPiBAQCAtNzUyLDcgKzc1Miw4
IEBAIGluaXRpYWxpemVfcmVsb2NhdGlvbl9oYXNodGFibGUodW5zaWduZWQgaW50IG51bV9yZWxv
Y2F0aW9ucywKPiAgIAo+ICAgCWhhc2h0YWJsZV9zaXplIDw8PSBzaG91bGRfZG91YmxlX3NpemU7
Cj4gICAKPiAtCSpyZWxvY2F0aW9uX2hhc2h0YWJsZSA9IGttYWxsb2NfYXJyYXkoaGFzaHRhYmxl
X3NpemUsCj4gKwkvKiBOdW1iZXIgb2YgcmVsb2NhdGlvbnMgbWF5IGJlIGxhcmdlLCBzbyBrdm1h
bGxvYyBpdCAqLwo+ICsJKnJlbG9jYXRpb25faGFzaHRhYmxlID0ga3ZtYWxsb2NfYXJyYXkoaGFz
aHRhYmxlX3NpemUsCj4gICAJCQkJCSAgICAgIHNpemVvZigqKnJlbG9jYXRpb25faGFzaHRhYmxl
KSwKPiAgIAkJCQkJICAgICAgR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKCEqcmVsb2NhdGlvbl9oYXNo
dGFibGUpCgoKTGV0J3MgYWRkIGEgZml4ZXMgdGFnOgoKRml4ZXM6IDhmZDZjNTE0MjM5NSAoInJp
c2N2OiBBZGQgcmVtYWluaW5nIG1vZHVsZSByZWxvY2F0aW9ucyIpCgpTaW5jZSBDbMOpbWVudCBz
dWdnZXN0ZWQgdGhpcyBzb2x1dGlvbjoKClN1Z2dlc3RlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxj
bGVnZXJAcml2b3NpbmMuY29tPgoKQW5kIGZpbmFsbHksIHRoaXMgbG9va3MgZ29vZCB0byBtZSBz
bzoKClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+
CgpJdCdzIGEgYml0IGxhdGUgZm9yIHJjMSBzbyBJJ2xsIHRha2UgdGhpcyBvbmUgZm9yIGEgbmV4
dCByYy4KClRoYW5rcyBmb3IgdGhlIHBhdGNoIQoKQWxleAoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
