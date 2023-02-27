Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D92C64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 06:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmRmvcqs/K3Dk8P1NiMa7dLXXOYI1grwSrhsBhRu39U=; b=qo7/pDykhWeog5
	NDndUTSIYq8lZMfR/yj6cnxXNcVwBRhNyWOeUUv3kFXTQGNH/zaTVTCei1qy+h3ukJKQxd60/jghY
	PgfrKCc0eWEfWuAbT65vA2HLP9t+3qsPJh+59CShpokLuczc05H5IZELg1kTA5ACAXbqXxpXDHR0E
	WflIkFaiZtrUM6d1nFkTXXpwjW7dK1rgvGhjpqaIXbVsPUQWnHhYVjOYLhZARZzei4b1s6pq3bI+1
	LgrogK48Tsbc0NTJRYuTEh/Z9+CI2np3jJ85FrXq4iq9PG4oi6LCKTqzwG7UtutYiZF6yiZv+tdgc
	dUuSoUSgZ7/l/8oykALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWWyE-008a2j-LM; Mon, 27 Feb 2023 06:26:46 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWWyA-008a1l-9U
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 06:26:44 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B3F0324E23D;
	Mon, 27 Feb 2023 14:26:16 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 14:26:16 +0800
Received: from [192.168.125.128] (113.72.145.171) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 14:26:15 +0800
Message-ID: <58cab864-2a59-b82c-bdfe-2e805a04fd7a@starfivetech.com>
Date: Mon, 27 Feb 2023 14:26:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-3-xingyu.wu@starfivetech.com>
 <20230223182341.GA200380@roeck-us.net>
 <8ba002ea-299c-2eaf-b1a7-d7d38a540152@starfivetech.com>
 <ae998eb6-54ce-05c4-2961-bdb2393eac64@roeck-us.net>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <ae998eb6-54ce-05c4-2961-bdb2393eac64@roeck-us.net>
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_222642_638135_43BFB90A 
X-CRM114-Status: GOOD (  14.01  )
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

