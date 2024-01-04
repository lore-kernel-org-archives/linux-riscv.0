Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4AAC47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hy5rhmBHRlIcQ4n7p9tejICM0diTUPXFkPmiJkIXoQE=; b=xKrf5/vPLF6XX2
	HYmH6FLxffZi0WRqYCNiiGcnNfyYl9yV2E5QcriErG9iXh2vrmi6SwrL4O1i+rsCOkx5cSr72SosD
	V/iVsc+y6uBKramubghopGsYbb+2OFHfm0kR3uK7gP70OEVSHT0USKeMrl4tkvc8A+NOSjn49uHJE
	KJ7GCX9u4NQBvV9ryea2nh0Cd+pB3eDeR1dEuIKdMWm+HPpu8Hc0iTNssY2Htw3OdbG/TALpMiA5e
	YkPH9fadMR1J+iv/MJnINLGOtwcHNjTQHiu6OKnKOdH97kDlCGYgsTNka0em+wfP6nTATVCmS0ZIY
	RarVM79aSL7HIwY/kVgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLOC-00DbUQ-3D;
	Thu, 04 Jan 2024 10:55:53 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLO8-00DbRP-0U
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 10:55:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6766EE0005;
	Thu,  4 Jan 2024 10:55:40 +0000 (UTC)
Message-ID: <36166acf-aa32-40b6-806a-ade59bc645ad@ghiti.fr>
Date: Thu, 4 Jan 2024 11:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] riscv: tlb: fix __p*d_free_tlb()
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
References: <20231219175046.2496-1-jszhang@kernel.org>
 <20231219175046.2496-2-jszhang@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231219175046.2496-2-jszhang@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_025548_326722_DCA03556 
X-CRM114-Status: GOOD (  16.83  )
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

