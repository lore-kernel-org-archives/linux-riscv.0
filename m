Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40B1C54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 19:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCOX2jM+Vj9WQ0e698W8MUG4ytKFlG5dJ/pCXHp2z3w=; b=qzdGOoThwLJnzt
	6o+5ntbDRnIvLR7A6mBHPpa7gOcSzd0ilJKGieubn3JR67RR6m1FQS4D8X5883WYNE/lwjSDIQbzJ
	QoRf5hStsVHWO7ePK/P2QLymNApQPEpkKy+tWOmr8Yohmjasrx9YYWgPahZZ1PdDFTF1oLlBXNWo9
	wZx3xXEWsC+5re88LDIOBqsOSORfQpY7a/rrnzPUv2dJUKlO/HtPoX6R8EFWeq5CjYZEuiFPAF1B2
	N4q7Iz8ComR+0ejrAqLfvJwni9WYb+xpURXdx/sU+9YQk5pZOrcR73F9jvvJqkuFBVYliq+UXrBxy
	kTHlwR3jFL+1PAuYo/5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf3Hu-00000006ek2-1xea;
	Tue, 27 Feb 2024 19:38:50 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf3Hq-00000006eif-2puo;
	Tue, 27 Feb 2024 19:38:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D074FF805;
	Tue, 27 Feb 2024 19:38:40 +0000 (UTC)
Message-ID: <1860a754-5cca-4411-904b-ecbe838efa77@ghiti.fr>
Date: Tue, 27 Feb 2024 20:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2,RESEND 1/2] drivers: perf: added capabilities for
 legacy PMU
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Vadim Shakirov <vadim.shakirov@syntacore.com>,
 linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>
References: <20240227170002.188671-1-vadim.shakirov@syntacore.com>
 <20240227170002.188671-2-vadim.shakirov@syntacore.com>
 <6ad96656-3cf4-4e22-8a18-cfde5c31cfc1@ghiti.fr>
In-Reply-To: <6ad96656-3cf4-4e22-8a18-cfde5c31cfc1@ghiti.fr>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_113846_869251_47A3E0E0 
X-CRM114-Status: GOOD (  14.52  )
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

Ck9uIDI3LzAyLzIwMjQgMjA6MjYsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiBPbiAyNy8wMi8y
MDI0IDE4OjAwLCBWYWRpbSBTaGFraXJvdiB3cm90ZToKPj4gQWRkZWQgdGhlIFBFUkZfUE1VX0NB
UF9OT19JTlRFUlJVUFQgZmxhZyBiZWNhdXNlIHRoZSBsZWdhY3kgcG11IGRyaXZlcgo+PiBkb2Vz
IG5vdCBwcm92aWRlIHNhbXBsaW5nIGNhcGFiaWxpdGllcwo+Pgo+PiBBZGRlZCB0aGUgUEVSRl9Q
TVVfQ0FQX05PX0VYQ0xVREUgZmxhZyBiZWNhdXNlIHRoZSBsZWdhY3kgcG11IGRyaXZlcgo+PiBk
b2VzIG5vdCBwcm92aWRlIHRoZSBhYmlsaXR5IHRvIGRpc2FibGUgY291bnRlciBpbmNyZW1lbnRh
dGlvbiBpbgo+PiBkaWZmZXJlbnQgcHJpdmlsZWdlIG1vZGVzCj4+Cj4+IFN1Z2dlc3RlZC1ieTog
QXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFZhZGlt
IFNoYWtpcm92IDx2YWRpbS5zaGFraXJvdkBzeW50YWNvcmUuY29tPgo+PiAtLS0KPj4gwqAgZHJp
dmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3kuYyB8IDIgKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3Bt
dV9sZWdhY3kuYyAKPj4gYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jCj4+IGluZGV4
IDc5ZmRkNjY3OTIyZS4uYTg1ZmM5YTE1ZjAzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3BlcmYv
cmlzY3ZfcG11X2xlZ2FjeS5jCj4+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5
LmMKPj4gQEAgLTExNyw2ICsxMTcsOCBAQCBzdGF0aWMgdm9pZCBwbXVfbGVnYWN5X2luaXQoc3Ry
dWN0IHJpc2N2X3BtdSAqcG11KQo+PiDCoMKgwqDCoMKgIHBtdS0+ZXZlbnRfbWFwcGVkID0gcG11
X2xlZ2FjeV9ldmVudF9tYXBwZWQ7Cj4+IMKgwqDCoMKgwqAgcG11LT5ldmVudF91bm1hcHBlZCA9
IHBtdV9sZWdhY3lfZXZlbnRfdW5tYXBwZWQ7Cj4+IMKgwqDCoMKgwqAgcG11LT5jc3JfaW5kZXgg
PSBwbXVfbGVnYWN5X2Nzcl9pbmRleDsKPj4gK8KgwqDCoCBwbXUtPnBtdS5jYXBhYmlsaXRpZXMg
fD0gUEVSRl9QTVVfQ0FQX05PX0lOVEVSUlVQVDsKPj4gK8KgwqDCoCBwbXUtPnBtdS5jYXBhYmls
aXRpZXMgfD0gUEVSRl9QTVVfQ0FQX05PX0VYQ0xVREU7Cj4+IMKgIMKgwqDCoMKgwqAgcGVyZl9w
bXVfcmVnaXN0ZXIoJnBtdS0+cG11LCAiY3B1IiwgUEVSRl9UWVBFX1JBVyk7Cj4+IMKgIH0KPgo+
Cj4gSSBzZWUgaGVyZSB0aGF0IEF0aXNoIGFkZGVkIGl0cyBSQjogCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvQ0FPbkpDVUotZUUremJYSDB5QlhfUUJLMmVwNzc5cT13TkNT
cmMrQkpmelViK3pCQ2F3QG1haWwuZ21haWwuY29tLwo+Cj4gU28gSSBhZGQgaXQgaGVyZSAoaG9w
ZWZ1bGx5IGI0IHdvbid0IGNvbXBsYWluLCBJIGRvbid0IGtub3cpOgoKCkZUUiwgYjQgaW5kZWVk
IGNvbXBsYWluczoKCk5PVEU6IHNvbWUgdHJhaWxlcnMgaWdub3JlZCBkdWUgdG8gZnJvbS9lbWFp
bCBtaXNtYXRjaGVzOgogwqDCoMKgICEgVHJhaWxlcjogUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJh
IDxhdGlzaHBAcml2b3NpbmMuY29tPgogwqDCoMKgwqAgTXNnIEZyb206IEFsZXhhbmRyZSBHaGl0
aSA8YWxleEBnaGl0aS5mcj4KCgo+Cj4gUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBA
cml2b3NpbmMuY29tPgo+Cj4gQW5kIEknZCBzYXkgdGhlIGZpeGVzIHRhZyBmb3IgdGhpcyBvbmUg
aXM6Cj4KPiBGaXhlczogOWIzZTE1MGUzMTBlICgiUklTQy1WOiBBZGQgYSBzaW1wbGUgcGxhdGZv
cm0gZHJpdmVyIGZvciBSSVNDLVYgCj4gbGVnYWN5IHBlcmYiKQo+Cj4gVGhhbmtzLAo+Cj4gQWxl
eAo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
