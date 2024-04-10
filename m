Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB17FCD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oO93C+nTv92cfaqlBUazYpS19UsfxZhU6vAWvrJQvGE=; b=tMQqsBKvkt5q1V
	F9EXDfWR1y+nwIOo3o1tCMv8d9mBb4NVE3qrMdx3VGMEP/dkWkjjKpUA772ztuf+BwVVUNDng/S3V
	x6X49Xyq6y2Lv7RzTGNRKm3WOUBiU/jA3zuzZKX2O4hWNUIuxBl84jz0Zo3jX5xfUsaAp30G8zApB
	iutI3nr8w1y6W2Uf9TQxAehIF0Pz/mEMLDF+Le1l6UYXlgoa+3w3POjbQXiheHR7G/eGvTcrjJUCW
	xGhNoBWOtmXkt8s69lqZDnJTheZuqi/MO+HtYvWb2Yag+M55QD5LFZ8GuU2FEGpljZrp/VB/Cn3Wr
	vY/DuyeyjhPi4w7srprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubkg-00000008G5l-42ek;
	Wed, 10 Apr 2024 17:28:50 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubkc-00000008G16-0gzq;
	Wed, 10 Apr 2024 17:28:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 376E7C0004;
	Wed, 10 Apr 2024 17:28:36 +0000 (UTC)
Message-ID: <3493a2f4-9cae-4773-a6a1-2eeb2d23f0c8@ghiti.fr>
Date: Wed, 10 Apr 2024 19:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] riscv: mm: accelerate pagefault when badaccess
Content-Language: en-US
To: Kefeng Wang <wangkefeng.wang@huawei.com>, akpm@linux-foundation.org
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 surenb@google.com, linux-mm@kvack.org
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
 <20240403083805.1818160-6-wangkefeng.wang@huawei.com>
 <8fe1a53f-f031-4423-97e1-28d93d0cd59e@ghiti.fr>
 <ac978061-ce1a-40a4-8b0a-61883b42bea7@huawei.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ac978061-ce1a-40a4-8b0a-61883b42bea7@huawei.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_102846_632405_A56FC46B 
X-CRM114-Status: GOOD (  20.43  )
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

