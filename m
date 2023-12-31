Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5A6C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Dec 2023 06:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8L/Q6vOCsW7RFfi6iW7PfPxGqZO/oATqFRZZ6Wkmm1Y=; b=UA3gjrfkRrq8ri
	K6CuZkKEnSAAAG1xHC/AKcUXE4zM3u/HYUPFRjVa1PVUX0NTm9sKKDao0bCIDMooQgs8/mTUyA3gC
	yqHmQLW7n+Ap7aPaTUMrnpZY4wCXddYS4Ym0dZSLGeJFiY2K7aVcGE3ear1GePMMgcm+UZUXc6I8K
	/zZy72BzSFo4lGODqjvDIWEBskBkosOJzV9MnD8TNjAgsaGHiHV3twAnrjauk7SIfe+3BIcNQZOBo
	kxUNs6iUogciukz0jerChd4yqVRaTV8txVQstnN4cCL7HonG86jtXwRZ0QRQnPNKzNs8iMqmKcd9Y
	LerGIxxFoU+Is9SC3ZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJpCp-0043a1-28;
	Sun, 31 Dec 2023 06:21:51 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJpCm-0043W4-26
	for linux-riscv@lists.infradead.org;
	Sun, 31 Dec 2023 06:21:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AFF71C0002;
	Sun, 31 Dec 2023 06:21:38 +0000 (UTC)
Message-ID: <08f55d3e-d68e-406a-9bc9-d62f3c86e949@ghiti.fr>
Date: Sun, 31 Dec 2023 07:21:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 1/4] riscv: tlb: fix __p*d_free_tlb()
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
References: <20231219175046.2496-1-jszhang@kernel.org>
 <20231219175046.2496-2-jszhang@kernel.org>
Content-Language: en-US
In-Reply-To: <20231219175046.2496-2-jszhang@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231230_222148_827434_C6A5CC12 
X-CRM114-Status: GOOD (  14.94  )
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

