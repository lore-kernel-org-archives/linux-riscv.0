Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9369C7EE2E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zNSAcvM63XGkzsnMPxJGbCv/e7xuTnCsgSLGHM47tE=; b=rhx8oeAg4V5pJs
	jXQSFwP547oPVVPFS21AY3qAHynS/mMQwTXNGgU83fuqn7YmMqct4U4/q3yu/AEfaEfvm3DigCaWA
	jF93oGquo/OCxF0R9NZ2o1UkxR20BXzZgvnWXHIfx+LdXgqhHOCTdH9eatkw+M8PY2T+YF5LiBvmC
	+1l02iSKlNKb+A5xrB8SW1sG3q5DXrbBIeqmA/9H0Fj548Rr/lMi+c/DwlZbedj7ZwuQrVu9z1DOM
	ysE1xFB4Kq8L4nYFAK5Hp533fuCJk1fHb++PpMMlOdqf6FkXlNzJRC4pwpfHgRQ9m34sV91Ti57+N
	G7mhtQ1hClZMddd8OWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWeq5-00A4P4-Kj; Mon, 27 Feb 2023 14:50:53 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWeq1-00A4Mu-Mu
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 14:50:52 +0000
Received: by mail-il1-x12c.google.com with SMTP id 4so4043908ilz.6
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 06:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=L+jYyq1jhOJX4L8R02OOarqFh4Kn9adYP/VGoKDxS3Y=;
        b=nNOIXYN7JiHPmx34v6yMlx1tq5eUxFsnvQTj7QKj2zffdl3f/8TTirINmPwsHtqoIk
         PaOZfE257b4iBHJCytvTZP6mZoYsA7cycoYXmeNxfceEgV9wfd3i93XkP6+RMW6O/WOe
         Up6mtIxn6Q4kqtv0YJfB37mJRh63CzAbBbVM6h+hesHAb2QWyPgfZ10zCG7BMkEqXSff
         DvOUeGxkj2G+eBB24Pfvhm11wMxnMDwOgtJitlHbcAik1hG/VJXJ/Wixa8Z1xlUSLKWm
         GB0C039siTeYlazbQ+1jXbxRYDYJfNTiPo5cglaocrWk63Bpnw6ic2pxWaBnz0kCEtsf
         depQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+jYyq1jhOJX4L8R02OOarqFh4Kn9adYP/VGoKDxS3Y=;
        b=AWqqbT8Go2dSe/Q6Rhsu1KzGGAyJl1hRyhN3dLVUbPvTK8YDBRNEDUptvRUYa6L8Pp
         WqLPY3OVd3XG7Xuvp7REAsTUODlqYu4LaE82R4jaSMMNvrvR7SDcsOATMLxNIMm0hPIW
         CDg4yBTKbkQLR3HrbBb9etFwe7Cbx9U8/sJ7sdHCaHHpqntVkC2i2CcA8qlLSo0uWLTi
         p8vkB3hZ/a6x4ZDML1SRLFfyH2riGCkeuYN2QZarBWVzp01OsbxYD8KieRUlIDLdb2f0
         EFMziVT/1MpkaV9BXVz4mE7HOVMkgRrfUQjJC16ubk646yI1rPtTwWRd5JTsVM0MEWKj
         Mdzw==
X-Gm-Message-State: AO0yUKXNWvwTISkSBTMoD8YJy3OUCx+EFnoQHBtVu13jpUWiXKXP6yip
	2a73+eZTmt7Nzj2R8Rh/THs=
X-Google-Smtp-Source: AK7set/5YiCfPaih4CO+pmCM2/MrPak5lsrv8POHxOAFXyUa0OqdaFeC6cXDbBKhR/j9tNcIvnmjEg==
X-Received: by 2002:a05:6e02:1906:b0:315:3252:655f with SMTP id w6-20020a056e02190600b003153252655fmr23175858ilu.21.1677509447731;
        Mon, 27 Feb 2023 06:50:47 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e23-20020a02a797000000b003c4f902cca5sm2124648jaj.172.2023.02.27.06.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 06:50:46 -0800 (PST)
Message-ID: <a7ffe026-a48b-9ffd-20d3-7d25caba120d@roeck-us.net>
Date: Mon, 27 Feb 2023 06:50:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/2] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20230220081926.267695-1-xingyu.wu@starfivetech.com>
 <20230220081926.267695-3-xingyu.wu@starfivetech.com>
 <20230223182341.GA200380@roeck-us.net>
 <8ba002ea-299c-2eaf-b1a7-d7d38a540152@starfivetech.com>
 <ae998eb6-54ce-05c4-2961-bdb2393eac64@roeck-us.net>
 <58cab864-2a59-b82c-bdfe-2e805a04fd7a@starfivetech.com>
 <547a469d-eeaa-750c-4fe5-cc82d92493a6@roeck-us.net>
 <2b79e1ac-3399-075d-1d1d-e6d7f88351fc@starfivetech.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <2b79e1ac-3399-075d-1d1d-e6d7f88351fc@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_065049_769013_F6199F8B 
