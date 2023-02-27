Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05022C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 06:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26OpSLLi+ZGlHIDiS2d0m+BZL2pT2JhFohAvaIdJQlc=; b=YXY8Oyst6dlYEf
	TRIIuUGC5aftLdPI1u5Q5Lgzp+kQyyF/V3OltqOMGDSY+NfClBuKKF6k4YXW0O0N6Pf4VhD/ZQ5+G
	0vG7I9mKkFmID7imchYBZsymDxdRotxRHkeafCWh3OT6Xj+a8lmGrBoqQ46naj4UVwcfiGIAugwQJ
	ZebVtj4VCHvIrbpDmQA0b+s8RmWhony9FxhxLlCkyIyfUDuQ/x/euUqyTNKyHNGBEdUgdmRWS3fH9
	zgdKASnAErdKJzWStNeclUTv3CYhfUSUTkk3QeLRs+o66nH45/dH3vGPEnBwONXU12lgJupf1TFOf
	+rilYUIIFBYjUmVA0zzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWXH1-008bNT-Ol; Mon, 27 Feb 2023 06:46:11 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWXGx-008bMb-47
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 06:46:09 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id BC51724E2B1;
	Mon, 27 Feb 2023 14:45:36 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 14:45:36 +0800
Received: from [192.168.125.128] (113.72.145.171) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 14:45:35 +0800
Message-ID: <2b79e1ac-3399-075d-1d1d-e6d7f88351fc@starfivetech.com>
Date: Mon, 27 Feb 2023 14:45:52 +0800
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
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <547a469d-eeaa-750c-4fe5-cc82d92493a6@roeck-us.net>
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_224607_447280_40256A12 
X-CRM114-Status: GOOD (  13.75  )
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

