Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E074C35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P45bgnHvtpbxpys9iu796okLy9ITwS8AgPXR/gOHqc4=; b=DNSkjcZ9ahbZ6x
	2Mubxn0SN/bOZVcN2qgkTbx9Rmqmp1/eG8vDXhXMd3+HKMnn5UYGF9vQ3bmz6tuNUoTfmDoy4rOAq
	blgL5NJeFzhbCx2Nw+l8102UJHBiELcmugfw07Li+4k0ZUg1v+LuWMIhGG976u8j1ASTlQGLPrcjN
	GyJaR15LsCMUBfoRivsgdZzsDUot0g0Ufj9OBOyAq30oxtCkYOtEE9godLyqnMnlkgCzusxkqDGN3
	Mrd1Q56VDN2fdM/4p4tjsJY9OsVDjFJhsYWnL2F+FaLcYQLDnbeHdlwdej8IfgCOGHri0m/ljtOS1
	Y8pWHmTA7PzNsl7smKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8UU-003Phc-1c;
	Fri, 15 Dec 2023 13:44:34 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8UR-003Pex-2X
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 13:44:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DA31FF80F;
	Fri, 15 Dec 2023 13:44:25 +0000 (UTC)
Message-ID: <30f8bb02-5271-4a6a-9f59-12382b6e41a0@ghiti.fr>
Date: Fri, 15 Dec 2023 14:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] tools: selftests: riscv: Fix compile warnings in
 vector tests
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>,
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Shuah Khan <shuah@kernel.org>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andy Chiu <andy.chiu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
References: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
 <20231123185821.2272504-5-christoph.muellner@vrull.eu>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231123185821.2272504-5-christoph.muellner@vrull.eu>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_054431_972659_B7310489 
X-CRM114-Status: GOOD (  14.25  )
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

T24gMjMvMTEvMjAyMyAxOTo1OCwgQ2hyaXN0b3BoIE11ZWxsbmVyIHdyb3RlOgo+IEZyb206IENo
cmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1Pgo+Cj4gR0NDIHBy
aW50cyBhIGNvdXBsZSBvZiBmb3JtYXQgc3RyaW5nIHdhcm5pbmdzIHdoZW4gY29tcGlsaW5nCj4g
dGhlIHZlY3RvciB0ZXN0cy4gTGV0J3MgZm9sbG93IHRoZSByZWNvbW1lbmRhdGlvbiBpbgo+IERv
Y3VtZW50YXRpb24vcHJpbnRrLWZvcm1hdHMudHh0IHRvIGZpeCB0aGVzZSB3YXJuaW5ncy4KPgo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZy
dWxsLmV1Pgo+IC0tLQo+ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3Zf
aW5pdHZhbF9ub2xpYmMuYyB8IDIgKy0KPiAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2
L3ZlY3Rvci92c3RhdGVfcHJjdGwuYyAgICAgfCA0ICsrLS0KPiAgIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci92X2luaXR2YWxfbm9saWJjLmMgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3Ivdl9pbml0dmFsX25vbGliYy5jCj4gaW5kZXgg
NjY3NjRlZGIwZDUyLi4xZGQ5NDE5N2RhMzAgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3ZfaW5pdHZhbF9ub2xpYmMuYwo+ICsrKyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci92X2luaXR2YWxfbm9saWJjLmMKPiBAQCAtMjcs
NyArMjcsNyBAQCBpbnQgbWFpbih2b2lkKQo+ICAgCj4gICAJZGF0YXAgPSBtYWxsb2MoTUFYX1ZT
SVpFKTsKPiAgIAlpZiAoIWRhdGFwKSB7Cj4gLQkJa3NmdF90ZXN0X3Jlc3VsdF9mYWlsKCJmYWls
IHRvIGFsbG9jYXRlIG1lbW9yeSBmb3Igc2l6ZSA9ICVsdVxuIiwgTUFYX1ZTSVpFKTsKPiArCQlr
c2Z0X3Rlc3RfcmVzdWx0X2ZhaWwoImZhaWwgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBzaXplID0g
JWRcbiIsIE1BWF9WU0laRSk7Cj4gICAJCWV4aXQoLTEpOwo+ICAgCX0KPiAgIAo+IGRpZmYgLS1n
aXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX3ByY3RsLmMg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX3ByY3RsLmMKPiBp
bmRleCBiMzQ4YjQ3NWJlNTcuLjhhZDk0ZTA4ZmY0ZCAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX3ByY3RsLmMKPiArKysgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX3ByY3RsLmMKPiBAQCAtNjgsNyAr
NjgsNyBAQCBpbnQgdGVzdF9hbmRfY29tcGFyZV9jaGlsZChsb25nIHByb3ZpZGVkLCBsb25nIGV4
cGVjdGVkLCBpbnQgaW5oZXJpdCkKPiAgIAl9Cj4gICAJcmMgPSBsYXVuY2hfdGVzdChpbmhlcml0
KTsKPiAgIAlpZiAocmMgIT0gZXhwZWN0ZWQpIHsKPiAtCQlrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwo
IlRlc3QgZmFpbGVkLCBjaGVjayAlZCAhPSAlZFxuIiwgcmMsCj4gKwkJa3NmdF90ZXN0X3Jlc3Vs
dF9mYWlsKCJUZXN0IGZhaWxlZCwgY2hlY2sgJWQgIT0gJWxkXG4iLCByYywKPiAgIAkJCQkgICAg
ICBleHBlY3RlZCk7Cj4gICAJCXJldHVybiAtMjsKPiAgIAl9Cj4gQEAgLTg3LDcgKzg3LDcgQEAg
aW50IG1haW4odm9pZCkKPiAgIAlwYWlyLmtleSA9IFJJU0NWX0hXUFJPQkVfS0VZX0lNQV9FWFRf
MDsKPiAgIAlyYyA9IHJpc2N2X2h3cHJvYmUoJnBhaXIsIDEsIDAsIE5VTEwsIDApOwo+ICAgCWlm
IChyYyA8IDApIHsKPiAtCQlrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwoImh3cHJvYmUoKSBmYWlsZWQg
d2l0aCAlZFxuIiwgcmMpOwo+ICsJCWtzZnRfdGVzdF9yZXN1bHRfZmFpbCgiaHdwcm9iZSgpIGZh
aWxlZCB3aXRoICVsZFxuIiwgcmMpOwo+ICAgCQlyZXR1cm4gLTE7Cj4gICAJfQo+ICAgCgoKWW91
IGNhbiBhZGQ6CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgoKVGhhbmtzIQoKQWxleAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
