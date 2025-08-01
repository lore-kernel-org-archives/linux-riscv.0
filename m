Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BCAC87FCB
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YI9MyGhdLhRz4hfvdPW0el7cZUBJgKbr+mj4g5hWEjI=; b=avuOWYCOEIPmgz
	0FLKk5VvZrh+X4zwGZ8/Zc9ujbvGPNEEN13dnErhk3fKOjs9wUwRuA6kmisRvEMmpTFI1OcCcXuS3
	Du1H4Xmj6NHShOg449hbSp1FmR53/LUdRM8cS6fpCTqPK2r8AKyabW4e4bCOCKF6tKkhPcjYhVp9U
	WPRDqJ4ytsCmoT6I3w4LWU44i2pT9NDV1yJhyo0lswX1NvLafdS/twuVg/2sjeK0aSj+Ug/6ZOYbo
	gR+bh2h6R5T0BBdsO+xGxAKl8lQiYeihRfTH22lNQIyaexKWwx7koFn3divhbC2+fB/Uiv7wtnWnd
	XYm7PBXyCOCIbv76TCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoLp-00000005b9n-1NY7;
	Fri, 01 Aug 2025 11:55:05 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoDA-00000005aTk-2T2Z
	for linux-riscv@lists.infradead.org;
	Fri, 01 Aug 2025 11:46:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEB37439C0;
	Fri,  1 Aug 2025 11:45:59 +0000 (UTC)
Message-ID: <ffb83627-bd28-4bf9-8051-57dfca407f87@ghiti.fr>
Date: Fri, 1 Aug 2025 13:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: cacheinfo: init cache levels via fetch_cache_info
 when SMP disabled
To: liu.xuemei1@zte.com.cn, paul.walmsley@sifive.com
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, spersvold@gmail.com,
 sudeep.holla@arm.com, mikisabate@gmail.com, robh@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250801093201232CYacRrFIHaDJWsjc3rbNz@zte.com.cn>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250801093201232CYacRrFIHaDJWsjc3rbNz@zte.com.cn>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdeguefhhfevueejteevveeikeelkedvffdufeelveeggfeikeekgfeghfdttdevnecukfhppedujeeirddugeejrddugeehrdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeeirddugeejrddugeehrdeggedphhgvlhhopegludelvddrudeikedruddrudehlegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheplhhiuhdrgihuvghmvghiudesiihtvgdrtghomhdrtghnpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehsphgvrhhsvhholhgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhuuggvvghprdhhohhllhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhhik
 hhishgrsggrthgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_044608_755209_3913EA05 
X-CRM114-Status: GOOD (  28.51  )
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