T24gMjAyMy8yLzI0IDIzOjE4LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+IE9uIDIvMjMvMjMgMjM6
NDIsIFhpbmd5dSBXdSB3cm90ZToKPj4gT24gMjAyMy8yLzI0IDI6MjMsIEd1ZW50ZXIgUm9lY2sg
d3JvdGU6Cj4+PiBPbiBNb24sIEZlYiAyMCwgMjAyMyBhdCAwNDoxOToyNlBNICswODAwLCBYaW5n
eXUgV3Ugd3JvdGU6Cj4+Pj4gWy4uLl0KPj4+PiArCj4+Pj4gK8KgwqDCoCB3ZHQtPndkdF9kZXZp
Y2UubWluX3RpbWVvdXQgPSAxOwo+Pj4+ICvCoMKgwqAgd2R0LT53ZHRfZGV2aWNlLm1heF90aW1l
b3V0ID0gc3RhcmZpdmVfd2R0X21heF90aW1lb3V0KHdkdCk7Cj4+Pgo+Pj4gwqDCoMKgwqB3ZHQt
PndkdF9kZXZpY2UudGltZW91dCA9IFNUQVJGSVZFX1dEVF9ERUZBVUxUX1RJTUU7Cj4+Pgo+Pj4g
c2hvdWxkIGJlIHNldCBoZXJlLiBPdGhlcndpc2UgdGhlIHdhcm5pbmcgYmVsb3cgd291bGQgYWx3
YXlzIGJlIHNlZW4KPj4+IGlmIHRoZSBtb2R1bGUgcGFyYW1ldGVyIGlzIG5vdCBzZXQuCj4+Pgo+
Pj4+ICsKPj4+PiArwqDCoMKgIHdhdGNoZG9nX3NldF9kcnZkYXRhKCZ3ZHQtPndkdF9kZXZpY2Us
IHdkdCk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLyoKPj4+PiArwqDCoMKgwqAgKiBzZWUgaWYgd2Ug
Y2FuIGFjdHVhbGx5IHNldCB0aGUgcmVxdWVzdGVkIGhlYXJ0YmVhdCwKPj4+PiArwqDCoMKgwqAg
KiBhbmQgaWYgbm90LCB0cnkgdGhlIGRlZmF1bHQgdmFsdWUuCj4+Pj4gK8KgwqDCoMKgICovCj4+
Pj4gK8KgwqDCoCB3YXRjaGRvZ19pbml0X3RpbWVvdXQoJndkdC0+d2R0X2RldmljZSwgaGVhcnRi
ZWF0LCBkZXYpOwo+Pj4+ICvCoMKgwqAgaWYgKHdkdC0+d2R0X2RldmljZS50aW1lb3V0ID09IDAg
fHwKPj4+Cj4+PiBJZiB3ZHQtPndkdF9kZXZpY2UudGltZW91dCBpcyBwcmUtaW5pdGlhbGl6ZWQs
IGl0IHdpbGwgbmV2ZXIgYmUgMCBoZXJlLgo+Pj4KPj4+PiArwqDCoMKgwqDCoMKgwqAgd2R0LT53
ZHRfZGV2aWNlLnRpbWVvdXQgPiB3ZHQtPndkdF9kZXZpY2UubWF4X3RpbWVvdXQpIHsKPj4+Cj4+
PiBUaGF0IHdvbid0IGhhcHBlbiBiZWNhdXNlIHdhdGNoZG9nX2luaXRfdGltZW91dCgpIHZhbGlk
YXRlcyBpdCBhbmQgZG9lcwo+Pj4gbm90IHVwZGF0ZSB0aGUgdmFsdWUgaWYgaXQgaXMgb3V0IG9m
IHJhbmdlLgo+Pj4KPj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4oZGV2LCAiaGVhcnRiZWF0
IHZhbHVlIG91dCBvZiByYW5nZSwgZGVmYXVsdCAlZCB1c2VkXG4iLAo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgU1RBUkZJVkVfV0RUX0RFRkFVTFRfVElNRSk7Cj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIHdkdC0+d2R0X2RldmljZS50aW1lb3V0ID0gU1RBUkZJVkVfV0RUX0RFRkFVTFRfVElN
RTsKPj4+Cj4+PiBBbmQgdGhpcyBpcyB0aGVuIHVubmVjZXNzYXJ5LiB3ZHQtPndkdF9kZXZpY2Uu
dGltZW91dCB3aWxsIGFsd2F5cyBiZQo+Pj4gdmFsaWQgaWYgaXQgd2FzIHByZS1pbml0aWFsaXpl
ZC4KPj4KPj4gSXQgaXMgY2hhbmdlZCB0byBiZSB0aGlzIGF0IGJlZ2lubmluZyBvZiB0aGUgZHJp
dmVyOgo+Pgo+PiBzdGF0aWMgaW50IGhlYXJ0YmVhdCA9IFNUQVJGSVZFX1dEVF9ERUZBVUxUX1RJ
TUU7Cj4+Cj4gCj4gTm8sIHRoaXMgaXMgd3JvbmcuIFRoZSBzdGF0aWMgdmFyaWFibGUgc2hvdWxk
IGJlIHNldCB0byAwIHRvIGluZGljYXRlCj4gInVzZSBkZWZhdWx0Ii4KPiAKPj4gYW5kIGl0IGlz
IGNoYW5nZWQgdG8gYmUgdGhpcyBoZXJlOgo+Pgo+PiByZXQgPSB3YXRjaGRvZ19pbml0X3RpbWVv
dXQoJndkdC0+d2R0X2RldmljZSwgaGVhcnRiZWF0LCBkZXYpOwo+PiBpZiAocmV0KQo+PiDCoMKg
wqDCoHJldHVybiByZXQ7Cj4+Cj4+IFdvdWxkIHRoYXQgYmUgYmV0dGVyPwo+Pgo+IAo+IE5vLCBp
dCBpcyB3b3JzZSwgYmVjYXVzZSBpdCB3b3VsZCBub3QgaW5zdGFudGlhdGUgdGhlIHdhdGNoZG9n
IGF0IGFsbAo+IGlmIGEgYmFkIGhlYXJ0YmVhdCBpcyBwcm92aWRlZC4KPiAKClNvIGluc3RhbnRp
YXRlIHRoZSB3YXRjaGRvZyB3aXRoIGhlYXJiZWF0IGZpcnN0LiBBbmQgaWYgdGhpcyB3cm9uZywg
dXNlIGRlZmF1bHQgdGltZW91dC4KOgppZiAod2F0Y2hkb2dfaW5pdF90aW1lb3V0KCZ3ZHQtPndk
dF9kZXZpY2UsIGhlYXJ0YmVhdCwgZGV2KSkKCXdkdC0+d2R0X2RldmljZS50aW1lb3V0ID0gU1RB
UkZJVkVfV0RUX0RFRkFVTFRfVElNRTsKCgpCZXN0IHJlZ2FyZHMsClhpbmd5dSBXdQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
