Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AACEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 16:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYuDDo/W3hrOa99mT+VNx8xMIpdUL0C815DLehYzZv4=; b=Ffmc5fKZPDOj0X
	Hz0E6pTfa6kwrWDE4HKhcOXLidv3gRIDcedm9BINCRWm6xcEMgmaX9oVlQwhBHCOuU1/FJ/C66RAn
	KaluZrxs+ZgoioJwCnYtbPWr7wQjTYMjIUs52ppGZi96q3xgVxDKWWCTjEvJDOAeaMxoGAZfEpR8O
	0IhEhnnU15CJfpIjrKMlUFZhxt75DPwMEZjjyu8GluL/Jt6/XkHrJBGDtroVGA6HMWwfHRUvdtxub
	RnqcHCkAQg7byF6q/6b/OvhWRtIdPbEnrBAprGUdbtXvQhDusVbDYA40e4P39grhDuIMq2Ur0kQ6y
	AuMLLuIuFV5cqh0JmLGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEY4v-00G8uN-1N;
	Wed, 28 Jun 2023 16:31:37 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEY4s-00G8sb-0b
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 16:31:35 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b69f216c73so57028901fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 09:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687969887; x=1690561887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MxUKkkbx+vRaC8aApGfWw+lRG/yJ6GciI8eYWTcSc+k=;
        b=UWTbqKJ2fZNsGlGeU+8ZqLPNDF2dy+79VrxjSQXDm8YcY/1L1wE7WMUH+axRruogbx
         A08uUzgNdoD9PvKZlIafvnJ3JtujnGWoKyJkpMWvVa0ipnPKdJijF266uEO18WoglKYp
         l+ehO5vfpQkxBZggXZNKcZKv+EQKodX2f+Z1dgQJ8iiCO/64mushT8tSZHQySYGC4tIH
         /wSVEHiefbZ1CXQQEbX7i4urF2ooCKxKflvI9W9GmTZkcms+hP3Jh0w3eaeLTg7HZOjM
         i7yZiz8IDiby+B+LAGmNaisWhRX1gXnaXUlH5o8JGY/TE+Z5wjFBsBuWon1C7rxHA0bI
         ZErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687969887; x=1690561887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxUKkkbx+vRaC8aApGfWw+lRG/yJ6GciI8eYWTcSc+k=;
        b=T9Yrwotgx/N/v8mRQah+0VEVAoX8NQKkOES9lQRDx9f6mC0sUjHGVmTfqaadMhE2ce
         8mmYcm2sDhyG38ucH9JlvEdbBip5LUpwH+2/T5DGxax6HMsHva/e0b8qndcKzr75zW3t
         ZfPb04ziOaPprZfv+Bz9zYqRCwZRULbA+CSTcN2srmVBfRf6625JMfW3LDNm9r2Cb6Qa
         Ln5vcPV6oKq8p6i281H4Rm/sg1xT2M6xvVyojnU8uwJeGXMG3/ADUBDDkCLDSEF5NzMP
         y7XdGgN/BZOmfQ4rRVpUdTDLKpRMd+CDiupYpZbbkuPd/XSuTBW9T44gWbS3NiRB3nlP
         OmsA==
X-Gm-Message-State: AC+VfDxHEVwx8Wbt/hR5rQmLPt4BFilYE260vBWGR82NbrPoRkqgNAUN
	c1vRa9X8zVm6tP19NxwGHFnvpPH7hZU1EMylJvXjYJ9aXdFvBS6IVRU=
X-Google-Smtp-Source: ACHHUZ4m+7RR8cSMdL8PzsOGNomHg8wcCI+B4awSJPYhsIdDffEKLLZoyQ0wBygn7bgMqn4iZow/NVhPAO6GvWVDdGA=
X-Received: by 2002:a2e:9e07:0:b0:2b4:5fdd:f588 with SMTP id
 e7-20020a2e9e07000000b002b45fddf588mr21115198ljk.43.1687969887180; Wed, 28
 Jun 2023 09:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230616063210.19063-1-eric.lin@sifive.com> <20230616063210.19063-4-eric.lin@sifive.com>
 <2437bda9-bbdb-ad80-7201-1e16e1388890@linaro.org> <CAPqJEFoTsmVZ4kvsSB0RkQZaQGyXC96KV6RvdpeC5XxURCOZ0w@mail.gmail.com>
 <8c9ed2d4-83ab-ecc0-a300-e6bc8e2047b6@linaro.org>
