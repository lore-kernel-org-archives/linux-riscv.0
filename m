Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E87C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0iuqsXiqbyr1UaJ6VPgKJhPNxfCyCnTWdSolakvbVI=; b=k8SxxKEVqDOVzt
	nNobdW3kdGsMyt27H2JoKkD1wCHdo6YiXlp/ETUOh12o+tWxtbCzAQuhJujIJ7vtf/WFTiTUc0H+U
	Sr09xbTgM8wnaWOAYx2xY37bYSAy33f651OOE9HtcMVpKhFf5oV587XTMwQSCocCX+vN2Jn7A5aQf
	a7ZrKp7acH6zJkW9KZnXaXH0PR0AD/a9ykAd4ACdqaG4jwJZdffef6WX4nwkquIi2UPKnJhL/tZjm
	PsKoVSgP5dEcU/u/Ic5v5YnTXXOIjR4mN9xQL+1cYvDOCJKmKvJUFf0rChSVhwktXGT2fL4w2T+DB
	++6RDhP1/ZNtexg81z4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8RV-003Oy2-38;
	Fri, 15 Dec 2023 13:41:29 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8RS-003OwN-1V
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 13:41:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B03760005;
	Fri, 15 Dec 2023 13:41:17 +0000 (UTC)
Message-ID: <b8db3a8b-8de1-4db9-ba50-b2ba121767a5@ghiti.fr>
Date: Fri, 15 Dec 2023 14:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] tools: selftests: riscv: Fix compile warnings in
 hwprobe
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
 <20231123185821.2272504-2-christoph.muellner@vrull.eu>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231123185821.2272504-2-christoph.muellner@vrull.eu>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_054126_664358_FEA15DE4 
X-CRM114-Status: GOOD (  13.00  )
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
dGhlIGh3cHJvYmUgdGVzdC4gTGV0J3MgZm9sbG93IHRoZSByZWNvbW1lbmRhdGlvbiBpbgo+IERv
Y3VtZW50YXRpb24vcHJpbnRrLWZvcm1hdHMudHh0IHRvIGZpeCB0aGVzZSB3YXJuaW5ncy4KPgo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZy
dWxsLmV1Pgo+IC0tLQo+ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9iZS9o
d3Byb2JlLmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlz
Y3YvaHdwcm9iZS9od3Byb2JlLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3By
b2JlL2h3cHJvYmUuYwo+IGluZGV4IGM0NzQ4OTFkZjMwNy4uYWJiODI1ODExYzcwIDEwMDY0NAo+
IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvaHdwcm9iZS5jCj4g
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9iZS9od3Byb2JlLmMKPiBA
QCAtMjksNyArMjksNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCj4gICAJCS8q
IEZhaWwgaWYgdGhlIGtlcm5lbCBjbGFpbXMgbm90IHRvIHJlY29nbml6ZSBhIGJhc2Uga2V5LiAq
Lwo+ICAgCQlpZiAoKGkgPCA0KSAmJiAocGFpcnNbaV0ua2V5ICE9IGkpKQo+ICAgCQkJa3NmdF9l
eGl0X2ZhaWxfbXNnKCJGYWlsZWQgdG8gcmVjb2duaXplIGJhc2Uga2V5OiBrZXkgIT0gaSwgIgo+
IC0JCQkJCSAgICJrZXk9JWxkLCBpPSVsZFxuIiwgcGFpcnNbaV0ua2V5LCBpKTsKPiArCQkJCQkg
ICAia2V5PSVsbGQsIGk9JWxkXG4iLCBwYWlyc1tpXS5rZXksIGkpOwo+ICAgCj4gICAJCWlmIChw
YWlyc1tpXS5rZXkgIT0gUklTQ1ZfSFdQUk9CRV9LRVlfQkFTRV9CRUhBVklPUikKPiAgIAkJCWNv
bnRpbnVlOwo+IEBAIC0zNyw3ICszNyw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJn
dikKPiAgIAkJaWYgKHBhaXJzW2ldLnZhbHVlICYgUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9S
X0lNQSkKPiAgIAkJCWNvbnRpbnVlOwo+ICAgCj4gLQkJa3NmdF9leGl0X2ZhaWxfbXNnKCJVbmV4
cGVjdGVkIHBhaXI6ICglbGQsICVsZClcbiIsIHBhaXJzW2ldLmtleSwgcGFpcnNbaV0udmFsdWUp
Owo+ICsJCWtzZnRfZXhpdF9mYWlsX21zZygiVW5leHBlY3RlZCBwYWlyOiAoJWxsZCwgJWxsdSlc
biIsIHBhaXJzW2ldLmtleSwgcGFpcnNbaV0udmFsdWUpOwo+ICAgCX0KPiAgIAo+ICAgCW91dCA9
IHJpc2N2X2h3cHJvYmUocGFpcnMsIDgsIDAsIDAsIDApOwoKCllvdSBjYW4gYWRkOgoKUmV2aWV3
ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcyEK
CkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
