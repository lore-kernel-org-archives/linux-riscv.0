Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB33C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 02:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkSSXUzeFiPCaivKZ1r5Kl+LrH8nO1tlbzx5YOqBD10=; b=IXCDoHmSMwulz2
	/OQnCmY1VEvtk44iNJf88eq06dQ8OXbd2LVayyzL+h4YJkzt3i8KnTUeyJAx3MUy3g/7vkCSLGW7X
	cHHSfDoSm+AtsciFV5MlTXYHds+qbU/0871pyBrnRg4V98jWlNW+bMb5KlEe+6LeI+ps+DcyavNEC
	mNp9vW2pj/MX2pgCILk9+er8/2w52YFJI26XtS8iSpJMes9ss5WTOvrjRuNNsaqMJWuCtJOHg7Z11
	lx47TuEb+Ehjd8hIwq2/IZKiQ1LMNh4MJIGW85HLY5trDjsW825sfuciPdE/aYFShLtjEEkEgMTjC
	1E81NrzK0jVoheoybAlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWpP9-00BnUh-1b; Tue, 28 Feb 2023 02:07:47 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWpP6-00BnSD-6l
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 02:07:45 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id ECB2A24E30E;
	Tue, 28 Feb 2023 10:06:50 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Feb
 2023 10:06:50 +0800
Received: from [192.168.125.128] (113.72.145.171) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Feb
 2023 10:06:48 +0800
Message-ID: <704dea02-6b9d-b977-1354-a390a489a7fb@starfivetech.com>
Date: Tue, 28 Feb 2023 10:07:05 +0800
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
 <58cab864-2a59-b82c-bdfe-2e805a04fd7a@starfivetech.com>
 <547a469d-eeaa-750c-4fe5-cc82d92493a6@roeck-us.net>
 <2b79e1ac-3399-075d-1d1d-e6d7f88351fc@starfivetech.com>
 <a7ffe026-a48b-9ffd-20d3-7d25caba120d@roeck-us.net>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <a7ffe026-a48b-9ffd-20d3-7d25caba120d@roeck-us.net>
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_180744_553573_F3799348 
X-CRM114-Status: GOOD (  12.22  )
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