X-CRM114-Status: GOOD (  17.87  )
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

T24gMi8yNi8yMyAyMjo0NSwgWGluZ3l1IFd1IHdyb3RlOgo+IE9uIDIwMjMvMi8yNyAxNDozNiwg
R3VlbnRlciBSb2VjayB3cm90ZToKPj4gT24gMi8yNi8yMyAyMjoyNiwgWGluZ3l1IFd1IHdyb3Rl
Ogo+Pj4gT24gMjAyMy8yLzI0IDIzOjE4LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+Pj4+IE9uIDIv
MjMvMjMgMjM6NDIsIFhpbmd5dSBXdSB3cm90ZToKPj4+Pj4gT24gMjAyMy8yLzI0IDI6MjMsIEd1
ZW50ZXIgUm9lY2sgd3JvdGU6Cj4+Pj4+PiBPbiBNb24sIEZlYiAyMCwgMjAyMyBhdCAwNDoxOToy
NlBNICswODAwLCBYaW5neXUgV3Ugd3JvdGU6Cj4+Pj4+Pj4gWy4uLl0KPj4+Pj4+PiArCj4+Pj4+
Pj4gK8KgwqDCoCB3ZHQtPndkdF9kZXZpY2UubWluX3RpbWVvdXQgPSAxOwo+Pj4+Pj4+ICvCoMKg
wqAgd2R0LT53ZHRfZGV2aWNlLm1heF90aW1lb3V0ID0gc3RhcmZpdmVfd2R0X21heF90aW1lb3V0
KHdkdCk7Cj4+Pj4+Pgo+Pj4+Pj4gIMKgwqDCoMKgwqB3ZHQtPndkdF9kZXZpY2UudGltZW91dCA9
IFNUQVJGSVZFX1dEVF9ERUZBVUxUX1RJTUU7Cj4+Pj4+Pgo+Pj4+Pj4gc2hvdWxkIGJlIHNldCBo
ZXJlLiBPdGhlcndpc2UgdGhlIHdhcm5pbmcgYmVsb3cgd291bGQgYWx3YXlzIGJlIHNlZW4KPj4+
Pj4+IGlmIHRoZSBtb2R1bGUgcGFyYW1ldGVyIGlzIG5vdCBzZXQuCj4+Pj4+Pgo+Pj4+Pj4+ICsK
Pj4+Pj4+PiArwqDCoMKgIHdhdGNoZG9nX3NldF9kcnZkYXRhKCZ3ZHQtPndkdF9kZXZpY2UsIHdk
dCk7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICvCoMKgwqAgLyoKPj4+Pj4+PiArwqDCoMKgwqAgKiBzZWUg
aWYgd2UgY2FuIGFjdHVhbGx5IHNldCB0aGUgcmVxdWVzdGVkIGhlYXJ0YmVhdCwKPj4+Pj4+PiAr
wqDCoMKgwqAgKiBhbmQgaWYgbm90LCB0cnkgdGhlIGRlZmF1bHQgdmFsdWUuCj4+Pj4+Pj4gK8Kg
wqDCoMKgICovCj4+Pj4+Pj4gK8KgwqDCoCB3YXRjaGRvZ19pbml0X3RpbWVvdXQoJndkdC0+d2R0
X2RldmljZSwgaGVhcnRiZWF0LCBkZXYpOwo+Pj4+Pj4+ICvCoMKgwqAgaWYgKHdkdC0+d2R0X2Rl
dmljZS50aW1lb3V0ID09IDAgfHwKPj4+Pj4+Cj4+Pj4+PiBJZiB3ZHQtPndkdF9kZXZpY2UudGlt
ZW91dCBpcyBwcmUtaW5pdGlhbGl6ZWQsIGl0IHdpbGwgbmV2ZXIgYmUgMCBoZXJlLgo+Pj4+Pj4K
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgd2R0LT53ZHRfZGV2aWNlLnRpbWVvdXQgPiB3ZHQtPndk
dF9kZXZpY2UubWF4X3RpbWVvdXQpIHsKPj4+Pj4+Cj4+Pj4+PiBUaGF0IHdvbid0IGhhcHBlbiBi
ZWNhdXNlIHdhdGNoZG9nX2luaXRfdGltZW91dCgpIHZhbGlkYXRlcyBpdCBhbmQgZG9lcwo+Pj4+
Pj4gbm90IHVwZGF0ZSB0aGUgdmFsdWUgaWYgaXQgaXMgb3V0IG9mIHJhbmdlLgo+Pj4+Pj4KPj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4oZGV2LCAiaGVhcnRiZWF0IHZhbHVlIG91dCBv
ZiByYW5nZSwgZGVmYXVsdCAlZCB1c2VkXG4iLAo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgU1RBUkZJVkVfV0RUX0RFRkFVTFRfVElNRSk7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHdkdC0+d2R0X2RldmljZS50aW1lb3V0ID0gU1RBUkZJVkVfV0RUX0RFRkFVTFRfVElNRTsKPj4+
Pj4+Cj4+Pj4+PiBBbmQgdGhpcyBpcyB0aGVuIHVubmVjZXNzYXJ5LiB3ZHQtPndkdF9kZXZpY2Uu
dGltZW91dCB3aWxsIGFsd2F5cyBiZQo+Pj4+Pj4gdmFsaWQgaWYgaXQgd2FzIHByZS1pbml0aWFs
aXplZC4KPj4+Pj4KPj4+Pj4gSXQgaXMgY2hhbmdlZCB0byBiZSB0aGlzIGF0IGJlZ2lubmluZyBv
ZiB0aGUgZHJpdmVyOgo+Pj4+Pgo+Pj4+PiBzdGF0aWMgaW50IGhlYXJ0YmVhdCA9IFNUQVJGSVZF
X1dEVF9ERUZBVUxUX1RJTUU7Cj4+Pj4+Cj4+Pj4KPj4+PiBObywgdGhpcyBpcyB3cm9uZy4gVGhl
IHN0YXRpYyB2YXJpYWJsZSBzaG91bGQgYmUgc2V0IHRvIDAgdG8gaW5kaWNhdGUKPj4+PiAidXNl
IGRlZmF1bHQiLgo+Pj4+Cj4+Pj4+IGFuZCBpdCBpcyBjaGFuZ2VkIHRvIGJlIHRoaXMgaGVyZToK
Pj4+Pj4KPj4+Pj4gcmV0ID0gd2F0Y2hkb2dfaW5pdF90aW1lb3V0KCZ3ZHQtPndkdF9kZXZpY2Us
IGhlYXJ0YmVhdCwgZGV2KTsKPj4+Pj4gaWYgKHJldCkKPj4+Pj4gIMKgwqDCoMKgwqByZXR1cm4g
cmV0Owo+Pj4+Pgo+Pj4+PiBXb3VsZCB0aGF0IGJlIGJldHRlcj8KPj4+Pj4KPj4+Pgo+Pj4+IE5v
LCBpdCBpcyB3b3JzZSwgYmVjYXVzZSBpdCB3b3VsZCBub3QgaW5zdGFudGlhdGUgdGhlIHdhdGNo
ZG9nIGF0IGFsbAo+Pj4+IGlmIGEgYmFkIGhlYXJ0YmVhdCBpcyBwcm92aWRlZC4KPj4+Pgo+Pj4K
Pj4+IFNvIGluc3RhbnRpYXRlIHRoZSB3YXRjaGRvZyB3aXRoIGhlYXJiZWF0IGZpcnN0LiBBbmQg
aWYgdGhpcyB3cm9uZywgdXNlIGRlZmF1bHQgdGltZW91dC4KPj4+IDoKPj4+IGlmICh3YXRjaGRv
Z19pbml0X3RpbWVvdXQoJndkdC0+d2R0X2RldmljZSwgaGVhcnRiZWF0LCBkZXYpKQo+Pj4gIMKg
wqDCoMKgd2R0LT53ZHRfZGV2aWNlLnRpbWVvdXQgPSBTVEFSRklWRV9XRFRfREVGQVVMVF9USU1F
Owo+Pj4KPj4KPj4gSSBhbSBraW5kIG9mIGxvc3Qgd2h5IHlvdSBoYXZlIHRvIG1ha2UgaXQgdGhh
dCBjb21wbGljYXRlZC4KPj4gSnVzdCBwcmUtaW5pdGlhbGl6ZSB3ZHQtPndkdF9kZXZpY2UudGlt
ZW91dCBsaWtlIGFsbCB0aGUgb3RoZXIgZHJpdmVycyBkbywKPj4gYW5kIGFzIEkgaGFkIHN1Z2dl
c3RlZCBlYXJsaWVyLgo+Pgo+IAo+IFNvIHlvdSBtZWFuIGp1c3QgdXNlIDoKPiB3ZHQtPndkdF9k
ZXZpY2UudGltZW91dCA9IFNUQVJGSVZFX1dEVF9ERUZBVUxUX1RJTUU7Cj4gdG8gaW5pdGlhbGl6
ZSB3YXRjaGRvZyBkaXJlY3RseT8KPiAKClllcywgYXMgSSBoYWQgc3VnZ2VzdGVkIGJlZm9yZSwg
YmVmb3JlIGNhbGxpbmcgd2F0Y2hkb2dfaW5pdF90aW1lb3V0KCkuCgpHdWVudGVyCgo+IEJlc3Qg
cmVnYXJkcywKPiBYaW5neXUgV3UKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
