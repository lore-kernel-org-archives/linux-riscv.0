Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF05D3E2D0
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 07:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KCGV2M1EsjWAOGlkCkmVWmxRWx92URdhyeD1cLg1ps=; b=iNXs5rgPZbIT8h
	UlzMKG+1EpCN4tbZHgbGAGcJx7hRDEvcISyWgoWeGxDjPoKsg34/JqIHbyjIWmnsknR6/+a47bKvy
	W4TKBN0Fi/jCzqKspcFKTkNn+mylPsgHqraxr1bFyjn0SL+BspS4hwNEJEEjniHuGqy2OsVD1lUu0
	ppIPhLE0RavM7mxsM9QYYG1WvTiXB3xDBMjLSQqauUwRmxDnprGtKb9pm58jr/ThGs57zteKootbl
	DhEzmNk0JUR0UOjGMuYAo+sgPZ40VWPB4r9vYfrHCk0CJ7kg2XOBkMLbfIWRRy4ewc6c9iIYuHrDq
	32oZkMUGdBES8LpwEqrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gyt-0000000DZZ2-1J66;
	Tue, 29 Oct 2024 07:49:35 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gvd-0000000DYuq-3JVM
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 07:46:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0370AE0003;
	Tue, 29 Oct 2024 07:46:06 +0000 (UTC)
Message-ID: <cbe0831e-706c-465f-b412-fccf26163e9b@ghiti.fr>
Date: Tue, 29 Oct 2024 08:46:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/riscv-intc: Fix no-SMP boot with ACPI
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20241014065739.656959-1-sunilvl@ventanamicro.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241014065739.656959-1-sunilvl@ventanamicro.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_004614_005762_D2CEA031 
X-CRM114-Status: GOOD (  21.23  )
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

