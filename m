Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1653DC25B4F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 16:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIkIYR7M8OdCiVbFJP3T3YLM+p0bjLTPkHX1yGypkoc=; b=l7I4dvBTR2VxmN
	10119MmBVmCeIK0pmnqoE5BzPtYuRQsovbcL8XTwJ3bIq1WEODUbcIE9R305mImWbULaw+m2z+SCr
	xfqV4okF+R2a3PigN0ji6MLoV4PPoenqW4vLzKOnNG/QJdVbfrUK1uNyxE5r168BWNxrCGtjXCRv+
	WA2BiWcZ8g2w3KkfbPN8gRGdmcR2HbkXn8fZHv1Qc980/AP5a2eFXC3oFyX2o4tGa8jLzNbFMNuH2
	X0u5P2BY+u4uIbyOdrPJQlvBivFFLEp7zRPtlVgcakSns0JhuRO8RXvKtKIsF9tepkYOHzz+w0FoJ
	kH2N2eDEuphs9c7ddXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5TEp-00000005tbO-3Qc9;
	Fri, 10 May 2024 16:36:51 +0000
Received: from out0-205.mail.aliyun.com ([140.205.0.205])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5TEk-00000005tXk-3PYw
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 16:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1715359001; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=qtTzD4p4/mI5FQfHMAQ4AseA2ZJSqFbFGgw9hxpmGnA=;
	b=k5Df+2z6wUSf1COeQsfruH2ujE2DY+OFJrtXHn9EHT82+BhC6WrztA8p/rN5nUeIWMoncVmi8c0y4ms/EYoBfJt8+HvEVVcmzlWvnegqo3TJi1D09J9rjHbBdSe6gU97DBKmiKV82tUsOmBNDXnYG4Qgz4iNRUwOXaPH+Q6gZGk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047212;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XYAMMf6_1715358997;
Received: from 30.39.184.43(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XYAMMf6_1715358997)
          by smtp.aliyun-inc.com;
          Sat, 11 May 2024 00:36:38 +0800
Message-ID: <41acfd35-69b4-41bc-a45b-4426d5110077@antgroup.com>
Date: Sat, 11 May 2024 00:36:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] mm: Add update_mmu_tlb_range()
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 david@redhat.com, ioworker0@gmail.com, libang.linux@gmail.com,
 baolin.wang@linux.alibaba.com
References: <20240506155120.83105-1-libang.li@antgroup.com>
 <20240506155120.83105-6-libang.li@antgroup.com>
 <eb41fcb3-7207-40a8-9b49-0825a2e74e86@arm.com>
Content-Language: en-US
From: "Bang Li" <libang.li@antgroup.com>
In-Reply-To: <eb41fcb3-7207-40a8-9b49-0825a2e74e86@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_093647_530214_478D990A 
X-CRM114-Status: GOOD (  21.22  )
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