T24gMTkvMTIvMjAyMyAxODo1MCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiBJZiBub24tbGVhZiBQ
VEVzIEkuRSBwbWQsIHB1ZCBvciBwNGQgaXMgbW9kaWZpZWQsIGEgc2ZlbmNlLnZtYSBpcwo+IGEg
bXVzdCBmb3Igc2FmZSwgaW1hZ2luZSBpZiBhbiBpbXBsZW1lbnRhdGlvbiBjYWNoZXMgdGhlIG5v
bi1sZWFmCj4gdHJhbnNsYXRpb24gaW4gVExCLCBhbHRob3VnaCBJIGRpZG4ndCBtZWV0IHRoaXMg
SFcgc28gZmFyLCBidXQgaXQncwo+IHBvc3NpYmxlIGluIHRoZW9yeS4KCgpBbmQgc2luY2UgdGhp
cyBpcyBhIGZpeCwgaXQgd291bGQgYmUgd29ydGggdHJ5aW5nIHRvIGFkZCBhIEZpeGVzIHRhZyAK
aGVyZS4gTm90IGVhc3kgSSBhZ3JlZSBiZWNhdXNlIGl0IGZpeGVzIHNldmVyYWwgY29tbWl0cyAo
SSBoYXZlIAowNzAzN2RiNWQ0NzlmLMKgIGU4YTYyY2MyNmRkZjUsIGQxMGVmYTIxYTkzNzQgYW5k
IGM1ZTliMmMyYWU4MjIgaWYgeW91IAppbXBsZW1lbnQgdGxiX2ZsdXNoKCkgYXMgSSBzdWdnZXN0
ZWQpLgoKU28gSSB3b3VsZCBhZGQgdGhlIGxhdGVzdCBjb21taXQgYXMgdGhlIEZpeGVzIGNvbW1p
dCAod2hpY2ggd291bGQgYmUgCmM1ZTliMmMyYWU4MjIpLCBhbmQgdGhlbiBJJ2Qgc2VuZCBhIHBh
dGNoIHRvIHN0YWJsZSBmb3IgZWFjaCBjb21taXQgd2l0aCAKdGhlIHJpZ2h0IEZpeGVzIHRhZy4u
LkBDb25vcjogbGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYSBzaW1wbGVyIGlkZWEgb3IgCmlmIHRo
aXMgaXMgd3JvbmcuCgpUaGFua3MsCgpBbGV4CgoKPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpo
YW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BnYWxsb2MuaCB8IDIwICsrKysrKysrKysrKysrKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BnYWxsb2MuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGdhbGxv
Yy5oCj4gaW5kZXggZDE2OWE0ZjQxYTJlLi5hMTJmYjgzZmExZjUgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BnYWxsb2MuaAo+IEBAIC05NSw3ICs5NSwxMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcHVk
X2ZyZWUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHB1ZF90ICpwdWQpCj4gICAJCV9fcHVkX2ZyZWUo
bW0sIHB1ZCk7Cj4gICB9Cj4gICAKPiAtI2RlZmluZSBfX3B1ZF9mcmVlX3RsYih0bGIsIHB1ZCwg
YWRkcikgIHB1ZF9mcmVlKCh0bGIpLT5tbSwgcHVkKQo+ICsjZGVmaW5lIF9fcHVkX2ZyZWVfdGxi
KHRsYiwgcHVkLCBhZGRyKQkJCQkJXAo+ICtkbyB7CQkJCQkJCQkJXAo+ICsJaWYgKHBndGFibGVf
bDRfZW5hYmxlZCkgewkJCQkJXAo+ICsJCXBhZ2V0YWJsZV9wdWRfZHRvcih2aXJ0X3RvX3B0ZGVz
YyhwdWQpKTsJCVwKPiArCQl0bGJfcmVtb3ZlX3BhZ2VfcHRkZXNjKCh0bGIpLCB2aXJ0X3RvX3B0
ZGVzYyhwdWQpKTsJXAo+ICsJfQkJCQkJCQkJXAo+ICt9IHdoaWxlICgwKQo+ICAgCj4gICAjZGVm
aW5lIHA0ZF9hbGxvY19vbmUgcDRkX2FsbG9jX29uZQo+ICAgc3RhdGljIGlubGluZSBwNGRfdCAq
cDRkX2FsbG9jX29uZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyKQo+
IEBAIC0xMjQsNyArMTMwLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwNGRfZnJlZShzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwgcDRkX3QgKnA0ZCkKPiAgIAkJX19wNGRfZnJlZShtbSwgcDRkKTsKPiAg
IH0KPiAgIAo+IC0jZGVmaW5lIF9fcDRkX2ZyZWVfdGxiKHRsYiwgcDRkLCBhZGRyKSAgcDRkX2Zy
ZWUoKHRsYiktPm1tLCBwNGQpCj4gKyNkZWZpbmUgX19wNGRfZnJlZV90bGIodGxiLCBwNGQsIGFk
ZHIpCQkJCQlcCj4gK2RvIHsJCQkJCQkJCQlcCj4gKwlpZiAocGd0YWJsZV9sNV9lbmFibGVkKQkJ
CQkJCVwKPiArCQl0bGJfcmVtb3ZlX3BhZ2VfcHRkZXNjKCh0bGIpLCB2aXJ0X3RvX3B0ZGVzYyhw
NGQpKTsJXAo+ICt9IHdoaWxlICgwKQo+ICAgI2VuZGlmIC8qIF9fUEFHRVRBQkxFX1BNRF9GT0xE
RUQgKi8KPiAgIAo+ICAgc3RhdGljIGlubGluZSB2b2lkIHN5bmNfa2VybmVsX21hcHBpbmdzKHBn
ZF90ICpwZ2QpCj4gQEAgLTE0OSw3ICsxNTksMTEgQEAgc3RhdGljIGlubGluZSBwZ2RfdCAqcGdk
X2FsbG9jKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ICAgCj4gICAjaWZuZGVmIF9fUEFHRVRBQkxF
X1BNRF9GT0xERUQKPiAgIAo+IC0jZGVmaW5lIF9fcG1kX2ZyZWVfdGxiKHRsYiwgcG1kLCBhZGRy
KSAgcG1kX2ZyZWUoKHRsYiktPm1tLCBwbWQpCj4gKyNkZWZpbmUgX19wbWRfZnJlZV90bGIodGxi
LCBwbWQsIGFkZHIpCQkJCVwKPiArZG8gewkJCQkJCQkJXAo+ICsJcGFnZXRhYmxlX3BtZF9kdG9y
KHZpcnRfdG9fcHRkZXNjKHBtZCkpOwkJXAo+ICsJdGxiX3JlbW92ZV9wYWdlX3B0ZGVzYygodGxi
KSwgdmlydF90b19wdGRlc2MocG1kKSk7CVwKPiArfSB3aGlsZSAoMCkKPiAgIAo+ICAgI2VuZGlm
IC8qIF9fUEFHRVRBQkxFX1BNRF9GT0xERUQgKi8KPiAgIAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
