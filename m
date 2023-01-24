Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683CCC25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZAAaHJB/K6j3ip5EnwKl2BnFUAaBOk60IXJeSALGbU=; b=yYaCh49BfolyDu
	sylncQR7oxUK+W9TxWfnDcSYk4sNUgVvPDm3S2uVTuLy8rx7ozy992G+R3Fyx5WJhrR5N2Z7dr1Gq
	jVX+sLLQ6WdwwspAYkgYibBX+x+v7Xs5Cvr7VQuUIXEyA2ph8FJnAu4RBU6J8qV54u9+5N6Ze8oB7
	6whQ9s7zl7ivb4bYh0iYSDU3pJruAS1Dx7fSMT8HyhIMDyyMN2Cx4mTQ87MpO1nZwtmRWsI6UFjOL
	WuT1zoIWGx/UecYZF8eRi6jqHw9HvLwoPGWkkhMwi71lf5pSUY2/6AeNbCnvPjkyjjiiE+S2HGYvR
	ym7TFWcwY3BDomZvWffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJDg-003wJG-4F; Tue, 24 Jan 2023 13:20:12 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJDJ-003w72-C9
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 13:19:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1674566377; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=emHh6GYZVEMl89LkW2cz6MIGkRxi+nsFFYK+YHvKFlWHbvcG/hWXIBKVxZST40/1DFaucc8g6jC39w3WQ33kUk+LxkvfN0bcpggo7u8KkRI/hysCzUlEo1DuzHxuf+1PiIcJ/oweL+Sbc84mrwMrCqT6f2rv58M4dBhHkRdSfxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1674566377; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=RvvKpjYQdj7R0d6TCrwWa5fv9XDr1swhB6bM7pFs6BQ=; 
	b=Wh7bc6zlX70bmhovOizT+EUT1XgWyTchifq5yocAYOhAhwGiatmd+lqnFzNamZWAQTkuEHUBhthoqa7WEgAnDU8bFHXWq64/UfRmKKsE2PFBKo7dWeCK40IsUX/XI7FDkOEdsrW5wZhqfeALyf/Bw9OVDCQW1k/R+IzcdQTUC9E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674566377;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=RvvKpjYQdj7R0d6TCrwWa5fv9XDr1swhB6bM7pFs6BQ=;
	b=iJpsOHkYTSfdkuwVeiB0cVjMJKeIY6slSz6hTqv1ZDbBWp5x7i3mHn+wn3bPe4go
	bBvNFtONo1DXgVspBfgDY9255Sj1Gj6N6pgDmA5T6ECrJ6rQunYivK5qzNyb+iZy+n5
	ynON2JRpo5V4jGxn2Kgc/L6Kn59PYddqUKinDEmw=
Received: from edelgard.fodlan.icenowy.me (120.85.99.222 [120.85.99.222]) by mx.zohomail.com
	with SMTPS id 1674566372081950.9495259325062; Tue, 24 Jan 2023 05:19:32 -0800 (PST)
Message-ID: <2a6af8f9e869f2fd313b773b4d2c4ce05ae396d1.camel@icenowy.me>
Subject: Re: [PATCH RESEND 1/2] riscv: errata: fix T-Head dcache.cva encoding
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner
	 <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, Nathan Chancellor
	 <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Sergey
	Matyukevich <sergey.matyukevich@syntacore.com>
