Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A602C4828D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRCmylaZNORnuwti1XCwUGKC96D4WUcf/VoHDdkfvfo=; b=bzt+W/00tWczjl
	qxPQ/9GE4Vq3n1mKIgt2yaTuqJj2RtzoyT+szHQEDHak6q7Zzv2fsoB5hquafrifq0nroR8/cxALG
	UKBdAZRaO+j92JrKWJGyLZO+mCkasKabAYJZsAUZ8P17L4Nd5sFxe3ZCKI2lz4aO/+BV3wQShNVxq
	gU0Beq7m3I9s1O/+v/uqh3psWQRKxOtUekM0QGiDZ24h3cG/5QSUML+dB996y2pMruy6rx/XRjRLU
	p1DdMNiQTs6CFeO8R5L5utABGb+F4C00GtnoPZ+Ofwix9+g5c8skrUoMg+AB0VKG9r4yjxy/243KN
	iiGdXGMDYifud+PYUf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcLs-00000009wFt-0lAx;
	Wed, 07 Feb 2024 07:28:12 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXcLn-00000009wC1-45HA
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 07:28:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61C0D1BF204;
	Wed,  7 Feb 2024 07:28:01 +0000 (UTC)
Message-ID: <6d03704c-e0b3-40e8-a0b1-6ad357a775d1@ghiti.fr>
Date: Wed, 7 Feb 2024 08:28:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] riscv: tlb: fix __p*d_free_tlb()
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
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
 <08f55d3e-d68e-406a-9bc9-d62f3c86e949@ghiti.fr>
In-Reply-To: <08f55d3e-d68e-406a-9bc9-d62f3c86e949@ghiti.fr>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_232808_332249_6ABED558 
X-CRM114-Status: GOOD (  18.99  )
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

