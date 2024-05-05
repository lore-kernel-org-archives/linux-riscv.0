Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469A0C4345F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 May 2024 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+vzEunSA+wKR7A2XPyHMkuJXK73jQ0pqm2K0t9CDzM=; b=OcZvRm1xRhUx9l
	gjZW6k2dcqO9gXKL9ghbFurFBTi/JnlpWm8uO92uxIvqy8KTD59/21Ya9b8WSlgvFzo2DWFkcovp4
	FE8SQqXb4z6JxNoLHe99JcElEW3k3LgBjVj73iCdv3w+GH30ZhWINKpaYZwDy+Ye0G9x7TiIgs3sj
	uCaU7YjEzwEi31nG3E6yvN5kOUPbeZkwhg2us5sL6XqzwEAyYQXQ05meEniljenOGHye7Oxa5Snb2
	AmkJctEg7ab2eNU5fcnkvzkajurIbRRP8PNn6G51Ka0vEGBxnbYWj8JZjNJMa3SIFyHvjRs1mRrC6
	Ft6mypo5bRDJZ+JZTlFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3csx-00000004V2h-23BE;
	Sun, 05 May 2024 14:30:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3csw-00000004V0f-02ez
	for linux-riscv@bombadil.infradead.org;
	Sun, 05 May 2024 14:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yUcsdhnPhmEHzxVOANaSCTb2AazIh17RKQgQDGLXMqg=; b=aXrXAokHglBpsGjIhOYwjxyaXr
	BD9e9Mf1KuXnT04UeCE6e/OjWUh/sFuFg5oQqqrFsKY6ELZBDkyjo+GkhvbpQMpvCEUmFdJ4bWyRX
	eW8PpKBuFuSouhVUSuZb8E8oOO7pC/LZG4AkgWnOz88jplegQAnBrpkfYZTZOl8gPO986ywzKgjWp
	2HwwErLQuqSG8qcznOl3XSfBlZ8WbFBvH7Ntjowv+duXUMvdafTPBNYMcotP4UYku24TjADsLDpqa
	IcVKCo1TEQ1J3B15c786hz9YuMk20v71Pon/KBL2qAPpwkI+aXx9qAqA16AwUiTHRLv/cyhIlWNjk
	2riW6dyg==;
Received: from out0-209.mail.aliyun.com ([140.205.0.209])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3csq-00000001MGC-2AnG
	for linux-riscv@lists.infradead.org;
	Sun, 05 May 2024 14:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1714919406; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=yUcsdhnPhmEHzxVOANaSCTb2AazIh17RKQgQDGLXMqg=;
	b=mCfeqwu6t0vfvYEogtDaBeb7zJPpFQLVeLht/k8Zx+qmtKGWXuTzg/uMZgf5gf8U2oxRp6imKVXXk6hT6lj01HXMiXWakzyFKoqW91SW9dSRFTvPyop/ALhUma+7aZaID+pc06pIEjDx1cnTg+AePmJHWSh+AXH2m1nbpfnnvjc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R711e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047188;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---.XSX6Fdd_1714919399;
Received: from 30.121.4.198(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XSX6Fdd_1714919399)
          by smtp.aliyun-inc.com;
          Sun, 05 May 2024 22:30:01 +0800
Message-ID: <f3114a5a-3ddb-474b-897c-0d96d25c31f9@antgroup.com>
Date: Sun, 05 May 2024 22:29:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] mm: Add update_mmu_tlb_range()
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, chenhuacai@kernel.org,
 tsbogend@alpha.franken.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 chris@zankel.net, jcmvbkbc@gmail.com, david@redhat.com,
 ryan.roberts@arm.com, libang.linux@gmail.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240429103346.59115-1-libang.li@antgroup.com>
 <20240429103346.59115-6-libang.li@antgroup.com>
 <CAK1f24n4usJm4=e0+jrTxGtRjqTJZvn4gBp8d_vU=p2CrU=TsA@mail.gmail.com>
Content-Language: en-US
From: "Bang Li" <libang.li@antgroup.com>
In-Reply-To: <CAK1f24n4usJm4=e0+jrTxGtRjqTJZvn4gBp8d_vU=p2CrU=TsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_153033_202479_1DBABE50 
X-CRM114-Status: GOOD (  16.71  )
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