SGkgVGhvbWFzLAoKT24gMTQvMTAvMjAyNCAwODo1NywgU3VuaWwgViBMIHdyb3RlOgo+IFdoZW4g
Q09ORklHX1NNUCBpcyBkaXNhYmxlZCwgdGhlIHN0YXRpYyBhcnJheSByaW50Y19hY3BpX2RhdGEg
d2l0aCBzaXplCj4gTlJfQ1BVUyB3aWxsIG5vdCBiZSBzdWZmaWNpZW50IHRvIGhvbGQgYWxsIFJJ
TlRDIHN0cnVjdHVyZXMgcGFzc2VkIGZyb20KPiB0aGUgZmlybXdhcmUuIEFsbCBSSU5UQyBzdHJ1
Y3R1cmVzIGFyZSByZXF1aXJlZCB0byBjb25maWd1cmUKPiBJTVNJQy9BUExJQy9QTElDIHByb3Bl
cmx5IGlycmVzcGVjdGl2ZSBvZiBTTVAgaW4gdGhlIE9TLiBTbywgYWxsb2NhdGUKPiBkeW5hbWlj
IG1lbW9yeSBiYXNlZCBvbiB0aGUgbnVtYmVyIG9mIFJJTlRDIHN0cnVjdHVyZXMgaW4gTUFEVCB0
byBmaXgKPiB0aGlzIGlzc3VlLgo+Cj4gRml4ZXM6IGY4NjE5YjY2YmRiMSAoImlycWNoaXAvcmlz
Y3YtaW50YzogQWRkIEFDUEkgc3VwcG9ydCBmb3IgQUlBIikKPiBSZXBvcnRlZC1ieTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KPiBDbG9zZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9s
aW51eC1yaXNjdi9saW51eC1yaXNjdi9hY3Rpb25zL3J1bnMvMTEyODA5OTc1MTEvam9iLzMxMzc1
MjI5MDEyCj4gU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5j
b20+Cj4gLS0tCj4gICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYyB8IDE5ICsrKysr
KysrKysrKysrKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRj
LmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+IGluZGV4IDhjNTQxMTM4NjIy
MC4uZjY1M2MxM2RlNjJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
aW50Yy5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiBAQCAtMjY1
LDcgKzI2NSw3IEBAIHN0cnVjdCByaW50Y19kYXRhIHsKPiAgIH07Cj4gICAKPiAgIHN0YXRpYyB1
MzIgbnJfcmludGM7Cj4gLXN0YXRpYyBzdHJ1Y3QgcmludGNfZGF0YSAqcmludGNfYWNwaV9kYXRh
W05SX0NQVVNdOwo+ICtzdGF0aWMgc3RydWN0IHJpbnRjX2RhdGEgKipyaW50Y19hY3BpX2RhdGE7
Cj4gICAKPiAgICNkZWZpbmUgZm9yX2VhY2hfbWF0Y2hpbmdfcGxpYyhfcGxpY19pZCkJCQkJXAo+
ICAgCXVuc2lnbmVkIGludCBfcGxpYzsJCQkJCQlcCj4gQEAgLTMyOSwxMyArMzI5LDMwIEBAIGlu
dCBhY3BpX3JpbnRjX2dldF9pbXNpY19tbWlvX2luZm8odTMyIGluZGV4LCBzdHJ1Y3QgcmVzb3Vy
Y2UgKnJlcykKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW50IF9faW5pdCBy
aXNjdl9pbnRjX2FjcGlfbWF0Y2godW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFkZXIs
Cj4gKwkJCQkJY29uc3QgdW5zaWduZWQgbG9uZyBlbmQpCj4gK3sKPiArCXJldHVybiAwOwo+ICt9
Cj4gKwo+ICAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfaW50Y19hY3BpX2luaXQodW5pb24gYWNw
aV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFkZXIsCj4gICAJCQkJICAgICAgIGNvbnN0IHVuc2lnbmVk
IGxvbmcgZW5kKQo+ICAgewo+ICAgCXN0cnVjdCBhY3BpX21hZHRfcmludGMgKnJpbnRjOwo+ICAg
CXN0cnVjdCBmd25vZGVfaGFuZGxlICpmbjsKPiArCWludCBjb3VudDsKPiAgIAlpbnQgcmM7Cj4g
ICAKPiArCWlmICghcmludGNfYWNwaV9kYXRhKSB7Cj4gKwkJY291bnQgPSBhY3BpX3RhYmxlX3Bh
cnNlX21hZHQoQUNQSV9NQURUX1RZUEVfUklOVEMsIHJpc2N2X2ludGNfYWNwaV9tYXRjaCwgMCk7
Cj4gKwkJaWYgKGNvdW50IDw9IDApCj4gKwkJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCQlyaW50
Y19hY3BpX2RhdGEgPSBrY2FsbG9jKGNvdW50LCBzaXplb2YoKnJpbnRjX2FjcGlfZGF0YSksIEdG
UF9LRVJORUwpOwo+ICsJCWlmICghcmludGNfYWNwaV9kYXRhKQo+ICsJCQlyZXR1cm4gLUVOT01F
TTsKPiArCX0KPiArCj4gICAJcmludGMgPSAoc3RydWN0IGFjcGlfbWFkdF9yaW50YyAqKWhlYWRl
cjsKPiAgIAlyaW50Y19hY3BpX2RhdGFbbnJfcmludGNdID0ga3phbGxvYyhzaXplb2YoKnJpbnRj
X2FjcGlfZGF0YVswXSksIEdGUF9LRVJORUwpOwo+ICAgCWlmICghcmludGNfYWNwaV9kYXRhW25y
X3JpbnRjXSkKCgpEbyB5b3UgdGhpbmsgeW91IGNhbiBtZXJnZSB0aGlzIHBhdGNoIGZvciByYzY/
IFdlIHN0aWxsIG5lZWQgaXQgdG8gZml4IApvdXIgbm9zbXAgYnVpbGRzLgoKVGhhbmtzLAoKQWxl
eAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
