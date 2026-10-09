Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8670FCA6015
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IyF3nEt2m0I+3S0ogU/rtvDQUnHoFSntmDvxNxZpSm8=; b=F97Sa6JsiGkxRd
	3PvQx7LVMj/NSn3qto1RN+8Wfiqxl3ofbtxGpei1EUOkqepIWBCzCAiDRA4ypPKE3Rj3Cs9eDrdnM
	jbwfkbWHZWIxTwqwZ9o+BZXbkQLhudWqEmTXKlWd2yuwc5Sfgx4ZAFs6/XGh6pqS7/glcK860RMxv
	zBxTk3IzwVEJUsHttGPk+h0WORhASyUPBW4q/nTGm6Dy8thv0OVOPo3/0A3U0AWxvxDXx3JCLa/Ve
	4fx1GQ9Fj2DeTJePIr0Bdn7DXVoPsD/hq3JzUrDWGIaG8oCtlURWMbLAwl6cwP30nAYlaCtjopn5k
	mitg/Wy/97MXA1zEtBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBNU-00000006R8K-0Yp8;
	Fri, 09 Oct 2026 14:15:16 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBNR-00000006R7I-34I5
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 14:15:15 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=D7hfrm3qIlI4+AhECxlB2fjvQpfx6eid9hhS+USFrjU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791555309; v=1; x=1792160109;
 b=GMDAttqOuXeY3snxdxDg/TGOisNaY8cjT7aTUA5pErulbgGQz/vII5x2eGfCfxvh3TPoIE99
 sslXlYROGY1X61fo7V9Z5wtwX1RQBQHIQoa/hah/s9hpGwAS1/b6+zSVnjmGhzpo28IoEcNz2vK
 f3/c+heLYD42W9Jz2eJFETJ4=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d5fd037bf9b86533;
	Fri, 09 Oct 2026 14:15:05 +0000
X-Mizu-Trace-ID: d5fd037bf9b86533
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 2/4] riscv/mm: fix hotplug page-table destructor handling
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <87jynrs8v8.fsf@all.your.base.are.belong.to.us>
Date: Fri, 9 Oct 2026 22:14:40 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 akpm@linux-foundation.org,
 linux-mm@kvack.org,
 stable@vger.kernel.org,
 david@kernel.org,
 osalvador@suse.de,
 dave.hansen@linux.intel.com,
 luto@kernel.org,
 peterz@infradead.org,
 tglx@kernel.org,
 mingo@redhat.com,
 bp@alien8.de,
 x86@kernel.org,
 hpa@zytor.com,
 catalin.marinas@arm.com,
 will@kernel.org,
 mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org,
 pjw@kernel.org,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 alex@ghiti.fr,
 linux-riscv@lists.infradead.org,
 agordeev@linux.ibm.com,
 kevin.brodsky@arm.com,
 bjorn@rivosinc.com,
 apopple@nvidia.com,
 linux-kernel@vger.kernel.org
Message-Id: <0E3A4E15-38DA-400D-95F2-01FFBB36304B@linux.dev>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
 <20261008073021.2512665-3-songmuchun@bytedance.com>
 <87jynrs8v8.fsf@all.your.base.are.belong.to.us>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_071513_909913_A190A97D 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cgo+IE9uIE9jdCA5LCAyMDI2LCBhdCAxNDowOSwgQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gCj4gTXVjaHVuIFNvbmcgPHNvbmdtdWNodW5AYnl0ZWRhbmNlLmNvbT4g