SGkgSmlzaGVuZywKCk9uIDE5LzEyLzIwMjMgMTg6NTAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4g
SWYgbm9uLWxlYWYgUFRFcyBJLkUgcG1kLCBwdWQgb3IgcDRkIGlzIG1vZGlmaWVkLCBhIHNmZW5j
ZS52bWEgaXMKPiBhIG11c3QgZm9yIHNhZmUsIGltYWdpbmUgaWYgYW4gaW1wbGVtZW50YXRpb24g
Y2FjaGVzIHRoZSBub24tbGVhZgo+IHRyYW5zbGF0aW9uIGluIFRMQiwgYWx0aG91Z2ggSSBkaWRu
J3QgbWVldCB0aGlzIEhXIHNvIGZhciwgYnV0IGl0J3MKPiBwb3NzaWJsZSBpbiB0aGVvcnkuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nPGpzemhhbmdAa2VybmVsLm9yZz4KPiAtLS0K
PiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGdhbGxvYy5oIHwgMjAgKysrKysrKysrKysrKysr
KystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGdhbGxvYy5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKPiBpbmRleCBkMTY5YTRmNDFhMmUuLmExMmZi
ODNmYTFmNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BnYWxsb2MuaAo+
ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4gQEAgLTk1LDcgKzk1LDEz
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwdWRfZnJlZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgcHVk
X3QgKnB1ZCkKPiAgIAkJX19wdWRfZnJlZShtbSwgcHVkKTsKPiAgIH0KPiAgIAo+IC0jZGVmaW5l
IF9fcHVkX2ZyZWVfdGxiKHRsYiwgcHVkLCBhZGRyKSAgcHVkX2ZyZWUoKHRsYiktPm1tLCBwdWQp
Cj4gKyNkZWZpbmUgX19wdWRfZnJlZV90bGIodGxiLCBwdWQsIGFkZHIpCQkJCQlcCj4gK2RvIHsJ
CQkJCQkJCQlcCj4gKwlpZiAocGd0YWJsZV9sNF9lbmFibGVkKSB7CQkJCQlcCj4gKwkJcGFnZXRh
YmxlX3B1ZF9kdG9yKHZpcnRfdG9fcHRkZXNjKHB1ZCkpOwkJXAo+ICsJCXRsYl9yZW1vdmVfcGFn
ZV9wdGRlc2MoKHRsYiksIHZpcnRfdG9fcHRkZXNjKHB1ZCkpOwlcCgoKVGhlIHNwZWNpZmljYXRp
b24gaW5kZWVkIHN0YXRlcyB0aGF0IGFuIHNmZW5jZS52bWEgbXVzdCBiZSBlbWl0dGVkIGFmdGVy
IAphIHBhZ2UgZGlyZWN0b3J5IG1vZGlmaWNhdGlvbi4gWW91ciBjaGFuZ2UgaXMgbm90IGVub3Vn
aCB0aG91Z2ggc2luY2UgCmV2ZW50dWFsbHkgdGxiX2ZsdXNoKCkgaXMgY2FsbGVkIGFuZCBpbiB0
aGlzIGZ1bmN0aW9uIHdlIHNob3VsZCBhZGQ6CgppZiAodGxiLT5mcmVlZF90YWJsZXMpCiDCoMKg
wqAgdGxiX2ZsdXNoX21tKCk7CgpvdGhlcndpc2Ugd2UgYXJlIG5vdCBndWFyYW50ZWVkIHRoYXQg
YSAiZ2xvYmFsIiBzZmVuY2Uudm1hIGlzIGNhbGxlZC4KCldvdWxkIHlvdSBiZSBhYmxlIHRvIGJl
bmNobWFyayB0aGlzIGNoYW5nZSBhbmQgc2VlIHRoZSBwZXJmb3JtYW5jZSBpbXBhY3Q/CgpUaGFu
a3MsCgpBbGV4CgoKPiArCX0JCQkJCQkJCVwKPiArfSB3aGlsZSAoMCkKPiAgIAo+ICAgI2RlZmlu
ZSBwNGRfYWxsb2Nfb25lIHA0ZF9hbGxvY19vbmUKPiAgIHN0YXRpYyBpbmxpbmUgcDRkX3QgKnA0
ZF9hbGxvY19vbmUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkcikKPiBA
QCAtMTI0LDcgKzEzMCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcDRkX2ZyZWUoc3RydWN0IG1t
X3N0cnVjdCAqbW0sIHA0ZF90ICpwNGQpCj4gICAJCV9fcDRkX2ZyZWUobW0sIHA0ZCk7Cj4gICB9
Cj4gICAKPiAtI2RlZmluZSBfX3A0ZF9mcmVlX3RsYih0bGIsIHA0ZCwgYWRkcikgIHA0ZF9mcmVl
KCh0bGIpLT5tbSwgcDRkKQo+ICsjZGVmaW5lIF9fcDRkX2ZyZWVfdGxiKHRsYiwgcDRkLCBhZGRy
KQkJCQkJXAo+ICtkbyB7CQkJCQkJCQkJXAo+ICsJaWYgKHBndGFibGVfbDVfZW5hYmxlZCkJCQkJ
CQlcCj4gKwkJdGxiX3JlbW92ZV9wYWdlX3B0ZGVzYygodGxiKSwgdmlydF90b19wdGRlc2MocDRk
KSk7CVwKPiArfSB3aGlsZSAoMCkKPiAgICNlbmRpZiAvKiBfX1BBR0VUQUJMRV9QTURfRk9MREVE
ICovCj4gICAKPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBzeW5jX2tlcm5lbF9tYXBwaW5ncyhwZ2Rf
dCAqcGdkKQo+IEBAIC0xNDksNyArMTU5LDExIEBAIHN0YXRpYyBpbmxpbmUgcGdkX3QgKnBnZF9h
bGxvYyhzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAgIAo+ICAgI2lmbmRlZiBfX1BBR0VUQUJMRV9Q
TURfRk9MREVECj4gICAKPiAtI2RlZmluZSBfX3BtZF9mcmVlX3RsYih0bGIsIHBtZCwgYWRkcikg
IHBtZF9mcmVlKCh0bGIpLT5tbSwgcG1kKQo+ICsjZGVmaW5lIF9fcG1kX2ZyZWVfdGxiKHRsYiwg
cG1kLCBhZGRyKQkJCQlcCj4gK2RvIHsJCQkJCQkJCVwKPiArCXBhZ2V0YWJsZV9wbWRfZHRvcih2
aXJ0X3RvX3B0ZGVzYyhwbWQpKTsJCVwKPiArCXRsYl9yZW1vdmVfcGFnZV9wdGRlc2MoKHRsYiks
IHZpcnRfdG9fcHRkZXNjKHBtZCkpOwlcCj4gK30gd2hpbGUgKDApCj4gICAKPiAgICNlbmRpZiAv
KiBfX1BBR0VUQUJMRV9QTURfRk9MREVEICovCj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
