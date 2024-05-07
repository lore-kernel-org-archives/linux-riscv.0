Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B62C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 03:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WWp6G3wKVA65cVcCNFWv2lbXnXY24noGi72QnSRgK0=; b=YU28n/mxSddsUM
	rry5r6SGhpsNv9UaW48Vq9bvZNDaYjdVxcfOUDF23C6CVfdw6YIE9dMvKOf4dk00O8E6kllLl6Lvp
	lN/qVdBXNMlji22/c/6YoBrWzWB6MfdhS0iabmrQIype4l9sae+tKocjqDv3twrSssGwXGL4DPcKU
	ZQBT/o2qah+huFUfCFzfTRb4YSavPvSgNGQvHDI6edQhui2bs3DZEYJdW/WLzymC6xIRoDUCZQIdE
	CTKGEdMMMYfQcNdslnGstDgFYb1nFeSGe1c9iAqtDbishGmkXuAdh107UVzhJZ4MsOAbjQDJ68MAG
	M6Mz/wXn8qUqp92j88GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4BTP-00000009SjU-3sXy;
	Tue, 07 May 2024 03:26:35 +0000
Received: from out0-210.mail.aliyun.com ([140.205.0.210])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4BTL-00000009Shn-1Kqb
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 03:26:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1715052386; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=5G08kj7fI6VhU0nVl7AlR+J897u+++S/y5nHUajrQj8=;
	b=yXxnxGfTQUa/oUssf6Xo6mzZt0KSnn0ynhv7zAzfvaTGJUYjQlO/yoEte98vNourqNzqa1GM4rhbJKmD15VvT93ZeohCXMAfDbFRcspB8aXUowdZPZ68mftNoaYh98ALliN4i/OKqJZQG6VRsdAms8Dd7qmhf3hIDDnB7sjKmlo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047187;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---.XU6c0Rr_1715052381;
Received: from 30.230.85.161(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XU6c0Rr_1715052381)
          by smtp.aliyun-inc.com;
          Tue, 07 May 2024 11:26:22 +0800
Message-ID: <9d251090-ed68-49a2-9e94-7347b71367b3@antgroup.com>
Date: Tue, 07 May 2024 11:26:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] mm: Add update_mmu_tlb_range()
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, chenhuacai@kernel.org,
 tsbogend@alpha.franken.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 chris@zankel.net, jcmvbkbc@gmail.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, david@redhat.com, ryan.roberts@arm.com,
 libang.linux@gmail.com
References: <20240506155120.83105-1-libang.li@antgroup.com>
 <20240506155120.83105-6-libang.li@antgroup.com>
 <CAK1f24nX6mvLXiXNJUQWSKKUQ-Avhs0_NU1k8JBhVupOr3W6Mg@mail.gmail.com>
Content-Language: en-US
From: "Bang Li" <libang.li@antgroup.com>
In-Reply-To: <CAK1f24nX6mvLXiXNJUQWSKKUQ-Avhs0_NU1k8JBhVupOr3W6Mg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_202631_547201_D3C135EB 
X-CRM114-Status: GOOD (  17.02  )
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

