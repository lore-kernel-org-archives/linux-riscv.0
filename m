Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48140C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 22:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mU6ARjOrA4dg4ZDNbSg2WmZf8aytPx60PFuoBmm6BvI=; b=bC+5/4C2U885YFP2QQeO/uK+ys
	+dkqo62XnX/1XEL2uxoA2ihmMyYundPpu9hDqY0JqePhvyI6tAkhxEJ1Fy+M/wPGw2sbN2myel+Vu
	gXMGUimw811bMSy6G4nyPCTzFEYgS7BxACswHFx7T2kuVC58i0U3TtYIwfO7WwqcZSlvX7H/n78BH
	m/JiPSIKyJn3O8mUCqf7B4RDWzKuH0hPqJBEAfW1+NBq7jPtYYPDKfnwhBIMjNK6aHy+Vsvq5rWEX
	f12gtlFFW8ggOKcT2jDMcJr3/nJnLmH0dqtVWnk6/hilXlPOPYpSgoOfDCrRnYSeKRimE0Lw8aTtT
	cNAOZDww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxwSj-00000007730-21Kj;
	Fri, 19 Apr 2024 22:12:05 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxwSe-0000000770e-1fTk
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 22:12:03 +0000
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 74CBF3F4BE
	for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 22:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713564709;
	bh=qDs1PP73Myr2habNrM7w8WokE4Tu9ltpN7loN9K/23g=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=klmOHkgYk/n2LOTPqho1MopK9AUepx8w88mJDGFGoevfHmBG6ChY/aEpcfTE1d5eU
	 +1AXdagyxC07nx9R8BkxnL8M8kqcSWIpYDvDN4nqMcBddvcWvpyd21l+ow0K38RdeZ
	 mcvYhz1Ba8yHyWiDhRTzSvGOldKqPCO2Oj+Tzvl354hzUTZHH1r1NCcPn/aMjTkouN
	 /3zf6vxqEbtKDCSI7rpbpnB4p2xV+OuLxZh33Vco6HZnaLGDNpRStvs85OvNShSxUw
	 Qf9Sn2318kp52aD19+1dhagmTWB2P+zrxIbjWk/Mugsl6mEY6RTWqWDPxpXzvoQ1G7
	 dRnvLtMWGs45Q==
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3c70d8bbbcfso3230835b6e.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 15:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713564708; x=1714169508;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qDs1PP73Myr2habNrM7w8WokE4Tu9ltpN7loN9K/23g=;
        b=VXUZiXiZpbg36lXnNCETJPWTpNoi8GMtuTCV9/1diDN4fKtantdpTjtnvSLEAKMFsB
         l9sDF3UgggSxj1vFMBPdbaYq+pefNiB3hAjWrxAZ0Xg6Ovfhgi0bI3JkjqdDUdBuWOCd
         MfBEX8jgfKSy2JjEpBH9OOjS1W+6Hy0ZurMVYvcUA+PqDNLC5agDezcsVoNbVy2CACAw
         WqLPTYTV4D1haeRD6b/2/DNBcRChr0aL9UfUTTo4q1baObUv2PvBp6yp+wGNvpcLKm18
         2lOrbDOiBA+gkwhhlrJ9Aa35vDq56I8p+PfTUK+QNzv1mTQrbrGxL59wPafNi4ofShVG
         BtUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp+ynsE+/iPgfb2fKQeE89/nqRVlk0MamWvnbVdW1inGYrpn0T/QFjPmtUY0ngD0rs0X6hm4hGiV8yWZh3DCWBVZ3vHrLYma3rR4uyc2XO
X-Gm-Message-State: AOJu0YwkrJ9V3DHyGywXklvDBhsJUyDNA66R4cgg2P12TrfnPQEXV3W/
	v++ftZzbWPh0NxW45rm3Qsk4UnnAlg5c5fr/o7dVeTXlRJM5xfUuzG5cImDPU0xaVbxiSoPAI87
	/TxbAFfyEgnx1KGYKmFwjPZsl/CN7Kghhz/gfYgLuJprGUou2i/YZbgHE+DLdd3MQXaYZoaLjVB
	6+KE/UwFik2V+ms4vxja7UYNGVI++x1LcX21UXEPBCMyAfhE6Pm+kEOwpJ
