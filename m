Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C73DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 21:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Tc4h8n5S96hk23O3k5cgakjYOw0XAPGXfqFs/tWv4ac=; b=p0JRz1Ez530rrJIFODWsYnu1Q4
	PaYraOrrgMkwFWFJvROWx0NHoBacug5gToxdgq8k5IETTkS7rqDHEUdfGw85tejd/2g+dBq7ywA4A
	pCnl1+Ejo4CEfqQulLgoGGerdFga3WNuNtTifLX/9b0xmIloDJU3O4CSKRnslx/FLy8lvsnvYfUUE
	fUJEuKUjws5WFm7H+BOFqXSbsWIXTM+vWOLczWMQvOW3N2a8NTnTG3+kLDGs1uBs0r2G+drfqK0Os
	jIQVsltBU1eGkNw/ruMA4OKlEEeX+p6oxh4qa6urCMYok5ZiYt8yFH5mT7qti2q/m2H750bt4eDBZ
	NgTZRr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni115-002b3R-3T; Fri, 22 Apr 2022 21:40:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni110-002b2Q-QZ
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 21:40:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id u15so10211999ple.4
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 14:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hprmnOUA4/3FlmJh7kQF6XL3/Oe5JP21iOb+ppvENHA=;
 b=VdTgxJp6iaQGYLdO2T00e5mydN8yUlSBKdxKAR02oKgdllMIajdCnVACLvEDHFAm0K
 +FdTgKJYWpIdn0HVA3RD0Ql+Vl0U2Q0CyCxHBWI8W56ilGD7Bdh0PK0Ho6bF49WHDXH6
 WrFIMtgPHK9MqZchFV7tUBu3FHfY/x4rQj7vlxQ6bvaQDGcFvS4155E5zFh5RNxjf/zq
 wnOYaXbdhPyWGL2hUvO9hiETdErtm3tKRfS24aAbvMbl/UQn/Fjo2xF6Ldw9kixJdZ84
 B2zbkO5eAi3VuDIrZhhODYWj7oqQ3yL+07L9w/3Q7N2IQIEv5wS/okO4N3rdG3E5bphy
 0prA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hprmnOUA4/3FlmJh7kQF6XL3/Oe5JP21iOb+ppvENHA=;
 b=6u3ynJn8+vg+Yqa0hJVCI7GAvcLzqURThmjdG/H0yKOy34XwiokqouiEm66UDGWo/B
 okTQ9lzuF/WKCn4+YK/VRVbLsCWayWZYQQlC9Sz/tuC2MDDUdkizYH60h3giNHjRvxmj
 Bw3T7y/ArNI1BnHxAiab3ii+UoGdCXiE+mdSkGBLP5/Q418xUHPByHw/u1cD8V1j4935
 o3/HDSpSdHgu5p8UUIbNhC9tdVKsoQS4ECBQFiyBHI9VAJzu89uRYC50ejeupi0+FIYF
 7pUTAORpABqfgRb2M96L/az9s6l9PYIYI9gZAUrY0kszW2Ivvf8xACPX16TUQhTi9FAB
 4d5Q==
X-Gm-Message-State: AOAM533OGgNFHiKgDJXKS9mfvvFaCBkStSYiLbpOqM1em2vQOVZLEnPg
 52Q56x/WtqXeaVJshfasohCKlA==
X-Google-Smtp-Source: ABdhPJy36dziWxrx9VNGKb+ZJ9QYf23DzNrptVA5BjFCnHIlqW+yS/E17cWlIdJ736Efbyw8yGz3uw==
X-Received: by 2002:a17:90a:8418:b0:1d2:7c69:e3bf with SMTP id
 j24-20020a17090a841800b001d27c69e3bfmr18408269pjn.44.1650663634143; 
 Fri, 22 Apr 2022 14:40:34 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 i6-20020a628706000000b0050adb5a4452sm3540245pfe.101.2022.04.22.14.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 14:40:33 -0700 (PDT)
Date: Fri, 22 Apr 2022 14:40:33 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Apr 2022 14:40:27 PDT (-0700)
Subject: Re: [PATCH v3 0/9] More PolarFire SoC Fixes for 5.18
In-Reply-To: <986c73df-9634-d18b-eed3-37584fa2ea89@conchuod.ie>
CC: sboyd@kernel.org, mturquette@baylibre.com, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, robh+dt@kernel.org, 
 krzk+dt@kernel.org, daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 conor.dooley@microchip.com, atulkhare@rivosinc.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: mail@conchuod.ie
Message-ID: <mhng-08dea5a1-77b8-4b79-93e3-cda9fffdf2ff@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_144034_877206_9F25EEB2 
X-CRM114-Status: GOOD (  17.22  )
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

