Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A23C48260
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 07:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+lvrSjciGviDYV24vDfG6cGXqu2SIQbZ3l/ko4M+l8=; b=wsQuhncKyQOPTv
	e4VzZx3Jt2JYgIuAQjUFeVm5Rzu/e0Fj5FoLzymp+TbyNMCve2sieOtd8RObpaLB2rrWWJr9S9SLT
	Cg3NVKWRHnKJjs3zYSo1XwOZ7UFDI5ebyuQ57vBBVqq/sGUEqe7NW8QJaBDuN+S9RzUpeYQSd64hJ
	Tpe4//0+lUjupUQZxsk92LVr0tEBzIdseTz60KGeNR/Tw9GIxilS9war2pjYgk/PjKUGZtwRQbYsl
	oK6rWjDAa5yJAbZIay3AkawlsgK4DBr2oM8iBtaENyHBddOzGmEsEVBPhZVIqMs72keNh1LMqznlY
	Gund4VGm18N/dyPvEdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbyD4-00000009OZE-2R44;
	Mon, 19 Feb 2024 07:37:06 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbyD1-00000009OYj-3EoG
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 07:37:04 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-511976c126dso4786620e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 18 Feb 2024 23:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708328219; x=1708933019; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZKyFQ6cSp7LJWXpDL9YbFwutlq73FoMYcAlibyNYzc=;
        b=nLNu6YIQD4fjtVPQyywUEk3rPg/VFgkVVUPoMHKTtPN/vX0iAEkhbMk1rPIyQQZDK+
         E+PBQDeNEGgQCeDMcsuTPNh+xB6UfddNBng1M1BUsAFqcQ5Pu+VB94K1kzMLqKeh6+/4
         owKBhZ1r9BpKwMeQs5WXoyRO6FeWB1wOeTNGbxcf21m/ChHILWJL0RAI1RMRHmHTUZgJ
         H9qxSTWRS+onMOdTXaqyvxv2TbCdVX3Z6SIKDv4Ggk+qImTWphsfbQlUjHb31hh8lrND
         b7WnxXH6teqIWrY+UgiJC9ueVCImIW/w2MpOwi8OjF6qxRG5mgWdGqCNe0JmjfNYfg3E
         M6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328219; x=1708933019;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZKyFQ6cSp7LJWXpDL9YbFwutlq73FoMYcAlibyNYzc=;
        b=cP2GSaV53nCxQRkha1xoOXnHj338k3rpTVNAtnUlMpWX0Gk7Qb3s6VHcPAzkTRfzsS
         oHpjsFMPrZb9bUPk5ilaPCVm3WvPbqkn7vcEvyS9fBFAbvL5nrPB4rKTMf1zdszchrHa
         h6VEPkLEyALgUG0foGXUvVVlwpCNo+ckRiS/1XrZUYUk0gZLjBnftLKD5WTTM1RMYvGr
         9htLXdJGz0l0vPxlczP858jchV8Sz/MiaQ0zz19dOepUzMiXERxrp2nm6a7sFFRksB1H
         q6Woc7U4bPJSODfEjQ18AyVWYfCfTfG8NSsE50ev4jqCZd8GTNrPX7eFATycz06NVilY
         LRTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD3kmfeLATP1S3HRplJ1kLsx8rQMvIcxCIMh/9pTz/n/bRnGudHtUScAoyZ2XsdjCOjlcka6N8zoHNSgwDI9Gevr0fGkvyCrX2UF45WP5W
X-Gm-Message-State: AOJu0YxF7/t1hBVZl6ddqB+ms3/WXAg5aNw3KrjSPPcPTv7KR8bA5tsu
	+ETww0VNPb59t13cDvF4JFxRbc/nmQtcl8gAr3W/XKhHt5R1qUC9yAZ7tQxwINQ=
X-Google-Smtp-Source: AGHT+IGLlnSbXEfT/nz2ZRTz3Bukdz93vaxjL6h+T1orH0nNTKmUP+vrTRlindEMbWk6USyL3b+mLQ==
X-Received: by 2002:a05:6512:6d4:b0:511:e296:e563 with SMTP id u20-20020a05651206d400b00511e296e563mr8756725lff.2.1708328218821;
        Sun, 18 Feb 2024 23:36:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c1d1400b0041256ab5becsm7617445wms.26.2024.02.18.23.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 23:36:58 -0800 (PST)
Message-ID: <e7a6a1c9-ba29-4103-a2f7-310c1cee1f17@tuxon.dev>
Date: Mon, 19 Feb 2024 09:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power domain
 IDs
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUCB3GQxGPxG35rebN2yrKYBnZDzORaEEOuZb3aMgrf6g@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUCB3GQxGPxG35rebN2yrKYBnZDzORaEEOuZb3aMgrf6g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_233703_833902_A9DD35AA 
X-CRM114-Status: GOOD (  18.84  )
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