In-Reply-To: <8c9ed2d4-83ab-ecc0-a300-e6bc8e2047b6@linaro.org>
From: Eric Lin <eric.lin@sifive.com>
Date: Thu, 29 Jun 2023 00:31:15 +0800
Message-ID: <CAPqJEFqhmxksvEgvC61cJcRGR0DrSWDZxJC3J7tdgcG8UY+sFw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: conor@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dslin1010@gmail.com, 
	Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_093134_257318_E7A866C3 
X-CRM114-Status: GOOD (  29.39  )
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

SGkgS3J6eXN6dG9mLAoKT24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMjoxOeKAr1BNIEtyenlzenRv
ZiBLb3psb3dza2kKPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBP
biAyNi8wNi8yMDIzIDA1OjI2LCBFcmljIExpbiB3cm90ZToKPiA+IEhpIEtyenlzenRvZiwKPiA+
Cj4gPiBPbiBGcmksIEp1biAxNiwgMjAyMyBhdCA2OjQ14oCvUE0gS3J6eXN6dG9mIEtvemxvd3Nr
aQo+ID4gPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBP
biAxNi8wNi8yMDIzIDA4OjMyLCBFcmljIExpbiB3cm90ZToKPiA+Pj4gVGhpcyBhZGQgWUFNTCBE
VCBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIFNpRml2ZSBQcml2YXRlIEwyCj4gPj4+IGNhY2hl
IGNvbnRyb2xsZXIKPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogRXJpYyBMaW4gPGVyaWMubGlu
QHNpZml2ZS5jb20+Cj4gPj4+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5j
b20+Cj4gPj4+IFJldmlld2VkLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gPj4+
IC0tLQo+ID4+PiAgLi4uL2JpbmRpbmdzL3Jpc2N2L3NpZml2ZSxwTDJDYWNoZTAueWFtbCAgICAg
IHwgODEgKysrKysrKysrKysrKysrKysrKwo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDgxIGluc2Vy
dGlvbnMoKykKPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3Yvc2lmaXZlLHBMMkNhY2hlMC55YW1sCj4gPj4+Cj4gPj4+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc2lmaXZlLHBM
MkNhY2hlMC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3Np
Zml2ZSxwTDJDYWNoZTAueWFtbAo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLmI1ZDhkNGEzOWRkZQo+ID4+PiAtLS0gL2Rldi9udWxsCj4gPj4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zaWZpdmUscEwyQ2Fj
aGUwLnlhbWwKPiA+Pj4gQEAgLTAsMCArMSw4MSBAQAo+ID4+PiArIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+ID4+PiArIyBDb3B5cmlnaHQgKEMp
IDIwMjMgU2lGaXZlLCBJbmMuCj4gPj4+ICslWUFNTCAxLjIKPiA+Pj4gKy0tLQo+ID4+PiArJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9yaXNjdi9zaWZpdmUscEwyQ2FjaGUwLnlh
bWwjCj4gPj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMKPiA+Pj4gKwo+ID4+PiArdGl0bGU6IFNpRml2ZSBQcml2YXRlIEwyIENhY2hlIENv
bnRyb2xsZXIKPiA+Pj4gKwo+ID4+PiArbWFpbnRhaW5lcnM6Cj4gPj4+ICsgIC0gR3JlZW50aW1l
IEh1ICA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4gPj4+ICsgIC0gRXJpYyBMaW4gICAgICA8
ZXJpYy5saW5Ac2lmaXZlLmNvbT4KPiA+Pj4gKwo+ID4+PiArZGVzY3JpcHRpb246Cj4gPj4+ICsg
IFRoZSBTaUZpdmUgUHJpdmF0ZSBMMiBDYWNoZSBDb250cm9sbGVyIGlzIHBlciBoYXJ0IGFuZCBj
b21tdW5pY2F0ZXMgd2l0aCBib3RoIHRoZSB1cHN0cmVhbQo+ID4+PiArICBMMSBjYWNoZXMgYW5k
IGRvd25zdHJlYW0gTDMgY2FjaGUgb3IgbWVtb3J5LCBlbmFibGluZyBhIGhpZ2gtcGVyZm9ybWFu
Y2UgY2FjaGUgc3Vic3lzdGVtLgo+ID4+PiArICBBbGwgdGhlIHByb3BlcnRpZXMgaW4gZVBBUFIv
RGV2aWNlVHJlZSBzcGVjaWZpY2F0aW9uIGFwcGxpZXMgZm9yIHRoaXMgcGxhdGZvcm0uCj4gPj4K
PiA+PiBEcm9wIHRoZSBsYXN0IHNlbnRlbmNlLiBXaHkgc3BlY2lmaWNhdGlvbiB3b3VsZCBub3Qg
YXBwbHk/Cj4gPj4KPiA+IE9LLCBJJ2xsIGRyb3AgaXQgaW4gdjIuCj4gPgo+ID4+PiArCj4gPj4+
ICthbGxPZjoKPiA+Pj4gKyAgLSAkcmVmOiAvc2NoZW1hcy9jYWNoZS1jb250cm9sbGVyLnlhbWwj
Cj4gPj4+ICsKPiA+Pj4gK3NlbGVjdDoKPiA+Pj4gKyAgcHJvcGVydGllczoKPiA+Pj4gKyAgICBj
b21wYXRpYmxlOgo+ID4+PiArICAgICAgY29udGFpbnM6Cj4gPj4+ICsgICAgICAgIGVudW06Cj4g
Pj4+ICsgICAgICAgICAgLSBzaWZpdmUscEwyQ2FjaGUwCj4gPj4+ICsgICAgICAgICAgLSBzaWZp
dmUscEwyQ2FjaGUKPiA+Pj4gKwo+ID4+PiArICByZXF1aXJlZDoKPiA+Pj4gKyAgICAtIGNvbXBh
dGlibGUKPiA+Pj4gKwo+ID4+PiArcHJvcGVydGllczoKPiA+Pj4gKyAgY29tcGF0aWJsZToKPiA+
Pj4gKyAgICBpdGVtczoKPiA+Pgo+ID4+Cj4gPj4gWW91IGhhdmUgb25seSBvbmUgaXRlbSwgc28g
bm8gbmVlZCBmb3IgaXRlbXMuLi4gdW5sZXNzIHlvdSBqdXN0IG1pc3NlZAo+ID4+IHByb3BlciBm
YWxsYmFjay4KPiA+Cj4gPiBPSywgSSdsbCBmaXggaXQgaW4gdjIuCj4gPgo+ID4+Cj4gPj4+ICsg
ICAgICAtIGVudW06Cj4gPj4+ICsgICAgICAgICAgLSBzaWZpdmUscEwyQ2FjaGUwCj4gPj4+ICsg
ICAgICAgICAgLSBzaWZpdmUscEwyQ2FjaGUxCj4gPj4KPiA+PiBXaGF0IGlzICIwIiBhbmQgIjEi
IGhlcmU/IFdoYXQgZG8gdGhlc2UgY29tcGF0aWJsZXMgcmVwcmVzZW50PyBXaHkgdGhleQo+ID4+
IGRvIG5vdCBoYXZlIGFueSBTb0MgcmVsYXRlZCBwYXJ0Pwo+ID4KPiA+IFRoZSBwTDJDYWNoZTEg
aGFzIG1pbm9yIGNoYW5nZXMgaW4gaGFyZHdhcmUsIGJ1dCBpdCBjYW4gdXNlIHRoZSBzYW1lCj4g
PiBwbDIgY2FjaGUgZHJpdmVyLgo+Cj4gVGhlbiB3aHkgYXJlbid0IHRoZXkgY29tcGF0aWJsZT8K
PgoKVGhlIHBMMkNhY2hlMSBoYXMgcmVtb3ZlZCBzb21lIHVudXNlZCBiaXRzIGluIHRoZSByZWdp
c3RlciBjb21wYXJlZCB0bwpwbDJDYWNoZTAuCkZyb20gdGhlIGhhcmR3YXJlIHBlcnNwZWN0aXZl
LCB0aGV5IGFyZSBub3QgY29tcGF0aWJsZSBidXQgdGhleSBjYW4Kc2hhcmUgdGhlIHNhbWUgcGwy
IGNhY2hlIGRyaXZlciBpbiBzb2Z0d2FyZS4KVGh1cywgd2Ugd291bGQgbGlrZSB0byBrZWVwIGJv
dGguIEl0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSBjYW4gcHJvdmlkZQpzb21lIHN1Z2dlc3Rpb25z
LiBUaGFua3MuCgpCZXN0IFJlZ2FyZHMsCkVyaWMgTGluLgoKPiA+IE1heSBJIGFzaywgd2hhdCBk
byB5b3UgbWVhbiBhYm91dCB0aGUgU29DLXJlbGF0ZWQgcGFydD8gVGhhbmtzLgo+Cj4gVGhpcyBp
cyBwYXJ0IG9mIGEgU29DLCByaWdodD8gV2UgZXhwZWN0IFNvQyBibG9ja3MgdG8gaGF2ZSBjb21w
YXRpYmxlCj4gYmFzZWQgb24gdGhlIFNvQy4KPgo+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6
dG9mCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
