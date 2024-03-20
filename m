Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666C6C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTMt0+rl0ypXtOGdt04ugAHLtGkIu9P208ldietjARc=; b=sjZRzxulFIVJ0I
	CnHU9Th/M3hG1hhfl/emD0ytKyqlBPI33hoMRxxCNkqT/CMKV7IyDa6MBpkQTqGdyOUeZ636Ufz4v
	dPjaMYC+gtkgOWzRCJhcr8vUzHbY/SuAbLNoRkTBcteSt3SUL/ZOED4oONYWnMu9y54Do8m7So9FS
	ltGjlL/NNvtqly3HzP75PftBVIG0+MxvTmHBPRVieK3W/AQxvakaKQYUo2tTH8ic6sz4olWYdAlCS
	gAvHTVwpJXr2+lcY5aFRmn1TuSSd59VKiIkF4oNMveAmxm9dYpd3oG511a4L1HgAYK4gFAd/mGdxl
	I+SLnV2nLb5gfgEC4tYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmvQh-0000000HAi9-2U8W;
	Wed, 20 Mar 2024 12:52:27 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmvQf-0000000HAgv-2Eiy
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 12:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1710939138;
	bh=nQsfUBwMPXVe4K5gt0eAIEFG0mAVL84r5St9i8+wxIk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SW6BUJlsDX/vH6gjWlpT+cbGApubryaDyEF8qDyDRffiR8F8JyIwyHOJ+GRsIFzBo
	 uDfOMHVc+690RVFFaVnT6KvRq57AOMDFG8hGl66yVb4i18Af+br29PzGSi8oUQXTc8
	 sLEEsQ/2rahhL4NQYDVDANRz/3xsfoNC8uxbwzWc=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 1B11B6776E;
	Wed, 20 Mar 2024 08:52:14 -0400 (EDT)
Message-ID: <2d3d529e006a6fbef6fe4a8a20b3eb23fa476ff7.camel@xry111.site>
Subject: Re: [PATCH v8 4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
From: Xi Ruoyao <xry111@xry111.site>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, dfustini@baylibre.com, guoren@kernel.org, 
 jkridner@beagleboard.org, jszhang@kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, open list
 <linux-kernel@vger.kernel.org>,  linux-riscv@lists.infradead.org, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 robertcnelson@beagleboard.org, Rob Herring <robh+dt@kernel.org>, 
 wefu@redhat.com
Date: Wed, 20 Mar 2024 20:52:13 +0800
In-Reply-To: <CALHCpMhc1F5Ue7U_gsDXREHUZRVQJNYRCJxYxoNqbN=-39jf7A@mail.gmail.com>
References: <CALHCpMhc1F5Ue7U_gsDXREHUZRVQJNYRCJxYxoNqbN=-39jf7A@mail.gmail.com>
User-Agent: Evolution 3.52.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_055225_608231_AC4498A9 
X-CRM114-Status: GOOD (  18.47  )
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

T24gV2VkLCAyMDI0LTAzLTIwIGF0IDE1OjI4ICswMzAwLCBNYXhpbSBLaXNlbGV2IHdyb3RlOgo+
IEhpIFhpLCBEcmV3Cj4gCj4gSSBoYXZlIHRoZSBzYW1lIHByb2JsZW0gd2l0aCBTRCBvbiBteSBM
aWNoZWVQaSA0QS4KPiAKPiBBZnRlciBzb21lIGludmVzdGlnYXRpb25zIEkgZm91bmQgaG93IHRv
IGZpeCB0aGlzIHR1bmluZyBlcnJvci4KPiBIZXJlIGlzIHRoZSBwYXRjaCB0aGF0IGluY3JlYXNl
cyB0dW5pbmcgbG9vcCBjb3VudCBmcm9tCj4gNDAoTUFYX1RVTklOR19MT09QIGF0IHNkaGNpLmMp
IHRvIDEyOC4KPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1kd2Nt
c2hjLmMKPiBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtZHdjbXNoYy5jCj4gaW5kZXggOGQ2
Y2ZiNjQ4MDk2Li5kYThmNTgyMGZiNjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9z
ZGhjaS1vZi1kd2Ntc2hjLmMKPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWR3Y21z
aGMuYwo+IEBAIC03MDYsNiArNzA2LDcgQEAgc3RhdGljIGludCB0aDE1MjBfZXhlY3V0ZV90dW5p
bmcoc3RydWN0IHNkaGNpX2hvc3QKPiAqaG9zdCwgdTMyIG9wY29kZSkKPiAKPiDCoMKgwqDCoMKg
wqDCoCAvKiBwZXJmb3JtIHR1bmluZyAqLwo+IMKgwqDCoMKgwqDCoMKgIHNkaGNpX3N0YXJ0X3R1
bmluZyhob3N0KTsKPiArwqDCoMKgwqDCoMKgIGhvc3QtPnR1bmluZ19sb29wX2NvdW50ID0gMTI4
Ogo+IMKgwqDCoMKgwqDCoMKgIGhvc3QtPnR1bmluZ19lcnIgPSBfX3NkaGNpX2V4ZWN1dGVfdHVu
aW5nKGhvc3QsIG9wY29kZSk7Cj4gwqDCoMKgwqDCoMKgwqAgaWYgKGhvc3QtPnR1bmluZ19lcnIp
IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogZGlzYWJsZSBhdXRvLXR1bmlu
ZyB1cG9uIHR1bmluZyBlcnJvciAqLwo+IAo+IEFmdGVyIHRoYXQgY2hhbmdlIHR1bmluZyB3b3Jr
cyBmaW5lLiBUaGUgc2FtZSB2YWx1ZSBvZiBsb29wIGNvdW50IGlzCj4gdXNlZCBpbiBSZXZ5T1Mg
QlNQCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jldnlvcy90aGVhZC1rZXJuZWwvYmxvYi9jNmQ0ZTVk
ZjE4YTE3OTAzZDAxMmZmZDg5ZTY3ZDBlZTVjZTZjZjJkL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2kt
b2YtZHdjbXNoYy5jI0wxODUKPiAKPiBIb25lc3RseSwgaXQgbG9va3MgYSBsaXR0bGUgYml0IHN0
cmFuZ2UgZm9yIG1lLgo+IAo+IEl0IHNlZW1zIHRoYXQgdGhlIHR1bmluZyBhbGdvcml0aG0gcmVx
dWlyZXMgdG8gbW92ZSB0aHJvdWdoCj4gYWxsIHRoZSB0YXBzIG9mIGRlbGF5IGxpbmUoMTI4IHRh
cHM/KSBldmVuIGlmIHdlIHVzZSBUSFJFU0hPTERfTU9ERQo+IGluc3RlbmQgTEFSR0VTVF9XSU5f
TU9ERSAoSSBtZWFuIGJpdCAyIGluIEFUX0NUUkxfUigweDU0MCkgcmVnaXN0ZXIpLgo+IAo+IFhp
LCBjb3VsZCB5b3UgYWxzbyB0ZXN0IG15IGZpeCBvbiB5b3VyIGJvYXJkPwoKSSdsbCB0cnkgaXQg
dGhpcyB3ZWVrZW5kLiAgTm93IGhhdmluZyBzb21lIHdvcmsgd2l0aCAicmVhbCB0aW1lCnByaW9y
aXR5IiB0byBkbyA6KC4KCi0tIApYaSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4KU2Nob29s
IG9mIEFlcm9zcGFjZSBTY2llbmNlIGFuZCBUZWNobm9sb2d5LCBYaWRpYW4gVW5pdmVyc2l0eQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