SGkgSmlzaGVuZywKCk9uIDMxLzEyLzIwMjMgMDc6MjEsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToK
PiBIaSBKaXNoZW5nLAo+Cj4gT24gMTkvMTIvMjAyMyAxODo1MCwgSmlzaGVuZyBaaGFuZyB3cm90
ZToKPj4gSWYgbm9uLWxlYWYgUFRFcyBJLkUgcG1kLCBwdWQgb3IgcDRkIGlzIG1vZGlmaWVkLCBh
IHNmZW5jZS52bWEgaXMKPj4gYSBtdXN0IGZvciBzYWZlLCBpbWFnaW5lIGlmIGFuIGltcGxlbWVu
dGF0aW9uIGNhY2hlcyB0aGUgbm9uLWxlYWYKPj4gdHJhbnNsYXRpb24gaW4gVExCLCBhbHRob3Vn
aCBJIGRpZG4ndCBtZWV0IHRoaXMgSFcgc28gZmFyLCBidXQgaXQncwo+PiBwb3NzaWJsZSBpbiB0
aGVvcnkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmc8anN6aGFuZ0BrZXJuZWwu
b3JnPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ2FsbG9jLmggfCAyMCAr
KysrKysrKysrKysrKysrKy0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGdhbGxvYy5oIAo+PiBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4+IGlu
ZGV4IGQxNjlhNGY0MWEyZS4uYTEyZmI4M2ZhMWY1IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BnYWxsb2MuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
YWxsb2MuaAo+PiBAQCAtOTUsNyArOTUsMTMgQEAgc3RhdGljIGlubGluZSB2b2lkIHB1ZF9mcmVl
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCAKPj4gcHVkX3QgKnB1ZCkKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIF9fcHVkX2ZyZWUobW0sIHB1ZCk7Cj4+IMKgIH0KPj4gwqAgLSNkZWZpbmUgX19wdWRfZnJl
ZV90bGIodGxiLCBwdWQsIGFkZHIpIHB1ZF9mcmVlKCh0bGIpLT5tbSwgcHVkKQo+PiArI2RlZmlu
ZSBfX3B1ZF9mcmVlX3RsYih0bGIsIHB1ZCwgYWRkcinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcCj4+ICtkbyB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAgaWYgKHBn
dGFibGVfbDRfZW5hYmxlZCkge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPj4gK8KgwqDCoMKgwqDCoMKgIHBhZ2V0YWJsZV9wdWRfZHRvcih2aXJ0X3RvX3B0ZGVzYyhw
dWQpKTvCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqDCoMKgwqDCoCB0bGJfcmVtb3ZlX3BhZ2Vf
cHRkZXNjKCh0bGIpLCB2aXJ0X3RvX3B0ZGVzYyhwdWQpKTsgXAo+Cj4KPiBUaGUgc3BlY2lmaWNh
dGlvbiBpbmRlZWQgc3RhdGVzIHRoYXQgYW4gc2ZlbmNlLnZtYSBtdXN0IGJlIGVtaXR0ZWQgCj4g
YWZ0ZXIgYSBwYWdlIGRpcmVjdG9yeSBtb2RpZmljYXRpb24uIFlvdXIgY2hhbmdlIGlzIG5vdCBl
bm91Z2ggdGhvdWdoIAo+IHNpbmNlIGV2ZW50dWFsbHkgdGxiX2ZsdXNoKCkgaXMgY2FsbGVkIGFu
ZCBpbiB0aGlzIGZ1bmN0aW9uIHdlIHNob3VsZCAKPiBhZGQ6Cj4KPiBpZiAodGxiLT5mcmVlZF90
YWJsZXMpCj4gwqDCoMKgIHRsYl9mbHVzaF9tbSgpOwoKCkkgc2VudCBhIHBhdGNoIGZvciB0aGF0
IGhlcmUgCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwMTI4MTIwNDA1
LjI1ODc2LTEtYWxleGdoaXRpQHJpdm9zaW5jLmNvbS8KCllvdSBjYW4gYWRkOgoKUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkFs
ZXgKCgo+Cj4gb3RoZXJ3aXNlIHdlIGFyZSBub3QgZ3VhcmFudGVlZCB0aGF0IGEgImdsb2JhbCIg
c2ZlbmNlLnZtYSBpcyBjYWxsZWQuCj4KPiBXb3VsZCB5b3UgYmUgYWJsZSB0byBiZW5jaG1hcmsg
dGhpcyBjaGFuZ2UgYW5kIHNlZSB0aGUgcGVyZm9ybWFuY2UgCj4gaW1wYWN0Pwo+Cj4gVGhhbmtz
LAo+Cj4gQWxleAo+Cj4KPj4gK8KgwqDCoCB9wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArfSB3aGlsZSAoMCkKPj4gwqAg
wqAgI2RlZmluZSBwNGRfYWxsb2Nfb25lIHA0ZF9hbGxvY19vbmUKPj4gwqAgc3RhdGljIGlubGlu
ZSBwNGRfdCAqcDRkX2FsbG9jX29uZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgCj4+
IGxvbmcgYWRkcikKPj4gQEAgLTEyNCw3ICsxMzAsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHA0
ZF9mcmVlKHN0cnVjdCBtbV9zdHJ1Y3QgCj4+ICptbSwgcDRkX3QgKnA0ZCkKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIF9fcDRkX2ZyZWUobW0sIHA0ZCk7Cj4+IMKgIH0KPj4gwqAgLSNkZWZpbmUgX19w
NGRfZnJlZV90bGIodGxiLCBwNGQsIGFkZHIpIHA0ZF9mcmVlKCh0bGIpLT5tbSwgcDRkKQo+PiAr
I2RlZmluZSBfX3A0ZF9mcmVlX3RsYih0bGIsIHA0ZCwgYWRkcinCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICtkbyB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAg
aWYgKHBndGFibGVfbDVfZW5hYmxlZCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDCoMKgIHRsYl9yZW1vdmVfcGFnZV9wdGRlc2Mo
KHRsYiksIHZpcnRfdG9fcHRkZXNjKHA0ZCkpOyBcCj4+ICt9IHdoaWxlICgwKQo+PiDCoCAjZW5k
aWYgLyogX19QQUdFVEFCTEVfUE1EX0ZPTERFRCAqLwo+PiDCoCDCoCBzdGF0aWMgaW5saW5lIHZv
aWQgc3luY19rZXJuZWxfbWFwcGluZ3MocGdkX3QgKnBnZCkKPj4gQEAgLTE0OSw3ICsxNTksMTEg
QEAgc3RhdGljIGlubGluZSBwZ2RfdCAqcGdkX2FsbG9jKHN0cnVjdCBtbV9zdHJ1Y3QgCj4+ICpt
bSkKPj4gwqAgwqAgI2lmbmRlZiBfX1BBR0VUQUJMRV9QTURfRk9MREVECj4+IMKgIC0jZGVmaW5l
IF9fcG1kX2ZyZWVfdGxiKHRsYiwgcG1kLCBhZGRyKSBwbWRfZnJlZSgodGxiKS0+bW0sIHBtZCkK
Pj4gKyNkZWZpbmUgX19wbWRfZnJlZV90bGIodGxiLCBwbWQsIGFkZHIpwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFwKPj4gK2RvIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAgcGFnZXRhYmxlX3Bt
ZF9kdG9yKHZpcnRfdG9fcHRkZXNjKHBtZCkpO8KgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoCB0
bGJfcmVtb3ZlX3BhZ2VfcHRkZXNjKCh0bGIpLCB2aXJ0X3RvX3B0ZGVzYyhwbWQpKTvCoMKgwqAg
XAo+PiArfSB3aGlsZSAoMCkKPj4gwqAgwqAgI2VuZGlmIC8qIF9fUEFHRVRBQkxFX1BNRF9GT0xE
RUQgKi8KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
