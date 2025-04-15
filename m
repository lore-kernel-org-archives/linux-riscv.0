Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F35C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 10:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+F17KEd4OviqvAccJX32nrx02hr3TTiNmW6wyT7vByM=; b=MYjdHys8tPZeel
	b79kW24ad8sT+4JVmwy9TmUOayRGqAWvrRIbi0L2otuBqPx/PiEHrju5nfgkAhoagQ0O+KjaSYKPB
	eTn8nve1khDpMNvEKTqV5P4+jKVRTlTFzDJMc+RcJ9fIDNW0vMYL6A1LD+yUaLo8AGYeEC132jYUR
	92o7kCCaK1MsvhqZgZbxV9hf+5DgqTVD5gLsFpOhrGVvI98HR/LRnvLMsiVOhPsmdbCyD2L9z+Jr4
	bq3qzBDyU/UihBGZ4gDEFB3WIkCO6Ah0bM+ur8oj9ii892FPH2ihooeWGQsQ78sxqmYPcT8jVHMzV
	gmoTg10ZOvzcWCse+Shw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dEV-00000005HIn-2Eyy;
	Tue, 15 Apr 2025 10:09:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4d0b-00000005Dze-26po
	for linux-riscv@bombadil.infradead.org;
	Tue, 15 Apr 2025 09:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6Sd6Yg3rC21jnGehy22uUVz7lDVf6VWqh6Q2Fhe7kCA=; b=AmdcfAkMx2w7K7sJwazlQS00pB
	rooEsASlusF4RAf0j/51sOfdDzTMQPvvxFd6EH2k3eAuDcpv6DYt6JdzCiVvY62n8BDizvu3liriI
	3L8H/j+x9dCb9gHLY9SuQ/jCOPKLbUwMT7Gs97YWo5nGx3KbUyQnsL4kUR0pLkl1GnAxnLYYfwab7
	8G+i3C32Ec+sMR9wn+TYJg3kEkp1+TvlekjmtIojpehBDCiRPMavVsQOT8X8fYWzc68skTH0tcbPQ
	wka/c44bqP2vG2WPStOB3mh9w4mP2iRdi2D0OUEZj4zkJCop5UeoHAPXQXJF3QwC9ZyKrgJFCf4n1
	13OvFEKA==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4d0X-00000009qgY-2QPv
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 09:55:12 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso890343766b.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 02:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744710904; x=1745315704; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Sd6Yg3rC21jnGehy22uUVz7lDVf6VWqh6Q2Fhe7kCA=;
        b=S71yXutoljJI0T6XFmpZIbB4E7ovye7YaV1Lor9X6GxNG7OPs0tTaGivzoz7i3SQZV
         apPJg6MvYLR/lfJLpuIzOvQzYaHmnrCr0QITfOaFTKJu/Joa9LJ7Fuy0p8WdMWF0DtMs
         5NPJ2XWQwBtM2wxp61TPF5Pz3J0cMCelrRA0Uyf57j84EHnQfGeMHyNyYDNzSZ61Bvji
         xPRRlPEttM1zSu9JP6zfO6yAX6IMfxyUKxToiZ2UN4OxBbxq4g3DwPj6Hyp5aVFBbz09
         37bpEuZVcINd8RvrMj8JuIh2eVgOUItpi1qVhjqoA3Q1loeeE7mK5rvG2hmcuXPtF8tG
         Kw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710904; x=1745315704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Sd6Yg3rC21jnGehy22uUVz7lDVf6VWqh6Q2Fhe7kCA=;
        b=gRnwRbewGjxnryHNtVclPgRmLPORvlG4XAw2mhGkOita6gvVQUSYXlNCwjZVXheAlM
         Rdn22mkngmw9bIsWLL9kDbzqPhtqrL0R59CVcUlVjrpYrfaxau4Bn5AGdxIQxP7dwbyb
         yDXQQKue08rpZt5BzIeUAdqXneppnZT6hrrQNLj2VbDqml+G7a/fQeICjI0cjJIhKg4U
         MjVht2qV0BvMA6mpgFvAqCOObU6COPS3O22lJlZZo379s8x+HSMY8Lcl+rJpdEyfYvl7
         vRArjca2TcbzZ5QQihq2fhgehfHFdutKpRg5hzyQmfSeNl7gyvLl3O2GBeEsZUmAItp2
         d6kg==
X-Forwarded-Encrypted: i=1; AJvYcCVoxnPQTDZaUxoL9Xzh2NHALBqXrZnpVVbg0CO9mmPshb7/egmXqfFURO3SPuLPPlqCgSR5TjQj+ERNlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnuez7Sk9TBokSJ53YJ6fqS4eCqNhnk0hggn9RKet7jBsYXFLx
	c8RU0Q7QYUS3FbP6K8I7fxhKBZAZRWhDJ2pgYpnYqSOBj9x0OmnYj/z9toOAxq+X5B44OrjGva3
	C/gpM9yVXuPVq6HFsPPGC+SGhGKH1K2wN1+GeUw==