SGkgUnlhbiwKClRoYW5rcyBmb3IgeW91IHJldmlldyEKCk9uIDIwMjQvNS8xMCAxNzowNSwgUnlh
biBSb2JlcnRzIHdyb3RlOgo+IE9uIDA2LzA1LzIwMjQgMTY6NTEsIEJhbmcgTGkgd3JvdGU6Cj4+
IEFmdGVyIHRoZSBjb21taXQgMTllYWY0NDk1NGRmICgibW06IHRocDogc3VwcG9ydCBhbGxvY2F0
aW9uIG9mIGFub255bW91cwo+PiBtdWx0aS1zaXplIFRIUCIpLCBpdCBtYXkgbmVlZCB0byBiYXRj
aCB1cGRhdGUgdGxiIG9mIGFuIGFkZHJlc3MgcmFuZ2UKPj4gdGhyb3VnaCB0aGUgdXBkYXRlX21t
dV90bGIgZnVuY3Rpb24uIFdlIGNhbiBzaW1wbGlmeSB0aGlzIG9wZXJhdGlvbiBieQo+PiBhZGRp
bmcgdGhlIHVwZGF0ZV9tbXVfdGxiX3JhbmdlIGZ1bmN0aW9uLCB3aGljaCBtYXkgYWxzbyByZWR1
Y2UgdGhlCj4+IGV4ZWN1dGlvbiBvZiBzb21lIHVubmVjZXNzYXJ5IGNvZGUgaW4gc29tZSBhcmNo
aXRlY3R1cmVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBCYW5nIExpIDxsaWJhbmcubGlAYW50Z3Jv
dXAuY29tPgo+PiAtLS0KPj4gICBpbmNsdWRlL2xpbnV4L3BndGFibGUuaCB8IDggKysrKysrKysK
Pj4gICBtbS9tZW1vcnkuYyAgICAgICAgICAgICB8IDQgKy0tLQo+PiAgIDIgZmlsZXMgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9wZ3RhYmxlLmggYi9pbmNsdWRlL2xpbnV4L3BndGFibGUuaAo+PiBpbmRleCAx
ODAxOWYwMzdiYWUuLjg2OWJmZTYwNTRmMSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9w
Z3RhYmxlLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgKPj4gQEAgLTczNyw2ICs3
MzcsMTQgQEAgc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfdGxiKHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hLAo+PiAgICNkZWZpbmUgX19IQVZFX0FSQ0hfVVBEQVRFX01NVV9UTEIKPj4g
ICAjZW5kaWYKPiAKPiBHaXZlbiB5b3UgYXJlIGltcGxlbWVudGluZyB1cGRhdGVfbW11X3RsYl9y
YW5nZSgpIGluIGFsbCB0aGUgYXJjaGVzIHRoYXQKPiBjdXJyZW50bHkgb3ZlcnJpZGUgdXBkYXRl
X21tdV90bGIoKSBJIHdvbmRlciBpZiBpdCB3b3VsZCBiZSBjbGVhbmVyIHRvIHJlbW92ZQo+IHVw
ZGF0ZV9tbXVfdGxiKCkgZnJvbSBhbGwgdGhvc2UgYXJjaGVzLCBhbmQgZGVmaW5lIGdlbmVyaWNh
bGx5LCByZW1vdmluZyB0aGUKPiBhYmlsaXR5IGZvciBhcmNoZXMgdG8gb3ZlcnJpZGUgaXQ6Cj4g
Cj4gc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfdGxiKHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLAo+IAkJCQl1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHB0ZV90ICpwdGVwKQo+IHsKPiAJ
dXBkYXRlX21tdV90bGJfcmFuZ2Uodm1hLCBhZGRyZXNzLCBwdGVwLCAxKTsKPiB9CgpBZ3JlZWQh
IFRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9uLCBJIHdpbGwgbW9kaWZ5IGl0IGluIHRoZSBu
ZXh0IHZlcnNpb24uCgo+IAo+PiAgIAo+PiArI2lmbmRlZiBfX0hBVkVfQVJDSF9VUERBVEVfTU1V
X1RMQl9SQU5HRQo+PiArc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfdGxiX3JhbmdlKHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+PiArCQkJCXVuc2lnbmVkIGxvbmcgYWRkcmVzcywg
cHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGludCBucikKPj4gK3sKPj4gK30KPj4gKyNkZWZpbmUgX19I
QVZFX0FSQ0hfVVBEQVRFX01NVV9UTEJfUkFOR0UKPj4gKyNlbmRpZgo+IAo+IFRoZW4geW91IGNv
dWxkIHVzZSB0aGUgbW9kZXJuIG92ZXJyaWRlIHNjaGVtZSBhcyBMYW5jZSBzdWdnZXN0ZWQgYW5k
IHlvdSB3b24ndAo+IGhhdmUgYW55IGNvbmZ1c2lvbiB3aXRoIF9fSEFWRV9BUkNIX1VQREFURV9N
TVVfVExCIGJlY2F1c2UgaXQgd29uJ3QgZXhpc3QgYW55bW9yZS4KClllcywgdXNlIHVwZGF0ZV9t
bXVfdGxiX3JhbmdlIHRvIGltcGxlbWVudCB1cGRhdGVfbW11X3RsYiwgd2Ugb25seSBuZWVkIAp0
byBkZWZpbmUgdGhlIHVwZGF0ZV9tbXVfdGxiX3JhbmdlIG1hY3JvLgoKPiAKPj4gKwo+PiAgIC8q
Cj4+ICAgICogU29tZSBhcmNoaXRlY3R1cmVzIG1heSBiZSBhYmxlIHRvIGF2b2lkIGV4cGVuc2l2
ZSBzeW5jaHJvbml6YXRpb24KPj4gICAgKiBwcmltaXRpdmVzIHdoZW4gbW9kaWZpY2F0aW9ucyBh
cmUgbWFkZSB0byBQVEUncyB3aGljaCBhcmUgYWxyZWFkeQo+PiBkaWZmIC0tZ2l0IGEvbW0vbWVt
b3J5LmMgYi9tbS9tZW1vcnkuYwo+PiBpbmRleCBlZWE2ZTQ5ODRlYWUuLjJkNTNlMjljZjc2ZSAx
MDA2NDQKPj4gLS0tIGEvbW0vbWVtb3J5LmMKPj4gKysrIGIvbW0vbWVtb3J5LmMKPj4gQEAgLTQ0
MjEsNyArNDQyMSw2IEBAIHN0YXRpYyB2bV9mYXVsdF90IGRvX2Fub255bW91c19wYWdlKHN0cnVj
dCB2bV9mYXVsdCAqdm1mKQo+PiAgIAl2bV9mYXVsdF90IHJldCA9IDA7Cj4+ICAgCWludCBucl9w
YWdlcyA9IDE7Cj4+ICAgCXB0ZV90IGVudHJ5Owo+PiAtCWludCBpOwo+PiAgIAo+PiAgIAkvKiBG
aWxlIG1hcHBpbmcgd2l0aG91dCAtPnZtX29wcyA/ICovCj4+ICAgCWlmICh2bWEtPnZtX2ZsYWdz
ICYgVk1fU0hBUkVEKQo+PiBAQCAtNDQ5MSw4ICs0NDkwLDcgQEAgc3RhdGljIHZtX2ZhdWx0X3Qg
ZG9fYW5vbnltb3VzX3BhZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4+ICAgCQl1cGRhdGVfbW11
X3RsYih2bWEsIGFkZHIsIHZtZi0+cHRlKTsKPj4gICAJCWdvdG8gcmVsZWFzZTsKPj4gICAJfSBl
bHNlIGlmIChucl9wYWdlcyA+IDEgJiYgIXB0ZV9yYW5nZV9ub25lKHZtZi0+cHRlLCBucl9wYWdl
cykpIHsKPj4gLQkJZm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspCj4+IC0JCQl1cGRhdGVf
bW11X3RsYih2bWEsIGFkZHIgKyBQQUdFX1NJWkUgKiBpLCB2bWYtPnB0ZSArIGkpOwo+PiArCQl1
cGRhdGVfbW11X3RsYl9yYW5nZSh2bWEsIGFkZHIsIHZtZi0+cHRlLCBucl9wYWdlcyk7Cj4gCj4g
SSBjZXJ0YWlubHkgYWdyZWUgdGhhdCB0aGlzIHdpbGwgYmUgYSB1c2VmdWwgaGVscGVyIHRvIGhh
dmUuIEkgZXhwZWN0IHRoZXJlIHdpbGwKPiBiZSBtb3JlIHVzZXJzIGluIGZ1dHVyZS4KClRoYW5r
IHlvdSBmb3IgeW91ciBhZmZpcm1hdGlvbi4gQmFvbGlu4oCZcyAiYWRkIG1USFAgc3VwcG9ydCBm
b3IgYW5vbnltb3VzIApzaG1lbSIgc2VyaWVzWzFdIGNhbiBhbHNvIHVzZSB0aGlzIGZ1bmN0aW9u
IHRvIHNpbXBsaWZ5IHRoZSBjb2RlLgoKWzFdIApodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1tbS9jb3Zlci4xNzE0OTc4OTAyLmdpdC5iYW9saW4ud2FuZ0BsaW51eC5hbGliYWJhLmNvbS8K
ClRoYW5rcywKQmFuZwoKPiAKPj4gICAJCWdvdG8gcmVsZWFzZTsKPj4gICAJfQo+PiAgIAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