T24gMTAvMDQvMjAyNCAxMDowNywgS2VmZW5nIFdhbmcgd3JvdGU6Cj4KPgo+IE9uIDIwMjQvNC8x
MCAxNTozMiwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+PiBIaSBLZWZlbmcsCj4+Cj4+IE9uIDAz
LzA0LzIwMjQgMTA6MzgsIEtlZmVuZyBXYW5nIHdyb3RlOgo+Pj4gVGhlIGFjY2Vzc19lcnJvcigp
IG9mIHZtYSBhbHJlYWR5IGNoZWNrZWQgdW5kZXIgcGVyLVZNQSBsb2NrLCBpZiBpdAo+Pj4gaXMg
YSBiYWQgYWNjZXNzLCBkaXJlY3RseSBoYW5kbGUgZXJyb3IsIG5vIG5lZWQgdG8gcmV0cnkgd2l0
aCBtbWFwX2xvY2sKPj4+IGFnYWluLiBTaW5jZSB0aGUgcGFnZSBmYXV0IGlzIGhhbmRsZWQgdW5k
ZXIgcGVyLVZNQSBsb2NrLCBjb3VudCBpdCBhcwo+Pj4gYSB2bWEgbG9jayBldmVudCB3aXRoIFZN
QV9MT0NLX1NVQ0NFU1MuCj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8
c3VyZW5iQGdvb2dsZS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2FuZyA8d2FuZ2tl
ZmVuZy53YW5nQGh1YXdlaS5jb20+Cj4+PiAtLS0KPj4+IMKgIGFyY2gvcmlzY3YvbW0vZmF1bHQu
YyB8IDUgKysrKy0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9mYXVsdC5jIGIvYXJj
aC9yaXNjdi9tbS9mYXVsdC5jCj4+PiBpbmRleCAzYmExZDRkZGU1ZGQuLmIzZmNmN2Q2N2VmYiAx
MDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+Pj4gKysrIGIvYXJjaC9yaXNj
di9tbS9mYXVsdC5jCj4+PiBAQCAtMjkyLDcgKzI5MiwxMCBAQCB2b2lkIGhhbmRsZV9wYWdlX2Zh
dWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Pj4gwqDCoMKgwqDCoCBpZiAodW5saWtlbHkoYWNj
ZXNzX2Vycm9yKGNhdXNlLCB2bWEpKSkgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHZtYV9lbmRf
cmVhZCh2bWEpOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIGdvdG8gbG9ja19tbWFwOwo+Pj4gK8KgwqDC
oMKgwqDCoMKgIGNvdW50X3ZtX3ZtYV9sb2NrX2V2ZW50KFZNQV9MT0NLX1NVQ0NFU1MpOwo+Pj4g
K8KgwqDCoMKgwqDCoMKgIHRzay0+dGhyZWFkLmJhZF9jYXVzZSA9IFNFR1ZfQUNDRVJSOwo+Pgo+
Pgo+PiBJIHRoaW5rIHdlIHNob3VsZCB1c2UgdGhlIGNhdXNlIHZhcmlhYmxlIGhlcmUgaW5zdGVh
ZCBvZiBTRUdWX0FDQ0VSUiwgCj4+IGFzIGJhZF9jYXVzZSBpcyBhIHJpc2N2IGludGVybmFsIHN0
YXR1cyB3aGljaCBkZXNjcmliZXMgdGhlIHJlYWwgCj4+IGZhdWx0IHRoYXQgaGFwcGVuZWQuCj4K
PiBPaCwgSSBzZWUsIGl0IGlzIGV4Y2VwdGlvbiBjYXVzZXMgb24gcmlzY3YsIHNvIGl0IHNob3Vs
ZCBiZQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYyBiL2FyY2gvcmlzY3Yv
bW0vZmF1bHQuYwo+IGluZGV4IGIzZmNmN2Q2N2VmYi4uNTIyNGYzNzMzODAyIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+
IEBAIC0yOTMsOCArMjkzLDggQEAgdm9pZCBoYW5kbGVfcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVn
cyAqcmVncykKPiDCoMKgwqDCoMKgwqDCoCBpZiAodW5saWtlbHkoYWNjZXNzX2Vycm9yKGNhdXNl
LCB2bWEpKSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2bWFfZW5kX3JlYWQo
dm1hKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY291bnRfdm1fdm1hX2xvY2tf
ZXZlbnQoVk1BX0xPQ0tfU1VDQ0VTUyk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dHNrLT50aHJlYWQuYmFkX2NhdXNlID0gU0VHVl9BQ0NFUlI7Cj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYmFkX2FyZWFfbm9zZW1hcGhvcmUocmVncywgY29kZSwgYWRkcik7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHNrLT50aHJlYWQuYmFkX2NhdXNlID0gY2F1c2U7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmFkX2FyZWFfbm9zZW1hcGhvcmUocmVn
cywgU0VHVl9BQ0NFUlIsIGFkZHIpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm47Cj4gwqDCoMKgwqDCoMKgwqAgfQo+Cj4gSGkgQWxleCwgY291bGQgeW91IGhlbHAgdG8g
Y2hlY2sgaXQ/Cj4KPiBIaSBBbmRyZXcsIHBsZWFzZSBoZWxwIHRvIHNxdWFzaCBpdCBhZnRlciBB
bGV4IGFjayBpdC4KPgo+IFRoYW5rcyBib3RoLgoKClNvIEkgaGF2ZSBqdXN0IHRlc3RlZCBLZWZl
bmcncyBmaXh1cCBvbiBteSB1c3VhbCBDSSBhbmQgd2l0aCBhIHNpbXBsZSAKcHJvZ3JhbSB0aGF0
IHRyaWdnZXJzIHN1Y2ggYmFkIGFjY2VzcywgZXZlcnl0aGluZyB3ZW50IGZpbmUgc28gd2l0aCB0
aGUgCmZpeHVwIGFwcGxpZWQ6CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPgpUZXN0ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4KClRoYW5rcywKCkFsZXgKCgoKPgo+Cj4+Cj4+IFRoYW5rcywKPj4KPj4gQWxl
eAo+Pgo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGJhZF9hcmVhX25vc2VtYXBob3JlKHJlZ3MsIGNv
ZGUsIGFkZHIpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4+IMKgwqDCoMKgwqAgfQo+
Pj4gwqDCoMKgwqDCoCBmYXVsdCA9IGhhbmRsZV9tbV9mYXVsdCh2bWEsIGFkZHIsIGZsYWdzIHwg
Cj4+PiBGQVVMVF9GTEFHX1ZNQV9MT0NLLCByZWdzKTsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