SGV5IExhbmNlLAoKVGhhbmtzIGZvciB0YWtpbmcgdGltZSB0byByZXZpZXchCgpPbiAyMDI0LzUv
NyAwOjA3LCBMYW5jZSBZYW5nIHdyb3RlOgo+IE9uIE1vbiwgTWF5IDYsIDIwMjQgYXQgMTE6NTLi
gK9QTSBCYW5nIExpIDxsaWJhbmcubGlAYW50Z3JvdXAuY29tPiB3cm90ZToKPj4KPj4gQWZ0ZXIg
dGhlIGNvbW1pdCAxOWVhZjQ0OTU0ZGYgKCJtbTogdGhwOiBzdXBwb3J0IGFsbG9jYXRpb24gb2Yg
YW5vbnltb3VzCj4+IG11bHRpLXNpemUgVEhQIiksIGl0IG1heSBuZWVkIHRvIGJhdGNoIHVwZGF0
ZSB0bGIgb2YgYW4gYWRkcmVzcyByYW5nZQo+PiB0aHJvdWdoIHRoZSB1cGRhdGVfbW11X3RsYiBm
dW5jdGlvbi4gV2UgY2FuIHNpbXBsaWZ5IHRoaXMgb3BlcmF0aW9uIGJ5Cj4+IGFkZGluZyB0aGUg
dXBkYXRlX21tdV90bGJfcmFuZ2UgZnVuY3Rpb24sIHdoaWNoIG1heSBhbHNvIHJlZHVjZSB0aGUK
Pj4gZXhlY3V0aW9uIG9mIHNvbWUgdW5uZWNlc3NhcnkgY29kZSBpbiBzb21lIGFyY2hpdGVjdHVy
ZXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJhbmcgTGkgPGxpYmFuZy5saUBhbnRncm91cC5jb20+
Cj4+IC0tLQo+PiAgIGluY2x1ZGUvbGludXgvcGd0YWJsZS5oIHwgOCArKysrKysrKwo+PiAgIG1t
L21lbW9yeS5jICAgICAgICAgICAgIHwgNCArLS0tCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L3BndGFibGUuaCBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oCj4+IGluZGV4IDE4MDE5ZjAz
N2JhZS4uODY5YmZlNjA1NGYxIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BndGFibGUu
aAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L3BndGFibGUuaAo+PiBAQCAtNzM3LDYgKzczNywxNCBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV90bGIoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsCj4+ICAgI2RlZmluZSBfX0hBVkVfQVJDSF9VUERBVEVfTU1VX1RMQgo+PiAgICNlbmRp
Zgo+Pgo+PiArI2lmbmRlZiBfX0hBVkVfQVJDSF9VUERBVEVfTU1VX1RMQl9SQU5HRQo+IAo+IElJ
UkMsIHRoZSBjb250ZW1wb3JhcnkgcHJhY3RpY2UgaXMgdG8gZGVmaW5lIGEgbWFjcm8gd2l0aCB0
aGUgc2FtZSBuYW1lCj4gYXMgdGhlIGZ1bmN0aW9uIGlmIGl0IGlzIGJlaW5nIG92ZXJyaWRkZW4u
CgpUaGUgbWFjcm8gX19IQVZFX0FSQ0hfVVBEQVRFX01NVV9UTEJfUkFOR0UgZGVmaW5lZCBoZXJl
IGlzIGFsaWduZWQgd2l0aAp0aGUgbWFjcm8gX19IQVZFX0FSQ0hfVVBEQVRFX01NVV9UTEIgY29y
cmVzcG9uZGluZyB0byB0aGUgdXBkYXRlX21tdV90bGIKZnVuY3Rpb24uIElNTywgaXQgc2hvdWxk
IGJlIGJldHRlciB0byB1c2UgbXkgbWV0aG9kIGluIHRoaXMgY2FzZS4KClRoYW5rcywKQmFuZwoK
PiAKPiBUaGFua3MsCj4gTGFuY2UKPiAKPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11
X3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHB0ZV90ICpwdGVwLCB1bnNp
Z25lZCBpbnQgbnIpCj4+ICt7Cj4+ICt9Cj4+ICsjZGVmaW5lIF9fSEFWRV9BUkNIX1VQREFURV9N
TVVfVExCX1JBTkdFCj4+ICsjZW5kaWYKPj4gKwo+PiAgIC8qCj4+ICAgICogU29tZSBhcmNoaXRl
Y3R1cmVzIG1heSBiZSBhYmxlIHRvIGF2b2lkIGV4cGVuc2l2ZSBzeW5jaHJvbml6YXRpb24KPj4g
ICAgKiBwcmltaXRpdmVzIHdoZW4gbW9kaWZpY2F0aW9ucyBhcmUgbWFkZSB0byBQVEUncyB3aGlj
aCBhcmUgYWxyZWFkeQo+PiBkaWZmIC0tZ2l0IGEvbW0vbWVtb3J5LmMgYi9tbS9tZW1vcnkuYwo+
PiBpbmRleCBlZWE2ZTQ5ODRlYWUuLjJkNTNlMjljZjc2ZSAxMDA2NDQKPj4gLS0tIGEvbW0vbWVt
b3J5LmMKPj4gKysrIGIvbW0vbWVtb3J5LmMKPj4gQEAgLTQ0MjEsNyArNDQyMSw2IEBAIHN0YXRp
YyB2bV9mYXVsdF90IGRvX2Fub255bW91c19wYWdlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+PiAg
ICAgICAgICB2bV9mYXVsdF90IHJldCA9IDA7Cj4+ICAgICAgICAgIGludCBucl9wYWdlcyA9IDE7
Cj4+ICAgICAgICAgIHB0ZV90IGVudHJ5Owo+PiAtICAgICAgIGludCBpOwo+Pgo+PiAgICAgICAg
ICAvKiBGaWxlIG1hcHBpbmcgd2l0aG91dCAtPnZtX29wcyA/ICovCj4+ICAgICAgICAgIGlmICh2
bWEtPnZtX2ZsYWdzICYgVk1fU0hBUkVEKQo+PiBAQCAtNDQ5MSw4ICs0NDkwLDcgQEAgc3RhdGlj
IHZtX2ZhdWx0X3QgZG9fYW5vbnltb3VzX3BhZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4+ICAg
ICAgICAgICAgICAgICAgdXBkYXRlX21tdV90bGIodm1hLCBhZGRyLCB2bWYtPnB0ZSk7Cj4+ICAg
ICAgICAgICAgICAgICAgZ290byByZWxlYXNlOwo+PiAgICAgICAgICB9IGVsc2UgaWYgKG5yX3Bh
Z2VzID4gMSAmJiAhcHRlX3JhbmdlX25vbmUodm1mLT5wdGUsIG5yX3BhZ2VzKSkgewo+PiAtICAg
ICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspCj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgIHVwZGF0ZV9tbXVfdGxiKHZtYSwgYWRkciArIFBBR0VfU0laRSAqIGksIHZt
Zi0+cHRlICsgaSk7Cj4+ICsgICAgICAgICAgICAgICB1cGRhdGVfbW11X3RsYl9yYW5nZSh2bWEs
IGFkZHIsIHZtZi0+cHRlLCBucl9wYWdlcyk7Cj4+ICAgICAgICAgICAgICAgICAgZ290byByZWxl
YXNlOwo+PiAgICAgICAgICB9Cj4+Cj4+IC0tCj4+IDIuMTkuMS42LmdiNDg1NzEwYgo+PgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
