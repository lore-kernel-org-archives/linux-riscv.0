Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105EDC77B7E
	for <linux-riscv@archiver.kernel.org>; Sat, 27 May 2023 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8hdmGye9YTw45/FQXlHbGnsFVBYVaUR8cVyWr/pFIs=; b=iGxgU15oJkczIb
	O3qnlPpGqzWGcgyg+DMg3XpGbS8uUAjqdbXlD+w2QX5jv/CTqGO72hcqyoHSBYjc0AxK4mEFhUIff
	+lkXRZXIqAuIiY5YAFqR00EZ8YY34ztzVn6iadqNtb0Es8/a3nKEG14knPAp7bkt+NZObwdBq3bH8
	YT9tGyCcUSYbilWGCpb2cEZQl6Fg2lNB6H3KWDuUiXLPMG2mrT7HF4/bYhefFF5BqSLW4QhgnfE3F
	RxoGpVpmCw3qq5NgjXfrdZDNYRc4zWH2YmyrzoOO78tbj4cQ4d7mFFheiTokxp5Cqimb8PlaJBLOt
	pQRW3X/NHSy/89IFDJsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2pzW-005Jqu-0g;
	Sat, 27 May 2023 09:13:38 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2pzT-005Jpv-02
	for linux-riscv@lists.infradead.org;
	Sat, 27 May 2023 09:13:36 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 336871C0004;
	Sat, 27 May 2023 09:13:20 +0000 (UTC)
Message-ID: <f6522c82-01bd-8a03-579d-a5b294784480@ghiti.fr>
Date: Sat, 27 May 2023 11:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Schwab <schwab@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230526154630.289374-1-alexghiti@rivosinc.com>
 <20230526-clergyman-wriggly-accc659a3fad@spud>
 <20230526-rockfish-moody-f6d3e71f9d24@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230526-rockfish-moody-f6d3e71f9d24@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230527_021335_222039_6839A887 
X-CRM114-Status: GOOD (  21.49  )
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

