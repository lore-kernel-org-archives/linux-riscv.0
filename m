Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C6DC35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 13:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/8JDqsbiXi2h3eVkZ/Yi5WtanFicFsiXcq+tFvcVhI=; b=KYIqp4j8ygGf6w
	zM15tmewTXzkxC3/y7ZbgUrRU8k6Eia0f4XM6rZLSxfSgTZZRqlkVGgT7KJCm7ikHmzoOFuRiAtX9
	DbzumY5AOU3gn0wYjh6KNcpseHKty9xkrpNRU+pMnOvxS7TMhpULktcgynD/jqZjbf1bR3KfubNGV
	nakcX7LiRSU4SPY7ODXixy6gHgphLSwg3j3xFWOuI3Ze837e5mmRi6cuNK1PDn9T5DfAP8DNxaig5
	QuJt+uwBpMsz+fIVCoip7Ofo/AT+IfMwisjne+oOeHy0oxv5ov1uHg33yxSqMXeT98lJyB8yYpbcb
	/sETcf8/C3ZTi+crpM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8eZ-003Rdt-0p;
	Fri, 15 Dec 2023 13:54:59 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8eW-003Rcw-1X
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 13:54:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E41BC0012;
	Fri, 15 Dec 2023 13:54:48 +0000 (UTC)
Message-ID: <28128de4-d65e-4358-9224-7c7b840126b4@ghiti.fr>
Date: Fri, 15 Dec 2023 14:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] tools: selftests: riscv: Fix compile warnings in cbo
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
 <20231123185821.2272504-3-christoph.muellner@vrull.eu>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231123185821.2272504-3-christoph.muellner@vrull.eu>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_055456_644517_E24A4E82 
X-CRM114-Status: GOOD (  13.74  )
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
dGhlIGNibyB0ZXN0LiBMZXQncyBmb2xsb3cgdGhlIHJlY29tbWVuZGF0aW9uIGluCj4gRG9jdW1l
bnRhdGlvbi9wcmludGstZm9ybWF0cy50eHQgdG8gZml4IHRoZXNlIHdhcm5pbmdzLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwu
ZXU+Cj4gLS0tCj4gICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2Niby5j
IHwgNiArKystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdw
cm9iZS9jYm8uYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMK
PiBpbmRleCA1MGEyY2M4YWVmMzguLmM2YTgzYWIxMWUyMiAxMDA2NDQKPiAtLS0gYS90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2Niby5jCj4gKysrIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9iZS9jYm8uYwo+IEBAIC05Nyw3ICs5Nyw3IEBAIHN0YXRp
YyB2b2lkIHRlc3RfemljYm96KHZvaWQgKmFyZykKPiAgIAlibG9ja19zaXplID0gcGFpci52YWx1
ZTsKPiAgIAlrc2Z0X3Rlc3RfcmVzdWx0KHJjID09IDAgJiYgcGFpci5rZXkgPT0gUklTQ1ZfSFdQ
Uk9CRV9LRVlfWklDQk9aX0JMT0NLX1NJWkUgJiYKPiAgIAkJCSBpc19wb3dlcl9vZl8yKGJsb2Nr
X3NpemUpLCAiWmljYm96IGJsb2NrIHNpemVcbiIpOwo+IC0Ja3NmdF9wcmludF9tc2coIlppY2Jv
eiBibG9jayBzaXplOiAlbGRcbiIsIGJsb2NrX3NpemUpOwo+ICsJa3NmdF9wcmludF9tc2coIlpp
Y2JveiBibG9jayBzaXplOiAlbGx1XG4iLCBibG9ja19zaXplKTsKPiAgIAo+ICAgCWlsbGVnYWxf
aW5zbiA9IGZhbHNlOwo+ICAgCWNib196ZXJvKCZtZW1bYmxvY2tfc2l6ZV0pOwo+IEBAIC0xMjEs
NyArMTIxLDcgQEAgc3RhdGljIHZvaWQgdGVzdF96aWNib3oodm9pZCAqYXJnKQo+ICAgCQlmb3Ig
KGogPSAwOyBqIDwgYmxvY2tfc2l6ZTsgKytqKSB7Cj4gICAJCQlpZiAobWVtW2kgKiBibG9ja19z
aXplICsgal0gIT0gZXhwZWN0ZWQpIHsKPiAgIAkJCQlrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwoImNi
by56ZXJvIGNoZWNrXG4iKTsKPiAtCQkJCWtzZnRfcHJpbnRfbXNnKCJjYm8uemVybyBjaGVjazog
bWVtWyVkXSAhPSAweCV4XG4iLAo+ICsJCQkJa3NmdF9wcmludF9tc2coImNiby56ZXJvIGNoZWNr
OiBtZW1bJWxsdV0gIT0gMHgleFxuIiwKPiAgIAkJCQkJICAgICAgIGkgKiBibG9ja19zaXplICsg
aiwgZXhwZWN0ZWQpOwo+ICAgCQkJCXJldHVybjsKPiAgIAkJCX0KPiBAQCAtMjAxLDcgKzIwMSw3
IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKPiAgIAlwYWlyLmtleSA9IFJJU0NW
X0hXUFJPQkVfS0VZX0lNQV9FWFRfMDsKPiAgIAlyYyA9IHJpc2N2X2h3cHJvYmUoJnBhaXIsIDEs
IHNpemVvZihjcHVfc2V0X3QpLCAodW5zaWduZWQgbG9uZyAqKSZjcHVzLCAwKTsKPiAgIAlpZiAo
cmMgPCAwKQo+IC0JCWtzZnRfZXhpdF9mYWlsX21zZygiaHdwcm9iZSgpIGZhaWxlZCB3aXRoICVk
XG4iLCByYyk7Cj4gKwkJa3NmdF9leGl0X2ZhaWxfbXNnKCJod3Byb2JlKCkgZmFpbGVkIHdpdGgg
JWxkXG4iLCByYyk7Cj4gICAJYXNzZXJ0KHJjID09IDAgJiYgcGFpci5rZXkgPT0gUklTQ1ZfSFdQ
Uk9CRV9LRVlfSU1BX0VYVF8wKTsKPiAgIAo+ICAgCWlmIChwYWlyLnZhbHVlICYgUklTQ1ZfSFdQ
Uk9CRV9FWFRfWklDQk9aKSB7CgoKWW91IGNhbiBhZGQ6CgpSZXZpZXdlZC1ieTogQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtzIQoKQWxleAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
