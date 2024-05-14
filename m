Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3BFC04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 16:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kd95r5wMqSKup5lkOSi1Z3uUTGdat0oxOwqpzfHJ464=; b=gQ9IPSp8Yw5vBq
	kR65+YaaKQ0PczhJK9KRq0hzrIwbZ6GkSnrdB/kE7eNXjW5vXXeSigT6lALfTNpa6kRRMdpWh4c/P
	3wJiXmOjr91Mh/3Dem5o++OewoWfcwU4sWjSnLtemmrWrIKTZ8NRgmVfSswPECw/JT4IH0wc7JZ+J
	mJBV5/9jDwWOQPz+BKR7eS/AsBlRvUXTuLhgLH+FtMa3C4sZnvIj7DYIsfZ1xZx76a5ziAn4B+Fey
	e1cLdjWPEavsduvtBEDh7DF8y8lRXPlYvBrLd/bW3J71bPK8n4UtguQV9IWU9ckcL0pNI97NgNiG7
	g89CYMhlneNi/Hdozxmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6v7A-0000000GXOL-0qmv;
	Tue, 14 May 2024 16:34:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6v77-0000000GXNU-07dh
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 16:34:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3593ACE0A3C;
	Tue, 14 May 2024 16:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3170C2BD10;
	Tue, 14 May 2024 16:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715704490;
	bh=bquuasHCV5I/L0YtYX6erf/Sqf5ntgz+jwR6bM97uoI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FYMEDT0vkpzQD1yVnU2etV+jk/xcPPcRTnjJp1dXIe/kvA6wjKMmb83lmvnh8j5Dn
	 FwLVn5mOCLtsTAdqA8e9IKWDT8E1G/31jkuFdgTQUCFVqcwxZht7KJGKevoP0JH57J
	 zIBXGFM5s+eE2aQNps/yAwPufE7fmtUFgh5S+pdLnqdIwIE0yH8pddlodbrR/Hh68c
	 J+fx3cQBjp5VlcuCQVssVUXpZBD4CM8gk4ClcVRitd++N7JJMo/HaUn7xM2sRhbxoc
	 Y6npf+jqNIb0LcL/u5Ot+hkLv2CRV/M1fhsdaJAuwPjh2aZYzFqDbdqvwGc5WIeaJ4
	 ZKaBEjhF8DWgw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: David Hildenbrand <david@redhat.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/8] riscv: mm: Add memory hotplugging support
In-Reply-To: <267be75e-ed4a-45d0-883f-51c7324c30f1@redhat.com>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-5-bjorn@kernel.org>
 <267be75e-ed4a-45d0-883f-51c7324c30f1@redhat.com>
