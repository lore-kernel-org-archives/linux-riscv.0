Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF996C8303F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pEvXZkVzO5ZnjPDLNZh9wEX5qcv5dzGfRikzvADPpM=; b=VK0JG2kMVCgD61
	yvg6a6Y40cAxgNHtW3MjPCgKXqb+dFKwpOrB+yq3FFZ8X88Qep9moAXBQS9sVpreTvCiZB/FPCVOp
	gOl2q74E6+Z8f7Sgnv2B+5R3mkH8yOQwVImURmwoO1HeSK5lZpndDmhcp1cNVOIuafVSHK3dqoKRf
	eFxdp3RFj2fnMZ0TloH5bOMPCv2pcsps2EM98VxEKd34UXkdpqLaDwwaPDHcae90hXGTJfr/CwoxW
	7xkhFjKP4s748KO/oEcuOFZgIfMOMeb6PQ6a7E8VCSS9BkFk/YvMCNPIxt40/li2iSzW7l8pDyTRC
	TmCXUrNvkUCtEJb4OXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwAG-00000008EI6-3jMa;
	Wed, 02 Jul 2025 12:02:12 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv8Q-000000081oN-0ZTJ
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 10:56:15 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-86efcef9194so240593739f.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 03:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751453773; x=1752058573; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eVakVqHDVi/nEEBTUBbK2KldnbMSaWZ1ZSLAJh1Ij5o=;
        b=079REfgGMDYquhzAAYlETT7mtp46Lwui+xVY21c7P5jQreRwjUZvjKrhNgJuh/L20b
         v24ABFqEErnoHDhzYADyFoKo4wSs3f0iqRJ3EBjtVxJrtcuTNeoSzHZOAdUXaPrM97/d
         B4O64q3oAPk2Elyd/mcLwjlPFaMt8lBImZanWP6zqMV6nT5ALscmlmaHns5oCAx0eYxX
         PSLFqc8NsKEdOD6OyCXUJWvOQeXXdVqWe/jGIRVRA4EpezNUCS2DzibaTYkFA+saEc5v
         JgAHrCz9yu9hRIdsWAxcczO+5aVYdbo6eAObMj4bggqB52jzmlwlktT6NqW7EYokua/o
         YcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453773; x=1752058573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eVakVqHDVi/nEEBTUBbK2KldnbMSaWZ1ZSLAJh1Ij5o=;
        b=T2nn4oNZ0PORyjvhWfW0kJTf479g0Ccl+EljwnjNQMjqps4gUrEFVmOl66xfoX1wGE
         GXUARgblXkb9f8hsI0kIkVh7RrObxNFCL+JCfK8hvBAB7n3GdxWXkaAyvYbsxU5wKmRK
         u8SjACjDJSr+gje4zRIlqPcq/nGxYZqwdd3nBZPujpwKMLu6aD/lkFXWFYbwA2HOrFxY
         CnXnxev+5YOftFtjq8WQwShrf2BZ+4ngKys89Euw3VSzFWVBBKXcXZHmdVVlv+yrJeNJ
         739Y7kx8wORDMzyCYkorMWBV+sKlC9ni9onLW1VPuqXR3KBCfArN3aDWsg9lhafwseYC
         23vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuXj4OUhaP+teId725/c9QjlzyeKcSQeCinLHEFXD3rlqDmNT0FF6f0lH9IJ3ockrZHIGuRacOzz+g4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1qWQyd2R3dec6QVcfGUr63QhvVZjYhVemAaPzZk5cRDt7sMtc
	12CIEUR6zxYOB7/PDDWG2sK0oulm4iT4xnBUaoGu1XOmCfjkh4Zy/O3FK7JWTJFsz1M=
X-Gm-Gg: ASbGnctBw/s0CmWYakN/6iFELcZ9qAFAvQgnmwVsYEtjWDEB0BFZPUenw8Ynqn6V86b
	Fgq6aU/6Ch+ytv0xMUCMSC3jxyxuxH5tXXKOYUKoOq8mHsQ1xgZE9XpSTlX5hUuZVQbx7ZFNMRy
	4/UgKcQUedX6tlO4M2TPGIIb8dyYd/qsW2njc6Y5oYWNenx/G7ObvPfrMv7vOB+aIR3V1lx9/Vi
	YjC+Epurl+9ghxXljY/uG6jNyt/MLuTffiLQyUUB4MvRzyBzzseBPEr/mGeA2ZZur4ldlgaKo+l
	qptG+en5SlZCqkbFqauFLmm1G6oxaY+XZ36IGwFUkHAhmUs16YzSYJrbQLTPCO6RoxsvBFr6OVr
	jSADGDyMP8JV2hVD2MMkib1uhig==
X-Google-Smtp-Source: AGHT+IH8nNKJXNfh+T2vOZJlqIemJT4UY7Zp92Fh4jhfNOQw5R6U/NR89uGXnsLbbnrSsXhZHL8VPA==
X-Received: by 2002:a5e:c641:0:b0:86c:f0d9:553 with SMTP id ca18e2360f4ac-876c6a0c90cmr288271039f.5.1751453772830;
        Wed, 02 Jul 2025 03:56:12 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204aa8a44sm2926145173.108.2025.07.02.03.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:56:12 -0700 (PDT)
Message-ID: <1a88fde8-7fc6-4f55-b25b-cd67b72b73d5@riscstar.com>
Date: Wed, 2 Jul 2025 05:56:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/6] reset: spacemit: add K1 reset support
To: Philipp Zabel <p.zabel@pengutronix.de>, Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250613011139.1201702-1-elder@riscstar.com>
 <20250618111737-GYA157089@gentoo> <20250702061717-GYA304216@gentoo>
 <0580d4e254705be3765be168ce17c8a1c2e12f8f.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <0580d4e254705be3765be168ce17c8a1c2e12f8f.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_035614_287052_41A67515 