T24gRnJpLCAyMiBBcHIgMjAyMiAxNDoxMDo1NSBQRFQgKC0wNzAwKSwgbWFpbEBjb25jaHVvZC5p
ZSB3cm90ZToKPgo+Cj4gT24gMjIvMDQvMjAyMiAyMjowMCwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+
PiBRdW90aW5nIENvbm9yIERvb2xleSAoMjAyMi0wNC0yMiAxMjo1OTowOSkKPj4+IE9uIDIyLzA0
LzIwMjIgMjA6MzksIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+Pj4+Cj4+Pj4gVGhhbmtzLsKgIFRo
ZXNlIGdlbmVyYWxseSBsb29rIGdvb2QgdG8gbWUsIGJ1dCBJIGRvbid0IHNlZSBhY2tzIGZyb20g
ZXZlcnlvbmUuwqAgSSdtIHBlcmZlY3RseSBmaW5lIHRyZWF0aW5nIHRoZXNlIGFzIGZpeGVzIGFu
ZCB0YWtpbmcgdGhlbSB0aHJvdWdoIHRoZSBSSVNDLVYgdHJlZSwgYnV0IGxvb2tzIGxpa2UgaXQn
cyBtb3N0bHkgY2xrIHN0dWZmIHNvCj4+Pj4KPj4+PiBBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQg
PHBhbG1lckByaXZvc2luYy5jb20+Cj4+Pgo+Pj4gWWUsIGhvcGVmdWxseSB0aGV5IGdvIHZpYSBj
bGsuIFN0ZXBoZW4gcmVwbGllZCB0byB2MSBvciAyIHNvCj4+PiBJIGZpZ3VyZSB0aGV5J3JlIGlu
IGhpcyBxdWV1ZSA6KQo+Pgo+PiBJdCBoZWxwcyB0byBiZSBleHBsaWNpdCBpbiB0aGUgY292ZXIg
bGV0dGVyLiBJdCdzIGluIG15IHF1ZXVlIGJ1dCBJIHB1dAo+PiBpdCBvbiBob2xkIGJlY2F1c2Ug
dGhlIGNvdmVyIGxldHRlciBkaWRuJ3QgY2xhcmlmeSB3aGF0IHRyZWUgaXQgd2FzCj4+IGludGVu
ZGVkIGZvciBub3IgdGhlIHByaW9yaXR5IG9mIHdoYXQgaXMgYmVpbmcgZml4ZWQuCj4KPiBBaCBy
aWdodCwgbXkgYmFkLiBUaGUgY29vcmRpbmF0aW5nIHRoaW5ncyBiZXR3ZWVuIHRyZWVzIHN0dWZm
IGlzCj4gc3RpbGwgcHJldHR5IG5ldyB0byBtZS4gSWYgeW91IGNvdWxkIHRha2UgdGhlIGxvdCB2
aWEgY2xrLCB0aGF0J2QKPiBiZSBncmVhdD8KCk5vIHByb2JsZW0sIHRoZSBtdWx0aS10cmVlIHN0
dWZmIGlzIGFsd2F5cyB0cmlja3kuICBJdCBlbmRlZCB1cCBpbiBteSAKcXVldWUgdG9vLCBidXQg
SSBmYXN0LWZvcndhcmQgdG8gdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIGVhY2ggc2V0IGFzIEkgCnN0
dW1ibGUgaW50byBlYXJsaWVyIG9uZXMgc28gSSBndWVzcyBJIGdvdCBoZXJlIHF1aWNrbHkuCgpI
YXZpbmcgdGhlc2UgZ28gdGhyb3VnaCBjbGsgaXMgYmV0dGVyIGZvciBtZSwgSSdsbCBpZ25vcmUg
dGhlbS4KClRoYW5rcyEKCj4+IElzIGJvb3QgYnJva2VuPyBEbyBJIG5lZWQgdG8gc2VuZCB0aGVz
ZSB1cCB0byBMaW51cyBuZXh0IHdlZWsgYXMgcGFydCBvZgo+PiBmaXhlcyBmb3IgdGhpcyBtZXJn
ZSB3aW5kb3c/Cj4KPiBCb290IGlzIG5vdCBicm9rZW4sIEkgd2FzIGhvcGluZyB0aGlzIHdvdWxk
IGdvIGludG8gNS4xOCB0byBhdm9pZAo+IGhhdmluZyB0byBkZWFsIHdpdGggdHdvIGRpZmZlcmVu
dCBzb3J0cyBvZiByZWZlcmVuY2UgY2xvY2sgRFQKPiBlbnRyaWVzIC0gNS4xOCB3aGVyZSB0aGUg
RFQgcHJvdmlkZXMgdGhlIG1zcyBwbGwgJiA1LjE4K24gd2hlcmUKPiB0aGUgRFQgcHJvdmlkZXMg
dGhlIGlucHV0IHRvIHRoZSBtc3MgcGxsLgo+Cj4gU28sIG5vdCBuZXh0IHdlZWsgdXJnZW50LCBi
dXQgYXMgZml4ZXMgZm9yIHRoaXMgd2luZG93IHBsZWFzZS4KPgo+IFRoYW5rcywKPiBDb25vci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