Ck9uIDI2LzA1LzIwMjMgMTg6MzUsIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBGcmksIE1heSAy
NiwgMjAyMyBhdCAwNToyNDo0MVBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+IE9uIEZy
aSwgTWF5IDI2LCAyMDIzIGF0IDA1OjQ2OjMwUE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90
ZToKPj4+IEVhcmx5IGFsdGVybmF0aXZlcyBhcmUgY2FsbGVkIHdpdGggdGhlIG1tdSBkaXNhYmxl
ZCwgYW5kIHRoZW4gc2hvdWxkIG5vdAo+Pj4gYWNjZXNzIGFueSBnbG9iYWwgc3ltYm9scyB0aHJv
dWdoIHRoZSBHT1Qgc2luY2UgaXQgcmVxdWlyZXMgcmVsb2NhdGlvbnMsCj4+PiByZWxvY2F0aW9u
cyB0aGF0IHdlIGRvIGJlZm9yZSBidXQgKnZpcnR1YWxseSouIFNvIG9ubHkgdXNlIG1lZGFueSBj
b2RlCj4+PiBtb2RlbCBmb3IgdGhpcyBlYXJseSBjb2RlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPj4+IC0tLQo+Pj4KPj4+
IE5vdGUgdGhhdCBJJ20gbm90IHZlcnkgaGFwcHkgd2l0aCB0aGlzIGZpeCwgSSB0aGluayB3ZSBu
ZWVkIHRvIHB1dCBtb3JlCj4+PiBlZmZvcnQgaW50byAiaGFybW9uaXppbmciIHRoaXMgdmVyeSBl
YXJseSBjb2RlIChpZSBiZWZvcmUgdGhlIG1tdSBpcwo+Pj4gZW5hYmxlZCkgYXMgaXQgaXMgc3By
ZWFkIGJldHdlZW4gZGlmZmVyZW50IGxvY2F0aW9ucyBhbmQgY29tcGlsZWQKPj4+IGRpZmZlcmVu
dGx5Lgo+PiBUb3RhbGx5ICYgSSdsbCBoYXBwaWx5IHNwZW5kIHRoZSB0aW1lIHRyeWluZyB0byBy
ZXZpZXcgdGhhdCB3b3JrLgo+Pgo+Pj4gSSdsbCB3b3JrIG9uIHRoYXQgbGF0ZXIsIGJ1dCBmb3Ig
bm93LCB0aGlzIGZpeCBkb2VzIHdoYXQgaXMKPj4+IG5lZWRlZCB0byB3b3JrIChmcm9tIG15IHRl
c3RpbmcgYXQgbGVhc3QpLiBBbnkgVGVzdGVkLWJ5IG9uIHRoZSBVbm1hdGNoZWQKPj4+IGFuZCBU
LWhlYWQgYm9hcmRzIGlzIHdlbGNvbWUhCj4+IE9uIDYuNC1yYzEgJiB2Ni40LXJjMSArIHRoaXMg
cGF0Y2gsIHdpdGggQ09ORklHX1JFTE9DQVRBQkxFIGFkZGVkIHRvIG15Cj4+IGNvbmZpZywgbXkg
TmV6aGEgZmFpbHMgdG8gYm9vdC4gVGhlcmUgaXMgbm8gb3V0cHV0IHdoYXRzb2V2ZXIgZnJvbSB0
aGUKPj4ga2VybmVsLiBUdXJuaW5nIG9mZiBDT05GSUdfUkVMT0NBVEFCTEUgYm9vdHMgYWdhaW4u
Cj4gSSBkb24ndCBrbm93IGlmIHRoaXMgaXMgYmV0dGVyIG9yIHdvcnNlIG5ld3MsIGJ1dCBzYW1l
IHRoaW5nIGhhcHBlbnMgb24KPiBhbiBpY2ljbGUga2l0LiBXaGF0IHN5c3RlbXMsIG90aGVyIHRo
YW4gUUVNVSwgaGFzIHRoZSByZWxvY2F0YWJsZQo+IGVyaWVzIGJlZW4gdGVzdGVkIHdpdGgsIGJ0
dz8KCgpJIHRlc3RlZCBpdCBvbiB0aGUgVW5tYXRjaGVkIChBbmRyZWFzIGRpZCB0b28pLgoKVmVy
eSB3ZWlyZCBpdCBkb2VzIG5vdCB3b3JrIG9uIHRoZSBpY2ljbGUga2l0LCB0aGVyZSBpcyBubyBl
cnJhdGEgZm9yIAp0aGlzIHNvYywgc28gd2hhdCBnZXRzIGV4ZWN1dGVkIHRoaXMgZWFybHkgZm9y
IHRoaXMgc29jPyBEbyB5b3Uga25vdyAKd2hlcmUgaXQgZmFpbHMgdG8gYm9vdD8gSWYgeW91IGNh
biBkZWJ1ZywgeW91IHNob3VsZCBicmVhayBvbiB0aGUgCmFkZHJlc3Mgb2YgdGhlIGVudHJ5IHBv
aW50ICh1c3VhbGx5IDB4ODAyMF8wMDAwKSBzaW5jZSB0aGlzIGlzIHRoZSBzdHZlYyAKYWRkcmVz
cywgc28gd2hlbiB5b3UgZ2V0IGEgdHJhcCwgeW91IHdpbGwgYnJhbmNoIHRoZXJlLCBhbmQgdGhl
biBjb3VsZCAKeW91IGR1bXAgJHNlcGMsICRyYSBhbmQgJHN0dmFsIHdoZW4geW91IGdldCB0aGVy
ZT8KClJlZ2FyZGluZyB0aGUgdGhlYWQgaXNzdWUsIEkgdGhpbmsgdGhlIGZvbGxvd2luZyBzaG91
bGQgZml4IGl0OgoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vTWFrZWZpbGUgYi9hcmNoL3Jp
c2N2L21tL01ha2VmaWxlCmluZGV4IGI4NWU5ZTgyZjA4Mi4uYTliZjNmOGM3Y2I0IDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L21tL01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3YvbW0vTWFrZWZpbGUK
QEAgLTMsNiArMyw3IEBACiDCoENGTEFHU19pbml0Lm8gOj0gLW1jbW9kZWw9bWVkYW55CiDCoGlm
ZGVmIENPTkZJR19SRUxPQ0FUQUJMRQogwqBDRkxBR1NfaW5pdC5vICs9IC1mbm8tcGllCitDRkxB
R1NfZG1hLW5vbmNvaGVyZW50Lm8gKz0gLWZuby1waWUKIMKgZW5kaWYKCiDCoGlmZGVmIENPTkZJ
R19GVFJBQ0UKCgo+Cj4gQ2hlZXJzLAo+IENvbm9yLgo+Cj4+IEkgZGlkbid0IHRlc3Qgb24gbXkg
dW5tYXRjaGVkLgo+Pgo+PiBUaGFua3MsCj4+IENvbm9yLgo+Cj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