X-CRM114-Status: GOOD (  17.86  )
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

T24gNy8yLzI1IDU6MTQgQU0sIFBoaWxpcHAgWmFiZWwgd3JvdGU6Cj4gT24gTWksIDIwMjUtMDct
MDIgYXQgMDY6MTcgKzAwMDAsIFlpeHVuIExhbiB3cm90ZToKPj4gSGkgUGhpbGlwcCwKPj4KPj4g
T24gMTE6MTcgV2VkIDE4IEp1biAgICAgLCBZaXh1biBMYW4gd3JvdGU6Cj4+PiBIaSBBTEwsCj4+
PiAgICBBcyB0aGUgcmVzZXQgZHJpdmVyIGdvaW5nIHRocm91Z2ggc2V2ZXJhbCByZXZpZXcgY3lj
bGVzLAo+Pj4gaXQgYmVjb21lcyBxdWl0ZSBjYWxtIGRvd24gbm93LCBJJ2QgbGlrZSB0byByZXF1
ZXN0IHRvIG1lcmdlCj4+PiBpdCBpbnRvIHY2LjE3LCBiZWNhdXNlIHZhcmlvdXMgZHJpdmVycyAo
cHdtLCBlbWFjLi4pIHdpbGwgZGVwZW5kCj4+PiBvbiBpdCwgZXZlbiBpbiB0aGUgd29yc3QgY2Fz
ZSBpZiB0aGVyZSBpcyBwcm9ibGVtLCBJIGJlbGlldmUgQWxleAo+Pj4gd2lsbCBoZWxwIHRvIGFk
ZHJlc3MuLgo+Pj4KPj4+IEhpIFBoaWxpcHAsCj4+PiAgICBJJ2QgbGlrZSB0byBxdWVyeSBpZiB5
b3Ugd2lsbGluZyB0byB0YWtlIHRoZSByZXNldCBkcml2ZXIgLQo+Pj4gcGF0Y2ggWzUvNl0gdGhy
b3VnaCB0aGUgcmVzZXQgdHJlZT8gSXQgc291bmRzIG1vcmUgaW50dWl0aXZlLAo+Pj4gd2hpY2gg
YWxzbyB3aWxsIGF2b2lkIHBvdGVudGlhbCBjb25mbGljdHMgd2l0aCBLY29uZmlnL01ha2VmaWxl
Li4KPj4+ICAgIEkndmUgY3JlYXRlZCBhIHByZXJlcXVpc2l0ZSBpbW11dGFibGUgdGFnIHdoaWNo
IGNvdWxkIGJlCj4+PiBzaGFyZWQgYmV0d2VlbiBjbG9jayBhbmQgcmVzZXQgc3Vic3l0ZW0uIEl0
J3MgdGFnIC0KPj4+IHNwYWNlbWl0LXJlc2V0LWRlcHMtZm9yLTYuMTcgYXQgU3BhY2VtaVQncyBT
b0MgdHJlZSBbMV0sIHdoaWNoCj4+PiBlZmZlY3RpdmVseSBhcmUgcGF0Y2hlcyBbMS00XSBvZiB0
aGlzIHNlcmllcy4KPj4+IEJ1dCwgdG8gbWFrZSB5b3VyIGxpZmUgZWFzeSwgSSd2ZSBhbHNvIGFw
cGxpZWQgcGF0Y2ggWzUvNl0gYXQgdGFnCj4+PiBzcGFjZW1pdC1yZXNldC1kcnYtZm9yLTYuMTcg
WzJdIHdoaWNoIGhhcyBhIHNtYWxsIG1hY3JvIGFkanVzdG1lbnQKPj4+IHJlcXVlc3RlZCBieSBB
bGV4IGF0IFszXQo+Pj4gICAgTGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsgb2YgdGhpcywgdGhh
bmtzCj4+Pgo+PiBKdXN0IHdhbnQgdG8gcGluZyB0aGlzLCB3aGF0IGRvIHlvdSB3YW50IGZyb20g
bXkgc2lkZSB0byBwcm9jZWVkPwo+Pgo+PiBvciBkbyB5b3Ugd2FudCBtZSB0byBzZW5kIGEgbW9y
ZSBmb3JtYWwgUHVsbC1SZXF1ZXN0IGZvciBbMV0sCj4+IHRoZW4geW91IGNhbiBhcHBseSBwYXRj
aCBbNS82XSAoc3RpbGwgbmVlZCB0byBmaXggdGhlIG1hY3JvIG9mIFszXSkKPiAKPiBQbGVhc2Ug
c2VuZCBhIHYxMiwgc28gdGhhdCB0aGUgbGF0ZXN0IG1vZGlmaWNhdGlvbnMgYXJlIG9uIHRoZSBs
aXN0Lgo+IAo+IEknZCBwcmVmZXLCoHRvIGVpdGhlciBwaWNrIHBhdGNoZXMgMSBhbmQgNSBmcm9t
IHRoZSBsaXN0LCBvciwgaWYgeW91Cj4gcHJvdmlkZSBhIHRhZyB3aXRoIG9ubHkgcGF0Y2ggMSB0
byBiZSBwdWxsZWQgaW50byBib3RoIGNsayBhbmQgcmVzZXQKPiB0cmVlcywgdG8gbWVyZ2UgdGhh
dCBhbmQgdGhlbiBwaWNrIHBhdGNoIDUuCgpJIHdpbGwgc2VuZCB2MTIgdGhpcyBtb3JuaW5nLgkt
QWxleAoKCj4gcmVnYXJkcwo+IFBoaWxpcHAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
