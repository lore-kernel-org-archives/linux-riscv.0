Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72BEC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 17:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6cCp/O9K/J1X+9wd56g5EI81EPA3IeLgfEXbRUM4Lk=; b=3EwBKv4WzGaLQb
	Bppd0FdGmaR1Ygq3qAz6B7/kYURUX4/2PC4ygvGhzTjLGPgOT/jDNt5wGA+S0tvxU+gk5HVjMTa4a
	pR4QbouOt52Nz7BmtwF599M/QTsPAYqpWUbtNgPq9WV0uZ4pX3gwr/8r58qsIpxbKAA40r7qevKgX
	qhmiR/5JuA17NwSc/naqOThPPv/ApUXskajvWjv+Kj4xAXxk1Gn2SEpnnkZzL6Dzxn0Vk2CQQAWNX
	WWgoM1JqnflAoB5AyTd1Xg8vlfV8b1W0BKdvSsx7afD8yo9IG4kXdXTZoz+BDctrFhsVZDGygJYK+
	zn6JWUkW2E8wvHfaPlaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpnp-000y2E-0K;
	Thu, 14 Dec 2023 17:47:17 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpnl-000y1a-1l;
	Thu, 14 Dec 2023 17:47:14 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-203223f3299so93460fac.0;
        Thu, 14 Dec 2023 09:47:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576031; x=1703180831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCI4p6q1rK4WR6fVDr3BUQoNcZe5c1Ddy3SGZDHoC9U=;
        b=RM76XXnTALUq759pJQfqR1pXFV3Po8LfzbWlDJ9euQcXIN3IQqAF2X+k52pt/2Nf0D
         8J+DaCi6DB02b1Mmjfw2ZxPhCGGl4FdEZrm7BI4JS2Ve4PtUhJ/6J6Y+xSv8nSx+F4ST
         55qqx093bm5WM3CGZRH8xhx1RFc475wbrNNuFksZhZoTSv70gRnrn61err4R/UXhxrEk
         NAgkq/Dw6Px+IvMbvmqEw8IN1egEu/l7BGrGLmsTJJWN6skkFNh3phCvS8MoKzif52BR
         JWIShMY7pOUDriWi0it16FxCEWK8Unju4UkGSo3cioEoT7iqq+qqAFuO41pvQeCLHnHB
         96zw==
X-Gm-Message-State: AOJu0YxEF8c/YD82A+rVEu92Ukbc3a12HpBx20B/KER9SWY3Ifkslhx1
	RnBW9kNBhut4xaEgYUJTbb6YKiuNuVbffvljip4=
X-Google-Smtp-Source: AGHT+IGurc+SThWqv6P5Uf59nE4Wm9v4g9qg7EdGZTjEpgesMiWT90sz1j7aRR9N4IauQQSUFNdIYafJpqeTsCWmoDQ=
X-Received: by 2002:a05:6870:20b:b0:203:5389:5afd with SMTP id
 j11-20020a056870020b00b0020353895afdmr1641660oad.5.1702576031481; Thu, 14 Dec
 2023 09:47:11 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOfs-00DvjY-HQ@rmk-PC.armlinux.org.uk>
 <20231214173241.0000260f@Huawei.com>
