Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD52FC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 05:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKsCL1TQtaKPaBATxLwR5moEuj43CmOx0YROxt3pEEc=; b=H+Tnc6yuBmndFk
	UQqKgGCAvxQ4G96K508Ti2PGHdFM1TlbQ24Sj9egkC+v4nL+BFHNS4WDS/6cZXp3iRd+NbjcR+u+F
	jf5mt/FzsBUpX7uQZadonljJ0sug9bWfpdIQAjqwOhu3wORw1OoUbxiRZ3UbZ8ZQZ7gN2HwaSaXig
	0qrLyDq8C6z0CnMjm4zCCEvq/FjzJ6NsP+GhZY7/kO/FxEF9mvElRvKg/wuaSAFw/w1BZckI4ecDk
	h25o1n3QNDjx0UBsZy201veSI7kjMbWfjyz5SXSeWpcX3KiLaxtstIZYAW5shh8Y55XE/RXHOly06
	/5v82HCHYtMhTcZbRYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ho3-000V6D-Fn; Thu, 16 Jun 2022 05:12:35 +0000
Received: from smtp03.smtpout.orange.fr ([80.12.242.125] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ho0-000V2W-32
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 05:12:34 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 1hnpoMOui26JC1hnpo2ksk; Thu, 16 Jun 2022 07:12:23 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 16 Jun 2022 07:12:23 +0200
X-ME-IP: 90.11.190.129
Message-ID: <a5f6f76d-efc1-b421-7623-ad46996f5b94@wanadoo.fr>
Date: Thu, 16 Jun 2022 07:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drivers: soc: sifive: Add missing of_node_put() in
 sifive_l2_cache.c
Content-Language: fr
To: Liang He <windhl@126.com>, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220615122315.3965435-1-windhl@126.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220615122315.3965435-1-windhl@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_221232_311274_DE8CAA48 
X-CRM114-Status: GOOD (  22.52  )
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

TGUgMTUvMDYvMjAyMiDDoCAxNDoyMywgTGlhbmcgSGUgYSDDqWNyaXTCoDoKPiBJbiBzaWZpdmVf
bDJfaW5pdCgpLCBvZl9maW5kX21hdGNoaW5nX25vZGUoKSB3aWxsIHJldHVybiBhIG5vZGUgcG9p
bnRlcgo+IHdpdGggcmVmY291bnQgaW5jcmVtZW50ZWQuIFdlIHNob3VsZCB1c2Ugb2Zfbm9kZV9w
dXQoKSBpbiBlYWNoIGZhaWwgcGF0aAo+IG9yIHdoZW4gaXQgaXMgbm90IHVzZWQgYW55bW9yZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+Cj4gLS0tCj4gICBk
cml2ZXJzL3NvYy9zaWZpdmUvc2lmaXZlX2wyX2NhY2hlLmMgfCAyOSArKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9sMl9j
YWNoZS5jIGIvZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9sMl9jYWNoZS5jCj4gaW5kZXggNTk2
NDBhMWQwYjI4Li4yYjljOTUyMmVmMjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zb2Mvc2lmaXZl
L3NpZml2ZV9sMl9jYWNoZS5jCj4gKysrIGIvZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9sMl9j
YWNoZS5jCj4gQEAgLTE5OCwyOSArMTk4LDQxIEBAIHN0YXRpYyBpbnQgX19pbml0IHNpZml2ZV9s
Ml9pbml0KHZvaWQpCj4gICAJc3RydWN0IHJlc291cmNlIHJlczsKPiAgIAlpbnQgaSwgcmMsIGlu
dHJfbnVtOwo+ICAgCgpIaSwKdGhpcyBlbXB0eSBsaW5lIGlzIG5vdCBuZWVkZWQuCgo+ICsJaW50
IHJldDsKPiArCj4gICAJbnAgPSBvZl9maW5kX21hdGNoaW5nX25vZGUoTlVMTCwgc2lmaXZlX2wy
X2lkcyk7Cj4gICAJaWYgKCFucCkKPiAgIAkJcmV0dXJuIC1FTk9ERVY7Cj4gICAKPiAgIAlpZiAo
b2ZfYWRkcmVzc190b19yZXNvdXJjZShucCwgMCwgJnJlcykpCj4gLQkJcmV0dXJuIC1FTk9ERVY7
Cj4gKwl7Cgp0aGlzIHNob3VsZCBiZSBhdCB0aGUgZW5kIG9mIHRoZSBwcmV2aW91cyBsaW5lLgoK
PiArCQlyZXQgPSAtRU5PREVWOwo+ICsJCWdvdG8gb3V0X3B1dDsKPiArCX0KPiAgIAo+ICAgCWwy
X2Jhc2UgPSBpb3JlbWFwKHJlcy5zdGFydCwgcmVzb3VyY2Vfc2l6ZSgmcmVzKSk7Cj4gICAJaWYg
KCFsMl9iYXNlKQo+IC0JCXJldHVybiAtRU5PTUVNOwo+ICsJewo+CgpTYW1lIGhlcmUuCgogICsJ
CXJldCA9IC1FTk9NRU07Cj4gKwkJZ290byBvdXRfcHV0Owo+ICsJfQo+ICAgCj4gICAJaW50cl9u
dW0gPSBvZl9wcm9wZXJ0eV9jb3VudF91MzJfZWxlbXMobnAsICJpbnRlcnJ1cHRzIik7Cj4gLQlp
ZiAoIWludHJfbnVtKSB7Cj4gKwlpZiAoIWludHJfbnVtKSB7CQkKPiAgIAkJcHJfZXJyKCJMMkNB
Q0hFOiBubyBpbnRlcnJ1cHRzIHByb3BlcnR5XG4iKTsKPiAtCQlyZXR1cm4gLUVOT0RFVjsKPiAr
CQlyZXQgPSAtRU5PREVWCgpNaXNzaW5nICI7IiBhcyByZXBvcnRlZCBieSB0aGUgYm90LgoKPiAr
CQlnb3RvIG91dF9wdXQ7Cj4gICAJfQo+ICAgCj4gICAJZm9yIChpID0gMDsgaSA8IGludHJfbnVt
OyBpKyspIHsKPiAgIAkJZ19pcnFbaV0gPSBpcnFfb2ZfcGFyc2VfYW5kX21hcChucCwgaSk7Cj4g
ICAJCXJjID0gcmVxdWVzdF9pcnEoZ19pcnFbaV0sIGwyX2ludF9oYW5kbGVyLCAwLCAibDJfZWNj
IiwgTlVMTCk7Cj4gKwkJCj4gICAJCWlmIChyYykgewo+ICsJCQkKCldoeSBhIG5ldyBlbXB0eSBs
aW5lIGhlcmU/Cgo+ICAgCQkJcHJfZXJyKCJMMkNBQ0hFOiBDb3VsZCBub3QgcmVxdWVzdCBJUlEg
JWRcbiIsIGdfaXJxW2ldKTsKPiAtCQkJcmV0dXJuIHJjOwo+ICsJCQlyZXQgPSByYzsKPiArCQkJ
Z290byBvdXRfcHV0Owo+ICAgCQl9Cj4gICAJfQo+ICAgCj4gQEAgLTIzMiw2ICsyNDQsMTEgQEAg
c3RhdGljIGludCBfX2luaXQgc2lmaXZlX2wyX2luaXQodm9pZCkKPiAgICNpZmRlZiBDT05GSUdf
REVCVUdfRlMKPiAgIAlzZXR1cF9zaWZpdmVfZGVidWcoKTsKPiAgICNlbmRpZgo+IC0JcmV0dXJu
IDA7Cj4gKwlyZXQgPSAwOwo+ICsJCj4gKwkKCk5vIG5lZWQgZm9yIDIgZW1wdHkgbGluZXMgaGVy
ZS4KCgpUaGVyZSBhcmUgYWxzbyBzb21lIHRyYWlsaW5nIHdoaXRlIHNwYWNlcyBvbiBzb21lIGxp
bmVzLgoKIi4vc2NyaXB0cy9jaGVja3BhdGNoIDxuYW1lX29mX3RoZV9wYXRjaD4iIGNhdGNoZXMg
c29tZSBvZiB0aGVzZSB0aW55IAppc3N1ZXMuIFVzaW5nIC0tc3RyaWN0IGNhdGNoZXMgZXZlbiBt
b3JlIG9mIHRoZXNlIGlzc3Vlcy4KCllvdSBzaG91bGQgYWxzbyBhbHdheXMgYXQgbGVhc3QgY29t
cGlsZSB0ZXN0IHlvdXIgcGF0Y2hlcywgZXZlbiBpZiB0aGV5IApsb29rIG9idmlvdXMsCgpDSgoK
Cj4gK291dF9wdXQ6Cj4gKwlvZl9ub2RlX3B1dChucCk7Cj4gKwlyZXR1cm4gcmV0Owo+ICAgfQo+
ICAgZGV2aWNlX2luaXRjYWxsKHNpZml2ZV9sMl9pbml0KTsKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
