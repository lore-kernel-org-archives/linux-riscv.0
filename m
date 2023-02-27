Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B7CC64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 06:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhJJbtUJBOZKBPDbKo4Su2z9Ae7rGbnTIxWn0XFA5H8=; b=ItGfCnil5RzNw/
	CEVX4xArX6k37T4kahLPKx0F4YF9gDT+MK1U1vJkhcSSsd8g/JMMtIuUxdYSzP+sn8U8Op7e+8aUq
	faRPVizLNmS8NxL62OJ+R0Zpa5sFKz8n7YRGz0OLWoUyNQCEBB81bu+gIu4OZ9QGht1mK8zjJYmvl
	jHoBQBoKNmJ7z+T8IGyASZON8MzEjuiEysAjSJOD6J2MBZRRDCrz4xyA5p5F/138pwUT0cAE6gV3v
	Gx8mfCyO8Vcog9UNwZGwZ4DUPWx7GBnneFC9VOlU6aTRtY7ZBu1bXb/jBh2dPBa44cIUux/M6509x
	YuOGcipfecRd+HKBY7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWX7i-008ads-PY; Mon, 27 Feb 2023 06:36:34 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWX7e-008acU-GV
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 06:36:32 +0000
Received: by mail-io1-xd33.google.com with SMTP id b5so2190684iow.0
        for <linux-riscv@lists.infradead.org>; Sun, 26 Feb 2023 22:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7sO0bMZpYnxMStsyVe05Epx0NsAkdFcv2H7c43sQOtg=;
        b=qpzx4DzoLh+ZvlV8hCI6D/z4v46S+1TSahmFrC5pQHpJ5RUJvDP9ynRENQNeojzNmV
         3ZpisoHp/sC7u3cH1gUJI0USNXj3J8aKS/mB/+LViFfkKhvLgmEALcuSWxFqx8+gB+if
         xMC2abo0dxMa9/uz9dmlzHJNXDJ3yMwyOKhXD8ZK1XC4ds1K3ILJnBgLp6wH8nJArqmC
         mgM/H/+GwU37rOhZ4xf/jrGBhnMKUg25YU5912TLCVU6eZUT4+8mTsXg1euxun7aGhoe
         nUkjkbydqjK0FI12Nl5CuZ9UHowmiCQLI0vSY5frlYbvZSdqI/N4GXDuKRVJA2PXS6te
         MXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sO0bMZpYnxMStsyVe05Epx0NsAkdFcv2H7c43sQOtg=;
        b=PfywaY6eRfQjwnSDbrcKq26LypLFw1N/lyb8/VTqUKfZOguNtvGiDHg75TDJkMDZMV
         QNLksjZAMJ/fo1CPm79NMDLzfeR4QQaj0mdLVB3RLoS2gZdD2Vg5/Tv6MGVWFg2+ga8J
         eqQvty0pltt64AhCKdlxXIomGnuhlQVcCggoB0nE4Zn60PVaOC4UVk6G3h+SDe1ji8h/
         d7pno6JMNdVjNbWJia+Th4Qsdy/usWY/WPeCkR5x0mKBloSw8ICqBAAGgalDwVwKcqNM
         37TPX2zVi4NBFH2G5dc9/BQ6nV2U95yZY7umRpl062faGYNXMWBv7HjcCURQ4Vg0Axq+
         pX1g==
X-Gm-Message-State: AO0yUKUlz+1P10W3X5OEyZPErQdrF5BBk2LXwksFHr4N5DlkLEz3yg6O
	EhRzN+i2CwU8Buw4dcC0zgk=
X-Google-Smtp-Source: AK7set8J7OQnEUJHpOVjsdWjF01bozA5t8Z//DgdLIKheUKUy31nZSR+PgKd5tGVJMFuIP6PSbMHZA==
X-Received: by 2002:a5d:8b56:0:b0:74c:87b5:a083 with SMTP id c22-20020a5d8b56000000b0074c87b5a083mr14708547iot.17.1677479785615;
        Sun, 26 Feb 2023 22:36:25 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f11-20020a6bdd0b000000b0073a658f7951sm1784739ioc.48.2023.02.26.22.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 22:36:24 -0800 (PST)