SGV5IExhbmNlLAoKVGhhbmtzIGZvciB0YWtpbmcgdGltZSB0byByZXZpZXchCgpPbiAyMDI0LzQv
MjkgMTk6MjMsIExhbmNlIFlhbmcgd3JvdGU6Cj4gSGV5IEJhbmcsCj4gCj4gT24gTW9uLCBBcHIg
MjksIDIwMjQgYXQgNjozNuKAr1BNIEJhbmcgTGkgPGxpYmFuZy5saUBhbnRncm91cC5jb20+IHdy
b3RlOgo+Pgo+PiBBZnRlciB0aGUgY29tbWl0IDE5ZWFmNDQ5NTRkZiAoIm1tOiB0aHA6IHN1cHBv
cnQgYWxsb2NhdGlvbiBvZiBhbm9ueW1vdXMKPj4gbXVsdGktc2l6ZSBUSFAiKSwgaXQgbWF5IG5l
ZWQgdG8gYmF0Y2ggdXBkYXRlIHRsYiBvZiBhbiBhZGRyZXNzIHJhbmdlCj4+IHRocm91Z2ggdGhl
IHVwZGF0ZV9tbXVfdGxiIGZ1bmN0aW9uLiBXZSBjYW4gc2ltcGxpZnkgdGhpcyBvcGVyYXRpb24g
YnkKPj4gYWRkaW5nIHRoZSB1cGRhdGVfbW11X3RsYl9yYW5nZSBmdW5jdGlvbiwgd2hpY2ggbWF5
IGFsc28gcmVkdWNlIHRoZQo+PiBleGVjdXRpb24gb2Ygc29tZSB1bm5lY2Vzc2FyeSBjb2RlIGlu
IHNvbWUgYXJjaGl0ZWN0dXJlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQmFuZyBMaSA8bGliYW5n
LmxpQGFudGdyb3VwLmNvbT4KPj4gLS0tCj4+ICAgaW5jbHVkZS9saW51eC9wZ3RhYmxlLmggfCA1
ICsrKysrCj4+ICAgbW0vbWVtb3J5LmMgICAgICAgICAgICAgfCA0ICstLS0KPj4gICAyIGZpbGVz
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgKPj4g
aW5kZXggMTgwMTlmMDM3YmFlLi43MzQxMWRmZWJmN2EgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUv
bGludXgvcGd0YWJsZS5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oCj4+IEBAIC03
MzQsNiArNzM0LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11X3RsYihzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBhZGRyZXNzLCBwdGVfdCAqcHRlcCkKPj4gICB7Cj4+ICAgfQo+PiArCj4+
ICtzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBhZGRyZXNzLCBwdGVfdCAqcHRlcCwgdW5zaWduZWQgaW50IG5yKQo+PiArewo+PiArfQo+
PiAgICNkZWZpbmUgX19IQVZFX0FSQ0hfVVBEQVRFX01NVV9UTEIKPj4gICAjZW5kaWYKPiAKPiBJ
TU8sIGl0IG1pZ2h0IGJlIGJldHRlciB0byB1c2UgYSBzZXBhcmF0ZSBkZWZpbml0aW9uIHRvIGRl
dGVybWluZSB3aGV0aGVyCj4gdXBkYXRlX21tdV90bGJfcmFuZ2UoKSBpcyBvdmVycmlkZGVuIGJ5
IGEgc3BlY2lmaWMgYXJjaGl0ZWN0dXJlLgoKSSBoYXZlIGFsc28gY29uc2lkZXJlZCB0aGlzLCBh
bmQgSSB3aWxsIG1vZGlmeSBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgp0aGFuayB5b3UgYWdhaW4g
Zm9yIHlvdXIgcmV2aWV3IQoKVGhhbmtzLApCYW5nCgo+IAo+IFRoYW5rcywKPiBMYW5jZQo+IAo+
Pgo+PiBkaWZmIC0tZ2l0IGEvbW0vbWVtb3J5LmMgYi9tbS9tZW1vcnkuYwo+PiBpbmRleCA2NjQ3
Njg1ZmQzYzQuLjFmMGNhMzYyYjgyYSAxMDA2NDQKPj4gLS0tIGEvbW0vbWVtb3J5LmMKPj4gKysr
IGIvbW0vbWVtb3J5LmMKPj4gQEAgLTQzOTYsNyArNDM5Niw2IEBAIHN0YXRpYyB2bV9mYXVsdF90
IGRvX2Fub255bW91c19wYWdlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+PiAgICAgICAgICB2bV9m
YXVsdF90IHJldCA9IDA7Cj4+ICAgICAgICAgIGludCBucl9wYWdlcyA9IDE7Cj4+ICAgICAgICAg
IHB0ZV90IGVudHJ5Owo+PiAtICAgICAgIGludCBpOwo+Pgo+PiAgICAgICAgICAvKiBGaWxlIG1h
cHBpbmcgd2l0aG91dCAtPnZtX29wcyA/ICovCj4+ICAgICAgICAgIGlmICh2bWEtPnZtX2ZsYWdz
ICYgVk1fU0hBUkVEKQo+PiBAQCAtNDQ2NSw4ICs0NDY0LDcgQEAgc3RhdGljIHZtX2ZhdWx0X3Qg
ZG9fYW5vbnltb3VzX3BhZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4+ICAgICAgICAgICAgICAg
ICAgdXBkYXRlX21tdV90bGIodm1hLCBhZGRyLCB2bWYtPnB0ZSk7Cj4+ICAgICAgICAgICAgICAg
ICAgZ290byByZWxlYXNlOwo+PiAgICAgICAgICB9IGVsc2UgaWYgKG5yX3BhZ2VzID4gMSAmJiAh
cHRlX3JhbmdlX25vbmUodm1mLT5wdGUsIG5yX3BhZ2VzKSkgewo+PiAtICAgICAgICAgICAgICAg
Zm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspCj4+IC0gICAgICAgICAgICAgICAgICAgICAg
IHVwZGF0ZV9tbXVfdGxiKHZtYSwgYWRkciArIFBBR0VfU0laRSAqIGksIHZtZi0+cHRlICsgaSk7
Cj4+ICsgICAgICAgICAgICAgICB1cGRhdGVfbW11X3RsYl9yYW5nZSh2bWEsIGFkZHIsIHZtZi0+
cHRlLCBucl9wYWdlcyk7Cj4+ICAgICAgICAgICAgICAgICAgZ290byByZWxlYXNlOwo+PiAgICAg
ICAgICB9Cj4+Cj4+IC0tCj4+IDIuMTkuMS42LmdiNDg1NzEwYgo+PgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