T24gMjAyMy8yLzI3IDIyOjUwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+IE9uIDIvMjYvMjMgMjI6
NDUsIFhpbmd5dSBXdSB3cm90ZToKPj4gT24gMjAyMy8yLzI3IDE0OjM2LCBHdWVudGVyIFJvZWNr
IHdyb3RlOgo+Pj4gT24gMi8yNi8yMyAyMjoyNiwgWGluZ3l1IFd1IHdyb3RlOgo+Pj4+IE9uIDIw
MjMvMi8yNCAyMzoxOCwgR3VlbnRlciBSb2VjayB3cm90ZToKPj4+Pj4gT24gMi8yMy8yMyAyMzo0
MiwgWGluZ3l1IFd1IHdyb3RlOgo+Pj4+Pj4gT24gMjAyMy8yLzI0IDI6MjMsIEd1ZW50ZXIgUm9l
Y2sgd3JvdGU6Cj4+Pj4+Pj4gT24gTW9uLCBGZWIgMjAsIDIwMjMgYXQgMDQ6MTk6MjZQTSArMDgw
MCwgWGluZ3l1IFd1IHdyb3RlOgo+Pj4+Pj4+PiBbLi4uXQo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICvC
oMKgwqAgd2R0LT53ZHRfZGV2aWNlLm1pbl90aW1lb3V0ID0gMTsKPj4+Pj4+Pj4gK8KgwqDCoCB3
ZHQtPndkdF9kZXZpY2UubWF4X3RpbWVvdXQgPSBzdGFyZml2ZV93ZHRfbWF4X3RpbWVvdXQod2R0
KTsKPj4+Pj4+Pgo+Pj4+Pj4+IMKgwqDCoMKgwqDCoHdkdC0+d2R0X2RldmljZS50aW1lb3V0ID0g
U1RBUkZJVkVfV0RUX0RFRkFVTFRfVElNRTsKPj4+Pj4+Pgo+Pj4+Pj4+IHNob3VsZCBiZSBzZXQg
aGVyZS4gT3RoZXJ3aXNlIHRoZSB3YXJuaW5nIGJlbG93IHdvdWxkIGFsd2F5cyBiZSBzZWVuCj4+
Pj4+Pj4gaWYgdGhlIG1vZHVsZSBwYXJhbWV0ZXIgaXMgbm90IHNldC4KPj4+Pj4+Pgo+Pj4+Pj4+
PiArCj4+Pj4+Pj4+ICvCoMKgwqAgd2F0Y2hkb2dfc2V0X2RydmRhdGEoJndkdC0+d2R0X2Rldmlj
ZSwgd2R0KTsKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArwqDCoMKgIC8qCj4+Pj4+Pj4+ICvCoMKgwqDC
oCAqIHNlZSBpZiB3ZSBjYW4gYWN0dWFsbHkgc2V0IHRoZSByZXF1ZXN0ZWQgaGVhcnRiZWF0LAo+
Pj4+Pj4+PiArwqDCoMKgwqAgKiBhbmQgaWYgbm90LCB0cnkgdGhlIGRlZmF1bHQgdmFsdWUuCj4+
Pj4+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+Pj4+PiArwqDCoMKgIHdhdGNoZG9nX2luaXRfdGltZW91
dCgmd2R0LT53ZHRfZGV2aWNlLCBoZWFydGJlYXQsIGRldik7Cj4+Pj4+Pj4+ICvCoMKgwqAgaWYg
KHdkdC0+d2R0X2RldmljZS50aW1lb3V0ID09IDAgfHwKPj4+Pj4+Pgo+Pj4+Pj4+IElmIHdkdC0+
d2R0X2RldmljZS50aW1lb3V0IGlzIHByZS1pbml0aWFsaXplZCwgaXQgd2lsbCBuZXZlciBiZSAw
IGhlcmUuCj4+Pj4+Pj4KPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHdkdC0+d2R0X2RldmljZS50
aW1lb3V0ID4gd2R0LT53ZHRfZGV2aWNlLm1heF90aW1lb3V0KSB7Cj4+Pj4+Pj4KPj4+Pj4+PiBU
aGF0IHdvbid0IGhhcHBlbiBiZWNhdXNlIHdhdGNoZG9nX2luaXRfdGltZW91dCgpIHZhbGlkYXRl
cyBpdCBhbmQgZG9lcwo+Pj4+Pj4+IG5vdCB1cGRhdGUgdGhlIHZhbHVlIGlmIGl0IGlzIG91dCBv
ZiByYW5nZS4KPj4+Pj4+Pgo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4oZGV2LCAi
aGVhcnRiZWF0IHZhbHVlIG91dCBvZiByYW5nZSwgZGVmYXVsdCAlZCB1c2VkXG4iLAo+Pj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNUQVJGSVZFX1dEVF9ERUZBVUxUX1RJTUUpOwo+
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgd2R0LT53ZHRfZGV2aWNlLnRpbWVvdXQgPSBTVEFSRklW
RV9XRFRfREVGQVVMVF9USU1FOwo+Pj4+Pj4+Cj4+Pj4+Pj4gQW5kIHRoaXMgaXMgdGhlbiB1bm5l
Y2Vzc2FyeS4gd2R0LT53ZHRfZGV2aWNlLnRpbWVvdXQgd2lsbCBhbHdheXMgYmUKPj4+Pj4+PiB2
YWxpZCBpZiBpdCB3YXMgcHJlLWluaXRpYWxpemVkLgo+Pj4+Pj4KPj4+Pj4+IEl0IGlzIGNoYW5n
ZWQgdG8gYmUgdGhpcyBhdCBiZWdpbm5pbmcgb2YgdGhlIGRyaXZlcjoKPj4+Pj4+Cj4+Pj4+PiBz
dGF0aWMgaW50IGhlYXJ0YmVhdCA9IFNUQVJGSVZFX1dEVF9ERUZBVUxUX1RJTUU7Cj4+Pj4+Pgo+
Pj4+Pgo+Pj4+PiBObywgdGhpcyBpcyB3cm9uZy4gVGhlIHN0YXRpYyB2YXJpYWJsZSBzaG91bGQg
YmUgc2V0IHRvIDAgdG8gaW5kaWNhdGUKPj4+Pj4gInVzZSBkZWZhdWx0Ii4KPj4+Pj4KPj4+Pj4+
IGFuZCBpdCBpcyBjaGFuZ2VkIHRvIGJlIHRoaXMgaGVyZToKPj4+Pj4+Cj4+Pj4+PiByZXQgPSB3
YXRjaGRvZ19pbml0X3RpbWVvdXQoJndkdC0+d2R0X2RldmljZSwgaGVhcnRiZWF0LCBkZXYpOwo+
Pj4+Pj4gaWYgKHJldCkKPj4+Pj4+IMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4+Pj4+Pgo+Pj4+
Pj4gV291bGQgdGhhdCBiZSBiZXR0ZXI/Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBObywgaXQgaXMgd29y
c2UsIGJlY2F1c2UgaXQgd291bGQgbm90IGluc3RhbnRpYXRlIHRoZSB3YXRjaGRvZyBhdCBhbGwK
Pj4+Pj4gaWYgYSBiYWQgaGVhcnRiZWF0IGlzIHByb3ZpZGVkLgo+Pj4+Pgo+Pj4+Cj4+Pj4gU28g
aW5zdGFudGlhdGUgdGhlIHdhdGNoZG9nIHdpdGggaGVhcmJlYXQgZmlyc3QuIEFuZCBpZiB0aGlz
IHdyb25nLCB1c2UgZGVmYXVsdCB0aW1lb3V0Lgo+Pj4+IDoKPj4+PiBpZiAod2F0Y2hkb2dfaW5p
dF90aW1lb3V0KCZ3ZHQtPndkdF9kZXZpY2UsIGhlYXJ0YmVhdCwgZGV2KSkKPj4+PiDCoMKgwqDC
oMKgd2R0LT53ZHRfZGV2aWNlLnRpbWVvdXQgPSBTVEFSRklWRV9XRFRfREVGQVVMVF9USU1FOwo+
Pj4+Cj4+Pgo+Pj4gSSBhbSBraW5kIG9mIGxvc3Qgd2h5IHlvdSBoYXZlIHRvIG1ha2UgaXQgdGhh
dCBjb21wbGljYXRlZC4KPj4+IEp1c3QgcHJlLWluaXRpYWxpemUgd2R0LT53ZHRfZGV2aWNlLnRp
bWVvdXQgbGlrZSBhbGwgdGhlIG90aGVyIGRyaXZlcnMgZG8sCj4+PiBhbmQgYXMgSSBoYWQgc3Vn
Z2VzdGVkIGVhcmxpZXIuCj4+Pgo+Pgo+PiBTbyB5b3UgbWVhbiBqdXN0IHVzZSA6Cj4+IHdkdC0+
d2R0X2RldmljZS50aW1lb3V0ID0gU1RBUkZJVkVfV0RUX0RFRkFVTFRfVElNRTsKPj4gdG8gaW5p
dGlhbGl6ZSB3YXRjaGRvZyBkaXJlY3RseT8KPj4KPiAKPiBZZXMsIGFzIEkgaGFkIHN1Z2dlc3Rl
ZCBiZWZvcmUsIGJlZm9yZSBjYWxsaW5nIHdhdGNoZG9nX2luaXRfdGltZW91dCgpLgo+IAoKT0ss
IHRoYW5rcy4KQmVzdCByZWdhcmQsClhpbmd5dSBXdQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