X-Gm-Gg: ASbGncvRiftqcIWXU3pIgfUSP6zUkQ+LzpR15RouLZ6czPjv8KUXuZbTqyFf6xbMMyh
	pYwlmKRXvoYNhMmHg7oquSBeT59UiY6J0rYAZ6yU5Y09CF0NmT00SzedEERu/kFgPUgvkz/SN/X
	RluhJFR94uKIfqz2I+KVmbnhlyEA==
X-Google-Smtp-Source: AGHT+IHAU8wJfJDF4eNSdv0Zm5P/kiq6Yogbh7eiqNmQ6osroOUsaiP2v1/BjbNJSKe15J8jBc9YnfV5U+5wxjTv07U=
X-Received: by 2002:a17:906:7154:b0:aca:dd0c:cfc8 with SMTP id
 a640c23a62f3a-acadd0cd3bamr1109850866b.10.1744710904488; Tue, 15 Apr 2025
 02:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com> <20250411-confider-spinster-35f23040d188@spud>
 <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
In-Reply-To: <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 15 Apr 2025 17:54:52 +0800
X-Gm-Features: ATxdqUGYHln9nntZsdf9jj-vYb0_3U3ad99wI0oBwmwTA_WUeFe5BkvwdaXHs0w
Message-ID: <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property resets
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Conor Dooley <conor@kernel.org>, ukleinek@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org, 
	drew@pdp7.com, inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_105509_928172_5DE0DD70 
X-CRM114-Status: GOOD (  16.73  )
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

T24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgNDo1M+KAr1BNIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxA
cGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gRnIsIDIwMjUtMDQtMTEgYXQgMTc6NDQgKzAx
MDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+IE9uIEZyaSwgQXByIDExLCAyMDI1IGF0IDA5OjE0
OjE1UE0gKzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiA+IEFkZCBhbiBvcHRpb25hbCByZXNl
dHMgcHJvcGVydHkgZm9yIHRoZSBNYXJ2ZWxsIFBXTSBQWEEgYmluZGluZy4KPiA+ID4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiA+IC0t
LQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9tYXJ2ZWxsLHB4
YS1wd20ueWFtbCB8IDMgKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcHdtL21hcnZlbGwscHhhLXB3bS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3B3bS9tYXJ2ZWxsLHB4YS1wd20ueWFtbAo+ID4gPiBpbmRleCA5ZWUxOTQ2ZGMyZTEu
Ljk2NDBkNGI2MjdjMiAxMDA2NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3B3bS9tYXJ2ZWxsLHB4YS1wd20ueWFtbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL21hcnZlbGwscHhhLXB3bS55YW1sCj4gPiA+IEBA
IC0zMSw2ICszMSw5IEBAIHByb3BlcnRpZXM6Cj4gPiA+ICAgIGNsb2NrczoKPiA+ID4gICAgICBt
YXhJdGVtczogMQo+ID4gPgo+ID4gPiArICByZXNldHM6Cj4gPiA+ICsgICAgbWF4SXRlbXM6IDEK
PiA+Cj4gPiBEbyBhbnkgb2YgdGhlIGN1cnJlbnRseSBzdXBwb3J0ZWQgZGV2aWNlcyB1c2UgYSBy
ZXNldD8gSWYgbm90LCB0aGVuIGFkZAo+ID4gdGhpcyBpbiB0YW5kZW0gd2l0aCB0aGUgbmV3IGNv
bXBhdGlibGUgYW5kIG9ubHkgYWxsb3cgaXQgdGhlcmUgcGxlYXNlLgo+Cj4gQWxzbywgaWYgc3Bh
Y2VtaXQsazEtcHdtIGNhbiBub3Qgd29yayB3aXRob3V0IHRoZSByZXNldCBiZWluZwo+IGRlYXNz
ZXJ0ZWQsIG1hcmsgaXQgYXMgcmVxdWlyZWQuCj4KClRoYW5rIHlvdSBQaGlsaXBwLiBzcGFjZW1p
dCxrMS1wd20gY2FuIG5vdCB3b3JrIHdpdGhvdXQgdGhlIHJlc2V0LgpJIHdpbGwgYWRkIHRoYXQg
aW4gdGhlIG5leHQgdmVyc2lvbi4KCi1HdW9kb25nCgo+IFRoZSBkcml2ZXIgY2FuIHN0aWxsIHVz
ZSByZXNldF9jb250cm9sX2dldF9vcHRpb25hbC4KPgo+IHJlZ2FyZHMKPiBQaGlsaXBwCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