Message-ID: <547a469d-eeaa-750c-4fe5-cc82d92493a6@roeck-us.net>
Date: Sun, 26 Feb 2023 22:36:22 -0800
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
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <58cab864-2a59-b82c-bdfe-2e805a04fd7a@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_223630_604268_E0E17F4D 
X-CRM114-Status: GOOD (  18.08  )
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

T24gMi8yNi8yMyAyMjoyNiwgWGluZ3l1IFd1IHdyb3RlOgo+IE9uIDIwMjMvMi8yNCAyMzoxOCwg
R3VlbnRlciBSb2VjayB3cm90ZToKPj4gT24gMi8yMy8yMyAyMzo0MiwgWGluZ3l1IFd1IHdyb3Rl
Ogo+Pj4gT24gMjAyMy8yLzI0IDI6MjMsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4+Pj4gT24gTW9u
LCBGZWIgMjAsIDIwMjMgYXQgMDQ6MTk6MjZQTSArMDgwMCwgWGluZ3l1IFd1IHdyb3RlOgo+Pj4+
PiBbLi4uXQo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgd2R0LT53ZHRfZGV2aWNlLm1pbl90aW1lb3V0
ID0gMTsKPj4+Pj4gK8KgwqDCoCB3ZHQtPndkdF9kZXZpY2UubWF4X3RpbWVvdXQgPSBzdGFyZml2
ZV93ZHRfbWF4X3RpbWVvdXQod2R0KTsKPj4+Pgo+Pj4+ICDCoMKgwqDCoHdkdC0+d2R0X2Rldmlj
ZS50aW1lb3V0ID0gU1RBUkZJVkVfV0RUX0RFRkFVTFRfVElNRTsKPj4+Pgo+Pj4+IHNob3VsZCBi
ZSBzZXQgaGVyZS4gT3RoZXJ3aXNlIHRoZSB3YXJuaW5nIGJlbG93IHdvdWxkIGFsd2F5cyBiZSBz
ZWVuCj4+Pj4gaWYgdGhlIG1vZHVsZSBwYXJhbWV0ZXIgaXMgbm90IHNldC4KPj4+Pgo+Pj4+PiAr
Cj4+Pj4+ICvCoMKgwqAgd2F0Y2hkb2dfc2V0X2RydmRhdGEoJndkdC0+d2R0X2RldmljZSwgd2R0
KTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIC8qCj4+Pj4+ICvCoMKgwqDCoCAqIHNlZSBpZiB3ZSBj
YW4gYWN0dWFsbHkgc2V0IHRoZSByZXF1ZXN0ZWQgaGVhcnRiZWF0LAo+Pj4+PiArwqDCoMKgwqAg
KiBhbmQgaWYgbm90LCB0cnkgdGhlIGRlZmF1bHQgdmFsdWUuCj4+Pj4+ICvCoMKgwqDCoCAqLwo+
Pj4+PiArwqDCoMKgIHdhdGNoZG9nX2luaXRfdGltZW91dCgmd2R0LT53ZHRfZGV2aWNlLCBoZWFy
dGJlYXQsIGRldik7Cj4+Pj4+ICvCoMKgwqAgaWYgKHdkdC0+d2R0X2RldmljZS50aW1lb3V0ID09
IDAgfHwKPj4+Pgo+Pj4+IElmIHdkdC0+d2R0X2RldmljZS50aW1lb3V0IGlzIHByZS1pbml0aWFs
aXplZCwgaXQgd2lsbCBuZXZlciBiZSAwIGhlcmUuCj4+Pj4KPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHdkdC0+d2R0X2RldmljZS50aW1lb3V0ID4gd2R0LT53ZHRfZGV2aWNlLm1heF90aW1lb3V0KSB7
Cj4+Pj4KPj4+PiBUaGF0IHdvbid0IGhhcHBlbiBiZWNhdXNlIHdhdGNoZG9nX2luaXRfdGltZW91
dCgpIHZhbGlkYXRlcyBpdCBhbmQgZG9lcwo+Pj4+IG5vdCB1cGRhdGUgdGhlIHZhbHVlIGlmIGl0
IGlzIG91dCBvZiByYW5nZS4KPj4+Pgo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X3dhcm4oZGV2
LCAiaGVhcnRiZWF0IHZhbHVlIG91dCBvZiByYW5nZSwgZGVmYXVsdCAlZCB1c2VkXG4iLAo+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNUQVJGSVZFX1dEVF9ERUZBVUxUX1RJTUUpOwo+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgd2R0LT53ZHRfZGV2aWNlLnRpbWVvdXQgPSBTVEFSRklWRV9X
RFRfREVGQVVMVF9USU1FOwo+Pj4+Cj4+Pj4gQW5kIHRoaXMgaXMgdGhlbiB1bm5lY2Vzc2FyeS4g
d2R0LT53ZHRfZGV2aWNlLnRpbWVvdXQgd2lsbCBhbHdheXMgYmUKPj4+PiB2YWxpZCBpZiBpdCB3
YXMgcHJlLWluaXRpYWxpemVkLgo+Pj4KPj4+IEl0IGlzIGNoYW5nZWQgdG8gYmUgdGhpcyBhdCBi
ZWdpbm5pbmcgb2YgdGhlIGRyaXZlcjoKPj4+Cj4+PiBzdGF0aWMgaW50IGhlYXJ0YmVhdCA9IFNU
QVJGSVZFX1dEVF9ERUZBVUxUX1RJTUU7Cj4+Pgo+Pgo+PiBObywgdGhpcyBpcyB3cm9uZy4gVGhl
IHN0YXRpYyB2YXJpYWJsZSBzaG91bGQgYmUgc2V0IHRvIDAgdG8gaW5kaWNhdGUKPj4gInVzZSBk
ZWZhdWx0Ii4KPj4KPj4+IGFuZCBpdCBpcyBjaGFuZ2VkIHRvIGJlIHRoaXMgaGVyZToKPj4+Cj4+
PiByZXQgPSB3YXRjaGRvZ19pbml0X3RpbWVvdXQoJndkdC0+d2R0X2RldmljZSwgaGVhcnRiZWF0
LCBkZXYpOwo+Pj4gaWYgKHJldCkKPj4+ICDCoMKgwqDCoHJldHVybiByZXQ7Cj4+Pgo+Pj4gV291
bGQgdGhhdCBiZSBiZXR0ZXI/Cj4+Pgo+Pgo+PiBObywgaXQgaXMgd29yc2UsIGJlY2F1c2UgaXQg
d291bGQgbm90IGluc3RhbnRpYXRlIHRoZSB3YXRjaGRvZyBhdCBhbGwKPj4gaWYgYSBiYWQgaGVh
cnRiZWF0IGlzIHByb3ZpZGVkLgo+Pgo+IAo+IFNvIGluc3RhbnRpYXRlIHRoZSB3YXRjaGRvZyB3
aXRoIGhlYXJiZWF0IGZpcnN0LiBBbmQgaWYgdGhpcyB3cm9uZywgdXNlIGRlZmF1bHQgdGltZW91
dC4KPiA6Cj4gaWYgKHdhdGNoZG9nX2luaXRfdGltZW91dCgmd2R0LT53ZHRfZGV2aWNlLCBoZWFy
dGJlYXQsIGRldikpCj4gCXdkdC0+d2R0X2RldmljZS50aW1lb3V0ID0gU1RBUkZJVkVfV0RUX0RF
RkFVTFRfVElNRTsKPiAKCkkgYW0ga2luZCBvZiBsb3N0IHdoeSB5b3UgaGF2ZSB0byBtYWtlIGl0
IHRoYXQgY29tcGxpY2F0ZWQuCkp1c3QgcHJlLWluaXRpYWxpemUgd2R0LT53ZHRfZGV2aWNlLnRp
bWVvdXQgbGlrZSBhbGwgdGhlIG90aGVyIGRyaXZlcnMgZG8sCmFuZCBhcyBJIGhhZCBzdWdnZXN0
ZWQgZWFybGllci4KCkd1ZW50ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