SGkgSmVzc2ljYSwKCk9uIDgvMS8yNSAwMzozMiwgbGl1Lnh1ZW1laTFAenRlLmNvbS5jbiB3cm90
ZToKPgo+IE9uIDcvMzEvMjUgMjE6MjksIGFsZXhAZ2hpdGkuZnIgd3JvdGU6Cj4KPiA+ID4gRnJv
bTogSmVzc2ljYSBMaXUgPGxpdS54dWVtZWkxQHp0ZS5jb20uY24+Cj4KPiA+ID4KPgo+ID4gPiBB
cyBkZXNjcmliZWQgaW4gY29tbWl0IDE4NDVkMzgxZjI4MCAoInJpc2N2OiBjYWNoZWluZm86IEFk
ZCBiYWNrCj4KPiA+ID4gaW5pdF9jYWNoZV9sZXZlbCgpIGZ1bmN0aW9uIiksIHdoZW4gQ09ORklH
X1NNUCBpcyB1bmRlZmluZWQsIHRoZSBjYWNoZQo+Cj4gPiA+IGhpZXJhcmNoeSBkZXRlY3Rpb24g
bmVlZHMgdG8gYmUgcGVyZm9ybWVkIHRocm91Z2ggdGhlIAo+IGluaXRfY2FjaGVfbGV2ZWwoKSwK
Pgo+ID4gPiB3aGVyZWFzIHdoZW4gQ09ORklHX1NNUCBpcyBkZWZpbmVkLCB0aGlzIGRldGVjdGlv
biBpcyBoYW5kbGVkIAo+IGR1cmluZyB0aGUKPgo+ID4gPiBpbml0X2NwdV90b3BvbG9neSgpIHBy
b2Nlc3MuCj4KPiA+ID4KPgo+ID4gPiBGdXJ0aGVybW9yZSwgd2hpbGUgY29tbWl0IDY2MzgxZDM2
NzcxZSAoIlJJU0MtVjogU2VsZWN0IEFDUEkgUFBUVCAKPiBkcml2ZXJzIikKPgo+ID4gPiBlbmFi
bGVzIGNhY2hlIGluZm9ybWF0aW9uIHJldHJpZXZhbCB0aHJvdWdoIHRoZSBBQ1BJIFBQVFQgdGFi
bGUsIHRoZQo+Cj4gPiA+IGluaXRfb2ZfY2FjaGVfbGV2ZWwoKSBjYWxsZWQgd2l0aGluIGluaXRf
Y2FjaGVfbGV2ZWwoKSBjYW5ub3QgCj4gc3VwcG9ydCBjYWNoZQo+Cj4gPiA+IGhpZXJhcmNoeSBk
ZXRlY3Rpb24gdGhyb3VnaCBBQ1BJIFBQVFQuIFRoZXJlZm9yZSwgd2hlbiBDT05GSUdfU01QIGlz
Cj4KPiA+ID4gdW5kZWZpbmVkLCB3ZSBkaXJlY3RseSBpbnZva2UgdGhlIGZldGNoX2NhY2hlX2lu
Zm8gZnVuY3Rpb24gdG8gCj4gaW5pdGlhbGl6ZQo+Cj4gPiA+IHRoZSBjYWNoZSBsZXZlbHMuCj4K
PiA+ID4KPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKZXNzaWNhIExpdSA8bGl1Lnh1ZW1laTFAenRl
LmNvbS5jbj4KPgo+ID4gPiAtLS0KPgo+ID4gPsKgIMKgYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVp
bmZvLmMgfCA2ICsrKysrLQo+Cj4gPiA+wqAgwqAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4KPiA+ID4KPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvY2FjaGVpbmZvLmMgCj4gYi9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYwo+
Cj4gPiA+IGluZGV4IDI2YjA4NWRiZGQwNy4uZjgxY2E5NjNkMTc3IDEwMDY0NAo+Cj4gPiA+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jCj4KPiA+ID4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvY2FjaGVpbmZvLmMKPgo+ID4gPiBAQCAtNzMsNyArNzMsMTEgQEAgc3RhdGljIHZv
aWQgY2lfbGVhZl9pbml0KHN0cnVjdCBjYWNoZWluZm8gCj4gKnRoaXNfbGVhZiwKPgo+ID4gPgo+
Cj4gPiA+wqAgwqBpbnQgaW5pdF9jYWNoZV9sZXZlbCh1bnNpZ25lZCBpbnQgY3B1KQo+Cj4gPiA+
wqAgwqB7Cj4KPiA+ID4gLcKgIMKgIHJldHVybiBpbml0X29mX2NhY2hlX2xldmVsKGNwdSk7Cj4K
PiA+ID4gKyNpZmRlZiBDT05GSUdfU01QCj4KPiA+ID4gK8KgIMKgIHJldHVybiAwOwo+Cj4gPiA+
ICsjZW5kaWYKPgo+ID4gPiArCj4KPiA+ID4gK8KgIMKgIHJldHVybiBmZXRjaF9jYWNoZV9pbmZv
KGNwdSk7Cj4KPiA+ID7CoCDCoH0KPgo+ID4gPgo+Cj4gPiA+wqAgwqBpbnQgcG9wdWxhdGVfY2Fj
aGVfbGVhdmVzKHVuc2lnbmVkIGludCBjcHUpCj4KPiA+Cj4KPiA+Cj4KPiA+IElzIHRoZSBjdXJy
ZW50IGJlaGF2aW91ciB3cm9uZyBvciBqdXN0IHJlZHVuZGFudD8gSWYgd3JvbmcsIEknbGwgYWRk
IGEKPgo+ID4gRml4ZXMgdGFnIHRvIGJhY2twb3J0LCBvdGhlcndpc2UgSSB3b24ndC4KPgo+ID4K
Pgo+ID4gVGhhbmtzLAo+Cj4gPgo+Cj4gPiBBbGV4Cj4KPgo+IEhpIEFsZXgsCj4KPgo+IFRoZSBj
dXJyZW50IGJlaGF2aW9yIGlzIGFjdHVhbGx5IHdyb25nIHdoZW4gdXNpbmcgQUNQSSBvbiAhQ09O
RklHX1NNUAo+Cj4gc3lzdGVtcy4gVGhlIG9yaWdpbmFsIGluaXRfb2ZfY2FjaGVfbGV2ZWwoKSBj
YW5ub3QgZGV0ZWN0IGNhY2hlIGhpZXJhcmNoeQo+Cj4gdGhyb3VnaCBBQ1BJIFBQVFQgdGFibGUs
IHdoaWNoIG1lYW5zIGNhY2hlIGluZm9ybWF0aW9uIHdvdWxkIGJlIG1pc3NpbmcKPgo+IGluIHRo
aXMgY29uZmlndXJhdGlvbi4KPgo+Cj4gVGhlIHBhdGNoIGZpeGVzIHRoaXMgYnkgZGlyZWN0bHkg
Y2FsbGluZyBmZXRjaF9jYWNoZV9pbmZvKCkgd2hlbgo+Cj4gQ09ORklHX1NNUCBpcyB1bmRlZmlu
ZWQsIHdoaWNoIHByb3Blcmx5IGhhbmRsZXMgYm90aCBEVCBhbmQgQUNQSSBjYXNlcy4KPgo+Cj4g
U28geWVzLCBpdCB3b3VsZCBiZSBhcHByb3ByaWF0ZSB0byBhZGQgYSBGaXhlcyB0YWcuIFRoZSBj
b21taXQgYmVpbmcKPgo+IGZpeGVkIGlzIDE4NDVkMzgxZjI4MCAoInJpc2N2OiBjYWNoZWluZm86
IEFkZCBiYWNrIGluaXRfY2FjaGVfbGV2ZWwoKSAKPiBmdW5jdGlvbiIpLgo+Cj4KPiBQbGVhc2Ug
bGV0IG1lIGtub3cgaWYgeW91IG5lZWQgYW55IGFkZGl0aW9uYWwgaW5mb3JtYXRpb24uCj4KCkkn
bSBhYm91dCB0byBzZW5kIG15IGZpcnN0IFBSIGZvciA2LjE3IHNvIEknbGwgZGVsYXkgbWVyZ2lu
ZyB0aGlzIG9uZSAKZm9yIHRoZSBmaXJzdCByYy4KClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9u
LAoKQWxleAoKCj4KPiBCZXN0IHJlZ2FyZHMsCj4KPiBKZXNzaWNhCj4KPgo+Cj4KPgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