SGksIEdlZXJ0LAoKT24gMTYuMDIuMjAyNCAxNjowMSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3Rl
Ogo+IEhpIENsYXVkaXUsCj4gCj4gT24gVGh1LCBGZWIgOCwgMjAyNCBhdCAxOjQz4oCvUE0gQ2xh
dWRpdSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2PiB3cm90ZToKPj4gRnJvbTogQ2xhdWRpdSBC
ZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPgo+Pgo+PiBBZGQgcG93ZXIg
ZG9tYWluIElEcyBmb3IgUlovRzJVTCAoUjlBMDdHMDQzKSBTb0MuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4KPiAK
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gCj4+IC0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3Mv
Y2xvY2svcjlhMDdnMDQzLWNwZy5oCj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2sv
cjlhMDdnMDQzLWNwZy5oCj4+IEBAIC0yMDAsNSArMjAwLDUzIEBACj4+ICAjZGVmaW5lIFI5QTA3
RzA0M19BWDQ1TVBfQ09SRTBfUkVTRVROICA3OCAgICAgIC8qIFJaL0ZpdmUgT25seSAqLwo+PiAg
I2RlZmluZSBSOUEwN0cwNDNfSUFYNDVfUkVTRVROICAgICAgICAgNzkgICAgICAvKiBSWi9GaXZl
IE9ubHkgKi8KPj4KPj4gKy8qIFBvd2VyIGRvbWFpbiBJRHMuICovCj4+ICsjZGVmaW5lIFI5QTA3
RzA0M19QRF9BTFdBWVNfT04gICAgICAgICAwCj4+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9HSUMg
ICAgICAgICAgICAgICAxCj4gCj4gQXMgdGhpcyBmaWxlIGlzIHNoYXJlZCBiZXR3ZWVuIFJaL0cy
VUwgYW5kIFJaL0ZpdmUsIFI5QTA3RzA0M19QRF9HSUMKPiBuZWVkcyBhbiAiLyogUlovRzJVTCBP
bmx5ICovIiBjb21tZW50CgpPay4gSSdsbCByZS1jaGVja2VkIGl0IGFuZCB1cGRhdGUuIExpa2V3
aXNlIGZvciB0aGUgcmVzdCBvZiB5b3VyIGJlbG93IHBvaW50cy4KCj4gCj4+ICsjZGVmaW5lIFI5
QTA3RzA0M19QRF9JQTU1ICAgICAgICAgICAgICAyCj4+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9N
SFUgICAgICAgICAgICAgICAzCj4+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9DT1JFU0lHSFQgICAg
ICAgICA0Cj4+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9TWUMgICAgICAgICAgICAgICA1Cj4gCj4g
TGlrZXdpc2UgZm9yIHRoZSBmb3VyIGFib3ZlLgo+IAo+PiArI2RlZmluZSBSOUEwN0cwNDNfUERf
RE1BQyAgICAgICAgICAgICAgNgo+PiArI2RlZmluZSBSOUEwN0cwNDNfUERfR1RNMCAgICAgICAg
ICAgICAgNwo+PiArI2RlZmluZSBSOUEwN0cwNDNfUERfR1RNMSAgICAgICAgICAgICAgOAo+PiAr
I2RlZmluZSBSOUEwN0cwNDNfUERfR1RNMiAgICAgICAgICAgICAgOQo+PiArI2RlZmluZSBSOUEw
N0cwNDNfUERfTVRVICAgICAgICAgICAgICAgMTAKPj4gKyNkZWZpbmUgUjlBMDdHMDQzX1BEX1BP
RTMgICAgICAgICAgICAgIDExCj4+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9XRFQwICAgICAgICAg
ICAgICAxMgo+PiArI2RlZmluZSBSOUEwN0cwNDNfUERfU1BJICAgICAgICAgICAgICAgMTMKPj4g
KyNkZWZpbmUgUjlBMDdHMDQzX1BEX1NESEkwICAgICAgICAgICAgIDE0Cj4+ICsjZGVmaW5lIFI5
QTA3RzA0M19QRF9TREhJMSAgICAgICAgICAgICAxNQo+PiArI2RlZmluZSBSOUEwN0cwNDNfUERf
SVNVICAgICAgICAgICAgICAgMTYKPj4gKyNkZWZpbmUgUjlBMDdHMDQzX1BEX0NSVSAgICAgICAg
ICAgICAgIDE3Cj4+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9MQ0RDICAgICAgICAgICAgICAxOAo+
IAo+IExpa2V3aXNlIGZvciB0aGUgdGhyZWUgYWJvdmUuCj4gCj4+ICsjZGVmaW5lIFI5QTA3RzA0
M19QRF9TU0kwICAgICAgICAgICAgICAxOQo+PiArI2RlZmluZSBSOUEwN0cwNDNfUERfU1NJMSAg
ICAgICAgICAgICAgMjAKPj4gKyNkZWZpbmUgUjlBMDdHMDQzX1BEX1NTSTIgICAgICAgICAgICAg
IDIxCj4+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9TU0kzICAgICAgICAgICAgICAyMgo+PiArI2Rl
ZmluZSBSOUEwN0cwNDNfUERfU1JDICAgICAgICAgICAgICAgMjMKPj4gKyNkZWZpbmUgUjlBMDdH
MDQzX1BEX1VTQjAgICAgICAgICAgICAgIDI0Cj4+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9VU0Ix
ICAgICAgICAgICAgICAyNQo+PiArI2RlZmluZSBSOUEwN0cwNDNfUERfVVNCX1BIWSAgICAgICAg
ICAgMjYKPj4gKyNkZWZpbmUgUjlBMDdHMDQzX1BEX0VUSEVSMCAgICAgICAgICAgIDI3Cj4+ICsj
ZGVmaW5lIFI5QTA3RzA0M19QRF9FVEhFUjEgICAgICAgICAgICAyOAo+PiArI2RlZmluZSBSOUEw
N0cwNDNfUERfSTJDMCAgICAgICAgICAgICAgMjkKPj4gKyNkZWZpbmUgUjlBMDdHMDQzX1BEX0ky
QzEgICAgICAgICAgICAgIDMwCj4+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9JMkMyICAgICAgICAg
ICAgICAzMQo+PiArI2RlZmluZSBSOUEwN0cwNDNfUERfSTJDMyAgICAgICAgICAgICAgMzIKPj4g
KyNkZWZpbmUgUjlBMDdHMDQzX1BEX1NDSUYwICAgICAgICAgICAgIDMzCj4+ICsjZGVmaW5lIFI5
QTA3RzA0M19QRF9TQ0lGMSAgICAgICAgICAgICAzNAo+PiArI2RlZmluZSBSOUEwN0cwNDNfUERf
U0NJRjIgICAgICAgICAgICAgMzUKPj4gKyNkZWZpbmUgUjlBMDdHMDQzX1BEX1NDSUYzICAgICAg
ICAgICAgIDM2Cj4+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9TQ0lGNCAgICAgICAgICAgICAzNwo+
PiArI2RlZmluZSBSOUEwN0cwNDNfUERfU0NJMCAgICAgICAgICAgICAgMzgKPj4gKyNkZWZpbmUg
UjlBMDdHMDQzX1BEX1NDSTEgICAgICAgICAgICAgIDM5Cj4+ICsjZGVmaW5lIFI5QTA3RzA0M19Q
RF9JUkRBICAgICAgICAgICAgICA0MAo+PiArI2RlZmluZSBSOUEwN0cwNDNfUERfUlNQSTAgICAg
ICAgICAgICAgNDEKPj4gKyNkZWZpbmUgUjlBMDdHMDQzX1BEX1JTUEkxICAgICAgICAgICAgIDQy
Cj4+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9SU1BJMiAgICAgICAgICAgICA0Mwo+PiArI2RlZmlu
ZSBSOUEwN0cwNDNfUERfQ0FORkQgICAgICAgICAgICAgNDQKPj4gKyNkZWZpbmUgUjlBMDdHMDQz
X1BEX0FEQyAgICAgICAgICAgICAgIDQ1Cj4+ICsjZGVmaW5lIFI5QTA3RzA0M19QRF9UU1UgICAg
ICAgICAgICAgICA0Ngo+Pgo+PiAgI2VuZGlmIC8qIF9fRFRfQklORElOR1NfQ0xPQ0tfUjlBMDdH
MDQzX0NQR19IX18gKi8KPiAKPiBJbiBhZGRpdGlvbiwgeW91IG5lZWQgZGVmaW5pdGlvbnMgZm9y
IHRoZSBtb2R1bGVzIHRoYXQgYXJlIG9ubHkKPiBwcmVzZW50IG9uIFJaL0ZpdmUsIGUuZy4KPiAK
PiAgICAgI2RlZmluZSBSOUEwN0cwNDNfUERfUExJQyAgICAgICAgICAgICAgIDQ3ICAgIC8qIFJa
L0ZpdmUgT25seSAqLwo+IAo+IEdye29ldGplLGVldGluZ31zLAo+IAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0Cj4gCj4gCj4gLS0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCj4gCj4g
SW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBt
eXNlbGYgYSBoYWNrZXIuIEJ1dAo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