X-Received: by 2002:a05:6808:aa4:b0:3c7:df4:8fb2 with SMTP id r4-20020a0568080aa400b003c70df48fb2mr3355956oij.33.1713564708124;
        Fri, 19 Apr 2024 15:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE24uPXK76ve4p+kz9T9NLOzorCp/2i7z+OZo/ijMXuEyfIYaaX+7aIp5O26ess0IsJvcz+NdmGN13nL+4dm4U=
X-Received: by 2002:a05:6808:aa4:b0:3c7:df4:8fb2 with SMTP id
 r4-20020a0568080aa400b003c70df48fb2mr3355944oij.33.1713564707849; Fri, 19 Apr
 2024 15:11:47 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Apr 2024 15:11:47 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <ZgrIXHNRTB_NeDeF@xhacker>
References: <20240131132600.4067-1-jszhang@kernel.org> <20240131132600.4067-7-jszhang@kernel.org>
 <20240206-magma-deem-2c88e45a545a@spud> <43918921-0d05-41d3-a19b-f137314e868d@canonical.com>
 <ZgYn9t4akccWuHyf@xhacker> <013f6d51-7f78-4de0-945d-8902f32c850a@canonical.com>
 <ZgrIXHNRTB_NeDeF@xhacker>
Mime-Version: 1.0
Date: Fri, 19 Apr 2024 15:11:47 -0700
Message-ID: <CAJM55Z_BemQoQ8Qrcz_vYOJ3n+-3DKn_iu==58euv9HWa99dEw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: add Milkv Mars board device tree
To: Jisheng Zhang <jszhang@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_151200_589600_19FC4358 
X-CRM114-Status: GOOD (  29.49  )
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