Date: Tue, 24 Jan 2023 21:19:20 +0800
In-Reply-To: <20230103062610.69704-1-uwu@icenowy.me>
References: <20230103062610.69704-1-uwu@icenowy.me>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_051949_499018_FA45DF68 
X-CRM114-Status: GOOD (  13.11  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjMtMDEtMDPmmJ/mnJ/kuoznmoQgMTQ6MjYgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ
6YGT77yaCj4gVGhlIGRjYWNoZS5jdmEgZW5jb2Rpbmcgc2hvd24gaW4gdGhlIGNvbW1lbnRzIGFy
ZSB3cm9uZywgaXQncyBmb3IKPiBkY2FjaGUuY3ZhbDEgKHdoaWNoIGlzIHJlc3RyaWN0ZWQgdG8g
TDEpIGluc3RlYWQuCj4gCj4gRml4IHRoaXMgaW4gdGhlIGNvbW1lbnQgYW5kIGluIHRoZSBoYXJk
Y29kZWQgaW5zdHJ1Y3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1
QGljZW5vd3kubWU+Cj4gVGVzdGVkLWJ5OiBTZXJnZXkgTWF0eXVrZXZpY2ggPHNlcmdleS5tYXR5
dWtldmljaEBzeW50YWNvcmUuY29tPgoKQ291bGQgdGhpcyBwYXRjaCBiZSBpbmNsdWRlZD8KCkFz
IEkga25vdywgYXQgbGVhc3QgdHdvIEM5MTAgU29DcyB3aWxsIGJlIGdlbmVyYWxseSBhdmFpbGFi
bGUsIFQtSGVhZCdzCm93biBUSDE1MjAgYW5kIFNvcGhnbyBTRzIwNDIuCgo+IC0tLQo+IEluY2x1
ZGVkIHdoZW4gcmVzZW5kaW5nOgo+IC0gU2VyZ2V5J3MgVGVzdGVkLWJ5IHRhZy4KPiAKPiDCoGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3QuaCB8IDQgKystLQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2VycmF0YV9saXN0LmgKPiBpbmRleCA0MTgwMzEyZDJhNzAuLjYwNTgwMGJkMzkwZSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmgKPiArKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VycmF0YV9saXN0LmgKPiBAQCAtMTAyLDcgKzEwMiw3
IEBAIGFzbQo+IHZvbGF0aWxlKEFMVEVSTkFUSVZFKMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgXAo+IMKgICogfCAzMSAtIDI1IHwgMjQgLSAyMCB8IDE5IC0gMTUgfCAxNCAtIDEyIHwgMTEg
LSA3IHwgNiAtIDAgfAo+IMKgICrCoMKgIDAwMDAwMDHCoMKgwqAgMDEwMDHCoMKgwqDCoMKgIHJz
McKgwqDCoMKgwqDCoCAwMDDCoMKgwqDCoMKgIDAwMDAwwqAgMDAwMTAxMQo+IMKgICogZGNhY2hl
LmN2YSByczEgKGNsZWFuLCB2aXJ0dWFsIGFkZHJlc3MpCj4gLSAqwqDCoCAwMDAwMDAxwqDCoMKg
IDAwMTAwwqDCoMKgwqDCoCByczHCoMKgwqDCoMKgwqAgMDAwwqDCoMKgwqDCoCAwMDAwMMKgIDAw
MDEwMTEKPiArICrCoMKgIDAwMDAwMDHCoMKgwqAgMDAxMDHCoMKgwqDCoMKgIHJzMcKgwqDCoMKg
wqDCoCAwMDDCoMKgwqDCoMKgIDAwMDAwwqAgMDAwMTAxMQo+IMKgICoKPiDCoCAqIGRjYWNoZS5j
aXBhIHJzMSAoY2xlYW4gdGhlbiBpbnZhbGlkYXRlLCBwaHlzaWNhbCBhZGRyZXNzKQo+IMKgICog
fCAzMSAtIDI1IHwgMjQgLSAyMCB8IDE5IC0gMTUgfCAxNCAtIDEyIHwgMTEgLSA3IHwgNiAtIDAg
fAo+IEBAIC0xMTUsNyArMTE1LDcgQEAgYXNtCj4gdm9sYXRpbGUoQUxURVJOQVRJVkUowqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBcCj4gwqAgKsKgwqAgMDAwMDAwMMKgwqDCoCAxMTAwMcKg
wqDCoMKgIDAwMDAwwqDCoMKgwqDCoCAwMDDCoMKgwqDCoMKgIDAwMDAwwqAgMDAwMTAxMQo+IMKg
ICovCj4gwqAjZGVmaW5lIFRIRUFEX2ludmFsX0EwwqAiLmxvbmcgMHgwMjY1MDAwYiIKPiAtI2Rl
ZmluZSBUSEVBRF9jbGVhbl9BMMKgIi5sb25nIDB4MDI0NTAwMGIiCj4gKyNkZWZpbmUgVEhFQURf
Y2xlYW5fQTDCoCIubG9uZyAweDAyNTUwMDBiIgo+IMKgI2RlZmluZSBUSEVBRF9mbHVzaF9BMMKg
Ii5sb25nIDB4MDI3NTAwMGIiCj4gwqAjZGVmaW5lIFRIRUFEX1NZTkNfU8KgwqDCoCIubG9uZyAw
eDAxOTAwMDBiIgo+IMKgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