d3JpdGVzOgo+IAo+PiBSSVNDLVYgdXNlcyB0aGUgc2FtZSBtZW1vcnktaG90cGx1ZyB0ZWFyZG93
biBjb2RlIGZvciB0aGUgbGluZWFyIG1hcCBhbmQKPj4gdm1lbW1hcCwgYWx0aG91Z2ggdGhlaXIg
cGFnZS10YWJsZSBwYWdlcyBhcmUgbm90IGFsd2F5cyBhbGxvY2F0ZWQgaW4gdGhlCj4+IHNhbWUg
d2F5LiBMYXRlIGxpbmVhci1tYXAgYWxsb2NhdGlvbnMgcnVuIHBhZ2UtdGFibGUgY29uc3RydWN0
b3JzLCB3aGlsZQo+PiB2bWVtbWFwIGFuZCBlYXJseSBhbGxvY2F0aW9ucyBtYXkgcHJvdmlkZSBj
b25zdHJ1Y3Rvci1mcmVlIHBhZ2VzLgo+PiAKPj4gVGhlIFBURSBwYXRoIHVuY29uZGl0aW9uYWxs
eSBydW5zIHRoZSBkZXN0cnVjdG9yLCB3aGljaCBpcyB3cm9uZyBmb3IKPj4gY29uc3RydWN0b3It
ZnJlZSB2bWVtbWFwIHRhYmxlcy4gVGhlIFBNRCBwYXRoIGF2b2lkcyB0aGF0IHByb2JsZW0gYnkK
Pj4gdXNpbmcgaXNfdm1lbW1hcCBhcyBhIHByb3h5IGZvciBjb25zdHJ1Y3RvciBzdGF0ZSwgYnV0
IHRoYXQgYXNzdW1wdGlvbgo+PiB3aWxsIG5vIGxvbmdlciBob2xkIG9uY2UgcnVudGltZSB2bWVt
bWFwIGFsbG9jYXRpb25zIHVzZSB0aGUgbm9ybWFsCj4+IHBnYWxsb2MgaGVscGVycy4KPj4gCj4+
IFBhZ2UtdGFibGUgY29uc3RydWN0b3JzIHJlY29yZCB0aGVpciBzdGF0ZSBpbiBQR190YWJsZS4g
Q2VudHJhbGl6ZQo+PiBwYWdlLXRhYmxlIGZyZWVpbmcgYW5kIHVzZSBQYWdlVGFibGUoKSB0byBk
ZWNpZGUgd2hldGhlciB0aGUgZGVzdHJ1Y3Rvcgo+PiBpcyByZXF1aXJlZC4gS2VlcCByZXNlcnZl
ZCBhbmQgY29uc3RydWN0b3ItZnJlZSBwYWdlcyBvbiB0aGVpciBleGlzdGluZwo+PiBmcmVlaW5n
IHBhdGhzLgo+PiAKPj4gRml4ZXM6IGM3NWE3NGY0YmExOSAoInJpc2N2OiBtbTogQWRkIG1lbW9y
eSBob3RwbHVnZ2luZyBzdXBwb3J0IikKPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4g
QXNzaXN0ZWQtYnk6IExMTQo+PiBTaWduZWQtb2ZmLWJ5OiBNdWNodW4gU29uZyA8c29uZ211Y2h1
bkBieXRlZGFuY2UuY29tPgo+PiAtLS0KPj4gYXJjaC9yaXNjdi9tbS9pbml0LmMgfCAyOSArKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+PiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgMTUgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9p
bml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+PiBpbmRleCA4NTdmOWE1NTAzOWMuLjQyOWEw
YjAxNWVjMSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4gKysrIGIvYXJj
aC9yaXNjdi9tbS9pbml0LmMKPj4gQEAgLTE0ODYsMTAgKzE0ODYsMTkgQEAgc3RydWN0IGV4ZWNt
ZW1faW5mbyBfX2luaXQgKmV4ZWNtZW1fYXJjaF9zZXR1cCh2b2lkKQo+PiAjZW5kaWYgLyogQ09O
RklHX0VYRUNNRU0gKi8KPj4gCj4+ICNpZmRlZiBDT05GSUdfTUVNT1JZX0hPVFBMVUcKPj4gK3N0
YXRpYyB2b2lkIF9fbWVtaW5pdCBmcmVlX3BhZ2V0YWJsZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPj4g
K3sKPj4gKyAJaWYgKFBhZ2VSZXNlcnZlZChwYWdlKSkKPj4gKyAJCWZyZWVfcmVzZXJ2ZWRfcGFn
ZShwYWdlKTsKPj4gKyAJZWxzZSBpZiAoUGFnZVRhYmxlKHBhZ2UpKQo+PiArIAkJcGFnZXRhYmxl
X2R0b3JfZnJlZShwYWdlX3B0ZGVzYyhwYWdlKSk7Cj4+ICsgCWVsc2UKPj4gKyAJCXBhZ2V0YWJs
ZV9mcmVlKHBhZ2VfcHRkZXNjKHBhZ2UpKTsKPj4gK30KPiAKPiBJcyBQYWdlUmVzZXJ2ZWQoKSBl
bm91Z2h0IHRvIGRldGVybWluZSBpZiB0aGVyZSdzIG5vIGR0b3IgdG8gcnVuPyBPbgoKWWVzLgoK
PiBydjY0IHlvdXIgY29kZSBpcyBjb3JyZWN0LCBidXQgbWF5YmUgZm9yIHJvYnVzdG5lc3M/Cj4g
Cj4gIHwgaWYgKFBhZ2VUYWJsZShwYWdlKSkKPiAgfCAgICAgICAgIHBhZ2V0YWJsZV9kdG9yKHBh
Z2VfcHRkZXNjKHBhZ2UpKTsKPiAgfCAKPiAgfCBpZiAoUGFnZVJlc2VydmVkKHBhZ2UpKQo+ICB8
ICAgICAgICAgZnJlZV9yZXNlcnZlZF9wYWdlKHBhZ2UpOwo+ICB8IGVsc2UKPiAgfCAgICAgICAg
IHBhZ2V0YWJsZV9mcmVlKHBhZ2VfcHRkZXNjKHBhZ2UpKTsKCmhpcyBsb29rcyBnb29kIHRvIG1l
IGFzIHdlbGwuIEknbGwgY2hhbmdlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uIFRoYW5rcyEKCk11
Y2h1bgoKPiAKPiAKPiBCasO2cm4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