SmlzaGVuZyBaaGFuZyB3cm90ZToKPiBPbiBNb24sIEFwciAwMSwgMjAyNCBhdCAwMzoyODozM1BN
ICswMjAwLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+ID4gT24gMy8yOS8yNCAwMzozMSwg
SmlzaGVuZyBaaGFuZyB3cm90ZToKPiA+ID4gT24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgMTA6Mjg6
MjhQTSArMDEwMCwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToKPiA+ID4gPiBPbiAyLzYvMjQg
MjA6MTMsIENvbm9yIERvb2xleSB3cm90ZToKPiA+ID4gPiA+IE9uIFdlZCwgSmFuIDMxLCAyMDI0
IGF0IDA5OjI2OjAwUE0gKzA4MDAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiA+ID4gPiA+IFRo
ZSBNaWxrdiBNYXJzIGlzIGEgZGV2ZWxvcG1lbnQgYm9hcmQgYmFzZWQgb24gdGhlIFN0YXJmaXZl
IEpINzExMCBTb0MuCj4gPiA+ID4gPiA+IFRoZSBib2FyZCBmZWF0dXJlczoKPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gLSBKSDcxMTAgU29DCj4gPiA+ID4gPiA+IC0gMS8yLzQvOCBHaUIgTFBERFI0
IERSQU0KPiA+ID4gPiA+ID4gLSBBWFAxNTA2MCBQTUlDCj4gPiA+ID4gPiA+IC0gNDAgcGluIEdQ
SU8gaGVhZGVyCj4gPiA+ID4gPiA+IC0gM3ggVVNCIDMuMCBob3N0IHBvcnQKPiA+ID4gPiA+ID4g
LSAxeCBVU0IgMi4wIGhvc3QgcG9ydAo+ID4gPiA+ID4gPiAtIDF4IE0uMiBFLUtleQo+ID4gPiA+
ID4gPiAtIDF4IGVNTUMgc2xvdAo+ID4gPiA+ID4gPiAtIDF4IE1pY3JvU0Qgc2xvdAo+ID4gPiA+
ID4gPiAtIDF4IFFTUEkgRmxhc2gKPiA+ID4gPiA+ID4gLSAxeCAxR2JwcyBFdGhlcm5ldCBwb3J0
Cj4gPiA+ID4gPiA+IC0gMXggSERNSSBwb3J0Cj4gPiA+ID4gPiA+IC0gMXggMi1sYW5lIERTSSBh
bmQgMXggNC1sYW5lIERTSQo+ID4gPiA+ID4gPiAtIDF4IDItbGFuZSBDU0kKPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gQWRkIHRoZSBkZXZpY2V0cmVlIGZpbGUgZGVzY3JpYmluZyB0aGUgY3VycmVu
dGx5IHN1cHBvcnRlZCBmZWF0dXJlcywKPiA+ID4gPiA+ID4gbmFtZWx5IFBNSUMsIFVBUlQsIEky
QywgR1BJTywgU0QgY2FyZCwgUVNQSSBGbGFzaCwgZU1NQyBhbmQgRXRoZXJuZXQuCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2Vy
bmVsLm9yZz4KLi4uCj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gKyZtbWMxIHsKPiA+ID4gPiA+
ID4gKwlkaXNhYmxlLXdwOwo+ID4gPiA+Cj4gPiA+ID4gRHVlIHRvIHdoaWNoIGRpZmZlcmVuY2Ug
aXMgJ2Rpc2FibGUtd3AnIG5lY2Vzc2FyeSBmb3IgdGhlIE1hcnMgYm9hcmQgYW5kIG5vdAo+ID4g
PiA+IG5lY2Vzc2FyeSBmb3IgdGhlIFZpc2lvbkZpdmUgMiBib2FyZD8KPiA+ID4KPiA+ID4gTWFy
cyBkb2Vzbid0IGhhdmUgd3AgcGluLCBidXQgZHVubm8gdmYyIGNhc2Ugc2luY2UgSSBkb24ndCBo
YXZlIGEgVkYyCj4gPiA+IGJvYXJkIDspCgpUaGUgc2NoZW1hdGljIGlzIGF2YWlsYWJsZSBoZXJl
OgpodHRwczovL2RvYy1lbi5ydnNwYWNlLm9yZy9WaXNpb25GaXZlMi9QREYvUlYwMDJfVjEuM0Jf
MjAyMzAyMDguUERGCgo+ID4KPiA+IElmIHRoZSBNaWxrLVYgTWFycyBkb2VzIG5vdCBoYXZlIGEg
V1AgR1BJTywgd2Ugc2hvdWxkIGJlIGFibGUgdG8gZHJvcCB0aGlzCj4gPiBwcm9wZXJ0eS4gVGhl
IFZpc2lvbkZpdmUgMiBkb2VzIG5vdCBuZWVkIGl0IGVpdGhlci4KPgo+IE5vcGUsIGRyb3BwaW5n
IHRoaXMgcHJvcGVydHkgd291bGQgcmVzdWx0IGluIFJPIHNkY2FyZCBvbiB2ZjIuCj4gPgo+ID4g
PiA+Cj4gPiA+ID4gPiA+ICsJY2QtZ3Bpb3MgPSA8JnN5c2dwaW8gNDEgR1BJT19BQ1RJVkVfTE9X
PjsKPiA+ID4gPgo+ID4gPiA+IE9uIG15IFZpc2lvbkZpdmUgMiAxLjJCLCBhbmQgMS4zQSBib2Fy
ZHMgR1BJTyA0MSByZWZsZWN0cyBpZiBhbiBTRC1jYXJkIGlzCj4gPiA+ID4gaW5zZXJ0ZWQgKGFz
IHNob3duIGluIFUtQm9vdCBieSBncGlvIHN0YXR1cyAtYSkuIFNvIHNob3VsZG4ndCB0aGlzIHZh
bHVlIGJlCj4gPiA+ID4gbW92ZWQgdG8gdGhlIGNvbW1vbiBpbmNsdWRlICJqaDcxMTAtdmlzaW9u
Zml2ZTItbWFycy1jb21tb24uZHRzaSIgYW5kCj4gPiA+ID4gYnJva2VuLWNkIHJlbW92ZWQgZnJv
bSB0aGUgVmlzaW9uRml2ZTIgYm9hcmQ/Cj4gPiA+Cj4gPiA+IEkgdGVzdGVkIHRoZSBDRCBwaW4g
YW5kIGNhbiBjb25maXJtIGl0IHdvcmtzIG9uIE1hcnMsIGJ1dCBJIGR1bm5vIHdoZXRoZXIKPiA+
ID4gdGhpcyB3b3JrcyBvbiBWRjIgc2luY2UgSSBoYXZlIG5vIFZGMiBib2FyZC4KPiA+ID4gQ291
bGQgeW91IHBsZWFzZSBjaGVjayB3aGV0aGVyIGl0IHdvcmtzIG9yIG5vdCBvbiBWRjI/Cj4gPgo+
ID4gQXMgbWVudGlvbmVkIGluIG15IHByaW9yIG1haWwgdGhlIGNhcmQgZGV0ZWN0IEdQSU8gaXMg
d29ya2luZyBvbiB0aGUKPiA+IFZpc2lvbkZpdmUgMi4gU3RhckZpdmUgYWNrbm93bGVkZ2VkIG15
IFUtQm9vdCBwYXRjaDoKPiA+Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy91LWJvb3QvU0hY
UFIwMU1CMDg2MzE0QzQ3QzI4MUIzRERERjdCQUU5RTYzQUFAU0hYUFIwMU1CMDg2My5DSE5QUjAx
LnByb2QucGFydG5lci5vdXRsb29rLmNuLwo+Cj4gVGhhbmtzIGZvciBjb25maXJtYXRpb24uCgpB
Y3R1YWxseSBjb21wYXJpbmcgdGhlIHNjaGVtYXRpYyBmb3IgdGhlIFZGMiBhYm92ZSBhbmQgdGhl
IE1hcnMgYm9hcmRbMV0gSQpkb24ndCBzZWUgYW55IGRpZmZlcmVuY2VzIGluIGhvdyB0aGUgU0Qt
Y2FyZCBpcyBjb25uZWN0ZWQsIHNvIGlmIEknbSByaWdodCB0aGUKbW1jMSBub2RlIGNvdWxkIGJl
IGZ1bGx5IGRlZmluZWQgaW4gdGhlIGpoNzExMC1jb21tb24uZHRzaS4KClsxXTogaHR0cHM6Ly9n
aXRodWIuY29tL21pbGt2LW1hcnMvbWFycy1maWxlcy9ibG9iL21haW4vTWFyc19oYXJkd2FyZV9z
Y2hlbWF0aWNzL01hcnNfVjEuMTFfMjAyMzA4MjEucGRmCgovRW1pbAoKPgo+ID4KPiA+IEJlc3Qg
cmVnYXJkcwo+ID4KPiA+IEhlaW5yaWNoCj4gPgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gaHR0cHM6
Ly9kb2MtZW4ucnZzcGFjZS5vcmcvVmlzaW9uRml2ZTIvUERGL1NDSF9SVjAwMl9WMS4yQV8yMDIy
MTIxNi5wZGYKPiA+ID4gPiBoYXMgYSBsaW5lCj4gPiA+ID4KPiA+ID4gPiAgICAgIEdQSU80MSB8
IFNEX1NESU8wX0NEX0dQSU80MSB8IE1pY3JvIFNE77yaSjEwCj4gPiA+ID4KPiA+ID4gPiBCZXN0
IHJlZ2FyZHMKPiA+ID4gPgo+ID4gPiA+IEhlaW5yaWNoCj4gPiA+ID4KPiA+ID4gPiA+ID4gK307
Cj4gPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiA+IDIuNDMuMAo+ID4gPiA+Cj4gPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