T24gMjAyMy8yLzI3IDE0OjM2LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+IE9uIDIvMjYvMjMgMjI6
MjYsIFhpbmd5dSBXdSB3cm90ZToKPj4gT24gMjAyMy8yLzI0IDIzOjE4LCBHdWVudGVyIFJvZWNr
IHdyb3RlOgo+Pj4gT24gMi8yMy8yMyAyMzo0MiwgWGluZ3l1IFd1IHdyb3RlOgo+Pj4+IE9uIDIw
MjMvMi8yNCAyOjIzLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+Pj4+PiBPbiBNb24sIEZlYiAyMCwg
MjAyMyBhdCAwNDoxOToyNlBNICswODAwLCBYaW5neXUgV3Ugd3JvdGU6Cj4+Pj4+PiBbLi4uXQo+
Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoCB3ZHQtPndkdF9kZXZpY2UubWluX3RpbWVvdXQgPSAxOwo+
Pj4+Pj4gK8KgwqDCoCB3ZHQtPndkdF9kZXZpY2UubWF4X3RpbWVvdXQgPSBzdGFyZml2ZV93ZHRf
bWF4X3RpbWVvdXQod2R0KTsKPj4+Pj4KPj4+Pj4gwqDCoMKgwqDCoHdkdC0+d2R0X2RldmljZS50
aW1lb3V0ID0gU1RBUkZJVkVfV0RUX0RFRkFVTFRfVElNRTsKPj4+Pj4KPj4+Pj4gc2hvdWxkIGJl
IHNldCBoZXJlLiBPdGhlcndpc2UgdGhlIHdhcm5pbmcgYmVsb3cgd291bGQgYWx3YXlzIGJlIHNl
ZW4KPj4+Pj4gaWYgdGhlIG1vZHVsZSBwYXJhbWV0ZXIgaXMgbm90IHNldC4KPj4+Pj4KPj4+Pj4+
ICsKPj4+Pj4+ICvCoMKgwqAgd2F0Y2hkb2dfc2V0X2RydmRhdGEoJndkdC0+d2R0X2RldmljZSwg
d2R0KTsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqAgLyoKPj4+Pj4+ICvCoMKgwqDCoCAqIHNlZSBp
ZiB3ZSBjYW4gYWN0dWFsbHkgc2V0IHRoZSByZXF1ZXN0ZWQgaGVhcnRiZWF0LAo+Pj4+Pj4gK8Kg
wqDCoMKgICogYW5kIGlmIG5vdCwgdHJ5IHRoZSBkZWZhdWx0IHZhbHVlLgo+Pj4+Pj4gK8KgwqDC
oMKgICovCj4+Pj4+PiArwqDCoMKgIHdhdGNoZG9nX2luaXRfdGltZW91dCgmd2R0LT53ZHRfZGV2
aWNlLCBoZWFydGJlYXQsIGRldik7Cj4+Pj4+PiArwqDCoMKgIGlmICh3ZHQtPndkdF9kZXZpY2Uu
dGltZW91dCA9PSAwIHx8Cj4+Pj4+Cj4+Pj4+IElmIHdkdC0+d2R0X2RldmljZS50aW1lb3V0IGlz
IHByZS1pbml0aWFsaXplZCwgaXQgd2lsbCBuZXZlciBiZSAwIGhlcmUuCj4+Pj4+Cj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgd2R0LT53ZHRfZGV2aWNlLnRpbWVvdXQgPiB3ZHQtPndkdF9kZXZpY2Uu
bWF4X3RpbWVvdXQpIHsKPj4+Pj4KPj4+Pj4gVGhhdCB3b24ndCBoYXBwZW4gYmVjYXVzZSB3YXRj
aGRvZ19pbml0X3RpbWVvdXQoKSB2YWxpZGF0ZXMgaXQgYW5kIGRvZXMKPj4+Pj4gbm90IHVwZGF0
ZSB0aGUgdmFsdWUgaWYgaXQgaXMgb3V0IG9mIHJhbmdlLgo+Pj4+Pgo+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGRldl93YXJuKGRldiwgImhlYXJ0YmVhdCB2YWx1ZSBvdXQgb2YgcmFuZ2UsIGRlZmF1
bHQgJWQgdXNlZFxuIiwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1RBUkZJVkVf
V0RUX0RFRkFVTFRfVElNRSk7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgd2R0LT53ZHRfZGV2aWNl
LnRpbWVvdXQgPSBTVEFSRklWRV9XRFRfREVGQVVMVF9USU1FOwo+Pj4+Pgo+Pj4+PiBBbmQgdGhp
cyBpcyB0aGVuIHVubmVjZXNzYXJ5LiB3ZHQtPndkdF9kZXZpY2UudGltZW91dCB3aWxsIGFsd2F5
cyBiZQo+Pj4+PiB2YWxpZCBpZiBpdCB3YXMgcHJlLWluaXRpYWxpemVkLgo+Pj4+Cj4+Pj4gSXQg
aXMgY2hhbmdlZCB0byBiZSB0aGlzIGF0IGJlZ2lubmluZyBvZiB0aGUgZHJpdmVyOgo+Pj4+Cj4+
Pj4gc3RhdGljIGludCBoZWFydGJlYXQgPSBTVEFSRklWRV9XRFRfREVGQVVMVF9USU1FOwo+Pj4+
Cj4+Pgo+Pj4gTm8sIHRoaXMgaXMgd3JvbmcuIFRoZSBzdGF0aWMgdmFyaWFibGUgc2hvdWxkIGJl
IHNldCB0byAwIHRvIGluZGljYXRlCj4+PiAidXNlIGRlZmF1bHQiLgo+Pj4KPj4+PiBhbmQgaXQg
aXMgY2hhbmdlZCB0byBiZSB0aGlzIGhlcmU6Cj4+Pj4KPj4+PiByZXQgPSB3YXRjaGRvZ19pbml0
X3RpbWVvdXQoJndkdC0+d2R0X2RldmljZSwgaGVhcnRiZWF0LCBkZXYpOwo+Pj4+IGlmIChyZXQp
Cj4+Pj4gwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4+Pj4KPj4+PiBXb3VsZCB0aGF0IGJlIGJldHRl
cj8KPj4+Pgo+Pj4KPj4+IE5vLCBpdCBpcyB3b3JzZSwgYmVjYXVzZSBpdCB3b3VsZCBub3QgaW5z
dGFudGlhdGUgdGhlIHdhdGNoZG9nIGF0IGFsbAo+Pj4gaWYgYSBiYWQgaGVhcnRiZWF0IGlzIHBy
b3ZpZGVkLgo+Pj4KPj4KPj4gU28gaW5zdGFudGlhdGUgdGhlIHdhdGNoZG9nIHdpdGggaGVhcmJl
YXQgZmlyc3QuIEFuZCBpZiB0aGlzIHdyb25nLCB1c2UgZGVmYXVsdCB0aW1lb3V0Lgo+PiA6Cj4+
IGlmICh3YXRjaGRvZ19pbml0X3RpbWVvdXQoJndkdC0+d2R0X2RldmljZSwgaGVhcnRiZWF0LCBk
ZXYpKQo+PiDCoMKgwqDCoHdkdC0+d2R0X2RldmljZS50aW1lb3V0ID0gU1RBUkZJVkVfV0RUX0RF
RkFVTFRfVElNRTsKPj4KPiAKPiBJIGFtIGtpbmQgb2YgbG9zdCB3aHkgeW91IGhhdmUgdG8gbWFr
ZSBpdCB0aGF0IGNvbXBsaWNhdGVkLgo+IEp1c3QgcHJlLWluaXRpYWxpemUgd2R0LT53ZHRfZGV2
aWNlLnRpbWVvdXQgbGlrZSBhbGwgdGhlIG90aGVyIGRyaXZlcnMgZG8sCj4gYW5kIGFzIEkgaGFk
IHN1Z2dlc3RlZCBlYXJsaWVyLgo+IAoKU28geW91IG1lYW4ganVzdCB1c2UgOgp3ZHQtPndkdF9k
ZXZpY2UudGltZW91dCA9IFNUQVJGSVZFX1dEVF9ERUZBVUxUX1RJTUU7CnRvIGluaXRpYWxpemUg
d2F0Y2hkb2cgZGlyZWN0bHk/CgpCZXN0IHJlZ2FyZHMsClhpbmd5dSBXdQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