Date: Tue, 14 May 2024 18:34:46 +0200
Message-ID: <87r0e4tkrd.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_093453_542084_169AC0C8 
X-CRM114-Status: GOOD (  21.03  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyaXRlczoKCj4gT24gMTQuMDUu
MjQgMTY6MDQsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KPj4gCj4+IEZvciBhbiBhcmNoaXRlY3R1cmUgdG8gc3VwcG9ydCBt
ZW1vcnkgaG90cGx1Z2dpbmcsIGEgY291cGxlIG9mCj4+IGNhbGxiYWNrcyBuZWVkcyB0byBiZSBp
bXBsZW1lbnRlZDoKPj4gCj4+ICAgYXJjaF9hZGRfbWVtb3J5KCkKPj4gICAgVGhpcyBjYWxsYmFj
ayBpcyByZXNwb25zaWJsZSBmb3IgYWRkaW5nIHRoZSBwaHlzaWNhbCBtZW1vcnkgaW50byB0aGUK
Pj4gICAgZGlyZWN0IG1hcCwgYW5kIGNhbGwgaW50byB0aGUgbWVtb3J5IGhvdHBsdWdnaW5nIGdl
bmVyaWMgY29kZSB2aWEKPj4gICAgX19hZGRfcGFnZXMoKSB0aGF0IGFkZHMgdGhlIGNvcnJlc3Bv
bmRpbmcgc3RydWN0IHBhZ2UgZW50cmllcywgYW5kCj4+ICAgIHVwZGF0ZXMgdGhlIHZtZW1tYXAg
bWFwcGluZy4KPj4gCj4+ICAgYXJjaF9yZW1vdmVfbWVtb3J5KCkKPj4gICAgVGhpcyBpcyB0aGUg
aW52ZXJzZSBvZiB0aGUgY2FsbGJhY2sgYWJvdmUuCj4+IAo+PiAgIHZtZW1tYXBfZnJlZSgpCj4+
ICAgIFRoaXMgZnVuY3Rpb24gdGVhcnMgZG93biB0aGUgdm1lbW1hcCBtYXBwaW5ncyAoaWYKPj4g
ICAgQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQIGlzIGVuYWJsZWQpLCBhbmQgYWxzbyBkZWFsbG9j
YXRlcyB0aGUKPj4gICAgYmFja2luZyB2bWVtbWFwIHBhZ2VzLiBOb3RlIHRoYXQgZm9yIHBlcnNp
c3RlbnQgbWVtb3J5LCBhbgo+PiAgICBhbHRlcm5hdGl2ZSBhbGxvY2F0b3IgZm9yIHRoZSBiYWNr
aW5nIHBhZ2VzIGNhbiBiZSB1c2VkOyBUaGUKPj4gICAgdm1lbV9hbHRtYXAuIFRoaXMgbWVhbnMg
dGhhdCB3aGVuIHRoZSBiYWNraW5nIHBhZ2VzIGFyZSBjbGVhcmVkLAo+PiAgICBleHRyYSBjYXJl
IGlzIG5lZWRlZCBzbyB0aGF0IHRoZSBjb3JyZWN0IGRlYWxsb2NhdGlvbiBtZXRob2QgaXMKPj4g
ICAgdXNlZC4KPj4gCj4+ICAgYXJjaF9nZXRfbWFwcGFibGVfcmFuZ2UoKQo+PiAgICBUaGlzIGZ1
bmN0aW9ucyByZXR1cm5zIHRoZSBQQSByYW5nZSB0aGF0IHRoZSBkaXJlY3QgbWFwIGNhbiBtYXAu
Cj4+ICAgIFVzZWQgYnkgdGhlIE1IUCBpbnRlcm5hbHMgZm9yIHNhbml0eSBjaGVja3MuCj4+IAo+
PiBUaGUgcGFnZSB0YWJsZSB1bm1hcC90ZWFyZG93biBmdW5jdGlvbnMgYXJlIGhlYXZpbHkgYmFz
ZWQgb24gY29kZSBmcm9tCj4+IHRoZSB4ODYgdHJlZS4gVGhlIHNhbWUgcmVtb3ZlX3BnZF9tYXBw
aW5nKCkgZnVuY3Rpb24gaXMgdXNlZCBpbiBib3RoCj4+IHZtZW1tYXBfZnJlZSgpIGFuZCBhcmNo
X3JlbW92ZV9tZW1vcnkoKSwgYnV0IGluIHRoZSBsYXR0ZXIgZnVuY3Rpb24KPj4gdGhlIGJhY2tp
bmcgcGFnZXMgYXJlIG5vdCByZW1vdmVkLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+PiAtLS0KPj4gICBhcmNoL3Jpc2N2L21tL2luaXQu
YyB8IDI0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDI0MiBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+PiBpbmRleCA2ZjcyYjBi
MmI4NTQuLjdmMGI5MjFhM2QzYSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMK
Pj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4gQEAgLTE0OTMsMyArMTQ5MywyNDUgQEAg
dm9pZCBfX2luaXQgcGd0YWJsZV9jYWNoZV9pbml0KHZvaWQpCj4+ICAgCX0KPj4gICB9Cj4+ICAg
I2VuZGlmCj4+ICsKPj4gKyNpZmRlZiBDT05GSUdfTUVNT1JZX0hPVFBMVUcKPj4gK3N0YXRpYyB2
b2lkIF9fbWVtaW5pdCBmcmVlX3B0ZV90YWJsZShwdGVfdCAqcHRlX3N0YXJ0LCBwbWRfdCAqcG1k
KQo+PiArewo+PiArCXB0ZV90ICpwdGU7Cj4+ICsJaW50IGk7Cj4+ICsKPj4gKwlmb3IgKGkgPSAw
OyBpIDwgUFRSU19QRVJfUFRFOyBpKyspIHsKPj4gKwkJcHRlID0gcHRlX3N0YXJ0ICsgaTsKPj4g
KwkJaWYgKCFwdGVfbm9uZSgqcHRlKSkKPj4gKwkJCXJldHVybjsKPj4gKwl9Cj4+ICsKPj4gKwlm
cmVlX3BhZ2VzKCh1bnNpZ25lZCBsb25nKXBhZ2VfYWRkcmVzcyhwbWRfcGFnZSgqcG1kKSksIDAp
Owo+PiArCXBtZF9jbGVhcihwbWQpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgdm9pZCBfX21lbWlu
aXQgZnJlZV9wbWRfdGFibGUocG1kX3QgKnBtZF9zdGFydCwgcHVkX3QgKnB1ZCkKPj4gK3sKPj4g
KwlwbWRfdCAqcG1kOwo+PiArCWludCBpOwo+PiArCj4+ICsJZm9yIChpID0gMDsgaSA8IFBUUlNf
UEVSX1BNRDsgaSsrKSB7Cj4+ICsJCXBtZCA9IHBtZF9zdGFydCArIGk7Cj4+ICsJCWlmICghcG1k
X25vbmUoKnBtZCkpCj4+ICsJCQlyZXR1cm47Cj4+ICsJfQo+PiArCj4+ICsJZnJlZV9wYWdlcygo
dW5zaWduZWQgbG9uZylwYWdlX2FkZHJlc3MocHVkX3BhZ2UoKnB1ZCkpLCAwKTsKPj4gKwlwdWRf
Y2xlYXIocHVkKTsKPj4gK30KPj4gKwo+PiArc3RhdGljIHZvaWQgX19tZW1pbml0IGZyZWVfcHVk
X3RhYmxlKHB1ZF90ICpwdWRfc3RhcnQsIHA0ZF90ICpwNGQpCj4+ICt7Cj4+ICsJcHVkX3QgKnB1
ZDsKPj4gKwlpbnQgaTsKPj4gKwo+PiArCWZvciAoaSA9IDA7IGkgPCBQVFJTX1BFUl9QVUQ7IGkr
Kykgewo+PiArCQlwdWQgPSBwdWRfc3RhcnQgKyBpOwo+PiArCQlpZiAoIXB1ZF9ub25lKCpwdWQp
KQo+PiArCQkJcmV0dXJuOwo+PiArCX0KPj4gKwo+PiArCWZyZWVfcGFnZXMoKHVuc2lnbmVkIGxv
bmcpcGFnZV9hZGRyZXNzKHA0ZF9wYWdlKCpwNGQpKSwgMCk7Cj4+ICsJcDRkX2NsZWFyKHA0ZCk7
Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIF9fbWVtaW5pdCBmcmVlX3ZtZW1tYXBfc3RvcmFn
ZShzdHJ1Y3QgcGFnZSAqcGFnZSwgc2l6ZV90IHNpemUsCj4+ICsJCQkJCSAgIHN0cnVjdCB2bWVt
X2FsdG1hcCAqYWx0bWFwKQo+PiArewo+PiArCWlmIChhbHRtYXApCj4+ICsJCXZtZW1fYWx0bWFw
X2ZyZWUoYWx0bWFwLCBzaXplID4+IFBBR0VfU0hJRlQpOwo+PiArCWVsc2UKPj4gKwkJZnJlZV9w
YWdlcygodW5zaWduZWQgbG9uZylwYWdlX2FkZHJlc3MocGFnZSksIGdldF9vcmRlcihzaXplKSk7
Cj4KPiBJZiB5b3UgdW5wbHVnIGEgRElNTSB0aGF0IHdhcyBhZGRlZCBkdXJpbmcgYm9vdCAoY2Fu
IGhhcHBlbiBvbiB4ODYtNjQsIAo+IGNhbiBpdCBoYXBwZW4gb24gcmlzY3Y/KSwgZnJlZV9wYWdl
cygpIHdvdWxkIG5vdCBiZSBzdWZmaWNpZW50LiBZb3UnZCBiZSAKPiBmcmVlaW5nIGEgUEdfcmVz
ZXJ2ZWQgcGFnZSB0aGF0IGhhcyB0byBiZSBmcmVlZCBkaWZmZXJlbnRseS4KCkknZCBzYXkgaWYg
aXQgY2FuIGhhcHBlbiBvbiB4ODYtNjQsIGl0IHByb2JhYmx5IGNhbiBvbiBSSVNDLVYuIEknbGwg
bG9vawppbnRvIHRoaXMgZm9yIHRoZSBuZXh0IHNwaW4hCgpUaGFua3MgZm9yIHNwZW5kaW5nIHRp
bWUgb24gdGhlIHNlcmllcyEKCgpDaGVlcnMsCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