In-Reply-To: <20231214173241.0000260f@Huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 14 Dec 2023 18:47:00 +0100
Message-ID: <CAJZ5v0jymOtZ0y65K9wE8FJk+ZKwP+FoGm4AKHXcYVfQJL9MVw@mail.gmail.com>
Subject: Re: [PATCH RFC v3 01/21] ACPI: Only enumerate enabled (or functional) devices
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-pm@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_094713_609333_1F7E953E 
X-CRM114-Status: GOOD (  22.41  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgNjozMuKAr1BNIEpvbmF0aGFuIENhbWVyb24KPEpvbmF0
aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDEzIERlYyAyMDIzIDEy
OjQ5OjE2ICswMDAwCj4gUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxpbnV4
Lm9yZy51az4gd3JvdGU6Cj4KPiA+IEZyb206IEphbWVzIE1vcnNlIDxqYW1lcy5tb3JzZUBhcm0u
Y29tPgo+ID4KPiA+IFRvZGF5IHRoZSBBQ1BJIGVudW1lcmF0aW9uIGNvZGUgJ3Zpc2l0cycgYWxs
IGRldmljZXMgdGhhdCBhcmUgcHJlc2VudC4KPiA+Cj4gPiBUaGlzIGlzIGEgcHJvYmxlbSBmb3Ig
YXJtNjQsIHdoZXJlIENQVXMgYXJlIGFsd2F5cyBwcmVzZW50LCBidXQgbm90Cj4gPiBhbHdheXMg
ZW5hYmxlZC4gV2hlbiBhIGRldmljZS1jaGVjayBvY2N1cnMgYmVjYXVzZSB0aGUgZmlybXdhcmUt
cG9saWN5Cj4gPiBoYXMgY2hhbmdlZCBhbmQgYSBDUFUgaXMgbm93IGVuYWJsZWQsIHRoZSBmb2xs
b3dpbmcgZXJyb3Igb2NjdXJzOgo+ID4gfCBhY3BpIEFDUEkwMDA3OjQ4OiBFbnVtZXJhdGlvbiBm
YWlsdXJlCj4gPgo+ID4gVGhpcyBpcyB1bHRpbWF0ZWx5IGJlY2F1c2UgYWNwaV9kZXZfcmVhZHlf
Zm9yX2VudW1lcmF0aW9uKCkgcmV0dXJucwo+ID4gdHJ1ZSBmb3IgYSBkZXZpY2UgdGhhdCBpcyBu
b3QgZW5hYmxlZC4gVGhlIEFDUEkgUHJvY2Vzc29yIGRyaXZlcgo+ID4gd2lsbCBub3QgcmVnaXN0
ZXIgc3VjaCBDUFVzIGFzIHRoZXkgYXJlIG5vdCAnZGVjb2RpbmcgdGhlaXIgcmVzb3VyY2VzJy4K
PiA+Cj4gPiBDaGFuZ2UgYWNwaV9kZXZfcmVhZHlfZm9yX2VudW1lcmF0aW9uKCkgdG8gYWxzbyBj
aGVjayB0aGUgZW5hYmxlZCBiaXQuCj4gPiBBQ1BJIGFsbG93cyBhIGRldmljZSB0byBiZSBmdW5j
dGlvbmFsIGluc3RlYWQgb2YgbWFpbnRhaW5pbmcgdGhlCj4gPiBwcmVzZW50IGFuZCBlbmFibGVk
IGJpdC4gTWFrZSB0aGlzIGJlaGF2aW91ciBhbiBleHBsaWNpdCBjaGVjayB3aXRoCj4gPiBhIHJl
ZmVyZW5jZSB0byB0aGUgc3BlYywgYW5kIHRoZW4gY2hlY2sgdGhlIHByZXNlbnQgYW5kIGVuYWJs
ZWQgYml0cy4KPiA+IFRoaXMgaXMgbmVlZGVkIHRvIGF2b2lkIGVudW1lcmF0aW5nIHByZXNlbnQg
JiYgZnVuY3Rpb25hbCBkZXZpY2VzIHRoYXQKPiA+IGFyZSBub3QgZW5hYmxlZC4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+IFRlc3Rl
ZC1ieTogTWlndWVsIEx1aXMgPG1pZ3VlbC5sdWlzQG9yYWNsZS5jb20+Cj4gPiBUZXN0ZWQtYnk6
IFZpc2hudSBQYWpqdXJpIDx2aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT4KPiA+IFRlc3Rl
ZC1ieTogSmlhbnlvbmcgV3UgPGppYW55b25nLnd1QGFybS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+ID4g
LS0tCj4gPiBJZiB0aGlzIGNoYW5nZSBjYXVzZXMgcHJvYmxlbXMgb24gZGVwbG95ZWQgaGFyZHdh
cmUsIEkgc3VnZ2VzdCBhbgo+ID4gYXJjaCBvcHQtaW46IEFDUElfSUdOT1JFX1NUQV9FTkFCTEVE
LCB0aGF0IGNhdXNlcwo+ID4gYWNwaV9kZXZfcmVhZHlfZm9yX2VudW1lcmF0aW9uKCkgdG8gb25s
eSBjaGVjayB0aGUgcHJlc2VudCBiaXQuCj4KPiBNeSBndXQgZmVlbGluZyAoaGF2aW5nIG1hZGUg
QUNQSSAnZml4ZXMnIGluIHRoZSBwYXN0IHRoYXQgcmFuIGludG8KPiBob3JyaWJseSBicm9rZW4g
ZmlybXdhcmUgYW5kIGhhZCB0byBiZSByZXZlcnRlZCkgaXMgcmVkdWNlIHRoZSBibGFzdAo+IHJh
ZGl1cyBwcmVlbXB0aXZlbHkgZnJvbSB0aGUgc3RhcnQuIEknZCBsb3ZlIHRvIGxpdmUgaW4gYSB3
b3JsZCB3ZXJlCj4gdGhhdCB3YXNuJ3QgbmVjZXNzYXJ5IGJ1dCBJIGRvbid0IHRydXN0IGFsbCB0
aGUgZ2VuZXJhdG9ycyBvZiBBQ1BJIHRhYmxlcy4KPiBJJ2xsIGxlYXZlIGl0IHRvIFJhZmFlbCBh
bmQgb3RoZXIgQUNQSSBleHBlcnRzIHN1Z2dlc3QgaG93IG5hcnJvdyB3ZSBzaG91bGQKPiBtYWtl
IGl0IHRob3VnaCAtIGFyY2ggb3B0IGluIG1pZ2h0IGJlIG5hcnJvdyBlbm91Z2guCgpBIGNoaWNr
ZW4gYml0IHdvdWxkbid0IGhlbHAgbXVjaCBJTU8sIGVzcGVjaWFsbHkgaW4gdGhlIGNhc2VzIHdo
ZW4Kd29ya2luZyBzZXR1cHMgZ2V0IGJyb2tlbi4KCkkgd291bGQgdmVyeSBtdWNoIHByZWZlciB0
byBsaW1pdCB0aGUgc2NvcGUgb2YgaXQsIHNheSB0byBwcm9jZXNzb3JzCm9ubHksIGluIHRoZSBm
aXJzdCBwbGFjZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
